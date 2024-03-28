Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1259821ejv;
        Thu, 28 Mar 2024 09:42:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJ97gN/8nQRbIFTscUwCtJdhZ0o6kVosBqyEYNLsfH7YBICM4rGLYpGqBArmZxwEIu0pMFgWPfLcBpTM0E/FthiBr8lUux
X-Google-Smtp-Source: AGHT+IHJ4htRy11ltYjaDSUPmxf6kXZRIfzDPF9oMvqg3YdSlCX0xFINlFzHDnFOnWx2J08av3eZ
X-Received: by 2002:ad4:5a52:0:b0:696:1c19:7181 with SMTP id ej18-20020ad45a52000000b006961c197181mr4654679qvb.7.1711644159258;
        Thu, 28 Mar 2024 09:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711644159; cv=none;
        d=google.com; s=arc-20160816;
        b=u0tx1DUYNQD4jQ2B8QDpea7j9UyssEiKT41Xl78XhY36oAxBK115rs6mX8YVUp82Cl
         UNAQyrUAS/EQk4nOTQIbA2lXA2q5bD3ZAh+O8wWBIRYdD4HXoZ9zZnxVls9GwVKSlt6h
         0BaH9u8sPPUjs2hXOC7ox6r1EIx87JvOSuXiNN3U3kL9wTZLaU0UXEOraya+bqZ35ZAD
         Dt+ozw1fhlK7rISyyHTWyXpF0ZTUdsVWOzwtrDFX6irLIdJH6Lelf3iMEKBwjvYkekAT
         ZsFw2Xj4nu8vAR9iWbwO3EDZELMA49HIIH+9maOo/4D9oxtw7HWtT6EI08e0RTHU1vAx
         b6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=fpd9QS0uZHxja51WY1hodu7BzxiGsU4OgNS0Zs2Y5HU=;
        fh=FNezr/bnob/rXkMlhbwhXxA/Ksr7byqx7x8Ea5jlpds=;
        b=oBsmV2QXdZipancSnN4wgn6aa6+PjRJibQgPiK4EXuzJBFIiBTeqHA0dLSZKSw8AoR
         h/ffCo4xbXNzQqY0HKvRqv0Rr0wGmpgqvue0kl8o7MWd9y9rYBwrVPGGopG4DwiG3lR0
         NCcTHCktOGJCK0sgwORAiPEziLXEI/dI6lMBSB6N24ZBkbs4EVm+ICK0LCq9X6+xfWVM
         Orb2VMpyWqx7Lzm444VHozvibkTIv2+xg+a5hXCg6PgWh0LJZBBEjZ4dH4wP1DvrHFIi
         OBGZXrVLCLboDPHy+ztzmikQ2BQJkxrgstC7TBQ876t9VTwLgNkhtkO+ZXbdGqjOZWTw
         0jqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CSsVe5SY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9-20020a0c9709000000b0068c3d2d61f1si1837571qvd.120.2024.03.28.09.42.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 09:42:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CSsVe5SY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpspN-0008P6-P6; Thu, 28 Mar 2024 12:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rpspM-0008Ol-FR
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 12:42:08 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rpspK-0003rV-5G
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 12:42:08 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56c1922096cso1560889a12.0
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711644124; x=1712248924; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=fpd9QS0uZHxja51WY1hodu7BzxiGsU4OgNS0Zs2Y5HU=;
 b=CSsVe5SYmICIyPA1nHB5dDLtcXzdIBoUhP7qXFg8yAHDt509jLkd1/mGbLR1s/525J
 iMY6U8bAKA9lW8lpFL8Ppzezr19K4vuvto7Cie1aPCjINSFqBqamyVr0qPE9JXsvCf7W
 f0EcPldaOKDEG4dXsnrJjEbyF0Mn3XO//VhaH/cFHK7E3zpTh1oKI1GQj9CvCjtc++Ic
 6XXHLyo1p5NwRkzPhKELZe1vEoohm4xrCvyqKpEcGJ7P57ymAsD0NSvym1eEJFFQqr1F
 Nr0C0+pkn0O7XwSYr2a7rGCNsx8hHALnYlFSBFaGxyhAoir0jpO9NnpB1eaVQSU0FHpK
 TSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711644124; x=1712248924;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fpd9QS0uZHxja51WY1hodu7BzxiGsU4OgNS0Zs2Y5HU=;
 b=SJaP85mm/uJsM/aFQpBfafeCkYPtNsPvYK9AExVRC2jz/1LODOHxuXWsHoNsNpmvMq
 nbcss8fzX9ETQ7zY8cTgaaq0+CEIQDJ838lqndqwqrXs9zVkwkY9yWGkI4Yiu8Wwenqk
 T/deV3fOCdhjVRdDSnHnh4cEY8kHJQalFOgr7NatSFsibCocksk0iLGnpPoJafk1Y+ra
 ddN9kPN+j7x6yEy0FfPJ3OZAY6yHW741UCSKZZEvB6HeorGPu5rMBa7yvdg4zjenkjO/
 7V4haaIcA06t1sBO2iTrMarXgCPGJgmK48TiMrZhM4PVnIa/+M0SAAwBnV8p4Ri78OJK
 Wfig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqz0+SSqBhCB0Sgh/j6EdGGg9TGb596HgDNMxtjbZ10w/T5TL63p9KC6wZiCIvOl/Rlnw5KpzpLloo7x4wCJcEfhiV
