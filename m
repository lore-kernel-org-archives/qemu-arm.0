Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp118353ejf;
        Wed, 10 Aug 2022 13:50:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6NtEDgndWttdPf9TsB7w3LrbjU06bpSaX+AtRYRIO4xco41DxD0VvUbzX1geif+/R2mBMy
X-Received: by 2002:ad4:5c8b:0:b0:474:97fb:c4e6 with SMTP id o11-20020ad45c8b000000b0047497fbc4e6mr26360265qvh.68.1660164636382;
        Wed, 10 Aug 2022 13:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660164636; cv=none;
        d=google.com; s=arc-20160816;
        b=q4lt16JBniOJIP39JahQbvX9xzPvngR4cDw6+oJUbHk5WvHwwqGQAZz0aDe1YfZKZW
         63QEwUWhn1fOYXhaIvoGKMYtvvYfZ9OvL1vtG3QeW4wBkt4BTYtekd+DcPqrWZJEpHnT
         Q2fWMjS0ui44E+r7MURzWf4COiSw3kWWw2tvM4qF8kZzhBatOoeMzp3a6MQaMDaA8JoT
         rfvhmpXyHtMLZenHBGFQNrZgf8dQmoJx+gmEoZuXGu9Z5NmCA/hbBX6r4/torOmFBxRz
         jrReeu+4FIgZI1bVTAZdp1dnvTLebHWnXSzKP3zuE6r7Ty1If1SA9vnPs+iVPdMh1FVc
         udew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jUddSW7v9pUHafpMQtpHDJGjbYLFOj+b3/VWiaFuMgM=;
        b=og7g8AudRWodbdf0fkgijsVzWLTcybrtqpAfYHpNDqehaU8NF5SuACbMFvsmJYot03
         xE4d3gJ9gSjarMs3bsmsTsxesN2p/bvyi+4IxgtYeqXLpwH4LW9t7Jpllk4pB7ujofSQ
         wc6dFDYf6N4+T1YIe6aAQbzGz2Lr4aFtzcJPp8SYNsrWItdLyCscp5X2Cz2QLoXsL0l4
         O+0aqce5rE6w7O6y5ueqIkWq68TqZH5bVG8e5B8k8WMeeL9tXu48vjCI/dE/6KF+6y+G
         gbk2yUiA1LOH702oS1OCOlU0cAn2JI8+KT+Tqw29MmkA6zHkvubeXqjbteWhKist4Qg6
         HXtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b/PIt+Lz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr13-20020a0562142a8d00b00470563f73acsi436079qvb.387.2022.08.10.13.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 13:50:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b/PIt+Lz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLsex-0005Hf-P3
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 16:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLsc8-0003mU-5b
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 16:47:40 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLsc6-00014h-FM
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 16:47:39 -0400
Received: by mail-pf1-x435.google.com with SMTP id y141so14742154pfb.7
 for <qemu-arm@nongnu.org>; Wed, 10 Aug 2022 13:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=jUddSW7v9pUHafpMQtpHDJGjbYLFOj+b3/VWiaFuMgM=;
 b=b/PIt+LzUK2fxmJf5CFXsd9u2PoVsjTPAO1Z8Q5VlXuvrbEf4RlNt8IZuST18aFxyp
 n0IKeHdsZd5vLtI93dTXWV3d7Om8A9o8MD2d0Pkw3EOHMWAmqEjdfvTLOhwifmO1mfTJ
 8xBRNNYtiGg7hdDKxN8VIUaUOFP6EbWaDG0ggeBlDSnYSF6NWSDHq7YEFenJySU71XMJ
 PPfpO2QvFaJB2194VExoWwUSNSVjIus89LDTRrN0wfxGNz3HEo0GgkUxxQ2GnaE/CD2/
 RClImcS7OQAXT94eE8u4EZBXqfM0xVmw4FcCvocQ7UuoieNqqEibVCagyMGquka9sR5r
 Mk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=jUddSW7v9pUHafpMQtpHDJGjbYLFOj+b3/VWiaFuMgM=;
 b=KsRwDNqUbQvAvO/kNIx86zERHPbHKBhMIFLlm43m4tIkpx/nzNQe7IHVRTokwPhJYy
 gPRYZxhLlWcRVO4O8c5bVTA8sTaLAx/8afe/gFb6I537jgvmEGHEdI2xyDMoLk+WF0Jt
 6wg1DE3S+fO/Y9BH8e6FgY4/mHmfD72+QJxaFoc8F5fhUn0cMHY7m7avle5kBzXCHZNa
 06BeAShD+R1OCKtuRhbsnvq5EOWCbT3Y/mPrN722N/CLTrGNuCIR6JZEEiNAnvWb2OYq
 Cj9OibpSetuJru/WU88ydV3Z/gXbyV7laiGy2nBKFOgWM9j2HmZHINLFo0A1vvlMV+4O
 GKkg==
X-Gm-Message-State: ACgBeo2u6RLlfqTQMio3nV/k6bHeudncRQIv1M6+jjik243QDoOz97sS
 6EEW3qQgRR2qphQ8vaDZUJNCMQ==
X-Received: by 2002:a63:d5:0:b0:41a:58f:929e with SMTP id
 204-20020a6300d5000000b0041a058f929emr23924727pga.260.1660164457024; 
 Wed, 10 Aug 2022 13:47:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:1d05:6ab9:1c4d:d646?
 ([2602:ae:154e:e201:1d05:6ab9:1c4d:d646])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a63fc57000000b0041d7ab5865dsm6223847pgk.49.2022.08.10.13.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 13:47:36 -0700 (PDT)
Message-ID: <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
Date: Wed, 10 Aug 2022 13:47:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
Content-Language: en-US
To: Vitaly Buka <vitalybuka@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
 <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5a9wGRVcqU+n

On 8/10/22 13:32, Vitaly Buka wrote:
> Sorry, I only noticed today that it's not submitted.
> Version is not critical for us, as we build from masters anyway.
> Richard, do you know a reason to consider this critical?
> 
> On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org 
> <mailto:peter.maydell@linaro.org>> wrote:
> 
>     On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com
>     <mailto:vitalybuka@google.com>> wrote:
>      >
>      > How can we land this one?
> 
>     Pinging it a week ago rather than now would have been a good start :-(
>     I think it got missed because you didn't cc the linux-user maintainer.
> 
>     Is this a critical fix for 7.1 or can we let it slip to 7.2 ?

It's unfortunate that it got missed.  It's not critical, but it would be nice, because 
support for MADV_DONTNEED is new in 7.1 (previously, we ignored all madvise).

I'll note there are missing braces for coding style on an IF.

Laurent, do you have an objection to merging this for rc3?


r~
