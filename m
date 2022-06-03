Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5493850lfh;
        Fri, 3 Jun 2022 02:55:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykvPGHIYxfRXRGDQNlcV22+Q10+iZZl57nFYRLdNX/c2Ev3opZPAdLoCqKZr2/bKpfQbHG
X-Received: by 2002:a17:907:6e8f:b0:6ff:308e:dfa4 with SMTP id sh15-20020a1709076e8f00b006ff308edfa4mr7702495ejc.371.1654250158703;
        Fri, 03 Jun 2022 02:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654250158; cv=none;
        d=google.com; s=arc-20160816;
        b=sfRlquoD/abZ/tsXSGfBpMtmhkWhRtso8q7IlyUxDSWj8Ka4K6jRBL1ESF/zthmtEk
         hFeKJUE4ap+9OQOILRgOpxwsz++OD0WLZ5lATcmx5WrcyTLMBVxcV8OUfPhgmcTURjl3
         MbFq3QrCom57Qs0kpkBdiEaCkRuoGXnTgSi70mBlQqV/rg3IITak6G4XOeOzmFdfKBvo
         IygA8MuYVqyzQsAjHPel1X4hftFPodAywoqdmo4Mqj/NO7s3X1UOKX6GMlWY2NCsSOV6
         hfsNtr3bI89vU6JywRF4qFH1zWXJxeN2gE666RqpEFVHqxXGbjdrgM3Ol+Yfg6GOf58Y
         A8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=br8BPF6nmcnTCRWyW/DjTNMx6+wBDJzATfvDHHwOfQU=;
        b=SkPuQbnoprkiJKy2CLmP+KLGvXk3xIW0hDI2UypGHj4E2TwvKhxgad1Q/Uu4XbqnIa
         r5HndN5GY0LwHycI9RMaiyFHPU3XXbHdJymqnootwZ1is4Ng7pFbiKhlAignnw5j93+B
         RdxgSkN3q2pPiPiTTmrUNrrMBhM6fDx00D2N6g+Ydi26I/yXt1tcBcKaGjH1dnt43Ry3
         wXDiHb+quhRb7+k4fehEwfsK4Us7kbcDbj7YndWizdfRnFNYtMGsLBJHcwgMtpX8bsIz
         aK63MhbcEBRpBs7al9BhZJVfDcKKfnBMebSBt4BS/kav2VjmSwMWthBDgCgPPFqRMVfz
         0yYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tmhndx58;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d26-20020a50f69a000000b0042dbb8886ffsi6436008edn.155.2022.06.03.02.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jun 2022 02:55:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tmhndx58;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654250157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=br8BPF6nmcnTCRWyW/DjTNMx6+wBDJzATfvDHHwOfQU=;
	b=Tmhndx58NmmwaVAOdoCNGCvMba70CND+dPWzorjc/BccOyZIV3FymCn1bQW1YsKs4ECIC8
	j0xmPV0V6JlfewQEnTHWK1Zow3E9OAzRS3bmxUC81s95wIlZOlCUoSyjBLmeMlSPR0z8uY
	sR9zNjVbiurzhIgIEUUHhHgeiA2EfUc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-8vgkqPlXPI-GDf2HWr1fIg-1; Fri, 03 Jun 2022 05:55:56 -0400
X-MC-Unique: 8vgkqPlXPI-GDf2HWr1fIg-1
Received: by mail-ed1-f72.google.com with SMTP id y13-20020a056402358d00b0042dfb820070so4912060edc.6
        for <alex.bennee@linaro.org>; Fri, 03 Jun 2022 02:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=br8BPF6nmcnTCRWyW/DjTNMx6+wBDJzATfvDHHwOfQU=;
        b=cRFi6jSn5SN6aqC1slOLRuGkwzOgYwXcMTQzbG5L2n5N2NK60liv1vS4QNTJ2zAAMY
         CRd21YisoBrBtPyD8d5hDr9IVNMrNeV+BSPI8ffpvBKcUSI+Tw/eYSyK4lAtkdo9Djaw
         6s39PTS5i6nU4p5QMBlxATa8trOVzXjOS8F9k1nQ3LM6i86IocHI4sE7mhM6HxCb1od0
         kWACyr8N0pZr2Pwz/bgCyAuh8695LfFt65GOvXcszSLnSnhVx4bWClHrBWDu8rNkxvDr
         ocF7cr28cTtU6XGRyqeuINWQgFSDJ+FPrhhkEkhmxw0xWKseYspp+tmAv7Jb+CwrNduz
         1Acw==
