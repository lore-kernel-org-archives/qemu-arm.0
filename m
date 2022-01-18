Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l15sm2786391wmh.6.2022.01.18.09.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 09:31:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C6C0A1FFB7;
	Tue, 18 Jan 2022 17:31:26 +0000 (GMT)
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-12-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH v2 11/13] hw/intc/arm_gicv3_its: Factor out "find
 address of table entry" code
Date: Tue, 18 Jan 2022 17:31:20 +0000
In-reply-to: <20220111171048.3545974-12-peter.maydell@linaro.org>
Message-ID: <8735ll9ci9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WKmfeTDNtI/P


Peter Maydell <peter.maydell@linaro.org> writes:

> The ITS has several tables which all share a similar format,
> described by the TableDesc struct: the guest may configure them
> to be a single-level table or a two-level table. Currently we
> open-code the process of finding the table entry in all the
> functions which read or write the device table or the collection
> table. Factor out the "get the address of the table entry"
> logic into a new function, so that the code which needs to
> read or write a table entry only needs to call table_entry_addr()
> and then perform a suitable load or store to that address.
>
> Note that the error handling is slightly complicated because
> we want to handle two cases differently:
>  * failure to read the L1 table entry should end up causing
>    a command stall, like other kinds of DMA error
>  * an L1 table entry that says there is no L2 table for this
>    index (ie whose valid bit is 0) must result in us treating
>    the table entry as not-valid on read, and discarding
>    writes (this is mandated by the spec)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
