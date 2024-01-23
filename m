Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp119727ejc;
        Mon, 22 Jan 2024 21:49:06 -0800 (PST)
X-Received: by 2002:a05:6102:d88:b0:469:bd74:b06c with SMTP id d8-20020a0561020d8800b00469bd74b06cmr2044452vst.25.1705988946466;
        Mon, 22 Jan 2024 21:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705988946; cv=none;
        d=google.com; s=arc-20160816;
        b=QQzPDq1jsh2Vwk/KCZlCphQwCXHDCLuNS+eRxNmuPdlVSbo3kJjPcfzEajIR3j0b6G
         bOtglT1CcwWBLiWe1qeNQsgbLBKgWowbcOxRSuWvNVKt3adh/PYGHJCtofGxkJ573aa2
         g0WbuzTxTmmsFdExeb34ceE1Q2KnY7gTJlKxYSRS1FKcmmkYFIqTRexeA11wlFTwwl5I
         LmAcXLlldt8Ifk5l2BzHMtJu3NENUh2ckvcDqz6wcNeTzt5PZhWGsF+wdPLQ7TTIsup8
         Is4aFy/2GK1ubeL+1ex6zcFzfelqgwgfm4225oZiPaFvflQpJOOJXympyLqPmhvsb59R
         6nuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XGWFIgPM+i7sy9OAsZEHC3tF/I68FLzyifoG6R+5O+0=;
        fh=dKyXYLCLX5soM9gImFfqq7bsHK4jp+xhqbkG8eSLWz8=;
        b=y2Q52JGcrlX5NVHpgVid3+XlU0eyjc1ZxSKHneWg+ogGhr24RHER3DA3q8g+mephZx
         rev4tWvgdP9P/n5ZQBucJ/xSGq+FK5y/uVKnt+iYYM4R+uGGjLZIF7wSg89vLyamV0X4
         5LWMwUFRG/i82PEbLe9B3lgyFwaV6cId1la7wcRdXCLvHz6qtRhu3sZezibp92FgMAlp
         GqgLrwomfKofthc+sP2qqpIwVK35K9Ls/ZBaaYKN5vixu6n+KFszbdP949UUtMP7RbBT
         M+DU4qZkkmERzeNe05ULpbUMi841QD5xHLuaBoEXblzb321880lYnYJR3QMyEan5igA3
         Qyqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=DhDKUovg;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p94-20020a9f36e7000000b007d2e1be06bbsor1181313uap.4.2024.01.22.21.49.06
        (Google Transport Security);
        Mon, 22 Jan 2024 21:49:06 -0800 (PST)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=DhDKUovg;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705988945; x=1706593745; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGWFIgPM+i7sy9OAsZEHC3tF/I68FLzyifoG6R+5O+0=;
        b=DhDKUovg/vfmHmQXIKAu0XfCfpXHEVs++Pwu2xvEYxl/5b1RpQGYG9Mn+9B0+tzYre
         btMjgPrM/lrxbr3BJaP/izwFUygThtqB5i9TZIN63D3ChXKmlc9gekPqgeBIETwOy6dF
         PakzTOUm7zkoMLbLn/YwiQqc2XM5oc3AkbBCZQOwg9yCQXIZfBm2Dj378PyfJHPoBBI2
         nGBjDfAQP6nZrJAMRaPYbLZaEp63vDu59nEYCC4uNlAuoIl01ko6BNTWHsotI24dg+wz
         dAZDB3LXLIgOfooSH5xvTfhh9L55yz7nAdVOI5yG1FlhZKF4pB2pki0c+ssLhsAHHgGp
         F2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705988945; x=1706593745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGWFIgPM+i7sy9OAsZEHC3tF/I68FLzyifoG6R+5O+0=;
        b=PzhpRJCnMK2DP6N0YLIYbnxRLBGuwfVrky/zURO9STaR5EM4iF6SNGvhLZUXSxXxrm
         4VGO22On48K/bFwsbtXGr3p870Zd0eBRheM4AvoDLseChn8v9Gpu+G6mcOeygbVhwECp
         KI7VYJ1N1feAbva/2OgcZdjfxTrma0UUQcGUE33Sdd/LrWNWX3OJrCkF+Y5Isupi4DB2
         EzmTQgwRhn2jJl7/FMy0lGvLBLSyBGOgEMii+G8Ve1z1RJgkm4BpfatO3xxARmiL7h3k
         lL8YIKVAhac62gHpa6HwCZIVue7ZCilgpUcr+eQApFC+BtvQyRnOoPvBGQAV2JlTeAIh
         ucng==
X-Gm-Message-State: AOJu0YwiHIqcjIFnd0vgw7BUs7zk2GO5126nwd/65wfUV1W6SLatgITW
	oafjRMBD5cXGr0N3cX/qPSeonLzSVubUczEKhbi+ZyOBpXkbbBQTvd1TITJ6EgLBfkYEZailEyu
	tSQ4e/A5zY/jht/ZZBllso87Ka8YxLEyOJWoG/g==
X-Google-Smtp-Source: AGHT+IEGeNkPgWGB2ABOu+k0n1xgc8g0ke5OU9+x6qKIzezRXOSKHl+yIjtOmtVfaKEE0HM4paszPnbDaOrSmaVRSdk=
X-Received: by 2002:a67:e3a7:0:b0:469:aec1:b42c with SMTP id
 j7-20020a67e3a7000000b00469aec1b42cmr2494332vsm.5.1705988945512; Mon, 22 Jan
 2024 21:49:05 -0800 (PST)
MIME-Version: 1.0
References: <20240122145610.413836-1-alex.bennee@linaro.org> <20240122145610.413836-2-alex.bennee@linaro.org>
In-Reply-To: <20240122145610.413836-2-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Jan 2024 15:48:39 +1000
Message-ID: <CAKmqyKPawDYf1DBhGb05qnphOKNt8PATHiwaZVBuhS14sHAR0w@mail.gmail.com>
Subject: Re: [PATCH v3 01/21] hw/riscv: Use misa_mxl instead of misa_mxl_max
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Michael Rolnik <mrolnik@gmail.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>, qemu-ppc@nongnu.org, 
	Weiwei Li <liwei1518@gmail.com>, qemu-s390x@nongnu.org, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>, 
	John Snow <jsnow@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Alistair Francis <alistair.francis@wdc.com>, 
	David Woodhouse <dwmw2@infradead.org>, Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Bin Meng <bin.meng@windriver.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Thomas Huth <thuth@redhat.com>, 
	David Hildenbrand <david@redhat.com>, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>, 
	Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>, Paul Durrant <paul@xen.org>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 7TUfa6i6b/zE

On Tue, Jan 23, 2024 at 12:57=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> The effective MXL value matters when booting.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20240103173349.398526-23-alex.bennee@linaro.org>
> Message-Id: <20231213-riscv-v7-1-a760156a337f@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 0ffca05189f..bc67c0bd189 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -36,7 +36,7 @@
>
>  bool riscv_is_32bit(RISCVHartArrayState *harts)
>  {
> -    return harts->harts[0].env.misa_mxl_max =3D=3D MXL_RV32;
> +    return harts->harts[0].env.misa_mxl =3D=3D MXL_RV32;
>  }
>
>  /*
> --
> 2.39.2
>
>
