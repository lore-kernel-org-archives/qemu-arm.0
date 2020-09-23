Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp234817lfq;
        Wed, 23 Sep 2020 01:07:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW6r0qCxTF7q+gkDehK9L3LQq9nEJJctzf0vRwJLVAaV7pSBOehfvpdYM8a/HYQMm5+TW/
X-Received: by 2002:a25:1442:: with SMTP id 63mr12819232ybu.173.1600848421968;
        Wed, 23 Sep 2020 01:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600848421; cv=none;
        d=google.com; s=arc-20160816;
        b=q+8QLR2ukUwy2n4vRVxAWsaArox0lu/DdgB0kAp3D6E+YarL+6bnrAK0OxgVD8Ym8z
         eO0rmJWKKFSrKUVcdpxHNe+e4TlKGvSNGhmFkHkMm6U7NoLd+BCTFlZ7deK1ufhZZfqR
         uDbhuUJUuaA3+NZ2i8CfcjwA2vOO40WNldzLrxwqRHE8rnczC2jmys0SyI0RtqQGl2qD
         vhfr1nlSziQIUqICQnSW7HgU6Ol6rILIMF5O+od5ocpShNNI5QrcwKqKTynNSfykD/p6
         BKwmGakWI4zYn75eLX8DRg7gAETvgsbiQf8bGjQfiBdpBM+i0BqZ5kiuXNfROzVGr8RG
         ngPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=WH+Ke85PNBgCxh1/5z8LhC50Xe7v1OycMQijJKOTLaQ=;
        b=DBT96+XZgVDYM215r1/x3ByWb1ZQoRh7eLKAbmtHPmeiTwXi5REMtlFoZMFJX6uwth
         hYx8TrcbNl3Lk5VQOzesBLH9CKeRHCt8v5DVs/kFxHI2xAphzq+O8jRLr/E4Cr6Uioqc
         pa2js7C38deREEcYbvo2eo8mdhNPInJsrhpXLQMCB0W5vPZlU9OUT0XmWy3IxVS1l94c
         Eppj5d9+gtideu5kDyE3bw2GCGxW9IrJsjIxDfjBlSZhV/puAUdQD486f8Z3cjlx/+s6
         GWrBCpAjz8KbdF9eoui6gbBwSFUIxycEzVw1fcJMGyNskTNXQ6lL8ZXXfurr2h/eOpsf
         /h0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Om9pY2R3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si20553769ybk.218.2020.09.23.01.07.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 01:07:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Om9pY2R3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKznp-0004Nx-Bt
	for alex.bennee@linaro.org; Wed, 23 Sep 2020 04:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kKzng-0004ND-ET
 for qemu-arm@nongnu.org; Wed, 23 Sep 2020 04:06:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kKzne-0002Oy-Vo
 for qemu-arm@nongnu.org; Wed, 23 Sep 2020 04:06:52 -0400
Received: by mail-wm1-x331.google.com with SMTP id k18so6021123wmj.5
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2020 01:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WH+Ke85PNBgCxh1/5z8LhC50Xe7v1OycMQijJKOTLaQ=;
 b=Om9pY2R3DOpsYVra0oCJv6y4MWfRXcA3g1dFRkSufofpwkASNLKkL1YL5ZR4ir+nDs
 3Auj0dwOc3CSzb3sm7/bqlGCzIBHfQOj0fXZ2+M+uRl/qLmFKww4MROoNLsjj9Rq+jde
 QVwX142LeQ+5eCLMbOZkujvRm5WiKdUeV5X2o0AH8YFEhx5IIk8hrv86xOT0o7J58P3U
 3T36vRA+Sao5VAxwKT1PAxlfg7qPQ7g162IJyrU3RJtIvfkCL+8H+KH9nCCsqzfP2PxV
 f5TQkCkJopdgV0LAPvVwyulgMFrcTJtBAXB1ZPnreQ0jH6y4LngWaEogI8Pna8Kjji8U
 i3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WH+Ke85PNBgCxh1/5z8LhC50Xe7v1OycMQijJKOTLaQ=;
 b=NQLHoKfU+oorNTEhwsbhcnuj+Im/6IwdvAX8rgd8iJBFqnAQLlrhvRQafvlP5VGT3H
 /BIMMDo/WvwPfV1FcP09WxK5p5D48B7mPooTPJHBwDGdV1Tfthoc8tnJPuq6Pv2J4Exo
 TA6Lri4IMVu0zgm59ISO/9GwM9emOUak7mURFYAAl2o+Dh9KRW3JgOzxKufBKQ1U6fke
 R8D19RIZIlV1BnXZokauFfinhAfejazfpjKVS+oazYwqVkKiaJ89bi0YrZ3M+sSYQqPu
 LRoZXhL7dGGv0YtQ/64fgbqhgwVmtb5SJKv+mpRO9OkH43gcI9JXxn7DJmHd6XuFOVn7
 8I/A==
