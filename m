Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f19sm7488751wmq.34.2021.12.13.03.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 03:37:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7A4651FF96;
	Mon, 13 Dec 2021 11:37:48 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-8-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 07/26] hw/intc/arm_gicv3_its: Correct setting of
 TableDesc entry_sz
Date: Mon, 13 Dec 2021 11:37:42 +0000
In-reply-to: <20211211191135.1764649-8-peter.maydell@linaro.org>
Message-ID: <87k0g8n3ar.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JI0Fwu7u47sr


Peter Maydell <peter.maydell@linaro.org> writes:

> We set the TableDesc entry_sz field from the appropriate
> GITS_BASER.ENTRYSIZE field.  That ID register field specifies the
> number of bytes per table entry minus one.  However when we use
> td->entry_sz we assume it to be the number of bytes per table entry
> (for instance we calculate the number of entries in a page by
> dividing the page size by the entry size).
>
> The effects of this bug are:
>  * we miscalculate the maximum number of entries in the table,
>    so our checks on guest index values are wrong (too lax)
>  * when looking up an entry in the second level of an indirect
>    table, we calculate an incorrect index into the L2 table.
>    Because we make the same incorrect calculation on both
>    reads and writes of the L2 table, the guest won't notice
>    unless it's unlucky enough to use an index value that
>    causes us to index off the end of the L2 table page and
>    cause guest memory corruption in whatever follows
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
