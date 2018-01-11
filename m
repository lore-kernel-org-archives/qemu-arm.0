Received: by 10.28.173.206 with SMTP id w197csp914959wme;
        Thu, 11 Jan 2018 11:27:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBotWC8Pn97uvKem0FfGUqQ/oy2SFW7jBEPQRrV3G681UVoG9Y/TE51sxtI4Dm8xOBE9jrf3V
X-Received: by 10.37.53.213 with SMTP id c204mr2848363yba.70.1515698830007;
        Thu, 11 Jan 2018 11:27:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515698830; cv=none;
        d=google.com; s=arc-20160816;
        b=p5/g8HFYjxt606o41CSVZT+/SN8ZCQ0LxUNf1BxFg31hxnYAywQjuT6rHeGSngWmT9
         C9YKYz++Jy37IrAmc2SYg1v02gm7FYPAKbPl4At92yJs3h/0HbEPpBkEADMCJ/f8iaYn
         jSjKHDoPpBVk/jfA5ZbZK7w1kXq1Sknr4/hilLSWg965l25s3qDTGkHeDYMUaRK7APhv
         gd934ZQLtNC6IzleKNMPuy8MOwtwYMNb2uryS6u6aL6zODt+G9XQftp2s/wqUd8MzBoQ
         q4OPIDlM1UEeOHP946UP4QO5rAHism5MM2Ooh01j0eTSdp7Q+SjYzvKiCv3CFGvc7T9M
         NpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=t7JIQTn4e9/bu0vf784dDAEQlUVVDJ/nBxRZG9s4hjg=;
        b=YpPSAnygiVWqyf8V3JyCze0PLK0hIow1+6IcVLg3FvrblXpetKrJaxtlUV/KZz901p
         bSMdF7QVqY+hBf1TwlJX8UhcFXI+eGhx3EhxSHUln21tOCT+wqWYCWhnzgDnh8Db2udZ
         KVKPm8hRDWMt4SFHWvf21ynhXhdAGh3Eedfn/g4r8N2kChrLx7CjKwbmNuEgX0gywVJQ
         oYoivW0UELkHzmmVQ6zJMiyCM6t5BBVu2AMnFx6sU8u41yQNK9CpNtti2cux+sxAOtNc
         wK5RgEeCBp92uK3JMs3vHSXWorFLGkWxJ/CeJdwmMyPXqBTFVQW7I6RvzfBIiPRXkgK7
         Ve/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M/joqBIv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t5si4102454ywd.207.2018.01.11.11.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 11:27:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M/joqBIv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZiVJ-0008UR-Di
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 14:27:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZiV9-0008U0-Ny
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:27:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZiV6-0001OM-UI
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:26:59 -0500
Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232]:46161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eZiV6-0001Nl-Ol
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:26:56 -0500
Received: by mail-pg0-x232.google.com with SMTP id s9so1028968pgq.13
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 11:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=t7JIQTn4e9/bu0vf784dDAEQlUVVDJ/nBxRZG9s4hjg=;
	b=M/joqBIvJf2WRLazLFzRNBSFqlACjJf+rU15PUxt+7FDNvVlu7KdhPrPiB+LpC46Gn
	LeWeqHXiWLZnnjojdLTvIu+S3MvceIijPQTAFr70VfZ4p3JHJCz4UNIRV3uVlyzPA+AO
	VxgZkJxk7kn1W05h8LE2TNkYkPSRkHCqMuN7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=t7JIQTn4e9/bu0vf784dDAEQlUVVDJ/nBxRZG9s4hjg=;
	b=IO1jFqjXyzwMcL23BoUXReyUumKRUIrkrS5yRf6oaaZTKnxkW9myrMNov0Lyh1KxBr
	PxsuUZj6mykF1ZLJrBdmVjWXhjmoPi4vRJXrx5IGvbZE4ISmXQeZEVyXSQh/HsLLtRRC
	QeVvKZNQrFggJ019aMFcbRItlNPTC311tb4AYlFR8lyYgQ+f7jbn3lz3Yk1DHbHEkGn6
	7SRFyCgTWcyyPj3piaRsps1yghN1ejqxzNjlKFXTX3TZ+oqNcZznCa+TNAwwKhb0ceMk
	eTfp27X0s+aNt5lNfKLJuy7B3u3yVbnwtdKuzO0PZINJIYOYOJvNM3BD4/ME7KjIoV2a
	9/Pg==
