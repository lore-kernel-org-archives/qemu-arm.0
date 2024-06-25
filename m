Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp635941njc;
        Tue, 25 Jun 2024 03:49:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUw8fC1q1k6X28+AxsiRveniuz8Yvc+yH4pH/dzsgUaeChtHAI+vxRWKR9tzD/t8wC1hO+F2fNhfGO12zakjJTLMNqtGgOB
X-Google-Smtp-Source: AGHT+IEk7jT5jsBN0SbciklTrITdSD+HchqA+RUv6624Y7A4aqkE+8tf9kLGeW4K7rUp755C9joJ
X-Received: by 2002:ad4:4bb1:0:b0:6b5:58e8:8f08 with SMTP id 6a1803df08f44-6b558e89093mr35049256d6.17.1719312570365;
        Tue, 25 Jun 2024 03:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719312570; cv=none;
        d=google.com; s=arc-20160816;
        b=wyjTGvbHII6GhhC5DKoaFTaQi0Mi9H1rocFjK0fm+w9TiqoIjyMFuzkgVadfxngh/U
         ktU3yXhjJXh0yZ2V8kp3EBreDlLBIdaQ9aww+Dnrn6UB7aW3T8x2dWOIKFiiWTA/f+7f
         uEl0wuOdDT+UTVb3on72DEz2I1H/rImYwgdVJ4TE41rsiaHxk7SJqb3fUsWBmYp2qb3c
         nOM4ZgRW2acJSOXGXG21JtOCq94U14MfclmpAJPu57NMbAxBfgO9JZJOu2k0H4yYLmBV
         5aTgt9oOeL6JLQy+uRNbr1xtRlPlN1gGCKIr2njcaAEf1ea07Y/ah1i6xD5J5sicgYBH
         Tt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=jaa8oVICcAI/QWfOCPkPiCW4kJxfRPkwtBuSVnO9grI=;
        fh=VbGdh6IPvf7yg0homjFW0Y3J26ei8R6NpKPh0Qa5Rjs=;
        b=EgqE1fcwnKkZ//w3MdbO7jm/uFORGe7wD5hRv3p76I3M7c0N3y7YlTMucjRzMNSCPZ
         dMyBEaUljivijAEkwuwfDlMTgFJsQJFMDfBcc562R/9A2lPuzUDBZtxJCME3k/bNzutz
         09AsqVf8VuYHcIUpTN4cr3q7dS26iIXO8M8ukdeiABK0z3kfZxm6KNstHorfJ06NrdCw
         sg1pn0SiNtA/MpUI2yC0dy1qChE7atMSOxuhsDJ1Nu16LBeNNKD/a1/QjBa41cxibZwx
         Z5ZBS6pljoWjTS1BHmeV8RjXq1SAdRqxirivJQMynbzWsJhto1Bxjz/W9JyYv4UjlL+/
         vVXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KZRCBrro;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b5223b4268si98979826d6.385.2024.06.25.03.49.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 03:49:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KZRCBrro;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM3ja-0004sE-Nt; Tue, 25 Jun 2024 06:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM3jY-0004r4-Sr
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 06:49:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM3jW-00067Z-9y
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 06:49:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719312545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaa8oVICcAI/QWfOCPkPiCW4kJxfRPkwtBuSVnO9grI=;
 b=KZRCBrrodzo18iPfoW6rTeQ9FM2QBSr3pk8XQehgvONaZxeHoEhWeICMjErch5j/atETEC
 jxHyG2fREqQYkZQlI+9VbuxsKDKG45FGyAzgel1SwpkJiOY4jIM0sY5Zf6qOCklMGwaH2J
 KinhvqOmVP/0AftiqbH4tr7j9JTdSmg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-DAfaBqnpOEabVT5AW9LKBw-1; Tue, 25 Jun 2024 06:49:04 -0400
X-MC-Unique: DAfaBqnpOEabVT5AW9LKBw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-52cd9433146so3207698e87.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 03:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719312542; x=1719917342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jaa8oVICcAI/QWfOCPkPiCW4kJxfRPkwtBuSVnO9grI=;
 b=rHeZJAmNVQhShXRxunZVDSGD67BaTmvfO6FWeZDYwT1SmSVb91XfwFB1VE0l9tHyKx
 9iQuJPLzZVBIaWxvfBVLJ3Z4lnLr8mMoqMtxrN7iP+oYYJyhQ1n0MnaM79uNPxZss9dg
 Rf2oFOXos+T+NX9an5s+sTlILC8BsjfQIlowFFE7wcBKkxfad1I52qo/+XDmvVukMXnP
 eXx4oCPiTPj2xZrX+d5cZhIcYmp6P3GODPrIO5lGN7C+bihx4Ky3g4pNE+wO4q2JsHwF
 cPRgZJfW+sbxypuOK/tdfiLBmlq33dhgHq/MU59nU5Ji+AoZumgmt+GrUf5EyLe/k3jC
 gkXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+912rPoWQVp5WUnNq6wEKDxJGea9k2gKK3R+DpHwcJAUAJnCXCLgYg9TEX7Bdj2P4yLYNJVLMurpg96QADDeTn/4I
