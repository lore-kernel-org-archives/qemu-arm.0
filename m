Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp945617lfp;
        Thu, 23 Jan 2020 09:48:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxi0wN6QVCErB1ZrpFXAhvXkDluP7qDETyTSkJm23FoQJKhZAOnLsNBWjbgCq8BF0/YGaFG
X-Received: by 2002:aed:2b02:: with SMTP id p2mr17507390qtd.225.1579801691142;
        Thu, 23 Jan 2020 09:48:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579801691; cv=none;
        d=google.com; s=arc-20160816;
        b=CpjKol08gbNjv/KMfECChuyo/4uUYqswhYxyZuPruHBdq6M5DD9TFRuLHv8pDpjc1x
         M67JlLpY8PEPNNBNCS7k2rPEK3EQFaqMB8ZoCLiKNWA6YZMOFPTj+GoDhnlwsBWidqnd
         2pBNY9clj6+XN9qsY12inNv753qs22SVm2Ty+4WnOfkT1DtAOAFSEfdNdX9af5hKLBGU
         EvwJmIQSn6rn4Vn3ZeMR0ox5ITGvt81rZqL5ox6KZf/dknoBwLL/tNuCDvcgSwAnebUU
         lAQkbtMHSHZk094Uj8QEsdBpCpXeCAQolP8HNzqd6Fjfs/NwXVCmJo3DLkq0m2F0xpfL
         3/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=kFixVKejGKV1lPMIOJMNLN4pBeIgmrEj0dpbcqCDYuE=;
        b=0acml3LX46twEPB+euMXneE10p+ajo42CbcwxSJ+64bo1PXFvhRe3zFPpxZ40cGK2a
         pG8ULbtUBHSJoa7sbSrfhSNu35xNn+PteSgDmhwP4FW1orLdw6wxyKEkrlyYS/7mvjjB
         VN2pWl47j3clG9S6YUasVs7JlCquHKuzPqodP+J4vEqehnj4/M3T2eYX5rFL584Kz9O+
         PJ3hqBua9bAiH1g7pBMoqzJcA5+7LAVrr41I4oSYFF5Sx8/VZ43oGayBZZjm5SR43HIG
         IhCgBRyfy3+QbMMy7ihR/W8ksCeF0CAFjFLUjIPxROrYFDY/6+vHpFYztahPzT8jmvkR
         224A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AduBdj5I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q44si1876722qtb.369.2020.01.23.09.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 09:48:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AduBdj5I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iugaP-0002G0-MD
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 12:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34016)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iudXe-0003tX-T5
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 09:33:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iudXd-0004fx-I4
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 09:33:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35088
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iudXd-0004fc-EP
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 09:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579789984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFixVKejGKV1lPMIOJMNLN4pBeIgmrEj0dpbcqCDYuE=;
 b=AduBdj5ItYxre/rCT28mLFlGOp0KH/8HJWtiY9wzxlCbaJhUnbCp3Jw6d5o58V94iBW2fD
 Q33Tc36jOZN+EwFT0ZXWhLBw0pnwVwVBYdrmjiVfqPW0LpmkKV0DQip86CKdMsR7sIPqqG
 m6WioraqU6vMUvBwugdVmELw4z+OsvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-st08lnKqPNWdVtKyJyL_mw-1; Thu, 23 Jan 2020 09:33:00 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1352DB23;
 Thu, 23 Jan 2020 14:32:58 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAA271001DC0;
 Thu, 23 Jan 2020 14:32:57 +0000 (UTC)
Date: Thu, 23 Jan 2020 15:32:56 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH REPOST v3 13/80] arm/imx25_pdk: drop RAM size fixup
Message-ID: <20200123153256.43256f57@redhat.com>
In-Reply-To: <20200123123907.qa2fyg2iqlzyemmb@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-14-git-send-email-imammedo@redhat.com>
 <20200123123907.qa2fyg2iqlzyemmb@kamzik.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: st08lnKqPNWdVtKyJyL_mw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 jcd@tribudubois.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U3PvthKQaAUd

On Thu, 23 Jan 2020 13:39:07 +0100
Andrew Jones <drjones@redhat.com> wrote:

> On Thu, Jan 23, 2020 at 12:37:38PM +0100, Igor Mammedov wrote:
> > If user provided non-sense RAM size, board will complain and
> > continue running with max RAM size supported.
> > Also RAM is going to be allocated by generic code, so it won't be
> > possible for board to fix things up for user.
> > 
> > Make it error message and exit to force user fix CLI,
> > instead of accepting non-sense CLI values.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > CC: drjones@redhat.com
> > CC: jcd@tribudubois.net
> > CC: peter.maydell@linaro.org
> > CC: qemu-arm@nongnu.org
> > ---
> >  hw/arm/imx25_pdk.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> > index c76fc2b..a2b7b35 100644
> > --- a/hw/arm/imx25_pdk.c
> > +++ b/hw/arm/imx25_pdk.c
> > @@ -78,10 +78,10 @@ static void imx25_pdk_init(MachineState *machine)
> >  
> >      /* We need to initialize our memory */
> >      if (machine->ram_size > (FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE)) {
> > -        warn_report("RAM size " RAM_ADDR_FMT " above max supported, "
> > +        error_report("RAM size " RAM_ADDR_FMT " above max supported, "
> >                      "reduced to %x", machine->ram_size,
> >                      FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE);
> > -        machine->ram_size = FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE;
> > +        exit(EXIT_FAILURE);
> >      }
> >  
> >      memory_region_allocate_system_memory(&s->ram, NULL, "imx25.ram",
> > -- 
> > 2.7.4
> >  
> 
> This would break existing command lines that are happily using the max ram
> size, which is only 512 MB. Yes, those command lines are wrong, but I'm
> not sure we want to flip the warn to an error without machine type
> versioning - which this board doesn't have.

We typically don't do machine type versioning for CLI changes
and in this case it would be plain user error in providing
invalid CLI, so it should be fixed on user's side and not
worked around by QEMU.

It was fine before when board was allocating RAM on its own,
but with RAM initialization moved to generic code it won't be
possible. Hence fixup dropped and warning is converted to error
to let user know that their CLI should be fixed.
 
Board description [1] says that it supports up to 512Mb of RAM max.
1) https://www.nxp.com/design/development-boards/i.mx-evaluation-and-development-boards/i.mx25-product-development-kit:IMX25PDK


> Thanks,
> drew 

