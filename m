Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3587724lfb;
        Mon, 13 Sep 2021 04:46:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQYmTTxWVUJ0I1ep5W0DvSEHrdobL5Ugbt0PFhpQbheYsKp5YoYEoG383AYVosJY1nmXCY
X-Received: by 2002:a92:c56b:: with SMTP id b11mr7269023ilj.225.1631533587427;
        Mon, 13 Sep 2021 04:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631533587; cv=none;
        d=google.com; s=arc-20160816;
        b=ZCXznyA3WUMMmpbFWHesSO0CtkaoV10w9Ro0y54vr4fEJBtnNIug1kZvHySC49m4GI
         QM8+JGW9z5+63il3OxdbS3khRIUU+Wm0pDBGwbyQjOaMa0lP2xclh+LUfUFy5DZKZeDl
         Fvcmy4di2e0S+nYJarFdbGyYn5kHwB+sN+7IQBAEDbR5TupkR6sse2NB2SH6IpUfV6RT
         ZuLAFl29pieUkV70BiLVITEroSJ+1VH51tMlXZHxh+fB2aKF89aafR3pW+44a44E7bNA
         x0CVX9EPyB1iLFiv3+Jcrjv+aNnFbbSGdnei8oeM+3hkJV0SyDMUikfK4TKYOtZyi2zy
         9ooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kE0XhEF8r6LbMeyqzceOnbt+I+wXrGPCvwaoys6mR7U=;
        b=ApRXWi2Rgvpli9r8/5zsrVs1Vvb/RAyhEb7452wVz/63SCoPOhOXaUYheqeXi7sMph
         097SxNDK0dNNU+bovEOjhqHdJqng/0ACyJyYfi2wOurWA2raCmRZcchxTkg5JiEPh6J7
         w0LlqFdu90vUiVZE8t+FPXlGeTFiWmvwE0KXwnj/CX1fKsb1+pKQUwB5NUXeVmYWR4L7
         f7kbJcmJ4ARv/mq5Y+ln0JXo3Bt16DSvRzIGZCeOpENeA3VnSQRy65S4dS3753VhgCMz
         TCb5cB0hPIH4vM8qN1N/q8fAjKsvA5jy6cZhnIzPVnhF4BoJhmDbsjbnsCrIrJGpMk23
         i69Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mk3yEL9z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y28si6322568iot.48.2021.09.13.04.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 04:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mk3yEL9z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPkPq-0005Un-Or
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 07:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPkOo-0005BR-JP
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 07:45:26 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPkOl-00054j-FG
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 07:45:22 -0400
Received: by mail-wr1-x431.google.com with SMTP id d21so6503753wra.12
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kE0XhEF8r6LbMeyqzceOnbt+I+wXrGPCvwaoys6mR7U=;
 b=Mk3yEL9zbOGIH3bQ8C0HJz9jhVESfIbHvQmEuyIOqjtUtY//+FhAfaTtT74AB5UnuD
 LJ3wtyzZa73Ih3hBWJXO2y2LDfHd+/eJjIiscVAt/R3eXxuEkb/8R3zGquGMyE1EdK+U
 jobQcKbocnj6+GoQzzxoEKnDWRwY2YvJpJJFgoyUjCnGZvx85ED4guSuSaB6Ljxfbxn0
 fFsA4ks3A9aaul14INonHqalLQKhPBC5GKQG6N/7K9zPiTKHNozmed17/CUh+IuqK7/o
 hG5UqVAXEmGXbfCoS8U5Yk7cfmiMwk4VT94VoNQ0ltYVZgUQRppIZEPsa9q/jbPltxMJ
 d5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kE0XhEF8r6LbMeyqzceOnbt+I+wXrGPCvwaoys6mR7U=;
 b=LoPnrVmpZx9UkgWPIemrZwrlqj/5MQ7y6kbW0jsL/gYLKaD/HmjMy2Rq2cRfikcqoZ
 sc+A142VB2nLQrrZZl4nnsbbYeDDTTwtPG5arSwXRpAPW1qAGnhI3HLQp6OSUiEUwuKX
 DwDKOv475tCj4ixZNb5jcTSv+Y9MZ9xvmmDuUS2tgY+HQNGGE81YQTuvXxwIbT22B+CL
 Cy5/s1NEDL0AFQF7QEpUKSCMaexezeLUD9cgAXjtHBXJeG6Er+i8YtR/bdq9S+qIr7nF
 c2ms7wTaQE5ChVpokiHP5AH5BI5hjRQPtoxowDlrw5vfueFeN/VXFOI51xXIj/rAYwOE
 nkCQ==
