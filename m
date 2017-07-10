Received: by 10.25.44.15 with SMTP id s15csp3550054lfs;
        Mon, 10 Jul 2017 08:28:22 -0700 (PDT)
X-Received: by 10.55.108.68 with SMTP id h65mr4566853qkc.141.1499700502735;
        Mon, 10 Jul 2017 08:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499700502; cv=none;
        d=google.com; s=arc-20160816;
        b=SAV/e0qU/bkhQQjp/WsSiC1UY1WNQKyEBwHXb9PLBiC0drT3/U7twXFh8u47uZLq7L
         0fyRvaWC4HkfhZV2Z8NFvJOlM1AS9MJvmlJrT9Ta2up2edzTOutatmSgxjs+vtWNDNnJ
         YXhzyOAOgze0rsF4lPBT49a4LQs7gVpzYNtpXxsMrM0Dsy7b77hzCA/MHVsfa/auUh2g
         dpw6FZ+5TwF573BZ1b7jTRPhD1WwKVEcaZArPo9BirPFfWt27j811SHkG9kdXh5Pkk7m
         4g1K45GjWWHljXMIoC2DTvx1LH3brOUjL6d08hpiXJ99b1rN2dI6mH//1VunqjbqT8P0
         SVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=mOYip4Of6omuZHTI4xTGO4RMcfHY90YjR8UoC3n2Jkw=;
        b=eCveXpij41oV2AKx24ZxzN6T7Ywxpc69EJ928B/iy0ds7Dbhol2P96UFSdOQKYdY50
         YppPfSRLodQeJntpXfTpcBnyrkyCwVm7t17zY8KderrptIvAjDkE/CVIIgz/bbRVPLbf
         jxn11yf8o6EhWk20MI8o/SatpFMMjlzhB177J/UNgJT6xhIPRlTT9JW4NEWf6PjbC2ri
         oqeIfNXCQ5O+hOBjUY4p4G1tMilZ71GsUZ6IT5bK6464iLfkpcNJvh4vKpIz5qXYLJ81
         3peVjNOluoJeQBAI/1GaQRYeKUDuNcvLeXA9HUaU3uM/ksjGz3ep6ZlJvNmTkRdZLboi
         3xIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=D/H/4OlE;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id f4si4775638qkf.113.2017.07.10.08.28.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 08:28:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=D/H/4OlE;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id w12so13064514qta.2;
        Mon, 10 Jul 2017 08:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mOYip4Of6omuZHTI4xTGO4RMcfHY90YjR8UoC3n2Jkw=;
        b=D/H/4OlEhmQ5PyWMoNhph9YJTkGaGTB/cp3NVOVdtTg/EhWlvVmkm5BziBk/l6gweY
         fY6cyRb6FuGjqBESAo5h8i+dp2leduxcvWihKb7D/BiOxdAKS94nbj8Q63nzeUct1P3R
         d2fvyrTRXC29lIwXafURnJJkLWyY0rIO6i5plU0cD4ZZhBipBJ7x85nWN91/kjwwxkna
         C0oUMB/HR4gHHcaAI8cmUX/2aYEj/ZEoE0T7NnHikJGLObw0ult12D92F9mSHn2OJ2Hj
         RNbZwgnrlWGpzxISc/HRKQ/6wtb5vzZZM73Omx1Obu3k0QubtHe9wT7bx6AYNnl/dJAo
         gmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mOYip4Of6omuZHTI4xTGO4RMcfHY90YjR8UoC3n2Jkw=;
        b=YVYHb/VYC7L+H/GZXcSw9FA0Uq8KgrmN/7AKW38rkqkwIQ+dAb9qv8HoQrncI3ALIc
         eib3KtB4TOBNK4clYBSHDMdcIV+2HhDJca9rYyCyyJD6WLvbvpx3mpSdWSAjdEE4M10k
         Y6wGbzNtLnCOXUsTUwB3+543Dsaz8FuQoFqLN+fd6vCdbsSPRaRg087VDpxPHp8F8WTp
         fw5zFVi5SXMHplukBZBTBI64qQlrzJTb93nDxOvZdpkE00TAnl8JkO4bKBX2sPB9zrQU
         jtd3w+f588P73LJzzPsMU4Dc3OtwspTMc9ubl1KxVu57NC9P44AcIax8sVjhYta9DUVv
         d5Hw==
X-Gm-Message-State: AIVw113Z+7rByKQ0bTo5zT/3QAaMLt3qJJVCD31EQo0t3otOHPSYOXtY
	cEsoiNuTn3S5bFQYeO0=
X-Received: by 10.200.3.46 with SMTP id q46mr5290004qtg.3.1499700502144;
        Mon, 10 Jul 2017 08:28:22 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id u76sm8498685qka.26.2017.07.10.08.28.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 08:28:21 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 23/29] target/arm: [tcg] Port to
 translate_insn
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865776960.17063.4875279139522061160.stgit@frigg.lan>
 <2bfdb883-f19b-7fcf-c28b-7ce39115937e@twiddle.net> <87podcebyi.fsf@frigg.lan>
 <3745ae02-3fb0-1503-9c99-98dce369f697@twiddle.net> <87lgo0cgij.fsf@frigg.lan>
 <260addd5-45fe-ad10-5208-35906fd3f197@twiddle.net> <87k23gl7yd.fsf@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <a464e904-4080-319b-62e2-e3090ac9af9d@twiddle.net>
Date: Mon, 10 Jul 2017 05:28:16 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87k23gl7yd.fsf@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: xb/oaff4IEMe

On 07/10/2017 03:47 AM, Lluís Vilanova wrote:
> Richard Henderson writes:
> 
>> On 07/07/2017 07:18 AM, Lluís Vilanova wrote:
>>> There was no code being generated after this specific case, but I haven't
>>> checked if DISAS_EXC is set in any other place that is not immediately followed
>>> by a "goto done_generating".
> 
>> Typically we haven't actually done a goto, but simply exit the loop and emit
>> nothing within the final cleanup (tb_stop?).
> 
> The case handled by DISAS_SKIP ignores tb_stop() (the target code can simply
> return when DISAS_EXC is found instead of DISAS_SKIP) *and* gen_io_end(); this
> last one is never omitted when DISAS_EXC is found now, and theoretically
> DISAS_EXC can be set by any target-specific hook. Thus my question if the
> generic call to gen_io_end() should check for DISAS_EXC too (I have no idea if
> it would be an error to call it with DISAS_EXC set, or whether it makes sense to
> for a target to set it so that gen_io_start() is called but gen_io_end() is then
> skipped by a DISAS_EXC set in ops->translate_insn()).

It is not an error to call gen_io_start when gen_io_end isn't called (or isn't 
reached).  There are many ways that can happen.

The reason that arm does the goto after the gen_exception for single-stepping 
was simply convenience.  Nothing would have gone wrong if it had used

	dc->is_jmp = DISAS_EXC;
	break;

instead.


r~
