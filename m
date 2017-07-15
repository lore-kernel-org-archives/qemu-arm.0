Received: by 10.25.44.15 with SMTP id s15csp2485743lfs;
        Sat, 15 Jul 2017 10:52:06 -0700 (PDT)
X-Received: by 10.99.36.198 with SMTP id k189mr20759421pgk.230.1500141126492;
        Sat, 15 Jul 2017 10:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500141126; cv=none;
        d=google.com; s=arc-20160816;
        b=AE4S5ixcnew5qM+69HJlIcAcDt3ul20+3ITZ/VPrLwzZZvw6tcsdI30Qlpr2ZLLOz7
         5I9o0JIHt+NzDyv2kSYOUBBSLO6p4P2BB5zONzy8TJZ46OoFbOueiA2WNG8LnlIBWr15
         QYwPVm1I0/Bjy6A0lR6J3USxpF+p//S/dzWEjfgS+Jl5NzbTkh7Yy/N8QHjfTHlO4ZKw
         Ay+QQjj0e1q19GQRpTf8eYWoIeBm0cd8eXlSLs9JvpY+g1azkGX3S1o5apbNoxlJb5pd
         +NnsOGMUbyUSiw3+FP7+Lyv5O+Xk2SshP62GlhAogqMVp5+DK47eckzRd3tKHywpxeD8
         YEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=SA5jM3sFDIsDaRTe15M9+L9WZ5QBxJCyksfFYXoajXQ=;
        b=clA7VA20bZqHUBakHmq830suqHXxuvgTXgidA63g1WLov//RmsbpMgE5AM6GTTHWOK
         v6kjWYciWs33KkYZKRAkrH+ZXXETf0VtHM8svaQWRAIb2zGthhFFjmkOG6jOqIOQ7cM4
         irGMw77sv+W3uKaKTMxj5cPFG7EGIu94S7oV2Tun/stFkMkHXOjBgd5LFZte3E1YuDU2
         uFA7LGOwi+ZzJBl+nFcgYX32oWB+i8LduYarI8dS0Bj45WXmT26xuBu8SW2J5UYsfidf
         utkmRWG93kMHXsa+/JsqhO0vePK4nwx1GuEuMZgeTtCMtTYNjyDmo5+XhHbRAG6GWcKr
         b1tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=FPG7IMPu;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com. [2607:f8b0:400e:c00::242])
        by mx.google.com with ESMTPS id a3si9664150plc.539.2017.07.15.10.52.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Jul 2017 10:52:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) client-ip=2607:f8b0:400e:c00::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=FPG7IMPu;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-pf0-x242.google.com with SMTP id k24so902130pfj.3;
        Sat, 15 Jul 2017 10:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SA5jM3sFDIsDaRTe15M9+L9WZ5QBxJCyksfFYXoajXQ=;
        b=FPG7IMPuXpd7RsXnHPSI0hEil9PLB2y+BTiXXB6uosfKoEGh+QzDytluwh7csrTsIJ
         AZ4163tx6z4BSQY+/7Fq7/LAoKovLCiO6WlVi2gL2SJ/NPrgZOoX+nGEMGW4iQDiry1B
         WIuvTc6/RMjDDNKBn8ycm4YAlVBg+Z/SZ4c+aDGUb4wJziioZ0wja5a/Y48juW6YvaCr
         1CUSKyD5+Y+URfpqCEjoqd6pwxS/xbsUsIw2gc/dS39Y3zsupvNSATzoEKsX9U5W1AGH
         ZgnGKjZXITo8+kLFb2dQLnt/CxyOgInNTJRJDXgC9Z8Pa4Z4nGvM9M9YlP0mkjyjExoP
         6ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SA5jM3sFDIsDaRTe15M9+L9WZ5QBxJCyksfFYXoajXQ=;
        b=S8f1imvtbBBjtHtz5qVUyEuUkyoyxrOgsnJlpnEIJm+Xtxc5at+FsaSTFObji1GkYY
         hXxGpEzOFdnb2UQPo0Ve0bt7OkE49wk64s92bLb76aeMRPOJbCcxK0jOOqUJLISm6Fh5
         /8rWBMfKLO6QSO54LrRns4hXY2hnsfw+eb3rk6/1BwU3z+s/e603MX+d9s3adW0LpPDV
         GYsDHMPRa9ByzfspqGeCRJX0H8I893iaIUdh761DQpyBuvZHfuWDj8umDkGzS76uVVXq
         JyRPYhA9ib36vcp8csLSqPPreSWQqHskOjFA8TcT5XpEl2/0q05IFhWIvStJ0SZoRdFT
         +gKA==
X-Gm-Message-State: AIVw111hXLc+GNzn401ex6DqZyKnWBVc1BOlWsC7w8psRo5xE4RYIuwm
	iDsJb7FoCn/NVkaqZlE=
X-Received: by 10.84.130.6 with SMTP id 6mr8481738plc.156.1500141125793;
        Sat, 15 Jul 2017 10:52:05 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id r207sm27465400pfr.106.2017.07.15.10.52.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Jul 2017 10:52:04 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v13 18/26] target/arm: [tcg] Port to
 breakpoint_check
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
 <150002437386.22386.7745855254236101855.stgit@frigg.lan>
 <584dade6-5ce0-4950-c0e3-03128bae119e@twiddle.net>
 <a831e072-2a10-d6c5-5d04-f00772b85b5b@twiddle.net> <87eftib0bn.fsf@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <c186f6bb-cd8c-3280-d3f5-d3fa7a64be56@twiddle.net>
Date: Sat, 15 Jul 2017 07:52:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87eftib0bn.fsf@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: nS6actgoDped

On 07/14/2017 09:56 PM, Lluís Vilanova wrote:
>> Another possibility is is_jmp = DISAS_TOO_MANY, and exit the translation loop
>> after the breakpoint check only for is_jmp > DISAS_TOO_MANY.  That allows all of
>> the DISAS_TARGET_N values to exit as well.
> 
> After a quick check, I see that arm uses both (DISAS_NORETURN and
> DISAS_TARGET_N) to exit in different points after the breakpoint. Moxie, mips
> and unicore32 use use DISAS_NORETURN, and the rest use DISAS_TARGET_N.

Of course, because those targets have not yet been ported to this generic 
infrastructure.  I'm saying that we *define* the semantics of the hook to use 
DISAS_TOO_MANY to translate one more insn.  That said, ARM is the *only* target 
that will use this feature.  All others will only use NORETURN.

This isn't really any different than the enumerator you were using previously.

Anyway, you can see my thoughts on this in the v14 series I posted last night.


r~