X-Gm-Message-State: AOAM530d6oCigzbv81bOSo/xat0GAW/CbukOvdsF43ArYX+boTm2YhKo
 YAtVuA2H4qlQXnSKwAXu0nUoxKc5Z2umwYbkDWzwqg==
X-Received: by 2002:adf:f185:: with SMTP id h5mr12169151wro.302.1631533517906; 
 Mon, 13 Sep 2021 04:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-8-agraf@csgraf.de>
 <CAFEAcA8BybrfxNxkWbEjxji4DvDumr6Otb_RK_f84Dt_TWXfpA@mail.gmail.com>
 <ad707e0d-8d4a-0248-80f4-a02a7226ce0a@csgraf.de>
In-Reply-To: <ad707e0d-8d4a-0248-80f4-a02a7226ce0a@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 12:44:27 +0100
Message-ID: <CAFEAcA_OBK1hbqC1Nc7J+VEwkO54WvqBrNa=bR5T3tZW+nfEkQ@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] hvf: arm: Implement PSCI handling
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Marc Zyngier <maz@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IwjvCtN/Do1L

On Mon, 13 Sept 2021 at 12:07, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 13.09.21 10:54, Peter Maydell wrote:
> > Something in here should be checking whether the insn the guest
> > used matches the PSCI conduit configured for the VM, ie
> > what arm_is_psci_call() does after your patch 10.
>
>
> It's yet another case where I believe we are both reading the spec
> differently :)
>
>   https://documentation-service.arm.com/static/6013e5faeee5236980d08619
>
> Section 2.5.3 speaks about the conduits. It says
>
>     Service calls are expected to be invoked through SMC instructions,
> except
>     for Standard Hypervisor Calls and Vendor Specific Hypervisor Calls. On
>     some platforms, however, SMC instructions are not available, and the
>     services can be accessed through HVC instructions. The method that
>     is used to invoke the service is referred to as the conduit.
>
> To me, that reads like "Use SMC whenever you can. If your hardware does
> not give you a way to handle SMC calls, falling back to HVC is ok. In
> that case, indicate that mandate to the OS".

QEMU here is being the platform, so we define what the conduit is
(or if one even exists). For the virt board this is "if the
guest has EL3 firmware, then the guest firmware is providing PSCI,
and QEMU should not; otherwise if the guest has EL2 then QEMU's
emulated firmware should be at EL3 using SMC, otherwise use HVC".

(So in practice for hvf at the moment this will mean the conduit
is always HVC, since hvf doesn't allow EL3 or EL2 in the guest.)

> In hvf, we can very easily trap for SMC calls and handle them. Why are
> we making OSs implement HVC call paths when SMC would work just as well
> for everyone?

OSes have to handle both anyway, because on real hardware if
there is no EL3 then it is IMPDEF whether SMC is trappable
to the hypervisor or whether it just UNDEFs to EL1.

> To keep your train of thought though, what would you do if we encounter
> a conduit that is different from the chosen one? Today, I am aware of 2
> different implementations: TCG injects #UD [1] while KVM sets x0 to -1 [2].

If the SMC or HVC insn isn't being used for PSCI then it should
have its standard architectural behaviour.

-- PMM
