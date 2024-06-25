Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp635925njc;
        Tue, 25 Jun 2024 03:49:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRuwZh9cE8HBfoOJZpYPS4scvLRGMyk3RQpkwek/OqcCE6PTAevcqnJgxQuyWsB0ta4n1mNMqJjMDrcFDvkRsRk1sGoYYm
X-Google-Smtp-Source: AGHT+IHI3Onr2mOJGWoFk03Dglc27Oz+dEDALkT/tiFosxSCyIKPf+mXX20YUuHl4iwg4sh3UqiA
X-Received: by 2002:a05:6214:2aac:b0:6b5:23eb:3a49 with SMTP id 6a1803df08f44-6b5409c4ce5mr99484386d6.25.1719312566091;
        Tue, 25 Jun 2024 03:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719312566; cv=none;
        d=google.com; s=arc-20160816;
        b=H+ufLw6H40KzjGqdDZWU0TuPd75iflzz/WRtMqq0OcnQ3Vp/JH7qBgMMWUAkEBg99z
         Xc+DYz+jiZOyXTijybJO1gihk/NEUXWtasxraRLk0dC92tMjxsn0oLgp23h/v8K5kZgR
         DpTLB/5zvImbZ9ZVQyTk1h1bPifQqWn3xMjgWQGeRqTqE/vFMrpHZo5/NrC8AB+p7KZy
         FDKsgPqRcp4A++5QUH7tVJCr6ligGcu2xdS9NGo6XgazZ7SK96fpqcjgJHi5NELx+n3e
         QmFAnmeCg9VreIi9/9/8daCHLf22BMPS7/ZM1zdS99kpP4Jlt5s9QQ0fE1itC9szT9o9
         3daQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=dDJ1rFuPBohvm8zo550ZMj/KcvQ/XnmLnyAbPdrOw8g=;
        fh=Ft6IUpnPX/pzIUmPsxny4yM/5oARHlbfG3xCYczK9c0=;
        b=PE0ohTVyBh114TNRramAuWO06eO7/Gi7oaCJf7MhComc65xwe0SWQf61QmsNAxApSt
         RgHzUhmfcOF9NwkHMn0W5Hr+DH27cde50AyjqCm2TpL5qyZc5IQM4abq9vDX26JuvKqN
         Y1QwLUKvKQLRj/7gpcy8MlNfv3RbbmYzPOEdlhhe/0nyS/CrDYVdK5QNIzPh9kk1MIzt
         KOp1kFN7uwKBzCVjygppAeUQrKEO9whmey+9G59kjx1NVAXVXL6eBYDQtFMNiHMB/Dde
         ASRMATb6GR4V75f614hp3iHvr+x8GzyG6ostIRLFRpyKCumo5vjcFYI+6MO4tg0LewIB
         uMrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HGzSvWje;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ecf6023si103633026d6.109.2024.06.25.03.49.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 03:49:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HGzSvWje;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM3jI-0004mE-6J; Tue, 25 Jun 2024 06:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM3jG-0004gv-2u
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 06:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM3jE-00060u-Hb
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 06:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719312527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDJ1rFuPBohvm8zo550ZMj/KcvQ/XnmLnyAbPdrOw8g=;
 b=HGzSvWjeXwDLFovAug6uXPjn8Omc4RjRvMGHdo4lB8lUnWq8X0VlrfJIoL9rA/S74AUFct
 ffkfENcl/B6mPX4IUpTXM0u1GnvKvU0ebywh5meYphwZBHEMonR4eMXtNBZrI5AT7ZYKp2
 EG+LgwamTzFRRq+27WM6cA9nYuUr0j4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-i5Jb4C2nMbOl29ZBqVnePQ-1; Tue, 25 Jun 2024 06:48:46 -0400
X-MC-Unique: i5Jb4C2nMbOl29ZBqVnePQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-52ce8969cf1so1300814e87.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 03:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719312524; x=1719917324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dDJ1rFuPBohvm8zo550ZMj/KcvQ/XnmLnyAbPdrOw8g=;
 b=I2Ztz5nAga809CMThGp+5ETXl4oh5kniqNn/NMWTU8dW5Ud+YeQbS510leQknPzrQQ
 V1gwPFEE1Bo1W/kFdxnO4SaSlFO5W2C6l8pjYrOYkUqV11ZYhCacUHLNTYJbQLovwOy7
 5DtgcB+9K5lE7GNt8Coe+bbvXqJOiMTNm8V0GkTKcG+l4Z/fh2C0/b8VdqcJ4wS+nQ7+
 RX/+dNcTE4leD8W4DDliYc3J5SAJK+VDHcOa8BpyHeRIE0XzKwHYxSjpCzLWdEY+cx7K
 rgV71f5d+/jXNVu9OM2upV3z8wNG9wKiC8igftJV1LALA2ZKXlPc1/49t8nEDma3Eay2
 KUHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZiCb4sEFrqGuwO6dmeVQr6eOhoTOblE5WUxABukXlU1W1vp8KgvL1MO1YWkNFadiLWcBEXIAVWBApAqtxL1qSCldV
X-Gm-Message-State: AOJu0Yxes0SN8IUxhuC9IzKxILC0pGG+Uo+U1nAfzeVfWGDljLMM00Ru
 c0RwFIlgRhxk5jrw4Kv+KoBdvXOcG3E1cu5F0oWk1qc8NOT0ka6Dv9b5BDP8fXUGg0kmkv4LUAb
 VwpjP59sHwFHf8qIssvIjnTIVDi2uXgpzhHt7Iv7DqRiKkS1gFw==
X-Received: by 2002:ac2:4c91:0:b0:52c:ce28:82b0 with SMTP id
 2adb3069b0e04-52cdf7e6706mr4284773e87.14.1719312524460; 
 Tue, 25 Jun 2024 03:48:44 -0700 (PDT)
X-Received: by 2002:ac2:4c91:0:b0:52c:ce28:82b0 with SMTP id
 2adb3069b0e04-52cdf7e6706mr4284754e87.14.1719312524093; 
 Tue, 25 Jun 2024 03:48:44 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42481922774sm172814475e9.47.2024.06.25.03.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 03:48:43 -0700 (PDT)
Date: Tue, 25 Jun 2024 12:48:42 +0200
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
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v3 06/15] tests/qtest/bios-tables-test.c: Set "arch" for
 aarch64 tests
Message-ID: <20240625124842.709ecc97@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240621115906.1049832-7-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-7-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
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
X-TUID: MLwFGic9b/Rs

On Fri, 21 Jun 2024 17:28:57 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> To search for expected AML files under ${arch}/${machine} path, set this
> field for AARCH64 related test cases.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 29c52952f4..007c281c9a 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1591,6 +1591,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1684,6 +1685,7 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1706,6 +1708,7 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1779,6 +1782,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1935,6 +1939,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1954,6 +1959,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .variant = ".topology",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> @@ -2037,6 +2043,7 @@ static void test_acpi_aarch64_virt_viot(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -2213,6 +2220,7 @@ static void test_acpi_aarch64_virt_oem_fields(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",

