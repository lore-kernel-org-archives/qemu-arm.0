Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp352921njc;
        Fri, 11 Apr 2025 03:56:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3806:b0:2fe:e0a9:49d4 with SMTP id 98e67ed59e1d1-30823660fd2mr3874557a91.2.1744368972138;
        Fri, 11 Apr 2025 03:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744368972; cv=none;
        d=google.com; s=arc-20240605;
        b=dtR7K58sURqr2EP0Ye4n6XYFEAPdd8jR8GOnlUQPdgR9vAueB8+D5NO8VJ7eAGqROU
         ZZekhfCa0ykhkXe1Qx2syjaCUl/H3oc3w1p7jQrRSeWp+HVEORiVJi1Y01X3F2LjZkQN
         xc5whfgB0eoVK1RWaZe0jP9RKt2q1dZqaVrjEk8e65mqX0szWf3kS4X7g+ws23oKoGJ4
         wOg7t/VuK5A6TLZYJP8L0OMldvfG0cVTOxVF35vwgn6YjChsSzaqH21d2hDqSpUBPkU4
         s0IBwKyfpaai8K1yUXVWM3WywAuZplLvCHR79+KKkOCeZWbdM/4+uuVJUcZcx+J0BNfr
         kkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kxvMv2qnqE/YwdbtiAkx2DWqRAqTN/wPwM6vw5LuxzA=;
        fh=rdAoA6FsG4dZMVKOShC5+HgAniQ1sg7Gtp6aLNIk0hU=;
        b=f0/8N4pLnKzZnAzAxNFeh/cxSs5AseDM2b54pIGZNRnugiOXp3I0TY0hAen4S9RR/U
         JefxQUqWLpqxZR98Nyz9BVi61KTfwOmzisyQUI94HBaWXP+zztnnd1/IG46fLxwCwpKN
         WhG4LOYQhrIf4HJVkDRQuLfLVqCoSxup9y6lZfxAQyWMXfWiXe6qdUJZRPP4nqqWANBN
         pXNGmo5R4UeWlLPtCq+2xn9Ay8CPdd5bPFriKG/225zSmPp+KAAnCzC6/mSruzrQsVEZ
         bA2/JAkGi0A3zdop8Yyro1SoV45YMDuZdtbID4cTDy/6T/L0c3FQicyItfBAE+e6jqsq
         MBCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bOXqCHYo;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-308188061f7sor2405405a91.4.2025.04.11.03.56.11
        (Google Transport Security);
        Fri, 11 Apr 2025 03:56:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bOXqCHYo;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744368971; x=1744973771; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kxvMv2qnqE/YwdbtiAkx2DWqRAqTN/wPwM6vw5LuxzA=;
        b=bOXqCHYo+SZTZ5A1tHQ9Uje2Zr3f9aM73CJ+qGSm2mXfqbU1C9HK2l54xZLPvVUhPz
         Ul+mqhqfauiIhyuhsYdxmuJpHDT6vCoo2di3isFUHbnqsqbdA4ks18iIBYoSwp3cF1bJ
         3Ws/2VXviidcG1AlEk6a6d0smgwqdm8yXZ3POwSRoGrrtn3OX8CYlw8Uyx15wvULOcN/
         lmyqSJu+HOkAIHF37MabviUZTTo1ylxd2sGeWpmimUk4zZuYKQTeFtQ5WZVM8eS7ssUo
         LYeROolmb9Top+Do5SjPX+v4VfuSvTLNRT2rX8KQHmzdjjRjLvGQU6osshxPuFXw34Nf
         oJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368971; x=1744973771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxvMv2qnqE/YwdbtiAkx2DWqRAqTN/wPwM6vw5LuxzA=;
        b=oR5oXe3PQEZcz3e4UGEu/dLnmYKiUbjZAL2pW8PgrYU3vsq5RGOk7tifykDwajj9F1
         KjtZGTJFWOsCi1oMfhCtr6bV8g/S1Rh/yXPsvxOKl3188/D8aRt/e8mAnHoQfInlRKfQ
         kASzeIx7EC1KEcX5UVOICJa56P6gKUProaE9ewdIqfOQ++QESaLXeSjDE2mv8v7+Dgzl
         9xb5WZlWhcCT6qjZD5gEH3H4ZIe+464CGwREOwEdDFFzhzi+4dTfJ0CHRIUksMeuQsgC
         DzFag4uckpTFxLKEJEjte9449DudrIkSwBER/lQAvJC00OipTFSz8nzge0VPt+k/4/9+
         l55A==
