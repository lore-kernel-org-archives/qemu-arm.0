Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1137363ejm;
        Sun, 30 Apr 2023 12:45:56 -0700 (PDT)
X-Received: by 2002:a81:4e84:0:b0:54f:badd:d148 with SMTP id c126-20020a814e84000000b0054fbaddd148mr11688406ywb.14.1682883955913;
        Sun, 30 Apr 2023 12:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682883955; cv=none;
        d=google.com; s=arc-20160816;
        b=USXjUZLHhs4HmNBygTBhpdu4+J0+kN+0oG2uOr5j+f5W57/12YGcV8aa340K6gGuc9
         BhdAU3y6xMevim0LV4ssGNBt8RS5+HLsNlCXNE9Omb24B0PiwIDS8Ks9/lmYkp5dtaHJ
         8xUcpTGW9PDlAmbr0//96gW5excRQI6Iv5DZlF00kf0/Adw+3H6JidUW48vm9/EaBhJy
         Uc22lDAsyVHlj6r7XebIPDEoS2XU6jQjf91+BxJTbX7/T4NIRDaVX5rQhL4HZjBisdTS
         0P5oGmICez6sBME+Na335Uyqrb0KQS56DGIzdjx5lFmnGiZxaa1jlDr0o39vFdWhbEfZ
         JHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m/QC2nesU865Z1d0BRSZoKO6n8mHFVbhR6AtyWnwewg=;
        b=EL5VTLtLyMTGg/Yki4vadSZ/XgReZhUtC+pAzmNvQYM728DMYCIvfeRHcD/7xkJtH8
         gKvovcXtzE8ARVkgD5Sn92kDXFubrXZpdPgtNRiJnpU1F2Im+5C2RHS36vD/7FyVHApS
         XVA5hvvwDFSYv5mrWs0c63khG1u2JeJfBOS0uRIwSpyY0JYpulb2wNsDPEhYT75U8oGq
         vKEYfK4Zkf03FpZ5DyeOKxsHtkrcocxVMwR1nv0Q+AG0MTY0KB8++VX5JdTdemCqFqTB
         PP3CPA0uWp4fww7pGLWiagKbX1xrpci22ll+xmiKjOfw5nygWy57jUzTMZeQ/9SKhu76
         aCGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=H5xmkSFz;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k1-20020a81de01000000b00555a8a81b11sor16303806ywj.149.2023.04.30.12.45.55
        (Google Transport Security);
        Sun, 30 Apr 2023 12:45:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=H5xmkSFz;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682883955; x=1685475955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/QC2nesU865Z1d0BRSZoKO6n8mHFVbhR6AtyWnwewg=;
        b=H5xmkSFzA4Phyd6TUbiK0b/1jFCyXvGVOlHQtnftOP0AdODp/sN6HPKmJ1insv/QcK
         mG9QJPL2reacAibATH6rMBZOnpb9q+DYbG7TlrjPcEPP3NEAqr8rce1gLFmFT6Evrpt+
         ylDpEIDyV9/qHFgBrFJu6QWtKNMOLttdh0CzKL8ydF7Gi9Bfa7Acv6LDrwK6LBxIXwiF
         PLQxJpRY5uOHDGemi/RimmXoXyukXHv1gyZUuN9RFqMnSDueJGtG0lmOG+JqpolaGUkb
         E7Fv8NP7q3JYJQIjBcl3o4crB2Wv9HZmWIHvjsOy6F9GaulATPOJv1gJpU8z/B1Y3zIM
         d9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682883955; x=1685475955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/QC2nesU865Z1d0BRSZoKO6n8mHFVbhR6AtyWnwewg=;
        b=deNxIOowPmiQ+D185ilInwOMjDB4yYYd/GKSJbVCx6YDrkjMOZXi52Mx4ox3LFjyJ4
         HH6JEREfRBYhFTE6XXPzbnP+A/6NK01n1f/2glehsfseCGVf8wqAL0cavjV+wASrFYMa
         vT3ANMZhOFnJAjgOZMy8yRxAqAcXyhzJSdHcZD69dJl7gpiacWyexqe8VtcYrMpB52ZA
         kmPqbzfqe8F3U0vuAqgYCv6W5T4bvMX9hSzWDjuFqJTmGTAphveRVUdq2IfhxGNTLKtS
         NlPrCiQ09HHIkk8Gnq6K40f9fj7+CepJfr+Tw6IO15FT9rAMuIOGgOrGIl05yEHP8WFl
         50JA==
