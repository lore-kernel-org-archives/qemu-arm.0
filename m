Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp604977lfg;
        Tue, 17 Aug 2021 08:06:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFBpLeyaEGEvA4fP47XGANLkwtowqjHWFrdsjlviIDCUIjVtHyDjiGT3fEleA8HYwiFn+5
X-Received: by 2002:a05:6102:c8d:: with SMTP id f13mr3248933vst.60.1629212784055;
        Tue, 17 Aug 2021 08:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629212784; cv=none;
        d=google.com; s=arc-20160816;
        b=VpRPDliNoE+UpvGu0UdF9r8CIXclIIldRr0aVvj+HMoXQhP6iXgzqg6O4nWFifC7st
         uHBTRRrWP9f3NDuUMhfABxCsQPd1t3tKPqBdv04G9OE+ll4XMpm2zCd2O4M7UKLOncoc
         b1Ugal7PrNV4vM5CdXH64+1uULHMHjg6I58hUTO7rdhMYkzNVabS922hTTNMInG8IywB
         w5XpE/yYtAV2+Dtg0fUs9iFh2e515hzKdMTQPSoS3WPSg6/mChTh0rjjbY+il1ponYUT
         1pFdXchjFc69KQDIjUHeXxo61HNB8G+yHTMDZSQTBb7e8kHn/rJ5Oemx4yBCTb4Sm4DV
         fxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vnpoUFq1kTgulr9r7KfvCZKE+mFM6mtw3vNqAYdnHzs=;
        b=qxJBXrwI47wTiIt9N5ZYKK92Qkmjo0Vxu5zSvW7IwEbHLmZKfK45CNnaZYdh45lwdK
         EB7/dsf6GzD2Ofikfg46XJE8tGU0VSv2b5+V70TflykebWNrY3xi2C+Hca8um5F1yg/u
         Rp+gXS2OgF708K2HOBEYvvZwsNLrturgsemcALIJ0m2scCcVQdVdOVNJhX9csJ/CKIcv
         +TYvgWZaBwakspdzh1KTYFJUUnxfMbf1QcqsPYeiBctb7BRc88I/oS2r9YKy0RTazAph
         FOdQWPYN2DllWfuEObMT+fNPfgnUlrEvoyGnwUWaKeAEZGeBhQmz6x6xujtS9tl7Higx
         bbug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qIGyUrgw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j26si1296029vki.89.2021.08.17.08.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 08:06:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qIGyUrgw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG0fX-0005zH-8T
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 11:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mG0f3-0005yC-GW; Tue, 17 Aug 2021 11:05:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:54272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mG0f0-0002wT-9F; Tue, 17 Aug 2021 11:05:51 -0400
Received: from [192.168.15.170] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 1974121A87;
 Tue, 17 Aug 2021 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1629212746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vnpoUFq1kTgulr9r7KfvCZKE+mFM6mtw3vNqAYdnHzs=;
 b=qIGyUrgwTMYvHahHhdwZOPu2AqTm8w43FxuOKWjkimczmJmqOTC4u7Ulfm29QqXLGca6BN
 IsXu3bwWmcOs1X2m66ADsb+O9XsY880dLPe0BsYrCiWwHRanNusJu4bYDApMZF6cW2wGX+
 1Ksbvfi+C7/Wz8Ow83ehymOAXscKSjY=
Subject: Re: [PATCH for-6.2 20/25] hw/arm/msf2-soc: Wire up refclk
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-21-peter.maydell@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <e4b26f75-0462-8177-77d3-da1b32373481@greensocs.com>
Date: Tue, 17 Aug 2021 17:05:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ain+NAtk76j1



On 8/12/21 11:33 AM, Peter Maydell wrote:
> Wire up the refclk for the msf2 SoC.  This SoC runs the refclk at a
> frequency which is programmably either /4, /8, /16 or /32 of the main
> CPU clock.  We don't currently model the register which allows the
> guest to set the divisor, so implement the refclk as a fixed /32 of
> the CPU clock (which is the value of the divisor at reset).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
