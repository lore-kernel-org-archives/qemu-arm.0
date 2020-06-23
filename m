Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4362080lfm;
        Tue, 23 Jun 2020 13:06:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbqwjI5/tqUJeD7XR1ST7gpMwmxbuqFn+FV65JyfZnFA7JKL4dtZ9ORAiN42weGYwt3T2C
X-Received: by 2002:a0c:bd91:: with SMTP id n17mr11628550qvg.226.1592942811314;
        Tue, 23 Jun 2020 13:06:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592942811; cv=none;
        d=google.com; s=arc-20160816;
        b=eItCVka+vLS51l1LU6O0leRXRVVSfYZ0SnFLol5VMsxrL1bUE5lzKrR4/hHducVOZv
         n41feQA85nG0kHlhsQqfNBWWsRp3tYAAFkCP0U/K6mTmkDPr25oXZ70qURr7pZDKQ9f/
         ta+tstVePAOmd8kS/RXEBu1CogCuEzq/GEMXtlcMOU50ChvsMQIIheFHJaWzEstQZwYP
         Ilp3yL8WykHVyR4II7HI9eBvTy9Yaq+dfjFd0k0gjgiHCXmiSX8Jj+U0mtT41D75+VVN
         kvsqOU5CqNcZp1PxLNQJXPAAqF2Pb0KQ4cZbrFh+PNL/10K8tZVsvThMyfv3bWyAHd5n
         Z6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MgiVyPKQiE159i/baoZD/+r9z0mORJeLztQ05s8WYIU=;
        b=KiAATixcftceGw5uY7I6349HXrP4RWlb1h2X6LGVd0re5QdLw2jpCH80mExdnqt0HY
         PgWrcUT3zCcf2B4SSnjMmXg1lFXdW3ZHOHpXSOfi1G8rZ52mjwA0EwpfFEDneKWQc5SE
         eHkAYaMjWRgh+GfiAIVAuzd4zuTKZ94vhs7fLFLR/A3NpCnttcxWfczZmStOl8GomJIy
         0J2495SK40RmjMXYNLDmZE9LgKml8h/JiJW81pjSE8mqzkVsZyFBMWzxD6LcsWdadAvA
         EXCFmTJeZlt2wLa2UJL/+phylaDfY8RVFUVxlb3Ee1RrTT3yujhEg3THlDHaGOwPcNEa
         BAaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="wJDs9j1/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si8296922qkl.141.2020.06.23.13.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 13:06:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="wJDs9j1/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnpBy-0005aM-Hl
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 16:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnpBh-0005Wk-CJ
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 16:06:33 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:53251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnpBf-0007Sn-8a
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 16:06:32 -0400
Received: by mail-pj1-x1044.google.com with SMTP id i12so1951375pju.3
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 13:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MgiVyPKQiE159i/baoZD/+r9z0mORJeLztQ05s8WYIU=;
 b=wJDs9j1/RP8++qikZxGbFYK6J8KsbngoIKfEXn9wCsh/U1eeQZzRBLHOHsHjDTKB5d
 Ne6H7bcnthLAvtJyVxnDxbRzhHNOkbVOAuI4jQpPwA6JKYJwHnyqZmvypI7Wugr0dNVF
 QLC4iz5fxpBzWcUR8t8Y6tXo95N9WV+afZnPuKJpKPcEGgyWg8HeFfMw8g7Pg5M9s+oJ
 YuGmXi8C5PH7kj4tnVuReUsssmx5LGKD1/OGAQLJOHKrfFX/snigHYbbxWdsDfE/5wkw
 BxW2Sq2sixYmaI0UbxrEUjIdM0w5MuhaD9FFvEL8fIYq3ggu1qjs20kmnwOIXzp6BAMd
 nSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MgiVyPKQiE159i/baoZD/+r9z0mORJeLztQ05s8WYIU=;
 b=g6jS8WYiboa75nDx94fshLGEaiX2cMph8fAT5Sc9ksuBt0ICjOZ27LVQ2ICaCrV+6p
 0RfkZVMTfU2XdBBde5Xf8LrpwRJZj5jv04d0OoT0sJWzo7VKPqR6iV6ZGbA6JsFEO/d7
 Pnng3X9gQiy2UOtD7XJfAXB0QWSU1RvJuFotyFVeFdeRRDfVlroQS/3QLEuMb3c1opi4
 pnJf9mC9e/A4NHxyMidieR/wN8UTRcOJ435mVNzXO8awuMYsKYWO3JSDBVTqNm7fuQ6h
 KeR1Mf2aWFOwsDVLttxoJ7MtfdFB+l/i73a43HDv+lahfkt6JzgPNyyK2hq+y1t+bA/K
 VVpw==
X-Gm-Message-State: AOAM531pxLL1VfF2oJcJX0fGrZ3TwQzfOuQhVobpcLMS1GiWn6MEoTlq
 aldC/Ncd2VK06QJqm//IV9sD+w==
X-Received: by 2002:a17:902:db83:: with SMTP id
 m3mr1666694pld.176.1592942789685; 
 Tue, 23 Jun 2020 13:06:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q13sm18418489pfk.8.2020.06.23.13.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2020 13:06:29 -0700 (PDT)
Subject: Re: [PATCH v8 00/45] target/arm: Implement ARMv8.5-MemTag, system mode
To: Derrick McKee <derrick.mckee@gmail.com>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <CAJoBWHy9HfD_hBbJNgG5vsM5Wt_kiYYJyYAnxfTNzq2nuohk+w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e54ff84-8355-00c3-bdfb-f05577432a93@linaro.org>
Date: Tue, 23 Jun 2020 13:06:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAJoBWHy9HfD_hBbJNgG5vsM5Wt_kiYYJyYAnxfTNzq2nuohk+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, steplong@quicinc.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, david.spickett@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4dKU0ryy1KhD

On 6/23/20 12:55 PM, Derrick McKee wrote:
> Hi Richard,
> 
> I am currently doing research with MTE, and Arm's FVP leaves a lot to
> be desired.  Is there some way I can get access to your QEMU changes
> that enable MTE for system emulation?  Thanks.

You can apply this patch set to qemu master.  ;-)

But more seriously, this patch set is in the tree at
https://github.com/rth7680/qemu/tree/tgt-arm-mte


r~

> 
> On Tue, Jun 23, 2020 at 3:37 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Version 8 incorporates quite a bit of review (thanks, PMM):
>>
>>  * Include HCR_DCT in the HCR_EL2 update.
>>  * Use a separate decode function for ADDG/SUBG.
>>  * Use the system arm_cpu_do_unaligned_access for user-only as well.
>>  * Fix alignment for LDG.
>>  * Fix no-fault for mte_probe1.
>>  * Rearrage how tagged pages are recorded.
>>
>> and perhaps most visibly, for those tracking the kernel patches:
>>
>>  * Add arm,armv8.5-memtag to the dtb.
