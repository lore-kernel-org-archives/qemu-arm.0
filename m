Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4236200ejd;
        Mon, 22 Apr 2024 05:57:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMvoSI27C8bJywYWHT9D/a3KUCgLQmZwhhxukAqypuDSjPmpDBiKf4tZ+iKT4NHEk8DrA1J+1f7ZxfnX5iOZ7LuhVfpM0w
X-Google-Smtp-Source: AGHT+IH06VJRDyA+ff9a9hp1R8vEZpM54rq20+LRjc+NFx9VTKVprZQ5k3nk+RC+7auC+qRz2fuR
X-Received: by 2002:a05:620a:5a4c:b0:78e:fba5:4742 with SMTP id wx12-20020a05620a5a4c00b0078efba54742mr15659703qkn.24.1713790632674;
        Mon, 22 Apr 2024 05:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713790632; cv=none;
        d=google.com; s=arc-20160816;
        b=wP+vhW3+2EAlG0L0Mm3PA03SmQXmUhtozsE8JoPxsb5STZcJW2DFb0wgGXkbd3KOx8
         n3ODglkJAboW7ysZVXM1eYzWe0jpzdlMhGFnokdRDa3ey/IEHaep7M7R0udaFn0KCci1
         yDPz2cnmhfs5HmrHtybtN9VVO8X/Te9pV0O8qZYfcZW/4NHB2I6kLMnpW/fhYlUGUI+q
         1NtKuLnnT2xhq5/G9EBb1IRGtqrSplfU8gd5XfvWgSnC2Kalb+72n9BDwfcDN/gOhTxd
         F3vp2Z6l8my3oGkTc+H4e5T1d9rNyHgfEwAoukIX6ZA6x/fGcz+6x4hzyTInMXv4dQU6
         q2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nl+sgvBp+w/CT7gP97ti+pDaudI7/Gy87YKtR8NYhBE=;
        fh=LNAlGgVYafZeeJ4BtVb6lUn564ChQ0WXtIq4NJyN4v4=;
        b=xlNglXQyY0X1qkPtpKWsp4KVElQSFSNOY3fNG4csRkQNMwfG0PgHNk7EFBnju9VFt4
         5gdkd8SFJYkBogfNaGykAkJrCcfS8+/61Hxau+3xhi13a5vwi0gxzZorzfiS6Q6O6bjF
         O0ivNPX5/2b2uErsQg8+O50n3/2kFUTlOdjy9jA1C6CjN67SjTTbWcAcS2GNhMIjGjBV
         QN87Lp0ox4hMYaRK4WXdMjGoNXdkOVici4MZTTq44yMlQmBMHDtaL31mIJCues/1CtSj
         FMdL31ND72norvLZGCLmcdbaeNkH/ZIPnrMeTUkZgI7dYohjD5vv/cWMP64Am5UcpyE0
         m/UA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wa2/BYeo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp39-20020a05620a45a700b0078a68d1e54bsi12030440qkb.123.2024.04.22.05.57.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Apr 2024 05:57:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wa2/BYeo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rytDp-0005hh-6D; Mon, 22 Apr 2024 08:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rytDl-0005fp-Hp
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 08:56:34 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rytDj-0007B7-6b
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 08:56:33 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-571c22d9de4so5758008a12.3
 for <qemu-arm@nongnu.org>; Mon, 22 Apr 2024 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713790589; x=1714395389; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nl+sgvBp+w/CT7gP97ti+pDaudI7/Gy87YKtR8NYhBE=;
 b=wa2/BYeoJ9R5HTeut0yT/PJKlKm+AhIKKeAAZJzuj6Y7zL+GNS9y9K0+ctVVs8Anbl
 MR/5s4Yl5wcfNif8k+sX91aYX8XqgDrKQxM/1OtrGksB+iokNsUcgmIQx0z7qRtAX9XB
 ALxKIPSqr4AleuoNSnexbFFX+yBp+JGlHkHIlOPGCxtzQ0Uf94gIKHMZt73auaBMlAJe
 xIAync8XlxMWjPLfGzdeqmKKnTcxdd2Epliq4p/BXJ3avJNZV3YrZeKQkx/aL9a/fs8j
 v4myAooi3dYEewbCxY41zAh/cKY+99o+8za47fqvkdQbtM8dMZc/1XBRjBkA68muAI+f
 RVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713790589; x=1714395389;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nl+sgvBp+w/CT7gP97ti+pDaudI7/Gy87YKtR8NYhBE=;
 b=K/ilheAEceKMZhUQTuNTUUbLr+ppiX0vNjNLoTH8VkgVmbK5Tv/y4Y6uEze5lG4m2F
 CcSen9hLhm+CSAwRBhYfn58nKmFs7ngyoarNGP7/nuq4P4Qc2igrS+HSIOCUtduraDj3
 vZ8U4gsxuo+slIcsgXRV/C2LztuEdcTopmiMNMwmFPN8z5+kQJmUhnGpXRwnYu2VNL+8
 LWP4HlijCDEhDot/PpHJPxKiv7m0b5CCo23qR223PlZG7VjHxDBwpb/6zIP0iV6KSGb5
 P5HrlvDdTYW6lXKvJmq/qKfQlyTL7SEhM2PDLYZLcHndKqYHpv4DT1mkaAzassxVy+t4
 NheA==
