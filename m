Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp435326njb;
        Thu, 8 May 2025 06:51:11 -0700 (PDT)
X-Received: by 2002:a05:690c:9c07:b0:708:bc6e:b4e4 with SMTP id 00721157ae682-70a2ccb3255mr46360637b3.0.1746712271471;
        Thu, 08 May 2025 06:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746712271; cv=none;
        d=google.com; s=arc-20240605;
        b=TRzeM6koAmVJcVBQPbQ4Q/va370BAV6fdQYSohxmiRalhX5ihx9v7EQGwqohbMuPnV
         TP9fGhdgGqoJLjSEtCFZ42j6vMUwiBOPYprEkiv8pgHOjRYKD46GpCr9UmkjEv/JqfqU
         4/llb+ehdURaNoUJUQjojUzVRmGsjea5zUEN+7zqk8KIuB5WXPwfXZK5xizArdk0BIni
         IFWB+0LFFehaMxW78+5LKMkYbAwzx+hI6IJZ2mRzgZnnHK8ktgfDs7UarLOLFT3LTaqE
         UaRQQwRsaAK+ficWBC8XqNnFEZ5F7PgtJhuWj7n0ddJN0bp5Ahya5nVDdy5m+Fy62uLf
         CuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lr2FKoznQd1dzrXOA3k8dGjH+BUO8/I3at7g4/YAiok=;
        fh=qFyuN+9aQ9YqLK0SiskoA6AJyTxb1+Ky9x7CdeetCiw=;
        b=MAEQ3ZHuqygF6U7hz02Z/GYUEIMkR2f82u3VSmpyoGM+gEiGQGIKU6yT36fmOvefME
         x3mCGR0lhvOnvxfMG15roA6aeyhZCRrJKBiBANIfbityOZDROBtwlh1KUwF6P1LKyD33
         fUz7GlCNivdcH8/BFVc0JgoBKQK17K9BIvoQGCqUupMa2VPCIaAsEqZBfgekJML2++ND
         LAVSknuqB/stNA4NtyR1HMiq3AynV1fPdc5gQXmpPM5J/SMsgzBsntNhkDfNNiokP2Dg
         +gSDPsu4hKv0BbzCoAU47pa+Y53CNiOBR8YfrTgqzSxcN+zguwUr3H9umny2Pgd32xOP
         JTDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LrqtT+GK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-70a3d8909e5sor96937b3.15.2025.05.08.06.51.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 May 2025 06:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LrqtT+GK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746712270; x=1747317070; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lr2FKoznQd1dzrXOA3k8dGjH+BUO8/I3at7g4/YAiok=;
        b=LrqtT+GKKM7QxgNrENLUm5j9A0nf+CzFD5pMMiVJykdtPuvhz6ngGQV5Qkq5xyMq+G
         p385niNe5iMjP/QLNSFYKENBjPwMdR3gLT+WT0hOFmfE0qdB6kuUg4nDCjbh1rsOAwvv
         J5GwAJ77JNeYwQty3AJiFXnY9RDJUxCURWclF7IkledCPC/IW8SDoRaLA9hTvqw2UyXK
         gPrBmtwQJXofxy9kYTA3YPBKciJT/MMak3AstBVO86f8417SZnuaEt7SBl4vZUXV3dIz
         kvN+lhmA1OOpYr5U3S9tyTzkZXy0u71gOgfDzfyENb4spJnqoXKR73OKy7gecNdTGSfa
         Q/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712270; x=1747317070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lr2FKoznQd1dzrXOA3k8dGjH+BUO8/I3at7g4/YAiok=;
        b=ITVllqtw7oR6TdCXL9airoI4MRK73DHufKgscUPxNH6o6yhtqNvnEdx79r/96LjtCI
         3YyI/UWbSeKVYGFQOXGip0Li11z365jIqyPcyAPX+rO5gc8wVrDH3DlmkxknxOmok7aA
         pPYOYN2If6YGvLhtg7E3YUpl0gyPVHujnt8p70gM4ziy4S+U23Y5ybFNGBhnKJ+VKnLZ
         PL+VtZGmUS9SYJr/v0JAVJ/ZPJnueDr/+HSz5OF+WYyVkoGwx2vYlZQErxTu88w/vfq+
         SFha6sgYlR+BvsuoK/oeVkOd0R55PzvmOvgGOyDEUfnjXuAefXD2FoFxedmtOCE6sGf/
         Sztw==
X-Gm-Message-State: AOJu0YyVt07BZ2SMbSqTy4k495DjiiBIs/uJhHfB8IauhOeIjLoTM773
	87/YJyTDGY4ToLTa4Zhkk0uiDTFj1oE14QC0GgtZkZfF+zQvHTkBBaN3oVN7Q4/sv7KsgIGLqHa
	SHk1iPNx7EqvI/xsi0XwmJvkGxP+Ek6YnRAhfE+FsJPsiS+CoCtk=
X-Gm-Gg: ASbGncuutyKSS5yd9iWxRWkz6b4GEozNhOODXeMsi8U04Euih+srCwBvJsWtC7Dxl4n
	+V7aHV0My6b3GbP93qGa5YgWK84TmBqJ5I3rbELHAyGptOW4YoyqJPnxoOs2PBubL7djHWASudx
	7sazCIk3O8i19gW2D3u53Tdrs=
