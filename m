Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2465754ocg;
        Mon, 10 Oct 2022 07:17:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5huRIRNUHu+lbeju4zsdffMYY4GQ3LFz3ExL45DaBGdjpLcjBrT+KgwIMZSu57JScgPomK
X-Received: by 2002:a05:620a:3199:b0:6e7:7ac8:5b4 with SMTP id bi25-20020a05620a319900b006e77ac805b4mr12645722qkb.192.1665411429623;
        Mon, 10 Oct 2022 07:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665411429; cv=none;
        d=google.com; s=arc-20160816;
        b=iaafHHnd8T3XhAbwhp4gIFL0oBn+CMVy2WW2sH9Juy+6+1ruRJ9gEdrrMFxxnTD84m
         PH/wVGKfu5n+yBwGL/oD3TU9uLn651EW9hy5ttvDy3mjNqEzexDyipBR6ujjz5Jqsht0
         2HE4gG3hO1pAcxvEyUUfJLWRQDnXnFvUUO4mDZfqwS+r0XolMCfXI8N9TDOnvxj5vsNs
         aAo/Sz9UO1aaCLMfbgDIp7OoFKvvsmsADBCOiRGEdqazYuZCqq5fdNqh37Ydub+hSDXs
         xTjdY0ElqwpL3uE9k484OLDGo2YwTYl07GhU5Q0XqYe2vDwZE1NmVZ7g1ANgwWQq7rEw
         YJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=czxmvoMLlSY8gbSD1RHgaJaijEbZXHqSoOssM4epKCY=;
        b=Kp4/aXSnBppu6MvYciiV3/lBUfUgDGWA3G92Cuoa11LE6EkRTtaAIuPCbUAkC5VbQr
         Lt9MvkahfdaaujwfFWLcipZzRh07D35RNc0OkfivrtRciztRlcs+CyZ1+0BxXPYwcCIS
         H/Q2fNLtpHJrNqf4X4kcD1OeEv9Z5XAkLU8uwKfrXkHjO6P56rv9SbYgVro6VJmOB/p0
         CjtMPCIwHeg/2l8sy0r3Nf2Vu/yUAaa6L46GNceVsWeT00HD6mHum+0EgvsHZtA/LwFQ
         gohgrdtPlmNKgAwhf+EqY8OMvQm+nSo1EGvzGW7DqUKssUznvln/7lO3Wxxf6EmhPD1M
         TwhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=reM7XgIQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx7-20020a0562142b0700b004b1c8f75ee8si5241837qvb.567.2022.10.10.07.17.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 07:17:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=reM7XgIQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ohtaf-0001HD-78
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 10:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohtZs-0001Dp-9c
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 10:16:20 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:45871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohtZq-0003pp-FA
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 10:16:19 -0400
Received: by mail-pf1-x430.google.com with SMTP id 67so10850998pfz.12
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=czxmvoMLlSY8gbSD1RHgaJaijEbZXHqSoOssM4epKCY=;
 b=reM7XgIQ+wQgg7ZlrYllb9/TQnSJeC0MJTNj4X2Eb82ThAycFa6GXzb6+mZTGB6LtT
 39sFZu5t9MeWQApooUAC06TINXRawuDXbB/1m96KcNvm6S6vyIjEtD3MC4BsJKy/o6Lu
 vy06nioFZRPj1mEvb/0wVeG1PYJQJCImbdR2mmJNb8oCLwH0dqQG2X+ecYXwVmDaFZug
 0I47t/81n86JrW2yvIxANHos10Bdd2xUzgk7zAVDq5YHXSESjLZut6PjBFo2uQp07pOT
 Z9DElZGO8UhjmNmWXNNBwx8iwIY/nPGMmXOIZWyzwVUsBuP+HA9SXo7rS8vcvddpZGyZ
 IVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=czxmvoMLlSY8gbSD1RHgaJaijEbZXHqSoOssM4epKCY=;
 b=HTIgGDExBRFb9CiXzsnbwGiWWwrS1QTIZuUF31zKsYx38n1pCNmiRlDQUQ577DuwUb
 8OOEgwGwQyunKhUh5ZQpkPIAQTbok/GHQsJ0G5EW1u958FWbcwF2EOTW7WjVso3To6ev
 3VqznHG1T2DuA5ee1DAfd70wYD4w4+xEBoXPdtdzIt3UKvGVzX5qq0mpBVlx2nGz5A4B
 WwbYOjocCR9xn9fbmQl9q5vYJo3Jn4SOvAHEnBWhb95tNeU7eQRo8MDir5l1xrAhF53z
 CAuTURpjodAxrGw3CMzfWqg5U4CQyqrOjfo8tSLgff+MgQk/X8j3sDwoNAheD0cuKtCJ
 A4Dw==
X-Gm-Message-State: ACrzQf2IqHOLh8i3tvGrbQiSrGRdeNQrlHRFFwdnrCq4HTu59cH2ynPs
 E3a27SiaGeGfq4/PpuELxOsTXA==
X-Received: by 2002:a63:e909:0:b0:438:c9c9:61e3 with SMTP id
 i9-20020a63e909000000b00438c9c961e3mr17027204pgh.194.1665411376856; 
 Mon, 10 Oct 2022 07:16:16 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a170902684800b0017534ffd491sm303204pln.163.2022.10.10.07.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 07:16:16 -0700 (PDT)
Message-ID: <eb00a974-424d-6468-ee91-7cb650cfe0fd@linaro.org>
Date: Mon, 10 Oct 2022 07:16:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] hw/arm/boot: set CPTR_EL3.ESM and SCR_EL3.EnTP2 when
 booting Linux with EL3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Jerome Forissier <jerome.forissier@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20221003145641.1921467-1-jerome.forissier@linaro.org>
 <CAFEAcA9bWzD5gKyHGOsz+8KCH1ykgU6sx2soDTVKiTHEa0D7KA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9bWzD5gKyHGOsz+8KCH1ykgU6sx2soDTVKiTHEa0D7KA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: UsDdKT6HJBlq

On 10/10/22 06:16, Peter Maydell wrote:
> The doc also says that we (as fake EL3) should be setting
> SMCR_EL3.LEN to the same value for all CPUs. Currently we do
> do that, but it's always the reset value of 0. Richard: does
> that have any odd effects (I have a feeling it clamps the
> VL to the minimum supported value)?

Yes, it clamps to minimum.

> Should we be setting SMCR_EL3.LEN to the max supported value here?

We can set it to 15 universally without consequence.
It will be clamped to the max supported value elsewhere
when interpreting the combined EL[123] fields.


r~
