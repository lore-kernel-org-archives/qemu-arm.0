Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp840308dlb;
        Wed, 19 Jun 2024 02:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCSTpNQWBe2UgxMDHDkIqgxri8oqZ/WeCmjNMDCWUc3xoTCwYidA71RCMhQ1/QrZGIu4DRTeW09DrdvSr7/kYSpHKqe8Wr
X-Google-Smtp-Source: AGHT+IE9aeJBq2blin9TFVlJYCClSVp6u816tI+vdPMctkxHwMrCcK7aojPZJIFSHie/XncVdzMR
X-Received: by 2002:a05:6102:116a:b0:48f:1564:f4ad with SMTP id ada2fe7eead31-48f1564f866mr1300644137.2.1718788909792;
        Wed, 19 Jun 2024 02:21:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718788909; cv=none;
        d=google.com; s=arc-20160816;
        b=QxYOCZmO/0wicr3pNzyzRCg2sbxa+R797LSV/N7RI+iRIYuBuZyYlBc5jjfcrGJ3dH
         vUUgEkax+Ve+5y5YxONbtON0YvXp1S6yDTg8JgTrLhilq75k5hgoKZ2f3zK6nFYqPzKL
         +hN9U/5xwNquY/Wpd2LwIvvuBtHKhp9hvru/SJ7++lr4WYsbhz6OEU9XNtBsqx2oi92t
         jiutrfG4eRavbeMqx5rCvgsHf+Sjz483isQX58mbynaFdKXk3Yy2ybHohacIfKhvPbVx
         vwpQBlDODmW1slVTCGUpXOcT42yQXj6Pm8sS5o0SsVq0ZMFCfoLU06Rg1sh/xLW1LvRv
         XJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=15PO/GiZHNGhjiCnLI3XggftAI1ybcKgTqaDPZn+pQQ=;
        fh=tyIxr1lWStRC59PiJfx0dSfHHk5M9GQwXir8Fr0PT/c=;
        b=WyhImnOyizQux8KaLsPSXUiB29L5mSl/SRBzQ22EYjvqc8+2VgwZeqOfcbOFt1koIk
         W3ucON3ZS59NC359viwIA+NK6Z53+OXXz9pqvwlSWdUX1q/AYMm1k9s7L41HZNSf2xR4
         o3uBgbQgX+fS6LfUFFxpwNRrCUSwwlsHdE9YiKARK9pEGNzSPB1gZcZGuoqxCqTWcYMC
         nJTtcI8U3v+fZgIoMfR6qo/JwpvFkr89JNf7AMU6FXoLI6mubKn1/ZEe36E31EwNj+OK
         WD6FsrVxvTZBniipCjhhvHjcUfMdR5XO8caEvoImURIKLGDg88EUCOttphv4ocuSwfHH
         yU8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AB6OtTO4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bb9ce1571si73679385a.552.2024.06.19.02.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 02:21:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AB6OtTO4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJrV2-0000O9-Hg; Wed, 19 Jun 2024 05:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrUz-0000Mv-CB
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 05:21:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJrUx-0004Yz-5I
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 05:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718788858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15PO/GiZHNGhjiCnLI3XggftAI1ybcKgTqaDPZn+pQQ=;
 b=AB6OtTO4Z1lzlt5eGGUMGpbTvBks3ZNPWJLOfzovaMllSXRSF6wJv6MbYu7eIjuG/4UKM1
 JOCDTwIE6Bhp8wyZJAkH1UFvfpERLliS+V04GDCDq1jigyvFJAxv3t3ZeBAYiSXBiVnNNH
 XfHz52fTuiv2STFH4SR3G8BEVtBISWU=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-9UYPOr-dMs-wR1g5Kruyew-1; Wed, 19 Jun 2024 05:20:54 -0400
X-MC-Unique: 9UYPOr-dMs-wR1g5Kruyew-1
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-48c46df1952so3578925137.3
 for <qemu-arm@nongnu.org>; Wed, 19 Jun 2024 02:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718788854; x=1719393654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=15PO/GiZHNGhjiCnLI3XggftAI1ybcKgTqaDPZn+pQQ=;
 b=s1iJxJNyu5F6RtEDjHn2ypQm/Zmi/uWDoxYtp5hyiI/kaEpcl3bVlp/TAhoAIfVnvy
 YmKTcgcA3lsGnY+OUwzRrQI0jKh/TofxnRgweHP4cptI927jCOxQhzy2/wyeOQcvnaQS
 zDBGTRLEyYcvfcLf/TFZhHTTn7GL1fEl9fGIn1cdLHMjdrASgNh5/VFWJQnSG+9O0+gw
 YNuwmhbbZcDcEH+ymQakieCXo20uD5o7bFAylkR/qAmkFBH8xKNeyGsMZlo/t5mO8OZt
 sFrwmBRCI0Ewb4CX7NpEs2Cb3VcGkVhvYqtBqz2zacaiw/GS5Jm1Ngjd1p9umQ5JO8Ry
 xpzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJQj2I9BW/E+FBQL/twLGk6EULRPNbKhEyXZ/q+QSbGrpcSoMS2H8wkRgByM8WEuBRPm6vD6Ny0gFqiYt1MZCsmyvk
