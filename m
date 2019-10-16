Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7610930wrm;
        Wed, 16 Oct 2019 13:16:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5wrWSeWT0usPhjf68RD7Y8wMzB0n8zEKPUB+408RBL81tbhn6tvNy6WqZxxZRXrkrEs+N
X-Received: by 2002:a37:6f06:: with SMTP id k6mr25651325qkc.141.1571256980398;
        Wed, 16 Oct 2019 13:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571256980; cv=none;
        d=google.com; s=arc-20160816;
        b=MzEp6XvLwW0rxrAIOr2/TXud0gllc5sVZK2x371VP8v6bHF9T8InA5xNAgDD8TUzTf
         o4EDGhAMIKLFC+5/YbwDU1FwEtTG+C2vRdFINhDRTdk+abKCKxfrdiAxLByiQQfaiyMc
         n3CmlwRA390RnlzJPthe8Umv5GKsqdyebRghJpNYEpkGGhscOflXzlTWJJhQeBKjuNlj
         66ATJQ+dowKMplHVtcCsj70WIM6qlFvWVpFzJ0AS0bSP2tT+XD9gnvIFjEZlpULdMKpa
         FK2po1lhEVGoj2hRq2l2IPkf1e/UEtUy6wziy0x3nze64uWTtF4Fz7P/lTUuSthFP69Q
         mMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=xeAM3tzrTC7v2YkxJAGMQw0xiqRGFFmxZAz1nNNQh08=;
        b=CcEEPSzjUUmZHdi2el1e/cOymtg+KwZcnORs+bW5cRO97GFVzNVVtIZIJcFUOMtnrP
         bDnlMSxzjOBCi5RkcELvNk2lfvf44hXEFW0yLY2N9xK0Dt9Ga67W4XU5ax6ZxAE4nl0q
         dGaNh2DBvv+Glx+UXitI++Sw3jUOHrYJ3MRU6IogW/BttqJggFIuiokK0NiIfLtzg4xa
         FmWMrrixFxTP5ZLFTcKFAWPIRzpmkyIBbzeFmR6XRk588OpmiifEOLg5myrF3x3dtu9v
         xDEjjsqA6m+Br2+m4GL1X6xrAMUPgFBLsjkiSIjNbIXiIY/exAru//sCuTBs4r4JQcEp
         mpCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx11si39162qvb.25.2019.10.16.13.16.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 13:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:47786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKpiV-0000Jc-1x
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 16:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jae.hyun.yoo@linux.intel.com>) id 1iKoZd-0002V3-7B
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 15:03:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jae.hyun.yoo@linux.intel.com>) id 1iKoZZ-0006tU-C9
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 15:03:03 -0400
Received: from mga18.intel.com ([134.134.136.126]:17053)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jae.hyun.yoo@linux.intel.com>)
 id 1iKoZU-0006o2-Us; Wed, 16 Oct 2019 15:02:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 12:02:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,304,1566889200"; d="scan'208";a="186243015"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga007.jf.intel.com with ESMTP; 16 Oct 2019 12:02:49 -0700
Subject: Re: [PATCH 1/5] aspeed/i2c: Add support for pool buffer transfers
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20191016085035.12136-1-clg@kaod.org>
 <20191016085035.12136-2-clg@kaod.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <03475e1b-84c3-f5d1-ac23-81365ea150b9@linux.intel.com>
Date: Wed, 16 Oct 2019 12:02:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016085035.12136-2-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
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
X-TUID: Ro8l12pRUc/O

On 10/16/2019 1:50 AM, Cédric Le Goater wrote:
> The Aspeed I2C controller can operate in different transfer modes :
> 
>    - Byte Buffer mode, using a dedicated register to transfer a
>      byte. This is what the model supports today.
> 
>    - Pool Buffer mode, using an internal SRAM to transfer multiple
>      bytes in the same command sequence.
> 
> Each SoC has different SRAM characteristics. On the AST2400, 2048
> bytes of SRAM are available at offset 0x800 of the controller AHB
> window. The pool buffer can be configured from 1 to 256 bytes per bus.
> 
> On the AST2500, the SRAM is at offset 0x200 and the pool buffer is of
> 16 bytes per bus.
> 
> On the AST2600, the SRAM is at offset 0xC00 and the pool buffer is of
> 32 bytes per bus. It can be splitted in two for TX and RX but the
> current model does not add support for it as it it unused by known
> drivers.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Tested-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
