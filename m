Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2588889lfb;
        Fri, 27 Nov 2020 08:55:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxubq2/j37P3ylx8HHfW/G6wfW1QxucnrPyFUFfphS+LLB6UsY/CXgPWyfe5sQJ0YvNjPh
X-Received: by 2002:a25:911:: with SMTP id 17mr9777662ybj.30.1606496159157;
        Fri, 27 Nov 2020 08:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606496159; cv=none;
        d=google.com; s=arc-20160816;
        b=MIkBmiqRrAPPQyFdbFq+ktOZQytsXhCvD3c1ewy1rZzNFRsYJZPl/qZNCZ2oISy34L
         LBd5QzY3s/q3EF9iZNh2aA/yQQPqfgMycHFnpytLqAp5gMUA2aOgsFjh43dFdClWYEHo
         PZj/e90h0NbZQeU/KsWtYdb7vKDn4eCnY1NNEJSgGVwDDjyqaxJ9+3bFThAzSoUp5P7M
         olS1ZIXrF/coeoEYJVO3Z06Gma5soA1slBULyIdikO3lwzs3HcVtwnQFWhmwnC0fhohO
         +VIvl5SDXOU2Otuyp4okyfoe/xm7R6YRRAwcmGLy0m327O1odz4NOs1IcG5lM//AwM0b
         Li3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tNoKjAWI6FNYedv6nMQyS4hzPxYQYvpuxCAv5dnotOA=;
        b=grUMweAFM5ljiFkyNUjb7JPO71/n5slY2xPvLLvgG3F5vTeIohs2+852uLwgTRBPik
         AFVfALHHzTdTgJyYX/J1wOdODSpOg5pKOqkbIWOoasqk1DnbwNGDKne85GPIVC9bF2Oo
         A3TrG78F38Gd53ZoJKQoJOB89o5V9g5H4De1rhReGjSOawJOjstogzKe80QG2S0qQDRw
         iw5rDRSDnNUm0MmQCCYQIjaBOGMrALT/SUY+DB8vAhMH5SSQug5wSwQhpFuN9xwrU3g7
         RtjSQ4gKnf6idF+qndwz3Bt+zjne8utk0Miw1QbNBNcgN+NsVvlf4MzjtuCdzaoXml5O
         Kxcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zgki8s0o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16si9638054ybm.250.2020.11.27.08.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 08:55:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zgki8s0o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kih2M-0000mj-FH
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 11:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kih0g-0007w9-5R
 for qemu-arm@nongnu.org; Fri, 27 Nov 2020 11:54:14 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:41622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kih0e-0005vV-Ah
 for qemu-arm@nongnu.org; Fri, 27 Nov 2020 11:54:13 -0500
Received: by mail-ej1-x643.google.com with SMTP id gj5so8453947ejb.8
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2020 08:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tNoKjAWI6FNYedv6nMQyS4hzPxYQYvpuxCAv5dnotOA=;
 b=Zgki8s0ouswI905Jd9y+z/R/e4sLnZXyW36Kx406p2gyjRTbBcHTZsogwdWv1/CZwo
 o7G8w4CafsAIheOi2tn/KhngZa1HZvS85rvR7gHLi/Lz6cyd1TJX8+wdzo7bqrKr4GrQ
 6QVwwxU2rM+PE51H4sLlGxv2honkGSotPsDhr1gMoJEzd00jce2470oYFjFLp2V+3N+O
 t2yG6DQXJwAIHcq2+rbrdIYY3ciyVCsb97gxn1UBtb2kvteO+2xVRYZoO6XzMnQNdKWy
 HMJnBIv1XaTTkskbpVItNghatlmg5F8i5xcXbsAd+KVcF0XPqh9tS0DgL4qPcJq2kr58
 3AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tNoKjAWI6FNYedv6nMQyS4hzPxYQYvpuxCAv5dnotOA=;
 b=jq0NBzAnsaHByPEpkHj9RzaKj8jekfK9LS4mxj/AN5z3cpyDBZbnZK+sFhOZTAgEeZ
 jRD8zdJxE7WTHYsXAYHXZ+HTaNL9beB0nj4A+b+uv7cL+9B032Z8Xp6VCUO7+eckNqh3
 GZ3gOa3ntK5jfqU3YUQpWr5wJF7QaikpumlQICdMcfKrTDsmj86TiUAajwO9XzclurTr
 OikAG+SMBkR+nA8PPb/9a40dMhnS2g/F9GngJXrw4P7uuI9LD8/JQXxHTDaJ0XjieS9R
 7MSFpGOPozIjGHF6MNSLd1veH5EZfdK7rKiqQAcEvOwyQ+7aGo/QfU4MUm3RDfGolZJU
 V0AA==
X-Gm-Message-State: AOAM53089mC7rhXRMfaL/q/7975a6zMdnxrbuz/3JRIel7n/y5/Jl1NK
 3XYqVmp2GQD5TaVPn3jvyfd7rnH8jaVEPFa3J7COhg==
X-Received: by 2002:a17:906:4bc6:: with SMTP id x6mr8881064ejv.4.1606496050573; 
 Fri, 27 Nov 2020 08:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
 <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
 <20201127164708.GZ2271382@habkost.net>
In-Reply-To: <20201127164708.GZ2271382@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2020 16:53:59 +0000
Message-ID: <CAFEAcA_rt_aJTfBzAchUfCH5aKpSPReXWrVDC5mMEvyPughB8w@mail.gmail.com>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /DLhFYqPFbGu

On Fri, 27 Nov 2020 at 16:47, Eduardo Habkost <ehabkost@redhat.com> wrote:
> Do you know how the implicitly-accelerator-specific code is
> implemented?  PARange is in id_aa64mmfr0, correct?  I don't see
> any accel-specific code for initializing id_aa64mmfr0.

For TCG, the value of id_aa64mmfr0 is set by the per-cpu
init functions aarch64_a57_initfn(), aarch64_a72_initfn(), etc.

For KVM, if we're using "-cpu cortex-a53" or "-cpu cortex-a57"
these only work if the host CPU really is an A53 or A57, in
which case the reset value set by the initfn is correct.
In the more usual case of "-cpu host", we ask the kernel for
the ID register values in kvm_arm_get_host_cpu_features(),
which is part of the implementation of
kvm_arm_set_cpu_features_from_host(), which gets called
in aarch64_max_initfn() (inside a kvm_enabled() conditional).

So there is a *_enabled() check involved, which I hadn't
realised until I worked back up to where this stuff is called.

thanks
-- PMM
