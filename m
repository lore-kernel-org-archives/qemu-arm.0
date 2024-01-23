Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp173962ejc;
        Tue, 23 Jan 2024 00:20:21 -0800 (PST)
X-Received: by 2002:a05:6512:a8b:b0:50e:ccd8:f9d9 with SMTP id m11-20020a0565120a8b00b0050eccd8f9d9mr2593609lfu.24.1705998020977;
        Tue, 23 Jan 2024 00:20:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705998020; cv=none;
        d=google.com; s=arc-20160816;
        b=jdWpZTNAcUa7mE2YaLmktPMnrlYVVVw8tbvLW77QnvEWDTOCbwk6L5Sm68JTBtnQGT
         vTpAgl5Hl2MZBj11DBQYCDhLOxv87DV3KzJLUUD7qNKKpYhcYyT5YpF/QfrQfWYtzWf/
         GNw0nYCYvvysCELu6hYMJRTX5YvOfLyiD38FvQyHXjPnX/rsoYRFs6p7ay1YbePSc0Jz
         Ckv+pNUWWD64fxbAhgAoftEz5bE08uN4XAsFegz87wh0FuLJhI6h/xM9XJ+osVBU6skC
         bKcPATCsX/t9Spl+hPowGlC4Pdw1RxnYFp8nB4YqF26rXESqgTWrdOsszoa0dpWiGoR1
         5wbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=jUV2ETur/YHhD2L9r2syN08M+wLYBj7G/QeHONE9k4A=;
        fh=28jZmCtfPvDa6NKrQBOzonEVRynC+D8ypK9vX5EQexw=;
        b=bkg7coRVmM706u77FAXFoV+s+lnyCFb42decMdngdjoq6vXt4JX/vN3he7x2SQyMww
         d3AHvvW9PkkAagc3wLBblrQMKIC7PnBw3DyMO8Evd4+dY0a1fdQC5ZQEjAEBOfEseiHC
         1YvjNBmVbdqmjGDgBF7dQzIg8kGAVbCb5xkPgVhhBpt4jjblXApja9SNlFLmRf5ofxdF
         qyxs8C3xjL/ICNbAS1aNsaeoEl+v6PFQxY2LqzhQZVPCqvtxEj0JiVWNc60V37wqZ1HD
         vz+Pt8hoxVosQUEljJsWFphX8yNmndaOvLxMRA7562HnWgH2zPVn//KJDVrErQdSDDFj
         5Bmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=UyGUAbQU;
       spf=pass (google.com: domain of ajones@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ajones@ventanamicro.com
Return-Path: <ajones@ventanamicro.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n13-20020a056402060d00b0055a8194dc8fsor1395645edv.12.2024.01.23.00.20.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Jan 2024 00:20:20 -0800 (PST)
Received-SPF: pass (google.com: domain of ajones@ventanamicro.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=UyGUAbQU;
       spf=pass (google.com: domain of ajones@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ajones@ventanamicro.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705998020; x=1706602820; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jUV2ETur/YHhD2L9r2syN08M+wLYBj7G/QeHONE9k4A=;
        b=UyGUAbQU0jE+/8OL/ERgvx6588bVmDJOg55eypcRbAohY4bnTi049TGK7mYMSXD6r4
         Y6ZAhaXUopbw5GczwpWOut4dEVRAhWZcMCQ60ZMuaNpMZujXU/oxybCAuibQFST1STOa
         iN4RGg2oFlAFis+RzhATu5VYEgjbDjr9WzuQaGVWPA1XKT07eWIZryJOAnJA9HW3h+Bh
         ln5R8j/XsMKOGKngK4IDfte66kSLvGsI2Nd0FLAHCF/akqsD9weWa78MawLAolPctX45
         JGYIs8zx7Z8pm74PsLKM2DNpbBpVei1jHXUWaKTs5+w/bZU+B3vi4qKyPuIcCPKmFFZ8
         u5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998020; x=1706602820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUV2ETur/YHhD2L9r2syN08M+wLYBj7G/QeHONE9k4A=;
        b=gJkMT98xOXV1u1cVwiKP+AtSghT+EU8umO0bzb5IbnBo9qMhvtCthiEHytVomFsUY1
         gVXNIik93hdLPUd0nqzc4cOVFzPKb10fkKaBBlMOK81+FGIdOkVDny8PP7tHNYzEOOhP
         3Lk95JJ/1Tf/DAjatRZHIDevGZOiE2q8pKIGyhy6BTCDwC+DVSzIZ7lJ4SgAfMwbve6r
         V9NmHR4cQpBP5lm5d1kVoH1qTuIAGFcAJjoWxaKc2O4mV0RvdN3AGbmsiOnILeOVQo3y
         dP/XHD0XS1egVc/IbKJwGhc3EaQRTJk7wO76Vq2lRNGdWbBc0RWzV1CkxC0dcP7+pJ7+
         oOXw==
X-Gm-Message-State: AOJu0Yw1ZHsx4xErFOJV0r68nPAwM27nXmOfG4xAY2wzydURn1fOwcbJ
	ZbfUTWteASVmYn1KkmS1CKwJoaRPvXuTRY9Ag0G4G0pktAFNPSQV9cxRuaY1IsXgqzFaGexSCuv
	D
X-Google-Smtp-Source: AGHT+IHrnFo96kFqXrbmtDTaJ16lW2vZWFoc71DDaTGvlSuwCuKmyi9E4Xkwwz9HfBbRN5oWg8OMmg==
X-Received: by 2002:aa7:c982:0:b0:559:3583:bb6d with SMTP id c2-20020aa7c982000000b005593583bb6dmr667767edt.32.1705998020528;
        Tue, 23 Jan 2024 00:20:20 -0800 (PST)
Return-Path: <ajones@ventanamicro.com>
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ec32-20020a0564020d6000b0055c4c97b1f2sm1716628edb.91.2024.01.23.00.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:20:20 -0800 (PST)
Date: Tue, 23 Jan 2024 09:20:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Michael Rolnik <mrolnik@gmail.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Laurent Vivier <laurent@vivier.eu>, 
	Yanan Wang <wangyanan55@huawei.com>, qemu-ppc@nongnu.org, Weiwei Li <liwei1518@gmail.com>, 
	qemu-s390x@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, 
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
Subject: Re: [PATCH v3 01/21] hw/riscv: Use misa_mxl instead of misa_mxl_max
Message-ID: <20240123-b8d1c55688885bfc9125c42b@orel>
References: <20240122145610.413836-1-alex.bennee@linaro.org>
 <20240122145610.413836-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122145610.413836-2-alex.bennee@linaro.org>
X-TUID: UMHozOuOp+KA

On Mon, Jan 22, 2024 at 02:55:50PM +0000, Alex Bennée wrote:
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> The effective MXL value matters when booting.

I'd prefer this commit message get some elaboration. riscv_is_32bit()
is used in a variety of contexts, some where it should be reporting
the max misa.mxl. However, when used for booting an S-mode kernel it
should indeed report the effective mxl. I think we're fine with the
change, though, because at init and on reset the effective mxl is set
to the max mxl, so, in those contexts, where riscv_is_32bit() should
be reporting the max, it does.

> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20240103173349.398526-23-alex.bennee@linaro.org>
> Message-Id: <20231213-riscv-v7-1-a760156a337f@daynix.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
> -    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
> +    return harts->harts[0].env.misa_mxl == MXL_RV32;
>  }

Assuming everyone agrees with what I've written above, then maybe we
should write something similar in a comment above this function.

Thanks,
drew