X-Forwarded-Encrypted: i=1; AJvYcCUZKfbZ8Xm0DearbdWN9WiKp1hmEWP8TCa5sNhe979gdVJx3M8S4fxxPv7v5TzmMfzm//b37/6lKWddf3wXufAHTXw=@linaro.org, AJvYcCWd1a0oiOEKoxRlcVjNOK63+/cpOGHdBtbe95QP1u7g7KSABZCgiFiJtqFU61w3p8xigBi35zql@linaro.org, AJvYcCXoFKV+7iL1hLFSa2SfR5YvR4Z8vOi/pgWC30BvINIo4VoCytTggPW23RiIr5l6CnTDXOW+G8OiTF5SAqPS@linaro.org
X-Gm-Message-State: AOJu0YxhvHaLbk0wCgC79CfmRuN9nEs6Kwtp5JA+OS3OYNhZD/YOMmo4
	yT2hRTNWeM8QoNOWpjgm56clFVgEta0jV1LkFM5qwRa2Y9N6njxtht+jgw8K5/skxWaGTayupfl
	0h+LlIffV/NPXsVZlCO8t5MGOGBE=
X-Gm-Gg: ASbGnctxQrXWTBjqKKeiNnRylEDtdUJgFZjy8BMB2GRgpOUYyTy9HpnRNCZfcIbppxJ
	mBJak1kURVxBkxhr7Fp+Ike5rPEStmPoUUN1JiaaqnecO1YSX8xtZdyL4WJSQx8QWIh6pzjifU+
	k8dNG3ScmRz9vY7YRHs8CrjHxnu24zCWyJ0acpzjrXTP56w10TMe8=
X-Google-Smtp-Source: AGHT+IH+PlUhBQNJZi6uzrl2GMJX89hNOF7AbzbbflfIk6LAc+qm3rZwoGqYwh4pcE7A5pY6WfaNrX3fMGnvPguqexI=
X-Received: by 2002:a17:90b:584b:b0:2fe:7fea:ca34 with SMTP id
 98e67ed59e1d1-308237cedabmr3256340a91.32.1744368971455; Fri, 11 Apr 2025
 03:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <2be81d2f86704662c9fa33ceb46077804e34ac77.1744032780.git.ktokunaga.mail@gmail.com>
 <65a63820-e59d-47d4-883a-4affe40f9b38@redhat.com>
In-Reply-To: <65a63820-e59d-47d4-883a-4affe40f9b38@redhat.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Fri, 11 Apr 2025 19:55:59 +0900
X-Gm-Features: ATxdqUF-3ml7LwnXhwj16CrdfgMINPXrYTL6FVmqP88Q7vzlX2MEgr5SaflJhSU
Message-ID: <CAEDrbUYDtpLqUAH-7T8xPk-YneY3B6sBw5TB_diNb7g9xzpYyQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] various: Fix type conflict of GLib function pointers
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
Content-Type: multipart/alternative; boundary="000000000000e6a2b406327e8c65"
X-TUID: TxmVk+S9U2qm

--000000000000e6a2b406327e8c65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

> > On emscripten, function pointer casts can cause function call failure.
> > This commit fixes the function definition to match to the type of the
> > function call.
> >
> > - qtest_set_command_cb passed to g_once should match to GThreadFunc
>
> Sending an alternative patch that doesn't use GOnce, this code runs in
> the main thread.

Thank you for addressing this issue. I've sent a review to that patch.

> > - object_class_cmp and cpreg_key_compare are passed to g_list_sort as
> >    GCopmareFunc but GLib cast them to GCompareDataFunc.
>
> Please use g_list_sort_with_data instead, and poison
> g_slist_sort/g_list_sort in include/glib-compat.h, with a comment
> explaining that it's done this way because of Emscripten.

Sure, I=E2=80=99ll fix this in the next version of the series.

--000000000000e6a2b406327e8c65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Paolo,<br><br>&gt; &g=
t; On emscripten, function pointer casts can cause function call failure.<b=
r>&gt; &gt; This commit fixes the function definition to match to the type =
of the<br>&gt; &gt; function call.<br>&gt; &gt; <br>&gt; &gt; - qtest_set_c=
ommand_cb passed to g_once should match to GThreadFunc<br>&gt; <br>&gt; Sen=
ding an alternative patch that doesn&#39;t use GOnce, this code runs in<br>=
&gt; the main thread.<br><br>Thank you for addressing this issue. I&#39;ve =
sent a review to that patch.<br><br>&gt; &gt; - object_class_cmp and cpreg_=
key_compare are passed to g_list_sort as<br>&gt; &gt; =C2=A0 =C2=A0GCopmare=
Func but GLib cast them to GCompareDataFunc.<br>&gt; <br>&gt; Please use g_=
list_sort_with_data instead, and poison<br>&gt; g_slist_sort/g_list_sort in=
 include/glib-compat.h, with a comment<br>&gt; explaining that it&#39;s don=
e this way because of Emscripten.<br><br>Sure, I=E2=80=99ll fix this in the=
 next version of the series.<br><br></div></div>
</div>

--000000000000e6a2b406327e8c65--
