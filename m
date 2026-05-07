Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B74CD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 10:17:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKvnX-00089P-Sd; Thu, 07 May 2026 06:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKvnX-000895-6N
 for qemu-arm@nongnu.org; Thu, 07 May 2026 06:17:39 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKvnV-0002eM-7F
 for qemu-arm@nongnu.org; Thu, 07 May 2026 06:17:38 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-453903ee4adso196288f8f.3
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 03:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778149054; x=1778753854; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ZU0xFFedTu8SnMhVzIjPhGWcJbqjTEA0Xc3KlmnmeM=;
 b=uA9IVt+NHeHPz41zhGwnYkjYQelmJk2yoWjfI3Y0I+oOImM2boFsL4zRMEkwssuOPz
 qC07HdozPd5IHjAzbGzFTXetKUv8x4twCUZG2jzf355BfTRYMR+ULLDWCyWgQmCTinGZ
 HgKzoZcM/883vWKqXu7xP1bL2p9URg53t+8elhOPWw5az5JXLL9mUvpsVTQAj9GAp5bX
 e8qqf/Q884+xBlaK8m8cHRQ4eoTbHVLBHFfJPqzf7I6hK/0JGIpuh3kUpDBSCIsVd1H1
 i/uUE3b8fFSG4UT8opn39Zc/HLR2PAx2YK0JGt6NzBhfWCK997O1LImiYnMV/ZaZcsPx
 G2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778149054; x=1778753854;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ZU0xFFedTu8SnMhVzIjPhGWcJbqjTEA0Xc3KlmnmeM=;
 b=I0CL0w92rSMjkQNbHWIPl1swLhrVXQvAHqxkEuUH1i+ZIDLM3nTjGQoYKy0S+Izvgl
 ulx+cdxyqEmu7JseQWgY1JTjnpsZcn6sA0bt9fa0lr6OUMcDAGXLSGMyLRokExSmS/PP
 8S+i6gmWjWwmT+7FRbcHlCbbJUZvHxuTX6LIka2IaHttfrV8wWJ0V1S7vlARPEkcJ1cv
 zbOPD3aTJBXPwPQlFt2R1IQLCb1a5vu8ed1JIA1HqRJ3bbdN5JfnYcnt6/U4aF+ihmDc
 q3jU/U/L9jDeHyVvIMxGZs8fai2L/eyBFYlL7x2GODDYRVo5j3DzSWIRHJ45h0n727k2
 diHw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8LXqpxrvxdgTUd73a0x1Dqk/9XAiQitnqgwncLGusDqDrDvK4G86NbLs/cjOmqpjRowe7DGo18iw==@nongnu.org
X-Gm-Message-State: AOJu0Yxsa7dp9HUO+V9M8GZD1MppzcRJ5ADmhAfOImDKdABOY/EXLB23
 1rolJtOJSRdFV34tdcxWc7jPF2QO7dUEEg4idtWTA3i7IVFq68VRoGKKJ7yV69sHNE4=
X-Gm-Gg: AeBDiev2KGjqNaeBNewZGuP+vfQRDSQ7Yt28ZAC4klfZuLD9oa3GMH1KmHQ1ErIRGDm
 GsNDN0jr/AkeybyAsV4uNukyXfVX2WLXDOBWSuisYAtBm9SrkjoSCZJylASk//jcAN+IJnLga2p
 4k6mKTA//vlvhzJ91kvPBig+WUUHEaYixnsFp0Z034KNMT8BksFD26i9kTK6ChkjHO/qlC0LwT4
 YKvPsBAPy8gPRKg6Ws7EBPLs7Ot+R8ZzOLyLfL6ymz4r9d6//3jF/R8JW20ZkxP+T5sgQviy/8S
 Zo4onY8LtGDlgK1aECLIaMYwxpvofHUmbdCUUtQJRe4oWS0ixh3bTwNxw2cGq82JRgAFX8/3FrT
 IzTtXx7vjysqnuSlo3ABTZ/PW8H5ZGS/dRCbXxH154iTaHyXyWaaPUHq0GJSlDYxO9TYVNfcLCV
 adaPetzCRJEGLYcWeCpacV+eXjjgP4qsxZ8w1diKM9a02SgtT7iOPshuOms66n4gv51bPxVXzdG
 NJo
X-Received: by 2002:a05:6000:2309:b0:43d:773d:78ff with SMTP id
 ffacd0b85a97d-4515ce1c7a9mr12676585f8f.27.1778149053723; 
 Thu, 07 May 2026 03:17:33 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45052a48c04sm20144598f8f.15.2026.05.07.03.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 03:17:33 -0700 (PDT)
Message-ID: <f72abfd1-bef7-407f-a62d-465d9aea0aca@linaro.org>
Date: Thu, 7 May 2026 12:17:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future of target/arm "max" CPU type
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 Gustavo Bueno Romero <gustavo.romero@linaro.org>
References: <CAFEAcA-WB+vfiHZpPut=AdEOCXacsTfrvxiGAmhaGH1abHD8ag@mail.gmail.com>
 <4a46393d-08be-40e9-8f52-788d46ab36cf@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <4a46393d-08be-40e9-8f52-788d46ab36cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/5/26 00:17, Pierrick Bouvier wrote:
