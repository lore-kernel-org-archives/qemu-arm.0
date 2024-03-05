Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp414792ejc;
        Tue, 5 Mar 2024 08:58:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV3WJ0QZpXTF7heLg4WU9ylCIit2oXCFkZS6ipgubzzw9p8KTY/jtD/h/rXBoe53/MXNSyn2zSGxt2wvth2T3TX18nD55m7
X-Google-Smtp-Source: AGHT+IFHwTzdJkzXNG4DE0duSVzFBmcVk5PlSnzMK6sAVpYUYLMg/rdsEi6FacBeGv/vKrGEtBRS
X-Received: by 2002:ac8:574a:0:b0:42e:f37b:e859 with SMTP id 10-20020ac8574a000000b0042ef37be859mr2470490qtx.25.1709657894464;
        Tue, 05 Mar 2024 08:58:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709657894; cv=none;
        d=google.com; s=arc-20160816;
        b=EQI8xsvIyTmnw9aq2tTNK1/k2HuqN6nVUZG4dCQWmvxptN/kRJsr3ywZj+FJganeaK
         a8yJO3w6MZ1Nsnn0rdAehL9nUQH2ghzGcnUT0YeIOmQLSg7SpxqYxqg1aqpmQIWuRyL5
         wsu3ssLrKoOvd2Me5v8EmDG+AziztBEfy3Po9Q8LlHyLCJqceTDgkfurXWiIgeh5JnW9
         x8pBgauwBjEZ/Oyt8Z6Q7o47gcNMHqBJhwksltVp77i9f04usve9Svf9idFeLmnp/bKg
         euua8EqVSql6c0Nx8+plV8m/aXHROS5CKMrwtKN6BPhwLVkxQu9DIytslFzArAMuddCl
         HWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ExHJlsRhD5XE2ARtIH6VPdj3dhaUg4TXyWFlXRc3rC4=;
        fh=3ZuSgzrKujaP3yhTO2ByPDPjoltcuwnJBR6l6PZplyo=;
        b=Ox+hxwGyhdivr0dgRHH02QdmjxWZvLn253KKGfD8bVtk6/Ge3fDHxBSx+d1NH1nVxl
         HXSYheUsGoWXXBUR0sPGqeFrTAnIE1j9ax1HkfBPBBe+f93RoLyZ6UHsRKAWLBWik8zW
         8VDMACNJLQSUttiiqTRGq4ZSYPRslk89UozmDJG7y6VxDazswm1gtz3xS11UvSclI1bI
         7xGN41+I1J8wvP2CkIZ9Ks1FQv9ZDXcAFxM8+6C2S0zgLt1nlDiAn2SnQQ7B71Pxt4mX
         zKmyXujetOxZiWB34zaIi08ivK0lJCjAyNd7ApSJLz6wEMrM7OC7ydmjNhPM/0Gu8PgL
         q0cQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DVaRjoTd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ev12-20020a05622a510c00b0042ef595d151si4687036qtb.269.2024.03.05.08.58.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 08:58:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DVaRjoTd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhY6q-0002T0-25; Tue, 05 Mar 2024 11:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhY6n-0002Sh-RX
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 11:57:42 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhY6k-0003XT-AI
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 11:57:39 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d29aad15a5so75026491fa.3
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 08:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709657856; x=1710262656; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ExHJlsRhD5XE2ARtIH6VPdj3dhaUg4TXyWFlXRc3rC4=;
 b=DVaRjoTdvmNqDKnCDkPKw+8vs4fsKdlSir1691p9Qx+OlrTK7NW/Uziatz9xhpHkzZ
 BGiZTvwKM4WE+XXbllakIN8lZq5hCmAf5gaFdv9NM9EEe35xqBLwQbtUU1MKwtDUPPxE
 Aq+DyECI+BADexgWwT3+PDZoEQlSMeakq6sNtPUjS5NsClvGHY3X/HYoOJK7z4SpSUCX
 0A6rPudAZrbSaqnX7kdvH8cHxplFN2Xi+k/TglCvWounfQjnus9awwfBdWImeThveXNW
 xIieVhbwpp2nqDUCXmp+Kgowqb9UWRBRYd/nfY3pEHdm/9k1Vnn+lUDJpT0Z8fxivPsY
 fU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709657856; x=1710262656;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ExHJlsRhD5XE2ARtIH6VPdj3dhaUg4TXyWFlXRc3rC4=;
 b=hi9FlDbjJPFkLCNcYD9O7RZzzDoOfZbcFYv8i6M80BBz0MyjGpO7epmoK+TboMS9x+
 wytHHdIeLBLuUCK87VMiOzOEYh+LYuAfo11M3kPpW7Z1U4ae2SM/mZ3iQwi0VkYPLIYz
 f42sSXc2/hUO6KByRb+m0ELIVccl/d4vfkcpzI5bdUEK4oIIuxur20Q/HaYbq6SWHdUM
 OphU7GWfxJyfkW3qKOdnXixArLy9hR6G7CIsUIjFAuz4OYslhfW/sk4JMNLWq/ILlC+p
 ovt7psC7+ethMeKKMsTb7ReFec6rpLymOgFo8yUqG4Ml1p/F3oqWTQRde+a+BO6wVucx
 Jc7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLjYg+aXxvYLOLnH+ZmuNmGCkhvOP+YmH0hJCi76SCysDFlqKhoTa1eALXlW62/AXtUTz5toBDkCy3Lx393pNC4otw
