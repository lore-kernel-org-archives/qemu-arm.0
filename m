Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp465142njc;
        Fri, 11 Apr 2025 07:03:20 -0700 (PDT)
X-Received: by 2002:a17:902:c952:b0:224:912:153 with SMTP id d9443c01a7336-22bea49590cmr47409185ad.5.1744380200714;
        Fri, 11 Apr 2025 07:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744380200; cv=none;
        d=google.com; s=arc-20240605;
        b=KrbboYcRx8VjxP3Ld8rqY3PhmeTPV852hEmqluGzFybgWfd4VKC2+4vwT+1e2kZiIK
         4uC9CVq9RuUdUU1+85S2D9b4I/WzJQkhr7nR20/8tE4MjuBeMQIPBuvcxtZ1x75lQ2P4
         HgoO6MtYDCAyxdZlxC110FUJR81J+wj0uaqTIStXUCXvSAe8LIlQ/BUC4wYPVx8jX2V5
         fq8nPxLOvvCAoH/t2ailsKhxlAb4tiEJIGN2/DKo6/IIddwo5Ci63+ZOVpIvxnRatiAB
         FJ4HPsj7bvfi3d9AS7PbXoFueG15ueu3Zz5XPZqlzTV3Z0XGw0K8tSEh2ASbnKf1dnJa
         MNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xFy6ACGlewwahJcQDdgO8c8GfCX47OEfeGyDlhNqeLA=;
        fh=A7bYRiw7FIDg80pSV9c6IMKxng26OkhmavlUxytB6mY=;
        b=C9zMXZ9RTq6YIswUpMBdwSh8nNDDLaO1sLVm7fwazucYoJNW8l6IZBeKv8ag3NEIom
         3Lg2WE7tnUyh458+JFfMQebP0YM7evCx8vJBbtQFRsr7HFSdJhxK8ELdHjMQVHW0+oTV
         9VQwXdO7ge7YDWKcyocTmk/6DvtupI+KacG7SIF84aFigH8p9YFpKpXiPk/OyUjgRNKq
         iWaT0TAHAEuEhCji3/5fOtE+PB/fcFCr18iMByDSCgJ+FqLmsXao7MErWEH4b3BFVhb3
         K7qc0pktuh1WvoLaBxxwiqVqCSUKHknSDNKWkymq7EAmkOOP9gbfhABfgtWAWJouyMOT
         jQjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ju+1LcV4;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac7b94014sor37529655ad.9.2025.04.11.07.03.20
        (Google Transport Security);
        Fri, 11 Apr 2025 07:03:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ju+1LcV4;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744380200; x=1744985000; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xFy6ACGlewwahJcQDdgO8c8GfCX47OEfeGyDlhNqeLA=;
        b=ju+1LcV4dkrAwC0SNHWGwFSVcvcsgz6nOngjMQAQk7qWWw2B5s9QlxILdd8RFrzGmp
         /h/QzKnNRPFWh/T8AlTnGY/QUnD+57l/WZjVwlQM4Cwl2EIt3b4phDZUyLughesju6qN
         bS4+iWwOOpOPO3gc5xr//qdla43kSEqs7z/6W/m47JBmOOzrG7NjDTvNFt+d5OLp3j2M
         HKeurBqNDKuCpSTUfTZ1iRpsSp6vbTZKXjAV2TAKjLnieuz8akMJhIWJ1Ywn7anLUfPW
         EwgiO3XayU++oSVtY2KeZtBHICt8+xKXp+yXso8QDcSCFcsewk9U//3T8vsAlogIk/Xc
         cGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744380200; x=1744985000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFy6ACGlewwahJcQDdgO8c8GfCX47OEfeGyDlhNqeLA=;
        b=CHer9qe7NV+6Z439eFYIaPYLvW5sJWMt81q69FNgitrVPGTyYB6smBql6RYYQ4aBUp
         Gn3fsiznX8makKzQR7klf9Prw+SUhjS9jrYOBpBm1TGy3JqkPeHGeVVRmj6OPW5OZwwU
         6SGe18I32Iv72MWbboXgQQIEeQler+qPEobp5pu64DGQdQCz+kpDx6zlPllFE8EWXyIn
         JTkK3LZkLUWqmZAyy/3aTz5F5IqZepaTtQqCv3KKpeBDQOjYDEd4/IKclNbGBBIR/P3Q
         ilZ+LzMle85RFu4zD+j31h0plakQsIzDnkiFvofnaGQY7wEEChrGmRtf7dmUJiEhx3Lh
         cQLg==
X-Forwarded-Encrypted: i=1; AJvYcCUECVANwpEFfd21KcomfRyUycSHBKDXydjtn8uPuTCp/WaXFL8FsCpkvmOj6biGrc0fIWa9JIjO@linaro.org, AJvYcCUTo9FpeMtEkz4CIk4eC9qOEffEYdm+R/EJIVpoInh8N+j1Ft3SFfHDKXmCGhvkXL0YU/k/B1lzK64nbC5T@linaro.org, AJvYcCW4pOmsRqli4+Dv5ZTMg+cOucKLc2Sb1wFEyR0QXuLiJ9ru+soX+XcRF7gwCeuqlkG52+EE2ZuSwCx479iB6Mpx/rs=@linaro.org
X-Gm-Message-State: AOJu0YyW1GY8dxwBDn2mMmFRhNP6Z8ikl7Sj1D1Qu+NNSfFl17kMU7mc
	eGpsqzjvCtC6DcwuX/hPBCIP516uU1T7z58PpHny9Vmwwg0WiOKmAnInSDWFLcR63PTiIZhf60W
	9bg7dO99qfgr/AW9qKr5ZfAp47L0=
