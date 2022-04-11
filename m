Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1574182lfq;
        Mon, 11 Apr 2022 05:11:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRhv4tVeud3VKS9aRniEY1jBS/nRYR5j4r6hT3Ir0ieDjX8nChMTiexiAy9w8WtyZYpKeP
X-Received: by 2002:a05:6214:518a:b0:444:1433:60ca with SMTP id kl10-20020a056214518a00b00444143360camr16379875qvb.41.1649679082604;
        Mon, 11 Apr 2022 05:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649679082; cv=none;
        d=google.com; s=arc-20160816;
        b=U/MejfHomz6ZRXwVylFN75Jk6AGmQ1/HBr76nlXc+S8Ha5W52iOYujhwP9fvOy16p6
         V/H5OH9iZUl2bFyE1vh99qzw/D9bHFmLKbvid+Rxg6AlvJuszRqqUh8J4qEHKFJdG4jl
         lhpKK26S4bXTsgZg/eYfwbmsXPZU2ZZyUh3XQeg9stq+WVwWyDE+XiO7SJYWlgTALMkk
         MmLpUUiIORnLmA55JXQlChi6YGJhANEefuzuiKYCXiRFy5XqPeFlhO5YO/yPMM+rpLV0
         qkYTchlib3Go3slH0XcmzeTLj+z/T957n7dm30qi9w6gpqBvACN9es/+JFY3mZDM/g3x
         Z6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=26FZLetp4/aKcmiVTcyfLB+NXTh30uhlPSKZQxtB39g=;
        b=z8EofXR+oUTBjvoYfcqaLaVO45P3XZWiUf+ItTYaNEwmjpDGkHYvjJPqmR/GJHLhw5
         7cm8NeKfl/2j1dNucVbMX0njAra35/8rp1QPAA2gNTNoBg4n42FleI8dCOkCqUxKsvLl
         DRf7uKdfkhLHejUdpIk6jNTInoVQeOdcH3Xl/IFRIxcX4CBq3NthdtQ3jNFyD3gRsq/c
         WO8Z765DDEwKng4L6arnBbRHAwhUmvY/tZJvaNwUgd6NbiswtIMo99t6wfPamspX5yck
         4fG3+HV0DKkdmE5KjabsRsMst4UwOM7H9EREUUSrAKH+1MJnvoxhk3KhM28fJ/HMlhxF
         KbQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q5k5QRU1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020ac84e8b000000b002ed0e0d212csi4933108qtp.177.2022.04.11.05.11.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 05:11:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q5k5QRU1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndst8-0005dW-4W
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 08:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndssw-0005dG-QJ
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:11:10 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:34350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndssv-0001X2-6k
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:11:10 -0400
Received: by mail-yb1-xb36.google.com with SMTP id g34so7145554ybj.1
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 05:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=26FZLetp4/aKcmiVTcyfLB+NXTh30uhlPSKZQxtB39g=;
 b=q5k5QRU1qXQl9ZeuvduTtnb+M9DOnIC3XYZuJDBEHCPqtdZDLBVq8gSSmyLMyCEPCp
 2mneqa6tett9juOC+mOPUovb8tXUiEPWsDwNUdOobHu5C2Ccxv8qsE+9xT4qNWBiFJ4x
 ZftGvma7GF82Bfo0n1xmf850Sh5NFKg4lxW7yR0B83IJbNpMUkynBRAbWgDEDXkAr0ba
 OccXI00qMU7Wyps266LN+ef6PeHX0ewsNcDl1Xn5qv/rttNN2dMoMstDzx0LetKOJczI
 pXcSaSJnYhFp2nUo0CdD8V8cE97zq4HQzINIaSo1hMItutCAMcVyqLHuRjRPOR+iyO1q
 jVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26FZLetp4/aKcmiVTcyfLB+NXTh30uhlPSKZQxtB39g=;
 b=SAlj0YbHyDFbRV3163rMdPcJsc8+ceoaOvWrTmJgmkCHMUupAfF6RABjr0Ids0QN4c
 +eRLFehlno0LrMsGQYz3aX7XMOyNnHwHKCZbqhbntdcmRDblU99a7K9ilknqzVyOhn26
 8vmy/bnCZwKLRaHJYIyQLkgRIkRYJ5kec1RBuvGyQBHTPRU7QSPmiJZYFUPsXddfREiM
 aivHEIQtMD+SZQWtKvlAOV6O5Xm5Fh0hdWg+bFKE7WOX+BXFjfMdVE7NP2O/KanHFhRZ
 DQZFSjOGGVGZp0BuI0e35oUCc8k1Y5ClmwW1VBnD9ApWzU5JqUAmBhhs6eYmxhA0xHkz
 q7wA==
X-Gm-Message-State: AOAM531QikUU87nLcL2RA+vWOT6W5SJlv5HU45zVcpQmtFo4ElMaN0q6
 O0FWvoLwHIUCqKsbC4sGBGK/OlKU9kxPnSmdVum/Sg==
X-Received: by 2002:a25:488:0:b0:641:1c71:b0ff with SMTP id
 130-20020a250488000000b006411c71b0ffmr7269502ybe.39.1649679067857; Mon, 11
 Apr 2022 05:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220411065842.63880-1-gshan@redhat.com>
 <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
 <20220411120216.63r7ggy43y7ttvhp@gator>
In-Reply-To: <20220411120216.63r7ggy43y7ttvhp@gator>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:10:56 +0100
Message-ID: <CAFEAcA_PfakDVFvNCF55FGoV0A=141CNdtqvgPjheSGvpVqh+A@mail.gmail.com>
Subject: Re: [PATCH 0/5] target/arm: Support variable sized coprocessor
 registers
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Cc: Gavin Shan <gshan@redhat.com>, agraf@csgraf.de,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: getCsiFSVgu/

On Mon, 11 Apr 2022 at 13:02, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Apr 11, 2022 at 10:22:59AM +0100, Peter Maydell wrote:
> > Also, we support SVE today, and we don't have variable size
> > coprocessor registers. Is there a bug here that we would be
> > fixing ?
>
> SVE registers are KVM_REG_SIZE_U2048 and KVM_REG_SIZE_U256 sized
> registers. They work fine (just like the VFP registers which are
> KVM_REG_SIZE_U128 sized). They work because they don't get stored in the
> cpreg list. SVE and CORE (which includes VFP) registers are filtered
> out by kvm_arm_reg_syncs_via_cpreg_list(). Since they're filtered
> out they need to be handled specifically by kvm_arch_get/put_registers()

Right, this is the distinction between ONE_REG registers and
coprocessor registers (which are a subset of ONE_REG registers).
We wouldn't want to handle SVE regs in the copro list anyway,
I think, because we want their state to end up in env->vfp.zregs[]
so the gdbstub can find it there. And we wouldn't have benefited
from the copro regs handling's "no need for new QEMU to handle
migrating state of a new register" because we needed a lot of
special case code for SVE and couldn't enable it by default
for other reasons.

If we do add non-64-bit cpregs on the kernel side then we need to
make those new registers opt-in, because currently deployed QEMU
will refuse to start if the kernel passes it a register in the
KVM_GET_REG_LIST that is larger than 64 bits and isn't
KVM_REG_ARM_CORE or KVM_REG_ARM64_SVE (assuming I'm not misreading
the QEMU code).

-- PMM
