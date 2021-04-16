Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp487007lfr;
        Fri, 16 Apr 2021 08:26:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzn9Yoq2HLQdCRLZyqmIaQqCWF/W4mqWPFKpxqb32Ppkss1aqS7viWcC/omjzViXaDxOC1
X-Received: by 2002:a92:2906:: with SMTP id l6mr7821397ilg.94.1618586772715;
        Fri, 16 Apr 2021 08:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618586772; cv=none;
        d=google.com; s=arc-20160816;
        b=CF42ScanoLoz+lgeKudc0eXyBEa/HuGBub7Hk8vZVXc3s/PbMEMerI6QA6Qa+nMv5N
         /TwF2BVsSCgwGwoV9mhQuo608tRD5647fJvFSCl966tPCYMvP/hDX6f5+xYUS9xXYAoe
         XZ9lqbYxNr8SBMhoF+gXHG1/p0SsvVuQF0QQzXjWibt+j7w2867ORcXkDrY4okxMsPuV
         N89BaInwuTQ45deAJr+8cujZBWE5ua4qhf6VHuJr6Q7VG+vkwZoxCjMh1xsmykSigNWH
         qiL4DLawFl4r70evEd3u2gaKS5K0GYhHPUQBRa3OzjM4Mg7XmlRWgxUp43/3uvo7ojS5
         Vs7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NnuoOxPPrHMSCIm4Zej+9wfvlkfgebd1GmyNbptrKCk=;
        b=sRj+9vhzyyrNcHSwv2OMIIcUWHUEG40xcwAFx/om5nvQtzx1HgKmS3/qO6mUjixFWh
         NzfB/v/qo07QrYxE5f8mIYZwbD8p2E/9xjyOib3Dp12orA9ODDcEeBhvt1n+Gf11YteU
         YispYxncHNeXvxIZ9mcVnH0HN8A5zgyARPrwR2KA/hAQQAX7Yw3AdgyGAuVT04D3CCFd
         74G38YuJ96xb+asl0BBpyeOgEwHLgSg7BSDrge0C3fYNkzPmtc2DbktMjgFkWW1HbCv8
         RmoMSDNOnlMHDnUAvfubP/yVB8LIgLT3t0gLKQdmzIpnyDq/6+8b4sJUtdppO3qLlfj2
         6Kfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hOKJhL2Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si6507920ion.8.2021.04.16.08.26.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 08:26:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hOKJhL2Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXQMG-0002nU-1Q
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 11:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXQM6-0002lw-H4
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 11:26:02 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXQM4-00062I-Tv
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 11:26:02 -0400
Received: by mail-pg1-x535.google.com with SMTP id g35so19389372pgg.9
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NnuoOxPPrHMSCIm4Zej+9wfvlkfgebd1GmyNbptrKCk=;
 b=hOKJhL2YKrcucXA3tAuJ+F1usvMZoIFZe75RHTIU4J2MbYF2/byyVOGFO/TsOtkLw1
 wbzqLPv9XVO3d/3DNfjL/xQjQmuR4Bu9GHCxMXKheN3sqbkPxD/Z2x4tncG10OLv0dFe
 X0w9hig2FoyMr88nQg/sZ2b2SBD5bH/VKALXJWML6tfOkkE28wcg8CiSGJhSZvx9X/TH
 eKm044ywALTRAjqFUg4YuIx3nhttOZzY0qGfSDDPQ0iw4UxcV6Kg0Gb3nC0k+Sl7iSmu
 DnJIhm6Ztdwug4H+jTOal3vzNADm8HSU52RYWhHvpMflxrR9X1zjk9MgwLWi1qXGXGkj
 vfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NnuoOxPPrHMSCIm4Zej+9wfvlkfgebd1GmyNbptrKCk=;
 b=p12q9UxecrNkrJDSztNMLkQjwaq9kvmwaKn6Aw7Wbuct13YLPQWu7Ll4zgqNVVbmiO
 1ipNTBtFCNiMQ+dVYfqOZtHiYxAonNuhNQseZWGXiL65eI3kGKCS+3THVUcDgoi3JEEB
 LLIgpOgTz4yyz03Iyds9LP2utI3s89B6ccY/TGz42IxdbJIhJsq2tm2jE7N/61Z6jEqu
 yk9v73TUEercuplIFk9KdmBH1YuB9nOdAAT4AtTFUSXCYi8xI1CFNjiDGDG96+kwOks0
 IEPAg93yYgGWcEPYOqzzaDIYECIimXQUdVCt+h/oW6l4naTunA1QBMRRGYoNbJmla+wa
 QhnA==
X-Gm-Message-State: AOAM533ZF1kadb2A7uWDmVkK/PGnN07odBJHVF++59KH7ZNomRnOzaQo
 HPzR71dk1F+pfID+HxJCBm6pfuGstIc51Q==
X-Received: by 2002:a63:5301:: with SMTP id h1mr8402956pgb.109.1618586759408; 
 Fri, 16 Apr 2021 08:25:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id c5sm5012941pfp.183.2021.04.16.08.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 08:25:58 -0700 (PDT)
Subject: Re: [PATCH for-6.0?] hw/arm/armsse: Make SSE-300 use Cortex-M55
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210416104010.13228-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4bf90c87-fb1e-c7bf-5a2f-dfc5d56eaa00@linaro.org>
Date: Fri, 16 Apr 2021 08:25:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416104010.13228-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sgIy0vUIRPX3

On 4/16/21 3:40 AM, Peter Maydell wrote:
> The SSE-300 has a Cortex-M55 (which was the whole reason for us
> modelling it), but we forgot to actually update the code to let it
> have a different CPU type from the IoTKit and SSE-200.  Add CPU type
> as a field for ARMSSEInfo instead of hardcoding it to always use a
> Cortex-M33.
> 
> Buglink:https://bugs.launchpad.net/qemu/+bug/1923861
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This is a rather embarrassing bug. None of the test code I ran
> on the a547 model actually cared about the CPU specifically being
> an M55... Another one for the "maybe in rc4" bucket.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
