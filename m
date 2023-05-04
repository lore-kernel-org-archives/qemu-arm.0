Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp125000ejq;
        Thu, 4 May 2023 00:33:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6f+THUkJJtt7B8Z0wiGG10o4hSku4MNgr6eXBqrcPEXEhmXolP9yMUl038NjSKwTXeRGvB
X-Received: by 2002:ac8:5dd3:0:b0:3bf:c474:df98 with SMTP id e19-20020ac85dd3000000b003bfc474df98mr4713973qtx.56.1683185599264;
        Thu, 04 May 2023 00:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683185599; cv=none;
        d=google.com; s=arc-20160816;
        b=YboOVyEc1wVUdfDnPVmZMa4E02YMWQe4H6d9UM99bKiAG997HhGfWAqUPmmGbsyk0K
         LqSVpKWFabKIE1m8gnXbVqOni1NliHhAp///2bpeAuzwYeyE0JmG32hyXl7GTwzDHCnJ
         IYpzRCvjNpOtZcprIcOxkIZjq0PF1VwsBVd+pQZOfpIc2qqUs+KzklID1hSibWWkP+2A
         MGPoIDnLF0eiR8w01zdXr9OlTMINpGCy++hDJ04ltZz/ONagrI7T0vihzKSP8iqseSri
         +KjzEeG3CvLlFOjj7Cy5aOIxIEXmy6tiTxFi25/1l8LcqDSpBzvkToZ0XtJdOEqZmqPN
         v4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fCpmttJ9d5f9xVD9aDsHz2r2m3u3wo4We41P/UK796I=;
        b=tbta3Q6QzOkct9Ypzk6ZP4+ql9K0vRIWN44Bi7hZ6h4zR+iWFYd3KAJygl3iJvHGis
         wP/5Zopmijgj6DA4Nz2IXbbrkTOyGeDgu5bPq0h46vA0fVzSh/dgnZMxK0D+yYzZDsrS
         LVulwN5k39T47iqDlAodLdmVfwH2bNoMlFvz7r3YNdRHl229UTVpQ3bjFB6FvxJ/3eGj
         GrRC5FjI2nlxcLZELcu3xoKdnStjiZNB/DgH7xti/baLGK+AKHSK8gu7ZRwnGPWNrRqE
         zWDBPi4DSP6lHtfmyqOA9A4Rpd96JEYv/lrc4ZR1x3pCeLSjYqSRZ1oRn0HpqBHTHvhG
         85ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aK7HWV0c;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d10-20020a05622a100a00b003e4ee9ab872si19643841qte.99.2023.05.04.00.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 00:33:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aK7HWV0c;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683185598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fCpmttJ9d5f9xVD9aDsHz2r2m3u3wo4We41P/UK796I=;
	b=aK7HWV0clxJYjvF+cB7tikbIXc+mbQ4/whDsx9tDNv3YPx4mPBSveCfr1HLksaiWWwVEwL
	CmlfD/kuY/WDSZCM5DqEoIbgcPwCk3oX46bcaWTNlaPVxfDUnpvI3FDL8GN8SOFElAQabU
	aKc7LDqYg6Lw7lphDCfYuGfE1uF6LBk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-3sGOAsnvOVuTP2B352HmlQ-1; Thu, 04 May 2023 03:33:17 -0400
X-MC-Unique: 3sGOAsnvOVuTP2B352HmlQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-95376348868so17017066b.2
        for <alex.bennee@linaro.org>; Thu, 04 May 2023 00:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683185595; x=1685777595;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCpmttJ9d5f9xVD9aDsHz2r2m3u3wo4We41P/UK796I=;
        b=h7iDvdUrJorhA+VEg3YoIfkW07icsOyGqdgSGwc/eFk2dlJIhHcPidBIUBZIhvEXh/
         rg8QXlWoPSsR/oKczdRJ9Y4ZhyZ0FyDHwAEAsJ56JqsMWNpuobSzaMUTqLSWGmjpTJXC
         SsJwvKrTSs1t94/X2AbSguvLtK7TWjEjxgFSbZjlMxCbXjtCiEuf7/b/cO8gwsQ3IykI
         3XbejjRozMQ/BCKf9X6MuiJGHJfTORaCWsT/P9kiV9bH20sm7s9JS8wGILZnARryktpo
         n7NS1eRF12gMIGkblnF1KcBKGqm1ROtr34VU5OsYekfQQwjYrLd6IOxGzCkLuSP5ifhs
         rxkg==
