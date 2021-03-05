Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp228246lfg;
        Fri, 5 Mar 2021 02:50:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwG/XV8i8QssDSx7XK8+yh6n3PP6awKFfYpXzK7c/PJn7NrCjYit441zLjfUj7nDkv7OGu
X-Received: by 2002:a9d:23a1:: with SMTP id t30mr7295772otb.65.1614941433687;
        Fri, 05 Mar 2021 02:50:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614941433; cv=none;
        d=google.com; s=arc-20160816;
        b=tbgmetfZ29US2sH+NFLrNAxv2XH+rpdJysqyba0h1frQIJurllFECiqh+z84yGl2Xh
         8ClxxU02PZyU4ZXV5ysVjW8qx25kUA8rxviHmR+xl/SqSQrdfAeR64M1nWVA8WdPU1He
         xfbR3b0zPyNCA91p3XjFXThiPeLmTVpLescpOUKRAjYqsaPUvYnwbZGuq+Pc8x79Qvzs
         UAPqEIVViQpdSHQwB9xwBEl0KS8dRXTZW5bSocyfZ8gZsLm40EE7UnQyLoWUkE+KfSvK
         pSxcnwRwgNZDVRcFpsEWD385bYtlx3BVnDkcxVwqQaL0Xyq2SIci5M0JFB8cC00ERCu0
         VLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=QGN3f7CgrKmAlQGB2+AH+M0JDQFf+ijm4nS39MJntoA=;
        b=r3jdDt+JFbusgAUoy5GoJMLWWgkvhMDItMX5631h62MgBNjFVhrBJ8UFCwppVqGIK0
         Onm3PGUrzovrqgLCzFrJkxI19CiX5yMhnPLpEBkksNt+KcT188KCT2mLpWEpHUgb051T
         7oS5vyd9jOAzClc0mIzwHlDMOg/dCuQEQx4G3C04dslQEzgNXf94a3fbF0lMoIa4grba
         1JI/GqwfDm9OnhG55TNrIWHU4aFNaZCLcA1S35gYBbuYt4UHjZQHaTS1FyRZhk4Vv1r5
         mnqQrtlXbQenHyL5cOy56Yfa5arMpwKJdcxk6X7Xl2/6NHxeXi2wUq6eimgVpTghPfTj
         fJnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uD453+7h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si2097015ots.199.2021.03.05.02.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 02:50:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uD453+7h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lI82T-0004mI-0r
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 05:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI82E-0004li-Ss; Fri, 05 Mar 2021 05:50:18 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI82D-0006Xt-CW; Fri, 05 Mar 2021 05:50:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id w11so1546804wrr.10;
 Fri, 05 Mar 2021 02:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QGN3f7CgrKmAlQGB2+AH+M0JDQFf+ijm4nS39MJntoA=;
 b=uD453+7hr0PrXoQ9uh7+odAFMrf2THZ80kujoTu6FGS6pSBx6m1QY2K1rzXBbDG8oM
 jf+NMGW7useUjav0bZUh1Hx3z2MNtS6rTkn8h0RYtSvn/EdFnoQVtN8OxUmGuxX1rwSc
 8mJnQujLCFN1Vzmb6M98Vnniz7iP5eZkrnZxPjIfVXv2vF+tgWluO99S9z2LCGj+nwTj
 7+bKKJVmiakV9nTxrVQBbFbsi90vlPvtxBSU2lnae+JfmJ61R56nVgV9lAwBE/7Md6jm
 sofD3C4OBgbDMo46sY+pGIpmNf9fYszxlQXSf/AJYIGLMtboB8rpyILrFWRNCsvZdnwF
 SZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QGN3f7CgrKmAlQGB2+AH+M0JDQFf+ijm4nS39MJntoA=;
 b=LEuf5KLwEOvX9FV3lmleKNa3dfTMdA1EQnSSZn3DFvjcTHpXZCeb3Wm38oEmoLD9M3
 JdrhIhnb9ZRrfx3Q9HRUPQLWCO36GMbgH3uB/d3dUHZ1oufccYxmG213diu4xfkm2PGp
 CVgu3/U21+4ufEHfBOSS9ELgw1DyOun78p/iozcRDQmYmP0lj6iYPd5rBUPyB3WcnY1m
 LdWTLb7pTnJs0FqhoE4EHdNKKHhcVJq91tRvlYvGHcZkGqUn+AWXRhzDbgPmVFlM9gFI
 sv0YNM8e4IO3e0LSa4XlbrIzjXYbwnY/L6fZuwXtrhwY3Wx+IdcSh4ZzP53tm6XqNsL8
 b1dg==
X-Gm-Message-State: AOAM530YodCL9U5ZXbC9i/LNU2TD0zc/VBZbmwM6vqfFPFBtjp2ULZr0
 Gxoda93kLyCtokpphSdO3enXGBh0loY=
X-Received: by 2002:adf:ed44:: with SMTP id u4mr8598597wro.35.1614941415476;
 Fri, 05 Mar 2021 02:50:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r7sm4069088wre.25.2021.03.05.02.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 02:50:14 -0800 (PST)
Subject: Re: [PATCH 31/44] hw/arm/armsse: Indirect irq_is_common[] through
 ARMSSEInfo
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-32-peter.maydell@linaro.org>
 <4185da92-5909-5040-b015-5608aa57729b@amsat.org>
Message-ID: <3f23c566-9c06-003f-baa2-14d10ce09784@amsat.org>
Date: Fri, 5 Mar 2021 11:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4185da92-5909-5040-b015-5608aa57729b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mdXTs/cmHLC8

On 3/4/21 9:19 PM, Philippe Mathieu-Daudé wrote:
> On 2/19/21 3:46 PM, Peter Maydell wrote:
>> The SSE-300 has a slightly different set of shared-per-CPU interrupts,
>> allow the irq_is_common[] array to be different per SSE variant.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/arm/armsse.c | 39 +++++++++++++++++++++------------------
>>  1 file changed, 21 insertions(+), 18 deletions(-)
>>
>> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
>> index f43f0524e28..b316fe69571 100644
>> --- a/hw/arm/armsse.c
>> +++ b/hw/arm/armsse.c
>> @@ -68,6 +68,7 @@ struct ARMSSEInfo {
>>      bool has_cpuid;
>>      Property *props;
>>      const ARMSSEDeviceInfo *devinfo;
>> +    const bool *irq_is_common;
> 
> Maybe *const?

Forget what I said, I thought it was an array of pointers
to bool arrays, but it is only an pointer to an array of
booleans.

> 
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
