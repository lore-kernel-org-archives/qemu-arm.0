Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3182207lfo;
        Tue, 15 Mar 2022 14:42:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOqMyZuz/HQlU0PVy5z7HwnplAS//dDCtp2WP+hguv3NSxoY7mG7veGH4/9hbsLbrUbgGl
X-Received: by 2002:a81:5cd4:0:b0:2dc:2dcf:fc60 with SMTP id q203-20020a815cd4000000b002dc2dcffc60mr26241189ywb.133.1647380537734;
        Tue, 15 Mar 2022 14:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647380537; cv=none;
        d=google.com; s=arc-20160816;
        b=nn9KtvED0fe9OkIEf9ps7Mg1bMut4+0qXpq/RU0bht8TqRekxvyejRGCYSvKjTvR1H
         9Ggafy/1f/f0PPgCZLWfgH4JqnkGzdlosUGOfvk8hoUxlAg1KAvcAEdhqp+gcU5qqtZ8
         NqAqeyiyNrKT9aeuXuQUVe8kCQluYJpLqSDTTkJ078K6EX0L4X5i1r+au2VB4IpSrYbI
         NgobXDQm3qU/hPz/GiFauU3WSd/j3/lGvUygXqBLisw+neqEtkVjCeCLoyNSjxyPev5D
         i3KY2RfIF1leEWTDuuzm9DVAF3F/X2idJBfvg8TtKInycujvVcKYr9WueiNOErLJMOBu
         2BdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=z03UJPXkvE/wwwDvg5oZwAdXNipbiYnMQgrMp/6flQQ=;
        b=a17iINyVNKxuuI0XOc/o+3tKGabC48eQkd2z1xo+0USxhxFMkKs6HG62mq4sXH96fl
         ylVbDIWG9AIU/awECExolF4FG4Y1N3DnzrlfjLZQ2zmlNcVlGyIZnbrQPIwJ6V3DWJ9B
         WgNjszeAlbpN9EjpNMpjyNUPWsdf4sb1mav9SFo7oXcgX/pXOx6+nYtqyHyf1gu2i67a
         VyB+g58oaNlNyFidJoBhWvrehhRna7T4B7BYVqUmE6ptO/2xGwFsFb7cDWE9QK1C2tZo
         Nr2BP+aOuTobIaxCD2VPZazzQCp+2eQ/6BqO5RopZkNo/8Ru+R7BCGJcz9h8cn+g47iF
         Pcag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVYkDSCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020a259f0d000000b00628a6ca7e30si309194ybq.395.2022.03.15.14.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 14:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVYkDSCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUEvp-0006wT-52
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 17:42:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUEvA-0006C3-Jh
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 17:41:36 -0400
Received: from [2607:f8b0:4864:20::631] (port=34416
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUEv8-0000s4-U0
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 17:41:36 -0400
Received: by mail-pl1-x631.google.com with SMTP id r12so250975pla.1
 for <qemu-arm@nongnu.org>; Tue, 15 Mar 2022 14:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=z03UJPXkvE/wwwDvg5oZwAdXNipbiYnMQgrMp/6flQQ=;
 b=OVYkDSCJx/7F6cA1QrRYdvO+ldI4gLxCiEKJMSQdJ8tqgXRHd7a007MWhmJCvWJwPm
 +WKbgYZjWrcCrMawISHWTlWWdNpPimiTMVQIMfM7no82ovYIfyIYUwLC63Yf+5vE1+/F
 w1e5wvFBnRrx6h0/93UgEXoyNsASctpfk3zhzIAWgwJJ/biVoDorpoeXlaWuxjschD7U
 biGr+G131mGux1KInPQbtJlN5A++CqSXIvp0qJjP0qBweCAaM81wzkwNpdZfl3+zW9kw
 edKKn3O9T1pLO4WB95DcLkGybACZtfDmx/RFTb+LZL/vaqRWq6Y0WMLBSXb9Avc+e/6p
 IQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z03UJPXkvE/wwwDvg5oZwAdXNipbiYnMQgrMp/6flQQ=;
 b=Oi3foCTICXwVa7cn3gVh3a3uMtLcg7hf6T8v/IikyWLiqAtq+k9m9jGR9KRG0dIR9w
 IDRsLVWuRggJeDD7BZcBGVb7WYpgahTeE9grDIR5+PKtdk5sncNs4eKOpQCNxolgoJcp
 DWvm+7RYPGunp6H18SJiH26LXq2k9xBzBK/58ia08Kw4JupKvQx9XoQTEoun8pRVp7A0
 IFcclfpcVTcZ0OtEAl9LTxE75CJYwv+zZeG6iKta+NvFChmakJOHWnuHUM+MiCpsk5Yl
 Eav8/LAzD2cBxfQEytt1Zej1+EljMvyYStSMvkIANoZ08j3jljPmZsdfHd86+lfwAoG5
 Qhtg==
X-Gm-Message-State: AOAM532RtulNp4cnCghCW86gU5LnACyXKQlP79bGuJHSBFZ9ogxH/7Ce
 +ckIgrRrEWlFBnxgzUaOOhEAGNQI/ZgS9A==
X-Received: by 2002:a17:90b:2246:b0:1c6:5781:7193 with SMTP id
 hk6-20020a17090b224600b001c657817193mr1311779pjb.48.1647380493463; 
 Tue, 15 Mar 2022 14:41:33 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q17-20020aa79831000000b004f769d0c323sm57051pfl.100.2022.03.15.14.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:41:32 -0700 (PDT)
Message-ID: <eb4fee59-8710-fc4f-f5f7-bfcf1131b9fd@linaro.org>
Date: Tue, 15 Mar 2022 14:41:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] target/arm: Log fault address for M-profile faults
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220315204306.2797684-1-peter.maydell@linaro.org>
 <20220315204306.2797684-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220315204306.2797684-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: ysm8m2wwK1O/

On 3/15/22 13:43, Peter Maydell wrote:
> For M-profile, the fault address is not always exposed to the guest
> in a fault register (for instance the BFAR bus fault address register
> is only updated for bus faults on data accesses, not instruction
> accesses).  Currently we log the address only if we're putting it
> into a particular guest-visible register.  Since we always have it,
> log it generically, to make logs of i-side faults a bit clearer.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/m_helper.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