X-Gm-Message-State: AOJu0Yy+QUQ4HC8lWDKPhOlNpPVJE7xvdozasY8llilOLCcN8yt7rwLK
 1CDWqOk/pExPFFxDynCeZ35x4P+tpplOCEdC8Ev40b61rWczMbx10LnJAzoKJoG6s64Ahwzzub4
 Z1ozYqxJ9huiXabasoAxBon24gsApZQ4tBNK9HZW3f3MbHLfI
X-Received: by 2002:a50:d609:0:b0:56e:418:5559 with SMTP id
 x9-20020a50d609000000b0056e04185559mr6425782edi.3.1713790589501; Mon, 22 Apr
 2024 05:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240419184608.2675213-1-peter.maydell@linaro.org>
In-Reply-To: <20240419184608.2675213-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Apr 2024 13:56:18 +0100
Message-ID: <CAFEAcA91ZULEjEgTotevp-epgH_azcwrSi9PVnnOSk8gq5j22g@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/arm: Make the counter frequency default 1GHz
 for new CPUs, machines
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: qM+qPMtRHGYt

On Fri, 19 Apr 2024 at 19:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In previous versions of the Arm architecture, the frequency of the
> generic timers as reported in CNTFRQ_EL0 could be any IMPDEF value,
> and for QEMU we picked 62.5MHz, giving a timer tick period of 16ns.
> In Armv8.6, the architecture standardized this frequency to 1GHz.
>
> Because there is no ID register feature field that indicates whether a
> CPU is v8.6 or that it ought to have this counter frequency, we
> implement this by changing our default CNTFRQ value for all CPUs, with
> exceptions for backwards compatibility:
>
>  * CPU types which we already implement will retain the old
>    default value. None of these are v8.6 CPUs, so this is
>    architecturally OK.
>  * CPUs used in versioned machine types with a version of 9.0
>    or earlier will retain the old default value.
>
> The upshot is that the only CPU type that changes is 'max'; but any
> new type we add in future (whether v8.6 or not) will also get the new
> 1GHz default (assuming we spot in code review any attempts to set
> the ARM_FEATURE_BACKCOMPAT_CNTFRQ flag on new CPU types as a result
> of cut-n-paste from an older CPU initfn ;-)).
>
> It remains the case that the machine model can override the default
> value via the 'cntfrq' QOM property (regardless of the CPU type).

This patchset turns out to break the sbsa-ref board: the
Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max_pauth_impdef
avocado test both (a) takes rather longer to boot and (b) when
running thinks that time is advancing very fast.

I suspect this may be because the firmware hard-codes the
generic timer clock frequency it is expecting. I've cc'd the
sbsa-ref maintainers: is that correct?

If so, we can deal with it by making the sbsa-ref board set the
cntfrq QOM property on its CPUs to force them to the old
frequency. However this will produce a technically-out-of-spec
CPU when used with a v8.6-compliant CPU type, so probably we
should do something to be able to tell the firmware the clock
frequency (if it doesn't want to just read CNTFRQ_EL0 itself).

thanks
-- PMM
