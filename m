Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3877733lfm;
        Sun, 5 Jul 2020 00:03:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPuep+YTrURXnC9GbqoN6NX1E9tWrHYrh1kJbGsmrwrORRXSUB6jNJCBsVJ+tnCJYj1wvY
X-Received: by 2002:a25:e481:: with SMTP id b123mr63168913ybh.126.1593932600417;
        Sun, 05 Jul 2020 00:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593932600; cv=none;
        d=google.com; s=arc-20160816;
        b=QyK7fHH6YEzUU/KkuYdPVPpPUFZ5Tz05WQcf9PqnVjjU8kqA5owjnG4GerfOf+TSiL
         KKdkmrtDsGdfmCz7/SVDZ4WTm/QHZJFqK242CQB/aMeSno4Ff6RTayxSW7Nx4ZrTGSrg
         y9dk1Q6lmTzIhU/Rz8slAEQycgw1h2034jt2G/ugLTt37CjjNiwiWGUY024lpiZ7iBTG
         ygiBL1A2IvVJ/K781ObnIeXap2CmKlWoEC9HOPZHhMQgeeguJl+g5wDoB1OywdwhWrc9
         +OUMvK+PIeGv680hMhgpSm5lwWRRiRG6YfY+wBXFLpUFjcEkI18A1Xd8HIb+GgM8kFXI
         rwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Nd98/0448OCEvtksUd1nWO4tJORRLBqwarrbd9MnWQ4=;
        b=igHkZEsgX3YaBHiXhm7Mk6GnLzIP+essAnDTO9oqwx2tnQBi2wbbA0lOBHH6or2JvX
         rCqd9j93P1X9koEyrtQA2G1bPngmMmcHCI0cE/coZFKnCPXl7hsz7DROFKSbOb2sFo3k
         cM5cEuJ1kc+qgZjNl9/ewWy+MIg9CM17W6P9R3rgV7LCz1LiwyPNdW+Wlfs4zLYIZwIi
         ytMEkj8HF2YDnSTzXYLAQFepuq87kJcVm+SJ3eU6E2Fvphoi/icQjXF4ubQgcP+Gc9nY
         LuDSI9uWtMew9gw8JKpfzlRmg+jIexs/INEI8EiVNKI7LcYngF3ryrcnXvclFaJp8YZ0
         kzqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10si17472032ybm.14.2020.07.05.00.03.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 00:03:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrygJ-0005H3-S1
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 03:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jryg2-0005Gr-3s
 for qemu-arm@nongnu.org; Sun, 05 Jul 2020 03:03:02 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:52685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jryfz-0004Sf-0i
 for qemu-arm@nongnu.org; Sun, 05 Jul 2020 03:03:01 -0400
X-Originating-IP: 90.127.194.69
Received: from [192.168.1.42] (lfbn-idf1-1-2027-69.w90-127.abo.wanadoo.fr
 [90.127.194.69]) (Authenticated sender: jcd@tribudubois.net)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 556501C0003;
 Sun,  5 Jul 2020 07:02:54 +0000 (UTC)
Subject: Re: How to force EL2 mode when booting ELF32 file as kernel on
 CortexA7 or CortexA15
To: Peter Maydell <peter.maydell@linaro.org>
References: <b7f00d84-bb8c-78e6-3fe1-54507c872ebd@tribudubois.net>
 <CAFEAcA-5Rj_2oP2eYemy=saChKa5g0RZLNFhqML7zZVabpgxvQ@mail.gmail.com>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Message-ID: <351c2b73-ae4a-76d7-7a46-f760c401d1de@tribudubois.net>
Date: Sun, 5 Jul 2020 09:02:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-5Rj_2oP2eYemy=saChKa5g0RZLNFhqML7zZVabpgxvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=217.70.183.197; envelope-from=jcd@tribudubois.net;
 helo=relay5-d.mail.gandi.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/05 03:02:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XYSydid7PSHk

Thanks Peter.

JC

Le 05/07/2020 à 00:08, Peter Maydell a écrit :
> On Sat, 4 Jul 2020 at 21:27, Jean-Christophe DUBOIS <jcd@tribudubois.net> wrote:
>> When booting an ELF32 file as "kernel" then Qemu seems to always start
>> in SVC (EL1) mode.
>>
>> When booting a "non ELF32" file (a bzimage or any other binary image) as
>> "kernel" then Qemu seems to start in HYP (EL2) mode if the processor
>> supports this mode (it seems to then emulate the uboot behavior)
>>
>> Is there a way to tell Qemu to start in HYP (EL2) mode (or even EL3
>> mode) when booting an ELF file as kernel (assuming the processor
>> supports it)?
> QEMU basically supports two booting types for Arm:
>
> (1) "I am a Linux kernel, boot me the way the Linux kernel booting
> ABI specifies". This is what you get for -kernel for non-ELF files:
> it does a bunch of things, including starting in Hyp if available,
> handling secondary CPUs appropriately, and so on.
>
> (2) "I am a bare metal binary, boot me with the CPU the way it
> starts up for bare metal". This is what you get for -kernel
> for ELF files. A real AArch32 CPU always starts in the highest
> available privilege level, so that's Secure SVC if the CPU
> has TrustZone, Hyp if it has virtualization but not trustzone,
> and (NS) SVC if it has neither: QEMU does the same.
> Guest code can always move itself from S-SVC to NS-Hyp if that's
> where it would prefer to be.
>
> thanks
> -- PMM


