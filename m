Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp204179njc;
        Thu, 19 Jun 2025 04:51:07 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWvqWP//E++/gS/0oRh1wHqRS5sYknBT+ttqpuJLtLPe9EyKkMH3QFgxeEcJ2aGFSV0YOl/bGEbZe6JAA==@linaro.org
X-Google-Smtp-Source: AGHT+IFUzfbyp/OCJcRKaQg1MGB3QAFO608gIO4VMxVpzxuya9WI8qQNr8F4ZEIUzF/ae+U60NVZ
X-Received: by 2002:ac8:5848:0:b0:48a:df4a:cafa with SMTP id d75a77b69052e-4a73c69623cmr287405081cf.51.1750333866809;
        Thu, 19 Jun 2025 04:51:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1750333866; cv=pass;
        d=google.com; s=arc-20240605;
        b=ARNcOoO4o8t2/X6IBvTcjGE2fU3zAuptiR+Mfgm7jARij9AfsV7XxdVDdLXhw50eAf
         FOxm1L9rEDlulHcGdfzj+oW31xkTJcXkAiWB7rlQxfhSnWLRo4YZJcYRi5Fx2H169kUU
         bc6zqQGtt2qwGaDn50LqiBkiwcuOXjdqHkSD2xR43IfgBNKVUVhpTmJLip+Zyj+k6Ykc
         ewiQKLHRpFKOs/4b+DGd6V4wOlAXDmGzLJX4u3HHs5uMJ45YiZpLnYPBlmErhJYaNB4D
         C+8Un4hgGGDIDHvBm2taivy8SF4rFoFcTcTABiyoZuu1OP0mATAVq1vhqO7lJ8/6LClC
         8gdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:importance
         :content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:dkim-signature;
        bh=gLDIUWyUND5lO0YnJQuBpvtjL0yTeCSTT0edWuoQoBQ=;
        fh=kh1OGs2XM1CE4joIc9DqxC7aDiXw0NykO/JJN2gML8Y=;
        b=bh96mhe9Vj5ntDAuAkEIKaMFicBjH8qpCuwVIL4rDFvKcJe0ATSj+z851eI/hS8qew
         6ag/bHM+GX5dOIYDpYd1m/12o0d16FTR7Uk+pGz+t8WBMfMlaIKdx6q/B8piq7AQi65n
         WynrxFP0PesWf1pTLzdqIvea6VQwjKbqOa49ZZJxBWmP8NTfbElKL0JOlo4QWfkpy+f6
         bruLkS8Fyiuz0x827lb5nnJeVNH5cj+aomB7Sl2UDD9lQLup9sxF+NnK26tJu1BY+cue
         0Xtqb0mHgruFb9eKfCaz4dmesEMmmh7QMgyHTTiJrAtF5Raj6uqZJVjW8O/7S1ehmRGC
         JV5Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=DNMEOnc4;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2be9aasi187783941cf.97.2025.06.19.04.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jun 2025 04:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=DNMEOnc4;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uSDmx-0008Uu-0y; Thu, 19 Jun 2025 07:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1uSDmv-0008Uc-Vj; Thu, 19 Jun 2025 07:50:37 -0400
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1uSDmr-0005bk-HJ; Thu, 19 Jun 2025 07:50:37 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1750333664; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=h8mlfb8H1FHNhvyxO/OVm4PSqaXrVFtVRbrLJzMtZN0VPSsjNYxZkAGVziA0w5ilCYJMKP/+Lee0g+4Dy99rFM7dirITpNNxPRNqQ6dhYGvvPFQgCf89jY3diE2JdKdsyk3uUuwgEqEsrEhfgIDLq2JKp95MBH+uHnULiGozScg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750333664;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gLDIUWyUND5lO0YnJQuBpvtjL0yTeCSTT0edWuoQoBQ=; 
 b=Pdf6zq7FmaLTMIJtgukgiknKOtpGOxdHkRBTiQFt66Kz6CLMwcGT/utnHJT2E6WIV922StTfjpoQjciFN7oqeUz0IwX3LfENlotmJUPoJazYVffLotEXtT5PzhhsDH1UJd9z1v2G6tIYyTYd+T8EOeGQdKAOJBTe9t2Y22/1LRY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750333664; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=gLDIUWyUND5lO0YnJQuBpvtjL0yTeCSTT0edWuoQoBQ=;
 b=DNMEOnc4DN6ig1tZruvrwKTIu1nkeuSogAWLKxB50cm7Y4MgIF6EMSsgmRE7zsN5
 /olHGh1e/zBqazECw9D8qBfTXHCh770sOzv4C068LAeqXDlabnPc+L7GtI7RKWI7Z/T
 /tfIhkveLKjkt4jG8kMQlv4s4ycwyFz2MFYU4pb8=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 175033366310758.05017782068148;
 Thu, 19 Jun 2025 04:47:43 -0700 (PDT)
