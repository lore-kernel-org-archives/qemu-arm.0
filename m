Received: by 10.223.188.70 with SMTP id a6csp391613wrh;
        Fri, 18 Aug 2017 06:44:47 -0700 (PDT)
X-Received: by 10.98.16.194 with SMTP id 63mr8875957pfq.172.1503063887230;
        Fri, 18 Aug 2017 06:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503063887; cv=none;
        d=google.com; s=arc-20160816;
        b=KD8vjpGIRLd8yImcmOY03upqRPpvIGUXp8OflylNCMjGoycUOAjYZhbEQjPvovr2rR
         DkfUsAQVI2YMe4IFjgFBt9FjCEjcoocR6gaQrsWcv78pzX5jx4QFqq3isl1HGQWxntn4
         d3A2pTLka4Nb/F2gkbERecAO17s+uPjNalnwrT6fjVZlIc9+SD+MLCTrowyH4laK/QdM
         hF5u8H5NgzM7ZUvAcjWNcJsjlk9RspYlw0sRAoe3pagRA486XtcyhoSDlx/ZG2m1B2O3
         6KWvhzqlwlbaxcyrXwkN0bIGyBw6l+MDVIIB4yo56sNczpkPL2rpAB8gl+vJRSL2V82l
         3y4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=LAXbl6vJrxKFg/WkSAAzUGQfM83DBWo4wPymsHvm8f8=;
        b=qdv+P6AhdKCCi3VnFBimi4hn7CKLQ0ujgv5UsMX9IIg4lfc83doOFEpbwu7oX1YnL/
         e7MhmSid8gmB2sQLVM5lYMnpHyNbPI9H25CCqdqI/D9OqR1mJqMOxmQyIabZAt7eippP
         m16B5R6UtXXlLlHlIrhbHz6imi9F2iQYHBxzf2joETZseGV66KpMLMBSW4xuRBFaWXUg
         Z4C5tK3MFR5nmB6OpZRDtiMLd4HwJawXn5PD7zJQjIepGMcW0ZB6IepPPlB62d1yg5iD
         33P0UsCLRjku054c2fMZ3vFKcl0YcMc5fVM+4enLCsnajL/hJPQyyuq+IGIs9zJL9yMr
         KijQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OkkAoClC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22f as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com. [2607:f8b0:400e:c05::22f])
        by mx.google.com with ESMTPS id 32si3912080plh.537.2017.08.18.06.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Aug 2017 06:44:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22f as permitted sender) client-ip=2607:f8b0:400e:c05::22f;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OkkAoClC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22f as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x22f.google.com with SMTP id v189so64651482pgd.2
        for <alex.bennee@linaro.org>; Fri, 18 Aug 2017 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LAXbl6vJrxKFg/WkSAAzUGQfM83DBWo4wPymsHvm8f8=;
        b=OkkAoClCUcOMMz9ekIv2xfkAwDTzHm3boWFTltat5NXb+Z3zAc3PdvqYNTVred1Kb6
         kLgYD1BL8v1y4OF9bnQh/aWj7qwvpZXb4hW8pNEPc6RaBzvZLz+3Xt9w8pjtBG6XIqok
         k/VdYsYUprWulotWU4XEgcsgfsyLoUIpiMa6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LAXbl6vJrxKFg/WkSAAzUGQfM83DBWo4wPymsHvm8f8=;
        b=TtNLCzWMqN1ifQw5aUWFe81OqvN/TIj3GB4IhCRA5Lm2acN9sb4A9NcFbet3YXD6O+
         BRsUpSyg6lsl1EFofbMlRap1wcmZd1/VE5PSGTUrcT8masc24eJv98f80cEA5j0PJGg1
         d1pCJn0t9lQ0xLApjQw0bQG7F0gVXIOtJC3Ko21XnpUbW+PnucE0qLFTw0Lz/ic6CKl3
         Ha4e/e3himYiukW4LjH2LYFfHqxNEbVtu2J8t9rCaEB9ucx4xEKfkuqRFnnqd1amZD/q
         ShGqufaeOfsUiZvuYVit7HWqK0HNKogDDnjph75DZOle47bVlDNE4VY4SB2TSaoF8N1K
         WOJw==
X-Gm-Message-State: AHYfb5il5qr8hrRLAbmb3vm9XvaJjWG8jkMAxW84ziLkUrRmTGr5bjZL
	ZwnzuJGDXgI29Ns8SH5bk6Lr
X-Received: by 10.84.167.2 with SMTP id c2mr9714426plb.371.1503063886810;
        Fri, 18 Aug 2017 06:44:46 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id 65sm9961340pgj.23.2017.08.18.06.44.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Aug 2017 06:44:45 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 0/9] TCG Vector types and example
 conversion
To: Kirill Batuzov <batuzovk@ispras.ru>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: cota@braap.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 rth@twiddle.net
References: <20170817180404.29334-1-alex.bennee@linaro.org>
 <alpine.DEB.2.20.1708181355080.2770@bulbul.intra.ispras.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64af762a-5d2b-5e33-fc8e-18244b0c6586@linaro.org>
Date: Fri, 18 Aug 2017 06:44:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1708181355080.2770@bulbul.intra.ispras.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: DI8vURtnpln7

On 08/18/2017 04:33 AM, Kirill Batuzov wrote:
> From my own experimentations some times ago,
> 
> (1) translating vector instructions to vector instructions in TCG is faster than
> 
> (2) translating vector instructions to series of scalar instructions in TCG,
> which is faster than*
> 
> (3) translating vector instructions to single helper calls, which is faster
> than*
> 
> (4) translating vector instructions to helper calls for each vector element.
> 
> (*) (2) and (3) may change their respective places in case of some
> complicated instructions.

This was my gut feeling as well.  With the caveat that for the ARM SVE case of
2048-bit registers we cannot afford to expand inline due to generated code size.

> ARM (at least ARM32, I have not checked aarch64 in this regard) uses the
> last, the slowest scheme. As far as I understand, you are want to change
> it to the third approach. This approach is used in SSE emulation, may be
> you can use similar structure of helpers?
> 
> I still hope to finish my own series about implementation of the first
> approach. I apologize for the long delay since last update and hope to
> send next version somewhere next week. I do not think our series
> contradict each other: you are trying to optimize existing general
> purpose case while I'm trying to optimize case where both host and guest
> support vector instructions. Since I'm experimenting on ARM32, we'll not
> have much merge conflicts either.

I posted my own, different, take on vectorization yesterday as well.

  http://lists.nongnu.org/archive/html/qemu-devel/2017-08/msg03272.html

The primary difference between my version and your version is that I do not
allow target/cpu/translate*.c to create vector types.  All of the host vector
expansion is done within tcg/*.c.

We also would like to settle on a common style for out-of-line helpers, if that
is possible.  One thing *not* to take from our current SSE emulation is that we
do not yet support AVX, AVX2, or AVX512 extensions.  So the current
construction of helpers within target/i386/ doesn't really take into account
all that should be required.

The thing that's common between AVX512 and SVE is that we have multiple vector
lengths, and that elements beyond the operation length are zeroed.  Both Alex
and I have packed operation length + full vector length into a descriptor given
to the helper.  (Alex allows for some other bits too; I'm not sure about that.)


r~
