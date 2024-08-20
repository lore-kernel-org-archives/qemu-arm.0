Received: by 2002:a17:505:4e90:b0:1be9:327d:8ee3 with SMTP id y16csp322112njx;
        Tue, 20 Aug 2024 06:43:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjJ88L6t6JeOnoB5JmGQgJazFdRIpIwXNz+RlvxMnat6jPDRK+WcrA4e5EATtMUOI6tsdqwGZ75/eA1w==@linaro.org
X-Google-Smtp-Source: AGHT+IEzSRA7ZbobpB8hkkbbe4zbnxGYdd7Xzvr0EDhtYjlWBGb2WwzhhgnAaojp6OptyawTaVCz
X-Received: by 2002:a05:620a:192a:b0:79f:8f3:6ad4 with SMTP id af79cd13be357-7a5068f844amr1767036585a.1.1724161391298;
        Tue, 20 Aug 2024 06:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724161391; cv=none;
        d=google.com; s=arc-20160816;
        b=AakrIuoIQ7zufCXI24Eb+2z4wbJlL+BKXB7mH8beaIxrQEG8gfrLZmLDSDcnY/JDS3
         S17IlW9yL8qW00wX3BYjPfz3nnVwE8+y7SuaidwTChld2qG49XGGQ/MalIx0fnU3XXTb
         BG78PY2isyIFLzfrf0dCE/FWJfivn9M4m3EfKU+MjmvcAprxmirHksLkzy+UcRALtxib
         5puQ3Xm7xKcRoQgdReO3zHudjp5tcG1p7o1bLJ2cOxjBR1+4ohzf9IRD517cpVxy4b8H
         Brz6A429QAeXPhnb97UXTIxqDOz/wnofdyCxYy4l5XfYxsoik5pL2zhQS6+wKhOfuy4p
         Hw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=x53UA5XZQzcHFqQczWRz/UkFLdL3wtbU8KgAdwqK0ww=;
        fh=zln7ITr09mwCezI3XZ/tAUUtarHDoyVVyF3F79XZRX4=;
        b=gB6lLLLWeV90TN/D3uuR+w9/sp9oC5Cur2Y1ViadQhjzbKgemza8cqCnMBpkoVQBbt
         ckf+fp0zE5I+VUci7Jx1l+5z5fezu+qVQErXlwc73Wr/6DTc8DZ9tc9jk4GOfPv4JNFa
         EmOyV110KOMZU7LzzlotikvHv+3nddh0ulPwZnwrHzO6rAQZZyTBnEf/qQuumdgmrek0
         0rxsdtQFjoYhyb9g5eNsOtSJBYGtcTYfO7VXbikkJiQLiteAW9wLxva2n+5UcgpArG5y
         qXIaKRFc/iuJ0VtOmIWlaefBWy/qEeqUzj2VU/xxhCHkKcCIbh3QlpczXunOy5R1wajw
         duvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dsnVNPCg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a4ff0b8ef7si1354537185a.259.2024.08.20.06.43.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2024 06:43:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dsnVNPCg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sgP82-0000jz-1e; Tue, 20 Aug 2024 09:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sgP7t-0000hg-1H
 for qemu-arm@nongnu.org; Tue, 20 Aug 2024 09:42:22 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sgP7q-0001s2-Aa
 for qemu-arm@nongnu.org; Tue, 20 Aug 2024 09:42:20 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5bed72ff2f2so4611149a12.2
 for <qemu-arm@nongnu.org>; Tue, 20 Aug 2024 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724161336; x=1724766136; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x53UA5XZQzcHFqQczWRz/UkFLdL3wtbU8KgAdwqK0ww=;
 b=dsnVNPCgjeth8gLJFkn0EdrkpTA0X8kjB+eGZ3JzuCF0VvZSjrT3VzDbtzv2bbxBCe
 Whi0b/KW32d4k7/sZoErcaDs/tUmZVXrXqeW9XzxsbQadDAmdwk9izihCbtSdBPs5vq6
 Am+vw/sHR+ixHvBPtfQROQiVmPN+JFBlmfjK73u8N062/rs+QcfdPcBBD799eZglWykq
 MWvNG/tDe5RwRYwquJbYrdrMMaXyu7mN+pxrwb91DWb5yXkHsuZKffGElExsynSJ4+j4
 zO7ypbGsboi99Qs4fjnVEcS1ula/drrzX0oenk6qnaA7J2d4PR8c3i3DgEAbS+clvYQB
 5Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724161336; x=1724766136;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x53UA5XZQzcHFqQczWRz/UkFLdL3wtbU8KgAdwqK0ww=;
 b=nLjvrG1kTol3Ei9M8MOm2BYcE/5gfIVsjpa6T1OM8eHyUcATwU5BKwEKGT7cyMDqIU
 fzblHIalOKiItHGgGEylBCUNCRx63tgMy7vMfoTQICFTymhM8O1Ruc/f4uvDQJM2pzch
 t4eVZqs+FDzWTGWfj6Q6Rko0JR36E0oAHtd5dKi2HsUCwXM/XpMC2f951m4rx3MB5b2t
 Mc72hgb7R/WFi0/zQuIAweTRO69LedaAwZYtTOUhK+2s6trKdlWYIDER7hatt3SpstFc
 5ZYpK0ShhDO3Xao+cEMA6fH+0RXTRPTQcnrFkC4iTKwd+La917DIKEaj/NwFuvmiRAUk
 Z9Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBtnm5ZPDmVwhpubrjwK8ISdsnzEoLdhquq4x/is0GpXioAMr1F9SUvA2syM7I//9SRoGCRFY3kg==@nongnu.org
