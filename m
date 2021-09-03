Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1407876lfb;
        Fri, 3 Sep 2021 08:36:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9QVel0zfxRVDcMJU3l5mYO3dhUTj0nsHNRGTXkVjo4JR7pIKtJ+gD9sjvh7vwYugiNGzc
X-Received: by 2002:a5d:9e0f:: with SMTP id h15mr3515522ioh.133.1630683399880;
        Fri, 03 Sep 2021 08:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630683399; cv=none;
        d=google.com; s=arc-20160816;
        b=OdHUpvVODsujd2+h+oymRyuzhBY0VGXW1a2b1bikl20hPyhaiwRPWlTQWYAAU60rG+
         wSuHrlATFQcXLl6zo3uyLlUml1WkabCk0gTcDRg2qHOuDFlcuh5iABKktyaDGf49umMg
         XolyHMQdVl3D62t0yjU54l+z0aHCqw86/g7pit1M6GVVngEKMqFSt6k9scC9AyKBXl5Q
         3bI7HJFyLnyyorpIPuMV/BJBm5IaiqSj/HLEDDwgxZy38Nb2cOrFB9toZCpopNB+56d+
         UcrWCxaYIXe5yjaBVLw1TCX/+ZekWT9wHxuzjx/9YCmgpeinmINMxrOSqu50L+hz+E/Y
         jNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yJoWkIFRm9a51JgRLNbr/EXUc+eFEA96SZjYN+aZuR8=;
        b=d7wmkeAzpPHrC3wFMC+9X/L4RdhoSpdnK+nc11hlzPddg+32ufFykVyBW5HfFhnkeo
         54O9IXtwXFECjvyx3cfsAHCtQ2KxGtYn49aalEiWGYu7ReYXV3yPFVbIq/XKfMWrp3rf
         fzSukxMSoj/ZQq8Ngjfv5KVpa0fRXmoSyzP/ED5+19L3k2LFQlRRfnFC3X85TAJRMm/5
         NjnAzWr4oiYAFNDxLmOAbvr69Gc2LV3omLDGAXYF9DbZu9oQBznCCE7cWLGsVFw5rL2C
         we2y7u7z889JfxgulTd29ozcqjwlLdIDJydgf60N4oicuVQ3QIBnAbdTc5bUKtBno0No
         DWRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tyvy3ALi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si6399362iow.65.2021.09.03.08.36.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 08:36:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tyvy3ALi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMBF9-0003Xo-8G
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 11:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMBEr-0003X4-Mx
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 11:36:21 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMBEq-0000bl-4p
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 11:36:21 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so4084051wmi.0
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yJoWkIFRm9a51JgRLNbr/EXUc+eFEA96SZjYN+aZuR8=;
 b=Tyvy3ALiYtqZ7quWoaIiIkMFTIPHzgDLYG7oTLZ7QALx5TvZiB/JcQyvH0+a8VW7OT
 QEFyPSWNMMLe12cytOo7QCRKQrDZY0M80btpRz75cZBGbfqaqzYoSzWDL5LkvgesQ019
 EtDDR7bO64pp8BShF14jTwJZcMJ3+YYNQRi8GiozmY32n6PeMhlNG6Snf/bMwFQBXYCG
 SC8O2RIvYzeXZS2gU9BtqvVNb7Zo64VpvOyub4nftzdN4ndCXpfvHZOgOSG1gLNEaCdF
 q67uwLBOIzpz/Mrsa/+SZC0IbdydiYwrtHvgWwSdVUWxjtJCe58Gm2CvhY7t31T6Epvz
 9wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJoWkIFRm9a51JgRLNbr/EXUc+eFEA96SZjYN+aZuR8=;
 b=JCVgcNCYlKwe59PBFtrCzGdFinHmRhqtP0CeP7ld9nfNJDhGv+rkb8LM1xPr/WI05e
 qxELgTF7lNAnLVyVI2PMfjp9FfWdJOglzUMkixK6v0qWdcFP55EFpLyamgJYwQg6Enmi
 9/guIJCCZvgB5ZGjPfTF44siXbUaMuoc+dCTG8EZEnszOgt9M9qkYyy+2i0iA0tqD99r
 BR4jhXc8WQX0AHeRjER2uB74To4t4aAgW1hzB/ANwLZgAEquATjU5m/m2N/vlloLduXy
 /AYU1htBqivLVmsBy48PqRSyTiyA4p32hwXLJsJSsZNapB6KZV3cDak3L7m6m1fPD1Ze
 0vgg==
X-Gm-Message-State: AOAM532bq4U5M95CaneY2eNCgcu7OC40ohL52vit1yb7fhiq440e0FOT
 iqHYPJDVQghwwEGZfPtWZtCaLw==
X-Received: by 2002:a05:600c:898:: with SMTP id
 l24mr1034153wmp.90.1630683378503; 
 Fri, 03 Sep 2021 08:36:18 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id r12sm5344839wrv.96.2021.09.03.08.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 08:36:18 -0700 (PDT)
Subject: Re: [PATCH 0/4] target/arm: Use TCG vector ops for MVE
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <3209af2a-7611-b385-aa7c-6203f442d05b@linaro.org>
 <CAFEAcA_uq6bWPQxvPz5AWEwcZdg7V0tybvxNtwNaQeOyT9ChYw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <afa6d71a-b710-a7ad-43ee-a3764ce85553@linaro.org>
Date: Fri, 3 Sep 2021 17:36:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_uq6bWPQxvPz5AWEwcZdg7V0tybvxNtwNaQeOyT9ChYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JVuYOhAw9pFr

On 9/3/21 5:20 PM, Peter Maydell wrote:
> On Fri, 3 Sept 2021 at 16:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/2/21 5:09 PM, Peter Maydell wrote:
>>> Richard: if you have time to scan through the MVE insns
>>> and suggest which ones would benefit from a vectorized
>>> version that would be very helpful...
>>
>> VDUP
>> VMOVL (into shifts or and)
>> VMVN (which seems to have gotten separated from the rest of the do_1op)
>> VSHL
>> VSHR
>> VSLI
>> VSRI
>>
>> I think that's about all.
> 
> I guess also VMOV (immediate) (vector) ?

Oh right, yes.  I skipped VMOV because I remembered that the register version is an alias 
for VORR.  Am I correct that there is no mve insn corresponding to the NEON VLD1 (single 
element to all lanes)?


r~
