Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7611391wrm;
        Wed, 16 Oct 2019 13:16:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYnzB7bUegUzEUk1bWoUmTJ6WfzePHphgWFITeQacPqoqVJwkHI76RtoU/86Osc1n67HjE
X-Received: by 2002:a37:8806:: with SMTP id k6mr42123645qkd.127.1571257002688;
        Wed, 16 Oct 2019 13:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571257002; cv=none;
        d=google.com; s=arc-20160816;
        b=pelCQsiSWND6ImJAP2+MvDTj6SirS0U55vOE/4JUzi074WEDW8YZ2GRFGfDIFEDCBy
         53RXsQHmhWLrsRkRnzGGK0bTHk/k5fBXpVqrZPcJDt/CFM62ODzrMQz/eBwja23JO4F3
         TPwzP3LjpUyf9T0q0l5ig8vOEznpggOMv1IDh6izYcGkZ5uYq+qulqQ65ShYGEaBPV9K
         RIMnhJenm4NYlX2yfPH+jLcOiRmuVYTmzoL11nlyqejbo77/30haazOOE0ARcNPn31t7
         6tGZXS/OslzuourXn4JxZbprfUcyCosTnmq6BkjyOGvTcqUL6mjkMtziVDJ8sQoryEXY
         pNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=mr12D7xLDu3n0MTAoRGERMNnTvPHBrOTpIZQ1ycFtJ0=;
        b=F+vO2pg0Xx7m9pVsNiPwA5PtdGa8WkeZcVkS93COqoY5oYD5/5V/c1mpBb28TJFiMk
         MXSbXuie59A8Yq8u8QrDswlkoW2RA51ugBCIHLmbMOy5L5wrx+kDwuqkBwTb57ANWX4s
         uPoGRXmk3TCPxs3MGMkQl4cvzrzB6By57h0AovzFE+e+cJamVC+sfsg0Lgal9QDgwe5m
         WWeAcJanHvHmr+o40MqhI9lwToP7UdCvlTKrLYgowxWIqy/ZqK9MFay3oOd/wzWII50S
         KZozLKiF+LzyRIu82E7S0FsUA+oQhnxHk+BIEkufBCqRwpptj65pnxlK63Gl53w70P1j
         gvcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si2915459qkl.322.2019.10.16.13.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 13:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:47804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKpir-0000nx-ME
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 16:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58696)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jae.hyun.yoo@linux.intel.com>) id 1iKoaZ-0003Bo-65
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 15:04:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jae.hyun.yoo@linux.intel.com>) id 1iKoaY-00081K-9I
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 15:04:03 -0400
Received: from mga02.intel.com ([134.134.136.20]:51555)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jae.hyun.yoo@linux.intel.com>)
 id 1iKoaV-0007n8-M4; Wed, 16 Oct 2019 15:03:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 12:03:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,304,1566889200"; d="scan'208";a="186243322"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga007.jf.intel.com with ESMTP; 16 Oct 2019 12:03:58 -0700
Subject: Re: [PATCH 4/5] aspeed/i2c: Add support for DMA transfers
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20191016085035.12136-1-clg@kaod.org>
 <20191016085035.12136-5-clg@kaod.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <5ab94f78-9b67-8d70-9cca-0bdf8961aa2f@linux.intel.com>
Date: Wed, 16 Oct 2019 12:03:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016085035.12136-5-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
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
X-TUID: B7KDjdySgTEd

On 10/16/2019 1:50 AM, Cédric Le Goater wrote:
> The I2C controller of the Aspeed AST2500 and AST2600 SoCs supports DMA
> transfers to and from DRAM.
> 
> A pair of registers defines the buffer address and the length of the
> DMA transfer. The address should be aligned on 4 bytes and the maximum
> length should not exceed 4K. The receive or transmit DMA transfer can
> then be initiated with specific bits in the Command/Status register of
> the controller.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Tested-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
