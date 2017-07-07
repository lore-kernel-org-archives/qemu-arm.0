Received: by 10.25.44.15 with SMTP id s15csp367802lfs;
        Fri, 7 Jul 2017 10:42:07 -0700 (PDT)
X-Received: by 10.84.131.74 with SMTP id 68mr4281161pld.8.1499449327225;
        Fri, 07 Jul 2017 10:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499449327; cv=none;
        d=google.com; s=arc-20160816;
        b=fvWE5uCcZdCLPHjqZuxklg6DfNGG/bEBYZR0oAv8waBu/IctN99CN8He2bhm/YIA88
         YLX2AqmKa3676NQ9e+rqB6EYBZHb2gKDwAQ7YwrhThDls4lF2ueDkoptDgjEWKQRJNoq
         8qb9ImlPJeKHSx2nnUC1eGIZhD6en/LCwMESC0EXTxcuK0jp4uANv7p4Bfqg/WoZ0EU4
         YBtxbFiEPWG57kShY4uZ4AthJQw8LksYGSXFJIDeorO4SULBkH2EhIg+b4ajEovW07Z5
         jqbEpJdVM/xVqNut8z5q6HUrtOzcdO3V2gFyjNVjYZuS3+cGEfzZdXrik6CPmWF8zAKT
         u9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=xZK8w+tMuOz/CvRg+3oY1le2yabJVCOVF65hhLGRWo0=;
        b=eqMESnzu8qDR3hi/ifgRFs91+qo9y4uyRxYG30xZUZ9UvAXBdETXP2mLjOAwZ+y6iU
         XW62gFG3idg1WudDeDj6TD5HrwxWtt/pMgHKlirIa/s066CJac5lKCkP4AXhKvGEKkOE
         qY8xYZsvnoBIqqoYFFhQ2HGvIYdfpqOn23RpJHFdkr7y7w1BzJrRtvb5OuZBADX7zzL1
         PxS/2xv7JRK5J/GQnxt2m5WKNe+46Xliw8N/Ga4TRBgt9xth50+ncY99HjyOw+NQpEw8
         w8HFBXVssBNvDwyyg/bY90r0TMdzmhmrJcOHZn/L3RbqhJ+awm5wezZZ2o5GqriOjRZM
         10FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=QZF4Nj6a;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com. [2607:f8b0:400e:c05::244])
        by mx.google.com with ESMTPS id 36si1924320pla.124.2017.07.07.10.42.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 10:42:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::244 as permitted sender) client-ip=2607:f8b0:400e:c05::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=QZF4Nj6a;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-pg0-x244.google.com with SMTP id d193so4822509pgc.2;
        Fri, 07 Jul 2017 10:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xZK8w+tMuOz/CvRg+3oY1le2yabJVCOVF65hhLGRWo0=;
        b=QZF4Nj6a8+kDIKjuJQr3lXTppPbLluvTwd4IIV2yxprzisqF3P6bCMNt9ppSPItBZG
         QGwEg8W18xLVSJGEe3kUSrxc8fRcvsMptpvDFfN49NDhSxrQVTMW5ynb+WK3iHdCEBCi
         EwjqDMVTjpmb/C4HnmBjOjXqz7eb7q7b729b/gjlgceOgA32EqZOdu2UYzLtfWtlsr1M
         A5QVRNR28l6Z9U6vG+8hnZX2D88mJ1bkVJ1C9FrQ7RINUc+UwBUhI3DEIREFpKgJd43u
         2BQXSUSZclJx5AGKpmqq6ke+Aa1qlA6sDzte+a7GKZS7AEG7yk7d5HiPYFN1kOCv5edm
         ZdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xZK8w+tMuOz/CvRg+3oY1le2yabJVCOVF65hhLGRWo0=;
        b=C+K1wxWjhV+0c8BQQFqWk7CHrk7wTofng2aiJp2mRlRtOkDqyB/wSvMHPo1X5pUIxw
         vLfq7vRWvZ9R/wEKSQjm8GzL0Ct07Jp7GMQtYKnT6uuZ4bCxsmIzvmqzpjLpdFO+eWxJ
         mPVroPtGN2R2ym8ASRXQ/ImhKEIziO8oFfZH/HS2UJ+rR8N4otrf1Xkmw1M4BuDpISb5
         YpqJIV35aEOpLpK/SaFZG0LUM2wKEeaKMWSeGdgLyPEEXP5cZjrHlTIOp3r4x5VY/pk0
         IeuDphBM/HeMVG1nMO+CFM2z7um+8v7YiP7mwSVC23bi6BkRXAuguA171hWnmG9P7pGX
         7+wQ==
X-Gm-Message-State: AIVw112FRO6ygP/Brhhj1EMvXM/rmE/Tj7USDr0JHqE3IOv7IKj5zLNp
	b++i2JxB2oAEksmWhEM=
X-Received: by 10.84.232.69 with SMTP id f5mr4253078pln.249.1499449326278;
        Fri, 07 Jul 2017 10:42:06 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-66-91-136-156.west.biz.rr.com. [66.91.136.156])
        by smtp.googlemail.com with ESMTPSA id f10sm6670192pgu.54.2017.07.07.10.42.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 10:42:05 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 24/29] target/arm: [tcg, a64] Port to
 translate_insn
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865801156.17063.15618379976159104550.stgit@frigg.lan>
 <244b5aab-8863-3139-f252-09cc02333eda@twiddle.net> <87inj4ebqn.fsf@frigg.lan>
 <c35a41d9-4c9d-3daf-2759-17a784b8711b@twiddle.net> <87a84gcfv6.fsf@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <9611b022-c352-0191-67f6-716b36c8f1e6@twiddle.net>
Date: Fri, 7 Jul 2017 07:41:49 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87a84gcfv6.fsf@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Ofu7YzuJVt7K

On 07/07/2017 07:32 AM, Lluís Vilanova wrote:
>> That said, even for AArch32 we know by the TB flags whether or not we're going
>> to be generating arm or thumb code.  I think that these hooks will allow arm and
>> thumb mode to finally be split apart cleanly, instead of the tangle that they
>> are now.
>> 
>> I see arm's gen_intermediate_code eventually looking like
>> 
>>    const TranslatorOps *ops = &arm_translator_ops;
>>    if (ARM_TBFLAG_THUMB(tb->flags)) {
>>      ops = &thumb_translator_ops;
>>    }
>> #ifdef TARGET_AARCH64
>>    if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
>>      ops = &aarch64_translator_ops;
>>    }
>> #endif
>>    translator_loop(ops, &dc.base, cpu, tb);
> 
>> There would certainly be some amount of shared code, but it would also allow
>> quite a few of the existing dc->thumb checks to be eliminated.
> 
> Does this really need to be addressed on this series?

No.  It is quite a tangle and it'll take some time to rectify.

>> I suppose you can leave the two hooks separate for now.  It doesn't hurt, and
>> it's kind of a reminder of things that need cleaning up.
> 
> Well, I've sent a (too rushed) v12 that features the merge. Since I'll have to
> send a v13, I can split them again if you want.

Don't go to any extra trouble if no one else has any strong feelings.

> I can restore the NULL approach or add a default empty hook implementation
> (translator_ignored_op?) if there's a strong feeling to change it.

Ok, we can work that out.


r~
