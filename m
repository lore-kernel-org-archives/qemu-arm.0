Received: by 10.25.0.6 with SMTP id 6csp824360lfa;
        Sat, 13 May 2017 15:39:16 -0700 (PDT)
X-Received: by 10.200.45.204 with SMTP id q12mr10572457qta.235.1494715156223;
        Sat, 13 May 2017 15:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494715156; cv=none;
        d=google.com; s=arc-20160816;
        b=hM5/18kIl6wb10MT7v0yZI/1LnxWyeEW8rtxFHw4IpXAJnnNwHAkig7dHk7w+QBNNk
         ZJ7xPm0U9SrXQwPAj7i6zHngyePQFId6qzlanPGDOqJrsj3fvV5hRZbVnfbCnDkU9BaZ
         XySEHurFL/bpxyGQRlRUlKQPMosd2kbixblSkffn8d1zkZiwKVbTK1x/LtIcKzjtiLBx
         Q6XFJGguLulZpewFtbUlQ1HLmlB0fQ7SFEVkg8VpvZP9oXtxcLT23baQr4zSRp9owVev
         jKKkc+yFaTrMP9E7ouroK08bB2akfHhCSvQXXAbYoDb7I9MklyC8l7UGdCSwfAUYO3QH
         QaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=y3BNiiWa3TzdyvWIM+RUxt4wpMT/JCpF2Co048osrkY=;
        b=zghGrbYnTF6B9cDFVFQcyo2lBvMAfwh3s+pQ+RD/lEvHsczVBTe47OZgceGCOBPOXU
         WsvSQ0yaymvBr+doZloni5b386RlYKE7to0zLheuobsAw1j3NGCmUfDAXM9PA3T/OLdD
         ymwkSu5f9gGdooHB+tqjJxsHXP6qxpbu8Fz9vACQct6CxvsAXs7hpGS8+QfXoTOzO2vL
         NFXx29YMhLXMBbJoKR/Tjzc7Xe/UzObaSkCI7znf4SDuXdSczWIFEX0f7q1+fXVW6lPf
         LntwgxuxMe5S9LjBVLMO8Krjbjte+Hv3AXk/cHe3IDAC12c8ARHXryfwTUgC1MumrBaM
         wxlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s1si7061068qks.2.2017.05.13.15.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 13 May 2017 15:39:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9fgv-0003rc-LZ
	for alex.bennee@linaro.org; Sat, 13 May 2017 18:39:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9fgm-0003pz-ER
	for qemu-arm@nongnu.org; Sat, 13 May 2017 18:39:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9fgl-0006Uw-NH
	for qemu-arm@nongnu.org; Sat, 13 May 2017 18:39:04 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35249)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9fgh-0006S0-PX; Sat, 13 May 2017 18:38:59 -0400
Received: by mail-qt0-x242.google.com with SMTP id r58so11163010qtb.2;
	Sat, 13 May 2017 15:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=y3BNiiWa3TzdyvWIM+RUxt4wpMT/JCpF2Co048osrkY=;
	b=m/kTRQB1wZnMc6kR9WjRpXnZJt8awpO6KndRjNpyeJRkDYAi5ozGEIAT2f4c8C+9FT
	ih/nkAXOey4i4KKo5oKcVAqZiOGPxHr9S8AfoOfMPWu8h0TwlD9iaWQRVCKBMFmkxnIq
	OH8T0M2JEYJ/o4uZzoZvQ/R0JwmaK/bDX9tkr33iSPHQAxQ40Afe8+U484GfGAZMj01I
	G/cb6AVLV7yNmNyfgOmAzPUwtmeHumx9fgMdc8f1AJDzWze3+2WnkoIqi47rGyZnrYaD
	KOrABf3LihcDpKQ+thXP0RgtTnE8GKjfa6pAdo4MvdqaK8FnlTLu21D1SCtV3SUZjE9M
	2R2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=y3BNiiWa3TzdyvWIM+RUxt4wpMT/JCpF2Co048osrkY=;
	b=oOo7xSBh2Le3/r4zfKzBtOQ5BxpuHLFVsQv/YGypPnLY+KMJ13uF/Rye1qyz3GVo0p
	xXLGEvil9SHU6O9ZHwPptapzkqafD06QBxPrO+Q4k91qKogxX/h1a95rE+5etc2eGgdO
	lh/t0r05GVgG+Dp4+DwI/cCYSSc1OoyfFjG2ixDDs7hnzqoZMTUrhu1A0NJu9xSLPf1x
	SdZ27BcrK9P1ObJSi5xyAPTxSRp4NbJ7cahep3EXlRN0Gswyh9FB/GGb6Cvuyju/Dyq/
	0F5E0BFz0qJKJs9CZE9/a4CkxcJvno8xdL7RxCxZCQ6AzCYmCgldLyVzf4UWTDEz/eo5
	DsOA==
X-Gm-Message-State: AODbwcCL2clPziY29AT6dISphXBOnGdKIXFUjLZn9T7KwFl0CXZFUORK
	k7JwW0L3b41y2g==
X-Received: by 10.237.60.77 with SMTP id u13mr9639742qte.18.1494715139304;
	Sat, 13 May 2017 15:38:59 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id 31sm5238333qtw.5.2017.05.13.15.38.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 May 2017 15:38:58 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
	<1493122030-32191-7-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKNfzT3P_=CuNhCfXG-_LnJnaZGri+sWqpLk3RAgr_OJqA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3d8c50d6-64fe-6c4b-35c2-3e923c2fe698@amsat.org>
Date: Sat, 13 May 2017 19:38:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNfzT3P_=CuNhCfXG-_LnJnaZGri+sWqpLk3RAgr_OJqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/13] arm: Don't let no-MPU
 PMSA cores write to SCTLR.M
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 44VVlQoAgXPa

On 05/03/2017 06:30 PM, Alistair Francis wrote:
> On Tue, Apr 25, 2017 at 5:07 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> If the CPU is a PMSA config with no MPU implemented, then the
>> SCTLR.M bit should be RAZ/WI, so that the guest can never
>> turn on the non-existent MPU.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>
> Thanks,
>
> Alistair
>
>> ---
>>  target/arm/helper.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 404bfdb..f0f25c8 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -3258,6 +3258,11 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>          return;
>>      }
>>
>> +    if (arm_feature(env, ARM_FEATURE_PMSA) && !cpu->has_mpu) {
>> +        /* M bit is RAZ/WI for PMSA with no MPU implemented */
>> +        value &= ~SCTLR_M;
>> +    }
>> +
>>      raw_write(env, ri, value);
>>      /* ??? Lots of these bits are not implemented.  */
>>      /* This may enable/disable the MMU, so do a TLB flush.  */
>> --
>> 2.7.4
>>
>>
>
