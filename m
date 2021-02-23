Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp133094lfg;
        Tue, 23 Feb 2021 01:26:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnPNI5BUwIfrvVDjPKUY93F8uVs1XHRfEURP9jiuaHEx15ugC7PZyE9ZYdz64N4JNkeFje
X-Received: by 2002:a25:9a01:: with SMTP id x1mr34441940ybn.185.1614072398295;
        Tue, 23 Feb 2021 01:26:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614072398; cv=none;
        d=google.com; s=arc-20160816;
        b=f19ZdyePF1h38/rhJSkGJyEy3haod9S7sH8atfoQnzPP0CV/Wvd8BmFR205bkFqypG
         lMRXb2DPO6o5vKyoMI4LwsqoElBjQ2m8g4O+c9YDDvJcvc9qluWyztLxj5T0dz+kSWLw
         2+Tj3h+pPpD+jW7kDQgueSXOJPVUe2dQZntX+NCsfEF9Rt1YxUveETDy1IexzGLyVH36
         Xc1qCIQST7QlIvYtM3wIp7Ag4VeAihyDsDvnu+86BsHTJZJuHeK7fpKDcqH3Wwa+nGCy
         xnziuOiM6ufyol88rc7fH+Z4KjkpOoYEPBEZDqDQtjrBFggqONlIiqRlhrEYCEYC25Lp
         m+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=BZEEiZGLkUC4JXUmIjtT0EcG55ILGQxTF2Zgogg5uGM=;
        b=zJRrOB1vpoTbnEu87bgzcnniS+xNimRbqZvtVpQpdlquBT+Cce0nNzWK88aBDVFRJM
         thEvjtFYU9DjV/6XlHeCPH/U83KsN2jO+ifvYW43I/iFcj6d8af9EKgU3d+2zhYKgFTW
         N16lc8rx6xDSUO/GWTOkf6kqIBFI6xec3TyB9Wsvq2fVV7ia9Te4O5O7tG2j5mQL5GeB
         E82hTjqkCBTjM1I5GVTmtz0Cy5KMEVYkWoAW47wQQb+u9sYbIDpuhLBd14X8jDGO8pzL
         q6XZ6gfR6b6ASw2yQRajTmyzp5kcnxg87FsUawIlBl7GnZE4s2F1STGY4ryTxxDo9HD7
         zhuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NEu7efB9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12si21899870ybi.129.2021.02.23.01.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Feb 2021 01:26:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NEu7efB9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lETxl-0004hL-LR
	for alex.bennee@linaro.org; Tue, 23 Feb 2021 04:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lETus-0001Wc-Tk; Tue, 23 Feb 2021 04:23:40 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:46727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lETup-0007zi-1d; Tue, 23 Feb 2021 04:23:38 -0500
Received: by mail-lf1-x12d.google.com with SMTP id v5so10028235lft.13;
 Tue, 23 Feb 2021 01:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BZEEiZGLkUC4JXUmIjtT0EcG55ILGQxTF2Zgogg5uGM=;
 b=NEu7efB93ptQgF/zTMv5kN5vGZSyj4qTI43XfUFEhF6ZepeeyLP54XILVJfpYr1JXB
 4EOJ2kpV1qBY+iQFALsGn+e21a4TFGqHacrRN2yWgqUyeMrERAet8/AlmDspE0cLGfg3
 3Y/uviJdraYRHE6pGMzeda/bR6m/MenT78P4W/ESRMxbOQDJPObjYNn1cPUXeUMBJgFP
 nBbZj9Ru++ZKayW1PCVXjZ4dtxAqa/n7czY3wY/aYHY6q5eS24UiSOx37YDWJw8EWgFU
 ++sskxjkdAyc/7DQQMxASEWNPWGCAcE921JrE5znoDMJQ4qMN0yw1h5xorUTPnV2Cl0Y
 g2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BZEEiZGLkUC4JXUmIjtT0EcG55ILGQxTF2Zgogg5uGM=;
 b=BXkUrFtEtk2T8F7SWQhjWoyHsNns6ukxhbPT//5mqGHKx7vniZHGBRpUa2gJEscukG
 FOFTKrHIvgyfBNnpctwlFPid1sOb6ArEdR/kpRpZJimVkLvUuSlM+26EPSAoAY+vJGBY
 roqlTxRwyKt60Naedx3aSFl/iyItgzhkDeBLFQPaeMxYopuqGbr8cSkYZvvIIQs7LnPC
 VS1IUZSGzazsZWk6TCeU01dDQOYhiqO8UCRd6ezV6R1P/Wy9SjoXJ0THtoL8Nxe1b8k1
 932FpoKHHe3LTwentRHSEVhDvqOvxxhmG1sjzwlGOfqzZURWKWecK40QCWhGQiSr6Q2H
 Gg+w==
