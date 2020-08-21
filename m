Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1827388lfy;
        Thu, 20 Aug 2020 18:09:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOR0eRFJJLcrG3Y1EOGvY8xZTzAmc5NoZ6zbMdzAmhPR/3197MAI2NLCk7XbawyVHW/XXP
X-Received: by 2002:a25:da82:: with SMTP id n124mr632178ybf.366.1597972165865;
        Thu, 20 Aug 2020 18:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597972165; cv=none;
        d=google.com; s=arc-20160816;
        b=dAmQzUjxPjJ41hmfGakIFLsyHX3wTd5LHCsMUQnKdxH/gT2XOfO6ySmT9U4BdULG/R
         3I08P9tTnBzy9XHvSdYK/PY5H07ncF6cHtjwxYHSuqhPX8FHS63yttbxZ5Y9XyOE0F0N
         YZTmKT4sNLli0JALtceDQ2v9cLkzCAvH2CxABL3GsO6dqKFBO7KqI5OkwzLVt20jY2nY
         6lB4ra5idINoiIOuQMJfPPvJes75oRksc1buNfkpv7HgfDcq3MuQ5nvX7bgCLoiFQ9lV
         PTbixOEZI6MQkT4rIX6fiNEMF9ETP4jvAtuHvTOMXGcbq3FGF8YmUyka9S6Sj2JrwEAt
         o06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from;
        bh=k1BTQ9RJq8hACHvavP/ms0lqNLk38qYSLWNV9FxdZJc=;
        b=papVlJ8+nk4sdvvZqp3S64je/68Wa+MHYOXFm7/Q06qekVWQIM+oXr/5wueRlMl2d7
         UmBSkmITh67V5OIgNhSNHqDtEftWkTQaPg3V6SUESFia9fMfdaGPhb9yQRIkiThITZN9
         zO/pwkeoCOBwNlF86F2rmyesbERAiA47FIgCzn7wpLrEOef4HdoZOWTxUbEbkmkUgHnh
         b46nVFVHwj9/Vk9Of1gmyXYZFkQkDLV699Ha/loA/CRhDy9ZVcjlFk7JPwMfIfAXzda5
         cWAwGC8PtqoQIuuBpj/v7hoKTl2eHucAmzl7O1LB0zTAu8Gfvc//ZDoTQMlBSinzJs+E
         xrng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=toshiba.co.jp
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si397073ybt.235.2020.08.20.18.09.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 18:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=toshiba.co.jp
Received: from localhost ([::1]:44178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8vYb-0006Fr-2j
	for alex.bennee@linaro.org; Thu, 20 Aug 2020 21:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <punit1.agrawal@toshiba.co.jp>)
 id 1k8vYS-0006Dw-5V; Thu, 20 Aug 2020 21:09:18 -0400
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:46018
 helo=mo-csw.securemx.jp)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <punit1.agrawal@toshiba.co.jp>)
 id 1k8vYK-0007hE-Lx; Thu, 20 Aug 2020 21:09:14 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 07L18wbB022933;
 Fri, 21 Aug 2020 10:08:58 +0900
X-Iguazu-Qid: 34tMSeeoSoqueZbKi2
X-Iguazu-QSIG: v=2; s=0; t=1597972138; q=34tMSeeoSoqueZbKi2;
 m=VQLcjwad1ae08W7GaurJKe9kyqqe4/aidO6vRvI15Jc=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
 by relay.securemx.jp (mx-mr1513) id 07L18vvW032589;
 Fri, 21 Aug 2020 10:08:57 +0900
Received: from enc01.localdomain ([106.186.93.100])
 by imx2.toshiba.co.jp  with ESMTP id 07L18vN3023378;
 Fri, 21 Aug 2020 10:08:57 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.localdomain  with ESMTP id 07L18v6X031918;
 Fri, 21 Aug 2020 10:08:57 +0900
From: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/arm/virt: Default to architecture appropriate CPU
References: <20200820045507.614288-1-punit1.agrawal@toshiba.co.jp>
 <CAFEAcA-zRAzU_ZRE5Wfc1V9jtnnhNyHEkXF4+t2TFXJ26MKc8A@mail.gmail.com>
Date: Fri, 21 Aug 2020 10:08:56 +0900
In-Reply-To: <CAFEAcA-zRAzU_ZRE5Wfc1V9jtnnhNyHEkXF4+t2TFXJ26MKc8A@mail.gmail.com>
 (Peter Maydell's message of "Thu, 20 Aug 2020 09:55:16 +0100")
X-TSB-HOP: ON
Message-ID: <87h7swyfdj.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=210.130.202.155;
 envelope-from=punit1.agrawal@toshiba.co.jp; helo=mo-csw.securemx.jp
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 21:09:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MdHpvMrr0nmu

Hi Peter,

Thanks for the quick feedback and the background. 

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 20 Aug 2020 at 05:55, Punit Agrawal
> <punit1.agrawal@toshiba.co.jp> wrote:
>>
>> The default_cpu_type for the Virt machine is set to "cortex-a15" for
>> both the arm (qemu-system-arm) and aarch64 (qemu-system-aarch64)
>> targets.
>>
>> As a result, starting the aarch64 target with "-machine virt" defaults
>> to booting with a Arm v7 cpu which is counter to
>> expectation. Debugging the issue is further hampered by lack of any
>> output from a supplied arm64 firmware as it is now running on the
>> wrong CPU type.
>>
>> Fix this by defaulting to the "max" capability CPU for the target
>> architecture. After the patch both the arm and aarch64 qemu default to
>> the equivalent of passing "-cpu max".
>
> Hi; this kind of thing has been suggested in the past several times.
> Generally we've taken the view that we prefer:
>  * not to make changes that would break pre-existing command lines
>  * to maintain the general behaviour that a command line used
>    with qemu-system-arm will also work with qemu-system-aarch64

It did feel like too low hanging a fruit to not have been looked into
before. Generally the above makes sense - though defaulting
qemu-system-aarch64 to start with a 32bit cpu is stretching the above
view too far I think.

> It is certainly true that these days the default CPU type for
> virt is not what most users want, though.

I do understand it's a balancing act when it comes to changing user
visible options. But it's worth revisiting the choice if most users
would prefer otherwise.

Thanks,

Punit
