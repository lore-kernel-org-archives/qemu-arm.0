Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2919108ejb;
        Tue, 1 Aug 2023 07:45:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFwTqhYnuWvZUp/o2uGWcrzyjCz4GjvNfPmP4y4Yb3qUeIzg1tWoE7JqMxgyDrhqYZB7E/+
X-Received: by 2002:a05:6214:3a01:b0:634:87c8:6a3f with SMTP id nw1-20020a0562143a0100b0063487c86a3fmr12510559qvb.46.1690901115331;
        Tue, 01 Aug 2023 07:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690901115; cv=none;
        d=google.com; s=arc-20160816;
        b=k34+yaTQuS5QKZ7nxBPKW+Hw/59QZWoKQCU31MnrBwPJD8FMyIWXw0PA6pzdWtz0Ld
         qlusX9mUbSYYmnCxqe1hmdKvUHqVfgxk+lvBNZrIOGeo+MIVkcSM/OMU8L/xnTFrGYuB
         +YYnpX7sB14/8j8QwYotZApM9Rq7W/fRuC99v1fnqXJ74AYXdppD48wfy0mNY6lSRshA
         kT5fFGPnh5DLAl8KDVwNsDhKhIxGqHhll3zRanWhOyGD7aQcwjAbDNVxuESFJSN86kzd
         YJ8IzHaHvZeLb2RYMVw99uLx1ZANwjw6mB/EoHeXx2PFUDPEZvz1apZ+wB21BiTpO9SJ
         k9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fI/utFtZvmCMqFWeUiqwvkWlQhA9XgSuWD+cHUDyR1E=;
        fh=jI2hgQY1g0wvMyxw33p9cbh4a/lNgpBuc7/Fp8cj8eI=;
        b=g0Cw5QizsFy66XMZl/ktwEwkFsHeqaU6WBGRpQhB8FpGgPhsaTVKFM+Wslv9lA2LCz
         MAUekXsu0ADQdX/JBaOxGsejK18gXryg1c65Z+fyJYRXlIfworFp69nQOoveE763bAXu
         fN5wuiGNvQUzlO1UcNhKVB4zEc5WImW/ZZCh0eDXIIn27riaLouq2QEWymF+54vi+xvq
         AtRsTiDxDUDHpfMyRCgZ/6ZkaKeTygZgo8DbUUIb6EDFrBn0r+j5UbR8do63vGAFYtDE
         ul037CKDiQ8B5M8ArkM7m5LN+j2+s+01Ns6UfgdEaUdCh5cloiI0JPzJyETR/nGxGxz8
         jubQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I7N4w0N0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i128-20020a378686000000b0076677b0cb56si7093546qkd.111.2023.08.01.07.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Aug 2023 07:45:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I7N4w0N0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQqcV-0007BQ-J2; Tue, 01 Aug 2023 10:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qQqcT-0007Ay-HI
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 10:45:05 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qQqcQ-0006D8-Vf
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 10:45:05 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5221c6a2d3dso8221919a12.3
 for <qemu-arm@nongnu.org>; Tue, 01 Aug 2023 07:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690901101; x=1691505901;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fI/utFtZvmCMqFWeUiqwvkWlQhA9XgSuWD+cHUDyR1E=;
 b=I7N4w0N0a7B3OID2dRxjJwr0XxB+sHgmLBqTnlogcEFSwskv+9Mlld2r7UYgD7Tj6c
 0gtpAUPtCXOADF5rxtXgp1LEkON48nHzuCZgjSee6OFZbvy3i8YT178QcsYsw/RvI3IH
 YVuE4gbwLcvDBqXv7Ml4BrJ5EZtRGwMoVPs39Q/SkuckoTk78QDt+c08OS41lgs4yx41
 5rmyz0MkbTSXiWxPwOyPXHuOHwRRy2RWqP9i/wCeph6JycXhlAl4qJ8dSjhlqN8gbQTY
 t69yhwWPZRIpWvuTvM48Y7SrF884oHkIQtWh0bAGDOTuH/rfuTP6SCruIOA1KtGHB/CX
 B8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690901101; x=1691505901;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fI/utFtZvmCMqFWeUiqwvkWlQhA9XgSuWD+cHUDyR1E=;
 b=CK+3S3xIys2LIOWSEMaN3a6lULlZ6qqdhYoNph4vBlTQ+OCHbdlSyI4AdJM3T/V0JG
 XvkzT2l7ciI2DpQpYJMHL5qT0iPZdEJr32s2wM7/53O+cdaOF5KNpvu5AzDmuUX+5k3K
 KF/0agFTAPixVy80eF9b3EVmBhfjKa+tC+7+jMGKf6+vWCyqjAsX4NprQvZL7GLz/I96
 F7+0FB6cEzRkEV0cuWqJMKsnnqcjbzIVoBVO4tKZMSn91Xlkak7ntPhzIhq3aOnEys/Z
 BLir8IhPDyswkBKHiAUhIj6exbyV/Qy+Vgr3Qeyb4Nb8Sq52oyHyuVrMFlc+DLVaaoLY
 3neg==