X-Gm-Message-State: AOJu0YxYjvyky+wB9c3IUqgvv6S9YwdTCMWS1a4L5krHOIvRj3xAWv+V
 AacrPwtispeWnJ4qO5nlrjSH9rizz95VzqbF/LgA+QSJwBYlSW8PQR7RN/4bjpjF3jtGZJyD/ZR
 Ox9fMwwAqP967m+wdrnnGin0JUESFnAOLuBEW0J8OkWNPxECRHQ==
X-Received: by 2002:a05:6512:10d1:b0:52c:e982:8457 with SMTP id
 2adb3069b0e04-52ce9828502mr3671843e87.32.1719312542559; 
 Tue, 25 Jun 2024 03:49:02 -0700 (PDT)
X-Received: by 2002:a05:6512:10d1:b0:52c:e982:8457 with SMTP id
 2adb3069b0e04-52ce9828502mr3671821e87.32.1719312542037; 
 Tue, 25 Jun 2024 03:49:02 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42481747c76sm167328465e9.0.2024.06.25.03.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 03:49:01 -0700 (PDT)
Date: Tue, 25 Jun 2024 12:49:00 +0200
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
Subject: Re: [PATCH v3 07/15] tests/qtest/bios-tables-test.c: Set "arch" for
 x86 tests
Message-ID: <20240625124900.194e7bca@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240621115906.1049832-8-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-8-sunilvl@ventanamicro.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: qsvD/nmDzTtX

