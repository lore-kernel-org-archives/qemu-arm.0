Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3373252ejb;
        Mon, 19 Dec 2022 02:47:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6xYBlBnqzXTC6S2kPAZxPiYg7XQy9+x4uhZzI5/IRXFOJo/wpe4sh2wCGnLDIcCoBIQyfX
X-Received: by 2002:adf:ec4d:0:b0:242:52b6:9054 with SMTP id w13-20020adfec4d000000b0024252b69054mr26232968wrn.58.1671446864429;
        Mon, 19 Dec 2022 02:47:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671446864; cv=none;
        d=google.com; s=arc-20160816;
        b=D3C4p+hYLPQGXy5NjFqKpS6SEys0PtSLFR87+lMFnAaGJq00LoBiNkHlBcRnYGEzx8
         hdMWIum3bQ2B2nlLgBCUEaCI4rjWQKUGJ92Xz+K80mzwA1RZcHMWltVK+tspNtrWcT8T
         TSAd/i5d0HvS0X2bLwPaLtiArF0HNtwNDx0FuohPJCC8hhwS6SlFN9I+prL6+Ow2Ykc3
         X894FPwQWQnBq7KoBf4+6NblN9xSmRBkzzB/s5vIsRfn5x8JhtEV4x7EDJfckkKbPu3A
         ScLMfrkev8f4KiplgeeASPultKgYqukcOyYtGrFxbYR7HD+pvQAF21yGqyLZ7xbDGAEZ
         X2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id;
        bh=Pj//9Ej/ih6Tw7hOqdE1Jqfm435BQLx76wP+WQqVVYM=;
        b=ZZ7pxP9dHvQG54mfb91YmDjNa9bvu/FtCmHpoaDhhHij1HOySH5ACFTrcPGR6u9CZj
         GXQcHwGqMsvDnTm0D6IwZ1l+RZdsj+QC7KJNhuwD79+JZfgOWaU5xuhtxmiJ3ya7wFw4
         S4sIOgo0065j69l4Cc8YxrlMHYPoEN5hN22VBekCQtPVlv+sEQ90ax5WdmcPZ2VM53cY
         aJzVoyUIO6WiYRqxLZF0nYdytVkvvGtUgikjMOn2LAcZTi1qWY+LaDdPSh1Zvkxua8XR
         dwLnOW0EkN30T0yZSsR6khN3cUa8KNp2CAlkw6U7Wh+Iuo4OaLZUMDw8ugZKPA2gdaqa
         jIkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [85.25.223.15])
        by mx.google.com with ESMTP id u1-20020a056000038100b002423d081bc9si6213810wrf.828.2022.12.19.02.47.43;
        Mon, 19 Dec 2022 02:47:44 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) client-ip=85.25.223.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from [192.168.106.118] (dynamic-077-002-090-134.77.2.pool.telefonica.de [77.2.90.134])
	by csgraf.de (Postfix) with ESMTPSA id 7A0506080321;
	Mon, 19 Dec 2022 11:47:42 +0100 (CET)
Message-ID: <76c8912f-4fb7-118a-2105-efe08f343f77@csgraf.de>
Date: Mon, 19 Dec 2022 11:47:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
To: Claudio Fontana <cfontana@suse.de>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20221216212944.28229-2-farosas@suse.de>
 <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
 <3355a215-dd7a-e80a-ca53-b0d65eb435b5@suse.de>
Content-Language: en-US
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <3355a215-dd7a-e80a-ca53-b0d65eb435b5@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: WULgZ7nG4dgs

Hey Claudio,

On 19.12.22 09:37, Claudio Fontana wrote:
>
> On 12/16/22 22:59, Alexander Graf wrote:
>> Hi Claudio,
>>
>> If the PSCI implementation becomes TCG only, can we also move to a tcg accel directory? It slowly gets super confusing to keep track of which files are supposed to be generic target code and which ones TCG specific>
>> Alex
> Hi Alex, Fabiano, Peter and all,
>
> that was the plan but at the time of:
>
> https://lore.kernel.org/all/20210416162824.25131-1-cfontana@suse.de/
>
> Peter mentioned that HVF AArch64 might use that code too:
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00509.html
>
> so from v2 to v3 the series changed to not move the code under tcg/ , expecting HVF to be reusing that code "soon".
>
> I see that your hvf code in hvf/ implements psci, is there some plan to reuse pieces from the tcg implementation now?

I originally reused the PSCI code in earlier versions of my hvf patch 
set, but then we realized that some functions like remote CPU reset are 
wired in a TCG specific view of the world with full target CPU register 
ownership. So if we want to actually share it, we'll need to abstract it 
up a level.

Hence I'd suggest to move it to a TCG directory for now and then later 
move it back into a generic helper if we want / need to. The code just 
simply isn't generic yet.

Or alternatively, you create a patch (set) to actually merge the 2 
implementations into a generic one again which then can live at a 
generic place :)


Alex

