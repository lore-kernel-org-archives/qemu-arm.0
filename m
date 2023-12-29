Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp2065180ejc;
        Fri, 29 Dec 2023 04:02:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDo955xj8obu128SeF92ArtjkNV2zvU/P5l8ibsQ9LTWs0dsQrtP7q5jigE3WIyDU36t6T
X-Received: by 2002:a05:620a:ecb:b0:778:9be8:275c with SMTP id x11-20020a05620a0ecb00b007789be8275cmr12828302qkm.33.1703851331045;
        Fri, 29 Dec 2023 04:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703851331; cv=none;
        d=google.com; s=arc-20160816;
        b=Xgm3zpJ7J9j7485emu3jPi7O5uuTcIEmwKkC0EIQcslgVs+B7dbWIw7R+07LlXFC5l
         WQBYsbc47cENSK0Hz+otVHcM7WWmCAraUOsrNx32fEv5+FByiymkkaJw14DFyUy/Zlu3
         ckX620aqUubzHHBrVIqm+vr/JBFjg/b2ZjvjUdCI8r32e0yguuzkoVNM7lJun7KnxMzx
         mqQgsB+dLxbba06cU41Gluy2/5FG0L5z51oCc6JH0qpfLiNTMythvZRjK+6Mes5lDn9N
         2GyFqNkV6CZUjXVCuvDgRTBzswxN/j+ZJIbHSgIEMwA241U2V6SiPckQ/eV8ubZleYY9
         bRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=7+PHEaS0uCelKNM/s+1g0UXrfcWmC0+x6QCJnv5+scU=;
        fh=wWgSgZTtVmQmltq6sTjmV3M8QLOfhMblXkOcfBEk3m8=;
        b=Unm34YDf5u/mmPNU1NkeAvjUl69PJGWxmUgWoCqQ1RL/qoUXW3GOfXYJifW4hpEpRQ
         hZodBygNw2AFLoAlYBq1q9Q+jQfhnu0i7RG7OAeg/Enp0mDw7CYz2DTdn4cGs9/RsykK
         BDHJBlRWyQ2MCgUzSXfodJHxS8uQAMlLDcmdkdwoCwlQjrhnWBlN7quq6obxpPeze4PU
         QtYXgiqNFzbXOW8HoA/3bb0UgIJhnr/1UB+fY3+DtFcM5G3ENihe7hwt4VrPrUIJiGWB
         Cw8SiLSg4kUY3Hy31g2XRtWo84682wYdIVXC6OBLFJM4+CrhJxnA3bW6y7nFqpbRw9Do
         tM9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GtJy73gr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020a05620a244b00b0077fb4eb30d1si19697758qkn.116.2023.12.29.04.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Dec 2023 04:02:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GtJy73gr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rJBYz-0005TC-A9; Fri, 29 Dec 2023 07:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rJBYv-0005S3-UP
 for qemu-arm@nongnu.org; Fri, 29 Dec 2023 07:02:02 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rJBYs-00023W-EU
 for qemu-arm@nongnu.org; Fri, 29 Dec 2023 07:02:00 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a233bf14cafso782105166b.2
 for <qemu-arm@nongnu.org>; Fri, 29 Dec 2023 04:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703851315; x=1704456115; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7+PHEaS0uCelKNM/s+1g0UXrfcWmC0+x6QCJnv5+scU=;
 b=GtJy73grY02ZF95GZMBspfFaRe8r4LmIPWFn4HBEnXgLkAgLDeXGiqOWIPqCRnrN2N
 uTNw1oZWweYNiad69qpTsSiGSMj9KPo7nxNzlK3SU15e0Xrn3uW2M3WGepQhlVMAOqvZ
 DB2lLRPWfNBr/Vfvp6oY3wLLS81+g+8av383IXUFk23CprbO33cBi9tAhS827C6PK0o3
 0g7Yylo0m4V50DQiX8ECwfUqQn0hufnujhUcP4RMS8reK+djcHrvWIKz9LC29fzSkFTY
 Gg4/97H18GwRV3rQqlLHx34NI7r9aEyD9E4g2Jt0Dv5cS+pGzeIRUkf1Iuwk7xUkkQBR
 6l2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703851315; x=1704456115;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7+PHEaS0uCelKNM/s+1g0UXrfcWmC0+x6QCJnv5+scU=;
 b=crg3BYIv1RBIoRMnRqZ4ix+pJh2rrC35nM8bfqda15I5C65C5Tuv1M99bYcX//OrkR
 cK3pDdGU+8OGtuIz7WxkJSdomw3pJjLpOgtE9TKqxG5taV+VkloFrzfu+4EeayA+gB/b
 ruqmHxYfNjxe9B+PkYo/3JEybrMky0Fq7ZRVp2tum43l4WnEB/LMeKzvrBnY0eO87QkO
 pqCoHNVFqFgFBT+1V0CDc+Ej02Ow1VX72GJ42O6fQe7LxZE/nAo6yblyHHNdMNXJAM4c
 b4JFnn5R0lbX2C6j/Kreyu+5tWg6SGhRm0uH3cCkL7BkoG1eNtJquYKwAxVNaiVZC6W9
 vJkQ==
