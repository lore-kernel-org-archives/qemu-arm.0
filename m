Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp615036njc;
        Tue, 25 Jun 2024 01:43:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUO38KJVo+ZepzDj6EzNiWpW4vUcbW101RTPa6phDzHrYtE6IiW1MM+rCaHBrUZCOQWXrEf1KiFdWKa7B7ZeN3tke+iItKQ
X-Google-Smtp-Source: AGHT+IEOIwD9+jvVcZuOMaGya7QH4TZZhR7OnCjurNOM81Kj1WcEOe8a7tQsyt1xD+biOK32eAkO
X-Received: by 2002:ad4:4e8a:0:b0:6b2:aeff:73db with SMTP id 6a1803df08f44-6b5633085ecmr44315496d6.8.1719304982066;
        Tue, 25 Jun 2024 01:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719304982; cv=none;
        d=google.com; s=arc-20160816;
        b=bFpUk5ba7ZawnHQGU04m4DHXJWWLxCptumMnDKsfN3ADO/GI+cR2iEkYlcMik/pizY
         h/HbHGWfliDNBLRqeZ3MQdgxkpWeXPQsR97JHDk3KSUUbqsSCeNx6xJS7q9T3JOyuwy/
         7jcWt08oYjQRpePv8Ytjz+r0KqaOeAPJReIOlWRq/gdBOKwvwSptXTJMLIb808iRom4/
         +/4Z6MTJvhcM1ZqQOuYQlp05FCRFik0EprNS9e+zpHPelBkADk9GbK+cE/lEZwgOIdCF
         GEklvd4UB7Ufefq0yQ5vHGJlnlK6WFrL83YjwJqilfdZFNlXBCtYfZw2XX0P79+EyP34
         S9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=AN9nm1cJ5CO4K+jqisGd2tIBkkEi4+rYcOcPTpP2yuk=;
        fh=DXmSZgtZ8DiEMsIsUmonEk8ltF84+wn+2rpIU6FyVN0=;
        b=iNTDBVAuPHqe0VGWUALCsYh/xeXXYWOCAbloP9GjXdjOs886NadeHOGMMgxiIxGecv
         Qr67QKtEFzFc3RayJX42oOaRNtC201lptqVeGPbex5Zo+N2glPXtv0PgKBuHjZWA7a97
         elSWJMBKq0YLiWGWzh+WhvWdiv/dC9u0gv1eQ4gTW446FOTeS/E72ncOFV0ui1c1ZnQQ
         vmpRA/KPrvWzPcDsSSdo8FW9nwJXNO9KHfBVnS/9uZGTVajqREWh4g71nNIwMpj2fI5N
         Rp9hanbgyeowEtC/Aqnvz1XQhPjf4arVMK86OIoquMsaW4BJ1vBvw7eC4kjZ8bXIRoQ8
         GRSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DCToSFsx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51eceb669si106667186d6.78.2024.06.25.01.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 01:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DCToSFsx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM1lB-0007fJ-PH; Tue, 25 Jun 2024 04:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM1lA-0007ex-OQ
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 04:42:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM1l9-0007zE-3e
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 04:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719304958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AN9nm1cJ5CO4K+jqisGd2tIBkkEi4+rYcOcPTpP2yuk=;
 b=DCToSFsxUeQA5fkmG41RHBU7s9mgUp8PspEufd5o14BUNDW4Q2/Jq5Mawe1fwbaUhtpUva
 Uz+sK8Rr2DzUoBhCTk9V/XAIFQEG83ZqpWI3m+SHGO4Wz8DAvB/Qt72MFScViUblFPnLkI
 CG4zT8nKqmsPeGZHqlKHe8+xavp6n8M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-yFRcT0vSNVahmt5ZLChhDQ-1; Tue, 25 Jun 2024 04:42:34 -0400
