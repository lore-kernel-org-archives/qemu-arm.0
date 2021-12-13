Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t17sm7309459wmq.15.2021.12.13.03.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 03:32:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E085C1FF96;
	Mon, 13 Dec 2021 11:32:28 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-5-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 04/26] hw/intc/arm_gicv3_its: Remove maxids union from
 TableDesc
Date: Mon, 13 Dec 2021 11:32:15 +0000
In-reply-to: <20211211191135.1764649-5-peter.maydell@linaro.org>
Message-ID: <87wnk8n3jn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lgAokV5Atj41


Peter Maydell <peter.maydell@linaro.org> writes:

> The TableDesc struct defines properties of the in-guest-memory tables
> which the guest tells us about by writing to the GITS_BASER<n>
> registers.  This struct currently has a union 'maxids', but all the
> fields of the union have the same type (uint32_t) and do the same
> thing (record one-greater-than the maximum ID value that can be used
> as an index into the table).
>
> We're about to add another table type (the GICv4 vPE table); rather
> than adding another specifically-named union field for that table
> type with the same type as the other union fields, remove the union
> entirely and just have a 'uint32_t max_ids' struct field.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