On Fri, 21 Jun 2024 17:28:58 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> To search for expected AML files under ${arch}/${machine} path, set this
> field for X86 related test cases.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 77 ++++++++++++++++++++++++++++------
>  1 file changed, 64 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 007c281c9a..f4c4704bab 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -933,6 +933,7 @@ static void test_acpi_piix4_tcg(void)
>       * This is to make guest actually run.
>       */
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.required_struct_types = base_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
>      test_acpi_one(NULL, &data);
> @@ -944,6 +945,7 @@ static void test_acpi_piix4_tcg_bridge(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.variant = ".bridge";
>      data.required_struct_types = base_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
> @@ -981,6 +983,7 @@ static void test_acpi_piix4_no_root_hotplug(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.variant = ".roothp";
>      data.required_struct_types = base_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
> @@ -997,6 +1000,7 @@ static void test_acpi_piix4_no_bridge_hotplug(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.variant = ".hpbridge";
>      data.required_struct_types = base_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
> @@ -1013,6 +1017,7 @@ static void test_acpi_piix4_no_acpi_pci_hotplug(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.variant = ".hpbrroot";
>      data.required_struct_types = base_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
> @@ -1034,6 +1039,7 @@ static void test_acpi_q35_tcg(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch = "x86";
>      data.required_struct_types = base_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
>      test_acpi_one(NULL, &data);
> @@ -1049,6 +1055,7 @@ static void test_acpi_q35_kvm_type4_count(void)
>  {
>      test_data data = {
>          .machine = MACHINE_Q35,
> +        .arch    = "x86",
>          .variant = ".type4-count",
>          .required_struct_types = base_required_struct_types,
>          .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
> @@ -1065,6 +1072,7 @@ static void test_acpi_q35_kvm_core_count(void)
>  {
>      test_data data = {
>          .machine = MACHINE_Q35,
> +        .arch    = "x86",
>          .variant = ".core-count",
>          .required_struct_types = base_required_struct_types,
>          .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
> @@ -1082,6 +1090,7 @@ static void test_acpi_q35_kvm_core_count2(void)
>  {
>      test_data data = {
>          .machine = MACHINE_Q35,
> +        .arch    = "x86",
>          .variant = ".core-count2",
>          .required_struct_types = base_required_struct_types,
>          .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
> @@ -1099,6 +1108,7 @@ static void test_acpi_q35_kvm_thread_count(void)
>  {
>      test_data data = {
>          .machine = MACHINE_Q35,
> +        .arch    = "x86",
>          .variant = ".thread-count",
>          .required_struct_types = base_required_struct_types,
>          .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
> @@ -1116,6 +1126,7 @@ static void test_acpi_q35_kvm_thread_count2(void)
>  {
>      test_data data = {
>          .machine = MACHINE_Q35,
> +        .arch    = "x86",
>          .variant = ".thread-count2",
>          .required_struct_types = base_required_struct_types,
>          .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
> @@ -1134,6 +1145,7 @@ static void test_acpi_q35_tcg_bridge(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".bridge";
>      data.required_struct_types = base_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
> @@ -1148,6 +1160,7 @@ static void test_acpi_q35_tcg_no_acpi_hotplug(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".noacpihp";
>      data.required_struct_types = base_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
> @@ -1176,6 +1189,7 @@ static void test_acpi_q35_multif_bridge(void)
>  {
>      test_data data = {
>          .machine = MACHINE_Q35,
> +        .arch    = "x86",
>          .variant = ".multi-bridge",
>      };
>      test_vm_prepare("-S"
> @@ -1225,6 +1239,7 @@ static void test_acpi_q35_tcg_mmio64(void)
>  {
>      test_data data = {
>          .machine = MACHINE_Q35,
> +        .arch    = "x86",
>          .variant = ".mmio64",
>          .tcg_only = true,
>          .required_struct_types = base_required_struct_types,
> @@ -1245,6 +1260,7 @@ static void test_acpi_piix4_tcg_cphp(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.variant = ".cphp";
>      test_acpi_one("-smp 2,cores=3,sockets=2,maxcpus=6"
>                    " -object memory-backend-ram,id=ram0,size=64M"
> @@ -1260,6 +1276,7 @@ static void test_acpi_q35_tcg_cphp(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".cphp";
>      test_acpi_one(" -smp 2,cores=3,sockets=2,maxcpus=6"
>                    " -object memory-backend-ram,id=ram0,size=64M"
> @@ -1279,6 +1296,7 @@ static void test_acpi_q35_tcg_ipmi(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".ipmibt";
>      data.required_struct_types = ipmi_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(ipmi_required_struct_types);
> @@ -1293,6 +1311,7 @@ static void test_acpi_q35_tcg_smbus_ipmi(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".ipmismbus";
>      data.required_struct_types = ipmi_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(ipmi_required_struct_types);
> @@ -1310,6 +1329,7 @@ static void test_acpi_piix4_tcg_ipmi(void)
>       * This is to make guest actually run.
>       */
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.variant = ".ipmikcs";
>      data.required_struct_types = ipmi_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(ipmi_required_struct_types);
> @@ -1324,6 +1344,7 @@ static void test_acpi_q35_tcg_memhp(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".memhp";
>      test_acpi_one(" -m 128,slots=3,maxmem=1G"
>                    " -object memory-backend-ram,id=ram0,size=64M"
> @@ -1339,6 +1360,7 @@ static void test_acpi_piix4_tcg_memhp(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.variant = ".memhp";
>      test_acpi_one(" -m 128,slots=3,maxmem=1G"
>                    " -object memory-backend-ram,id=ram0,size=64M"
> @@ -1354,6 +1376,7 @@ static void test_acpi_piix4_tcg_nosmm(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.variant = ".nosmm";
>      test_acpi_one("-machine smm=off", &data);
>      free_test_data(&data);
> @@ -1364,6 +1387,7 @@ static void test_acpi_piix4_tcg_smm_compat(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.variant = ".smm-compat";
>      test_acpi_one("-global PIIX4_PM.smm-compat=on", &data);
>      free_test_data(&data);
> @@ -1374,6 +1398,7 @@ static void test_acpi_piix4_tcg_smm_compat_nosmm(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.variant = ".smm-compat-nosmm";
>      test_acpi_one("-global PIIX4_PM.smm-compat=on -machine smm=off", &data);
>      free_test_data(&data);
> @@ -1384,6 +1409,7 @@ static void test_acpi_piix4_tcg_nohpet(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.machine_param = ",hpet=off";
>      data.variant = ".nohpet";
>      test_acpi_one(NULL, &data);
> @@ -1395,6 +1421,7 @@ static void test_acpi_q35_tcg_numamem(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".numamem";
>      test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
>                    " -numa node -numa node,memdev=ram0", &data);
> @@ -1406,6 +1433,7 @@ static void test_acpi_q35_kvm_xapic(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".xapic";
>      test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
>                    " -numa node -numa node,memdev=ram0"
> @@ -1418,6 +1446,7 @@ static void test_acpi_q35_tcg_nosmm(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".nosmm";
>      test_acpi_one("-machine smm=off", &data);
>      free_test_data(&data);
> @@ -1428,6 +1457,7 @@ static void test_acpi_q35_tcg_smm_compat(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".smm-compat";
>      test_acpi_one("-global ICH9-LPC.smm-compat=on", &data);
>      free_test_data(&data);
> @@ -1438,6 +1468,7 @@ static void test_acpi_q35_tcg_smm_compat_nosmm(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".smm-compat-nosmm";
>      test_acpi_one("-global ICH9-LPC.smm-compat=on -machine smm=off", &data);
>      free_test_data(&data);
> @@ -1448,6 +1479,7 @@ static void test_acpi_q35_tcg_nohpet(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.machine_param = ",hpet=off";
>      data.variant = ".nohpet";
>      test_acpi_one(NULL, &data);
> @@ -1459,6 +1491,7 @@ static void test_acpi_q35_kvm_dmar(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".dmar";
>      test_acpi_one("-machine kernel-irqchip=split -accel kvm"
>                    " -device intel-iommu,intremap=on,device-iotlb=on", &data);
> @@ -1470,6 +1503,7 @@ static void test_acpi_q35_tcg_ivrs(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86",
>      data.variant = ".ivrs";
>      data.tcg_only = true,
>      test_acpi_one(" -device amd-iommu", &data);
> @@ -1481,6 +1515,7 @@ static void test_acpi_piix4_tcg_numamem(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.variant = ".numamem";
>      test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
>                    " -numa node -numa node,memdev=ram0", &data);
> @@ -1489,8 +1524,9 @@ static void test_acpi_piix4_tcg_numamem(void)
>  
>  uint64_t tpm_tis_base_addr;
>  
> -static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
> -                              uint64_t base, enum TPMVersion tpm_version)
> +static void test_acpi_tcg_tpm(const char *machine, const char *arch,
> +                              const char *tpm_if, uint64_t base,
> +                              enum TPMVersion tpm_version)
>  {
>      gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
>                                            machine, tpm_if);
> @@ -1517,6 +1553,7 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>      tpm_emu_test_wait_cond(&test);
>  
>      data.machine = machine;
> +    data.arch = arch;
>      data.variant = variant;
>  
>      args = g_strdup_printf(
> @@ -1540,19 +1577,20 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>  
>  static void test_acpi_q35_tcg_tpm2_tis(void)
>  {
> -    test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_2_0);
> +    test_acpi_tcg_tpm("q35", "x86", "tis", 0xFED40000, TPM_VERSION_2_0);
>  }
>  
>  static void test_acpi_q35_tcg_tpm12_tis(void)
>  {
> -    test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_1_2);
> +    test_acpi_tcg_tpm("q35", "x86", "tis", 0xFED40000, TPM_VERSION_1_2);
>  }
>  
> -static void test_acpi_tcg_dimm_pxm(const char *machine)
> +static void test_acpi_tcg_dimm_pxm(const char *machine, const char *arch)
>  {
>      test_data data = {};
>  
>      data.machine = machine;
> +    data.arch    = arch;
>      data.variant = ".dimmpxm";
>      test_acpi_one(" -machine nvdimm=on,nvdimm-persistence=cpu"
>                    " -smp 4,sockets=4"
> @@ -1579,12 +1617,12 @@ static void test_acpi_tcg_dimm_pxm(const char *machine)
>  
>  static void test_acpi_q35_tcg_dimm_pxm(void)
>  {
> -    test_acpi_tcg_dimm_pxm(MACHINE_Q35);
> +    test_acpi_tcg_dimm_pxm(MACHINE_Q35, "x86");
>  }
>  
>  static void test_acpi_piix4_tcg_dimm_pxm(void)
>  {
> -    test_acpi_tcg_dimm_pxm(MACHINE_PC);
> +    test_acpi_tcg_dimm_pxm(MACHINE_PC, "x86");
>  }
>  
>  static void test_acpi_aarch64_virt_tcg_memhp(void)
> @@ -1621,6 +1659,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>  static void test_acpi_microvm_prepare(test_data *data)
>  {
>      data->machine = "microvm";
> +    data->arch = "x86";
>      data->required_struct_types = NULL; /* no smbios */
>      data->required_struct_types_len = 0;
>      data->blkdev = "virtio-blk-device";
> @@ -1737,11 +1776,12 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>      free_test_data(&data);
>  }
>  
> -static void test_acpi_tcg_acpi_hmat(const char *machine)
> +static void test_acpi_tcg_acpi_hmat(const char *machine, const char *arch)
>  {
>      test_data data = {};
>  
>      data.machine = machine;
> +    data.arch    = arch;
>      data.variant = ".acpihmat";
>      test_acpi_one(" -machine hmat=on"
>                    " -smp 2,sockets=2"
> @@ -1770,12 +1810,12 @@ static void test_acpi_tcg_acpi_hmat(const char *machine)
>  
>  static void test_acpi_q35_tcg_acpi_hmat(void)
>  {
> -    test_acpi_tcg_acpi_hmat(MACHINE_Q35);
> +    test_acpi_tcg_acpi_hmat(MACHINE_Q35, "x86");
>  }
>  
>  static void test_acpi_piix4_tcg_acpi_hmat(void)
>  {
> -    test_acpi_tcg_acpi_hmat(MACHINE_PC);
> +    test_acpi_tcg_acpi_hmat(MACHINE_PC, "x86");
>  }
>  
>  static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
> @@ -1841,6 +1881,7 @@ static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86";
>      data.variant = ".acpihmat-noinitiator";
>      test_acpi_one(" -machine hmat=on"
>                    " -smp 4,sockets=2"
> @@ -1884,13 +1925,14 @@ static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
>  }
>  
>  #ifdef CONFIG_POSIX
> -static void test_acpi_erst(const char *machine)
> +static void test_acpi_erst(const char *machine, const char *arch)
>  {
>      gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
>      gchar *params;
>      test_data data = {};
>  
>      data.machine = machine;
> +    data.arch    = arch;
>      data.variant = ".acpierst";
>      params = g_strdup_printf(
>          " -object memory-backend-file,id=erstnvram,"
> @@ -1905,12 +1947,12 @@ static void test_acpi_erst(const char *machine)
>  
>  static void test_acpi_piix4_acpi_erst(void)
>  {
> -    test_acpi_erst(MACHINE_PC);
> +    test_acpi_erst(MACHINE_PC, "x86");
>  }
>  
>  static void test_acpi_q35_acpi_erst(void)
>  {
> -    test_acpi_erst(MACHINE_Q35);
> +    test_acpi_erst(MACHINE_Q35, "x86");
>  }
>  
>  static void test_acpi_microvm_acpi_erst(void)
> @@ -1978,6 +2020,7 @@ static void test_acpi_q35_viot(void)
>  {
>      test_data data = {
>          .machine = MACHINE_Q35,
> +        .arch    = "x86",
>          .variant = ".viot",
>      };
>  
> @@ -2002,6 +2045,7 @@ static void test_acpi_q35_cxl(void)
>  
>      test_data data = {
>          .machine = MACHINE_Q35,
> +        .arch    = "x86",
>          .variant = ".cxl",
>      };
>      /*
> @@ -2067,6 +2111,7 @@ static void test_acpi_q35_slic(void)
>  {
>      test_data data = {
>          .machine = MACHINE_Q35,
> +        .arch    = "x86",
>          .variant = ".slic",
>      };
>  
> @@ -2081,6 +2126,7 @@ static void test_acpi_q35_applesmc(void)
>  {
>      test_data data = {
>          .machine = MACHINE_Q35,
> +        .arch    = "x86",
>          .variant = ".applesmc",
>      };
>  
> @@ -2094,6 +2140,7 @@ static void test_acpi_q35_pvpanic_isa(void)
>  {
>      test_data data = {
>          .machine = MACHINE_Q35,
> +        .arch    = "x86",
>          .variant = ".pvpanic-isa",
>      };
>  
> @@ -2106,6 +2153,7 @@ static void test_acpi_pc_smbios_options(void)
>      uint8_t req_type11[] = { 11 };
>      test_data data = {
>          .machine = MACHINE_PC,
> +        .arch    = "x86",
>          .variant = ".pc_smbios_options",
>          .required_struct_types = req_type11,
>          .required_struct_types_len = ARRAY_SIZE(req_type11),
> @@ -2120,6 +2168,7 @@ static void test_acpi_pc_smbios_blob(void)
>      uint8_t req_type11[] = { 11 };
>      test_data data = {
>          .machine = MACHINE_PC,
> +        .arch    = "x86",
>          .variant = ".pc_smbios_blob",
>          .required_struct_types = req_type11,
>          .required_struct_types_len = ARRAY_SIZE(req_type11),
> @@ -2169,6 +2218,7 @@ static void test_acpi_piix4_oem_fields(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_PC;
> +    data.arch    = "x86";
>      data.required_struct_types = base_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
>  
> @@ -2187,6 +2237,7 @@ static void test_acpi_q35_oem_fields(void)
>      test_data data = {};
>  
>      data.machine = MACHINE_Q35;
> +    data.arch    = "x86";
>      data.required_struct_types = base_required_struct_types;
>      data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
>  

