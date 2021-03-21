Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2984318lfg;
        Sun, 21 Mar 2021 11:23:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs5q7G80JSSqEo2231rzMtnkxhYr3Ck1qYLJkcWu35P8wKtsmETHqWPE6PgjAkIB5iZDQr
X-Received: by 2002:a05:6e02:1068:: with SMTP id q8mr9460992ilj.57.1616351029702;
        Sun, 21 Mar 2021 11:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616351029; cv=none;
        d=google.com; s=arc-20160816;
        b=sMfgmxA4D9oChak0RpXQN2X5qjJoTKDEFIh7/AkhRbmXKb5imf7SwbWmQxdcDMdTUC
         ExMWGi7GprYW65+S5vJQNA4jGxaX+uZ7vsssDlN82DB8Qr/NAccVP4gjF3HsHFpn7VJM
         PScc0uB7QqjUVB0+2CE349WDCzVd4QZoFxTQbe0SB7xhwVAG/2rJe3DH58d7wu1zg1Of
         UQ+J4hmubK4L0BrN71TXEPRPSt0BHTWLN/t57jnaHOFWQ7/NWiBQ0CxLNEFDQO6TYVtx
         nAdSxIrucuVh2ifLqRA/AYhgjENBn9c/079rtwcf6SjP8MIYvyje30jF3fMEqowklyeg
         tzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Pj1PAyxsiuUEPDDgb2yHswzTVjSTyuDVe+SG0k7qMU4=;
        b=taVHd+6l6pKW6SV4jZaFC8OZahFtRL5qnETZRkqNDoGSlDplD4Ipxh7nrptGmTGZTH
         R2z4xwpnbeyBHn3ldSD9F1XdBXvVe9+FBAhsHxwS2t9CHx3K+jUmwraq2IjSLHRhhp1Y
         onBospXmktRWfzJElcuBRgwoSeVV9zL9SGA3yefzzVQfjdtXcdMPqsLn2ZFb4LNE9La8
         XDqVsAYcN+33wyn1zpQnUpTFU7DypOaEheZS9yc/ukxHdyYYB3qGW5Z5tGtSYUjKeI1x
         nFeHULecpyYkDC1mVKUqLKFk5zLheZVU5VULr3uOC1V3n4gaFujvjf+VwgI4i47x/xHJ
         FOeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bsOTQU2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si7483609jat.92.2021.03.21.11.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Mar 2021 11:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bsOTQU2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lO2js-0008Fv-St
	for alex.bennee@linaro.org; Sun, 21 Mar 2021 14:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lO2jH-0008Fe-61
 for qemu-arm@nongnu.org; Sun, 21 Mar 2021 14:23:11 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:37831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lO2jD-0000F7-GE
 for qemu-arm@nongnu.org; Sun, 21 Mar 2021 14:23:10 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so13758558otr.4
 for <qemu-arm@nongnu.org>; Sun, 21 Mar 2021 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pj1PAyxsiuUEPDDgb2yHswzTVjSTyuDVe+SG0k7qMU4=;
 b=bsOTQU2+MfPaiGGGjEvk1gQvM2hai+UDXAxSqYtBrQ+un+ZfPCdOyJ9lSyrq6l1ev4
 2XWm2FklY0hA1PL0WeKe0R3eVSPLB8jtu1D0H6s3DHPKhTH6UkqFHwa8MkWnP8AYZsQc
 2lhem8bcrqu3JD4klKaSBSYOAxK3lxo9MrXOLIN0IBL32kPC4NS5sh1n0/Pel1ATCWaI
 Q246ivLbCrT8XJwOBDKEijvbijCjlbx4OtNcOapBZNn1UTsRW9S4X+u10WqzOhq7hjXF
 XSEXP56RpzzDvrukOf/M6Ym/Ln64G/+Rvs6koG0/MYsEf2SmAShiZwh/cFVhVUsf8bGX
 DPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pj1PAyxsiuUEPDDgb2yHswzTVjSTyuDVe+SG0k7qMU4=;
 b=REvNjhqjWen5syA441WXLHLK4q6vrgUvaAo6J2yshMfl3FhlDlMIZsqCAjD1SAbZyn
 AicY1m3LsKwtyAD5uxIUFH7MVQLQ6iteNX4aYvGo2askUWLuIE7VjdVE8hYQAd7OoBP/
 2OtCKlOnDnJOHSeVWTb0lPswNzrGouBVLOfqzMQsB1u264UjYMP6US7XKZ9LEovgzm8E
 WuGhvPUoo6X4037c/sRhEVxSLHL4+9hTVwaALhDWKWTtxvwWkr/t2f0E+1YSpsH+GzBt
 a9wXm5ARc0e0A82etGc4tyNUSpMk9Jkl+NK4oWi3/wIyjFTxtR5X0Y8Gij7SRvxbAKU3
 IncA==
X-Gm-Message-State: AOAM530RxWdITHcRBvK0UHxmjYRxAUboQvYpr3EsYz/3ZtftnGUZeXC+
 jc0kRYO4i66/Ip5Amh2WCHubJQ==
X-Received: by 2002:a9d:129:: with SMTP id 38mr8803443otu.50.1616350985590;
 Sun, 21 Mar 2021 11:23:05 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v22sm2568508oop.4.2021.03.21.11.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Mar 2021 11:23:05 -0700 (PDT)
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
 <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
 <4c8d854e-a8a1-2a44-5a02-96a5ce5598bc@linaro.org>
 <CABgObfafUvCAriWa+mFQKL=Js4GGuMrNr3Gw8v2Z+Z=J3xT7XA@mail.gmail.com>
 <fefde0c1-5670-7cd5-4f7c-ab11af6aeb62@linaro.org>
 <CABgObfbG701a-_TB2v7irYe1DpPY-_zExgJ4SPMfyUEJD_2uXw@mail.gmail.com>
 <CABgObfazrLonuARgBUOfOC-13qQ4riKQx14x7uDbWnVba9xzSQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0cad2de8-1150-be7c-237b-9f3ddea52473@linaro.org>
Date: Sun, 21 Mar 2021 12:23:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CABgObfazrLonuARgBUOfOC-13qQ4riKQx14x7uDbWnVba9xzSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aldy Hernandez <aldyh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gavin Shan <gshan@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O8Nqpz9Nez6Q

On 3/21/21 11:46 AM, Paolo Bonzini wrote:
> HRM, what about biting the bullet and making exec-vary.c a C++ source?... Then 
> instead of making it conditional an attribute((alias)), we make it conditional 
> on having a C++ compiler.

Doesn't help.  The gcc bug I filed talks about c++, because that's the closest 
analogy.

But set_preferred_target_page_bits is called *much* later than a constructor. 
Though still before any use of the variable in question, for which we have an 
--enable-debug-tcg assertion.


r~