X-Gm-Message-State: AOAM533uEVcvp1jsPWV2wS2lcrgG1eKXRcxtW53QJcwKCopK362Mdchl
 7oT6IcBBItqFmX63yHz9cuo=
X-Received: by 2002:a19:7f48:: with SMTP id a69mr16137993lfd.444.1614072211302; 
 Tue, 23 Feb 2021 01:23:31 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id x27sm2473947lfu.151.2021.02.23.01.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 01:23:30 -0800 (PST)
Date: Tue, 23 Feb 2021 10:23:30 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v4 3/5] hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA
 module for QSPI
Message-ID: <20210223092330.GV477672@toto>
References: <20210222130514.2167-1-bmeng.cn@gmail.com>
 <20210222130514.2167-4-bmeng.cn@gmail.com>
 <20210223090144.GS477672@toto>
 <CAEUhbmU5NXZv84ncgP15thonVQgFRfgmMZqfJQtAxjZ7fj9KcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmU5NXZv84ncgP15thonVQgFRfgmMZqfJQtAxjZ7fj9KcQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TKBSF4PmS2oN

On Tue, Feb 23, 2021 at 05:20:36PM +0800, Bin Meng wrote:
> Hi Edgar,
> 
> On Tue, Feb 23, 2021 at 5:01 PM Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> > On Mon, Feb 22, 2021 at 09:05:12PM +0800, Bin Meng wrote:
> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > >
> > > Add a Xilinx CSU DMA module to ZynqMP SoC, and connent the stream
> > > link of GQSPI to CSU DMA.
> > >
> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >
> > > ---
> > >
> > > Changes in v4:
> > > - Rename "csu_dma" to "qspi_dma"
> > >
> > > Changes in v3:
> > > - new patch: xlnx-zynqmp: Add XLNX CSU DMA module
> > >
> > >  include/hw/arm/xlnx-zynqmp.h |  2 ++
> > >  hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++++
> > >  hw/arm/Kconfig               |  1 +
> > >  3 files changed, 17 insertions(+)
> > >
> > > diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> > > index be15cc8814..2edeed911c 100644
> > > --- a/include/hw/arm/xlnx-zynqmp.h
> > > +++ b/include/hw/arm/xlnx-zynqmp.h
> > > @@ -35,6 +35,7 @@
> > >  #include "target/arm/cpu.h"
> > >  #include "qom/object.h"
> > >  #include "net/can_emu.h"
> > > +#include "hw/dma/xlnx_csu_dma.h"
> > >
> > >  #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
> > >  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> > > @@ -108,6 +109,7 @@ struct XlnxZynqMPState {
> > >      XlnxZynqMPRTC rtc;
> > >      XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
> > >      XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
> > > +    XlnxCSUDMA qspi_dma;
> > >
> > >      char *boot_cpu;
> > >      ARMCPU *boot_cpu_ptr;
> > > diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> > > index 49465a2794..30f43dfda2 100644
> > > --- a/hw/arm/xlnx-zynqmp.c
> > > +++ b/hw/arm/xlnx-zynqmp.c
> > > @@ -50,6 +50,7 @@
> > >  #define QSPI_ADDR           0xff0f0000
> > >  #define LQSPI_ADDR          0xc0000000
> > >  #define QSPI_IRQ            15
> > > +#define QSPI_DMA_ADDR       0xff0f0800
> > >
> > >  #define DP_ADDR             0xfd4a0000
> > >  #define DP_IRQ              113
> > > @@ -63,6 +64,8 @@
> > >  #define RTC_ADDR            0xffa60000
> > >  #define RTC_IRQ             26
> > >
> > > +
> > > +
> >
> > These blank lines look un-related, if you remove them, this looks good to me:
> >
> > Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> 
> Thanks for the review.
> 
> A RESEND version was already sent out to the ML before. Sorry for the
> inconvenience.
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20210222131502.3098-4-bmeng.cn@gmail.com/
> 

Ah I see, no worries!

Cheers,
Edgar
