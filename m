Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2337970njd;
        Tue, 22 Apr 2025 06:07:54 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWHm9hnQOe7Tul4+E995eIW9RcHSGFlwXiKT3Mkdv+ukA+qHfNQ62QLeeq2RvA3ucfai2xIeaywTPLrrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFmaw7jv0RYlh0lIY7SNQ0UkViuZxSJmxcBQXTHh3qHG1aH0KJoFtMPIXg7Z8at7hUYA+AU
X-Received: by 2002:a05:620a:4587:b0:7c5:4be5:b0b3 with SMTP id af79cd13be357-7c928049d98mr2820246985a.48.1745327274201;
        Tue, 22 Apr 2025 06:07:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1745327274; cv=pass;
        d=google.com; s=arc-20240605;
        b=CRdfRNj/3M7u6ddTx9xJFXG4V3UePULo+YPl5Vmb3cgi/nG9Xz8yDa1HUVAElQlsqy
         q6HrrQvbd1Q8KMGxjaqucE1Uv7jsN882QBMS0n6j7J/3khXXjcRGefDfek0ykTHV5/v5
         oP34TGrMuwcYTRfhrlWIctNNaKYjM2agxjxv9+J4R1QJWmqAJsN1ijCFzrlMliyHM8PB
         k09RucE5VZeOt3nDA2pAO1TkTKjnEnFJTE1dWBoVyJB55jmOhqJL2XwbfV6Hej26L3Pf
         W8KG/dsadwjMdCt2XHi6JlG34Pjmtiy/fXFmdy6KTiGL7j5+DxSta41pR24lzO8rUj/B
         62xA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:importance
         :content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:to:from:date:dkim-signature;
        bh=VHkIm9+oGJBREU3SyojuKFjCcFay6mh7tQU94xDAjS8=;
        fh=3bB1Wyt2UhMWTKhqWRuG8SNOXyEHeKQSFmdcPqTv22k=;
        b=VU41/MRiAHIQcV7Sj6QGrLKEk4E0HQleQYXm8mMA7sUzU3VUCssB7+QrCdWJqo6fcD
         Zn93E6NWSf9dmF0vUYFesuE+6UPnpNyrrBIr2JMvdw4VDERW8lAr3X6nhj32sp37C8Pb
         N9H60XmY2ZRKOKtCDMcgers2KwkxXJJRr3HIDY6jnG+Niq4AF6G5S22ClBTdY9nLFn7W
         HvoMhUzFX0YWS5MZgECQeCZcefHVmMWyYi/iymjdDweSj5Q46HaOgqL1NXOd8DySIiH/
         PzcqKNu3hhWawWBWjeJ5XBv6AsVAXDbMcySsypFKh9LLDMiPFhR4xLQsbkXqlV2+j5K7
         mK4w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=Oxub0mTV;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925baa498si1102266785a.439.2025.04.22.06.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 06:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=Oxub0mTV;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7DLN-0003w1-6b; Tue, 22 Apr 2025 09:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1u7CMb-0007Vs-Hj; Tue, 22 Apr 2025 08:04:33 -0400
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1u7CMY-0002RH-Rc; Tue, 22 Apr 2025 08:04:33 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1745323435; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bb456hvd633zPGzjN5yBea8aFb/RnFn/Jbq7I5I1nDoEY3NMWe2tP/tTKiaT25F9/jpZHoiCh74nZ9mfJT/m+EBsHaDrA5C5SPCstaIgbTSay/wERoBMkAcKNmd0ONqifutzJzV3h3tOJpERdtqE9FQAhuXivkg9DXlTc/nHzT0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745323435;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=VHkIm9+oGJBREU3SyojuKFjCcFay6mh7tQU94xDAjS8=; 
 b=Mc9YbK82muVMh1jmBt0g/DsKTPShgPWOj7ErAMHK9ekdrp6nPKPESONF+hBeqCZHXxiIKzSp48fblu7rVPGVqgqU3EteOJTEu0+Lg0d2l1ce8hwfY8REuGackKmOl9n6vh91IYVliv1tbvGholhxKP+d0bo9jpYzLVyLzyHLxyY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745323435; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=VHkIm9+oGJBREU3SyojuKFjCcFay6mh7tQU94xDAjS8=;
 b=Oxub0mTVc6kbSJEBWrHX/qdjxmt1WjQ5mvjE0uSddoYPPY7x1rpxV/jHtWidKCZw
 KwsYtBSOhZ86WcaNFJ6uM3wgux4SbtAMg6AfGKoPY6VwSrT5NndFwVb4NajP3Ktginh
 vwzT2YYtvHzfnmbYZQsNQalhOEoGex3OCWYxs8cQ=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1745323433590387.1972510239689;
 Tue, 22 Apr 2025 05:03:53 -0700 (PDT)
