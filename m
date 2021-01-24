Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp2495743lfb;
        Sun, 24 Jan 2021 08:08:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSS6zS+qa51Dw2Azn87ogAgcPjBSy2Y2CVq3ekcANCPtf/iL7YR+C5+MMLRUCGd8R9KPN7
X-Received: by 2002:a25:8450:: with SMTP id r16mr7861854ybm.37.1611504498961;
        Sun, 24 Jan 2021 08:08:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611504498; cv=none;
        d=google.com; s=arc-20160816;
        b=vAEp1Fs2mXNJyvhjLW7rSYQ0/E55clD9+o6agOZpsFJWfFX34pN19kAXWUff6DG4eg
         i4uJnOR4mPQzgLn9+aTA9A6v02UpkjkbkvG1sXDsYoYvURzFno2/v0t7RKhDvSHX1Her
         8zA2diEQkbagSIMJny5MkMGjje2BlKKEgcFm3IuVgC2v6gjwUAbKXfcGxk9w8iTMhs0t
         RPZp8PBw9ylOxen6798lfHNEQEsZ+t0WNmuz7H1T6cfJV19lZ0rTq4XyKZQoVDDrbVkP
         LbU52k6VgHTEFTRhGoFUNCwZSM7jm8zY01pTYTBGLv1M+KzRzhPLTYv4mt4fUCIbJ5+G
         Kepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tNu9hFqN2gGcAA7+goDvjENW5QyDLv05V0Gd8G9L/UM=;
        b=KR84TPNgp0qvt3jUwkYLGuSc6eCNPFuRtKP0orbe+pSfWzQSbNrpGS1gnj2mEUbfqO
         rcbTURa/L2j58lRa36TCIzhLo/kSSf6HV/OxyEqYGpyJTLYOsR1uyKNglD+b/89wPdTL
         +l1wLijS5K9+DRx4H7JRiHW2UyxmISlqXvRvBicElIG2yJZHRUX0HQDUD94iJ2vgWeSg
         rqKgaKGVwvFEamRrL9i4AlR5CsIdLgfeJ6lPNorIbh61UHtUCFMR02tyXajgyMhItt1a
         da26P+Vqr5PZjfhR254aGR+TFBXHfwJnM8JCRZEJD8aiLeao55A73xCAbrzX/HkPIGP5
         4zZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B3rVvUP2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si14410129ybj.393.2021.01.24.08.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Jan 2021 08:08:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B3rVvUP2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l3hw2-00008k-AB
	for alex.bennee@linaro.org; Sun, 24 Jan 2021 11:08:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3hvl-000089-Fe
 for qemu-arm@nongnu.org; Sun, 24 Jan 2021 11:08:04 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3hvg-0002ZI-8z
 for qemu-arm@nongnu.org; Sun, 24 Jan 2021 11:08:01 -0500
Received: by mail-ej1-x629.google.com with SMTP id ke15so14458166ejc.12
 for <qemu-arm@nongnu.org>; Sun, 24 Jan 2021 08:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tNu9hFqN2gGcAA7+goDvjENW5QyDLv05V0Gd8G9L/UM=;
 b=B3rVvUP2/A5lAd3QaAYa1WO3w0rPFHSXE3KxyRrLcpDzi65WWb0QyGgjVWlWsC5w/F
 4z76r1MI8HgCSuErqKm4ogJG7gybB/nFa6Jg5PWBJBOEcFp1j3pmJ4NeBs5QvdC2u8EE
 wJeeQ8JwV36gJ1kXCjmNj8tNPek7rNPBkIRKhapaKecNfr02u42y2+U85GV1ByHhQJSl
 YpwihLd96nUoIuIwbZtkhEUFCA0+4+H//eIT1aHcs690QdoDyblvQ8OvHnGn7A+Yq8aD
 zCWJPX6zJmJ2+BouKSWlltJWGM+lLX0j8UpMPyxQd4ZynZrMwk/d2dV+WhLcWDN3RbO/
 V0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tNu9hFqN2gGcAA7+goDvjENW5QyDLv05V0Gd8G9L/UM=;
 b=WwBxkoJKPgMqnRClvCP8gGVS/u46q0uUdtedoWX1zwWiBI9h6EubJ3NKAHz7WVOjLj
 P7/++1X/DaKZIiu8S4Z+sh8u11VeVgTY6ydZk1rFT9i1jGb2hyR+eIiBpad+2qtevNCQ
 5qVzHqKM+A1t4+AAYp+bQMDuMbA8u5U4+KPz5PXEXHR3nMgN0p7RRO4bjv6ppBrXauF+
 zotCNwr178BR3cA4/+8UsXGnc9fXFZdCWHnhsqGGwwbzF7AqhuK5XOCqa9xpilgkixVM
 7tLSpTnNTvsvzNQkjwxHiGcTjSVzP1+cVSootx8goIlWEi1V+K35GJQBvKz20HvqLI2M
 mfLA==
