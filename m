Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2762362ejq;
        Tue, 9 May 2023 07:29:33 -0700 (PDT)
X-Received: by 2002:aa7:c68c:0:b0:50b:d495:106c with SMTP id n12-20020aa7c68c000000b0050bd495106cmr11593836edq.8.1683642573733;
        Tue, 09 May 2023 07:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683642573; cv=none;
        d=google.com; s=arc-20160816;
        b=J52UfTzrIZ+WbK9XT/wu4ed6KhvnSXjWCyf3ZyPzq5XqO8+ntRQTu/iqvXSyQIoEsk
         zR+1KlRbW/uAOYKdYKf0W6NC7kiXSbUTJXYqlLwRSRYmpkbD8AUaCm66VmICVW6HgQoT
         JJiaiuLAMpds5JS2JoBJsUC/qk0JAY4otw4kqlJ0mGT/XHYt3jfwZLQDz8bYOyhOuqB7
         6iAhKn69ajMxK2UvXfdGzF9Ab3CpycAPKiM2PpNr3orqjzVs5xH+gPCsnYiOOKWy7riH
         Vr7EiiW9AA9EQ7wbN3E8lyzLKwWzM5+5iW66NV/FxNwDsP9eVuAcbnquo8BFQAT7hk+u
         Gvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ow33TceIB4jgP6+8+OoXouGJl3NIHZGJQepJGuh0FxQ=;
        b=u17QFXAJxM95sRWZ7SJRN/8elnNwUAjRcShj8ro46JrZcauCtsBHDeIj5Lw8l57kkY
         u/zi5qUAwFohiV+VQoZW6SBnXbLli8v8phtwuqNCuLhv7b6qfRPncK3u5Xr5sSsz8bPG
         aY69LiuDoR38MohLSFHTs1g/ysv62IYHoiTVoEdCJ6QAfv1UJVYiSGq+gIDIxYX3ofs8
         i/nGez1YJyA5AKT+ra1ueotaYKS/o8en9Z98mnjVUlrN3x6AVXAzpn2fy41wfPpZM/+W
         DfWeWl2052E06Bph/R3vrukhRvbwGw+otplyPuX+pG2N1lMaEqB12lXABr53fhE4fgYl
         Xk5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o74zftUZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y61-20020a50bb43000000b0050bd4a253b5sor892895ede.2.2023.05.09.07.29.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 May 2023 07:29:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o74zftUZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683642573; x=1686234573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ow33TceIB4jgP6+8+OoXouGJl3NIHZGJQepJGuh0FxQ=;
        b=o74zftUZHnEJD4TcBFZMjBTUCjpb8XfKtTmL+XHI59ehzvH+zVKC9Q/GMQalq96SKo
         OX6R/tqDfEbpULITPhfKDbju5966aNtRgw30IFDcvEJsbndBtv2oYzPL1YewlZ5KfnZg
         P2mnc90E98zHPSxbU6vqP1/iFxNBJvGJJ12m35yR/N17qV8UBdgqkZUPHWRcBa8yKAZv
         5NH70VFj521PL6x//HQB3TqPnsE0d3pT4MI4rUrh6jDuma/bfYCeuxmLLQVzwHHDV0dk
         xL4MnGrUQ/4ezh746KIAHzf4Wn9Vtaafi4SgRRM6VGnoPY6/j9gIvjI2eMnQ4xf2ah/h
         zIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683642573; x=1686234573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ow33TceIB4jgP6+8+OoXouGJl3NIHZGJQepJGuh0FxQ=;
        b=Z/G7L7ZR7FbLiKe/xujLn24a3YFlVEpbr+RD5r2D3Pv8ts0wTpDY81tfNQGtHGsn5w
         HR/0HVVI7Cn5OTBRFnnvhpWDuInQHDpSy4ff8yHqokohqyUgFlnWNLtn4vUOKVxDxRL/
         VGmmp53dMUNvFmHlG4o6paeaHojGhMxO7zOZi/slgIYzV/ypofQ7pwYASxvq7+vHbje8
         uHdyqGN6u9B0vz3wV2mTZ5WPtkopebII70acB1b9IZ0anLsCH8nS+RIZkwNJumANP8NT
         zpZwDVUAaQhEu7MBvXrf6InmLUSwBr7r7BYUIYBKvg6vyta65atmc67paTRiQF9rlYMw
         QzCA==