X-Gm-Message-State: AOAM530lC43U2bXgapOafpkK3exf+e3m+9p+SHeIGJ/8D93RSQ1KrE8P
 TstHpW9KDe8S+SgbStPG/hDAZSZnbCM=
X-Received: by 2002:a05:600c:4104:: with SMTP id
 j4mr4967819wmi.36.1600848407178; 
 Wed, 23 Sep 2020 01:06:47 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id i16sm28862465wrq.73.2020.09.23.01.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 01:06:46 -0700 (PDT)
Subject: Re: gicv3 maintenance interrupt not triggering
To: Jose Martins <josemartins90@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAC41xo2yEoDvy15yExroY+ZX+qQns_rxQiqP9D2Xo3dqquP7KA@mail.gmail.com>
 <CAFEAcA-gMfOntN=up20vjF00Mbf0MOeWyTWufmcZ9E=AKKYWEw@mail.gmail.com>
 <CAC41xo0mWv4LoHbzvxkq+vhw=kn8iyi2vhgZhv4vxODmJcnngQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <1bfa78a6-b478-118f-c284-466dcddde468@amsat.org>
Date: Wed, 23 Sep 2020 10:06:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAC41xo0mWv4LoHbzvxkq+vhw=kn8iyi2vhgZhv4vxODmJcnngQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: /DveHbCs+w3N

Hi Jose,

On 9/22/20 10:46 PM, Jose Martins wrote:
> Hey Peter, thank you for the prompt response.
> 
> In reverse order:
> 
>> (You don't say what QEMU version you're using or what command line
>> you use to start QEMU -- those are both always useful information
>> for "I'm trying to do something with QEMU and it's not working"
>> queries...)
> 
> I've compiled QEMU 5.1.0 which I configured using: ./configure
> --target-list=aarch64-softmmu

You can enable a trivial tracing backend (displaying trace events
to stderr) as suggested by Peter in (a) by adding
'--enable-trace-backends=log' to your ./configure.

> This is how invoke QEMU: qemu-system-aarch64 -nographic -M
> virt,secure=on,virtualization=on,gic-version=3 -cpu cortex-a53 -smp 4
> -m 4G -bios systemimage.bin

Then you can select all the GICv3 events adding '-trace gicv3\*'.

You can combine filter, i.e.:'-trace gic\* -trace -gicv3_redist\*'
to select generic GIC and GICv3, except the redistributor events.

> 
>> Given the MISR and HCR values you quote I would also check that
>> you've set up the maintenance interrupt itself correctly, ie that
>> it isn't disabled or similar such that the GIC asserts it but
>> nothing happens.
> 
> If that was the case, the pending bit in the gicr.ispendr0 would still
> be set, but it would just not raise the irq line to the cpu.
> Nevertheless, I know the interrupt is correctly setup because if I set
> it pending by writing to gicr.ispendr0, the interrupt is triggered and
> the final handler executes.
> 
>> You might like to (a) enable some or all the QEMU gicv3 trace events to
>> see if they provide any insight into what the emulated GIC is doing when
>> your guest prods it, and/or (b) run QEMU under a debugger and look at what
>> it is doing in gicv3_cpuif_virt_update() (and in particular when it
>> calls maintenance_interrupt_state()) to see what it thinks it
>> is setting the maintenance interrupt line to.
> 
> I'll try to dig deeper tomorrow. But just now doing some basic printf
> debugging, I've noticed that cs->maintenance_irq is NULL which results
> in the call to qemu_set_irq returning without calling the
> irq->handler.
> 
> Thanks,
> Jose
> 

