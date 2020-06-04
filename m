Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1588533lfc;
        Thu, 4 Jun 2020 09:09:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8c5ONJ75wVGn0D2MRzztHb8/ssQvSb+upNf4KuPRboedl3sObEzO7GRT++iw2CAI4JTlq
X-Received: by 2002:ac5:ccf0:: with SMTP id k16mr3962442vkn.95.1591286991646;
        Thu, 04 Jun 2020 09:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591286991; cv=none;
        d=google.com; s=arc-20160816;
        b=YKbgj87KBRF/2OzOxUj42Uw+eMRPc4OyRgqJ0xkn7QVKhxRg97y2k2GiPlwQtPwMx1
         sDIpXcoRgflnnhQHl7X9PEALq9L1yDAgxtTCAOq4C0ht2NvV/bF1G2yu9evJlMouChDW
         A/2AgdYpPktMizALgRXNbZK5BwDfCNZt+qWGr742px2dpzX1w6GEf8uaBpZvUDymI9H8
         wNjL17CgZ6HALHGXig4geciz5umCB4tHp7+M+LurNvjtqpeYetUWBEuXrtaDuo+vd1Ol
         hNVaEs+uS5Vde/STf7+MU+P7/I1jDLi+zSfHidFocSP4U1ezghHu/YExCUv3ub+0nrz3
         u+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VBs6iE9+n8Kqp1wKypzu3gJAncF/teohACQrm2k8vFY=;
        b=XIWB20gueWELfnJjJMW5loaY4+QFqi2SiL+u7Eg9l+5nRtEyjVF7amKyLHXzXX8Q2S
         TpGqtaFUb9EanJCTtITJo0bLD+fmsx7R8wkyvFDy0J5PhgsnCt7x5c/YODa0GpuAGR8l
         jlgogXeeShNNuI6eL11te1T8FuiGpwJdTYFzPezM3OXKQ+99ibPpk8QeclFj5F6x3Fbx
         4f5+OFiMGtu7qSupAV8ovASxZNmbFU+4/P/+QfKborf+OViKYhQTBu1DGbLOoOD8X3Hs
         PgnHlUxS2c3yZRBJHf8adp0Qru5lhbzlM+xjg9UdHc9BTV8XZYR845TjND4K3LkeTP3v
         MKjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z7oOFFjv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si154540uan.27.2020.06.04.09.09.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 09:09:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z7oOFFjv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgsRC-00056L-W5
	for alex.bennee@linaro.org; Thu, 04 Jun 2020 12:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jgsR6-000562-CX
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 12:09:44 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:37303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jgsR4-000407-Pq
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 12:09:43 -0400
Received: by mail-ot1-x334.google.com with SMTP id v13so5194431otp.4
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 09:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VBs6iE9+n8Kqp1wKypzu3gJAncF/teohACQrm2k8vFY=;
 b=Z7oOFFjvippx3Wxho5UoW9OupQbElYrQsGc+kzcQHHCvEbXd2DaE8lF/YQvF0XUpmB
 QWtTXIoeKRh7ciR+Fm9MzREgxylWffAJ9rHd1aA16cebqAwTU18jOQJR+jAEoLXaqY2Z
 0lBQNgl1DegMbqFASDA0QzMsUEP/KBgb3Y8MF68HepBd8BRkIp8yK6/EvYmAj4uY0Y0U
 uFmmdGzpNYhDdYYBT+s391PeIh90tvfkydr+jrmRJCOcwSH0LRxyj/EF4V8ovG6Plo7d
 gMA8BMY0m5seMBA7H7c8n262aILYdyGxt4kHVcJxyDCakVsE0/2/hyw+vVm180BX8Dpk
 50kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VBs6iE9+n8Kqp1wKypzu3gJAncF/teohACQrm2k8vFY=;
 b=HUw9oPbcNTQtvh5yc4TDG4FTNQH+tTyolUQtjbdzUeQ8ju+diDhDeE/MSKq3xepy9O
 L9AsPU2K6BbScEUqE15GPN51Dn+tbxZpftVt0zJtA1v+LFkltZMg0YfxjcOjUyHrz+jJ
 KIKx73ParQXJoCw5hlO5k5iu70BTVXDfXv+ZEeAoNodmXwAK20Z9BrpCOD6grSx2JHHp
 yuW3I0pux/9NYOjgdWfYPP9aZwqEabEmgmzmC1p7hTapYts73w5zqsmjpvCXEEPJhdQy
 Kknmz5eGRXQvJoBP8gyfa2bzNNDNf8ilrf/d2Cz+BGx9Fr03htC9dsyxn088r/wOs0VH
 vArw==
X-Gm-Message-State: AOAM531Xx53A2xr96utVycG1KDGVhbNflgbtQC5tYGSUs4mQo4w2KCbF
 ABzAjWU9NqPygwQqXb1dsGE0Er1sn/yBxo3UmslUjA==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr4387698ote.135.1591286981629; 
 Thu, 04 Jun 2020 09:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200604125544.GW28566@vanye>
 <20200604131802.7w4hncgq2gopbw6z@kamzik.brq.redhat.com>
 <20200604160300.GB28566@vanye>
In-Reply-To: <20200604160300.GB28566@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jun 2020 17:09:30 +0100
Message-ID: <CAFEAcA8MTB5VQQbMuSfkGc9JcGeawL_GUY8Pcs3yxT9kdncZJw@mail.gmail.com>
Subject: Re: kvm_target, QEMU_KVM_ARM_TARGET_GENERIC_V8 questions
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x334.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iL/4dB0vAPo5

On Thu, 4 Jun 2020 at 17:03, Leif Lindholm <leif@nuviainc.com> wrote:
> But there's also things like:
> - a57_initfn explicitly setting kvm_target, then only being called
>   from max_initfn for !kvm_enabled()

Expected -- a KVM 'max' is nothing to do with a TCG 'max':
 * for KVM, -cpu max means "same as -cpu host"
 * for TCG, -cpu max means "start with an A57, then add in all the
   extra architectural features that have been added since then".

kvm_target being set by a57_initfn is specifically for the case
where a KVM user is using "-cpu cortex-a57".

> - a57_initfn setting cpu->dtb_compatible to "arm,cortex-a57"

What else would it set it to?

> - a57 initfn setting cpu->midr, max_initfn overwriting parts of it

Also expected, TCG's -cpu max is "A57 with lots of extras".

The way we create a TCG -cpu max is a bit odd, as the code was
originally written in a situation where A57 was the most advanced
TCG CPU we had and there were no extra architectural features
supported by our CPU emulation. Today we have an A72 model as
well and a lot of extra architectural features, so the "code
borrowed" to "extras added" ratio looks a bit unbalanced.
Cleaning it up would not be a bad idea.

thanks
-- PMM
