Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp415982ejx;
        Thu, 1 Dec 2022 05:38:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7WC1e3BynHkzKDnhVLaaJrKcleulpZAcBNhgHER0Z5pkr6rDYM4zLfqfOMH0m6m27+0sUR
X-Received: by 2002:ac8:66d4:0:b0:3a5:3388:4093 with SMTP id m20-20020ac866d4000000b003a533884093mr61657292qtp.262.1669901929682;
        Thu, 01 Dec 2022 05:38:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669901929; cv=none;
        d=google.com; s=arc-20160816;
        b=fRuX50E15677fMlOfHwa1cre6nySAD1mhur2cuLYgPN1vw6rdUbXsIa3zt6xwFvPB5
         ke1Vgr7I1PQxrxn4y3RwxJGhUsqaUGw0m4pVVQNhq3LFqsSJn3ruJS7Sf43DkfXHNw5w
         DcjW4VjFRgdSa0d1jKIgDEyy/M9R9emOAhdHt4WOE5w9+D/3Sm/+CxAUCwDTwaMzVmxH
         1oxvOrWL3DftykyZmBaswNGTXZOARNfxHD7hWjoWXDMIsveFVe7QGTveFdhpzGVEtsdV
         PybbcAMIzAh1JuxA9GBBc0q7AFbFhE8Hi1Tgr6zbaGQbrmKpOL7Zy9KreRqrayugNehH
         LDfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=A9Xl7JJt3cGvKQFaqzBe5CpXzKcVs7FNwu+S7egGOoE=;
        b=VHQb1gUIdeb3xCxWtU3JD39mIzU3OBzYIhucw1Qk4vtZrJkLpeMFsdX4SD5aFtM2E3
         DXOidtGsalJvQJIjHqhlw8Bob5GPLxxu155sKdFEGgzIoZ7y+tuMQDd7AAmsGHf9NJzQ
         JTOqsmDLYnXn6rG2WmO2wcorr//hPtybUT2V+D+oOzkpCuKP/fxnni//UEpXLSu+OR9J
         FWqiWlaKwNYe+ULuA0+J1AwhO6OmTltUHKMDe0hFLmMDNE7lMJQZEWDq8ugEn+1eA81M
         naz/yPhhSStxvWxyJ041p5ZO/BRf5oZCbkyHzvu6ncO+Txh09Nktc/cCZZZPdyodGKpE
         94/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mA/v1bvD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8-20020ad45dc8000000b004c713781402si2262658qvh.198.2022.12.01.05.38.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Dec 2022 05:38:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mA/v1bvD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0jlk-0005dU-1I; Thu, 01 Dec 2022 08:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0jli-0005cl-D2
 for qemu-arm@nongnu.org; Thu, 01 Dec 2022 08:38:26 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0jlg-0000CX-PB
 for qemu-arm@nongnu.org; Thu, 01 Dec 2022 08:38:26 -0500
Received: by mail-pl1-x632.google.com with SMTP id y17so1672181plp.3
 for <qemu-arm@nongnu.org>; Thu, 01 Dec 2022 05:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A9Xl7JJt3cGvKQFaqzBe5CpXzKcVs7FNwu+S7egGOoE=;
 b=mA/v1bvDhLRKp7M1jS1wdT6ChjgcFzzB+FdSYRWNuoY/eMSKt91klemf0O/rNlQ7ts
 djeM5wzhVVles0Zk/t+sXth77xH5/zDklWcK8En1PQvW2t29VbG84fTghHNUZIQJVBz3
 JUyHHQlHQXSOo9GahUVTazregwL6U6DHILbvwJN+iPN8pc2cE88ZSbiYT7/8L1FfspV0
 pizoR8xL/Nm5nSFViIMqKCfgHMaaXsF8RBeuY+m/mXFXbCBAqHcrog/Hij11RF5wHpLZ
 9GDQtqbMElf+xD9bst89i3Tx2rX+T63a1hxIuUMFyw5nQm05rnJ2lml5jJBFWH6r4rot
 /zrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A9Xl7JJt3cGvKQFaqzBe5CpXzKcVs7FNwu+S7egGOoE=;
 b=BVDJ9lROnsw2RTO2u+RkoJEsFjWhnH2sf/nGk8QFFYmlhqxiXJ6/pelou2u47EnGyM
 vUklbRFhwCKZ530eq1UNcyO7GqFbQosi/j98T4IjmYIGW8bTIHyLg1/ssGe0WfGcOGcP
 n590YeYzSRw0ssGpbznt4PhqLJg03S8KvIYToCnbB63QfY7m6vnPWw82djje8j0qtWGi
 zlOWD9P/i1AowaufTUn5321QMJSNgjX817eD+DJwUWnjgwV89ROFQ8JC84a4CIzkCG7y
 tDq4QLu98vGUCwUs6AfW26N88QBNu6eaiIfF7l3icOujGezgB5wuOyHPvdt3fnFfPuKg
 6N1A==