X-Gm-Message-State: AOAM530B5z7ubTfMGBfAAS0RqDLq01330rHF0BEV5s4blb+3by2PzLO+
 FX/9nadTo/EzlGLLfRPJhmwbJJlqq4T2WKsr1b1ipA==
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr121208ejt.56.1611504474126; 
 Sun, 24 Jan 2021 08:07:54 -0800 (PST)
MIME-Version: 1.0
References: <994f40e1-2a5b-4b7a-a4aa-23f824881d8a@www.fastmail.com>
In-Reply-To: <994f40e1-2a5b-4b7a-a4aa-23f824881d8a@www.fastmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 24 Jan 2021 16:07:42 +0000
Message-ID: <CAFEAcA-pm+k4ukfVQ_zg-Bi5SAj4e2P9LEVHpbCkSK6wR=T-Mw@mail.gmail.com>
Subject: Re: KVM guests reading/writing guest memory directly and accurately
To: Berto Furth <bertofurth@sent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 05fb9skCMlmJ

On Sun, 24 Jan 2021 at 07:22, Berto Furth <bertofurth@sent.com> wrote:
> Can anyone give me some advice on how a machine or device can read and wr=
ite kvm guest ram memory and get a guaranteed up to date result? Can someon=
e point me at an example in the latest QEMU source code? I'm working with a=
n ARM-32 guest (-cpu host,aarch64=3Doff) running on an ARM-64 host (Cortex =
A72 - Raspberry Pi4b).
>
> I have a problem where if I write directly to my guest RAM, (such as a DM=
A transfer) then the guest can't see the change straight away. Similarly wh=
en the host writes memory, the guest doesn't see the change until much late=
r.
>
> If during a KVM_EXIT_MMIO the qemu host changes some values in guest ram =
memory (via address_space_write() or cpu_physical_memory_rw() etc...) , is =
there a way to make the guest be able to accurately read that memory as soo=
n as the exit is complete. Additionally if a guest changes a value in ram j=
ust before a KVM_EXIT_MMIO, is there a way to ensure that the QEMU host can=
 then read the up to date newly set values?

With KVM I think this is just normal "multiple threads/CPUs both
accessing one in-memory data structure" effects, so you need a
memory barrier to ensure that what one thread has written is
visible to the other. I think that the idea is that
the functions in include/sysemu/dma.h provide a dma_barrier() (which is
just a CPU memory barrier) and some wrapper functions which put in the
barrier on the right side of a read or write operation. On the guest
side it should already be using the right barrier insns in order
to ensure that real hardware DMA sees the right view of RAM...

We're very inconsistent about using these -- I've never liked the way
we have separate 'dma' operations here rather than having the normal
functions Just Work. But I haven't ever looked very deeply into what
the requirements in this area are.

> I understand that the proper thing to do is to set up the memory region i=
n question as MMIO so that when the guest accesses this memory a KVM_EXIT_M=
MIO will occur but the memory region in question has to be executable and M=
MIO memory areas are not executable in QEMU. In addition it's not easily po=
ssible to predict before hand exactly what memory addresses are going to be=
 involved in DMA, so I'd prefer to avoid having to dynamically construct li=
ttle MMIO memory islands inside the main guest ram space as the guest runs.

You only want to mark regions as MMIO if they need to actually come
out to QEMU for the guest memory access to be handled -- typically
this is device MMIO-mapped register banks. Normal RAM isn't mapped
as MMIO.

> I'm assuming that the guest could be modified to disable d-caching (modif=
y the ARM register SCTLR / p15 ?) and that may help but I'm desperately try=
ing to avoid that if possible because I'm working with a proprietary "blob"=
 on the guest that I don't have all the source code for.

With Arm KVM doing this wouldn't help; in fact it would make things
worse, because then the view of guest RAM that the guest sees has
the non-cacheable attribute, but the view of guest RAM that QEMU
has mapped is still cacheable, so the two get hopelessly mismatched
ideas of what the RAM contents are.

(Side note: if the guest wants to map RAM as non-cacheable, this
won't work with Arm KVM (unless the host CPU supports FEAT_S2FWB,
which is an Armv8.4 feature), for the same "QEMU and guest view
of the same block of RAM disagree about whether it's cached" reason.
The most commonly encountered case of this is that you can't use a
normal VGA PCI graphics device model with KVM, because the guest maps
the graphics RAM on the device non-cacheable.)

> I know it's not very professional of me to make an emotional plea, but I'=
ve been working on this for weeks and I am desperately hoping someone can p=
oint to a solution for me. I am not a KVM expert and so I'm hoping I'm just=
 missing something simple and obvious that one of you can quickly point out=
 for me.

Nah, this isn't obvious stuff -- a lot of QEMU's internals aren't
very well documented and often are inconsistent about whether they
do things correctly or not...

thanks
-- PMM