X-Gm-Message-State: AOJu0Yzl8uF0aHnfFcpBUI5GBSo3dr+Vzu2ihGgXxO+BpbClhoJ1jOAG
 +KU/WmtR7WJkM7iU4mrWk036xjp2OxcxoKEpZZbHXdJlxZM4zDZ+HEQEh1/N5ALQTkwJLpy3F79
 38jXsbQ+4iGWxTceqtaGoafOSYsCNdJp1JVBh/vlToSjJ1MtWuw==
X-Received: by 2002:a05:6102:26d1:b0:48d:8fd7:a952 with SMTP id
 ada2fe7eead31-48f130d077fmr2500745137.32.1718788854048; 
 Wed, 19 Jun 2024 02:20:54 -0700 (PDT)
X-Received: by 2002:a05:6102:26d1:b0:48d:8fd7:a952 with SMTP id
 ada2fe7eead31-48f130d077fmr2500652137.32.1718788852243; 
 Wed, 19 Jun 2024 02:20:52 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abe279cbsm589989085a.112.2024.06.19.02.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:20:51 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:20:47 +0200
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
Subject: Re: [PATCH v2 05/12] tests/qtest/bios-tables-test.c: Add support
 for arch in path
Message-ID: <20240619112047.6b0e674c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240524061411.341599-6-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-6-sunilvl@ventanamicro.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 6/YAGp5jVX1K

On Fri, 24 May 2024 11:44:04 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Since virt machine is common for multiple architectures, add "arch" in
> the path to search expected AML files. Since the AML files are still
> under old path, support both by searching with and without arch in the
> path.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

other than need to swap machine/arch order mentioned in
the next patch look good to me

> ---
>  tests/qtest/bios-tables-test.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index c4a4d1c7bf..c73174ad00 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -78,6 +78,7 @@
>  typedef struct {
>      bool tcg_only;
>      const char *machine;
> +    const char *arch;
>      const char *machine_param;
>      const char *variant;
>      const char *uefi_fl1;
> @@ -262,8 +263,19 @@ static void dump_aml_files(test_data *data, bool rebuild)
>          g_assert(exp_sdt->aml);
>  
>          if (rebuild) {
> -            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
> +            aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir,
> +                                       data->machine, data->arch,
>                                         sdt->aml, ext);
> +
> +            /*
> +             * To keep test cases not failing when the DATA files are moved to
> +             * ARCH under virt folder, add this check as well.
> +             */
> +            if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
> +                aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir,
> +                                           data->machine, sdt->aml, ext);
> +            }
> +
>              if (!g_file_test(aml_file, G_FILE_TEST_EXISTS) &&
>                  sdt->aml_len == exp_sdt->aml_len &&
>                  !memcmp(sdt->aml, exp_sdt->aml, sdt->aml_len)) {
> @@ -398,8 +410,13 @@ static GArray *load_expected_aml(test_data *data)
>          memset(&exp_sdt, 0, sizeof(exp_sdt));
>  
>  try_again:
> -        aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
> -                                   sdt->aml, ext);
> +        aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir, data->machine,
> +                                   data->arch, sdt->aml, ext);
> +        if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
> +            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
> +                                       sdt->aml, ext);
> +        }
> +
>          if (verbosity_level >= 2) {
>              fprintf(stderr, "Looking for expected file '%s'\n", aml_file);
>          }
> @@ -1574,6 +1591,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1667,6 +1685,7 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1689,6 +1708,7 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1762,6 +1782,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1918,6 +1939,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -1937,6 +1959,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .variant = ".topology",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> @@ -2020,6 +2043,7 @@ static void test_acpi_aarch64_virt_viot(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> @@ -2196,6 +2220,7 @@ static void test_acpi_aarch64_virt_oem_fields(void)
>  {
>      test_data data = {
>          .machine = "virt",
> +        .arch = "aarch64",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",

