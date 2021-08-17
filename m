Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp620993lfg;
        Tue, 17 Aug 2021 08:24:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzukBcUSNvP7zepsAeVzT71zMOgCPPGXBlH9rzbXMRj+GR7SBuuOkCEiW/Eg5s0cBTD8cnT
X-Received: by 2002:a67:79c8:: with SMTP id u191mr3438240vsc.35.1629213878461;
        Tue, 17 Aug 2021 08:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629213878; cv=none;
        d=google.com; s=arc-20160816;
        b=yYg8Gay3nayKobwUFvp4P5RdYRQx+UdpyCRxHlNHNYlvvq8j5uR4WrA8I8osrFX2kk
         n+3NdGVutO0/yRdyR4MfUoYWtgYKSUfy0Iqyv4MZq60903eiqHDfcOd7TWKoEiufGaYZ
         5LcVtGnk5dmxbQWhnzSuZ6GCZ6eMiHThjASbt8H1CouVBzRyw9d/YCeNzJqmIXfQA84L
         5nS0flnkDQW72OQfLJtZWuBTNRb+U+FX46ME0pyQSpT5jl6HxS+v2udzOBjkIejWCaO3
         gFyUc7Ot9eSxq+1XMiMghTg/Vmzs7wK/H31tYIOYWTUWAuJTBz2uj4c9z/FTDVrZig80
         qPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ga43Y9loZCQ00QZuLW1nMLQPKMl4n0r45aTNEZdXlcE=;
        b=krOMCZ+a0cKpXwrR4znFLIWqxvvjVfw93DiRHhuzZqEMsMwfwuf5wDAoTsCMwuwRVM
         Zn3htt4m4J1GH6es+lICD/oIxIeaWNrD70+JAOIOYWLXFiOz/MlglQ5Ztfh5udBmjg/U
         S0BqiMONkIGBEjM3OuXerdIaFUs4PlaMXbl3Vxer8GwV6zltB6wWW8TNaCZM5njMzv+1
         n1vJb2ig5cfydbjstkCA8J2VE4Zfo1I6KCjYwm3O3eBEynSTS4MYP42zwsxy6OwybJSZ
         cDmbjO/+7BEKdxrZ76/f/m3meHQsLylekocXjbMZMzgUg9ZLeTPVAkVAWE/i6NyKOgon
         fV+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gg033vua;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si1365489vsk.366.2021.08.17.08.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 08:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gg033vua;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG0xB-0006Ux-Ql
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 11:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG0w0-0005Lq-4e
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:23:24 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG0vy-0001pP-JF
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:23:23 -0400
Received: by mail-pj1-x1035.google.com with SMTP id oa17so32598396pjb.1
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ga43Y9loZCQ00QZuLW1nMLQPKMl4n0r45aTNEZdXlcE=;
 b=gg033vuaGn0S7MiEc4QExRzWarBW8nCP+dAe2WuJEmR6WLmzVnNusJQMnjGoYooRiH
 oo90uxVwM1eK1CT1K9Dc807yK4DS/zgyZmsDm7kppDLxOZcucHkAQo6G9GjT69XQV3SR
 VOedsqUXl626keu9wg3dL2Bav928NXXGkjfNo/+CM9zTg8JC9AIIrP7e6n6BVBiqp1ll
 +Zw9KqZWq4qSzQ122hHY89tHWqwOVpEo5REaaL1ngUcUDoQDadUrhRxxg5Su8ZYUBVgj
 HXx4C3mdQjMr9uwMivRccPkTu1SAeFWpFAxyFsJdC7rm9YgRa5c2tOae+UL76xevY+af
 iObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ga43Y9loZCQ00QZuLW1nMLQPKMl4n0r45aTNEZdXlcE=;
 b=GiXUiRIZEWVb4KN4/7ygXjFPO5o5qvW17+zW9OHSnnmd8+8sEeijVQQ7l3JzQVD90+
 qvACHQvnmqU2uWvw4X0g96GBqiPvhpsCCzzCQD4bZPdctWBtN8RL+zLJyf8WmKJ6tLsd
 pM305aOs6BIWcV8xrM0ZbAONKtQVLgKdFqTS3l19M2OHX1R6tK+ZwJleZZMuHaFh3l1Y
 B+xdDb8KEYuAPpAJ8aQLuKAXfdodEQ8h2icqlOdcutGPi21rkU23pKA+Y+MDk5DB4wxL
 8MMdrwpySYAeA2opPBzDglgx6CFsPRFWgmXKx1GCsb5mZo5V0/NeuIMeeiAjZ6OxTd/b
 xrjw==
X-Gm-Message-State: AOAM531UlcwCUJU/6jhl7WQHh3RyLjBSnoqZhGBT22EncoLXl5syVWI9
 tpqpDtQS/7Xk1oVblZIfmZ4KY+pungMVgw==
X-Received: by 2002:a63:a4d:: with SMTP id z13mr3929931pgk.445.1629213800941; 
 Tue, 17 Aug 2021 08:23:20 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id k197sm3222077pfd.190.2021.08.17.08.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:23:20 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
To: Andrew Jones <drjones@redhat.com>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210817115635.d2wxvnvis5kupegh@gator.home>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
Date: Tue, 17 Aug 2021 05:23:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817115635.d2wxvnvis5kupegh@gator.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zR7XapnLAVPC

On 8/17/21 1:56 AM, Andrew Jones wrote:
> I guess it's fine. You could easily create a new cpu_arm_set_sve_vq()
> which would forbid changing the properties if you wanted to, but then
> we need to answer Peter's question in order to see if there's a
> precedent for that type of property.

I don't see the point in read-only properties.  If the user wants to set non-standard 
values on the command-line, let them.  What is most important is getting the correct 
default from '-cpu a64fx'.


r~