X-Gm-Message-State: ABy/qLZCYreHVO0houLYKGRS1GRVefKfDdnRTmdyinzer42dDm/Y2+nq
 FUrgl00VtWlRq5LVgbWMhuHsyep2Lu7RNyJd5aZFsw==
X-Received: by 2002:a50:ec94:0:b0:522:37da:7920 with SMTP id
 e20-20020a50ec94000000b0052237da7920mr2697272edr.12.1690901101172; Tue, 01
 Aug 2023 07:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <ZMkPRJ3subSuW+Rg@p100>
 <CAFEAcA8cEp2_vc0i9QMNeb7KkxsJecXjuYhYUR6nkL6-LLyFqw@mail.gmail.com>
 <02f59869-fca4-4c8b-fc52-0073fb0ef8f9@gmx.de>
In-Reply-To: <02f59869-fca4-4c8b-fc52-0073fb0ef8f9@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Aug 2023 15:44:50 +0100
Message-ID: <CAFEAcA9Q2RSYMR_6e7rHMQxgaCbL638DOBPwHpQYh+kXrOwmbw@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Emulate /proc/cpuinfo on aarch64 and arm
To: Helge Deller <deller@gmx.de>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: JQSo2IIeff1k

On Tue, 1 Aug 2023 at 15:41, Helge Deller <deller@gmx.de> wrote:
>
> On 8/1/23 16:22, Peter Maydell wrote:
> > On Tue, 1 Aug 2023 at 14:57, Helge Deller <deller@gmx.de> wrote:
> >>
> >> Add emulation for /proc/cpuinfo for arm architecture.
> >> The output below mimics output as seen on debian porterboxes.
> >
> >
> >> +#if defined(TARGET_AARCH64) || defined(TARGET_ARM)
> >> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
> >> +{
> >> +    int i, num_cpus;
> >> +    const int is64 = TARGET_ABI_BITS == 64;
> >> +
> >> +    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> >> +    for (i = 0; i < num_cpus; i++) {
> >> +        dprintf(fd, "processor\t: %d\n", i);
> >> +        if (!is64) {
> >> +            dprintf(fd, "model name\t: ARMv7 Processor rev 2 (v7l)\n");
> >> +        }
> >> +        dprintf(fd, "BogoMIPS\t: %d.00\n", is64 ? 100 : 50);
> >> +        dprintf(fd, "Features\t: %s\n",
> >> +                is64 ? "fp asimd evtstrm cpuid"
> >> +                     : "half thumb fastmult vfp edsp thumbee vfpv3 " \
> >> +                       "tls idiva idivt vfpd32 lpae");
> >> +        dprintf(fd, "CPU implementer\t: 0x%d\n", is64 ? 50 : 56);
> >> +        dprintf(fd, "CPU architecture: %d\n",    is64 ? 8 : 7);
> >> +        dprintf(fd, "CPU variant\t: 0x%d\n",     is64 ? 0 : 2);
> >> +        dprintf(fd, "CPU part\t: 0x%d\n",        is64 ? 0 : 584);
> >> +        dprintf(fd, "CPU revision\t: %d\n\n",    is64 ? 1 : 2);
> >
> > If you want to do this you should hook it up to what the
> > CPU being emulated actually is and what features it has.
> > (Compare how we set the hwcaps.)
>
> Nice!
> I didn't know about those elf hwcaps...

In an ideal world guest code should only look at the
hwcaps (which are the ABI-stable interface the kernel
provides), not at what's in /proc/cpuinfo. But of
course if you're a shell script then cpuinfo is a lot
easier to deal with...

thanks
-- PMM