X-Gm-Message-State: AC+VfDxcBZK5JLPZub3idAN7IVIQnp4x6NwAD8Aq6KY+ZqLmLoi45S0r
	dHM+nKq0b6vR8YmHFa3Qs/P6lJLebTIwLOT9f6IUsNl5waIegQ==
X-Google-Smtp-Source: ACHHUZ55TWBGa+ls+7SU+Idze2pDgI/1h09IXPHXXPLFEgKKzmrcdRBgqWQ35WTqKy+KTCZO5XZabYMFHyr/4t2BBAc=
X-Received: by 2002:a0d:d046:0:b0:54f:ba89:225d with SMTP id
 s67-20020a0dd046000000b0054fba89225dmr10467941ywd.19.1682883955464; Sun, 30
 Apr 2023 12:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230403191600.43487-1-fcagnin@quarkslab.com> <20230403191600.43487-3-fcagnin@quarkslab.com>
 <4bcb801d-7a16-765d-730a-ba2bc882fbeb@linaro.org>
In-Reply-To: <4bcb801d-7a16-765d-730a-ba2bc882fbeb@linaro.org>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Sun, 30 Apr 2023 21:45:44 +0200
Message-ID: <CAF8_6K=dO7xUM76ZzuBz=kQvnqh3gV=5NNrNz9BCMfQn+DncCw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hvf: implement guest debugging on Apple Silicon hosts
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
	peter.maydell@linaro.org, qemu-arm@nongnu.org, agraf@csgraf.de, 
	pbonzini@redhat.com, alex.bennee@linaro.org, 
	Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: rOPagIJ/nHII

> Other than that, the structure of the patch looks OK, but
> I think you need to identify the cause of the problems
> with SMP setups that you mention in the cover letter,
> since they suggest that there's a bug lurking in here
> somewhere.

In the current patch, in `hvf_arch_update_guest_debug()` I'm enabling
exiting the guest on debug exceptions only for the vCPUs that have inserted
software/hardware breakpoint or are singlestepping. In SMP setups this logi=
c
looks flawed, since for example if vCPU #1 sets a software breakpoint and
vCPU #2 hits it, the generated debug exception for vCPU #2 will not exit th=
e
guest and lead to panic for unexpected BRK. A possible fix is enabling
exiting the guest on debug exceptions for all vCPUs (and not just the ones
that have inserted breakpoints)=E2=80=94is this the way to go?

There's also a second analogous issue for which it feels like I'm missing
something. If through GDB a software breakpoint is inserted from vCPU #1 an=
d
later vCPU #2 hits it, then when trying to resume execution after the hit
GDB fails with 'Cannot remove breakpoints', due to
`hvf_find_sw_breakpoint()` returning error because it (correctly) doesn't
find any software breakpoint for vCPU #2 (queue
`cpu->hvf->hvf_sw_breakpoints`). A possible fix seems to be modifying
`hvf_find_sw_breakpoint()` so that it searches for the breakpoint on all
vCPUs' queues; but I've skimmed through the analogous routines for TCG and
KVM and there's nothing resembling this fix, so I wonder why TCG and KVM
don't fail on my example GDB scenario?

With both proposed fixes the patch seems to work well also in SMP setups in
my limited tests.

For the next round, I'll also split the patch as suggested.

Thanks,
Francesco