> Hi Peter,
> 
> On 5/1/2026 6:26 AM, Peter Maydell wrote:
>> This is something we've discussed before. I don't think I have a very
>> solid grip on it and I suspect I may be missing some parts of the
>> "problem description" (i.e. what are we trying to achieve) and perhaps
>> some implications of the choice. Overall it feels to me like a "no
>> obviously correct answer, make a tradeoff" question. I've written this
>> up to try to clarify my thinking and canvass for opinions and for
>> people to point out what I'm missing.
>>
>> For a long time now the arm targets have defined a "max" CPU type
>> whose definition is roughly "all the features that QEMU
>> implements". This is helpful for:
>>
>>   - giving us a way to provide newly emulated CPU features to users
>>     without having to define a specific named CPU type matching some
>>     hardware that implements the feature (which might not exist at the
>>     point we add the emulation, or which might also need some other
>>     features we don't yet support)
>>   - giving users a way to say "I just want everything"
>>
>> Mostly this has worked pretty well, I think. (It can cause problems
>> for some workloads that break when a new feature is added; TF-A
>> firmware seems particularly prone to this.)
>>
>> However, it doesn't work so well if the architecture decides to drop a
>> feature and mandate that newer implementations may not implement
>> it. Up til now that hasn't been a big deal, as only a few very niche
>> items (like FEAT_DoubleLock, an old mechanism for quiescing external
>> debug before a CPU power-down) have ever been removed.
>>
>> With the Armv9.0 architecture, a big feature gets removed: support for
>> running in 32-bit mode at anything above userspace (EL1, EL2, EL3) is
>> not allowed to be implemented.  We've got away so far with ignoring
>> that requirement, but as new v9.x features are added, they are
>> designed under the assumption that there is no 32-bit system mode
>> code. For instance, the GICv5 CPU interface defines only 64-bit system
>> registers, and our non-compliant "32-bit is actually there"
>> implementation would give you a 32-bit OS that couldn't handle
>> interrupts. Other similar (or harder to spot) issues are likely to
>> also turn up.
>>
>> So my suggestion is that we should have two new CPU types:
>>
>>   v8-max : "all the features we implement that are valid
>>     for the v8.x architecture"
>>   v9-max : "all the features we implement that are valid
>>     for the v9.x architecture"
>>
>> v9-max would not implement AArch32 EL1/2/3; v8-max wouldn't implement
>> any feature the architecture says is v9-or-later.

Certainly clearer than what we currently have.

>> For the existing 'max' CPU:
>>   - on qemu-system-arm this would be a synonym for v8-max
>>     (since it must be 32-bit)
>>   - on qemu-aarch64 and qemu-system-aarch64 this would be a synonym
>>     for v9-max
>>   - on qemu-arm it can also be v9-max, since v9 doesn't drop 32-bit
>>     usermode support. (Though we don't currently implement qemu-arm
>>     max this way, so it might end up being effectively v8-max until
>>     we get round to implementing support for selecting AArch64 CPUs in
>>     qemu-arm.)
>>
> 
> This seems like a good approach. A side effect is to solve the
> duplication we encounter for the single-binary also, by correctly
> deduplicating QOM types associated.
> 
> The concept of having a "max" alias that maps to a specific type (in
> this case, distinct depending on the binary) could be used for other
> arch if needed also.
> 
>> I don't think it's worth claiming 'max' as deprecated and dropping it:
>> as an alias it's trivial to support, and there are a lot of workloads
>> that won't ever notice this change.

We could display a note though.

   "Using 'v9-max' for requested 'max' CPU".

> 
> I agree.
> 
>> It's possible some workloads currently using "max" will need to switch
>> to 'v8-max", but I think this will be rare: it would have to be
>> emulation of an EL2 guest which is itself 64-bit but which runs some
>> inner-guest VM within itself that is 32-bit. The failure mode will be
>> that the (outer) guest will report that it can't run a 32-bit (inner)
>> guest (in whatever way that hypervisor reports that kind of error).
>>
> 
> That's a good solution, and only a small minority of users (the one that
> has to really deal with this) will be concerned.
> 
>> So that's my sketch of a proposal -- what do people think? What
>> have I forgotten about?
>>
>> thanks
>> -- PMM
>>
> 
> Do you have a time frame in mind for this? It's on the path for having
> the single-binary, and we can help with it if needed.
> 
> It should be a pretty straightforward change, just renaming QOM types,
> and adding the "max" selection mechanic.

Per Peter description, it doesn't seem renaming types is a 1:1 change.

 From a reviewer point of view, it would be better to first add the
v8-max and v9-max clearly defined / documented types; then migrate
current 'max' to the appropriate new type for each binary, mentioning
the adjustments done; and finally do the alias replacement.