X-Gm-Message-State: AOJu0YxOcgJVPEySRwxFRYB+bxBpYWnKQyES7T3hLSQbh4OMO9fnoJ0M
 xwG7L3/rziKLOUOso8ddVdaLu5PpborX3hbEBfdOk5hE7uLs1Hnc/rSIdsJRjX7AJaIhpPq4HXq
 u9bYCyRtXBtGsE9PqPEAPVEyYrHQo+8biiSzXOQ==
X-Received: by 2002:a05:6402:1d4b:b0:5be:f295:a181 with SMTP id
 4fb4d7f45d1cf-5bef295a2dfmr5104451a12.28.1724161335990; Tue, 20 Aug 2024
 06:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240718230031.69641-1-danny_canter@apple.com>
 <CAFEAcA__WZ=uw0VLcP0fLbUTwmctsZ1y=FRf9bXMT9WJC2sRFA@mail.gmail.com>
 <E03A8C36-4079-468F-9596-328D713C3611@apple.com>
 <CAFEAcA9XXhsUeHNjsVkjhjO2_Njkk=L00BG+24xtXWWKgJayRw@mail.gmail.com>
 <CA7E2403-A9F6-4B29-B640-13E41D530744@apple.com>
In-Reply-To: <CA7E2403-A9F6-4B29-B640-13E41D530744@apple.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Aug 2024 14:42:05 +0100
Message-ID: <CAFEAcA948k3=ep0FhqPL929=vB38SR-5sBS4fETrv4HUMC+zug@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Allow creating VMs with > 63GB of RAM on macOS
 15+
To: Danny Canter <danny_canter@apple.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Cameron Esfahani <dirty@apple.com>, rbolshakov@ddn.com, agraf@csgraf.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tj7FBOdlFWPH

On Sat, 17 Aug 2024 at 01:37, Danny Canter <danny_canter@apple.com> wrote:
>
> Peter, thought I=E2=80=99d send this little snippet before getting the re=
st of V2 done in case anyone hates this :). I tried to take a similar appro=
ach to kvm_type,
> but I=E2=80=99m not sure if this will be looked upon favorably so want an=
 early opinion. The nice thing about kvm_type is at least it has differing =
meaning per
> platform so all the impls can do whatever they need, with the below it=E2=
=80=99s really only needed on ARM (and obviously macOS specific) so it's a =
bit odd,
> but couldn=E2=80=99t think of how else to be able to be able to get what =
we need out of the memmap during vm creation.
>
> How this would be used is almost exactly like how ARMs kvm_type is used. =
We set up hvf_get_physical_address_range to freeze the memory
> map and compute the highest gpa, then check if that exceeds our platforms=
 largest IPA size and if so return a sane error message. If everything
> checks out we=E2=80=99d just set the IPA size on the VM config object and=
 then create the VM. The current patch should mostly stay the same after th=
at bit
> of plumbing I think besides removing the macOS 13 ifdef=E2=80=99s (and si=
mplifying the copy and pasted loop you pointed out). x86=E2=80=99s
> hvf_get_physical_address_range can be NULL.
>
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -215,6 +215,10 @@ typedef struct {
>   *    Return the type of KVM corresponding to the kvm-type string option=
 or
>   *    computed based on other criteria such as the host kernel capabilit=
ies.
>   *    kvm-type may be NULL if it is not needed.
> + * @hvf_get_physical_address_range:
> + *    Returns the physical address range in bits to use for the HVF virt=
ual
> + *    machine based on the current boards memory map. This may be NULL i=
f it
> + *    is not needed.
>   * @numa_mem_supported:
>   *    true if '--numa node.mem' option is supported and false otherwise
>   * @hotplug_allowed:
> @@ -253,6 +257,7 @@ struct MachineClass {
>      void (*reset)(MachineState *state, ShutdownCause reason);
>      void (*wakeup)(MachineState *state);
>      int (*kvm_type)(MachineState *machine, const char *arg);
> +    unsigned int (*hvf_get_physical_address_range)(MachineState *machine=
);

My gut feeling was that this felt very specific compared
to the kvm_type method which lets different architectures
use it for whatever they need. But on the other hand we
have exactly one use for this for hvf right now and at
least for the foreseeable future it's unlikely we're going
to want to do more. And this API isn't a set-in-stone one,
so we can come back and generalize it later if we ever need
to do that. (Or, if we find we need this kind of hook for
a third hypervisor type, maybe we try to make it hypervisor
agnostic at that point.)

So I'm OK with this.

thanks
-- PMM
