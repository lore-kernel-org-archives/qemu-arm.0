Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp2746832ejb;
        Tue, 25 Jul 2023 09:51:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFUJg1fSK1l28ml7QO66tHTHx4nOlE2D4dWChe/yFggAfjfxSyX8n+wctdBMG2JDAwl00Xj
X-Received: by 2002:a05:620a:4081:b0:767:6a23:bd3f with SMTP id f1-20020a05620a408100b007676a23bd3fmr4560551qko.12.1690303868390;
        Tue, 25 Jul 2023 09:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690303868; cv=none;
        d=google.com; s=arc-20160816;
        b=Ql5gnPK7aNWpLDuCej24eX/TdqqTPtcPpkHa018hLRR9OikqR8z61pCuG9jjL3V7o/
         JUns6CHXb4k8MNG7uN88Vuvyy0LMQPdMGrfyI+m6NHetLOgHb9EGL+kQlQqSnS09tPBd
         bl5ZNRlctd/XNpxhDPidPsmmuveQEjm+6aRuOteoFWivdeSxIPMf9AYo+f01ADrEOUv6
         bTawvXbf8VK5epeySVY3/Z2U/WyBLh1tZ/9MLWe6fC45gXloCo6xvqVUVopb1Ps7NqgH
         /phSLdXlFjaXxoV0Z81CRkSkr2smAUQ0QO9LKqTnFzcOKxnnq+eg2L436PiSo1AQDJPp
         s1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=UupfCeLlOPr89U4fvrUq1hDfHjr6/3EmNi9g/vK4Vt4=;
        fh=DkG+ttxLHkcAg3VOj5E08kJzyGu+8iD4VY1SDaQScCw=;
        b=B28wQXc8YlCyVPN3PW3B2l7UCY4rBILgGk6LsG9skgPmANbiSe7gvoqWK9mJBfC+3C
         qf31SAqdAOem1EhVzdkYcMEPFfw3z2PIA8hkkQODII4zfRjjv7GSELsKYC81m9Gj8itI
         czh7E1KOyUBbCjo94lAonmD1yb8UJO9RLH5We+MYRGxwe2P1S2ss/iNzOJFo+2+wdLDA
         WW15ZVF/frFvSoahnQovz1nWYzi+G6vLCy+r4DjEXjdg6E1LFAPT3RzX3VUS2zaARFQH
         8HckfajoqRQ778qukPDRuldBeg5xKUIdEuAQRBLbU4cFlPSAf8g/Vk5S23uelZHX+gH6
         mcsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=gH9YLatV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o188-20020a375ac5000000b00767ce3a4516si6559006qkb.105.2023.07.25.09.51.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 09:51:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=gH9YLatV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOLFL-0000fK-7M; Tue, 25 Jul 2023 12:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qOLFJ-0000eu-Fq
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 12:50:49 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qOLFI-0001JL-0y
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 12:50:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bbc2e1c6b2so3955795ad.3
 for <qemu-arm@nongnu.org>; Tue, 25 Jul 2023 09:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690303846; x=1690908646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UupfCeLlOPr89U4fvrUq1hDfHjr6/3EmNi9g/vK4Vt4=;
 b=gH9YLatVpoOdgD1crPaqLNzV+tYtmbgMIOHLXnkZFFe68EwzCocbjhskLMgWa67/Pe
 5IPj8gMxfSy6TsMfoaP1PKbwT+QAQxKrSbiz3neEZMqCk+Z2gJJgvWkZ0yOcx9TV55vX
 FeMSpBbI9ogPKl/vb0turq0uXyeAGbOzBBtQ4zVkSMkyK0V/ZocATNs4j7d51PvT+zIn
 9WFJyoSm1wC8uiRx4n5NwKO03t9ff5zuzYQ+lliIVLdmaWE7fHpMULWOOHn0vLy6jYXM
 C2ZJeeT9STFwvlUKia6aOGCdL0Bf03QorjmQYOJJhqNukzp54UcCh5DffX1OqvhqJiA2
 VzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690303846; x=1690908646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UupfCeLlOPr89U4fvrUq1hDfHjr6/3EmNi9g/vK4Vt4=;
 b=UcoUaQz2IBOp/wlY1V9nRtHJ86V+BqU+u6kPFm24tsEHt0ugstduIyVsxE3X+yZyJr
 R0A/lZRwy728co2X06KFUg1DwzqdfKpbNs9ZraLD5ZHd56yqO0HDDRL6gQyeYN/Yf5kJ
 VIr9GCJrKmnsy2wRtFrC9OX7lOjyPAROsRnOZGToPOd59yFk3OGOgcb3tLuwxez+mVo0
 glleaUNRCU+t0mhIFqc/3U3nwPBVFgrsa2mv3mTN/r9ASnMPTA/RF1p7HvDn+MM1ZF4d
 QPGMSDRMaJw2zYdPJwn2CjtC1S6b+GP+aql/ncBbaTvS/twiNBK9GIk/t6FH2/3g/Krb
 USqg==
X-Gm-Message-State: ABy/qLay8J9ioQxezVgRKSEY7xDHLdSOt8R4FENQ0lMVDlSXppiWD2Ry
 BYgCrZcPm/rH+Q91I1kY7gI82g==
X-Received: by 2002:a17:903:2342:b0:1b8:b3f9:58eb with SMTP id
 c2-20020a170903234200b001b8b3f958ebmr13680551plh.31.1690303845959; 
 Tue, 25 Jul 2023 09:50:45 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.25]) by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b001aaecc0b6ffsm11318253plj.160.2023.07.25.09.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 09:50:45 -0700 (PDT)
Date: Tue, 25 Jul 2023 22:20:36 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 01/10] hw/arm/virt-acpi-build.c: Move fw_cfg and virtio
 to common location
Message-ID: <ZL/9XO47yEnaNzyN@sunil-laptop>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-2-sunilvl@ventanamicro.com>
 <20230724171859.212fec62@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724171859.212fec62@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2Xp5NtB00esa

On Mon, Jul 24, 2023 at 05:18:59PM +0200, Igor Mammedov wrote:
> On Wed, 12 Jul 2023 22:09:34 +0530
> Sunil V L <sunilvl@ventanamicro.com> wrote:
> 
> > The functions which add fw_cfg and virtio to DSDT are same for ARM
> > and RISC-V. So, instead of duplicating in RISC-V, move them from
> > hw/arm/virt-acpi-build.c to common aml-build.c.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  hw/acpi/aml-build.c         | 41 ++++++++++++++++++++++++++++++++++++
> >  hw/arm/virt-acpi-build.c    | 42 -------------------------------------
> >  hw/riscv/virt-acpi-build.c  | 16 --------------
> >  include/hw/acpi/aml-build.h |  6 ++++++
> >  4 files changed, 47 insertions(+), 58 deletions(-)
> > 
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> 
> patch looks fine modulo,
> I'd put these into respective device files instead of generic
> aml-build.c which was intended for basic AML primitives
> (it 's got polluted over time with device specific functions
> but that's not the reason to continue doing that).
> 
> Also having those functions along with devices models
> goes along with self enumerating ACPI devices (currently
> it works for x86 PCI/ISA device but there is no reason
> that it can't work with other types as well when
> I get there)
> 
Thanks!, Igor. Let me add them to device specific files as per your
recommendation.

Thanks!
Sunil
