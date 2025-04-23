Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2884685njd;
        Wed, 23 Apr 2025 01:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUpuUP1mjMGggKBGfg2PvAkncGke+sdONP0hIQ7BK9bCvohemu1sMEKt+mKQ69IK8Kxm2HGe+WaXv3ICA==@linaro.org
X-Google-Smtp-Source: AGHT+IFVYkAAMtlfxAxv7gl89odwB5u6UDOFgFKZdmUybyGlt1ROImKwBLV1wFCtHBesMYmaQaa4
X-Received: by 2002:a05:6214:528d:b0:6e4:540b:5352 with SMTP id 6a1803df08f44-6f4b4ac3ee6mr34535176d6.16.1745396927557;
        Wed, 23 Apr 2025 01:28:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1745396927; cv=pass;
        d=google.com; s=arc-20240605;
        b=Y3SOjjMKVz/kFhE0t3eIV/tk7ZHrXd68Y+HD6stFhnPW5nXMsAkFy2J1oTdjwiEGQC
         gPTdDXyiXF1h9uiC8WSbS0gN/Q9mWSOc3KNuE7/5boi2Ed4wQ14HO55crHpopNf01PKn
         7QLw5k27qzJtkpQYgQOrJ66H80UiFynmgTHZiDDcJW42lvXVcfqvpU6ozATV3/HlBGKv
         wAvjNL+7gwam/IvKDSs5zAe4oMPVpCYSj9h2la41lfkFXSeF1TUput83FSkaI2GsGgOB
         6hDQ9l6IZX1jqz43pBvDRtnycyDxeNcpY2KACwboTrj/P9tHYfou5L5agBT6eHdnJ3sl
         gmHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:importance
         :content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:dkim-signature;
        bh=3qxON4cikCwnWixyHU7Gsc9w5gqqY/duKNxswVYWL5Y=;
        fh=L60oY+Ul7G7deAAhnX4mmiEP4CzzhRUdR9t/8Bnb8mA=;
        b=ja9V7MxohI9NHtHo+Qvc1mO3kVtfbS+s3rEBKduEVNE3pZO4U2wqmmLHNXNYHspQNX
         AbGHtxsasZsPYTxiOTfrVblVwSbwKrJsh7a9mUIDm94TUC47WrWtRZrCWuctIuYJ19Q3
         NcSKYBAtGdKBrYJhS54whr3OiTn8jf1OHkwI83lsfrsLmIwi5hFKDX05tgr/nvSfcHI2
         045DmqF1/i4skV2rR1lMemQ+GdTOHSnEhomXVMFFKG0jKjCFJzDOYhbH4snS4M7rcEk9
         zD1puhh2k3emsN4SJnDeskPfxYoRLy8IKRXGp91Rcle8Rhm/zfZWx9REaVxDZiHeJD35
         qyWg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=s9KKbNJA;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2b032fcsi129338436d6.41.2025.04.23.01.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 01:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=s9KKbNJA;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7VT0-0007KN-Td; Wed, 23 Apr 2025 04:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1u7VSr-0007Gw-5Q; Wed, 23 Apr 2025 04:28:17 -0400
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1u7VSo-0000WS-Lv; Wed, 23 Apr 2025 04:28:16 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1745396851; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YdzEuxqFMoPtVxAGLjnyV74uP/wVJDnew7k4ogiZYiB7fyB5XHOJ4uDjIIIKv5DKzLUARxuaYQGIaVTUgrnRGTM1F+oaJACCd4Du8O9fmWdVDsf9oHxr/J7AN0MU2L/4mzmCwDiKdo4pnkysgK2cIb7UG+bh2AhQ7NFZmMxBZgs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745396851;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=3qxON4cikCwnWixyHU7Gsc9w5gqqY/duKNxswVYWL5Y=; 
 b=QK5mDNiAdtaFYvjX4NhMhki10aNTF2vBQldIkyiPhLWtFTSa5ZEVCoc7raN+B/sBd3bGc9EInkE2Wu07ChT2z5qbobZaG+4dR5RzWwUIMz8T2POeGJw7sMukU17wFTFGGm4T8I0PKW1djVnphTAA8aJlewg22babp9md5acZmQE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745396851; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=3qxON4cikCwnWixyHU7Gsc9w5gqqY/duKNxswVYWL5Y=;
 b=s9KKbNJAtShv4+yPYxiPzBqPxSdtQkjOAuuoM4tN3rbfN85s/1T7pG5Eedx+owu9
 SShTFgLcnrjnvD9cj92Q3OEEITWdYdneIoYvcnmw5Yp+oLYnJAuehVqW0DcihfVKzza
 O4Mk8Xa+WekyavZvKMAiHmlFXvaFzIB3ZUaGDWD8=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1745396846882271.25102254364424;
 Wed, 23 Apr 2025 01:27:26 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:27:26 +0800
