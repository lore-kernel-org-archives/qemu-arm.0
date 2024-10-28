Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1565708njf;
        Mon, 28 Oct 2024 08:49:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTWRazp4KRjwDoCczxLuacTTT/hskjL61A3x2dKP/uxzQN/WJee3PtvTLrVZiN0boHoE2tEb3jT54rPQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFkaGLcSLVk1/TGiQWXgxvVYxpjn9eW2oEh4YCVC9ZW+vd5J1Sawrzqf/3rRA0qg2eO4GeL
X-Received: by 2002:a05:620a:1a1c:b0:7b1:5143:8da1 with SMTP id af79cd13be357-7b193f3e066mr1686561185a.43.1730130562031;
        Mon, 28 Oct 2024 08:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730130562; cv=none;
        d=google.com; s=arc-20240605;
        b=hhL2Kg+fYmTRDlu/++qmcc4+vU9VtdIeJNqlF4d1mzg2eb8GbXH0VM08LhBx5L/3Ho
         xxmEIZRXR10Sp147Z0nwaIZ824DwKLReDCPUaHeQfbu/5mgm7N7rj7t5JpICp4U1jrt8
         L/bDqYwl9l9PsvTxS0x42IlI4vB1HpWYtjyvd91cauxFTz+mksta1yuRww0aHttraTxH
         sj7eFFEmh3XDjoiMT6yq7cPV04XOIgZnzTKiJE8ui1BEv8XO0a24XJwpnOOhDTOEBlMo
         UMGrfwAp2W7xbz/Q2h1fq+LN4qYVI1d1g65taJ93RJmN7oMiMPZz5csqLKEwCRCn8v0F
         Q22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gHV/bLonf1T7cFCCIyJivlbSqvtQH3czNf0k+2W6D2A=;
        fh=DrStC42kBRYBVR0WifP3Ld+/NZI5rCLIbC319THPMLQ=;
        b=AaMuGgQrwtBtjgdLHfqnZfBuuxt5J3AM3FUtjcxlXA/dJMjSOLOHCUNIiimClp4nee
         RjQhe1+nKes7hF4yrweOQn8ZQA5EgjSJ5351JDFkzuaXUc7uA+K5u9r9Aosm4iT9TfQ+
         SCl3Gujqd0ZbJqZCndlaHTYndIHsXZ5jsC18eD9VLYajl91BgEN4T9EwnsHHbD//duMg
         R5UeUpzwokVZ9ooHifYGmDG1LcITIip5BGEvmVRzWPTNJUXJ1vwRmEylj8IAg8w8rZnO
         DesGFjfvTIfbzMCIT9Ll2jL7h2k3meqL3tgrjobLVcRHnJq8GOw9g2YoyJ8Mqk5tACJg
         jU/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hBZQ60GZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a7dad4si86927726d6.448.2024.10.28.08.49.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Oct 2024 08:49:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hBZQ60GZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5RzL-0004y3-S4; Mon, 28 Oct 2024 11:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5RzI-0004xU-4I
 for qemu-arm@nongnu.org; Mon, 28 Oct 2024 11:49:00 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5RzF-0003ry-Gq
 for qemu-arm@nongnu.org; Mon, 28 Oct 2024 11:48:59 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c937b5169cso6941956a12.1
 for <qemu-arm@nongnu.org>; Mon, 28 Oct 2024 08:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730130535; x=1730735335; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gHV/bLonf1T7cFCCIyJivlbSqvtQH3czNf0k+2W6D2A=;
 b=hBZQ60GZlmqGjBkN5TVHsA1OLWvvDv6D6P/HLjYojhuJCGbVoxwjAmpH8tJyn7KniA
 h1XE/CNsR/jzEOBZuRqTPJnicFItGWvgmrEQv3oV9HcgrdfRWHLMElOjQ6XnsOGYLIVx
 5DD1IypzuVSnZGD6fllFZc6I6+0lEoTFLLeT25gk6ri+5SsbEY91XvKazDd4zqVn0lmd
 1uT5odIglGkDz8gY5Ku2/XwdT/+ZWYCF4V7IBzQTWu/F56vheBqVroi89ExNZJOFcxLD
 UbNgTjQU5vmUvh5tzW2urOYtuMbdARv7UywjPVBgruzkgKLclQrvui3Imlu/FW4q1DTg
 Da6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730130535; x=1730735335;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gHV/bLonf1T7cFCCIyJivlbSqvtQH3czNf0k+2W6D2A=;
 b=R6/lB16eY6nJsH6CGmxnZB6F/29ctFNY5b+k1RFFFO7PjsbTTnZBU/bmAIj94tzBET
 nWFs1CwaeL1gCWvAnY77h7yL9UV52iIUDzKfvkMU+Q1JVXmGAyA/fHTLjRRdX8uqB5nY
 3VNTurUlUymCbMR1sl4H4nCTN4Box8h5aTc7IyHeoTr63Z4triCh4JO+4HKooUwKrbMT
 YbnbcVSjj1S5BwBftLPFDTSXKoq8PCbk2dijgYivBPyvnf2NKZYQ6uASvI3tHAyVtkoB
 kyeKgeYOzIKW5RV9i/nPHWxiJiOc/DfsCuzRLtGuI0bu2K2usby/HVEvjiosdZx/OWVa
 Ao2g==