X-Google-Smtp-Source: AGHT+IEdlnDkIEQSZSpMBMXc5pv6kz/G3AH6tgDXwpDFS2x21qayM3rmbg6uuxVD5pILbmvilJQSlhIXrUlIKzrkplE=
X-Received: by 2002:a05:690c:3749:b0:708:bfc6:c7cd with SMTP id
 00721157ae682-70a2ce85c22mr53693097b3.6.1746712269882; Thu, 08 May 2025
 06:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250507165840.401623-1-alex.bennee@linaro.org>
 <CAFEAcA_0cf=XEbH9VQdTHqu1wekSmFDLdqnnzpcwnshCT-UUCg@mail.gmail.com>
 <87zffnmidy.fsf@draig.linaro.org> <CAFEAcA80-CWEQYwTQPziUxm5V1K93VZstLh2r9mTGkD5QueKoA@mail.gmail.com>
 <87o6w3mdex.fsf@draig.linaro.org>
In-Reply-To: <87o6w3mdex.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 May 2025 14:50:58 +0100
X-Gm-Features: ATxdqUFyTo5XkBldfiqYzeGRzhmXruF_k_USSFHUxSU1OMWV1ed0ohn-cyX4ss0
Message-ID: <CAFEAcA-hgkPM_PXsD_q_SjNDyLCX3hVA=rVpTg9AWCdihK8fSg@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: allow gdb to read ARM_CP_NORAW regs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Julian Armistead <julian.armistead@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: mI9XfH8gRPlC

On Thu, 8 May 2025 at 14:37, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 8 May 2025 at 12:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >>
> >> > On Wed, 7 May 2025 at 17:58, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> >> >>
> >> >> Before this we suppress all ARM_CP_NORAW registers being listed und=
er
> >> >> GDB. This includes useful registers like CurrentEL which gets tagge=
d
> >> >> as ARM_CP_NO_RAW because it is one of the ARM_CP_SPECIAL_MASK
> >> >> registers. These are registers TCG can directly compute because we
> >> >> have the information at compile time but until now with no readfn.
> >> >>
> >> >> Add a .readfn to return the CurrentEL and then loosen the restricti=
ons
> >> >> in arm_register_sysreg_for_feature to allow ARM_CP_NORAW registers =
to
> >> >> be read if there is a readfn available.
> >> >
> >> > The primary use case for NO_RAW is "system instructions" like
> >> > the TLB maintenance insns. These don't make sense to expose
> >> > to a debugger.
> >>
> >> I think we could re-think the logic:
> >>
> >>     /*
> >>      * By convention, for wildcarded registers only the first
> >>      * entry is used for migration; the others are marked as
> >>      * ALIAS so we don't try to transfer the register
> >>      * multiple times. Special registers (ie NOP/WFI) are
> >>      * never migratable and not even raw-accessible.
> >>      */
> >>     if (r2->type & ARM_CP_SPECIAL_MASK) {
> >>         r2->type |=3D ARM_CP_NO_RAW;
> >>     }
> >
> > Well, we definitely don't want WFI or the DC ZVA etc
> > "registers" to be exposed to GDB or for us to try to handle
> > them in KVM state sync or migration... ARM_CP_NOP is less
> > clear because we use it pretty widely for more than one
> > purpose. The main one is "system instruction that we don't
> > need to implement". (CP_NOP + a readable register is a
> > questionable combination since the guest will expect it to
> > update the general-purpose destreg, not leave it untouched,
> > but we do have some.)
> >
> >> > If we want the gdbstub access to system registers to be
> >> > more than our current "we provide the ones that are easy",
> >> > then I think I'd like to see a bit more up-front analysis of
> >> > what the gdbstub needs and whether we've got into a bit of
> >> > a mess with our ARM_CP_* flags that we could straighten out.
> >>
> >> Yeah - hence the RFC. CurrentEL is a super useful one to expose though
> >> when you are debugging complex hypervisor setups.
> >
> > One problem with this patch is the one that the reporter of
> > https://gitlab.com/qemu-project/qemu/-/issues/2760 noted
> > in the conversation there: it will allow the debugger to
> > read registers which have a side-effect on read, like
> > ICC_IAR1_EL1: we almost certainly do not want to allow
> > the debugger to acknowledge an interrupt by doing a sysreg
> > read.
>
> Doesn't raw_readfn offer these semantics?
>
>     /*
>      * Function for doing a "raw" read; used when we need to copy
>      * coprocessor state to the kernel for KVM or out for
>      * migration. This only needs to be provided if there is also a
>      * readfn and it has side effects (for instance clear-on-read bits).
>      */
>     CPReadFn *raw_readfn;
>
> So maybe:
>
>         /* We can only read ARM_CP_NO_RAW regs without side effects */
>         if ((ri->type & ARM_CP_NO_RAW) && !ri->raw_readfn) {
>             return;
>         }
>
> And I guess we can strengthen the gdb helper to NOP any writes to such
> registers.

This seems to be continuing down the path of "oh, if we just
tweak this condition here it seems to whack this particular
mole on the head". What I'm asking for is a more holistic
view of what we're trying to achieve and what the "right"
design for that ought to be, not for small patches that
add more ad-hoc adjustments to where we are currently.

thanks
-- PMM