From: Li Chen <me@linux.beauty>
To: "Gavin Shan" <gshan@redhat.com>
Cc: "Peter Maydell" <peter.maydell@linaro.org>,
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
Message-ID: <19661c250ff.e53d27651300291.7831062716952492543@linux.beauty>
In-Reply-To: <2bbfd5d1-be8a-41aa-822f-4c38449b79a7@redhat.com>
References: <1965d621e25.fafa759e911037.825810937022699867@linux.beauty>
 <1965d6357a1.dfa9d35b911644.778874035603636753@linux.beauty>
 <2bbfd5d1-be8a-41aa-822f-4c38449b79a7@redhat.com>
Subject: Re: [PATCH V2 1/3] acpi: Add machine option to disable SPCR table
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Received-SPF: pass client-ip=136.143.188.12; envelope-from=me@linux.beauty;
 helo=sender4-op-o12.zoho.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: LuhToYl7PU/z

Hi Gavin,

 ---- On Wed, 23 Apr 2025 08:11:24 +0800  Gavin Shan <gshan@redhat.com> wrote --- 
 > On 4/22/25 10:05 PM, Li Chen wrote:
 > > From: Li Chen <chenl311@chinatelecom.cn>
 > > 
 > > The ACPI SPCR (Serial Port Console Redirection) table allows firmware
 > > to specify a preferred serial console device to the operating system.
 > > On ARM64 systems, Linux by default respects this table: even if the
 > > kernel command line does not include a hardware serial console (e.g.,
 > > "console=ttyAMA0"), the kernel still register the serial device
 > > referenced by SPCR as a printk console.
 > > 
 > > While this behavior is standard-compliant, it can lead to situations
 > > where guest console behavior is influenced by platform firmware rather
 > > than user-specified configuration. To make guest console behavior more
 > > predictable and under user control, this patch introduces a machine
 > > option to explicitly disable SPCR table exposure:
 > > 
 > >      -machine spcr=off
 > > 
 > > By default, the option is enabled (spcr=on), preserving existing
 > > behavior. When disabled, QEMU will omit the SPCR table from the guest's
 > > ACPI namespace, ensuring that only consoles explicitly declared in the
 > > kernel command line are registered.
 > > 
 > > Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
 > > Reviewed-by: Bibo Mao <maobibo@loongson.cn>
 > > Acked-by: Michael S. Tsirkin <mst@redhat.com>
 > > ---
 > > 
 > > Changes since V1: add Reviewed-by and Acked-by
 > > 
 > >   hw/arm/virt-acpi-build.c       |  5 ++++-
 > >   hw/core/machine.c              | 22 ++++++++++++++++++++++
 > >   hw/loongarch/virt-acpi-build.c |  4 +++-
 > >   hw/riscv/virt-acpi-build.c     |  5 ++++-
 > >   include/hw/boards.h            |  1 +
 > >   qemu-options.hx                |  5 +++++
 > >   6 files changed, 39 insertions(+), 3 deletions(-)
 > > 
 > 
 > One coding style issue below. With it fixed:
 > 
 > Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks for your catch! I would fix it in the next version.

Regards,
Li
