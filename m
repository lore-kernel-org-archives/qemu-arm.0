Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1511293lfj;
        Tue, 3 May 2022 09:01:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmXyK/LuwlcdZG7mxGhaNoBYNLkd3bR6isF0g5q9s3O7GQrufn2Tn/WGfqnWHo8yEC9e6E
X-Received: by 2002:ac8:58c2:0:b0:2f3:acac:21c3 with SMTP id u2-20020ac858c2000000b002f3acac21c3mr5479572qta.507.1651593694145;
        Tue, 03 May 2022 09:01:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651593694; cv=pass;
        d=google.com; s=arc-20160816;
        b=DSDXTyG9KyVihLgYDx71mMjDh9r/942yR721kMCBWR/E1CBMh6t8mdsv2aVAcY4IrU
         A3EezqGvbjyflX3UM07T3gj9PRSHWHpg+qHJ5CKtUgdK5GIeq3LzzhezOhPbXYPR+yde
         Othd2H3rU5amhb+THM35fsj/WFYIGO6dvqC+6/ubw6vorR5V9p+f5kaK6RfON1pJa/AM
         UJjk26r4EuB3+erG8mV7EW3JGRYc4G7RqB6ERwsFW49e5UAHfToDEmgXXv3+Z3ANL76w
         kFJq0Nj2ZPG8bbIRoFY2FqY4zUvuBxgdzYqz2lMQYpctQZQf+n7ZmHV7LLESZyLA2zQ/
         1DmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=yGzFiXmeEUukkbTOA99A2FvWPF7y+NGZgUp6+mewVS4=;
        b=wkKWjcKwrq3MkLyQGmmvQCT86TwR67BaDllgmh/D/wLy9LA00nnUB+tt7sjF4QOmzX
         4psUWn4czwzxWggrVc//ocDxQsjeZ/zO6zFa36bwwSUAcRbvZoer4FueCMpDfp7OQeUn
         Eo8d2htUr56TDlKmNnHhvNJOEDxrvpRjYsZmV59zc5ZQMeyhCrQXbo3p916YUKjkxcU8
         4F7LQHiDWEsSGkD3s5VzArsn7yQSp+DvNhLSIcux4eUb70BK93TfjxZA2SgH7fwA1Mag
         tdI3MlI5gOt7HSs9XULUOuGJXjRi5dIzr542j2D5EyzBdecQ9SC92MUiO5GZY/uiYn1Z
         13mQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=a5PJMu0c;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020ac84e85000000b002f3ad5bf6aesi1574176qtp.37.2022.05.03.09.01.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:01:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=a5PJMu0c;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Received: from localhost ([::1]:34740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nluxx-0005WX-Gp
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nluwi-00053p-5S; Tue, 03 May 2022 12:00:17 -0400
Received: from mail-mw2nam08on20619.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::619]:54809
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nluwg-00023W-Hh; Tue, 03 May 2022 12:00:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gbf2q4JiTpVondUHV9JsPcWhbBzmxKPCf2WOwuyGrMfsYHuCalwZYwPsBvt6TdWbs2zaMdfAI0vG7RK2gPtaBW+cHPQ07LFR7b1ZP/G7eUvoo8Yo8oTU1M93Y0hb9jScY7scjSNIvVVjoD2qp95w8nY4XyqBA1fSY6Z/2v99jtPiQdTx3CWp0IoVo5eoLELVHVxmvDwFrnYrlUHjtIipAwsE+ys403eexKzX72o2Je2AYJHU5JmuU3GbbIL5rDoKlAiiortCafK64KDpIJV1Op8zpifAaq5Oas4/CMvlkm35kSauPh712C70jbJfErE6GtnM+ZIy8Yog5ivSNaT+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGzFiXmeEUukkbTOA99A2FvWPF7y+NGZgUp6+mewVS4=;
 b=H0WmjiVDvwZqsj9kkWHuI1Jm9k2pi11sz8yxWWh1WuS4+iGIGwl7KwD8tuiQ5QLBiNCd9Lcko5tTnt2DCY9Knbx6P+p5QAO7DUW2oI8CdmcPbMdLAa1vK0dH0RdSLl3kM9sRWPQfrn7R1+IPaOyGWuN1dcv2UKzMynVpkr1EW9J8AXUqmjuxlCZB2JMQz2lGjGQKc1Jc11XDdNBMoIO/9RhRNs7f+jXfMLyPfSXADhEC8tNMJtGSWWzp6BXhvWchn6NriakC9hG9hbND6G4VgF0ifmYMUbgqMXcgplcNSPwWRN6TkvV4V+W1kr6LARX+V5OAQ4CGO3YtrqESOQgPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGzFiXmeEUukkbTOA99A2FvWPF7y+NGZgUp6+mewVS4=;
 b=a5PJMu0ctjwBmKIETBOfbrgnycrM+QOlOJ8u4z5OyDdwKNSv8mKy9E4JQU0YpzLCEMIRmGG1kUfoKbiW6FR2+MnOWErGL5/57/VHi27U+0qg8RoaYW7AgXOBnsjZTiqhRe8dbY4QZBoK0FPkT/v949Nm9vkFlQD4/NBoCdqh6v0=
