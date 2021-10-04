Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4127680lfp;
        Mon, 4 Oct 2021 11:44:09 -0700 (PDT)
X-Received: by 2002:a67:d488:: with SMTP id g8mr14251707vsj.60.1633373049124;
        Mon, 04 Oct 2021 11:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633373049; cv=none;
        d=google.com; s=arc-20160816;
        b=fOFBE70vKawoOScZMfNp4SlUuOhvJ+iRHTLjrLe3pWhdTZWW3AgSLdfw/ovaYWZEKR
         ATyNEmpg57fNOQ/UX12oSLtu3sayRsysz4IGMr7G6kNDt13z+UDF+cmHxc400NylRxWR
         0UBqA3dsYykIHNIXBovIK5Fu+KcccRj8i3Kcuj8IfoAFZfcmN9fwiSi/vp9vpv8t4Dbh
         H2NHmUFGRA7CAIXqNvrnY0kug7odIf+jZ9tm+dzjsNIRGsEmj1c8HOzEb8BIesuLk5pg
         wgc3IassyUdzTyrFHmcwDo96uPoxIiOgD6P8idLmFIlfEEiiflALdQJNFUkmSwAYqS4Y
         QKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=uGMyT1g2kQKrR0bm2s4+62LgS0QVbNZJfpQEO0Ykw3s=;
        b=tZRf4LpD1blYBlQlYyyLfYQtHhZ6Wkysfjt3gYjTEZcrQGZizacjfF3fc7VHIf6T2m
         1vL6bVXOA3KBo3Bfm2JiGjQTC0PV3t1V3LaN4PJNo7DvVTBq83wzfbGVNHa15UxkJm6Y
         XUGwd34E2kZUjQIn7TgTCp1SCmqPAjOgx6yT3GSYMeq13YzDIRQBZTHzsp37q/at0/0i
         sQMU/6185q0APqnIPEBK1aPs66ko+A7uvV3hRtvGz8Z8fodj3sSXAyNEv0bRPIjqOnn+
         puku2VmabGqP9B/cGUeOXavRjyLpzAaI3NRnk2KOTNCjx5y1+G6RKQzSSc7T+8hgSYyU
         3kdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K257wK7+;
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <luis.machado@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y4sor4526464ual.52.2021.10.04.11.44.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Oct 2021 11:44:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K257wK7+;
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uGMyT1g2kQKrR0bm2s4+62LgS0QVbNZJfpQEO0Ykw3s=;
        b=K257wK7+SV6mJ2Wvyl+NXahS+1BfClgc3Mlx/vQiCVTUQOBXwdjbVrV2xxcrIZQMoz
         utJK1prTcE0Hjc6XM+aSiMPyDlZbpJLuIMm0MpHVNYOBKv3LOsZm3/eOE/vRZU3NAC0+
         JgUE0KJipJbNxZVo7HgQXub1nVfXnsVqY2kaxEHVTI7AqN7g8CtZDFinlt/vCM8Nr6vK
         EHx6wINzAhSlntv8o/HDvqzypRAkJH5Cs+HpkzvL3BiW3V+2uTSSxYTEJrhwaDxV92vS
         +7f5z1udJSjeOsNTqib4IPdvHJFazGJ2YDdBDyIy3P3wApJ66uJ1mpxPKsFq1t0SdPGK
         bv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uGMyT1g2kQKrR0bm2s4+62LgS0QVbNZJfpQEO0Ykw3s=;
        b=QSX8SmlglyzV0o/LSwke1Q5lxlTFmgcW9vWDb9oghVKM3QaL8/9MhRs/jhFtCmqggp
         DtUEwHRkwc3rtnCyok8xFTA7+0NeIDJ0GtESlP5Dlj3vAd+62nrtg1DQLMEFb6EK+w1E
         RIZGbt1ascsw2N5qFJDGFuTquujHuBPDP0GYsaYe5k++RabriEH9aOS8hHQd1WmaL98o
         Qvfcvwb7tOr9QG0poIX42bbO0qlWC0AAoG1FCraxK+6qz78HfIgylSAFUUnxs53wgXEL
         bniUNbdyRDCqBljEw3QBDRGgkU0QGqF9To5ux5Er3GCBLWYiXxbGAq7Q9TTkdshYBAni
         2LeA==
X-Gm-Message-State: AOAM531OxzLx8y2uVtgn4kp49p8mFePaIjHcvvcjC/ZA0oWDjy4QHTuZ
	hDH7ytjEeVmqA1jETmSJj41OtRk+
X-Google-Smtp-Source: ABdhPJzW6HNNBQRlOHutcxXVyggZjg3qP1QBy8uFTg7FeLyCa8MDWlyYh0MfJK0VNKdtwlgWa3aZ7A==
X-Received: by 2002:a9f:258a:: with SMTP id 10mr3391572uaf.68.1633373048599;
        Mon, 04 Oct 2021 11:44:08 -0700 (PDT)
Return-Path: <luis.machado@linaro.org>
Received: from ?IPv6:2804:7f0:4841:3c03:70c5:60d0:496d:7761? ([2804:7f0:4841:3c03:70c5:60d0:496d:7761])
        by smtp.gmail.com with ESMTPSA id b17sm7585512vka.27.2021.10.04.11.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 11:44:08 -0700 (PDT)
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Claudio Fontana <cfontana@suse.de>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de> <874kjdugip.fsf@linaro.org>
 <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de> <871regvs0w.fsf@linaro.org>
 <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
From: Luis Machado <luis.machado@linaro.org>
Message-ID: <3c1521e5-5182-18f3-b5bf-9340745ec92f@linaro.org>
Date: Mon, 4 Oct 2021 15:44:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: lM41r6wHctMn

Hi,

On 9/21/21 10:55 AM, Peter Maydell wrote:
> On Tue, 19 Jan 2021 at 15:57, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> On 1/19/21 3:50 PM, Alex Bennée wrote:
>>>>
>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>> qemu-system-aarch64: -gdb unix:path=/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server: info: QEMU waiting for connection on: disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
>>>>> warning: while parsing target description (at line 47): Vector "svevhf" references undefined type "ieee_half"
>>>>> warning: Could not load XML target description; ignoring
>>>>> qemu-system-aarch64: QEMU: Terminated via GDBstub
>>>>>
>>>>> Seems to indicate it is "ieee_half" -related?
> 
>> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
>> and there is no probing possible during the gdbstub connection. I guess
>> I can either go back to stubbing it out (which would break gdb's SVE
>> understanding) or up our minimum GDB version check for running tests.
>> That would mean less people test GDB (or at least until the distros
>> catch up) but considering it was zero people not too long ago maybe
>> that's acceptable?
> 
> I just ran into this trying to connect qemu-aarch64 to the
> Ubuntu gdb-multiarch. I don't care about SVE at all in this
> case, but the 'max' CPU includes SVE by default, so we report
> it to gdb even if the guest program being run doesn't use SVE at all.
> This effectively means that usecases that used to work no longer do :-(
> 
> Luis: do we really have to report to gdb all the possible
> data types that might be in SVE vector registers? Won't
> gdb autogenerate pseudoregisters the way it does with
> Neon d0..d31 ?
> 
> thanks
> -- PMM
> 

I'll check what can be done here.