X-Gm-Message-State: ANoB5pm6OCryRc8LJfrR8YkRupI6FYw7lVZ+kpPnPYKn6g87w8XOY94D
 cU4HfRdr78keW3EHE3VT3Xf8S+K5b+syFAKbXMcS4g==
X-Received: by 2002:a17:90a:ce01:b0:219:58de:e1ce with SMTP id
 f1-20020a17090ace0100b0021958dee1cemr11437844pju.215.1669901902984; Thu, 01
 Dec 2022 05:38:22 -0800 (PST)
MIME-Version: 1.0
References: <CACKEeROyAvp+rjRZxExQ1kX_Fb_Yn1h-4DHpp7ryGKYJ0TcCAw@mail.gmail.com>
In-Reply-To: <CACKEeROyAvp+rjRZxExQ1kX_Fb_Yn1h-4DHpp7ryGKYJ0TcCAw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Dec 2022 13:38:11 +0000
Message-ID: <CAFEAcA9P2-v94p8H8+ktnf-Yf-rucbGySXE6AGPdwvDxXfP=ZA@mail.gmail.com>
Subject: Re: cortex-a55/a75/a76 MPIDR_EL1 specifica
To: Timofey Kutergin <tkutergin@gmail.com>
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YTN13DmiV/Md

On Thu, 1 Dec 2022 at 10:55, Timofey Kutergin <tkutergin@gmail.com> wrote:
> After submitting a patch for cortex-a55 support and trying
> to run SMP on odroid-c4 I have found concern about mpidr_el1 register.
>
> cortex-a55 (and also a75/76/78) seem to be considered SMT CPUs
> with single SMT thread. As a result, they publish core numbers
> in AFF1 rather than in AFF0 and AFF0 is always zero. In the
> cortex-a55 TRM:
>
> Aff1, [11:8] Part of Affinity level 1. Third highest level affinity field.
>   CPUID. Identification number for each CPU in the Cortex-A55 cluster:
>   0x0 MP1: CPUID: 0. to
>   0x7 MP8: CPUID: 7.
> Aff0, [7:0]
>   Affinity level 0. The level identifies individual threads within a multi-threaded core. The
>   Cortex-A55 core is single-threaded, so this field has the value 0x00.
>
> Plus MT (bit 24) is set to 1.
>
> But it seems that qemu does not take it into account. Is this
> intentional? Does it make sense to change this behaviour to
> something closer to real CPU ?

I don't think it's intentional, it's just that when we wrote
the code to handle the MPIDR all the CPUs we emulated were
MT==0 and put their CPU number in the Aff0 field, so that's all
that the mpidr_read_val() function handles.

Of the CPUs we currently emulate, these ones set MT==1:
 * Cortex-A55
 * Cortex-A76
 * Neoverse-N1
(I don't know about the a64fx but would guess it is MT==0.)

Since we already have a couple of CPU models which we don't
get this right for, I don't think this needs to block the A55
support, but it would I think be nice to implement it correctly.
I guess I would do this via a bool ARMCPU::cpuid_in_aff1 similar to
the existing ARMCPU::mp_is_up, and making mpidr_read_val()
act appropriately. The awkward part is that this would mean
that across migration from an older QEMU version the guest
would see the MPIDR value change, which is probably bad.
So I guess we need a CPU property to suppress that and to
set that in the hw_compat_7_2 array (which will appear when
the 8.0 board types get added after 7.2 releases).

Did you see any guest-visible behaviour issues because of this
value being wrong ?

thanks
-- PMM
