Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp618441lfg;
        Fri, 14 May 2021 10:10:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvvzdzV+wFgpXu8q5oMLTTid/rBf50kXzS1iZAmX9pxhhMOGQMa4udmPXyCts7ro4VrIGJ
X-Received: by 2002:a6b:6c06:: with SMTP id a6mr1451614ioh.11.1621012242959;
        Fri, 14 May 2021 10:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621012242; cv=none;
        d=google.com; s=arc-20160816;
        b=fBJIj85BVhlnInmKM7CPn3PL1ZnXX9M0t69skrvrG1oUXsRGnZKr3xU/QUML7F8pbq
         XRaSb9h2Le2jb5fvZ7At4UAiFRAq+KOOY0MJqEDZhBTvf6FFgDOjE5hVloPyfWBIGG5K
         0S8QOKv++edobc5oPAQKcc2vmttw9AvJGpQSJjQ7E//ZfC9cTEp5T+VAJ3/mHkip9EoQ
         gLAJJv40dge02YgDA4KnN1UUKG6ijMtE73wTT4GXU1xncgJx3imCMuLKqRKDms37ZTVg
         7XxSJodXoLhYrxX7hKExh9GOmcbdwQ2xrOD8Q7uMn2bpRh98CGIlD/ZHNs+LeyO+CpCS
         8oGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=PmDYKICtH4Ujp3wMWVxCuXwCS+IWoxy1wuBQpOUjRxs=;
        b=OVvIUeq/W+E/ICFGce22C3gsP+NS4ywTEqgD+jw7uMRginGhNqX/iF7KrksGPLRChB
         Vio828ANMSVmbaVFiVMGeRipG4COIKWuul1nHhRQLunv2TZFLWxxmSOMtHQ0jNbh97xZ
         XQsHH/nwhIRoFvdK6y9Xytk9xfwuIXjm8tYd27CSQFV0e0tqv4sn7mo5iKCFcb0mUfVt
         OIlw0zRz+g9RLZ9jwp2PWBCuVQ2+wJgxaxPH4dwkR708mOkW057Y+Pb/35L0GJnrteDD
         kRWllO/DoYjQw0USjHpjTioc+CaKrC1VXPX9zDmA/yYJ64rNSTlJKtakqTG3XIuGhpQ7
         sjbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XWcFnpvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r188si8364531iod.8.2021.05.14.10.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 May 2021 10:10:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XWcFnpvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhbKk-0008D9-98
	for alex.bennee@linaro.org; Fri, 14 May 2021 13:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhb95-00068C-DA
 for qemu-arm@nongnu.org; Fri, 14 May 2021 12:58:39 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:41505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhb93-00035h-Gm
 for qemu-arm@nongnu.org; Fri, 14 May 2021 12:58:39 -0400
Received: by mail-qt1-x836.google.com with SMTP id t20so51532qtx.8
 for <qemu-arm@nongnu.org>; Fri, 14 May 2021 09:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PmDYKICtH4Ujp3wMWVxCuXwCS+IWoxy1wuBQpOUjRxs=;
 b=XWcFnpvpgvQIGl2z2gh6AX2F+Xr8O3mn289OEKMKO7/+n/l7seeE3EmJnhPJbRwMdN
 r8pp/RA+SLyLP/Eh5JHUsWxU0SBjPgsPE/fOWUdn6DoJeOiY6gQj7Z8VGaI5kcDBorch
 Heoi9lN9mZ/vGAI3p/qZD99/3haM1S1soncekS6xoYYVHahrUB/VBAJWvERvTbrHgeMq
 rTkZQZgm+Ro5DATuLTuK5/ag5w4xPEBCUI5SSRRJXBlly+XTxgDguKKFTQP3wwZBdg5/
 nuz+XN+QbV65Kgx4Fam+ac17gCyml7itvBTQsmZGHuuhaPwIPf56Z0qNg/cx5eNebjHj
 QDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PmDYKICtH4Ujp3wMWVxCuXwCS+IWoxy1wuBQpOUjRxs=;
 b=a8VAp4bFyPwvMAdcR9KUp3rkPFL+/bQwMJD/8KO4vEfp/o1oX1vqMA6AoGfmdD55S+
 ZA7jJkeke+Z0oVmVhnVawWJyKEhnVxbAC6Hm5a1Wl3gJwcafHTyofvRwCO1w1Ag25wi1
 DDkE5Nr+Y2GdorReVahvgJ3Fh5JCQ8ExAeECy4ZfMeMCcPSMt8efZQu7DoxnWxbJaPRf
 LJoPg/TDqkDE7YS0/KZnyHdPYfR3mxjlQHSg3ja+ADf81jDFBKyI3RY7p5/JdbtR+yef
 5thoe2h41Sn7IaRQ26kUFMncwf4wipRt+T0HsykhyfOaJN4inm71za8nug68f6RZRxYp
 gRQg==
X-Gm-Message-State: AOAM533dPoErfVjWpeOfFoCKXmbALYmSG584ANp83tnfJHzjFeCeRBl3
 ZgEBmLJgTTzXkMlF1MHG73W/PTcLyZJ8B925
X-Received: by 2002:ac8:7544:: with SMTP id b4mr10447700qtr.368.1621011516429; 
 Fri, 14 May 2021 09:58:36 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id x142sm5103490qkb.136.2021.05.14.09.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 09:58:36 -0700 (PDT)
Subject: Re: [PATCH v6 80/82] target/arm: Implement integer matrix multiply
 accumulate
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-81-richard.henderson@linaro.org>
 <CAFEAcA-V+dnrcrnhOLm4ggNajvfKA4CwYLvbML2tXW2mjQJ1mw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aef903d1-ad86-5894-c1f8-71fc90fd92bd@linaro.org>
Date: Fri, 14 May 2021 11:58:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-V+dnrcrnhOLm4ggNajvfKA4CwYLvbML2tXW2mjQJ1mw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vrbZ1jW2qSx7

On 5/13/21 2:49 PM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 22:36, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This is {S,U,US}MMLA for both AArch64 AdvSIMD and SVE,
>> and V{S,U,US}MMLA.S8 for AArch32 NEON.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper.h           |  7 ++++
>>   target/arm/neon-shared.decode |  7 ++++
>>   target/arm/sve.decode         |  6 +++
>>   target/arm/translate-a64.c    | 18 ++++++++
>>   target/arm/translate-neon.c   | 27 ++++++++++++
>>   target/arm/translate-sve.c    | 27 ++++++++++++
>>   target/arm/vec_helper.c       | 77 +++++++++++++++++++++++++++++++++++
>>   7 files changed, 169 insertions(+)
> 
> I have to say the decode parts for SVE and A32 (using decodetree
> were much easier to review than the A64 part...

Indeed, this was painful enough to write that I'm on the verge of converting 
a64 to decodetree as well.


r~
