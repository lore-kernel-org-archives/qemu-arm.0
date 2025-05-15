Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1820655njb;
        Thu, 15 May 2025 05:37:36 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCULHPSLz5kbIgyN/RIbltQw1i0Rdob7q/0l0T/f1FXptaqy4EF0EDoLLvLXPHwOUNNKac7Le50I+Wt7Yw==@linaro.org
X-Google-Smtp-Source: AGHT+IHjQTgkzJI7DpeU0eikY0xs+I0Flk/8S3YGuTBi+GMQ14AZuTBHOZHirnKuDfZRxz0wEiFY
X-Received: by 2002:a05:6214:5284:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6f896ed81dfmr120809046d6.32.1747312653339;
        Thu, 15 May 2025 05:37:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747312653; cv=pass;
        d=google.com; s=arc-20240605;
        b=BXFjQUlESsOZ5JkPsIg7BSmZwZrjajn762m3ZAk1Abetg0oJjyWQOjyOhdOobjXaLw
         H63Xkt0ATo7T5YxaOp6DuJKuZAYV+2w5iqaDYVV5wJYuR1ir/ty5TOpFPOoRkVuNKe+K
         vV8q5Wpzt+Pza+WeoTEOru7qH4nJokI5ZfBxZmfezDaPu2iTADlkNdsHSHaVZxX2WQDw
         J21kU+6O/ZSqnF4l7l8uee/dIZiE/I0UPZUnzaZSHxZVgYgpaaKDKwTeX4K1Brxe1/5s
         4sD5+NQ5gwy5Bn3E+H2Bnnj0PxbmUwb4k+xbqyri2+Ig21zJY4E04qaZgyqkPPjeLdGI
         C8uA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:subject:to:from:message-id:date
         :dkim-signature;
        bh=DhzVf+/zd/L811b/GSupjdEZC8EpQtL3QJUTQukMbIw=;
        fh=83idbA0PFj/OGhx8FnZEpzBShupWyGr6vY285yRzwNI=;
        b=gCPfu/X0YqpsW7sOxnlT+X2HmQx+D/NXLzxP4XpRYvNSAoN1Tdp+FmqWET2isE2GW+
         Z5Zj3KgRYQ6ouweAbN+HNG+GKVwp+mG3n+42aS0PJm3/REEpXcE+w9cgGU0xDvh9SWvg
         /DToPG/7Lpos4CL3FtkemH5zNw0Vtuq0TW0PJ3FY3Aen1+g5Ha4p0WVXJPY5NxM3gQKr
         m23V0iHQeg4eg8glN08flHPSs1eWQ9AOtXu+l0J4yiboKGKMggOj7+X6UYM+PQmMxor5
         iYvJlCeBMhyypHqYH1XooSh8PB/X87yqk8+HLnmfXdFkv5Aja6EroCjW/9ELWlzSqbib
         75Cg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=KVBl7vQo;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a4bd20si165681866d6.346.2025.05.15.05.37.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 05:37:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=KVBl7vQo;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFXpQ-0003sb-J3; Thu, 15 May 2025 08:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1uFXpM-0003sO-Tz; Thu, 15 May 2025 08:36:44 -0400
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1uFXpK-0006xc-1b; Thu, 15 May 2025 08:36:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1747312559; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mJI7QE8vwde86Qo38uW5D6665a7D6zQ/BVn1bDgSWq0OsYac6nHB8e/JoRjLSXbG5xt/s6kn5ZQy0n1gIIxVdZL9mfXIrJlYspy3qZvN2JTU/ZPJzYmC9q2qCEIdInpuWL4CjAPFMtYFc48ctBOvlUpN9tNh9nZSECrDTx9uIe0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747312559;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=DhzVf+/zd/L811b/GSupjdEZC8EpQtL3QJUTQukMbIw=; 
 b=jnB/yQ4yAOMhCr0uETg6sfy0kkQtC3XZeW9oNnzlbBCH1rozlud59e8+UcI9S0gn7EGpUTqxzNC0mdyojk17bIv3huIfIjyS33QvPe8M2lXCzWLwGP1aClz4nli5U+G0nMnvcoiZstP/IFn80lOILnG0DwAZnEyNGRf+ZC0o34c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747312559; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=Date:Date:Message-ID:From:From:To:To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=DhzVf+/zd/L811b/GSupjdEZC8EpQtL3QJUTQukMbIw=;
 b=KVBl7vQolcvK5GQOEmkMlTAqOOhzdKjyKQAlfPkIUbv3xwj9GPwvMB9t5cM2DUJu
 ec0PpFvf4DExolA8Q3Lprhtoybiq0Iks4mCuGmnwUrV/OwLiAXlJWCMfC10FpWVOVXx
 CLh/5sDRQopsIwmruolDe0QoKJGfkTvSclaE1iok=