Date: Thu, 19 Jun 2025 19:47:43 +0800
From: Li Chen <me@linux.beauty>
To: "Peter Maydell" <peter.maydell@linaro.org>,
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
Cc: "Li Chen" <chenl311@chinatelecom.cn>
Message-ID: <19788042767.f03f56de434541.2975113673579743624@linux.beauty>
In-Reply-To: <20250528105404.457729-1-me@linux.beauty>
References: <20250528105404.457729-1-me@linux.beauty>
Subject: Re: [PATCH REPOST v4 0/4] acpi: Add machine option to disable SPCR
 table
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: OVKtlqqOv+VM

Gentle ping incase of forgotten.

 ---- On Wed, 28 May 2025 18:53:34 +0800  Li Chen <me@linux.beauty> wrote -=
--=20
 > From: Li Chen <chenl311@chinatelecom.cn>
 >=20
 > (REPOST because the previous post failed to send to qemu-devel/qemu-risc=
v/qemu-arm,
 >  see https://lore.kernel.org/qemu-devel/1971648603b.dce1f5d22901195.6702=
025346547333607@linux.beauty/T/#u)
 >=20
 > This series introduces a new machine option, spcr=3Don|off, allowing use=
rs
 > to disable the ACPI SPCR (Serial Port Console Redirection) table.
 > By default, SPCR is enabled. Disabling it can help ensure that the guest=
's
 > console behavior is determined solely by kernel command-line parameters
 > on arch like arm64, avoiding unintended serial console configurations im=
posed
 > by firmware.
 >=20
 > Also add tests on AArch64 and RISC-V virt machines using TCG and UEFI bo=
ot.
 >=20
 > Changes since v3:
 > - Add Reviewed-by from Sunil V L <sunilvl@ventanamicro.com> for patch 1,=
 3, and 4.
 > - rename enable_spcr to acpi_spcr_enabled as suggested by Philippe Mathi=
eu-Daud=C3=A9.
 > Changes since v2:
 > - Omit UART device from DSDT and SPCR construction if no serial device i=
s present,
 > as suggested by Philippe Mathieu-Daud=C3=A9.
 > - Add Reviewed-by from Gavin Shan <gshan@redhat.com> for the first patch=
 and fix style issue.
 >=20
 > Changes since v1:
 > - Add bios-tables-test for RISC-V and ARM as suggested by
 > - Add Acked-by from Michael S. Tsirkin for the first patch
 > - Add Reviewed-by from Bibo Mao for the first patch
 >=20
 > Li Chen (4):
 >   acpi: Add machine option to disable SPCR table
 >   tests/qtest/bios-tables-test: Add test for disabling SPCR on AArch64
 >   tests/qtest/bios-tables-test: Add test for disabling SPCR on RISC-V
 >   acpi/virt: suppress UART device & SPCR when guest has no serial
 >     hardware
 >=20
 >  hw/arm/virt-acpi-build.c       | 18 ++++++++-----
 >  hw/core/machine.c              | 22 ++++++++++++++++
 >  hw/loongarch/virt-acpi-build.c |  4 ++-
 >  hw/riscv/virt-acpi-build.c     | 10 ++++++--
 >  include/hw/boards.h            |  1 +
 >  include/system/system.h        |  2 ++
 >  qemu-options.hx                |  5 ++++
 >  system/vl.c                    |  5 ++++
 >  tests/qtest/bios-tables-test.c | 47 ++++++++++++++++++++++++++++++++--
 >  9 files changed, 103 insertions(+), 11 deletions(-)
 >=20
 > --=20
 > 2.49.0
 >=20
 >=20

Regards,
Li
