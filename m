Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1424895lfp;
        Wed, 15 Sep 2021 00:38:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/vfHrggny/xL2PftkDG63QdggobEXeuotooQYGySqENkQfQAjzGAqvdoQLPbcBft7d4QL
X-Received: by 2002:a05:6e02:1d0e:: with SMTP id i14mr6214020ila.320.1631691518644;
        Wed, 15 Sep 2021 00:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631691518; cv=none;
        d=google.com; s=arc-20160816;
        b=KxCqpBrz14dS+vV9WOm09+9xh8FfEvBzFjr6sDwK2Y4RknI32J7BemfYcHA3pl90Ej
         f8JEtPnWr6xyF0C9yBG6ByEe+ICovWV1aYeGA5Q3X9hiQgunLJtb5Xmd1RLviEMuyNLu
         sv9JXWIflq0HiraHxOwALqj2Pjlnr5Kul16Gp+33+OMlq/s712INW/KyYGNosqlp3q/r
         Dn5TWTsCshvvYurRRTCFl7Gzatzmzre7mwyAexzg+i3ubKFFT4V8IvjFUZKFGi4jJUZh
         4xzWJiEC4Wl4djZmP9Izu7AQSml4RYZNryxmcxHXIsEBAtvqZCX0wrLfOVinzQUG7sAS
         d0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4LDKksQvcOi6WArX/kpiTRtfBjTcOHeL+OPkJRfp0Uw=;
        b=P0e2AEVFD2D725xIbmavHi2dSMKMIA8xkX7m0bOmpF9xwgDibpoyF2UCWwzfVZMZ9f
         3CQpD62tjv2eL1zT06VYyn6fK6HwJH1pRfD28Gmb5jVWyGpl0vFFkA4JIlsST6HO6FFH
         zdRl7uF/24Qm20piI0n7MTZxtznnZIO7d/WB1RNG2OAKcxZ81/BEp/yll7eX1/9u3Jq9
         FthwbNBZK8u8Gxwkcn/GtnXhLJPNY93eAeVOMLiXrDchtHOzyTT8xMtqyBP/MC6kFO4T
         fSJceTMxnPOiHSXdB8y+i9btSyOhP0niEMUqSOMCi8RilJctKKv6WZed5RvfeF1vUI4p
         ppUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=G+dd4LE1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si9795569ilj.70.2021.09.15.00.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 00:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=G+dd4LE1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQPV7-0005vP-Vu
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 03:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPUY-0005u3-6e; Wed, 15 Sep 2021 03:38:03 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPUW-0006rE-DX; Wed, 15 Sep 2021 03:38:01 -0400
Received: by mail-wr1-x432.google.com with SMTP id w29so2288663wra.8;
 Wed, 15 Sep 2021 00:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4LDKksQvcOi6WArX/kpiTRtfBjTcOHeL+OPkJRfp0Uw=;
 b=G+dd4LE1dS/xuF5pr3Pdv5QvDEyQydpXpl7ZZPYn4C7jEcs1v8UWgZ7FnkKr/e2Af6
 NBEFtg8WQ6UAoOUsCDFN0jilRphbKKiptoX6awPJkwsHURe9cyLZSsC3O6PWnaI8sWSX
 FUpfqnr9HQCkfNpc0fsEoQZPHwjfc7DGFTREPl6bjdLCN2Jz2RL3PHfsNOc4lHvvcmna
 DILB+fBNSiOFGyqikn2RJFyrSSpEVQTub0jxps41OlheaW8qo7bQheAajEQbZdhx9YzD
 iEklO9pTew7LwMIpOv4kI1hHbF7C1Rcb/K/m1kFa0PrblyfqtbI4noIoPkbHjXVf9oet
 eylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4LDKksQvcOi6WArX/kpiTRtfBjTcOHeL+OPkJRfp0Uw=;
 b=MduoAmtP4JfxXBl9M20Sd3Stpvahr+qpFXadCXhMoU3492tPZePiUO6TOuEH8RaN5s
 8Dy2BFtubGhseJ83WuGmj0N9SGw6bYm88LRQkTgZV9kzDx1tVG59zNXtFxUzCwWHIhbL
 gIZqPWPLogYbTLfIyMoNfKO3YQ0dx7/zWVH7iR+bT02vMTaMs/o8gltTQY2rSAbbuwWr
 N6hq6o+xUX9CLKGVmpNjwmHcy4O6QAYOLmMlUrs3sKvA3la31NZJhFsTWBa8rygvMnH6
 dp8RqQHxsft01R9EGd/JLXLym1FSHz7kSH1VqvC/fHCrgU8pZ7Yr4TOlPY3QBA0R/7wX
 h65g==
