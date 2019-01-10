Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1485679wrt;
        Wed, 9 Jan 2019 22:43:43 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5ClqMuVPnDcpRfpVJTj3KPo5WpVNyrlkjULnwtf3SSaQxqZ3wwtes/wYSIbO0xJI6CJp+3
X-Received: by 2002:a17:906:154c:: with SMTP id c12-v6mr7705391ejd.69.1547102623711;
        Wed, 09 Jan 2019 22:43:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547102623; cv=none;
        d=google.com; s=arc-20160816;
        b=mjbAWtgSRBvq9g6eXoI+NZ9QaH7hvczS9En6KWQEH3qf2xv33m1l3VuJHaqQ8vmK7w
         2Nb2wsECEd64d0t/TcKXvdVL5UIi5J+M7K6n9kQRE+d4fBCYK48KIHyrGKeJmtGkZbLp
         7RA03UGVF6IONl/LRYAxKAntlregY/uFEW38t6H6HUQK3Ee6knQ02osAKZDBtNzQuGsT
         7kXGjiq/fZpL3mq7ZTPKWyWCNyXrnYHWqwKvmdD8oWjEozh6Jis93FHqdfak1CE9YHWY
         dvBg+CcZrBUGnMm68KucPmCZpZlaR81uboysx+iP0ev8SnzwnTj07iXETkKmDKX45lSe
         P7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject;
        bh=fbe+B+jtiBYQm3V1TbvMMg9o82tfJA3JcI6lk3ScKFs=;
        b=FYoQW3Ljwjyhbi77mgsd8WomuXi5QKWhsurtOt9sIwJ501ZfcDQL45zlJIGG22BYMl
         L9My+OdvCXJyVaUtQxrZrDfRMxKDbs374xwASKPy+LfNqmn8XAMa+ctosJDzUc/hZrD8
         SRU0Eiu5t+NwYFH7GMW0l7HlOi+o5p4+gpGXYfk+f40PQuo9GYhcAAusaT179XTTvbZ5
         I5BHjqCSSU9yjvTQqyHcznzh+PrnIVq/t09Kz7uLngraw1wRxiA2Cf3kcdPr9o/DNMeF
         nLG3oOJPk1qUT80eTNSmTX+bfKGoCCbvb12Q9OfjDmRKeVNMpO5bhss0vuHcNQRHJtP4
         R2YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=agraf@suse.de
Return-Path: <agraf@suse.de>
Received: from mx1.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id v8si1956357edm.249.2019.01.09.22.43.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jan 2019 22:43:43 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=agraf@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id DE03AAE03;
	Thu, 10 Jan 2019 06:43:41 +0000 (UTC)
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
 <92dba7da-f3fc-b7dc-6896-cf8d58cc7f17@suse.de>
 <CAFEAcA_sxvfHG6ryA4xHMfbwhDaRrF_+6xaef_0RqqH-7JESzQ@mail.gmail.com>
From: Alexander Graf <agraf@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=agraf@suse.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0673d8c0-16f0-49e7-f002-06491353cc6c@suse.de>
Date: Thu, 10 Jan 2019 07:43:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_sxvfHG6ryA4xHMfbwhDaRrF_+6xaef_0RqqH-7JESzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: yjr7t+uEfa8e



On 10.01.19 00:08, Peter Maydell wrote:
> On Wed, 9 Jan 2019 at 17:14, Alexander Graf <agraf@suse.de> wrote:
>>
>> On 01/09/2019 05:59 PM, Peter Maydell wrote:
>>> On Wed, 9 Jan 2019 at 16:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> On Wed, 9 Jan 2019 at 15:26, Alexander Graf <agraf@suse.de> wrote:
>>>>> In U-boot, we switch from S-SVC -> MON -> HYP when we want to enter
>>>>> HYP mode. This dance seems to work ok (hence it's there in the code
>>>>> base), but breaks with current QEMU.
>>> PS: it would be helpful if the commit message said how u-boot
>>> is trying to go from Mon to Hyp -- some ways to try to do
>>> this are OK, and some are not, so whether it's supposed to
>>> work or not depends on what u-boot is actually doing...
>>
>> I don't fully understand all of it to be honest :). But the code is here:
>>
>> http://git.denx.de/?p=u-boot.git;a=blob;f=arch/arm/cpu/armv7/nonsec_virt.S
>>
>> What I managed to understand so far is that it goes to MON using the smc
>> #0 call and then changes SPSR so that on return (movs pc) the mode will
>> be different.
> 
> Thanks -- yes, that's an exception return so it's the
> expected way to go from Mon to Hyp.

That was my understanding, yes. Do you still want me to change the
commit message to mention that or will you just do it when applying?

Thanks,

Alex
