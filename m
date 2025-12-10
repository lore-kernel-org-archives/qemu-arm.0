Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ABCD3E780
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 23:02:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTTCZ-0007RT-Ip; Wed, 10 Dec 2025 18:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vTTCG-0007CO-Jo
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 18:02:19 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vTTCE-0006i2-Jk
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 18:02:12 -0500
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-4ed67a143c5so179341cf.0
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 15:02:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765407729; cv=none;
 d=google.com; s=arc-20240605;
 b=htfCfHwZ+Cg07nf3mRkwVJvBv2LrXsmhiG/iE4QbHzphDieKXIHP1XFwq2hiXc4xG5
 7vFIhbc6gbivMeCWcAo4ksHJFyVJaQBGnDnIa5+DydbTYCm17Vi9OHvaf0k+EDJM/GAq
 iRMqb/KG9xTXm/Ne9+HtavNgOeDeYnu5xQUcPtZhq4R1fXQsbmA+pnKrqkOcKCViunH9
 KsfW95iLYVDi1dzfcmZGXZMpbNMqvGfTez41KC70ABLX0mPYl9xdamQAoLjEY9VRFkZH
 5XDMpNFCaaRqqQSI7HmUKM4LPybj07BXXDEggpCW15WEIJlWE4GXpLj7+pSpHZEGD4vG
 7b+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=graSxLU2u8uUk/6cgxh2vboHqjeGyiVPf8xTMZA3YFM=;
 fh=eRDKckyqshHoWMoqux2DvvdBnope6SXtKw1oSxsbncE=;
 b=bueYywx5NzZqqlb3jIT+5tIFl6XMWu17DpibpDIpC00YrN2f5EuqkViZdDi5kmUYRc
 qO6Jz/La0mAqlqltRKESgADRkF+claUgdTtPrSJcZSxcnFhRiVIupD2weztwYSkHK/fW
 WDOM0xO3uyY41/OJmuAwun60XNmJV6/me+QFRPXXIKwUGol1RviOEYEoT4Cv65BDZKDp
 Kfl0Z1rkf0wqk86oFesY5PdC+clp2YNoFjpGG7CbukgdQPzbRYW6eTCC6Li9G9sA4M3y
 MeZt5reQmkwWY0Dx420HHfzZuzyEh6/dopL68bKId0YEwIvpa6YjjlJHbhn38jjG/kfs
 GtkQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1765407729; x=1766012529; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=graSxLU2u8uUk/6cgxh2vboHqjeGyiVPf8xTMZA3YFM=;
 b=fMDonWqsJuzMr+eDK1XCWTpEHcXzxJXNcLg8dObGqyGSewoiXEGMHi/OFrZH936+Qh
 U4bSAOe0DRsXzO6y9CBqA5rg+3ZNjO4p0VM7FEGtj26O0AH7FojVZNDlQ2Tykzsc2SFP
 WfYbCP5u4/KHSR162290J6Ix1eaPMSPT6jNQvBgeIcUTkPrlIoblkelVNJ74IlmNzeNJ
 lWOT2LB37sxM8TaL5mOf0t4q8MRkuUHwKGOeNsPvORrsix4xqHlPnVsXmrErBOxwKVYb
 R9wpNd14geEZQmVdRrBFEeTVs0zCCu0yB44EzkVB4T+eplLfq30cJ67aH1558UlPCESc
 M+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765407729; x=1766012529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=graSxLU2u8uUk/6cgxh2vboHqjeGyiVPf8xTMZA3YFM=;
 b=UCzpRmsTvI0WU0wskGmyZXP8CsSAE/dw7e98646o0ktEhlOehW2dyYbZ/8VFvGV7j3
 Z3Fw/KP4SBZlZhCbsNB42GGW/4HBND8tgPF8Jyi4SVg5BdZFCy0cz4cr0yrTcPzuSjgd
 JRmTjD6akynZtRkZjA7a4lX5PkjDL2NkFipoJM4w73Xlrri+W+8WdWypM7UMXDDOUqXJ
 H2xNI24Lfo2jAu7xy39xi86iaMInhzLH3qP+NqDpNWZ7mkDpT3q7xL8a7/1Iqp2t0smL
 lVM/63JGRAA/WyF+Aa7VBkj4pGjQ81mEDwbm6yWAB8a5vgDcR5EEjHOt99p9KxipL75/
 Njww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtLU/beRNp6oVsjE5QrEvB/wl93VHudEEPZVi9xRM9VvEi+/OwjwOk7xtdFhVBiHe5Pt2Yv+nbPg==@nongnu.org
