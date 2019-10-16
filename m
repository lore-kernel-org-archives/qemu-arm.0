Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7611065wrm;
        Wed, 16 Oct 2019 13:16:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwP1GtFTxr67tuSF2iEmjuw+rDzXhK0ovWforHVT2b/nPnJYR9B10JTY7FGFTpj7Jhq5Jkn
X-Received: by 2002:a37:6114:: with SMTP id v20mr42544836qkb.339.1571256987439;
        Wed, 16 Oct 2019 13:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571256987; cv=none;
        d=google.com; s=arc-20160816;
        b=FxKjWaUbrYSpxkYqsHmDfJjhI9whE/SNhzdq7vBhR1lF02TQKk72Ck505ytiuZEnSg
         4ARRojU4bVRjSDgHrK2VvZy+mbtFlnRq3POKbXPE3rnllt1FBmzNrqz1zkq0gCGp6Ord
         wzXN+K9GN+uOwWTG1P5CFNeRBaSZuYE5mzEIfzlowQDddKVVH3n9yOfNXznCM1dCdRan
         6y7ymq5N7Y2CcyFDBEvhw7ZVopSLj8DjqUmj3T2J2oVxrHcLwuEmS5YNw5NmPlQN3tl9
         a5+SHpApH4ZaW/meFsjEZaVQxvWdEt+9KyLnvTs73EwHshRcvaHVz9e3pPI1tTR1n6QP
         pbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=3DTBIesrGfsB9Eh6JarxVKwuqA2LTah+ch8x/hzuAHQ=;
        b=KoyxPK5EqAMDv0NqGMxFKYrhEE7Dmd+zEPV3OUs7Yb+lKJBZtwj0YnySzmZHl6manM
         0wB8YgQ9oHGdM+pkt1LeLdppZrxPk56X9uxynsASeI5qn9euT4Bc/AgrfRC/2FyTkBto
         6Vc719dApA3x1p7JuTwAlcnsH6LH9cYWPUr0B41KFM9C6zbNr4yUoA9ug/6/0mLA0lzn
         qllCkN5zmyVzhwbjo5UMFarJ5skGYZ0d58vIqAslq8mRjnhynx2SUNaUlOwP/hj/zA8a
         OPwtI/Lua7ODuHuvem9I2rFMb4FJb4Lo8NjcfPakxf6VJ8G4sztPqf4LxuCUGSoF9pdl
         Daww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21si15846qvg.150.2019.10.16.13.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 13:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:47788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKpic-0000Km-Ma
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 16:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jae.hyun.yoo@linux.intel.com>) id 1iKoa9-0002r4-6M
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 15:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jae.hyun.yoo@linux.intel.com>) id 1iKoa8-0007G2-9E
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 15:03:37 -0400
Received: from mga17.intel.com ([192.55.52.151]:64908)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jae.hyun.yoo@linux.intel.com>)
 id 1iKoa6-0007EY-32; Wed, 16 Oct 2019 15:03:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 12:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,304,1566889200"; d="scan'208";a="186243184"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga007.jf.intel.com with ESMTP; 16 Oct 2019 12:03:32 -0700
Subject: Re: [PATCH 3/5] aspeed: Add a DRAM memory region at the SoC level
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20191016085035.12136-1-clg@kaod.org>
 <20191016085035.12136-4-clg@kaod.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <1a91b017-9ae7-4b6e-2648-91c14f5d6ca1@linux.intel.com>
Date: Wed, 16 Oct 2019 12:03:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016085035.12136-4-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
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
X-TUID: YsZIUKlcMBA1

On 10/16/2019 1:50 AM, Cédric Le Goater wrote:
> Currently, we link the DRAM memory region to the FMC model (for DMAs)
> through a property alias at the SoC level. The I2C model will need a
> similar region for DMA support, add a DRAM region property at the SoC
> level for both model to use.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Tested-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
