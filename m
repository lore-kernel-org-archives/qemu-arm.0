Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2275410lfc;
        Thu, 11 Feb 2021 05:47:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU/jbcywLYKA3dKo6CgSBJzZK6CEZ2PH5EJAWva8y8cPJof/J7YgOc2ogIY53VWr6Sjwwa
X-Received: by 2002:a25:7d45:: with SMTP id y66mr2911046ybc.71.1613051257686;
        Thu, 11 Feb 2021 05:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613051257; cv=none;
        d=google.com; s=arc-20160816;
        b=RbHvdBioq+yPuD7ThiYM7GDgV8ySWEdSrIifACZNC+hAoJ6CpQoEUJuB6cZKk7HEJa
         OCDu77FwMrjCocEhSt4um72BovZ/8oz2YaMUWuZNf/zUdlHdDc/CV0JB2L94U3/YxjKg
         NsQ3Z7AuZzyvpsc7Cl9sHjUd1sEYXvmEog5p6qcf/lXk5daAp84Xbq65w9zc3LqaOlPm
         wlfBFbz4CFVr1xblWOhR2tZJGo5gN9wrDZeCFK5r/sbIR5xsh8hdHHXLpl2hIB/NbK/6
         43xDCXdB5nnjs5L9+NxRRItmNLxOpzEeytQc0i2BYFrCrUOjnALzimuT0Vx3TaW93oMu
         Mdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tWxorh/X8/6luqEWfHVFvTNKWGTDatoq4XOZ0BUEycU=;
        b=sASSHeU6jziVcdu4L1CadkRyMIwMFKDr0csEveXFt9L3JZLEyx7swXE+b49b/YzI4f
         ZWQ2WT+o9CEyYtddm6HBo5TQyLv9m1az0cAzCfZvr90Bsx5IXYGk+/P3m8a8FdLMZtMf
         3G+ciIgZbhzMeuZi3K+Bbnd459dqlxb/5D4qLyCHt8s0Srcy04UkEigZIB+EGYhcA5Z0
         vCh8GVHeI4iFhzQeOjwbXU0rjPyRGTG/gjTd8/sOWejns2pvpZNuS+f7cPDK/TykjQiM
         0YqxHZ/3Yw4ykrWtc4bPuszGQ4U/zeIQ+XqtqlGPCkVljEHZ94vY/Dxm6waurZhwt9IB
         TY3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bL437tQ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si1183695ybd.96.2021.02.11.05.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 05:47:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bL437tQ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lACJl-0000F0-1R
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 08:47:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABpR-0005XU-43
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 08:16:18 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABpO-00075k-7U
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 08:16:16 -0500
Received: by mail-ej1-x629.google.com with SMTP id sa23so10040717ejb.0
 for <qemu-arm@nongnu.org>; Thu, 11 Feb 2021 05:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tWxorh/X8/6luqEWfHVFvTNKWGTDatoq4XOZ0BUEycU=;
 b=bL437tQ4qAndHywaeXhJBXiiF+zQs/6+vZBEasq2WZH4OcI6QlUibykO9+iLHT5Tt1
 /6imvxxJWjvTM2+MwPXyhskSfdNhwyd03f6owDSw3AQAROgDjs+HjnUPFyELN7WBcNBC
 5aG2c10uaoUVN94cgjYpbV8iun1POUZN2ygLZMg8nxlFFeUzwn7AJ6TnNs4c9XpVZii/
 fal98YvqxoyUEipFLplWpaET6fmymhLCkglrGu9mhLZYMFK7Gz9XRq4rWGaaN6/LOLJS
 G2NwV49Kjlr0sKBjNvGp1JEA3X+65pw2fZRRXs4TQQShPEvaFx9jmJ0rBwr8GmUmA7Ox
 3GEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWxorh/X8/6luqEWfHVFvTNKWGTDatoq4XOZ0BUEycU=;
 b=SzLm1+0jXjy7owEO+oo+BhZJwxwLqdw8rJ1tSp7QAEPOnKRVwm4ToO17FX3AhcHKJN
 /+YnOzwuiixQlOWCGTeOzzmP3cGy9A/gBaXoQtTdzGmSspj1h6nv2oky1DkrBLzee0Mg
 R0jtKowmqL4FSTaqi3hqOkJCG/Vu2FCmKiVMD5g5sTRnB3XnjK5JBvP13KVD22F7PqoY
 PvFQTw4oW9dP3wZ5GAxVOtDvI/A7BiZHtj72aFGTfvsfF90OVL1Mg7cj3zQxmu1sqO07
 PkhICeyvrSalWDWNmjlwlGjDH0nYzirpyUKs/4wnWanROeiWRW4LyKXJyxkzaTzby5Kt
 3P2Q==