Received: from BN0PR07CA0001.namprd07.prod.outlook.com (2603:10b6:408:141::12)
 by BYAPR02MB4390.namprd02.prod.outlook.com (2603:10b6:a03:5a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Tue, 3 May
 2022 16:00:06 +0000
Received: from BN1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::a9) by BN0PR07CA0001.outlook.office365.com
 (2603:10b6:408:141::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Tue, 3 May 2022 16:00:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT023.mail.protection.outlook.com (10.13.2.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 16:00:06 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 3 May 2022 17:00:05 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 3 May 2022 17:00:05 +0100
Received: from [10.71.119.176] (port=1375 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar.iglesias@xilinx.com>)
 id 1nluwW-00042O-JM; Tue, 03 May 2022 17:00:05 +0100
Date: Tue, 3 May 2022 18:00:03 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: <frederic.konrad@xilinx.com>
CC: <qemu-devel@nongnu.org>, <alistair@alistair23.me>,
 <edgar.iglesias@gmail.com>, <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>, <sai.pavan.boddu@xilinx.com>, <edgari@xilinx.com>,
 <fkonrad@amd.com>
Subject: Re: [PATCH v1 4/4] xlnx-zynqmp: fix the irq mapping for the display
 port and its dma
Message-ID: <YnFRg1V/uo9MPHDY@toto>
References: <20220503152545.1100386-1-fkonrad@xilinx.com>
 <20220503152545.1100386-5-fkonrad@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220503152545.1100386-5-fkonrad@xilinx.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daf30356-f779-4d72-2509-08da2d1dfe02
X-MS-TrafficTypeDiagnostic: BYAPR02MB4390:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB4390645F0AD884C32E7F887FABC09@BYAPR02MB4390.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U1rbqJ7cDgcmkS03E5ykNeFIIg+jo3Quq9G5N6w7LM/ksGMCoKym4Px+4xKbeRRlVq8N7ytRVPs561uYPmBwWmrun0DXEedUh/QZ0G8UAhu1wP3LBhLfpRCiQ2u6yFJJyH7IyEcfAxKqVs/XPyMDDsm2pgfTBQEfr8sM+FLyYSaEdeK3HPuwysATq+vjlGMslH5MZMyBWy1Ra0wMT8Semcki9glBWIWYgbZ+yWiuQpahy99Q4zxUGPNB1QlLH8GhF07/GDZA/NjrQLemp8ss8cOGBIQ2axsrgWEg60C7aL4DoPeqi4tw/gYr6EvNrMMtCgehHpJ67qGSuA0tWI89iIRmoZdYDIHSbeKF/hnEJqLtqzNlsXwdwuk7noFNjAGAoE3Z3KfdmP9qrsCU9S3aZBRCHCM65B+tpdt0bueVWolJnncF1Hvt5Un4vhDvF8ElP4zoky0eiHd/KAYuz3icO/b7iU+ld4WSEs06DGnP9e6/+0zz+/XGMJFi1Xc86Xbno2ynjnbuUZFLTTpPmlymQVyzJsQajJaSz7IpoLVW1HI1R9dRsvDKDgECeOfOb4/VUYPRhWZrDmmQne9RH38YFEcT5KEus7h4dYvMPmOWh0FmABo7HPjnlyJbxa8c2L2tyibSRsWHJMfwH0alW4w2IXJrl7MMAmpaxGOfKTD2VR7LA4xZrV5IJM5EbVJ5UNRQ
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(40470700004)(36840700001)(46966006)(6636002)(9786002)(316002)(8936002)(83380400001)(5660300002)(40460700003)(33716001)(82310400005)(2906002)(36860700001)(7636003)(4326008)(47076005)(8676002)(186003)(6862004)(426003)(336012)(356005)(54906003)(70586007)(70206006)(9686003)(26005)(508600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 16:00:06.3482 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daf30356-f779-4d72-2509-08da2d1dfe02
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4390
Received-SPF: pass client-ip=2a01:111:f400:7e8c::619;
 envelope-from=edgari@xilinx.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ioJPbs48Wwjw

On Tue, May 03, 2022 at 04:25:45PM +0100, frederic.konrad@xilinx.com wrote:
> From: Frederic Konrad <fkonrad@amd.com>
> 
> When the display port has been initially implemented the device driver wasn't
> using interrupts.  Now that the display port driver waits for vblank interrupt
> it has been noticed that the irq mapping is wrong.  So use the value from the
> linux device tree and the ultrascale+ reference manual.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> 
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> ---
>  hw/arm/xlnx-zynqmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 375309e68e..383e177a00 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -60,10 +60,10 @@
>  #define SERDES_SIZE         0x20000
>  
>  #define DP_ADDR             0xfd4a0000
> -#define DP_IRQ              113
> +#define DP_IRQ              0x77
>  
>  #define DPDMA_ADDR          0xfd4c0000
> -#define DPDMA_IRQ           116
> +#define DPDMA_IRQ           0x7a
>  
>  #define APU_ADDR            0xfd5c0000
>  #define APU_IRQ             153
> -- 
> 2.25.1
> 
