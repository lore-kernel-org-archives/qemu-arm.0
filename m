Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2305235ocg;
        Mon, 10 Oct 2022 03:07:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4fE6P1C1uK23GKOlLRRuT3Yqc7FPWa02/DCAXIRjO4H7EbtkbuZfRSKSXq2qVAjqn5XgKM
X-Received: by 2002:a05:6214:1c81:b0:4af:664c:2913 with SMTP id ib1-20020a0562141c8100b004af664c2913mr13705097qvb.103.1665396447635;
        Mon, 10 Oct 2022 03:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665396447; cv=none;
        d=google.com; s=arc-20160816;
        b=uXE+bCjF2bdFcZ+EaUZ7UborqTQi0YxcAsWV2fofosmCeGMs00k0TsZ8MACTUH+GS8
         eBsR+PdMNkJZhFwlV8UDClumNG/+e/uWYRTOcaUzH/NSSCBtiAK+xLHCa/Ugd0mPUbeC
         Z62Oz3N9+aDBVPRSzwK/b/FVjRLpPuJX/ri2tM6zBALJWcXMymw6ecudg2goF5gsI8+1
         5fnHWAFF13Vi7RhdtI7iQKHrLH7D6UAjEIvJ2UsGb8Et6oBSHxcYmiaLyKlUos1EKSll
         n2vjZqfXsLLpxt0GEVpGi4pvQ1fjy1zErdOoaNuS0j8MIJ2pP7GMVqSvT6k8mLw7jG3f
         iE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :message-id:user-agent:references:in-reply-to:subject:cc:to:from
         :date:mime-version:dkim-signature;
        bh=doS3uktci//JWItlP3nDbv/Su8fLrA6PflNpZRthBjI=;
        b=c1KGDCWoOxbjGMnmGcmzPq65urLuIuh0uNlxypgWu1aoIChFIyh9rR6vUqa2KKSYIu
         FIQrOG66/ycR4NFhZGtbCaXXrf0l4loeTzKz/PB06zV9veA1GCNA4XMQbu07c6WKN199
         3oUZX3Hs9gxzD7z5t5fycoNLH59a+xKSD2bpTgKkutE0tw0o+W8U1Le2jILu9WGnQx9d
         C6S7jfg2B8XmlGFIMnXYCqn9xM/cRTHvYtXwfev9kYjf3S0xlUSrWv6lOWo7TLE4oLFq
         tWtAyPC+aOu1LhEt2ngncYpgNfJUCCMkudislVoc+EoUegKBk0cS2kfXZLmiS4SSLg1A
         KSSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@walle.cc header.s=mail2022082101 header.b=quIS+gph;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=walle.cc
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb12-20020a05622a1f8c00b003986b6be152si3050751qtb.520.2022.10.10.03.07.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 03:07:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@walle.cc header.s=mail2022082101 header.b=quIS+gph;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=walle.cc
Received: from localhost ([::1]:43962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ohph1-00053p-4b
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 06:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>)
 id 1ohpYe-0007u9-5P; Mon, 10 Oct 2022 05:58:48 -0400
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1]:54938 helo=mail.3ffe.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>)
 id 1ohpYb-0008Mm-UI; Mon, 10 Oct 2022 05:58:47 -0400
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 6454734;
 Mon, 10 Oct 2022 11:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1665395920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=doS3uktci//JWItlP3nDbv/Su8fLrA6PflNpZRthBjI=;
 b=quIS+gphPUAgsFpVW0Y4tw9icS9JMGt9rfqvxX9ipjcummvSiV7F6RTA/mY0CaMw1BuENc
 UrsxayrbPJdLdrHfKkj8cDLGyu7z5XZia28byRVkMhCgfqUo9XzsB2DZMd9NwIOvhF9Vw4
 hKqr8aMuwNIXiv+yBUz9VKr7ROPct28bCuK+b8XeIYeXJHwIerN23HSMiX2R5xtWY6ZW0u
 LNogG2/OMf3A1oNCWxvj8kVpsuz38bVPqFye7Kq7UkpsqaFiR3Ts1EGMGXM11qCvtZNMb5
 boBnNYUZ1IYf4ohk9pAtayp9YVY0tn4e7xsnzCupVus3j3TGqhh0KGKFAVe6Hw==
MIME-Version: 1.0
Date: Mon, 10 Oct 2022 11:58:40 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Francisco Iglesias <frasse.iglesias@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>, Iris Chen
 <irischenlj@fb.com>
Subject: Re: [PATCH v3 4/8] m25p80: Add the mx25l25635f SFPD table
In-Reply-To: <6726971b-b862-2959-5e7e-c059be2bb07d@kaod.org>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-5-clg@kaod.org> <20221007144431.GE20384@fralle-msi>
 <6726971b-b862-2959-5e7e-c059be2bb07d@kaod.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d6d2575b520fedb47a5fa7c1031c4ff7@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:c0c:9d57::1;
 envelope-from=michael@walle.cc; helo=mail.3ffe.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gerznIoqfwbx

Am 2022-10-10 08:23, schrieb Cédric Le Goater:
> On 10/7/22 16:44, Francisco Iglesias wrote:

>>> --- a/hw/block/m25p80.c
>>> +++ b/hw/block/m25p80.c
>>> @@ -234,6 +234,8 @@ static const FlashPartInfo known_devices[] = {
>>>       { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
>>>       { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 
>>> 0),
>>>         .sfdp_read = m25p80_sfdp_mx25l25635e },
>>> +    { INFO6("mx25l25635f", 0xc22019,     0xc22019,  64 << 10, 512, 
>>> 0),
>> 
>> I think I'm not seeing the extended id part in the datasheet I've 
>> found so
>> might be that you can switch to just INFO and _ext_id 0 above
> 
> This was added by commit 6bbe036f32dc ("m25p80: Return the JEDEC ID 
> twice for
> mx25l25635e") to fix a real breakage on HW.

 From my experience, the ID has a particular length, at least three bytes
and if you read past that length for some (all?) devices the id bytes 
just
get repeated. I.e. the counter in the device will just wrap to offset 0
again. If you want to emulate the hardware correctly, you would have to
take that into consideration.
But I don't think it's worth it, OTOH there seems to be some broken
software which rely on that (undefined?) behavior.

-michael
