Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1364999lfb;
        Mon, 6 Jun 2022 06:24:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3s/hgl7Zt1aK4RcEIq4s5s4vDlK6MAHHnfRRx+zFkNNoh23BH01sDM3tSy4CpoDi8045d
X-Received: by 2002:a05:622a:50d:b0:304:f438:c464 with SMTP id l13-20020a05622a050d00b00304f438c464mr352628qtx.323.1654521889935;
        Mon, 06 Jun 2022 06:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654521889; cv=none;
        d=google.com; s=arc-20160816;
        b=Ji1Ev2bv+C/fUKLKuqdAkqiJNks1U3g9m/214KhYShOG+M8/9vrb0Gg5sIdDKa3+1g
         zA8MzqQF6BXiESdax/ezwgBqb8rnQsp77UVNZ0+oVpmxQqnC7rnIOrRaR0+u2AqX/RO/
         5Y670oIoWL4ALMa/04DsQR+v+iZcy+Lu9VJ+8fTK3nPrgT5JiA2BQtZyQbK5YfzSR7Zk
         Zcft1REKqQlkeNd4SwM49GxhrZ3dQp3Cy8PuUfR2freeeq13F+3GbIV4sDM6re3meyoC
         lBXmJOYI5iV2SN29dWtcTzSet9sJRh/f++e1+kHjXtoOE+z3mWnpa3W3irnxVIPCyzyi
         kwsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fwc/xxhdclU4+nctShI1c44+1rZCvhoekq+8YBPYj74=;
        b=l4R9nuKxopmJ0m4RvN1/YdynppWvwn0T4TqrVbzxAXbrgewZcaB0EfD/C2PUGzCpTk
         V+WIy4itX2uqqB/shNI5nllBUPvP0VNalM3rzwAD9Ggul8U3tPXT8Cljkrjva/qzZSuh
         hb+dTWn9f7GzAJ1+TaDTvX/oRmL2KWb7b3gdsOXibdeeGTVJYQZC+JMxkrzM3pUndynC
         HEVVi3drqe6o2F/c767zDVmbA+wX7csb4kLZ1G14iwdzxHswrSkAf0YYpakxejnZ4PNw
         SpvN7aH0NZbUorjCPcVF77Bn7E5za79olyTziq5doDqSKqIgBDko/Pw/MrSzgzRWjJRV
         2N2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S41rEUCl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020a05621419e800b0046215f04efesi8370904qvc.120.2022.06.06.06.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 06:24:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S41rEUCl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyCiv-0006qu-ER
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 09:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCQ5-0006rp-SB
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 09:05:21 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:38396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCQ2-0007yJ-AI
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 09:05:20 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ff7b90e635so142336727b3.5
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 06:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fwc/xxhdclU4+nctShI1c44+1rZCvhoekq+8YBPYj74=;
 b=S41rEUClZYtaosCgY6/yX+PHpIfJh5Q4stLGC1LFOSUjnx1ODopmG/Y3rTPVC3JqfV
 CbK6jabNraSmwQMZHA7fhuuXHAuDabvEmROficmFKiaYkqF0Xvku4t1mv043cdeVlZdb
 crWM3hF/bChhUTdjSm+KbzBbU89fXm/vo9j024rNpqr3U8/IUAJG/ldrgLNvltIj4o1B
 0cC8w94skb06Z8bz2c5d87vCXNx75u+x0i0pYJzzAHtSlUDNziDIgfj+eKlranmErIaP
 nwZ26exB6vUQe+qzhfvthdX2YyXQgNjK0tG6aYzuSlPVihqL4IvBo+fFN3GWy5+yl6mt
 /l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fwc/xxhdclU4+nctShI1c44+1rZCvhoekq+8YBPYj74=;
 b=VnjrXst/CeBQqs1LQM2nYR3g8f4XtTf6tOI2wJ/75gQFeeoyEsl2TRV7MF5Z2AQnv7
 8p4Y98amDMdjere2ou/x2L8fbe9ZHzn9k35l17h5itUMYtGxeG6IdBoJRyevhVxk4R5R
 KEEoZu3MkZi7rwIhxrMtxdEmCXz4rRb/f/IFSz/4brt8Y87GJWpkcLFMaU2R1iDTjdLD
 Hum6r3l+nOt/+EfHQYW6Twd6yYPUPkygE/TcsZ7znW1IpcurSaaSBFk0OGsoDA2BQOky
 juEUieH+BkS6yvvOVMoCuCCY9xZrhy26QopauN8gTxiM6XQUXdGwS9OUqFTQEiV6tPSm
 bUWg==
X-Gm-Message-State: AOAM532e3E8eYIGUXi+GGFaBu75YOQTSivwONlAFBJcVLw1kYhVoDwZ8
 /yVuIvomP6u4tENqwGXb34LQSRAGI8Ap4rUIshK5Yg==
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr26007674ywb.10.1654520717219; Mon, 06
 Jun 2022 06:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-21-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 14:05:06 +0100
Message-ID: <CAFEAcA_HoMLWudYorTmJTgqGPv1mwi8jZ3GkhjQB3TorZCOrWg@mail.gmail.com>
Subject: Re: [PATCH 20/71] target/arm: Add ID_AA64SMFR0_EL1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q8KGWt3NNYBn

On Thu, 2 Jun 2022 at 23:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This register is allocated from the existing block of id registers,
> so it is already RES0 for cpus that do not implement SME.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -682,13 +682,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          ahcf->isar.id_aa64pfr0 = t;
>
>          /*
> -         * Before v5.1, KVM did not support SVE and did not expose
> -         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
> -         * not expose the register to "user" requests like this
> -         * unless the host supports SVE.
> +         * KVM began exposing the unallocated ID registers as RAZ in 4.15.
> +         * Using SVE supported is an easy way to tell if these registers
> +         * are exposed, since both of these depend on SVE anyway.
>           */

This slightly loses context described in the old comment, though the
old comment isn't quite correct either. Between kernel commits 73433762fcae
(part of the initial implementation of SVE support) and f81cb2c3ad41 (which
fixed this bug), the kernel did indeed not expose ID_AA64ZFR0_EL1 as RAZ if
SVE was not implemented. So there's a range of kernels that had this
bug and for which we need to guard the access to ID_AA64ZFR0_EL1.
This isn't the case for ID_AA64SMFR0_EL1, though, which all kernels
should handle correctly (ignoring the pre-4.15 case).

So I think:
 (1) we should read ID_AA64SMFR0_EL1 further up in the same code
block where we read all the other ID registers like id_aa64mmfr0 etc.

 (2) separately, we should update this comment to read something like:

/*
 * There is a range of kernels between kernel commit 73433762fcae
 * and f81cb2c3ad41 which have a bug where the kernel doesn't expose
 * SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has enabled
 * SVE support, so we only read it here, rather than together with all
 * the other ID registers earlier.
 */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
