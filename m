Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1058837ejg;
        Fri, 19 Jan 2024 08:42:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwz32wxHjhQU1RVjtmxw1vQE2qVz1NH/amkP/FOvYsKX5LD5OcXaxZq0nEmQbjrHbwv49x
X-Received: by 2002:ad4:5f46:0:b0:681:77da:bdff with SMTP id p6-20020ad45f46000000b0068177dabdffmr150695qvg.69.1705682545727;
        Fri, 19 Jan 2024 08:42:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705682545; cv=none;
        d=google.com; s=arc-20160816;
        b=O7ZIPRV50R+hpxh8Snr3c7oswMcDOlJgHmON6AJ70gMVWYR+TsmQ3djaPUsLhor7Xl
         28unNQIIQgq+LdCMM+9p7ElbvOzaFFhD9scpDSYS+aPdrmvqEgy90Yv7rcr37mEBSh6B
         j7YR4GgIRp5C5ffh1Jl6iuK/TzC0dlmMSGaOE1jcmUsT7aN3033Xtq7fa5kXXCO3afiU
         8PmImNE4FOvDlUCFDVH1QLd1GUoC/X1/nNsI5jYnNywZzMvlYQE82guLhsIWzdM+FeSE
         RGZvObBAdgu9Wsx8PYsG+/yyltHQEBHQHpoon0hF6N0M6AJBi/V13aXYW8KrBM5LnhZl
         wLbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Rd/sNQHqIi3M1PSH7+a0qNGw3PD0Eadt0z8LVLPgO5U=;
        fh=0XSsCWOpP9770g/PbMPS1sx8DjLXcZArTiijHoikVyo=;
        b=OPwHhMSx0X5e27XkX0+QK85W1ZhO2+8tFKSauE3cAobtlVn9Qva6SKDu/RLj+WpsEN
         TnpuNrFGV33yTeZ/IcuFtW3SqwrhdBYYeE4QrtIZ1P+v/qKXDGrr0fgkp+qmZv5AFLfF
         FA3uk49UnjHcQeLKTASKvddQmBiFYER2WMBMcOV4UrSKKKAxM8L8Vzk2HdiagKUhUPKA
         UoRSHhoEW8+FO6H1flY8dUqX7ayL2+SKnQlMjdqJdSUM5qaBwK1z3ItgOPjv9jIN+FdZ
         19mvM3/CpRAUooWXSpHPK/7lffKp8ue7ecug4rLlNengxcAy+Aymu9krCveMx9SGqgUQ
         VbeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kcJJZuAX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8-20020a0ccd08000000b0067f9c41923asi4851320qvm.36.2024.01.19.08.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 08:42:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kcJJZuAX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQrwP-0007h9-4m; Fri, 19 Jan 2024 11:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rQrwF-0007Yi-M5
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 11:41:53 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rQrwB-00026h-9Y
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 11:41:50 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55a349cf29cso1198631a12.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 08:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705682496; x=1706287296; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rd/sNQHqIi3M1PSH7+a0qNGw3PD0Eadt0z8LVLPgO5U=;
 b=kcJJZuAXyg5HMm3oPjDyO5esS9JeOcUlnVJcQlq13ajouzP7U7lVKIPbFdr/1Q5rd3
 0id3QFggShbmxFGuOMQo+IjDWymgGjzlbX0rMAjGDlCzXMLQvwYZ+gnl3JGj+ISo4yc3
 99Zxy/uSOjlY+EU7c9AyFrdXeH4gXIgPOl4+XqDwaR0aTk55ZqqrjfWjbsTq2b7vKC8e
 dHf4c0/+tcsYj8LHvIUEkrQATm3krqtH2ATySIvS9pHqCHKL8YPqTiyrssjN3uE+i/kH
 w3JgJ041epaKA/P8qAbKtqSa8vhh9gCEDtrXoGS3XnEFdu/eqh2KEFazbQ+NdffWJMwv
 b1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705682496; x=1706287296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rd/sNQHqIi3M1PSH7+a0qNGw3PD0Eadt0z8LVLPgO5U=;
 b=EQ6XnWtwRsr5xvfS5wwGTL3ROjgAlCQJMqHsLinzJP9leVBENgHOt5pE1XVahb9ATU
 BLTWIKQkTOMGosPpEgpajFAuB7BZqA++fBX9Jkuw8gwWGOh2mQGJBhY81OhbHUr7KMeo
 tGFeo7FrAmn8bZ6rMcArQUvIOVakeczCfHVtuiC6db3HTkczdIrWLHUD+cJNulJbeqVy
 CJ1V6oN/0YSnIfyspLYIJpnzk1copgGibj0zNVVd7O5XD126RDSggYBKpYky4oSyq707
 oQNJ9cDEocaV2QN8dTLoJTU8TuBZ4zy4PxgyuL5Jw5+kdsFhzC3kF3DXXZF5w8HaGZtM
 jniw==
