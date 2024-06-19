Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp846780dlb;
        Wed, 19 Jun 2024 02:36:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzDJY19AJD04oZy+vdQGiPNqhLO3MQX8xpRNVftHjDQ+qdrdoJaa/3ov8E6mlfVy6C6TKnK1RnpE1mb9tanqwfdKKLJ7pK
X-Google-Smtp-Source: AGHT+IGNc4nW1IGf3CauX7dyl5jFhwjS7Dvez4q/4fip7fFQ/O32YKh/G57JXD313zVRKTZMfZQQ
X-Received: by 2002:a81:e703:0:b0:631:4400:7472 with SMTP id 00721157ae682-63a8e1d7ee9mr20875747b3.16.1718789795305;
        Wed, 19 Jun 2024 02:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718789795; cv=none;
        d=google.com; s=arc-20160816;
        b=RJPY5ig0UUHXpmUepc3ex39mZgH44OyoFairxr6i/toQvkTUnRNktPWY/ppahiDi8W
         Zt2MBGIkRCsEZa4nte0OaJiYdlxvT3R/h0fyi1vKtjS71Dk0xNjh9K6mCPigE6cyPJOi
         E3N4R2J6SX0E6H9cZk1ai8VsAMnovIF/xGJQFXhOzkMJ9g1tRyd7Xzs4gKSh3PPa+W89
         wjHOqmR90a7vogK7SrBIBkjsLw/a6IY4ruUtEx1uGcPfhAJgpctwQtRRgkK9mhwCaTqY
         /GB3nujNR06aBd0ayjLI0bXArhZGOzl2bO4i2JmWLyel5XBGmpga5cZyj6wczTcsZ8VJ
         6Tiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=zGEzzY08bh5HSHPmQO9sp7fYf7xs1EETsPabs8WT5cU=;
        fh=wgH+7JSz3GRoVWvSrnQGcsPxNan1agMnPFUWQ/jQ9sA=;
        b=m9l9j/5haaG8Tg9k4rVvctFYm8s4uRaY01RoayeYsmoY5jyY8flw+qQn39miq5NhDC
         vNSRU+TNHAz5dE1OdWLHF389NX+qRnekVM7Qz/prkjDjNVFg+FEsZ7RuamEEHoCqqBBa
         2xuJqK2bP7vIONGsHAfPnH+A3e0e0skosTe1Ozo3XbUcn5GqnWYjDL6eRz8WqNGYv5M0
         A+QXrIP9w4PYS3Lrwi7LHQkM0RYOqPf+5qIFPDIzCP9YldAkR8tkFV4486DNXUWkGy79
         ymaNDjOBd8yE67ZsGtbMmHnUkt23IoswEWPHnqvpo6ymeEmZTxJh79H9I3nJENg1Nxx6
         06Jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LxzbcrRk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b4f7ade86csi34158196d6.160.2024.06.19.02.36.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 02:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LxzbcrRk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJrj3-0000iJ-BB; Wed, 19 Jun 2024 05:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrj1-0000hD-Jh
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 05:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJriz-0006xA-TG
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 05:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718789729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGEzzY08bh5HSHPmQO9sp7fYf7xs1EETsPabs8WT5cU=;
 b=LxzbcrRkBzLw/QM/TayiMAnjdNA8q3alRap85KU582+UOtTxuD2XDeMfzsOfLMMzc0ErK5
 JlFnPe0L1BdwF6GxIIvjbh2qr7jPY8VRewrj9nr9jzDVqirCB3xepC/lTikzEe7Hoa/Rxh
 QUeBrLzUDX/IwhAW3G7E3296dGqvw4I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-efmsW-qlPq-gIEnUqBJJ4w-1; Wed, 19 Jun 2024 05:35:27 -0400
X-MC-Unique: efmsW-qlPq-gIEnUqBJJ4w-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-421759c3556so3531675e9.1
 for <qemu-arm@nongnu.org>; Wed, 19 Jun 2024 02:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718789726; x=1719394526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zGEzzY08bh5HSHPmQO9sp7fYf7xs1EETsPabs8WT5cU=;
 b=splAzpf7ZW1ooNcgxC4Sq1RhtyDZ2BGno0avl7CBVWrDFiZYCCGIcY4zVsl5HEo33O
 Nu8j+EM2M7V6GUWljzdOj3YNnPmLvPZJ1oV31EqoPKzh0ghNd0lqvxX56PzAjg+3y0Iy
 UKetsPWO4/P4UHbv2HNeZFciNeaZoM4fXzbwKnvILzDDUYOlzoC9jCgUbNj2AF5bCW9D
 8xtAYNfK8Tfr0ZRnD8lyse0/BX0vzBCY29imfaOePWEnDxHIZNH9toX3/14OCFB55HzU
 yMwaq3wj0O8GJYAr//s/Z5pI1H47+9Cldq3aQfRwjG7Mwn0EZE2XRJSEppgf5aCNHDE+
 v9nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6zExVwCRxwci9tyz+oSPzSaIpj1zMwC4lYp8EhqXINU1Vp6JasDzxmCsgP1daixgauDECbtSeswHiMMO4M/FniWCE
X-Gm-Message-State: AOJu0YzYNbwuBeXeeGcl6hSX7g2vKuGPQ8gFxamj3wqkuZdalMLifESh
 j3xgIFnkqN9FyMKSSNY2SqVmRDhoBsD2tjKgufHgIMi57yj7NS5M+AtJfiJ4CpoLIJobflDFWVF
 e/wEtW5LkxXQYKaaMc+Lajo0t98Mr9uWwd6QWIvVOUDjRinjI7A==
X-Received: by 2002:a05:600c:2e56:b0:421:811b:b865 with SMTP id
 5b1f17b1804b1-42474d4087emr20950655e9.18.1718789726561; 
 Wed, 19 Jun 2024 02:35:26 -0700 (PDT)
X-Received: by 2002:a05:600c:2e56:b0:421:811b:b865 with SMTP id
 5b1f17b1804b1-42474d4087emr20950355e9.18.1718789726193; 
 Wed, 19 Jun 2024 02:35:26 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602f620sm221167315e9.19.2024.06.19.02.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:35:25 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:35:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Alistair Francis
 <alistair23@gmail.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Haibo1
 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>, Andrew
 Jones <ajones@ventanamicro.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei
 Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 08/12] pc-bios/meson.build: Add support for RISC-V in
 unpack_edk2_blobs
Message-ID: <20240619113524.23982e70@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240524061411.341599-9-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-9-sunilvl@ventanamicro.com>
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
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: veVmuu7SBz9w

On Fri, 24 May 2024 11:44:07 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Update list of images supported in unpack_edk2_blobs to enable RISC-V
> ACPI table testing.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  pc-bios/meson.build     | 2 ++
>  tests/qtest/meson.build | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 0760612bea..8602b45b9b 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -4,6 +4,8 @@ if unpack_edk2_blobs
>      'edk2-aarch64-code.fd',
>      'edk2-arm-code.fd',
>      'edk2-arm-vars.fd',
> +    'edk2-riscv-code.fd',
> +    'edk2-riscv-vars.fd',
>      'edk2-i386-code.fd',
>      'edk2-i386-secure-code.fd',
>      'edk2-i386-vars.fd',
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 86293051dc..2f60f6aed8 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -259,6 +259,9 @@ qtests_s390x = \
>  qtests_riscv32 = \
>    (config_all_devices.has_key('CONFIG_SIFIVE_E_AON') ? ['sifive-e-aon-watchdog-test'] : [])
>  
> +qtests_riscv64 = \
> +  (unpack_edk2_blobs ? ['bios-tables-test'] : [])
> +
>  qos_test_ss = ss.source_set()
>  qos_test_ss.add(
>    'ac97-test.c',

