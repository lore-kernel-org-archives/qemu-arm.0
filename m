Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp3879932njb;
        Sun, 18 May 2025 21:04:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpexDnX+5sIONbDm0zuMWA0QewtEDROQz0Pl/miIAM7QS6PH+7Xi3LaZy8wpfMBByyLeA4IlhCDdD1hA==@linaro.org
X-Google-Smtp-Source: AGHT+IGRjToUj3D8v+Jzxbf9d1w5xRF0dksh61Xr01ttvU0NX4iZScJ72HCs1OYTPn64qyNlQT0c
X-Received: by 2002:a05:620a:2545:b0:7c7:766d:9b00 with SMTP id af79cd13be357-7cd467a0516mr1831219685a.36.1747627494820;
        Sun, 18 May 2025 21:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747627494; cv=none;
        d=google.com; s=arc-20240605;
        b=BT3uXp1v9YzVQaK9MvsyRjaViNx0Eq+MIN7qhl4FvvHeU2EgQUwxudT9UxBCwALMzh
         EuqRJg2NAEUn6XGOaDKYPoM2oJAUdhKDs4epDOkIQpPoSjlS6PPsL93/LOXvYBD3vTnP
         5hJNll5VmCk7IpihMseUg5ogwNxtmBykK/Wz8NmKFY1c3sTAOtt5engIxDzHozmXhP1G
         V+WyK0q7ZHK5kVDqdzLqa+tOv1IiOCoTpp/l/8XR3H/oCg8XLlduKwkcMWgGwXdXxCWH
         izeYuxOnhDOnWRKTZIFI7GgBIGxKIoFXJbV0OKIY7RjZ/e25JyRpF8apa6UEAnpXqy5O
         Pwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=02NqxBW3qQdmYXTr1KkhoGNaQoa1PsgXXqCCGD+KoUg=;
        fh=zIUeDtBxKKuQMKOfH3Y4VYql445lIV/YRClyG6qW0Pg=;
        b=lIKFsi6wxM2dQpffzLJxX7jwArhoq0VcW4B9hgNfNs8pZLpmIu7SuwAm/5kAe5/Bxz
         XIzaOJq1KSX5JOnQzuzwLKnRFhuAW86csqzzIe6G6G2VdTsz92jQ8vgSFVZY5KJkKTll
         kbS0NLQH8BxnK+P3Q5BIzlz9eRj/e9moLtJWCCjtMChfSTO0zPQqysFYejspNHUoXMWJ
         I0K9z0mSiPehUTqk5+GLqpuJFS0txpkGo+TMDEEb+3mr1Ph0mnwq+dHVu4meoiPLIcNB
         UnL6rnadNqWIKDrUWOb7j7g2wzY6A9SMxtJqzDy8sw4rBGJTvw6GEgCM+zpbCX34oyhD
         LzZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=eK+6yZUZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd4688c506si770264185a.303.2025.05.18.21.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 May 2025 21:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=eK+6yZUZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uGrjU-0003MD-PB; Mon, 19 May 2025 00:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uGrjN-0003LX-U0
 for qemu-arm@nongnu.org; Mon, 19 May 2025 00:04:02 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uGrjL-0003fa-Nz
 for qemu-arm@nongnu.org; Mon, 19 May 2025 00:04:01 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-231e98e46c0so17606055ad.3
 for <qemu-arm@nongnu.org>; Sun, 18 May 2025 21:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1747627437; x=1748232237; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=02NqxBW3qQdmYXTr1KkhoGNaQoa1PsgXXqCCGD+KoUg=;
 b=eK+6yZUZ88ISyGlLp9PiEypTnO0AGoyABY+ol9jN9SBbCeCL0/4Um3NdyMeeuHHcce
 HR8dWQxQgauaf2On8flUediWmxez4qIMPscB7UenEvhC9MJkVxnAxCIlZYvEzOu2rGMX
 MN85Fq18PsuG9S6AGkf98MNUCX4tlDy1sEQWVJjbZQuR6+QMLfH/a56N3scqAUEXi2jr
 aM+4WrzSboGP9RxRYRhOvo/u6k80yQ/C1mqIVR6/X9RSfOeKnmM1hp0tFq+hT3fqScfS
 9mj/SrgEmcHGMMkoZKH+p9mgs+Nrs+RJ2JBTLFb15JG3ko5UZqlfRG3BOichXCv7ITAI
 Bk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747627438; x=1748232238;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=02NqxBW3qQdmYXTr1KkhoGNaQoa1PsgXXqCCGD+KoUg=;
 b=BejTxHllgKhl05RHUe0nupMoXKeMjGFdzluvAHd9DuIwsDBmn1/klChZJxgz56nN3R
 7oWqeLKWzOkSFkGq2mtnnyepfWxMnO7auDEf/sOR85kb00vP0W5AcvyPYnud8WPQpTnK
 EpIPUCeBjrk7BZ/bVo/avad0eZ+4ON4W4XbYqA762un5QUgJ2cMh1KLdT7hQ9sqk8x2n
 czdB7w9yN4Qv0BYdLrlKMbyG0WjzWViUP3WYdWZ6q4gliiBdCQ9LWARC/WL3yGkRuycu
 HufWO9J8mFsP0M/aJKOfLAn9+MLLKksFUUNwuEn8We9GDY8UYVuzwoy8fufhwgaBMf2m
 +/VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRhJvW4XghRDZeNfFvO3lRfbppAzrpdLN/D6PINO7xdwVOT8IVx+k3x1BMZKw1M6a3h9iOd3eFWg==@nongnu.org
