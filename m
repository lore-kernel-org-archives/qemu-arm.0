Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp222122ejb;
        Thu, 16 Nov 2023 23:34:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiqlv1XO66FBzzi6WhHFLpUFbWIkhvtZVMW8/PFM29jIQAW//7Ve2sffihFu1ptO0ixYoo
X-Received: by 2002:ac8:5812:0:b0:41c:be07:c6c7 with SMTP id g18-20020ac85812000000b0041cbe07c6c7mr11994316qtg.24.1700206490716;
        Thu, 16 Nov 2023 23:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700206490; cv=none;
        d=google.com; s=arc-20160816;
        b=bk8OPYFd2OJCHWW/2c1QVyqVdZKM4JOqKCS1PIjdqxlgVMSNfrMwIm+jtWIcCKaVXy
         kAKLSkGS9QKlvDCs5bEHQ3f7UL5j3iRY6sQdnlSjlXi2U18KGBPpGzL34XGztUCMciBq
         ROOdnq7egcL4K4i6S6APwHBgakDKhAJk1s2zT0yALznGoa4wTa0Pd5gdYe+6zgRpVyby
         buSe5kp2BZY6D80f0/x87XQJ0lqueiyYuKriGiff0nXdg2ZK4OMDRnZCQ7aL2WnvI8Dy
         RUjgFPR/ktWVOk1XHwnr1w3EIY5Kaq7oc+C4L1r7nJWaTYYaHb65x5nEkb9wb2MRJW/U
         HrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GUG/da0yQm5vkAjxdGxAQZYhgv/9yGi8exyh3Zhe7yk=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=xOoy2BFyk/8WaDHBR8nPp6pBwhDCpBTTDKvgA9Nj+ATTgfNZ3cyepwucHVKHiYU2m5
         1LvTQ9jlhIi8OLxNQ+8I0WAGcRlT44o2IGYwTvvT2eYNF8TSPLndL8yxXRV73AQIyhTE
         7dslii/wuHqiynsFvRbyNG8NS1PaXDfvTYVxaS2WXWiedu2XrpNP3/BYLgGFB4k34uyj
         k4vGG92hcoYrLOSW2QMwzuCw6PmgBf9GKFFyrkbZBNJBU/Tk+UH49qNgOQEIrJXKJsmc
         m3/vgBuSTTXPAso2lvRM2YrCw5eoLQWgOzjgnCnwxDxrnU+6zjprNffx/bpulyBhiVeP
         jk4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TUWHVLsP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19-20020ac87d13000000b004181127a232si1161512qtb.651.2023.11.16.23.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 23:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TUWHVLsP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3tMk-0006oU-2s; Fri, 17 Nov 2023 02:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3tMi-0006oK-OK
 for qemu-arm@nongnu.org; Fri, 17 Nov 2023 02:34:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3tMc-00068Q-N8
 for qemu-arm@nongnu.org; Fri, 17 Nov 2023 02:34:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40859c464daso13268485e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 23:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700206445; x=1700811245; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GUG/da0yQm5vkAjxdGxAQZYhgv/9yGi8exyh3Zhe7yk=;
 b=TUWHVLsP7CbIjEcKYgsmUqs/brDghelIVicoxd+cIPpQ4VTZsmFOylSPLgcGDX1iGL
 U4m0ThMz6oYTrYii2aUOMk+tup7JCgE5qC4kzq17Z5m4BfMj5bS03fZTzVY4QezCnWGw
 J+UREQ3XP0rbaiilnTfRkyhYy+NAJ+qmxmVCiH0/ldPppiJFKOEnZPtJZ6td16332s1I
 d4NTtuC7kGeTs2cASRlRqjGokRksmIMXBk0Qru5mrGURvL9ha0m6kwscD+tGtp2KxcBw
 p/JFRntWOhrLR/LymKIQg6WRbNk1iT6KWj0l4Valnm1xrWthnUnuBSfA5UJu8KVwirrW
 +YxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700206445; x=1700811245;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GUG/da0yQm5vkAjxdGxAQZYhgv/9yGi8exyh3Zhe7yk=;
 b=i/aUb7gdFYvNE565oH1pQJxtdB4tsnhDS2XKFs0ezM+53n+2L63ZsGaV4ah6MxDdvD
 JsLrXhY11PpWQFCoyNZ1hLiRCeACIb7Dn2qM/ubFMwcbpKslf63KTIUzb8RHliZE2L0b
 nSyz3KSD0ZS7V+b913eImojD2k3EPRSwS9cVDKQOBkMWJWKLG2uwuoBkgTUvDI8qLYQ0
 uMIsoGpltlWl+d+J9rMfyiHRLCFT1UoPcPFhgl+FJx3TM11SFUcWmPaDRQVfm+L4dcfd
 m+mhBB9WWi/y7iE+4vqc3uSSiG1+PT+Y5Ei5exTKK5/NPk5Pl2uSMiWsu/R8k+BzdDT/
 /KtA==
X-Gm-Message-State: AOJu0YwlRiSBWWmiP42ChSYqXUyhFBIfWlajkcJuJPzGd3fePN1B/H2m
 MpcHZ501WzqCrpVsR7fXeMh3f5ubhNsA28LO5JY=
X-Received: by 2002:a05:600c:1d02:b0:405:a30:151e with SMTP id
 l2-20020a05600c1d0200b004050a30151emr14823869wms.12.1700206444811; 
 Thu, 16 Nov 2023 23:34:04 -0800 (PST)
Received: from [192.168.69.100] (bd137-h02-176-184-46-187.dsl.sta.abo.bbox.fr.
 [176.184.46.187]) by smtp.gmail.com with ESMTPSA id
 f19-20020a1c6a13000000b0040a4751efaasm1698120wmc.17.2023.11.16.23.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 23:34:04 -0800 (PST)
Message-ID: <ebaa5c70-e410-465a-a94e-1a254506a81e@linaro.org>
Date: Fri, 17 Nov 2023 08:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/31] Unified CPU type check
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <efc49f7b-70f5-4ce9-8179-79e8a6abd732@linaro.org>
 <78526851-6d44-4c18-97b8-57462fb42ab7@linaro.org>
 <7252553e-9ab3-4c8e-a867-55c57d0178ba@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <7252553e-9ab3-4c8e-a867-55c57d0178ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: wM9Lg0A6b3KD

On 17/11/23 00:26, Gavin Shan wrote:
> Hi Phil,
> 
> On 11/17/23 02:20, Philippe Mathieu-Daudé wrote:
>> On 16/11/23 14:35, Philippe Mathieu-Daudé wrote:
>>>
>>> I'm queuing patches 1-3 & 5-23 to my cpus-next tree. No need to
>>> repost them, please base them on my tree. I'll follow up with the
>>> branch link when I finish my testing and push it.
>>
>> Here are these patches queued:
>>
>>    https://github.com/philmd/qemu.git branches/cpus-next

Oops, no clue why I wrote github instead of gitlab, sorry =)

>> I might queue more patches before the 9.0 merge window opens.
>>
> 
> Thanks for queuing these patches, but I don't see 'cpus-next' branch
> in the repository. Please let me know if I checked out the code properly.
> 
> $ git clone https://github.com/philmd/qemu.git philmd
> $ cd philmd
> $ git branch
> * staging
> $ git branch -a | grep cpus-next
> $ echo $?
> 1

No need to clone, you can use in your current cloned repository:

   $ git fetch https://gitlab.com/philmd/qemu.git cpus-next:cpus-next

Regards,

Phil.
