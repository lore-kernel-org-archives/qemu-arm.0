Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp2632120ejb;
        Wed, 15 Mar 2023 08:21:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set89SKJYjZE2P77Q8nKhfYK2yahe6XJ4hBVB00sxHnnEMPsrdAWu56AqySYBtt+U43xpBVas
X-Received: by 2002:a05:622a:1113:b0:3bf:b896:ff58 with SMTP id e19-20020a05622a111300b003bfb896ff58mr133889qty.64.1678893675892;
        Wed, 15 Mar 2023 08:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678893675; cv=none;
        d=google.com; s=arc-20160816;
        b=twbOMgT2GzznJev3RsI6vc6muZB2FCXkQMG3hkQ1tKjrMzFNkR4TeEf410ABX8VWYA
         DpbqQqmIFHBTq7k6Y17xuaHpUIchk8zKPFx5tyZwm3RZ5WiGMWYucyuCGhoQ/mphzooG
         XATClSALSvJE8uO1cXlNSiuigoh5T1UN4ZFmiys1llOkhEFKMz3vS8RlPp8SQBO1S8j2
         aQu+3DX+cxJ+oARlI28Furn3Xq8SFi2VeWvSCOJM2bH+ilKv5ZMtLkEkernFVAE1k6sK
         WU7W6wJ7zXR844RfVfrM9mSCPZR4YB3Cp9PbArDWTMASEFE3179cibKvex2Na7sQD1Ev
         W/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PunQBfCYfqEsOZC/O2MCOZ1yqt5S2SdmIj91K/o40lk=;
        b=SxX9dfL3J0RY8tU6JeouZoVBwMkqpjui23V25HKc3iOj4g7bCWyUzaQAsifFrMjx6w
         fhQdsUBdPvsh8jgLbyT7dh0eT/JmpPp8lGqQ/3dW9fJ0U4Bqd4LTpC02VvEqtilN5Ejq
         6xP0Jorw0bKujXFt0Ge1bKtFpfe60n4prUgdv6rrMYzERk1HioOSZz/7QcFX1+TOcu39
         EsIobg6fZ1nnldiMY25U0KcxbIraxsBEKEznWRMOeOSTkrHYzyGqXtcT+LAjzTNlN5xW
         K27g6JxYWcUTMLZt4YcEknjIyiYgbyIU4zgm1paHMvAFO4vymyyGC5Cr52QdJcpV9Thv
         C0Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zGwTRbRl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16-20020ac85b10000000b003b63fc5da68si4755590qtw.539.2023.03.15.08.21.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Mar 2023 08:21:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zGwTRbRl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSvu-0005rr-BD; Wed, 15 Mar 2023 11:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcSvr-0005lZ-9K
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:20:51 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcSvp-0000MC-Cm
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:20:50 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so2200414wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 08:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678893647;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PunQBfCYfqEsOZC/O2MCOZ1yqt5S2SdmIj91K/o40lk=;
 b=zGwTRbRlo+8D9zmKhfzyXXa9wESc0mtzuZgga0cUFYijjxckMGMUnNi6wlgy95LdRQ
 /TjGKfOeZE1spEYF4pP1HLH6Ol0K/8+fFJDAtgjN+Yht/nbfmv2FE3YOkRCSbla10bM5
 NtQdLTQlb/uhpVrCJAF6Lp/amtoXEn15Q/vcSykNpUbKLORUjWWogMtez4oopebCp0So
 BhzcO20NnAF4/2fMybnirnLfpQPSE+M51Sh3TGHBYfiot163Xon7Y7Wg8lHLTvKUcAPL
 +gxrOUe+5HEdD6PpJGZAl8wBI0xNjugp2+WqO6/QYaY9+M/bToCotyzKSMYIVxaAG7Pr
 u+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678893647;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PunQBfCYfqEsOZC/O2MCOZ1yqt5S2SdmIj91K/o40lk=;
 b=B5ZattMBFR8WKWYXkNtoI7rofvQ0ejYaL8JP1E52DVklzDitg7hV4OrOCTrrVTeVqP
 OL6KAi+pFnE+jNZnUhoHxoef0WXcIgauNeV2oGRS6Ufg71d3N0MJQxqEe2i3bF73vuIm
 njPPofNpqjLVBLrpTGlLcILPOxE9TU/NnYFoydvml3Q+QFBE4pTBESmJU8ohVIQsEQVq
 NewSgwoUw3wUekmQg2DRYWmtfTOyCyLSNQTobxQjHxNe5FIq8OgdddqJfzHSytjvXKSn
 U7ESWS6vyZCjqKgYX814n1BUoYwJPbJEN4XuMFjTQtjDHsGL/Vi5GpiPazSNqNLNOPsx
 1NYg==
X-Gm-Message-State: AO0yUKULISVzRp28+n9u7OsBwfniTH0P5f/s2Oqd0079pJEJ7ZinanpE
 64NQAUXHDybOXBw8uLwtbeGvJw==
X-Received: by 2002:a05:600c:384b:b0:3ea:f6c4:5f3c with SMTP id
 s11-20020a05600c384b00b003eaf6c45f3cmr18389080wmr.7.1678893647698; 
 Wed, 15 Mar 2023 08:20:47 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o13-20020a5d4a8d000000b002c5534db60bsm4900572wrq.71.2023.03.15.08.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 08:20:47 -0700 (PDT)
Message-ID: <69ab6023-04ad-fd12-38f1-22c651c3f796@linaro.org>
Date: Wed, 15 Mar 2023 16:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: raspi3b - dumpdtb
Content-Language: en-US
To: Little Tree <littletreetrunk32@gmail.com>, qemu-discuss@nongnu.org
References: <CAHwOCLYgw081FF841QN2deex4KLRGkQBfLrGn0QLWoCaAVTAdQ@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAHwOCLYgw081FF841QN2deex4KLRGkQBfLrGn0QLWoCaAVTAdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6vwU1QB7sM4H

Hi Little,

On 15/3/23 13:43, Little Tree wrote:
> I am using QEMU 6.2.0 to emulate raspi3b (Raspberry Pi 3b). I have used 
> the following command to dump the DTB. It is neither terminating nor 
> dumping the DTB.
> 
> $ qemu-system-aarch64 -machine raspi3b,dumpdtb=test.dtb
> VNC server running on 127.0.0.1:5900 <http://127.0.0.1:5900>
> 
> If I change the machine to 'virt' as shown below, it dumps the DTB and 
> exits. May I know the reason for this? How can I dump the DTB of the 
> raspi3b machine?

While the 'virt' machine _constructs_ a machine adapted to the command
line options, it *produces* the equivalent DTB.

The raspi machines in contrast are not virtual machines, they respect
the physical hardware. Therefore they *consume* already existing dtb
blobs (with the -dtb command line argument).

See for example the test_arm_raspi2_initrd() test in
tests/avocado/boot_linux_console.py which uses the bcm2709-rpi-2-b.dtb
blob file.

> $qemu-system-aarch64 -machine virt,dumpdtb=test.dtb
> qemu-system-aarch64: info: dtb dumped to test.dtb. Exiting.
> 
> Thanks a lot,
>    Little

Regards,

Phil.
