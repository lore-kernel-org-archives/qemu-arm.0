Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6443915lfg;
        Thu, 4 Mar 2021 09:52:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy05/NNCShLcwQYfcoFzsq2FJugamnB+V2B0ce4NcIxaXj2aYHFpUrg7u7DfhfUEOn5EirL
X-Received: by 2002:a02:7822:: with SMTP id p34mr5212928jac.65.1614880362296;
        Thu, 04 Mar 2021 09:52:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614880362; cv=none;
        d=google.com; s=arc-20160816;
        b=N4y8GWXQZcyEhaSD+8LjG8HS6T92HJSqmEXIbtbi6drU+0mrbck63SMNSMMQnIesup
         rQuufiAIg6a0qVMhOhcnvdlQhq1MVymmeG576bytTa7EyXtFFaDEg/W+dxK7eKbdDzl3
         89UzH4No1PMLbPqbyDI3mlD27YO7VS6ac2+FcA6NzYie5srvdw2QPnx2Bu2xwkGdNGI2
         EGtg1Tj3YxSbm/wLI0nmIzxaH0NfU+90CnC0ziNZT1R+bR4rfYlYBdZntEMGVLgKR3jw
         BDQFgFEGjUPgecWfuFL4pCXZWvCuOWRTGiY5fe6PgOr4urCfmCWTFtg3aqHwq3ASxf90
         jwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=vP/YVgzNN7yI3OKek0IlM1rfspFbvtx8CGK6bZLk76U=;
        b=wxYJxCR89vSJY5SCNvP18+T8tcC9VRpcZ418wXkCb3Y+I5edIJM4L2CBsHxiZhL5wk
         Dfc/V4GN2K14KFf2vFa33edFLV6xcj8hcKkU293WdF7GDtHMhiWZ8xmiS+j/LgXJhWG0
         J445uualuYP0vEMh7y48D44A0b2Hf4jEuJ94OLOM2zWT6PbUUJ/8P0ZSx4cpNETfy/Ki
         3cYpNx2JTCwUfsr9yZ4Zk6CDdr8LBGumfQ3YL6hIJvFXkqLXejbUrMoW0dMAy4mJ+CKf
         LqKGUXUq9pjqBGj0ef5D/qiEHNUsk3CoLsqnbHTg50epqXJ1Fdu/gOkjtkw0QGpuo2DG
         792A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SUE/tzsn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n26si16786jam.115.2021.03.04.09.52.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 09:52:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SUE/tzsn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHs9R-0007nD-Kl
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 12:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHs8e-0007i7-II
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:51:54 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHs8c-0000mn-MR
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:51:52 -0500
Received: by mail-pj1-x102e.google.com with SMTP id b15so7063824pjb.0
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 09:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vP/YVgzNN7yI3OKek0IlM1rfspFbvtx8CGK6bZLk76U=;
 b=SUE/tzsnqEzFFIduUxrouJqAeKokCjnYHsAl037VK1x9sIyMpWL630c/30wBCq7jwV
 kfP4y38ipV80ydrjv9KbHGu9gYO+Pbh6hvqP9VBu0pBX1mUDpZSIFx0c6kvULInYsBFz
 ODWsQsobrjvx5l3AxFQ+5VCTKqwmCUqohOqcsleKReTzZnKstub1yw10VxpJJFfjvpxg
 i2u3LVidEhikDkHJ1FdTOMkxN+2d4QurDjW/9LD5aQAyqmEKx15j/KUqNUvO66iIgoqc
 PB2dScVhCa054dOueoRY1K1fKHQY3rNmca5Z9PAPeecpZxSRh97kePaCAnsbU25IWRgw
 bieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vP/YVgzNN7yI3OKek0IlM1rfspFbvtx8CGK6bZLk76U=;
 b=N2wV451fnUrhjX/f7wKW6Avj1e6uwBZp0c1rFl3GGyOvDSbzh2LTmMGrdqQnF4WPbk
 UD+HGq1dOXeCvuqx3PcWZeQ4zda4o7HAy6QoZ1020rqwzZMYwg3yfuqwWI/p+xWw8TZx
 pIybVP+XbLTIy7fGJsrUVwr8WecslbEDSKssJ5c0G8IXyeb8MXMJeDl2dVwiydMXhVtf
 Ni4dJVbwtH3ZYnssN1WQTdzNMjhCJcb0zEZQtvz36BaGnOuJY1uVZ9BY4KN5VEoRFnIe
 VBu5ux5Wy9l6rVFDEBS4e9JyqZAyKgp2MBYHvRbiAS5exzrnhMaVdhT5clByW5g6WVd7
 3JHQ==
X-Gm-Message-State: AOAM531Y/MiXGUc/1/xGULOMcJvzo2/n7qoHug/kO9jiCaVxdfwQagBk
 kZP6Z3NH0qHQEVSVSPjxqU2TflZtbEkMpA==
X-Received: by 2002:a17:90a:7c0c:: with SMTP id
 v12mr5584200pjf.63.1614880309091; 
 Thu, 04 Mar 2021 09:51:49 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g3sm59339pfo.120.2021.03.04.09.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:51:48 -0800 (PST)
Subject: Re: [PATCH 07/44] hw/misc/iotkit-secctl.c: Implement SSE-300 PID
 register values
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-8-peter.maydell@linaro.org>
 <0f167565-0af3-ee18-4f16-ec0a8aab12f9@linaro.org>
Message-ID: <68619933-adfd-2240-8910-2d8e6e0ef6f9@linaro.org>
Date: Thu, 4 Mar 2021 09:51:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0f167565-0af3-ee18-4f16-ec0a8aab12f9@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: obttKm0CM73x

On 3/4/21 9:29 AM, Richard Henderson wrote:
> On 2/19/21 6:45 AM, Peter Maydell wrote:
>> The versions of the Secure Access Configuration Register Block
>> and Non-secure Access Configuration Register Block in the SSE-300
>> are the same as those in the SSE-200, but the CIDR/PIDR ID
>> register values are different.
>>
>> Plumb through the sse-version property and use it to select
>> the correct ID register values.
>>
>> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
>> ---
>>   include/hw/misc/iotkit-secctl.h |  2 ++
>>   hw/arm/armsse.c                 |  2 ++
>>   hw/misc/iotkit-secctl.c         | 50 +++++++++++++++++++++++++++++++--
>>   3 files changed, 52 insertions(+), 2 deletions(-)
> 
> Which document am I looking for here?  I found DAI 0547B "Application Note 
> AN547", but I don't see these register definitions.

I finally found the sse-300 subsystem trm: 101773_0000_02_en.

r~