X-Gm-Message-State: AOJu0Yy/abHuXp2trmrDSO7rzuxhxe52rLzMlL58Q7ABGcQysPIpQnaa
 eUSW3S3ob/SGtK480B/7T+yptDmhUU08M8+VA3HCmnewVA+q1yfPPQ99PTmq4kgqsYZh+sNUWxc
 U9W4lO7tb2AFtUzHKa0sb91Qr4PEWT0o0djU0EQ3ZbQJvZhsT
X-Received: by 2002:a05:6402:5188:b0:5cb:881e:6d3c with SMTP id
 4fb4d7f45d1cf-5cc19667091mr60690a12.8.1730130534987; Mon, 28 Oct 2024
 08:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241028015744.624943-1-jeeheng.sia@starfivetech.com>
In-Reply-To: <20241028015744.624943-1-jeeheng.sia@starfivetech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Oct 2024 15:48:42 +0000
Message-ID: <CAFEAcA-V1fS0vKyZecxacTtbd-UV8y6BMU-XMFOh1xYbhwwgTQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Upgrade ACPI SPCR table to support SPCR table
 revision 4 format
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com, 
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, gaosong@loongson.cn, 
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: 2Eb+VHxjdPCA

On Mon, 28 Oct 2024 at 01:58, Sia Jee Heng <jeeheng.sia@starfivetech.com> wrote:
>
> Update the SPCR table to accommodate the SPCR Table revision 4 [1].
> The SPCR table has been modified to adhere to the revision 4 format [2].
>
> Meanwhile, the virt SPCR golden reference file for RISC-V have been updated to
> accommodate the SPCR Table revision 4.
>
> [1]: https://learn.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
> [2]: https://github.com/acpica/acpica/pull/931
>
> Changes in v6:
> - Added Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> - Rebase and update the build_spcr() function for the LoongArch virt machine.
>
> Changes in v5:
> - Reverted the SPCR table revision history for the ARM architecture.
> - Corrected the output of the SPCR Table diff.
>
> Changes in v4:
> - Remove the SPCR table revision 4 update for the ARM architecture.
>
> Changes in v3:
> - Rebased on the latest QEMU.
> - Added Acked-by: Alistair Francis <alistair.francis@wdc.com>
>
> Changes in v2:
> - Utilizes a three-patch approach to modify the ACPI pre-built binary
>   files required by the Bios-Table-Test.
> - Rebases and incorporates changes to support both ARM and RISC-V ACPI
>   pre-built binary files.
>
> Sia Jee Heng (3):
>   qtest: allow SPCR acpi table changes
>   hw/acpi: Upgrade ACPI SPCR table to support SPCR table revision 4
>     format
>   tests/qtest/bios-tables-test: Update virt SPCR golden reference for
>     RISC-V
>
>  hw/acpi/aml-build.c               |  20 ++++++++++++++++----
>  hw/arm/virt-acpi-build.c          |   8 ++++++--
>  hw/loongarch/acpi-build.c         |   6 +++++-
>  hw/riscv/virt-acpi-build.c        |  12 +++++++++---
>  include/hw/acpi/acpi-defs.h       |   7 +++++--
>  include/hw/acpi/aml-build.h       |   2 +-
>  tests/data/acpi/riscv64/virt/SPCR | Bin 80 -> 90 bytes
>  7 files changed, 42 insertions(+), 13 deletions(-)

Since this seems to be for the benefit largely of
riscv I'm assuming this will go via the riscv tree.

thanks
-- PMM