X-Gm-Message-State: AOJu0YzTmAveOvY5vEWLxA7yG7Sufcayh4qZtNmPYrFgCCqxM7lTH2nL
 v7oVi8szh1v39W+4Wtof/otZ6ObNVVLbvAr0r052k/16G6Nmgv02wpjEVISHeB+eP6Jvs+l6piU
 2yTDBr331WSrWeFAWua9sSS4ZbuRfHKz15L7mlUAE
X-Gm-Gg: ASbGncuHexC41T2mZXshTq3UBxuysnMUco+6dHN7PhajG2+gjten7jf7PI8QtYnj4J/
 ujmilKtRJMW9kRzJ86HmCvFKtkAdLRhB6FszFuRpijsKhtjCcGGZ8+Gpo8ttddLBRpyLG0wwHFM
 sUGrVvP8n8TPnLlEcaDDyIVt+LsJXUCSuFSlThqzz3LoAkuOi7yrOdItdIjNfX4EauFGA8pJr4s
 sWD3F9k/2YbmGDTDrxsQhcCWLdCpolJPvgJPOXSevEzMuHHK2Yu2Rsdc56tg1pgyLRYFjNMY9Zv
 2tIwTiF17egdutTXKr7mGhhxoYfWr1Hn+ndC+Ns=
X-Google-Smtp-Source: AGHT+IElrDGMysVGYBUj+khyUpknuJOJieGLf28G45kAq7pEztaUWpv2kH+/vF2x72wIYRUo44BvaSFFk7D2OkJw6i0=
X-Received: by 2002:a05:622a:1b91:b0:4e8:aa24:80ec with SMTP id
 d75a77b69052e-4f1bd93b536mr3772421cf.14.1765407728366; Wed, 10 Dec 2025
 15:02:08 -0800 (PST)
MIME-Version: 1.0
References: <20251208074436.1871180-1-kane_chen@aspeedtech.com>
In-Reply-To: <20251208074436.1871180-1-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Wed, 10 Dec 2025 15:01:56 -0800
X-Gm-Features: AQt7F2rKyxt4pyc6vM2yEb8C0v7IvVC4nyxiR5ARJVmMDxNs4-E3fr4dj97dub0
Message-ID: <CA+QoejW4vx7U-QYBK6GY10NpwXyQFe92j9M=OeURWz_D5vBbUw@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] hw/arm/aspeed: AST1700 LTPI support and device
 hookups
To: Kane Chen <kane_chen@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, Dec 7, 2025 at 11:45=E2=80=AFPM Kane Chen via <qemu-devel@nongnu.or=
g> wrote:
>
> From: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> Hi all,
>
> LTPI (LVDS Tunneling Protocol & Interface) is defined in the OCP DC-SCM
> 2.0 specification (see Figure 2):
> https://www.opencompute.org/documents/ocp-dc-scm-2-0-ltpi-ver-1-0-pdf
>
> LTPI provides a protocol and physical interface for tunneling various
> low-speed signals between the Host Processor Module (HPM) and the
> Satellite Controller Module (SCM). In Figure 2 of the specification,
> the AST27x0 SoC (left) integrates two LTPI controllers, allowing it to
> connect to up to two AST1700 boards. On the other side, the AST1700
> consolidates HPM FPGA functions and multiple peripheral interfaces
> (GPIO, UART, I2C, I3C, etc.) onto a single board.
>
> Because the AST1700 exposes additional I/O interfaces (GPIO, I2C, I3C,
> and others), it acts as an I/O expander. Once connected over LTPI,
> the AST27x0 can control additional downstream devices through this link.
>
> This patch series is based on the SGPIO changes:
> https://lore.kernel.org/qemu-devel/20251106-aspeed-sgpio-v1-0-b026093716f=
a@google.com/
>
> It introduces a basic LTPI controller model and wires it into the
> AST27x0 SoC. The series also adds the AST1700-specific LTPI expander
> device and incrementally connects common peripherals on the AST1700
> model. For the I3C block, which may cause kernel crashes, its MMIO
> region is modeled as an unimplemented device to reserve address space
> and make the missing functionality explicit, ensuring stable guest
> probing.
>
> In the official release images, the AST1700 functions are not included
> by default. To test the AST1700-related functionality, please include
> the following DTS files for probing:
> https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v6.6/arch/arm6=
4/boot/dts/aspeed/aspeed-ltpi0.dtsi
> https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v6.6/arch/arm6=
4/boot/dts/aspeed/aspeed-ltpi1.dtsi
>
> After including these DTS files in the BMC image, you can verify LTPI
> functionality using the following scenarios:
>
> 1. In U-Boot:
>    Run the ltpi command to trigger the LTPI connection and display the
>    current connection status.
> 2. In BMC Linux:
>    Run i2cdetect -y <16-38> to scan and test the I2C buses exposed by
>    the AST1700.
>
> Any feedback or suggestions are appreciated!
>
> Kane
>