X-Gm-Message-State: AOJu0Yxt20kWGbdxD7DEGT2RAgd33JxghuBHEESnrrwIr/QAbeLlcJ0N
 uccleQ3a3zSL2Vz/YnM8/I7Qk9LPa5g4lTMQK1nE/KMo7Q/HlYth/6uC4usB4q1ktQ4=
X-Gm-Gg: ASbGncsBIXrCMRSkWs3jCIJNiGDzTvliMHbK/zcROjX5801LYf0uumFtu9pAs3pTDpU
 FZ6C4EYMr6SDJDwNxfwWpjwdGZuAInyBQ2QNkuyiyr7mAM1YN4Lrb0aPM8+vFwabpY4CDB7QlxV
 c3pojoqcfwSX0hY4gK/3OqLsB7vR3J/9kIntx/Q+6Y1wF4W6SfgP98RvbzGejmTlI9lNNJCTVu/
 Gps12CFfWDfMH58I9oPB3U0LOctiEpv8UgI8HaeKYUWm+4QSOfDOZcRlvXO6kSzCx4utC/+5YET
 1IEvJAedMAbuCT+9CfUve1In5CJj0IDfon6/hB6WZ1rDYoAamUz04JG6Aic=
X-Received: by 2002:a17:903:24e:b0:22e:4a6c:fef2 with SMTP id
 d9443c01a7336-231d45ae355mr183382195ad.53.1747627437632; 
 Sun, 18 May 2025 21:03:57 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ed546fsm50138045ad.231.2025.05.18.21.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 21:03:55 -0700 (PDT)
Date: Mon, 19 May 2025 09:33:45 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Li Chen <me@linux.beauty>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?=22Philippe_Mathieu-Daud=C3=A9=22?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>
Subject: Re: [PATCH V3 3/4] tests/qtest/bios-tables-test: Add test for
 disabling SPCR on RISC-V
Message-ID: <aCqtob_S5FKsG-1r@sunil-laptop>
References: <87msberqzi.wl-me@linux.beauty>
 <87ikm2rqn8.wl-me@linux.beauty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikm2rqn8.wl-me@linux.beauty>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: /QEP6pEbPDwW

On Thu, May 15, 2025 at 08:43:07PM +0800, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
>  
> Add ACPI SPCR table test case for RISC-V when SPCR was off.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> ---
>  tests/qtest/bios-tables-test.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index d2a1aa7fb3..44de152a36 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1807,6 +1807,26 @@ static void test_acpi_aarch64_virt_tcg_acpi_spcr(void)
>                    " -machine spcr=off", &data);
>      free_test_data(&data);
>  }
> +
> +static void test_acpi_riscv_virt_tcg_acpi_spcr(void)
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
> +        .variant = ".acpispcr",
> +    };
> +
> +    test_acpi_one("-cpu rva22s64 "
> +                  "-machine spcr=off", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_tcg_acpi_hmat(const char *machine, const char *arch)
>  {
>      test_data data = {};
> @@ -2612,6 +2632,8 @@ int main(int argc, char *argv[])
>              qtest_add_func("acpi/virt", test_acpi_riscv64_virt_tcg);
>              qtest_add_func("acpi/virt/numamem",
>                             test_acpi_riscv64_virt_tcg_numamem);
> +            qtest_add_func("acpi/virt/acpispcr",
> +                           test_acpi_riscv_virt_tcg_acpi_spcr);
>          }
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