X-Gm-Message-State: AKGB3mLYSKC1J3ZlD9M5A53zd/IIMrE3+0cJ9McP8EwM6h6lVt0ilOL5
	eFO04aJr5tA3OWifm0tomraV/ftle0M=
X-Received: by 10.99.154.66 with SMTP id e2mr19386494pgo.113.1515698815326;
	Thu, 11 Jan 2018 11:26:55 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-183-164.tukw.qwest.net.
	[97.113.183.164]) by smtp.gmail.com with ESMTPSA id
	x15sm38169517pfh.27.2018.01.11.11.26.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 11:26:54 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<20171218174552.18871-2-richard.henderson@linaro.org>
	<CAFEAcA_zoqWwAhg5PhuUG=xkRuC3uwT0MF7D3NOvEFg0Z3yKMQ@mail.gmail.com>
	<3ffa6112-d2bf-df10-c8ee-e96ead760359@linaro.org>
	<CAFEAcA8QxgaaLNc_+-5M9D8LQCp3mkUBmfZpt4Gq58DtKgtGCw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f96c97d-9eba-03f2-dce6-19f17723754f@linaro.org>
Date: Thu, 11 Jan 2018 11:26:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8QxgaaLNc_+-5M9D8LQCp3mkUBmfZpt4Gq58DtKgtGCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::232
Subject: Re: [Qemu-arm] [PATCH 01/23] scripts: Add decodetree.py
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EoRuJ2yNjgUm

On 01/11/2018 11:21 AM, Peter Maydell wrote:
> On 11 January 2018 at 19:10, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 01/11/2018 10:06 AM, Peter Maydell wrote:
>>> On 18 December 2017 at 17:45, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
> 
>>>> +# Pattern examples:
>>>> +#
>>>> +#   addl_r   010000 ..... ..... .... 0000000 ..... @opr
>>>> +#   addl_i   010000 ..... ..... .... 0000000 ..... @opi
>>>> +#
>>>
>>> I think we should insist that a pattern defines all the
>>> bits (either as constant values or as fields that get
>>> passed to the decode function). That will help prevent
>>> accidental under-decoding.
>>
>> Hmm.  What do you suggest then for bits that the cpu does not decode at all?
>> This doesn't happen with ARM (I don't think) but it does happen with HPPA, and
>> probably others.
> 
> Arm does have undecoded bits (they're in brackets in encoding diagrams),
> but they're UNPREDICTABLE if you don't set them right, so ideally we
> check them all and UNDEF. Our current aarch32 decoder doesn't always
> do this, and it's non-obvious when that happens.
> 
>> I suppose I could either wrap it in a field that the translator ignores, or
>> choose another character besides ".", e.g.
>>
>> mfia            000000 xxxxx 00000 xxx 10100101 t:5
>>
>> where bits [21-25] and bits [13-15] really are ignored by hardware.
> 
> Yes, I'd like to see something so that if you want the translator
> to ignore a bit you have to explicitly mark it as to be ignored.

Ok.

> Something I noticed the doc comment doesn't mention: what's the
> semantics for if the patterns you declare overlap? Is this a
> purely declarative language where you have to make sure an
> insn can only match one pattern (or get an error, presumably),
> or is there an implicit "match starting from the top, so put
> looser patterns last" process?

It *should* error.  But I'm not sure that it does.
It's probably worth adding some unit tests for this...


r~
