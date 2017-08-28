Received: by 10.223.188.70 with SMTP id a6csp5092702wrh;
        Mon, 28 Aug 2017 15:39:35 -0700 (PDT)
X-Received: by 10.98.15.151 with SMTP id 23mr2053426pfp.64.1503959975138;
        Mon, 28 Aug 2017 15:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503959975; cv=none;
        d=google.com; s=arc-20160816;
        b=jba1Zcmb0JeuETmuWXc1gQTaZ9dOv6m21lY1CSbM27CGUy3ECQ372Kv/SkUzDAxTgb
         SjH5dv3s045C2awLvJAiRKTppK7SC+gg7ze/CQr5Cku9ZcUrxLWi6llHGCc1tULCE6/X
         5ZovWNTnZII/JS/YHtp878NfEp+xYHty84T+h5hAYXn/yrkxNr2sSNm1taG0DdMCbLAj
         WkH62MkEKcIVuX8Sv6gJZCCXDhgvAUIwAgLf+pDqW3yqDgy9tgxetalviWRJqzPVgaj5
         L1D8nRONesf/8yyq6cUVl2mvrV9ohquTMNCtXlTTrHQwXT1HBldo98NKScVDtfS4rCVM
         GPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=XLzMEP7Fz7DiRz+FpBx2maCBGvrQGrkE2p3b6IvgSoQ=;
        b=DOWny2Vqq/pF1WKctZX/1SDks3HbjghyVXk9eIoUeWIt+AHjtdX9vw0OZMFttRHxZD
         np9xHzV71fBhvTtz2lMG4f24sdPODzWfo3DCeAMBWM+Yz5L+VjXsgHNPUrvVp/XZauv6
         OlJut62s6dldThED6vYlIrroe8IZu2wIokwy6mQIlRi7mkaKPVXyJSHMc5GlXI1Dl/uw
         namo/hiFzzRY1J8Zkt6daaHO4oafOcH6mG7pQHWM87OaErm7WLlqVwFrGexxs2krDkw6
         eDiL+LLtr513mpXTzOuEOKM0b0F/nuSZBgXWQaghEKiDfn8OKtxV6KnWzgI+2pSPp4/2
         HGxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=fMrtAJl3;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com. [2607:f8b0:400e:c05::243])
        by mx.google.com with ESMTPS id y3si129532pfd.614.2017.08.28.15.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2017 15:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::243 as permitted sender) client-ip=2607:f8b0:400e:c05::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=fMrtAJl3;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-pg0-x243.google.com with SMTP id m15so1335604pgc.0
        for <alex.bennee@linaro.org>; Mon, 28 Aug 2017 15:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XLzMEP7Fz7DiRz+FpBx2maCBGvrQGrkE2p3b6IvgSoQ=;
        b=fMrtAJl3MC3+lxrqyC4AwZjfEFZh3mjDR4Dzf6bY0nMmdxsEOQuN/DkWj004ylT3Nx
         SJflr6Pbm31aJWzMufCnhrO8RusE8epVsT/wiTwJPNE70iyxMH8QGsSeeTNUQPMZkMx6
         JV2ZYO8BQvbsA+cvXpP2ZJNQiXOLaedd2S6WHt5xpx6TXC5k4JKLpwDaHwIAlq8nzigC
         lgWJbJ+lEKcBhNxsnF4M2+JNOIyDWNcod+E3LcySVgYQIhicFYCsFz5eu2JYqyQwXJJN
         7jnizGG35jGBBnANpSrBpOGSLvC7mg5/cR4uhf3vY1jIA3CbtBrB2VvYMAnL2dO3GQrz
         b0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XLzMEP7Fz7DiRz+FpBx2maCBGvrQGrkE2p3b6IvgSoQ=;
        b=blrYS0CjRV6ypbr1ynusyZqVEYYoW4fabIN+FqXNz+JAIEOnf7saygXExnUf8bYmFM
         +VSGd2d4c/tYDguwOkNB+bwEV1c8EsDCPNqLa6j+FFwdFOk2dOPoMUFI6flu3pgvJ9LJ
         +UFmYj4xnXO+RpUSgr0rcIKfKO/00BK/wn2HdK5X8GYGrSOa8cbfrZqcekMEA2/Az0O0
         zjIcyvqZ4OkZ+oGSfNfkPeYsKoS9VAdFUsGQdnTHv4rygSxjYaeM8pnsV7TywODdETOt
         rb4LIz8UT2dpKLWmfHod7vBoq3P4eSSRVH7I9pYiCDBob192RNSooSox/YMZ5DkfEuIC
         9T0w==
X-Gm-Message-State: AHYfb5g+iqLPL/sk92GfDuvbbigrdY5LsXniX3eHQWb1aFEFFbMDl4BJ
	Ic0HvHyG4ZrHbA==
X-Received: by 10.84.132.14 with SMTP id 14mr2572393ple.150.1503959974686;
        Mon, 28 Aug 2017 15:39:34 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.googlemail.com with ESMTPSA id i72sm2210205pfi.124.2017.08.28.15.39.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2017 15:39:33 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH 3/3] mttcg: Implement implicit ordering semantics
To: Pranith Kumar <bobby.prani@gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, "open list:AArch64 target" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20170828035327.17146-1-bobby.prani@gmail.com>
 <20170828035327.17146-3-bobby.prani@gmail.com>
 <03c05a60-d697-500b-c2fc-d99b24f3f64c@twiddle.net>
 <CAJhHMCC4Y0Zos+g4M6Rms+vO8cdZ+AOupciRFWTfnbFgpRs9jw@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <45959c2a-94c3-7899-eaba-bf13ca85d052@twiddle.net>
Date: Mon, 28 Aug 2017 15:39:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJhHMCC4Y0Zos+g4M6Rms+vO8cdZ+AOupciRFWTfnbFgpRs9jw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: dZ1ZEu5AYaM7

On 08/28/2017 02:41 PM, Pranith Kumar wrote:
> On Mon, Aug 28, 2017 at 1:57 PM, Richard Henderson <rth@twiddle.net> wrote:
>> On 08/27/2017 08:53 PM, Pranith Kumar wrote:
>>> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
>>> index 55a46ac825..b41a248bee 100644
>>> --- a/tcg/aarch64/tcg-target.h
>>> +++ b/tcg/aarch64/tcg-target.h
>>> @@ -117,4 +117,6 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
>>>      __builtin___clear_cache((char *)start, (char *)stop);
>>>  }
>>>
>>> +#define TCG_TARGET_DEFAULT_MO (0)
>>> +
>>>  #endif /* AARCH64_TCG_TARGET_H */
>>
>> Please add all of these in one patch, separate from the tcg-op.c changes.
>> We should also just make this mandatory and remove any related #ifdefs.
> 
> I tried looking up ordering semantics for architectures like ia64 and
> s390. It is not really clear. I think every arch but for x86 can be
> defined as weak, even though archs like sparc can also be configured
> as TSO. Is this right?

s390 has the same memory ordering as i386.

But you're right that the risc chips should generally be 0.

I'll try and figure out when sparc can use PSO (loosest for sparc < 8, and
modern niagara), but leave it 0 for now.


r~
