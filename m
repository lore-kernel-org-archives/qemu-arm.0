Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp969984ejb;
        Fri, 9 Feb 2024 10:58:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVenqrrAWQzUMncpXUZ660gE11BeFVXbfNrtNg//0LyBjJ+1EwD+mGwuONAN8XH6Pv169WUJHn/3Ke6uCRMn/NJGdlzPs2s
X-Google-Smtp-Source: AGHT+IGlDgI3JdciROc7sa8GCWqfcplyQGgFAv7XrVUGrAEKXtm0W/f6dNX8iUAPM4AKcRlEPfsh
X-Received: by 2002:a0c:cb01:0:b0:68c:a83b:aec7 with SMTP id o1-20020a0ccb01000000b0068ca83baec7mr8054qvk.50.1707505093457;
        Fri, 09 Feb 2024 10:58:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707505093; cv=none;
        d=google.com; s=arc-20160816;
        b=FlVH62c1DC7qbAcTKLv52MTr/I4mOwGe/WLRxufAK0uePqIkId+CAWXMcu7V/lKQZn
         ZZyRbNWcn4ZNeL/Dh3oniSovi1AwwwGhS57EswrvTOHpS0l4TiePhf9OvpN7LcHLFwDf
         Jb79E0ysmMjkT2g2exuU/xQCoBA9XMWSrtTcho7ZQpMnteruny1bV/mvIhOvVIXHzlsy
         Pulo900KZM99BF2t7/U5zwjN64W08WhYdaaPF8xDOm2KcwAZD8asca2PCI+s5HtS/DaH
         Tx5s+7YKMsvRJ65FMNOQfWZGpEp5Ziqy++5rA+aqeGtwPAveghG3yKONPQSVJxsmaDDj
         W0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=w5tjkzD5+dT/pEawdBPPKkooZploLqHu869R7Wt9kyY=;
        fh=HrD6Q8K0SI7eOpuLXblnQ2c7I+IAK4QR/w5zGFivMuQ=;
        b=sZDIM84Sdz5dxWc1m3xc+61VSNBY+JfDPrMyj3J3zhZLjKBQG623VlIxwrhtbkK7Cw
         zJ0SP8oeVrdPo5CjwowRzSF0CfDUiRq1TYRV/v1S3HLZ/EOFrBaH8+PStNRVjVn3+4FE
         k8XJUEoEqP2Z0r8dw5QxqVyqB6mEy0MaUEd9lbhbUzZO2s97uP12ja0qwITb/qvj8RSy
         fUoX+w5a5fWWBnmWdFE7kNLdBm7DgQM3fl3vtkko1u5MrjRWcGCqcLEWgKPYQHyXUnU6
         To2gRolKhFmEo+OkCx2zk+hcEIUEtXvpH5M3R1TryAOLS2W3fGkb0SchQvQe62y/Pmr9
         NmmQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E7looAsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCXv09FNBXoP4qB6Q9yMGnIuy1R8NEHolFrK49vpD1ACjkmzOtzupLRjuMUSxtJIrzz2wFaM1OnIGo4qn+z0Xcrtwlo4cDYI
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020ad45c63000000b0068cb64ecfd3si2675329qvh.86.2024.02.09.10.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Feb 2024 10:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E7looAsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rYW4R-0002Sr-Ux; Fri, 09 Feb 2024 13:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rYW4P-0002SP-I3
 for qemu-arm@nongnu.org; Fri, 09 Feb 2024 13:57:53 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rYW4N-0002QT-RJ
 for qemu-arm@nongnu.org; Fri, 09 Feb 2024 13:57:53 -0500
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cf1fd1cc5bso13517921fa.3
 for <qemu-arm@nongnu.org>; Fri, 09 Feb 2024 10:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707505068; x=1708109868; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w5tjkzD5+dT/pEawdBPPKkooZploLqHu869R7Wt9kyY=;
 b=E7looAsma2fktAAkBZyvCMibTaNnFTj4o1WYr5HVZbjCCUKbpaGZ79Z6gbrm4q/6It
 Vl/jEXRuHw13rkbyqLeql8lqfYN9nKQDqB4epnufchgu5vmipV9UttdhAjVxa/biNQ6p
 pGIgP8F/MGReIf74scTV1DeC2CiYqryP/gWl0mI0lwVLq1FLdllIvCOCqT4fFGDm7nXZ
 nVO78PGjrefxyEDmOqNOA69Lw68NSkik1IFPlcBkxcGCl3sr4aupzTa6DB13eKdIiie9
 9Xk5keff6zY0Z4P073NaQ9fgpMhu854i/4IW6VVGaX1sTTERmeU/JhbizoHIoBW847z9
 4tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707505068; x=1708109868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w5tjkzD5+dT/pEawdBPPKkooZploLqHu869R7Wt9kyY=;
 b=b6M+9tfKm94sF7P8SbQ0dUkDksFUAaZeF1wD0xS6nIDtKlz3TZtTyyIFLnRk+ZDWKH
 523ASFAz/2zKtY3pxIiNK2Wu05uD887iifdP2fiUdsq1X2oS4yTxgRxio7vQrCaRQPt+
 4+1YcNDHao2+XtkYmTryTrigY1QZAS5FCVmJqLuqEWkNYrzi09YuRPEqCl6arShhKpjh
 sfUfDvY+e4AZVzvQUoMq0kyLtysWX9GP1HSL/Y6XdQc7fRrESPG91y1J1xMhqq69R5P4
 YuwWxpfj6Xx45ErfyI/cUyP+5uRHW/c2CunVSEb6zlnHh8MnwjO2k0M+3Sp1wz6KD+gj
 RHdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMQuVJQT9n/b697mwoKytWWxc7cJBmq5Zz+k/2+GIyKOobsBLC/zK3e8mHG0ZX7rTOeb3xg9GpA5MtU6NQSX3UFO10