X-Gm-Message-State: AOJu0Yzvkn0awav0HM+Z4h7AqEkRy7ud0dfN8hWfGMgJ6jrKMUA2P+kf
 n6cO4YdEJMsaC4T0p2GYh8Bs5ff9B8t7vl1EGI6pzqBU/USs9MYWc68w1PXl1puBr8CTEmSZb/m
 uuK95yD7azxPoO9NSawZGGkbCDUvHTIbxdhSRJw==
X-Received: by 2002:a2e:8846:0:b0:2d3:f4f1:ad7f with SMTP id
 z6-20020a2e8846000000b002d3f4f1ad7fmr1514761ljj.33.1709657856459; Tue, 05 Mar
 2024 08:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20240209160039.677865-1-eric.auger@redhat.com>
In-Reply-To: <20240209160039.677865-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Mar 2024 16:57:25 +0000
Message-ID: <CAFEAcA_i7x=F-mDgkoa4Tma1xGH0no+WCfNt2Ljyk3DYhHNTiQ@mail.gmail.com>
Subject: Re: [RFC v2 0/5] ARM Nested Virt Support
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 miguel.luis@oracle.com, haibo.xu@linaro.org, richard.henderson@linaro.org, 
 maz@kernel.org, gkulkarni@amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x231.google.com
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
X-TUID: fYHjH3M/QQ6s

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
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/v8.2-nv-rfcv2
>
> Previous version from Miguel:
> [1] https://lore.kernel.org/all/20230227163718.62003-1-miguel.luis@oracle.com/
> Previous version from Haibo:
> [2] https://lore.kernel.org/qemu-devel/cover.1617281290.git.haibo.xu@linaro.org/
> [3] Marc's kernel v11 series:
>     [PATCH v11 00/43] KVM: arm64: Nested Virtualization support (FEAT_NV2 only)
>     https://lore.kernel.org/linux-arm-kernel/20231120131027.854038-1-maz@kernel.org/T/
>     available at: https://github.com/eauger/linux/tree/nv-6.8-nv2-v11
>
> Haibo Xu (5):
>   [Placeholder] headers: Partial headers update for NV2 enablement
>   hw/arm: Allow setting KVM vGIC maintenance IRQ
>   target/arm/kvm: Add helper to detect EL2 when using KVM
>   target/arm: Enable feature ARM_FEATURE_EL2 if EL2 is supported
>   hw/arm/virt: Allow virt extensions with KVM
>
>  hw/arm/virt.c                      |  6 +++++-
>  hw/intc/arm_gicv3_common.c         |  1 +
>  hw/intc/arm_gicv3_kvm.c            | 21 +++++++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |  1 +
>  linux-headers/asm-arm64/kvm.h      |  1 +
>  linux-headers/linux/kvm.h          |  1 +
>  target/arm/kvm.c                   | 21 +++++++++++++++++++++
>  target/arm/kvm_arm.h               | 12 ++++++++++++
>  8 files changed, 63 insertions(+), 1 deletion(-)

All the patches in this series seem reasonable, but the series
as a whole is so short I wonder if we're missing something :-)
Does migration Just Work? (I guess as long as the kernel exposes
all the EL2 sysregs via the ONE_REG ioctl interface it ought to...)

Anyway, I don't think there's anything that stood out as needing
major changes, so for now I guess we just wait for whenever the
KVM side patches eventually land.

thanks
-- PMM
