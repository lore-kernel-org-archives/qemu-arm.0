Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp642425njc;
        Tue, 25 Jun 2024 04:20:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWc8jdcgZBp6EH0UY/snGQ0RQY3VQaJECmFUvfUUcVFVo8K5nqoDdFRMbrZu1KRkquj/epTrnXzTcLReIY4VST8V43yuaq2
X-Google-Smtp-Source: AGHT+IH25Btd41nw7CEhvU8eSD85K85U2M/PF89t5EXM5vQXpk9UUTcDzcba2spKrbmIx2DM932I
X-Received: by 2002:a05:620a:460f:b0:79b:f0d5:e539 with SMTP id af79cd13be357-79bf0d5e6admr679570785a.55.1719314431460;
        Tue, 25 Jun 2024 04:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719314431; cv=none;
        d=google.com; s=arc-20160816;
        b=lSI65g3BXUXx+pXRtmUoHZ8iqOC+lzMYw82DSF1JSZ2eEOUBuxPfG1j0Gr6N1TcyVN
         7f7AIlOx7Kea88qUDisgjm834wkfRA0Ne+XnwfcGUvwb7YeLovGmaNFvN03asGGwT9UI
         K9Xs/KxFBtsi7ZQJ1Qo+RvfOqY1CWhWqXhg3AcvMl/yvIDhyqucq2z8VWg4ClHY5o0fK
         59NNCo4ozah4w+gNgEwmO+G9T/OeA35nVo2FTXPpvoOkBRK2ropptuN3zXwyVqBPebnb
         duhF4sk2XvyiqOadjNqcqycs7rGaAwqv37kR0D9M1y363CHrK0Qg0Xl8cINjZXhKXhp0
         a6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=TxfK50CM39AgyHMqWIsuemzgcz5lpe3wAS/FH8p5QME=;
        fh=ClrqcHXHtu69ajVWWLP1TZQFgvtiHa4sNCo8Ou/PH+Q=;
        b=vlYWNQfKHoN2dVCwKcpzNw91mnWSldeV21zcbxq2DoMtFfohCIlKjb+Bn8dvIa2rib
         Piw2lcXcuphgQWH3T1klAIEDgmYlFF6W6j5Kkg3ZkTC8F3sz7LQTQ5bEA+9gGEzqAgmq
         c2eHOAgEHVSLOmKnmIambVcuAsJRex7fkZvSorTXc4usCnySbcdRkXcPHroYMAxbyOzH
         DUXvg/R5C1mdFlJwsFQ3BZvbPINrghcMIirHGAxh1JsCaiIIGCo3OuN58ClbreTKAraz
         cH4pF93UJhJ476EcP1NriB/mhbvNJjummTZO9zfi0y1gCsHvn2OuY7MAljs7TmH6IwXF
         qCZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bYsPv6Go;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce8abc1bsi1053484185a.213.2024.06.25.04.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 04:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bYsPv6Go;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM4Da-00063i-5w; Tue, 25 Jun 2024 07:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM4DY-00063D-R7
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 07:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM4DX-0003Yf-8V
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 07:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719314405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxfK50CM39AgyHMqWIsuemzgcz5lpe3wAS/FH8p5QME=;
 b=bYsPv6GoRNlw04vHey+SHvaXlPfVb6zcg+nY7UHpgkfghwZIQzxDINjtvQintBEW943c0l
 j+JeuBoF83pxJsgfUY8S63my1mEI8Zj/2tI/NibFt+Bgl+JANwP6mTMDPsQ8H5U3wal5eb
 1xkX8pLfW9Pl9EEILhCOMUxIHGLlGok=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-sJu0xSsFPxuRlBRtEdJP6A-1; Tue, 25 Jun 2024 07:20:02 -0400