I left some nit-picky notes on some of the patches, but after fixing
patch 03 everything else seems good. FWIW I brought the whole patchset
into our branch and not only does everything compile properly, but I
can also see and interact with the i2c buses from the AST1700 in our
internal platforms. Will wait for v4 to add the reviewed and tested
tags, but LGTM!

> ---
>
> ChangeLog
> ---------
> v3:
> - Add PWM model
> - Integrate the SGPIO model
> - Fix I2C test case failure
> - Refine code structure
>
> v2:
> - Separate the AST1700 model into a standalone implementation
> - Refine the mechanism for assigning the AST1700 board number
>
> v1:
> - Initial version
> ---
>
> Kane-Chen-AS (18):
>   hw/misc: Add LTPI controller
>   hw/arm/aspeed: Attach LTPI controller to AST27X0 platform
>   hw/misc: Add basic Aspeed PWM model
>   hw/arm/aspeed: Add AST1700 LTPI expander device model
>   hw/arm/aspeed: Integrate AST1700 device into AST27X0
>   hw/arm/aspeed: Integrate interrupt controller for AST1700
>   hw/arm/aspeed: Attach LTPI controller to AST1700 model
>   hw/arm/aspeed: Attach UART device to AST1700 model
>   hw/arm/aspeed: Attach SRAM device to AST1700 model
>   hw/arm/aspeed: Attach SPI device to AST1700 model
>   hw/arm/aspeed: Attach ADC device to AST1700 model
>   hw/arm/aspeed: Attach SCU device to AST1700 model
>   hw/arm/aspeed: Attach GPIO device to AST1700 model
>   hw/arm/aspeed: attach I2C device to AST1700 model
>   hw/arm/aspeed: Attach WDT device to AST1700 model
>   hw/arm/aspeed: Attach PWM device to AST1700 model
>   hw/arm/aspeed: Attach SGPIOM device to AST1700 model
>   hw/arm/aspeed: Model AST1700 I3C block as unimplemented device
>
>  include/hw/arm/aspeed_ast1700.h |  53 +++++++
>  include/hw/arm/aspeed_soc.h     |  25 ++-
>  include/hw/i2c/aspeed_i2c.h     |   1 +
>  include/hw/intc/aspeed_intc.h   |   2 +
>  include/hw/misc/aspeed_ltpi.h   |  32 ++++
>  include/hw/misc/aspeed_pwm.h    |  31 ++++
>  hw/arm/aspeed_ast1700.c         | 269 ++++++++++++++++++++++++++++++++
>  hw/arm/aspeed_ast27x0.c         | 163 +++++++++++++++++--
>  hw/i2c/aspeed_i2c.c             |  19 ++-
>  hw/intc/aspeed_intc.c           |  60 +++++++
>  hw/misc/aspeed_ltpi.c           | 194 +++++++++++++++++++++++
>  hw/misc/aspeed_pwm.c            | 121 ++++++++++++++
>  hw/arm/meson.build              |   1 +
>  hw/misc/meson.build             |   2 +
>  hw/misc/trace-events            |   4 +
>  15 files changed, 957 insertions(+), 20 deletions(-)
>  create mode 100644 include/hw/arm/aspeed_ast1700.h
>  create mode 100644 include/hw/misc/aspeed_ltpi.h
>  create mode 100644 include/hw/misc/aspeed_pwm.h
>  create mode 100644 hw/arm/aspeed_ast1700.c
>  create mode 100644 hw/misc/aspeed_ltpi.c
>  create mode 100644 hw/misc/aspeed_pwm.c
>
> --
> 2.43.0
>
>