Received: by mx.zohomail.com with SMTPS id 1747312555901507.4337961815878;
 Thu, 15 May 2025 05:35:55 -0700 (PDT)
Date: Thu, 15 May 2025 20:35:45 +0800
Message-ID: <87msberqzi.wl-me@linux.beauty>
From: Li Chen <me@linux.beauty>
To: "Peter Maydell" <peter.maydell@linaro.org>,"Shannon Zhao"
 <shannon.zhaosl@gmail.com>,"Michael S. Tsirkin"
 <mst@redhat.com>,"Igor Mammedov" <imammedo@redhat.com>,"Ani Sinha"
 <anisinha@redhat.com>,"Eduardo Habkost"
 <eduardo@habkost.net>,"Marcel Apfelbaum"
 <marcel.apfelbaum@gmail.com>,=?ISO-8859-1?Q?=22Philippe_Mathieu-Daud=E9?=
 =?ISO-8859-1?Q?=22?= <philmd@linaro.org>,"Yanan Wang"
 <wangyanan55@huawei.com>,"Zhao Liu" <zhao1.liu@intel.com>,"Song Gao"
 <gaosong@loongson.cn>,"Jiaxun Yang" <jiaxun.yang@flygoat.com>,"Sunil V L"
 <sunilvl@ventanamicro.com>,"Palmer Dabbelt"
 <palmer@dabbelt.com>,"Alistair Francis"
 <alistair.francis@wdc.com>,"Weiwei Li" <liwei1518@gmail.com>,"qemu-arm"
 <qemu-arm@nongnu.org>,"qemu-devel" <qemu-devel@nongnu.org>,"qemu-riscv"
 <qemu-riscv@nongnu.org>
Subject: [PATCH V3 0/4] acpi: Add machine option to disable SPCR table
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/30.1 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.15; envelope-from=me@linux.beauty;
 helo=sender4-op-o15.zoho.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 5CsH4aZoU9ed


This series introduces a new machine option, spcr=3Don|off, allowing users
to disable the ACPI SPCR (Serial Port Console Redirection) table.
By default, SPCR is enabled. Disabling it can help ensure that the guest's
console behavior is determined solely by kernel command-line parameters
on arch like arm64, avoiding unintended serial console configurations impos=
ed
 by firmware.

Also add tests on AArch64 and RISC-V virt machines using TCG and UEFI boot.

Changes since v2:
- Omit UART device from DSDT and SPCR construction if no serial device is p=
resent,
  as suggested by Philippe Mathieu-Daud=E9.
- Add Reviewed-by from Gavin Shan <gshan@redhat.com> for the first patch an=
d fix style issue.

Changes since v1:
- Add bios-tables-test for RISC-V and ARM as suggested by=20
- Add Acked-by from Michael S. Tsirkin for the first patch
- Add Reviewed-by from Bibo Mao for the first patch

Li Chen (4):
  acpi: Add machine option to disable SPCR table
  tests/qtest/bios-tables-test: Add test for disabling SPCR on AArch64
  tests/qtest/bios-tables-test: Add test for disabling SPCR on RISC-V
  acpi/virt: suppress UART device & SPCR when guest has no serial
    hardware

 hw/arm/virt-acpi-build.c       | 18 ++++++++++-----
 hw/core/machine.c              | 22 ++++++++++++++++++
 hw/loongarch/virt-acpi-build.c |  4 +++-
 hw/riscv/virt-acpi-build.c     |  9 ++++++--
 include/hw/boards.h            |  1 +
 include/system/system.h        |  2 ++
 qemu-options.hx                |  5 ++++
 system/vl.c                    |  5 ++++
 tests/qtest/bios-tables-test.c | 42 ++++++++++++++++++++++++++++++++++
 9 files changed, 99 insertions(+), 9 deletions(-)

--=20
2.49.0