X-Gm-Message-State: AC+VfDwSwx2x4pA1UWzFXNMX1bZVGyqt7lv0bmrHZ7eHTGOBRkifFWeI
	phD3/b4G9C/KATB/exrkHdoZpLw6Te06dVWBwHvX354AhD33V9fvYxeuQw1v2NYmEZpfMi+Nczg
	F6l0um2iGFJcnkkNf
X-Received: by 2002:a17:907:7fac:b0:965:9d20:a41b with SMTP id qk44-20020a1709077fac00b009659d20a41bmr1882641ejc.16.1683185595117;
        Thu, 04 May 2023 00:33:15 -0700 (PDT)
X-Received: by 2002:a17:907:7fac:b0:965:9d20:a41b with SMTP id qk44-20020a1709077fac00b009659d20a41bmr1882623ejc.16.1683185594789;
        Thu, 04 May 2023 00:33:14 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id d9-20020a17090694c900b0095354acf666sm18401553ejy.92.2023.05.04.00.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 00:33:14 -0700 (PDT)
Message-ID: <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
Date: Thu, 4 May 2023 09:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG for
 semihosting
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-2-farosas@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503193833.29047-2-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: yzma3wQ6/4IW

On 5/3/23 21:38, Fabiano Rosas wrote:
> When building --without-default-devices, the semihosting code will not
> be available, so check the proper config.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

for this change; however, there are two more related issues:

1) you still want to leave out the code if !TCG, because KVM is not able
to exit to userspace on semihosting calls as far as I understand

2) I am not sure why CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y appears in
config/targets/{arm,riscv32,riscv64}-softmmu/default.mak.

Putting things together you also need something like

diff --git a/semihosting/Kconfig b/semihosting/Kconfig
index eaf3a20ef5b2..671020a33426 100644
--- a/semihosting/Kconfig
+++ b/semihosting/Kconfig
@@ -4,4 +4,5 @@ config SEMIHOSTING
  
  config ARM_COMPATIBLE_SEMIHOSTING
         bool
+       default y if (ARM && TCG) || RISCV32 || RISCV64
         select SEMIHOSTING
diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 1b49a7830c7e..5e7a17d05bf8 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -41,5 +41,4 @@ CONFIG_FSL_IMX25=y
  CONFIG_FSL_IMX7=y
  CONFIG_FSL_IMX6UL=y
  CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
  CONFIG_ALLWINNER_H3=y
diff --git a/configs/devices/riscv32-softmmu/default.mak b/configs/devices/riscv32-softmmu/default.mak
index d847bd5692ec..94a236c9c25b 100644
--- a/configs/devices/riscv32-softmmu/default.mak
+++ b/configs/devices/riscv32-softmmu/default.mak
@@ -3,8 +3,6 @@
  # Uncomment the following lines to disable these optional devices:
  #
  #CONFIG_PCI_DEVICES=n
-CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
  
  # Boards:
  #
diff --git a/configs/devices/riscv64-softmmu/default.mak b/configs/devices/riscv64-softmmu/default.mak
index bc69301fa4a6..3f6805944849 100644
--- a/configs/devices/riscv64-softmmu/default.mak
+++ b/configs/devices/riscv64-softmmu/default.mak
@@ -3,8 +3,6 @@
  # Uncomment the following lines to disable these optional devices:
  #
  #CONFIG_PCI_DEVICES=n
-CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
  
  # Boards:
  #

Paolo

> Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/helper.c       | 4 ++--
>   target/arm/tcg/m_helper.c | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