X-Gm-Message-State: AOJu0YzsECAd/C0Xj1JONHOzqZD/miinGt7PmU8XEqxbgnSKPz7nJxF5
 CbwymkIGzQBm95kJZRV+FzztWw7vcKuQK8BVpDPvRjqPj5qEqIG/aXplQ5OghTk=
X-Received: by 2002:a50:ab5b:0:b0:56c:be3:7cef with SMTP id
 t27-20020a50ab5b000000b0056c0be37cefmr2534050edc.11.1711644124291; 
 Thu, 28 Mar 2024 09:42:04 -0700 (PDT)
Received: from [192.168.200.106] (83.11.22.169.ipv4.supernova.orange.pl.
 [83.11.22.169]) by smtp.gmail.com with ESMTPSA id
 q4-20020aa7d444000000b00568d6a20717sm1033490edr.52.2024.03.28.09.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 09:42:03 -0700 (PDT)
Message-ID: <19444e7a-f234-4f35-9a76-525430c7b9b1@linaro.org>
Date: Thu, 28 Mar 2024 17:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] docs: sbsa: update specs, add dt note
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20240326095819.1268062-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA_Hf_Ehk8Cc8kZGCO3niW_x18vwg4=JSFmYoFZOOTPzGg@mail.gmail.com>
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA_Hf_Ehk8Cc8kZGCO3niW_x18vwg4=JSFmYoFZOOTPzGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HlwKBLcU8wZZ

W dniu 28.03.2024 o 16:43, Peter Maydell pisze:
> On Tue, 26 Mar 2024 at 09:58, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>>
>> Hardware of sbsa-ref board is nowadays defined by both BSA and SBSA
>> specifications. Then BBR defines firmware interface.
>>
>> Added note about DeviceTree data passed from QEMU to firmware. It is
>> very minimal and provides only data we use in firmware.
>>
>> Added NUMA information to list of things reported by DeviceTree.
>>
>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> ---
>>   docs/system/arm/sbsa.rst | 37 ++++++++++++++++++++++++++++---------
>>   1 file changed, 28 insertions(+), 9 deletions(-)
>>
>> diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
>> index bca61608ff..d4d1f2efe3 100644
>> --- a/docs/system/arm/sbsa.rst
>> +++ b/docs/system/arm/sbsa.rst

>> +Note
>> +''''
>> +
>> +QEMU provides us with minimal information about hardware platform using
> 
> s/us/the guest EL3 firmware/  (or whatever other term you want to
> use to describe the guest software that reads the dt).

Thanks, fixed.

>> +minimalistic devicetree. This is not a Linux devicetree. It is not even a
>> +firmware devicetree.
>> +
>> +It is information passed from QEMU to describe the information a hardware
>> +platform would have other mechanisms to discover at runtime, that are affected
>> +by the QEMU command line.
> 
> 
> Might want to say also
>   Guest EL3 firmware does not pass this devicetree on to later
>   components of the software stack.
> ?

This is a matter of what firmware stack QEMU user will run. TF-A (our 
current "guest EL3 firmware") passed devicetree to later components of 
the software stack. We just stopped using it in EDK2. But if someone 
would like to run U-Boot or other firmware then both SMC and DT will 
wait for them.

>> +
>> +Ultimately this devicetree will be replaced by IPC calls to an emulated SCP.
>> +And when we do that, we won't then have to rewrite Normal world firmware to
>> +cope.
> 
> I would drop the last sentence here, and use "may" instead of "will".

Done.

>> +
>>   DeviceTree information
>>   ''''''''''''''''''''''
>>
>> -The devicetree provided by the board model to the firmware is not intended
>> -to be a complete compliant DT. It currently reports:
>> +The devicetree reports:
>>
>>      - CPUs
>>      - memory
>>      - platform version
>>      - GIC addresses
>> +   - NUMA node id for CPUs and memory
> 
> Otherwise looks good to me, and the updates to the spec URLs
> are particularly helpful. As a docs change I'd be happy
> to take it into 9.0 (at least before rc2) if some other
> sbsa-ref-knowledgeable person wants to either review or ack it.
> (But it's also OK if it misses 9.0 and goes into 9.1.)

OK.

