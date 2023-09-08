Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp250433ejb;
        Fri, 8 Sep 2023 00:52:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcCFZtv4I/4GApt8T9heJvoITSMj91PrHkSXBiYF6DNNTsqpFSQVO65WUhHDKaD3+tXuwB
X-Received: by 2002:a05:622a:1353:b0:40f:dd92:5c91 with SMTP id w19-20020a05622a135300b0040fdd925c91mr1944962qtk.37.1694159567178;
        Fri, 08 Sep 2023 00:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694159567; cv=none;
        d=google.com; s=arc-20160816;
        b=Wg7UOh9mPeZw7P9tMTgf2L+soLBwaEVwr8Q/dPmCxdJChKn3n/vo1KiL6kL4GN20XA
         wMTSgp2lYkIopAG/u4ao2gHV+O33Ghhb4mg0MFBGdDXzLVZfgcbmmkFIa3lFGz3Cb/my
         qU9pMP5imOYsA0iiM9DrlQJLC/GLgjdnjcLtaxjJIQaQi3dTs6MA1xFkOARzVjlAOBPh
         UwUBlE60Ge3ORpYz6e+ZAAlNYuSJBNn2EBVhm+UZEshOBNV9ZWes3Gd8YH8ari/6yb4i
         idGcWjnWN33SzZUis7xAifuVRG2aS2O8Urlg26LV3R1WDhOlYbFrEzgCqi4ZYzfPMBP6
         ZN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=YPLrXO7jwYjaGwbcrpMRZqWZU29FxM4AikhZ3UoLgp8=;
        fh=0WGA1m+X7Me1YZnoYNqzFEK5O8jNDV1mmstpeeSnp+0=;
        b=gS4ggF3n9IiMglvpT92E5PyD8dLviFD2vu71h8uzF0yYCpxsiaGQvcAhe8Rq1U3qTZ
         g+eZWL2gdgR7/UHL3QPTiq7e9b+OTmymGjwJ2chXkxlFnU5nCSzRpzldYey4DMUVLVz3
         7bDF3IxicGhdmP3foxIaTbLE9hqBxh2hluWfZmZNsWLl1q0dUkaNhfP6Vn0goafrcgQw
         M3E5YAS+YulhIEZuMnaubTVMslmYTwpNTJxDyOA6bhZHrQxEtwEkPHi3r2jSttOWPL96
         RdLe2iTi6CnGmFRFR9kPfEe6exLsl3FUgv/5MP+LoVzyPOvQv7TA8QVinshUfFo2I0b1
         NoLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020ac85f0c000000b0040f17f1054bsi893527qta.750.2023.09.08.00.52.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 00:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qeWI9-0001EL-Tn; Fri, 08 Sep 2023 03:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qeWI8-0001B2-61; Fri, 08 Sep 2023 03:52:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qeWI5-0006E5-Ob; Fri, 08 Sep 2023 03:52:35 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3063B1FFFB;
 Fri,  8 Sep 2023 10:53:18 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 31EC626847;
 Fri,  8 Sep 2023 10:52:29 +0300 (MSK)
Message-ID: <70e53523-eb9c-669a-1ee6-cdfd08507f8c@tls.msk.ru>
Date: Fri, 8 Sep 2023 10:52:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PULL 00/26] aspeed queue
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
References: <20230901094214.296918-1-clg@kaod.org>
 <be868ef0-cbc3-a380-3307-512857e2a4a2@kaod.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <be868ef0-cbc3-a380-3307-512857e2a4a2@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -83
X-Spam_score: -8.4
X-Spam_bar: --------
X-Spam_report: (-8.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cFG52vHFuiwt

08.09.2023 10:09, Cédric Le Goater wrote:
..
>> Hang Yu (3):
>>        hw/i2c/aspeed: Fix Tx count and Rx size error in buffer pool mode
>>        hw/i2c/aspeed: Fix TXBUF transmission start position error
> 
> Michael,
> 
> I think the two above are candidates for stable.

Got it.  I've noticed these two in master yesterday, but thought
i2c/aspeed priority is a bit lower than other stuff, - maybe
wrongly.

Picked these two up now.

Thank you for making me know!

/mjt