X-Gm-Message-State: AOJu0Ywkom0/Wjk662IWZIo6isDp6VekjYnNnrjINsfI8obSuJS14+ph
 XovkVzxjr/LsLMvwvmbvWBsgrjrjZdh6pY2YajK63Ig+rK8c3GIY+NqmgaPQSuBF1crYeNEpyRw
 WtXJdanlmVRV8KiQyp3mNYPFlUYM4KuRiYuQzRQ==
X-Received: by 2002:a2e:900b:0:b0:2d0:d054:17df with SMTP id
 h11-20020a2e900b000000b002d0d05417dfmr1778421ljg.42.1707505067670; Fri, 09
 Feb 2024 10:57:47 -0800 (PST)
MIME-Version: 1.0
References: <20240209160039.677865-1-eric.auger@redhat.com>
In-Reply-To: <20240209160039.677865-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Feb 2024 18:57:36 +0000
Message-ID: <CAFEAcA_SFtmCCFBPwWjJF3uygdpdqoZuYLaQQP186fyQ+dJEHA@mail.gmail.com>
Subject: Re: [RFC v2 0/5] ARM Nested Virt Support
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 miguel.luis@oracle.com, haibo.xu@linaro.org, richard.henderson@linaro.org, 
 maz@kernel.org, gkulkarni@amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x233.google.com
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
X-TUID: o6Oofo3xXBAX

On Fri, 9 Feb 2024 at 16:00, Eric Auger <eric.auger@redhat.com> wrote:
>
> This series adds ARM Nested Virtualization support in KVM mode.
> This is a respin of previous contributions from Miguel [1] and Haibo [2].
>
> This was tested with Marc's v11 [3] on Ampere HW with fedora L1 guest and
> L2 guests booted without EDK2. However it does not work yet with
> EDK2 but it looks unrelated to this qemu integration (host hard lockups).
>
> The host needs to be booted with "kvm-arm.mode=nested" option and
> qemu needs to be invoked with :
>
> -machine virt,virtualization=on
>
> There is a known issue with hosts supporting SVE. Kernel does not support both
> SVE and NV2 and the current qemu integration has an issue with the
> scratch_host_vcpu startup because both are enabled if exposed by the kernel.
> This is independent on whether sve is disabled on the command line. Unfortunately
> I lost access to the HW that expose that issue so I couldn't fix it in this
> version.

You can probably repro that by running the whole setup under
QEMU's FEAT_NV emulation, which will be able to give you a CPU
with both FEAT_NV and SVE.

Personally I think that this is a kernel missing-feature that
should really be fixed as part of getting the kernel patches
upstreamed. There's no cause to force every userspace VMM to
develop extra complications for this.

thanks
-- PMM