X-Gm-Message-State: AOAM533H+J2uSf5xE27+ytv8ccG38UI/IHyL7Jc+IlJm4yLkNZH5PHOi
 sIJtZv44Wd49t4OtUVXz03nVjQI4oCPcRyIXYUUB9w==
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr8489803eji.407.1613049372166; 
 Thu, 11 Feb 2021 05:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-8-agraf@csgraf.de>
 <CAFEAcA_-4GYk_+jdczWE720-VH1CLcS+1jVB2LzG=bBBJc8w-g@mail.gmail.com>
 <298dcf49-1a99-9406-275f-b05c8befd13b@csgraf.de>
 <CAFEAcA_ze+J7geayqgaV274anQubqiv56qan7wo8EkxZ14Nydw@mail.gmail.com>
 <37018444-82a8-96c0-b5ce-da056646a1b8@csgraf.de>
In-Reply-To: <37018444-82a8-96c0-b5ce-da056646a1b8@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 13:16:00 +0000
Message-ID: <CAFEAcA9bmV4jUubwqrQXzPXMFfNCsyw7XD34dLW6HBU7_uQvRQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/11] hvf: Add Apple Silicon support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C66roUFf1rXH

On Thu, 11 Feb 2021 at 13:06, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 10.02.21 23:39, Peter Maydell wrote:
> > On Wed, 10 Feb 2021 at 22:21, Alexander Graf <agraf@csgraf.de> wrote:
> >>
> >> On 28.01.21 16:52, Peter Maydell wrote:
> >>> On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
> >>>> +            break;
> >>>> +        case EC_AA64_SMC:
> >>>> +            cpu_synchronize_state(cpu);
> >>>> +            if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
> >>>> +                arm_handle_psci_call(arm_cpu);
> >>> Have you checked that all the PSCI code really can cope
> >>> with being called from a non-TCG accelerator? (As an example
> >>> the CPU_SUSPEND implementation calls the TCG wfi helper...)
> >>
> >> I have not explicitly tried it, but I don't see why the TCG
> >> implementation of wfi should in principle break with hvf.
> > Because the TCG implementation of wfi is "set some state fields
> > and then longjump out to the TCG exec_cpu code-execution loop",
> > and hvf doesn't use that loop.
>
>
> I can confirm that it breaks, but are you really sure about the longjmp
> not working?
>
> What would you prefer instead? Duplicate the PSCI implementation for HVF?

I would prefer that you worked through the details. In other
words, mostly my concerns with this series are that it feels
like it has a lot of quick-hack "this makes the guests I tested
boot" stuff in it. Examples include this PSCI handling, the
WFI/timer interrupt bits, the way the GIC is done, and the
"let's ignore bogus SMC calls" below.

> >>> This should inject an UNDEF exception into the guest. (Compare
> >>> the pre_smc helper in target/arm/op_helper.c for TCG.)
> >>
> >> That would break Windows, which is one of the main use cases for hvf
> >> support in QEMU.
> > Why is Windows making bogus SMC calls ?
>
>
> Let me have a quick at my crystal ball ... mmmmmmhhhh ... it's a bit
> blurry unfortunately.
>
> I really don't think I'm the right person to answer that question :).
> But the Windows loader does invoke weird SMC calls on boot:

Does it boot under TCG ? Under KVM ?

If there's an SMC API that we ought to be implementing but aren't,
then we should implement it consistently. If the guest is doing
something wrong, we shouldn't put in fudges to work around that.
Once that kind of hack gets into the codebase it is practically
impossible to ever get rid of it.

thanks
-- PMM