Date: Tue, 22 Apr 2025 20:03:53 +0800
From: Li Chen <me@linux.beauty>
To: "Li Chen" <me@linux.beauty>, "Peter Maydell" <peter.maydell@linaro.org>,
 "Shannon Zhao" <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Igor Mammedov" <imammedo@redhat.com>, "Ani Sinha" <anisinha@redhat.com>,
 "Eduardo Habkost" <eduardo@habkost.net>,
 "Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?=22Philippe_Mathieu-Daud=C3=A9=22?= <philmd@linaro.org>,
 "Yanan Wang" <wangyanan55@huawei.com>,
 "Zhao Liu" <zhao1.liu@intel.com>, "Song Gao" <gaosong@loongson.cn>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Sunil V L" <sunilvl@ventanamicro.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alistair Francis" <alistair.francis@wdc.com>,
 "Weiwei Li" <liwei1518@gmail.com>, "qemu-arm" <qemu-arm@nongnu.org>,
 "qemu-devel" <qemu-devel@nongnu.org>, "qemu-riscv" <qemu-riscv@nongnu.org>
Message-ID: <1965d621e25.fafa759e911037.825810937022699867@linux.beauty>
In-Reply-To: 
Subject: [PATCH V2 0/3] acpi: Add machine option to disable SPCR table
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Received-SPF: pass client-ip=136.143.188.15; envelope-from=me@linux.beauty;
 helo=sender4-op-o15.zoho.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Apr 2025 09:07:19 -0400
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
X-TUID: Lb0dh6yF2JVS

This series introduces a new machine option, spcr=3Don|off, allowing users
to disable the ACPI SPCR (Serial Port Console Redirection) table.
By default, SPCR is enabled. Disabling it can help ensure that the guest's
console behavior is determined solely by kernel command-line parameters
on arch like arm64, avoiding unintended serial console configurations impos=
ed
 by firmware.

Also add tests on AArch64 and RISC-V virt machines using TCG and UEFI boot.

Changes since v1:
- Add bios-tables-test for RISC-V and ARM as suggested by=20
- Add Acked-by from Michael S. Tsirkin for the first patch
- Add Reviewed-by from Bibo Mao for the first patch

Li Chen (3):
  acpi: Add machine option to disable SPCR table as suggested by Philippe M=
athieu-Daud=C3=A9
  tests/qtest/bios-tables-test: Add test for disabling SPCR on AArch64
  tests/qtest/bios-tables-test: Add test for disabling SPCR on RISC-V

 hw/arm/virt-acpi-build.c       |  5 +++-
 hw/core/machine.c              | 22 ++++++++++++++++++
 hw/loongarch/virt-acpi-build.c |  4 +++-
 hw/riscv/virt-acpi-build.c     |  5 +++-
 include/hw/boards.h            |  1 +
 qemu-options.hx                |  5 ++++
 tests/qtest/bios-tables-test.c | 42 ++++++++++++++++++++++++++++++++++
 7 files changed, 81 insertions(+), 3 deletions(-)

--=20
2.49.0


