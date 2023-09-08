Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp265429ejb;
        Fri, 8 Sep 2023 01:26:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6msU/KiCX8EO3geV/kU9Q/7apjmmgFq6jbyP3req1VxNIgzItD95AgUjiyXlVv+W1xzA6
X-Received: by 2002:a67:ed96:0:b0:44d:4b34:af92 with SMTP id d22-20020a67ed96000000b0044d4b34af92mr2052436vsp.7.1694161616783;
        Fri, 08 Sep 2023 01:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694161616; cv=none;
        d=google.com; s=arc-20160816;
        b=slxEwTQYpvqKboJsaTYp0tn95Pn+wkmXJH3HvGsvJrsD1xm4pj4b1m6uqO21Rnjxiy
         kcwaHc5RTUQUG49+FaM7icaqX4/lsw6KKb7GgIbqszyXxRy7p+WCt06xBh5Ppuee6KD1
         fX0nvaUJT+MfZxpcQcvO3++XiW5JW4zct9QA8bW5bk0fNuocBjf4EaEiaxxN5H2mXc3J
         THkCtD37kH1jT1m+2/f5mMTMxWp5G4DRIEzoOZNpr7jZsP1GCraFG9VzEQYshYDpoKHI
         FiG0UWfMi1eagCMtxTZKEnMGWVllIuLizxWHMfDfWK1i882RXspPkvi/BeRV7tn652Jm
         bqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=V5/X2dT/eabgv4anSY8VJywbokL1p6wkd2vAGkrDlbM=;
        fh=eqAL1p48CbgKvrX+IM+HLHWb9ZL2eTRoEHkBpSmSZpE=;
        b=hYeNeYXX1krexzvDF0p/HHBWRd/TBEhEfGiSd9WJAH8EjIcZ907xBDl1QyNhsACemJ
         cce4rAxC5xsX2MhxY5XNacxc+Qow5tu74rgSELEJOStaiRt2mGHnR1P9eBVOyR1Ic1ZG
         +GC8kwTGqIJ7zFYSH6UwtAdyKdcSVtBrtkWeOTJq31B9XDkE1J6aE9fbs/pGb+cNaOK+
         GU1E1l++zOlzS/wkYQADSM82OSoUY1N77R8APdVRfg9A7IT8VC9uTWiJPhjm1Prm/aWj
         r8c0ISVTuitLsk5FoOSUPeLOcVtvW9uYU4KaRemwnwW3akl1krKwBRBpRqAxrH5naXeL
         J+7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a0c9a4e000000b0065359e0a4d4si795856qvd.214.2023.09.08.01.26.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 01:26:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qeWoh-0003sp-Vk; Fri, 08 Sep 2023 04:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fJ+a=EY=kaod.org=clg@ozlabs.org>)
 id 1qeWof-0003s1-KQ; Fri, 08 Sep 2023 04:26:13 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fJ+a=EY=kaod.org=clg@ozlabs.org>)
 id 1qeWod-0000f0-2K; Fri, 08 Sep 2023 04:26:13 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rhq221Rwgz4xFR;
 Fri,  8 Sep 2023 18:26:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rhq204HVFz4xFQ;
 Fri,  8 Sep 2023 18:26:00 +1000 (AEST)
Message-ID: <0aaf7b07-faf3-39f7-c310-1eed51a628b2@kaod.org>
Date: Fri, 8 Sep 2023 10:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PULL 00/26] aspeed queue
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
References: <20230901094214.296918-1-clg@kaod.org>
 <be868ef0-cbc3-a380-3307-512857e2a4a2@kaod.org>
 <70e53523-eb9c-669a-1ee6-cdfd08507f8c@tls.msk.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <70e53523-eb9c-669a-1ee6-cdfd08507f8c@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=fJ+a=EY=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-TUID: rYePZ4mq1oO0

On 9/8/23 09:52, Michael Tokarev wrote:
> 08.09.2023 10:09, Cédric Le Goater wrote:
> ..
>>> Hang Yu (3):
>>>        hw/i2c/aspeed: Fix Tx count and Rx size error in buffer pool mode
>>>        hw/i2c/aspeed: Fix TXBUF transmission start position error
>>
>> Michael,
>>
>> I think the two above are candidates for stable.
> 
> Got it.  I've noticed these two in master yesterday, but thought
> i2c/aspeed priority is a bit lower than other stuff, - maybe
> wrongly.

It is not hot material indeed but it does fix support for the
latest Aspeed SDK and a lot people simply use the disto QEMU.

> Picked these two up now.

Thanks, !

C.