X-MC-Unique: yFRcT0vSNVahmt5ZLChhDQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-421f43ddc2aso34857135e9.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 01:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719304953; x=1719909753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AN9nm1cJ5CO4K+jqisGd2tIBkkEi4+rYcOcPTpP2yuk=;
 b=WowfWKK/IVdvK7QEknunr71cWBcy6YEgZ4vj4VI+8dMdv1WjyEfhFGXzCCdu/Amqit
 3ctDvc3mWH+icsnmYTcjjFl1LQH/4SGKitH3HRO4PhuDyEqPcojGPa6dth4Sf63d3mM/
 KAisAzGVCjRYjR2Hj1wnddlonqStM5LL1PCLwSQiUWupoE9kQ0AjennbkBBWBZ6E6PH/
 KtmQ2rGyYFnpGTkO2w1QPJarPwxt5OfV1m2PWI3l+u2OBsAC9GcAS9/+qRnAUrA4rjmp
 8JlisOyuABZtI6XPtGAo1YpQMLvqpq4McbEEGgpUuZ/FPJOx+mOL+3/3Q9g7IYirXXTV
 G06A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgiyqe+2BVAnE9liYGnG4JGREsL47Ov2Dghy4rLfgbDcJNG2EW3+xw4UkOJ3maaXCAT+Bknn8xl/6Hlwkgmx+fDlZu
X-Gm-Message-State: AOJu0YyO2ii8waoqG9YzEMG3BcAPqJ5EPpTs+EMgiYEz7j5oTHmY67mT
 56FvE2eD4bsTFBNf5YBDsibk/8rF9rCiEtzlXgxztEJWoIM51VUbh308Qro6nGZqu5ALxDoUjXP
 S91U0gDMtKrF37n1szjC6puilwGFBB1OZw6hwjKkeRm7cyWC4Vw==
X-Received: by 2002:a05:600c:229a:b0:424:8e78:eed with SMTP id
 5b1f17b1804b1-4248e780f13mr47548065e9.22.1719304953748; 
 Tue, 25 Jun 2024 01:42:33 -0700 (PDT)
X-Received: by 2002:a05:600c:229a:b0:424:8e78:eed with SMTP id
 5b1f17b1804b1-4248e780f13mr47547895e9.22.1719304953403; 
 Tue, 25 Jun 2024 01:42:33 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d208b3dsm206769395e9.34.2024.06.25.01.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 01:42:32 -0700 (PDT)
Date: Tue, 25 Jun 2024 10:42:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Alistair
 Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v3 01/15] uefi-test-tools/UefiTestToolsPkg: Add RISC-V
 support
Message-ID: <20240625104230.5bd9ad72@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240621115906.1049832-2-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-2-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.207,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9zc+4QqoPYba

On Fri, 21 Jun 2024 17:28:52 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Enable building the test application for RISC-V with appropriate
> dependencies updated.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc b/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc
> index c8511cd732..0902fd3c73 100644
> --- a/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc
> +++ b/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc
> @@ -19,7 +19,7 @@
>    PLATFORM_VERSION        = 0.1
>    PLATFORM_NAME           = UefiTestTools
>    SKUID_IDENTIFIER        = DEFAULT
> -  SUPPORTED_ARCHITECTURES = ARM|AARCH64|IA32|X64
> +  SUPPORTED_ARCHITECTURES = ARM|AARCH64|IA32|X64|RISCV64
>    BUILD_TARGETS           = DEBUG
>  
>  [BuildOptions.IA32]
> @@ -60,6 +60,10 @@
>  
>  [LibraryClasses.IA32, LibraryClasses.X64]
>    BaseMemoryLib|MdePkg/Library/BaseMemoryLibRepStr/BaseMemoryLibRepStr.inf
> +  RegisterFilterLib|MdePkg/Library/RegisterFilterLibNull/RegisterFilterLibNull.inf
> +
> +[LibraryClasses.RISCV64]
> +  BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
>  
>  [PcdsFixedAtBuild]
>    gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x8040004F