X-Gm-Message-State: AOJu0Yy4ZHDuJzqQyCFuuFxcxDdLAB33ei3TaZVQH/Pj5rxIptQ18IB/
 qrXy0bW3pqzcM96HDKDlPV/QElDbJnxqAw==
X-Received: by 2002:a17:907:1114:b0:a23:53f8:c956 with SMTP id
 qu20-20020a170907111400b00a2353f8c956mr4117740ejb.42.1703851315094; 
 Fri, 29 Dec 2023 04:01:55 -0800 (PST)
Received: from [192.168.200.206] (83.11.185.71.ipv4.supernova.orange.pl.
 [83.11.185.71]) by smtp.gmail.com with ESMTPSA id
 p9-20020a170907910900b00a26ac5e3683sm7549570ejq.100.2023.12.29.04.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Dec 2023 04:01:54 -0800 (PST)
Message-ID: <c9f9c9a8-acd4-42cc-8dd8-ccaad6d74cba@linaro.org>
Date: Fri, 29 Dec 2023 13:01:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ARM Sbsa-ref: Enable CPU cluster topology
Content-Language: pl-PL, en-GB, en-HK
To: Xiong Yining <xiongyining1480@phytium.com.cn>, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, chenbaozi@phytium.com.cn
References: <20231227120722.1683361-1-xiongyining1480@phytium.com.cn>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20231227120722.1683361-1-xiongyining1480@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PydyPtgCY3lk

W dniu 27.12.2023 o 13:07, Xiong Yining pisze:
> Enable CPU cluster support on SbsaQemu platform, so that users can
> specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And this
> topology can be passed to the firmware through DT cpu-map.
> 
> xiongyining1480 (2):
>    hw/arm/sbsa-ref:Enable CPU cluster on ARM sbsa machine
>    hw/arm/sbsa-ref: Add cpu-map to device tree
> 
>   hw/arm/sbsa-ref.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 

Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Booted system with "-smp 8,sockets=2,clusters=2,cores=1,threads=2" and 
got what I wanted:

         cpus {
                 #size-cells = <0x00>;
                 #address-cells = <0x02>;

                 cpu-map {
                         socket0 {
                                 cluster0 {
                                         core0 {
                                                 thread0 {
                                                         cpu = <0x8007>;
                                                 };
                                                 thread1 {
                                                         cpu = <0x8006>;
                                                 };
                                         };
                                 };
                                 cluster1 {
                                         core0 {
                                                 thread0 {
                                                         cpu = <0x8005>;
                                                 };
                                                 thread1 {
                                                         cpu = <0x8004>;
                                                 };
                                         };
                                 };
                         };
                         socket1 {
                                 cluster0 {
                                         core0 {
                                                 thread0 {
                                                         cpu = <0x8003>;
                                                 };
                                                 thread1 {
                                                         cpu = <0x8002>;
                                                 };
                                         };
                                 };
                                 cluster1 {
                                         core0 {
                                                 thread0 {
                                                         cpu = <0x8001>;
                                                 };
                                                 thread1 {
                                                         cpu = <0x8000>;
                                                 };
                                         };
                                 };
                         };
                 };

                 cpu@0 {
                         phandle = <0x8007>;
                         reg = <0x00 0x00>;
                 };

                 cpu@1 {
                         phandle = <0x8006>;
                         reg = <0x00 0x01>;
                 };

                 cpu@2 {
                         phandle = <0x8005>;
                         reg = <0x00 0x02>;
                 };

                 cpu@3 {
                         phandle = <0x8004>;
                         reg = <0x00 0x03>;
                 };

                 cpu@4 {
                         phandle = <0x8003>;
                         reg = <0x00 0x04>;
                 };

                 cpu@5 {
                         phandle = <0x8002>;
                         reg = <0x00 0x05>;
                 };

                 cpu@6 {
                         phandle = <0x8001>;
                         reg = <0x00 0x06>;
                 };

                 cpu@7 {
                         phandle = <0x8000>;
                         reg = <0x00 0x07>;
                 };
         };