X-Gm-Message-State: AC+VfDyNBs2wFKZB5aci7+yG8onAedYfBRqdC1mB0e/tHMcW4CZBUvwL
	6pvlTf/u6vGVWobWNekol07b7vvEk/tB1Igxpv2pdY5f
X-Google-Smtp-Source: ACHHUZ5P0KBnnmb4GdjsZClIEaWah9OS9HMfGBmSkFY2G5Gi2yoVKTZl1OKSaT9FXAcBz2eR1g+Lcx9GaLeRlDlX3as=
X-Received: by 2002:a50:ee97:0:b0:504:b177:3ef3 with SMTP id
 f23-20020a50ee97000000b00504b1773ef3mr9742606edr.3.1683642573383; Tue, 09 May
 2023 07:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230403191600.43487-1-fcagnin@quarkslab.com> <20230403191600.43487-3-fcagnin@quarkslab.com>
 <4bcb801d-7a16-765d-730a-ba2bc882fbeb@linaro.org> <CAF8_6K=dO7xUM76ZzuBz=kQvnqh3gV=5NNrNz9BCMfQn+DncCw@mail.gmail.com>
In-Reply-To: <CAF8_6K=dO7xUM76ZzuBz=kQvnqh3gV=5NNrNz9BCMfQn+DncCw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 15:29:22 +0100
Message-ID: <CAFEAcA8RifuJamf04p+AXN457-bd-s6eyxOWjCzbssfuEcyfvg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hvf: implement guest debugging on Apple Silicon hosts
To: Francesco Cagnin <francesco.cagnin@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, qemu-arm@nongnu.org, 
	agraf@csgraf.de, pbonzini@redhat.com, alex.bennee@linaro.org, 
	Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: HT/60x+KRL54

On Sun, 30 Apr 2023 at 20:45, Francesco Cagnin
<francesco.cagnin@gmail.com> wrote:
>
> > Other than that, the structure of the patch looks OK, but
> > I think you need to identify the cause of the problems
> > with SMP setups that you mention in the cover letter,
> > since they suggest that there's a bug lurking in here
> > somewhere.
>
> In the current patch, in `hvf_arch_update_guest_debug()` I'm enabling
> exiting the guest on debug exceptions only for the vCPUs that have insert=
ed
> software/hardware breakpoint or are singlestepping. In SMP setups this lo=
gic
> looks flawed, since for example if vCPU #1 sets a software breakpoint and
> vCPU #2 hits it, the generated debug exception for vCPU #2 will not exit =
the
> guest and lead to panic for unexpected BRK. A possible fix is enabling
> exiting the guest on debug exceptions for all vCPUs (and not just the one=
s
> that have inserted breakpoints)=E2=80=94is this the way to go?

Yes, I think that makes sense. We treat breakpoints as
VM-wide (and writing a brk instruction into guest memory is
by definition VM-wide), so we should put all the vCPUs into
"we're debugging the VM mode", not just one.

> There's also a second analogous issue for which it feels like I'm missing
> something. If through GDB a software breakpoint is inserted from vCPU #1 =
and
> later vCPU #2 hits it, then when trying to resume execution after the hit
> GDB fails with 'Cannot remove breakpoints', due to
> `hvf_find_sw_breakpoint()` returning error because it (correctly) doesn't
> find any software breakpoint for vCPU #2 (queue
> `cpu->hvf->hvf_sw_breakpoints`). A possible fix seems to be modifying
> `hvf_find_sw_breakpoint()` so that it searches for the breakpoint on all
> vCPUs' queues; but I've skimmed through the analogous routines for TCG an=
d
> KVM and there's nothing resembling this fix, so I wonder why TCG and KVM
> don't fail on my example GDB scenario?

For KVM the sw breakpoint list is in cpu->kvm_state, and
we share a single kvm_state across every vCPU in the VM
(kvm_init_vcpu() initializes cpu->kvm_state to be a pointer
to the singleton global kvm_state).
Isn't cpu->hvf shared between vCPUs in the same way?

For TCG breakpoints are effectively always hw breakpoints,
regardless of whether gdb asks for a sw bp or a hw bp;
the code path is different from how KVM and HVF do things.

thanks
-- PMM
