Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp508639lfb;
        Thu, 3 Dec 2020 08:16:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwI5CUu1BMbAiT2mppJnKpRvjlfu7ULt1G3rtvSSin/yxhFWM9N2EHbkqw7C4Cqe6sRf2go
X-Received: by 2002:a25:45:: with SMTP id 66mr5500225yba.81.1607012192966;
        Thu, 03 Dec 2020 08:16:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607012192; cv=none;
        d=google.com; s=arc-20160816;
        b=uyLGbdqJz0vRBWAnM8pemLFcxYFxW8es63HKkIyx2DJa3L91VsTFVT95/ZtvdIMwGT
         4P0Mf8y/zwlmweaJxiSiMztY/woz3uYpxI7QzBhsWXfYADftNe/KMc2vYUoWwh5Fcz3w
         tIlaaJdvOM/yPuTFpXJvszjRsLt2H8ErNit0gPj9rW+3Z9/rz+a7kAqze2gy6uDhggaL
         N+SVjEKYHYHVqL57D92vn0ZfZ0Yqpb+4n71P38qk18xU3c4BC5L0bUe9i1wb5TSZDSUW
         rt14EX6agTquogDHrdBahTIfy6ZS2AQ7jNQXXh73icWezQl0iVvqWyPbwd0i+qggekaL
         lf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IPPAffN4yagbi7eODeoKPenRSw5Nap2P8dgVVfXBjgo=;
        b=t7+TsXIseVwC34GNrg6FOOMsREnI2pg8dId1c4pWgY+Yd34FGXAutq/yMxrOXDJHw3
         isLXCfIGxmxFkZTua0m/w1TEuhYPzNxTQrJdeSpBIWeMWSfJ94EFSMUD4QiFnikdQgz2
         nozgZ2WuSvqw1UvM0X79bd5VVMzz4lx1OTzNyoYIkIrBiPyd0NLvffQHGv+1jweFM5yr
         BTS9WsocytMh6sOuavF0muzMcK5kufgbxo7fy0pkKYg1vfh8w27sjWwylXVO0XjWVLxl
         OguJPk6gI3xIgqgg+hK9p202+n+l4+c2YkUgYBUJ4h2sUPDgcyV25mnQn8Z+6vr5dl8m
         C4uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a8qWDflH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v133si2049916ybv.295.2020.12.03.08.16.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 08:16:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a8qWDflH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkrHU-0002d4-DJ
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 11:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkrGN-0002bb-2q
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:15:23 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkrG8-0002zI-7C
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:15:19 -0500
Received: by mail-ot1-x342.google.com with SMTP id f16so2217743otl.11
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 08:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IPPAffN4yagbi7eODeoKPenRSw5Nap2P8dgVVfXBjgo=;
 b=a8qWDflHb559fbVC2iQk1X4wrFdlY1GlAiqG80/3Mzhl3wil9h9/t9qIWRsf7ow6vc
 aiEMbNfgvClcRg82qjot02sxpZS+ojayW06KsFeFQd2EPzyg417uRLGur5hGPknJyLTn
 VeXdb9StOpT3YMP0W89G1Fwzk9IKX3RRq9ySNmFZP/iIf0g+nOWsGLG8SoB4NM7v3n0i
 Lg+W+1ak2QVHrdO3uAo/nh5L20ErRoBdYxfXB/j27crL6Qyz1t7KsJ6vDVpZ+mZWnIe3
 uIQiRUYlxLlqj4MxOOpVrMkh3tnd4C8fbX+/vhPvbgGQS1XAnk30Ha6PbMoJvhYNCoIm
 L2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IPPAffN4yagbi7eODeoKPenRSw5Nap2P8dgVVfXBjgo=;
 b=WzE30B7KDPh2tkYjAflHq6ep6RQXjcLi5tzZMpDDINKWuzhIBYFD8wlMuGDPbzDYPT
 uMhmdRSoe1uhMm7uxtwrn7859YhXtA1uKq/V6BKAHXrVxsVknHd8Je8pN6tYlEbGdGI0
 xJ0rpIhxqcvqCyhf2fA0nOkFBPNLRdzpAIF1V7gYMez97q/SYpnu6CeGn1VzZ7it9ay+
 CnbkNykxgfr4a63/oAFfsn97qXVsT7wcXl4R5kDkObzR2OwWkSe7F8qBqmb+2nwaV4+8
 jjzGt9KaGH4hjVFLeDqpjM/+MDmahljOipItwP73gki026C+02CAX7P3qghUVwH6mVn9
 VHmQ==
X-Gm-Message-State: AOAM533kRmpBYhKSW57iETZnnJeVrhZmgOT7ldXemFbpZRkSpBTRJWe+
 SqgvaenLMlguPmW6UpSQoxlz0tnMGAh7Tkyh
X-Received: by 2002:a05:6830:22fa:: with SMTP id
 t26mr2583260otc.343.1607012102560; 
 Thu, 03 Dec 2020 08:15:02 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 64sm314965otu.62.2020.12.03.08.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 08:15:01 -0800 (PST)
Subject: Re: [PATCH v2 09/28] target/arm: Implement VLDR/VSTR system register
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-10-peter.maydell@linaro.org>
 <74666363-8965-279c-8b00-bf6d61d22be4@linaro.org>
 <CAFEAcA-8LR3f3ArcbK3iWRGLMRrUTwJUEmYvGYHpzMLXHMmkvA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55ba1846-2743-ad08-603a-b6210cb8ca2d@linaro.org>
Date: Thu, 3 Dec 2020 10:14:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-8LR3f3ArcbK3iWRGLMRrUTwJUEmYvGYHpzMLXHMmkvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fn5DjvoOnW/R

On 12/3/20 5:39 AM, Peter Maydell wrote:
> On Tue, 1 Dec 2020 at 13:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/19/20 3:55 PM, Peter Maydell wrote:
>>> +    gen_aa32_st32(s, value, addr, get_mem_index(s));
>>
>> This is MemA, so should use
>>
>>   gen_aa32_st_i32(s, value, addr, get_mem_index(s),
>>                   MO_UL | MO_ALIGN);
>>
>> a-la my patch set from last week fixing other instances.
> 
> Also " | s->be_data", right ?

Ho hum, yes.  I saw your comment on this in the alignment patch set and I'll
think about A Better Way.


r~

