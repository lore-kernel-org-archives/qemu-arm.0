Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp894267ejc;
        Thu, 23 Feb 2023 08:39:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+g6q6jNmJJqw3KRB0C3/pXIMSWpCwpqjjGSpJaWtHt8Au42ySMqM5oJX02Mqlr215MpBeK
X-Received: by 2002:a05:622a:610:b0:3b8:6930:ee6 with SMTP id z16-20020a05622a061000b003b869300ee6mr6799278qta.21.1677170340465;
        Thu, 23 Feb 2023 08:39:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677170340; cv=none;
        d=google.com; s=arc-20160816;
        b=f33eHm68khDFrQ427/YCFdIxZFKhGBdHW7k9Hnbnawpn3MBiMsnd3oQyvGniNZdr3H
         JYnWNdF1Brc0TAQJhFMdQflcBcIzeR7lEzvDmIXUS6r89NbwCcqjOc7y/WApqlxvC9MQ
         f78N1MEM0w1hRXRa1yLnsY0rpLiw1cSSjGoo40ahlnjWj48MyZDF3Ezwv/N7v/A0Byzb
         0Qt2NN/JpBSHbY6h+KRDM1gvkfhsssQrp9jSuwrzVBF1XU2P1w+NG6HHdQ9UssCEmBzX
         QubijTuX3w8Nt/g30m2Zr2nzg5G+K/3hPFDRC8fmEB7D9obTfFyf1Mf7mCKsBm/vFME5
         wheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NY9G8rxE6IQUjO489qCLtpUNI2Ga7PjqJ7IJfhnTtjg=;
        b=kESAuRkzpdUCDJIgSjcs2tZ5tPNfwwM9akLGBcLx80p8sNi6D48+myqzDAO+2uV3GM
         vaBW8z4T2Y+r1lHvPuEam/p4aQCA1Vxm3LOMTEd8OG2NssSSHeYHKJwSHLSSuJn3a7Dy
         JWzh/RPBguct+orXVRQxJQib8VMEdepTdN/xn+yRh0Czu/QqnENmGpXoYKmkHeP8Tuex
         rr5G8DkPb8CdXCTkCFQbe2l8FkxZPRxjfzb0fQjTAZmOtnQTUMa1DKtvM8W84xlg4dhn
         8LmMVEk4Bm3wbWU/qziGWpxSqBuIti9QrfLK74n2mc4SueDzeDni7/g8pAcwyijC8G1D
         zwag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="geq/A24M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020a05622a060900b003b9c19a724bsi17755427qta.489.2023.02.23.08.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:39:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="geq/A24M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVEcL-0004wC-HR; Thu, 23 Feb 2023 11:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVEcK-0004vf-Ca
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:38:48 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVEcH-00015T-GF
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:38:47 -0500
Received: by mail-pg1-x52d.google.com with SMTP id z10so5839950pgr.8
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NY9G8rxE6IQUjO489qCLtpUNI2Ga7PjqJ7IJfhnTtjg=;
 b=geq/A24Md7YZxO0gXYpg8pDU0eBKvvcb3rT4dHgNQm6zc2iJPnwPVjZT1UVvw9lix8
 ghVQKEKVYaLNRWVBKFoVJNYaRyTHKYjS03lRHRYkZ4wSOz+Tg8HK7qslelLYOlA5mb0f
 6B7Q3ZG62LlYBLmJ46h5NmTU08JoWStdbTASxWCaRWkF4nZbhZPpz2NtS2JEYO1VY/uU
 sk1nkemsM4GM69gDmgPUGgVhRyWcNMGFls5ZCb6gClGwIHiVh684VnkXQlvS/qvTzsqD
 WVY//0J1Q8LeHl3WGRrGG5j0NTfhDt2O18XCTtpamhR2r6Pv4DZi9+/DIyvEaUIGNkXm
 lulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NY9G8rxE6IQUjO489qCLtpUNI2Ga7PjqJ7IJfhnTtjg=;
 b=A7eyUlUjW2V7z+dRoaK/1/lLsUJl+DgpS7lkZyoBwP2G49KFP50LrWJ511zSQ0i9g8
 9z/dANB4ckhNXQF+oBJ4MEUw9gfhpHyJD6VFY1M6Lv4i1JA6dcpljHhPXQl+XcaVshzz
 6eFYPWrUIfIMVXty+VEkH97gpGPqfaKyQ0DcHTYeLtvFtb1TMoGOw+6Ci8z6tmADg3cI
 ekTtMIw8d2IFf/6gJrNoUBodQLf0yM+C4+sPV24j+9EXa3lKYybGmZhCvvyrgGuHyicL
 IM5kyJarIIwJ/e1ZgE5d57GdEi4am/+KhOgj92ucX/Cabidra1BnexFgKt2Kph3+9Hxy
 F0IA==
X-Gm-Message-State: AO0yUKV3IRUCzSr5mHBJMOXThQOrPDqNKLA8WVK39Q6cwVhG2eP1fzoM
 VWjVOLUxpmhM0XKEjcU0n4a0ow==
X-Received: by 2002:aa7:9e87:0:b0:5cb:ee71:5069 with SMTP id
 p7-20020aa79e87000000b005cbee715069mr10517376pfq.16.1677170323183; 
 Thu, 23 Feb 2023 08:38:43 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 e21-20020a62aa15000000b005a8b4dcd21asm5341229pff.15.2023.02.23.08.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 08:38:42 -0800 (PST)
Message-ID: <6496736b-2518-e715-3555-6db017df6d15@linaro.org>
Date: Thu, 23 Feb 2023 06:38:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 14/19] target/arm: Check alignment in helper_mte_check
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-15-richard.henderson@linaro.org>
 <CAFEAcA_N1zcgg44v7AmKgHJiuE=Od0cCV8q1OW1YS9_hJFAYhw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_N1zcgg44v7AmKgHJiuE=Od0cCV8q1OW1YS9_hJFAYhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WEIzUscjoEkT

On 2/23/23 06:28, Peter Maydell wrote:
> Also described in the text: the I_ZFGJP priority table lists
> MTE faults at priority 33, basically lower than anything else
> except an external abort.
> 
> Looking at the code, is this really the only case here where
> we were mis-prioritizing tag check faults? Have we already
> checked things like "no page table entry" and all the other
> cases that can cause data aborts at this point?

Well, yes, we do the page table lookup in allocation_tag_mem(), while fetching the tag 
memory against which the check is performed.

If there's another mis-prioritization, I don't know about it.


r~