X-MC-Unique: sJu0xSsFPxuRlBRtEdJP6A-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3653f54d94eso2569248f8f.2
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 04:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719314401; x=1719919201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TxfK50CM39AgyHMqWIsuemzgcz5lpe3wAS/FH8p5QME=;
 b=a5cQyo6Ra1I22sXXKo9pDv6m7/wapYeEZDfU1UyxZykTZ1/Whj9eWdkE4+VIq3HXj1
 2Y3eaUBiADzFqfgwK4ZBovzfAqi/WFXyRTvVNt51ceZCkN3E5eyawe9CvPnJUtr4vscm
 i+v7ndVf8UHxIgCv2ADJV53MvHL6/ovEpX5BMADQpqVUXRcIaCGFgd/8quxNnFH8mFbC
 JLfw0X0zEvyP0pnCDgfhIH1LAdfa+wD9QgWA3BieG4rxPgnlxc2RlZpopKB/TeB1Ftkw
 azDF2oN9zwGGtcKeniolXeWiz5dEmAQhOOPqgXgThZ9CxBpiBXtVRY9wyLBAsN6dRfQG
 k6Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn5tEmWYMaGJGcMFCSHfIqkJJnkYpnE2nc6NVm0PT9eRwhpJUtzjI3Wcrc7g+uArikWwS25BdOzh7gzmgZLcbnur2c
X-Gm-Message-State: AOJu0YxcDODD5OsZdKPYet9gOof9n6/5J0DEtOpR+rolniR5ZKQD43xf
 MKSwfbKD19LHC2vSRMGFCS3Y8aEd3L+ik5z3wwWEdev1i0EPpZiWoh+MVb7tEA7lvO7C6SmpEhN
 Ba+1G+I6yQCa2RLHTogH+lt9VLcaCvSn1KPICocSfbqX1mgkU6A==
X-Received: by 2002:adf:e58b:0:b0:35f:1dce:8671 with SMTP id
 ffacd0b85a97d-366e948eb63mr4549703f8f.25.1719314401144; 
 Tue, 25 Jun 2024 04:20:01 -0700 (PDT)
X-Received: by 2002:adf:e58b:0:b0:35f:1dce:8671 with SMTP id
 ffacd0b85a97d-366e948eb63mr4549679f8f.25.1719314400680; 
 Tue, 25 Jun 2024 04:20:00 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638f858fbsm12641652f8f.65.2024.06.25.04.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 04:20:00 -0700 (PDT)
Date: Tue, 25 Jun 2024 13:19:59 +0200
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
Subject: Re: [PATCH v3 14/15] tests/qtest/bios-tables-test.c: Enable basic
 testing for RISC-V
Message-ID: <20240625131959.67c2fc74@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240621115906.1049832-15-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-15-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
X-TUID: 2e64AhPvTpTq

On Fri, 21 Jun 2024 17:29:05 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Add basic ACPI table test case for RISC-V.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index f4c4704bab..0f9c654e96 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1977,6 +1977,28 @@ static void test_acpi_microvm_acpi_erst(void)
>  }
>  #endif /* CONFIG_POSIX */
>  
> +static void test_acpi_riscv64_virt_tcg(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .arch = "riscv64",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-riscv-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-riscv-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2",
> +        .ram_start = 0x80000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    /*
> +     * RHCT will have ISA string encoded. To reduce the effort
> +     * of updating expected AML file for any new default ISA extension,
> +     * use the profile rva22s64.
> +     */
> +    test_acpi_one("-cpu rva22s64 ", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_aarch64_virt_tcg(void)
>  {
>      test_data data = {
> @@ -2455,6 +2477,10 @@ int main(int argc, char *argv[])
>                  qtest_add_func("acpi/virt/viot", test_acpi_aarch64_virt_viot);
>              }
>          }
> +    } else if (strcmp(arch, "riscv64") == 0) {
> +        if (has_tcg && qtest_has_device("virtio-blk-pci")) {
> +            qtest_add_func("acpi/virt", test_acpi_riscv64_virt_tcg);
> +        }
>      }
>      ret = g_test_run();
>      boot_sector_cleanup(disk);