X-Gm-Gg: ASbGncv6EVh/a+0ifhkGpcsBnOPu0MHk087yjr2YgfZ6w9uh3G0L6OMoWdjFWPqoGAr
	yCWLj1NQSSq5d+6JWoSageKEb/sT4kvF4K5CDyQ08tLgiEPLpSf6E1lKJ9WM2Zr/qDE5S6FiqDi
	/E+OMpkuD3xkfCSp4/lLj1ZyGypPzvu3I1lB/gByvzrEPL4j+QRx8=
X-Google-Smtp-Source: AGHT+IHazCXxnMA+xyqZPveubVFBv52IbAgpmh1CjzAbeFtFPVX6/q3G/iRq8FPnP60DzPRxeHXfocU9HqCUX5JBXWc=
X-Received: by 2002:a17:90a:d888:b0:2ee:f677:aa14 with SMTP id
 98e67ed59e1d1-30823664084mr4622603a91.13.1744380199557; Fri, 11 Apr 2025
 07:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <16376e4b63fad6f847ceadb39b8f9780fc288198.1744032780.git.ktokunaga.mail@gmail.com>
 <2e9cb17e-47a4-49d3-a815-612bcbdcc92d@redhat.com>
In-Reply-To: <2e9cb17e-47a4-49d3-a815-612bcbdcc92d@redhat.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Fri, 11 Apr 2025 23:03:07 +0900
X-Gm-Features: ATxdqUGygzKUhd7MGEXS4tYylx2kmA9QydAJS9i_XTLSV_ewkssT5HpuuxRtrHA
Message-ID: <CAEDrbUYDsZo_XO_prUnz8yZ_+gU1UgNiba48svDmANuqcTMyWw@mail.gmail.com>
Subject: Re: [PATCH 08/10] hw/9pfs: Allow using hw/9pfs with emscripten
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000025e5270632812a75"
X-TUID: 62WtUUhAfsuI

--00000000000025e5270632812a75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

> > Emscripten's fiber does not support submitting coroutines to other
> > threads.
>
> Does it work as long as the thread does not rewind?

The structure used by Fiber includes a thread-specific field related to
rewind=E2=80=AF[1], which prevents it from being shared across threads. The=
 behavior
of the remaining fields in multi-threaded contexts is not documented, so
further experimentation is needed to determine whether they can be safely
shared.

[1]
https://emscripten.org/docs/api_reference/fiber.h.html#c.asyncify_data_t.re=
wind_id

> You can add all these to the stubs/emscripten.c file that I suggested
> elsewhere.

Sure, I'll apply this reorganization in the next verison of the series.

> You could extracting v9fs_co_run_in_worker()'s bodies into separate
> functions.  It is tedious but not hard; all you have to do is define
> structs for the to parameters and return values of v9fs_co_*(), unpack
> them in the callback functions, and retrieve the return value in
> v9fs_co_*().  Many functions
>
> The advantage is that, instead of all the bottom half and yielding dance
> that is done by v9fs_co_run_in_worker() and co_run_in_worker_bh(), you
> can just use thread_pool_submit_co().

Thank you for the suggestion. I'll explore this approach, though it's still
unclear whether thread_pool_submit_co() can be used with Emscripten's Fiber
due to the limitations mentioned above.

--00000000000025e5270632812a75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Paolo,</div><div><br></div><div>&gt; &gt; Emscript=
en&#39;s fiber does not support submitting coroutines to other<br>&gt; &gt;=
 threads.<br>&gt;<br>&gt; Does it work as long as the thread does not rewin=
d?<br><br>The structure used by Fiber includes a thread-specific field rela=
ted to<br>rewind=E2=80=AF[1], which prevents it from being shared across th=
reads. The behavior<br>of the remaining fields in multi-threaded contexts i=
s not documented, so<br>further experimentation is needed to determine whet=
her they can be safely<br>shared.<br><br>[1] <a href=3D"https://emscripten.=
org/docs/api_reference/fiber.h.html#c.asyncify_data_t.rewind_id">https://em=
scripten.org/docs/api_reference/fiber.h.html#c.asyncify_data_t.rewind_id</a=
><br><br>&gt; You can add all these to the stubs/emscripten.c file that I s=
uggested<br>&gt; elsewhere.<br><br>Sure, I&#39;ll apply this reorganization=
 in the next verison of the series.<br><br>&gt; You could extracting v9fs_c=
o_run_in_worker()&#39;s bodies into separate<br>&gt; functions.=C2=A0 It is=
 tedious but not hard; all you have to do is define<br>&gt; structs for the=
 to parameters and return values of v9fs_co_*(), unpack<br>&gt; them in the=
 callback functions, and retrieve the return value in<br>&gt; v9fs_co_*().=
=C2=A0 Many functions<br>&gt;<br>&gt; The advantage is that, instead of all=
 the bottom half and yielding dance<br>&gt; that is done by v9fs_co_run_in_=
worker() and co_run_in_worker_bh(), you<br>&gt; can just use thread_pool_su=
bmit_co().<br><br>Thank you for the suggestion. I&#39;ll explore this appro=
ach, though it&#39;s still<br>unclear whether thread_pool_submit_co() can b=
e used with Emscripten&#39;s Fiber<br>due to the limitations mentioned abov=
e.<br><br><br><br></div><br></div>

--00000000000025e5270632812a75--