X-Gm-Message-State: AOJu0YzsSBFQRKoplFgH3/8Y0xZYAzPheabQWqjemC0o0wxpFwpt0V4t
 6uIgEuBoYx/NaUisWqOyc5Sdp1R42199g6dbXOJA8P1roUAR7l4TwttIKGvd307A6V8UbitZs3d
 nBHaQjnzVi0V4kL3I/jpXNWB+kaf/soBEi1/TtNHjLcw4y+A0
X-Received: by 2002:a05:6402:b52:b0:559:f34f:8404 with SMTP id
 bx18-20020a0564020b5200b00559f34f8404mr28825edb.23.1705682496745; Fri, 19 Jan
 2024 08:41:36 -0800 (PST)
MIME-Version: 1.0
References: <20240119113507.31951-1-philmd@linaro.org>
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jan 2024 16:41:25 +0000
Message-ID: <CAFEAcA8JxJv7W1428eTaoereL6beSX0ET=zCih8CJ-Ni9QBrGA@mail.gmail.com>
Subject: Re: [PULL 00/36] HW core patches for 2024-01-19
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 qemu-block@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: qvAE8aZZ01om

On Fri, 19 Jan 2024 at 11:37, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The following changes since commit 88cf5fec91e50cd34bc002b633b4116228db0b=
c8:
>
>   Merge tag 'pull-target-arm-20240118' of https://git.linaro.org/people/p=
maydell/qemu-arm into staging (2024-01-18 12:48:17 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/hw-cpus-20240119
>
> for you to fetch changes up to 7ec5d7d91215815e885d2b38e62256e8fd8e2bce:
>
>   configure: Add linux header compile support for LoongArch (2024-01-19 1=
2:28:59 +0100)
>
> ----------------------------------------------------------------
> HW core patch queue
>
> . Deprecate unmaintained SH-4 models (Samuel)
> . HPET: Convert DPRINTF calls to trace events (Daniel)
> . Implement buffered block writes in Intel PFlash (Gerd)
> . Ignore ELF loadable segments with zero size (Bin)
> . ESP/NCR53C9x: PCI DMA fixes (Mark)
> . PIIX: Simplify Xen PCI IRQ routing (Bernhard)
> . Restrict CPU 'start-powered-off' property to sysemu (Phil)
>
> . target/alpha: Only build sys_helper.c on system emulation (Phil)
> . target/xtensa: Use generic instruction breakpoint API & add test (Max)
> . Restrict icount to system emulation (Phil)
> . Do not set CPUState TCG-specific flags in non-TCG accels (Phil)
> . Cleanup TCG tb_invalidate API (Phil)
> . Correct LoongArch/KVM include path (Bibo)
> . Do not ignore throttle errors in crypto backends (Phil)
>
> . MAINTAINERS updates (Raphael, Zhao)
>
> Note the following checkpatch error is deliberately ignored:
>
>   ERROR: space prohibited after that '&&' (ctx:ExW)
>   #143: FILE: accel/tcg/watchpoint.c:119:
>   +                && cc->tcg_ops->debug_check_watchpoint
>                    ^
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM
