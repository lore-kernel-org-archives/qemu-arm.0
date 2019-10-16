Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7611109wrm;
        Wed, 16 Oct 2019 13:16:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKFQ3aE3ROkVZHj49i5eFOvB/x1tZQSiPFXpqlSrGaOpBL02dckYyVbPHw8IcxIRyvy6lP
X-Received: by 2002:ac8:7084:: with SMTP id y4mr47485159qto.146.1571256989338;
        Wed, 16 Oct 2019 13:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571256989; cv=none;
        d=google.com; s=arc-20160816;
        b=XRhohuTAHpGznPVHcTWrtnhIR0S7ZrvapeEIPCQveXH/8dwsk4cmV2CCwrwmkbRmOc
         T3KJ6gIj4cn/CceGdokIAOeQVV+ORlA/uKc73KDpB3w/smi900ORcP71xBwjiVtf26oS
         4rJt+kj0pP7fSlxrh9Pd9uLgiINQ47pqgPTCv1CNX3SRpP0eEgNFo7X6lGWWDUaxWmb8
         yrRrYgBkack5YJTJk01r5tt0L2WZ84lKY5x7xAKyNqT7s+PBp9VlYXQrYeT4j/3uSB5E
         aXgyaqYOtUSkbi0Y+K7T3YeyXeRXUd/yuDTmAhERYRQaCF1c3gOrIEcn5Az9sO26IEI+
         RjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=2BK2X6YbDYeFgGTVKC2cbumeNNFFN8fjs81/wSqKgew=;
        b=k2iaPlDRyub4xw7bGNrpcdjxnVBHCGmSBq/yr4oJ+VP6uZtUmgLYC3sDZBtIf4wx1g
         C/oycsUCKrwDEa69vyPen1rB1BeLzeDFdzHJh4Bk671Pcyfv6QQ5/RAESKjG2roxVsJM
         rgrNaoWOytNH8k1+s1BoEAf0RavbJr59wLyxp8M1LILtM7svpWaZNMP4morYZ0KfSvjj
         kcMgpCYiAtSWOSLZ5QoVeap2Melo/XYKOpqjwFCGI+w5ggvwtHZPBbBLmBZQS9/zaKbU
         wYBfYdVzBLvdWE4kxRCaosiFADV0yu5hqEIAZaHapaIC6F/y3hEZCcGE3/6Y2c4STpFf
         Betg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si645594qkm.55.2019.10.16.13.16.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 13:16:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:47792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKpie-0000Ot-CU
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 16:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58505)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jae.hyun.yoo@linux.intel.com>) id 1iKoZq-0002fq-D9
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 15:03:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jae.hyun.yoo@linux.intel.com>) id 1iKoZo-00072m-II
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 15:03:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:16018)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jae.hyun.yoo@linux.intel.com>)
 id 1iKoZm-00070Z-JH; Wed, 16 Oct 2019 15:03:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 12:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,304,1566889200"; d="scan'208";a="186243085"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga007.jf.intel.com with ESMTP; 16 Oct 2019 12:03:12 -0700
Subject: Re: [PATCH 2/5] aspeed/i2c: Check SRAM enablement on A2500
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20191016085035.12136-1-clg@kaod.org>
 <20191016085035.12136-3-clg@kaod.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <0b406fb7-7699-f577-c77d-92a9f23df895@linux.intel.com>
Date: Wed, 16 Oct 2019 12:03:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016085035.12136-3-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
X-Mailman-Approved-At: Wed, 16 Oct 2019 16:16:04 -0400
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.vnet.ibm.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LN6zyUO3d6YL

On 10/16/2019 1:50 AM, Cédric Le Goater wrote:
> The SRAM must be enabled before using the Buffer Pool mode or the DMA
> mode. This is not required on other SoCs.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Tested-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
