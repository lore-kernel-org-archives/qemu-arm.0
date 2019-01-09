Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp867061wrt;
        Wed, 9 Jan 2019 09:14:11 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6zjWcrAx3PNYx4DHIQ0eqKjChve8lV56p+VVM9J+NAXi2a/3u/M61vGylw+NgqlpjYAc/g
X-Received: by 2002:a50:8c04:: with SMTP id p4mr6654215edp.274.1547054051619;
        Wed, 09 Jan 2019 09:14:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547054051; cv=none;
        d=google.com; s=arc-20160816;
        b=sEno9TtCqAx+d2IKUJL+XMvxwiCnDSQ5G+JNTVayxxZpCTay5i8eUrPGB2neWm3NEZ
         jCAKsJTOBlUveVfX+llXCxZSofrmse5m9e3/1XUuiQuy1oHJ5aL61HuivZXsyzUQoB69
         mf4vTTwSfW7jRyJJ4BPF9BwyhHvZFCKqb3yncnJRhkAcWjCSZKzPCyMsxt7yp8PGrH1K
         qwHCOI55O+z5TiFIl4Yg8g+rdM5jQioobCvXckLvhDuANUJe7JkMVugewvueqbUMolaW
         ZuDfJeU49LJyGE+k4XSSjDGx/X/zCvKjPQYCS7WKMLB2AgSlepcyN2XxtKpQRL0osj8g
         49Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=TnYubGYr3xOPKDROkKXcWTqEZivz3996TO17RbwRRlg=;
        b=IZARP2+KjWPnf2Kb2vtIv5h/uhzCbLMPKO+PeLFlp7abXp66cxxNydAJgcPy7qPmCr
         LD9OxRfde829K5GbpJwm+/CuIwgouc4Vh6MRZi+F1wTRfV6ZJdH3napXUfZBMggTMIrF
         bL/20tQF0YJMJPWZoboFWPaadd6EPLl5qpB0ym9LCx6rwVh9p0iGGKbP16A/IdYCf9rf
         IDp/L26TVJyg+l84Jco0IgfI5iUXN8sqaIPO2i0mgxwNsDR1o1wOSSGb/Q2DgKzhPtS6
         SpbE0MO1JyxMG59+moesvuWuq3p96eUGj4VvC9VSDU0IuWEhFIY+f9nPXUX+h0OFYApF
         f1cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=agraf@suse.de
Return-Path: <agraf@suse.de>
Received: from mx1.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id d46si1685612eda.14.2019.01.09.09.14.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jan 2019 09:14:11 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=agraf@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id E5DC4ACF8;
	Wed,  9 Jan 2019 17:14:10 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH] target/arm: Allow to switch from MON->HYP on
 AArch32
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Tom Rini <trini@konsulko.com>,
 Michal Simek <michal.simek@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Warren <swarren@wwwdotorg.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20190109152430.32359-1-agraf@suse.de>
 <CAFEAcA9zugZiWirk9QjqmAO9QKhLdCAWuG1PX5z7Nxm4O69aTg@mail.gmail.com>
 <CAFEAcA8Xzi8GjzUtzxbFzxdCS4kn0Cps+_bF70ZS0KnH0W8SvQ@mail.gmail.com>
From: Alexander Graf <agraf@suse.de>
Message-ID: <92dba7da-f3fc-b7dc-6896-cf8d58cc7f17@suse.de>
Date: Wed, 9 Jan 2019 18:14:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Xzi8GjzUtzxbFzxdCS4kn0Cps+_bF70ZS0KnH0W8SvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TUID: SEKAPMywitUp

On 01/09/2019 05:59 PM, Peter Maydell wrote:
> On Wed, 9 Jan 2019 at 16:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Wed, 9 Jan 2019 at 15:26, Alexander Graf <agraf@suse.de> wrote:
>>> In U-boot, we switch from S-SVC -> MON -> HYP when we want to enter
>>> HYP mode. This dance seems to work ok (hence it's there in the code
>>> base), but breaks with current QEMU.
> PS: it would be helpful if the commit message said how u-boot
> is trying to go from Mon to Hyp -- some ways to try to do
> this are OK, and some are not, so whether it's supposed to
> work or not depends on what u-boot is actually doing...

I don't fully understand all of it to be honest :). But the code is here:

http://git.denx.de/?p=u-boot.git;a=blob;f=arch/arm/cpu/armv7/nonsec_virt.S

What I managed to understand so far is that it goes to MON using the smc 
#0 call and then changes SPSR so that on return (movs pc) the mode will 
be different.

But please double check whether this is supposed to work - I don't find 
mode switching on ARM terribly intuitive ;).


Alex
