Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp158430lfk;
        Tue, 12 Apr 2022 04:03:54 -0700 (PDT)
X-Received: by 2002:a81:d04:0:b0:2ec:3ac0:b58 with SMTP id 4-20020a810d04000000b002ec3ac00b58mr5935545ywn.221.1649761434032;
        Tue, 12 Apr 2022 04:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649761434; cv=none;
        d=google.com; s=arc-20160816;
        b=jQ+IQ9omSzoAB4pODohtchECK3fLY2sOEMBhM6kR84iahmR+lBS96JX2LfFeyb72vX
         kBjEYzKx2DGD5xCgOAat+O2Ot/T4AVa1ID/1qtiKUAgX4OexeDxOCvuJ/plnbblAiklt
         /hT3CBXssgiuo+ux3YXJFL3bn/XvGt7hz2N69ycpqshuy+5oMHare2idiOBWE27Tb6Zl
         OxyfGQulS2R/0rGfjWQ+PCT+rIbdAjEv8fJKvN48envAA7cc50elCyiFJciKyO68MLfq
         x+mSGq4pgl7KnrrgmQaawYrVVKjzpuEpWIlkhAJ3SORzJmYXYfplT53yPTmOEuEjCY44
         oEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0jMuE/4VFcKYPKUDmrXJoO+ONBHsxr4s331j/VpHSEE=;
        b=NtADFui+zRnu/4gl4roF7Mj9Tmo+CP0HU/BJjl5l7iGBd5eIGyJnSuR8YBKpkIP7UK
         xW7hnrZ6kMruSScscru7OWPvvml1Uu9fFnMxEkHQhUMqNeuePkUwSsdwLGyG0MXywjwL
         +UU/Xi/1yiKxFF8ygyfS/2Wksgsd7T+LIgnY+TF2IA4QxcuR6eaLPJVgPspW/Fmf40yi
         EiDDMMqZZ1vEKXho3y+ISfCUPhLVWrM3Nf69ni71uf5xI9/BQy2dWQcfU25sf2CBzxfw
         mgcwYaAvOojvQdZl/oRcSMy8hF2kg/5yt+2Vl8S5FnIkKefBMviQvw6aB6no0nnIhcCz
         Q//g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vYmpQwh5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h21-20020a25d015000000b00641468dc1a4sor2725413ybg.3.2022.04.12.04.03.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Apr 2022 04:03:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vYmpQwh5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0jMuE/4VFcKYPKUDmrXJoO+ONBHsxr4s331j/VpHSEE=;
        b=vYmpQwh5ha2/pxigPI5ZdAahjiAjfTnE2ch1WizDVIsb8vkIO5AxK6ldiRfaPUUyN/
         //MaaaMZ83yxB0p2qK09aK+c9k9uB0oABAvPhIwnZ7ZfYaRsFki9CBNIl1J3ST6U7yOn
         +pO9QH6l3uDQnTWGtYwy4ixZMfYy1vnP4avLs6ClLM9udRTv0ct6FOjHJBT5EBl/Juam
         T+9Btr+ueKUykLlfwaIpdWbHUrs8EVSgQl4C0Xfw1mMI0pT8AbARcCImApSjfzQ3vLL0
         zY+Vu7ITn8vtowIBU6bXbtagoAEvm67c634cudpLvoeB2PCAw1dU0kB6aN388kKkkCo+
         +n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0jMuE/4VFcKYPKUDmrXJoO+ONBHsxr4s331j/VpHSEE=;
        b=3pPpM1hHR4TbDG+Yr//5AmaQtWPynrbDqA22MBRqneDTDrpZXvFeLsu4Qudqegcbdw
         TMK+1lq6h0+WChoJq19zLR7KzlrJIpt7Mny7eCLgfBHez+VFihh3Rgbq4f0GWvXrb+Oj
         nVPcDhepGj2tZLzMzyhDt7nUYEYnPnPIef+R/LcbkVFVugrTqkMVUMHM36A3VuiaapZX
         7IGNXwbU7EB8qOnmul/GyBxrvrBmtYGBxjSCXWTxoiqx+pfovMzYx9mpMDIeUf1Qv6Mo
         1us7C4PHfP7VY8Ns07DejsycZ05CZzH5q81ijXNgoLl57kK4gTrvgtq7KCm9eie3alnN
         XBOw==
X-Gm-Message-State: AOAM532amN6X0dkmMZxApzPi8Dp+9d5tsS8SE92dY6flIUNaHCFPTzf8
	BoxAN/F8Bh4yQ6QCFYB8CooqwevNEyfrcqFVHbB6ba7XeEpVWw==
X-Google-Smtp-Source: ABdhPJyO/cxbmN3vEBxiUXOXqN9/Z2nvjaQRvmOd66aT3u54aJjR/jN4S9a/Pes7HvjaC/hSplRInPB2NgqYhoZnUok=
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr25413007ybu.140.1649761433612; Tue, 12
 Apr 2022 04:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220412104519.201655-1-alex.bennee@linaro.org>
In-Reply-To: <20220412104519.201655-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Apr 2022 12:03:42 +0100
Message-ID: <CAFEAcA_j78LD=K=BY+szHK+X0kyh3RXm7ZT4gM2GDmcKTLYeCA@mail.gmail.com>
Subject: Re: [RFC PATCH] gdb/gic: expose cpu_index via MxTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: SGwKHoa1vhc/

On Tue, 12 Apr 2022 at 11:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> When accessing HW via the gdbstub we can't easily figure out what the
> cpu_index is. The canonical case is current_cpu but for some cases
> that will be NULL. For debug accesses we can overload requester_id and
> make the GIC a bit smarter about fishing that out.
>
> [AJB: very much a PoC hack for now but interested if this makes sense.
> We could encode cpu_index in another field but that would grow
> MxTxAttrs even more.]
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
> ---
>  include/exec/memattrs.h |  2 +-
>  hw/core/cpu-sysemu.c    | 15 +++++++++++----
>  hw/intc/arm_gic.c       | 33 +++++++++++++++++++--------------
>  3 files changed, 31 insertions(+), 19 deletions(-)
>
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 9fb98bc1ef..1333a34cb3 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -43,7 +43,7 @@ typedef struct MemTxAttrs {
>       * (see MEMTX_ACCESS_ERROR).
>       */
>      unsigned int memory:1;
> -    /* Requester ID (for MSI for example) */
> +    /* Requester ID (for MSI for example) or cpu_index for debug */
>      unsigned int requester_id:16;

If we want to provide a requester ID for memory transactions we
should provide it always, not just for debug. That way gic_get_current_cpu(=
)
and similar code can unconditionally use requester_id and never needs
to look at current_cpu. (We would also need to figure out how we want
to parcel out requester_ids in the system, so that PCI requester IDs
don't clash with CPU requester IDs.)

-- PMM
