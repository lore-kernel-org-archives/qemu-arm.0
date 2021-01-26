Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp1797549lfd;
        Tue, 26 Jan 2021 15:47:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2/wXwyikhvceeoRf4pcio/Jc0CTGmqRFBNnFH7FzD+EharhlcOh9ZOJhjru82bKOXej9x
X-Received: by 2002:a25:2483:: with SMTP id k125mr11528953ybk.108.1611704866115;
        Tue, 26 Jan 2021 15:47:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611704866; cv=none;
        d=google.com; s=arc-20160816;
        b=TqcAPU3OOVLtYRdL1iPC7CCxaicCLb6/JMHd9PqQv7DfnJt0ea8GTCn7x5oAbWC7BW
         w1Ji9RWdKhn3v5GlBhMusM608ds85YqZbJio5VmI9Wpr+cQTo/P+jowJ6r68WszfKmq+
         ldI4YasZUiYyhLpoysKZ2l+lwlb9YoFOaPx8y+HX5r3RPSAn/PmVYyi4wdDyrT4KNa5o
         33Tz7zhwIWvzZ7KROA4dp9/oSQLimpFVy5ybv6gt/XjFoHq3cP+4l6eFHIC0c6BcFk5n
         xtuM+H4ins1y+Kc9SwpqDTewSVyziyM13C1sZK9+koOJXRHoGBxVVINgN4RleipgzGpJ
         7EDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=Z524uCdNJiuexUgo/lddzxbYC+CDUPtG+5QwreV1/oU=;
        b=JAv5iTa7T9Iq+i+oOE3nwztynHPFSfg9RmXxbRm8jWfIh1nkEAAqu/1KN4fooGsFzx
         bJKyajS1emgPrhp2sZWmJCc7rcH/IwSjwRwOQ+veqRRakVi5pj4k5rmEMuRyNb3RK3Q+
         sGjA0CFk2BVv8SBi+ekpGU04SKTMvx0dNEArf9dNswQEDH7byFzjVzp0FAMFWiSZBICc
         39qww4YQofwX99wypPNp/NR6Cdp3QJMWrkRDJG9pTfmpHE3HM+lqGi6Q993qMCNGI7mZ
         Gy9n2+7xnXKhX8Hs98cr1kuwMqYffSI1q7Hpu1mrrqqYSu08hnAnvEPOT+MBhOMc2ACv
         RcKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="aDz3Kp/1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s46si86922ybi.461.2021.01.26.15.47.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Jan 2021 15:47:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="aDz3Kp/1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4Y3l-0003rK-Gb
	for alex.bennee@linaro.org; Tue, 26 Jan 2021 18:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1l4Y3X-0003qy-08; Tue, 26 Jan 2021 18:47:31 -0500
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:40629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1l4Y3V-0006Zg-Im; Tue, 26 Jan 2021 18:47:30 -0500
Received: by mail-oo1-xc29.google.com with SMTP id v19so95277ooj.7;
 Tue, 26 Jan 2021 15:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z524uCdNJiuexUgo/lddzxbYC+CDUPtG+5QwreV1/oU=;
 b=aDz3Kp/1Wu09WRxDHHaCAP/9c60Cc4GD4Td3s9sVSLqg12IttLhytBIdBxSINEv67w
 vsNl0mmss/tcpoR9/Q73AuRyCDHFSCPekN6sCMR+9KUOWJng22f7iyDFI7z5itYRJumU
 DV7UWWjCsSR/DYzZOKV9MkJD0CcRFyHnVH/GzK0uFFIHwr7rhAh8LQNXVVFr1GIX4WAW
 NPkMVqt2UmB8vYAEhTW7IGRnjp8XenWQ0IZavL/hVmcH1GwkmY2r0NKMPn2id979mpPG
 +EPqG69rIX9iZ0AD4OzfJTWPKYEJgtZO43jfoDVZ5MSbKCvPN5E5XhTAffNfJURMWHmk
 epzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=Z524uCdNJiuexUgo/lddzxbYC+CDUPtG+5QwreV1/oU=;
 b=HVuSxmuuH/NCOPyox6yBxiz03B+zTPFIT4eofyq4ptbuGgCqd0Plc4irgbp9sZpkQF
 0wpKIyXIPv7SO2V8ZrXz77PIfx8AVTvdzraSg+ydn+h6V8N472Zz8QlEs/w22SDjJkgy
 VRPHNPbZeuvVUnRQUw+aoVaizPLMjRGuMQGHJ2voiiK9ovyhJrEx5IC1U+Fh5H2uHRwx
 rpPgzrVQz2j6ry5HCvE9UZyL2Y8pJIBFME368aFiNoxNyYqCyFuoWNaU5+h+Nh4SORCR
 xQFnc6nZrCPz9tpyvQ/XNCsPOOPZ/WZKMbDm3ic6WlVSMsQeOp4zCmhw2ODhkb8q6mY+
 Jy4g==
X-Gm-Message-State: AOAM5315Ln4MifKiJWDBto/WodhTv0BjV+b/xiFI0iBnn9sXEgsHHxen
 PteywsyGNFNm9vVQ8VltPg==
X-Received: by 2002:a05:6820:255:: with SMTP id
 b21mr5742153ooe.0.1611704847954; 
 Tue, 26 Jan 2021 15:47:27 -0800 (PST)
Received: from serve.minyard.net ([47.184.170.156])
 by smtp.gmail.com with ESMTPSA id m9sm94611oih.35.2021.01.26.15.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 15:47:26 -0800 (PST)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:2d17:e42b:3add:fd])
 by serve.minyard.net (Postfix) with ESMTPSA id F34401801B2;
 Tue, 26 Jan 2021 23:47:25 +0000 (UTC)
Date: Tue, 26 Jan 2021 17:47:24 -0600
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 6/6] hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode
Message-ID: <20210126234724.GC2057975@minyard.net>
References: <20210126193237.1534208-1-wuhaotsh@google.com>
 <20210126193237.1534208-7-wuhaotsh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126193237.1534208-7-wuhaotsh@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=tcminyard@gmail.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: necDFIk8hmLX

On Tue, Jan 26, 2021 at 11:32:37AM -0800, wuhaotsh--- via wrote:
> +
> +static void npcm7xx_smbus_read_byte_fifo(NPCM7xxSMBusState *s)
> +{
> +    uint8_t received_bytes = NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts);
> +
> +    if (received_bytes == 0) {
> +        npcm7xx_smbus_recv_fifo(s);
> +        return;
> +    }
> +
> +    s->sda = s->rx_fifo[s->rx_cur];
> +    s->rx_cur = (s->rx_cur + 1u) % NPCM7XX_SMBUS_FIFO_SIZE;
> +    --s->rxf_sts;

This open-coded decrement seems a little risky.  Are you sure in every
case that s->rxf_sts > 0?  There's no way what's running in the VM can
game this and cause a buffer overrun?  One caller to this function seems
to protect against this, and another does not.

Other than this, I didn't see any issues with this patch.

-corey