X-Gm-Message-State: AOAM531vOarH5u8RO0hKcNMuRtk+hmzJUzI79x1DbXTxffAPxKYdRoPc
 iEBrkWujOLuylZOkYICQaLc=
X-Received: by 2002:a05:6000:18c2:: with SMTP id
 w2mr3341032wrq.282.1631691478151; 
 Wed, 15 Sep 2021 00:37:58 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id v8sm11169639wrt.12.2021.09.15.00.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:37:57 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3
 aliases
To: John Snow <jsnow@redhat.com>
References: <20210708145514.1751773-1-f4bug@amsat.org>
 <CAFEAcA_ukc+t_BYddOSv7EF6O1qoVHGGj6sA5uumUgt0VMS_pA@mail.gmail.com>
 <CAFEAcA8PLvMUEzyu=sN4bn4mU30w1aajU+T+i__5jnB0QMZnqg@mail.gmail.com>
 <7cbaaf94-e255-a91b-8d71-ca720943bfcc@amsat.org>
 <CAKJDGDbxBYQ5O3Cim5evkNfFcLZ_FwFEe7GhQgE=WWHS7jODOg@mail.gmail.com>
 <88820040-ca86-1442-5dd3-68ecbf878c87@amsat.org>
 <CAFn=p-ZZE9cXFOwgRBd8b3HEnjg2k1c77_ShzeYHfnPZcdSY0g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a558ccae-983c-a5d9-4cad-4322e1df879b@amsat.org>
Date: Wed, 15 Sep 2021 09:37:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-ZZE9cXFOwgRBd8b3HEnjg2k1c77_ShzeYHfnPZcdSY0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ks2WitQStK6p

On 9/15/21 2:34 AM, John Snow wrote:
> On Fri, Aug 27, 2021 at 2:30 PM Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> wrote:
> 
>     On 8/27/21 8:01 PM, Willian Rampazzo wrote:
>     > Hi, Phil,
>     >
>     > On Thu, Aug 26, 2021 at 1:49 PM Philippe Mathieu-Daudé
>     <f4bug@amsat.org <mailto:f4bug@amsat.org>> wrote:
>     >>
>     >> Hi Peter,
>     >>
>     >> On 7/9/21 6:00 PM, Peter Maydell wrote:
>     >>> On Fri, 9 Jul 2021 at 16:33, Peter Maydell
>     <peter.maydell@linaro.org <mailto:peter.maydell@linaro.org>> wrote:
>     >>>>
>     >>>> On Thu, 8 Jul 2021 at 15:55, Philippe Mathieu-Daudé
>     <f4bug@amsat.org <mailto:f4bug@amsat.org>> wrote:
>     >>>>>
>     >>>>> Since v1:
>     >>>>> - renamed tests (Peter)
>     >>>>>
>     >>>>> Philippe Mathieu-Daudé (2):
>     >>>>>   tests: Remove uses of deprecated raspi2/raspi3 machine names
>     >>>>>   hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
>     >>>>
>     >>>>
>     >>>>
>     >>>> Applied to target-arm.next, thanks.
>     >>>
>     >>> I found that this seems to break 'make check':
>     >>>
>     >>>  (09/52)
>     tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd:
>     >>> ERROR: Could not perform graceful shutdown (40.38 s)
>     >>
>     >> I can not reproduce. Maybe something got changed in Python/Avocado
>     >> since... I'm going to simply respin (updating 6.1 -> 6.2).
>     >
>     > I also could not reproduce. I checked and nothing changed on the
>     > Avocado side. The version is still the same on the QEMU side.
> 
>     Thanks for double-checking!
> 
> 
> Sorry for the long silence.
> 
> Did you get this sorted out? I don't recall changing the QEMUMachine
> code upstream lately (Though I have been tinkering with it a lot in my
> own branches) -- was the root cause of the failure discovered?

No. Peter tested again and it passed, then this eventually got merged.