X-Gm-Message-State: AOAM533cjXOvfI7lgTG+dKg92Y0R3Hjb+KCEgHYPqO4KIYia0pRJ+x8A
	hnGQaMVX+eyP+tv2AF1cokpZaggVWMrzgRnTRMnzy9ZqJ/IQ5l0cApjj8BR98ks/f5UbCqiQA56
	pozTp84kEEJbDzQNg
X-Received: by 2002:a17:907:9615:b0:708:a422:c9c2 with SMTP id gb21-20020a170907961500b00708a422c9c2mr8011800ejc.217.1654250155571;
        Fri, 03 Jun 2022 02:55:55 -0700 (PDT)
X-Received: by 2002:a17:907:9615:b0:708:a422:c9c2 with SMTP id gb21-20020a170907961500b00708a422c9c2mr8011785ejc.217.1654250155343;
        Fri, 03 Jun 2022 02:55:55 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from gator (cst2-175-76.cust.vodafone.cz. [31.30.175.76])
        by smtp.gmail.com with ESMTPSA id f8-20020a170906494800b0070c4abe4706sm1172269ejt.158.2022.06.03.02.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 02:55:55 -0700 (PDT)
Date: Fri, 3 Jun 2022 11:55:53 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org
Subject: Re: [PATCH] tests/avocado: Prefer max cpu type when using AArch64
 virt machine
Message-ID: <20220603095553.2fa53p6f246giyik@gator>
References: <20220603092505.1450350-1-drjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220603092505.1450350-1-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: TAC8gw8+BLY+

On Fri, Jun 03, 2022 at 11:25:05AM +0200, Andrew Jones wrote:
> The max cpu type is the best default cpu type for tests to use
> when specifying the cpu type for AArch64 mach-virt. Switch all
> tests to it.

Hmm, looking at tests in tests/qtest and tests/vm I see cortex-a57
is still used for a default choice. I should probably post another
patch changing those to max as well.

Thanks,
drew

> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/avocado/replay_kernel.py     | 2 +-
>  tests/avocado/reverse_debugging.py | 2 +-
>  tests/avocado/tcg_plugins.py       | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
> index 0b2b0dc692b1..c19022ea977d 100644
> --- a/tests/avocado/replay_kernel.py
> +++ b/tests/avocado/replay_kernel.py
> @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
>          """
>          :avocado: tags=arch:aarch64
>          :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>          """
>          kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                        '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
> diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
> index d2921e70c3b4..d6a6d7277235 100644
> --- a/tests/avocado/reverse_debugging.py
> +++ b/tests/avocado/reverse_debugging.py
> @@ -198,7 +198,7 @@ def test_aarch64_virt(self):
>          """
>          :avocado: tags=arch:aarch64
>          :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>          """
>          kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                        '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
> diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
> index 642d2e49e305..2bbf62f5036e 100644
> --- a/tests/avocado/tcg_plugins.py
> +++ b/tests/avocado/tcg_plugins.py
> @@ -68,7 +68,7 @@ def test_aarch64_virt_insn(self):
>          :avocado: tags=accel:tcg
>          :avocado: tags=arch:aarch64
>          :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>          """
>          kernel_path = self._grab_aarch64_kernel()
>          kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> @@ -94,7 +94,7 @@ def test_aarch64_virt_insn_icount(self):
>          :avocado: tags=accel:tcg
>          :avocado: tags=arch:aarch64
>          :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>          """
>          kernel_path = self._grab_aarch64_kernel()
>          kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> @@ -120,7 +120,7 @@ def test_aarch64_virt_mem_icount(self):
>          :avocado: tags=accel:tcg
>          :avocado: tags=arch:aarch64
>          :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>          """
>          kernel_path = self._grab_aarch64_kernel()
>          kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> -- 
> 2.34.3
> 
