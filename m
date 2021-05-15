Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1501267lfg;
        Sat, 15 May 2021 12:43:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydstM7XPC8Jlz3leddqvHi1SLS2FVBRRucZesDTrQiT4D7G8Eu5amW1XQur8lJ0RpnShcM
X-Received: by 2002:a05:6e02:1c49:: with SMTP id d9mr42328043ilg.95.1621107818496;
        Sat, 15 May 2021 12:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621107818; cv=none;
        d=google.com; s=arc-20160816;
        b=SvGH1SAAGhEyBzixdOEW5y++4nmr/AnFdNrSpyF5PxxMOAuqNGLK6Rir3Fi0IycCVa
         fOn79hSOQYlWzM2B92NCvnKyPDv62wfteYJPqeUvBkMwqJJ+GzpsRn2YFpeAUM6/ZL1W
         g7jNlua496nDtkVxE6GLPd/7BIQWgkBrarGyJzczXjuRnhiC7F5CRYjO3QKqaQTCcurM
         d+VeRKt7FhT32QHVsEbKyVg3aongCPdU1b9TwSZ/uXIMolcL8x/V9vhfvH9+lGYmDrH2
         UH5l5vOJquVY0MZ6uI4lXY0dP1Vd4v7/N5vvyN2wkCp1iZi22VV+NPGo3VmiLWnb9vNF
         HBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:to:from:date;
        bh=av2504PYbgBgGIuvKfQjePvIcYh6QARoRAam1VXOPZA=;
        b=ftuuj4tMDBmyHD5UDdjtJBS5kxTg06w4ddnC7gUAE+IPoMLFpaqriEIWsbcxDdURBy
         ErW1L2wl5lPShNoEhHJztHJzLrnRtJk68hSia9/5Sb9iiuguZ4loBGFGrgSmhQ7eLSrk
         00KIyW1GWguQjsOnUBRoBlcgTNJl6RQd4vIbiICwbBjClD/jHHFncuXzgxiStkU0uJt7
         tCSrC6Pqygo7MmBFoIR2fl7PpDgeKejPvLTgyxC2pbrn1hPo1cugf1ZkoMrgjyMhO4Mg
         2nLEFU1QUWvjhCacMQQhOHpymoYeXvZA+GynApgp01rpoD9aYfdvB16ULayCYgVpNWBK
         Q+jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si10889827ilh.46.2021.05.15.12.43.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 12:43:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1li0CH-0002gr-Rz
	for alex.bennee@linaro.org; Sat, 15 May 2021 15:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li0B5-0000ha-HP; Sat, 15 May 2021 15:42:23 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:53404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li0Az-0000oM-5C; Sat, 15 May 2021 15:42:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BCABE74570E;
 Sat, 15 May 2021 21:42:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9BBEE745709; Sat, 15 May 2021 21:42:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9A79F7456E3;
 Sat, 15 May 2021 21:42:14 +0200 (CEST)
Date: Sat, 15 May 2021 21:42:14 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 10/12] hw/isa/vt82c686: Add missing Kconfig dependencies
 (build error)
In-Reply-To: <20210515173716.358295-11-philmd@redhat.com>
Message-ID: <50a2fbad-72ee-8fd6-e1d5-5687abb1c4b7@eik.bme.hu>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-11-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1641504594-1621107734=:7809"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DBG6ND3jXW6q

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1641504594-1621107734=:7809
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT


On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> The VT82C686 device model misses various dependencies:
>
>  /usr/bin/ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `vt82c686b_realize':
>  hw/isa/vt82c686.c:622: undefined reference to `i8259_init'
>  /usr/bin/ld: hw/isa/vt82c686.c:624: undefined reference to `i8257_dma_init'
>  /usr/bin/ld: hw/isa/vt82c686.c:627: undefined reference to `mc146818_rtc_init'
>
> Add them.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/isa/Kconfig | 3 +++
> 1 file changed, 3 insertions(+)
>
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 55e0003ce40..0703512209a 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -49,6 +49,9 @@ config VT82C686
>     select FDC
>     select USB_UHCI
>     select APM
> +    select I8257
> +    select I8259
> +    select MC146818RTC
>
> config SMC37C669
>     bool
>
--3866299591-1641504594-1621107734=:7809--
