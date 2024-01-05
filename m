Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp896042ejo;
        Fri, 5 Jan 2024 10:44:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOsVjuZgSPLLWGEhn32SMWaRsOSpZPWAfCLFxujdU2Q2XIO+rF2G7sB8hsPdYYp1T/qPyp
X-Received: by 2002:ac8:4e43:0:b0:427:ec89:c325 with SMTP id e3-20020ac84e43000000b00427ec89c325mr4179499qtw.33.1704480267868;
        Fri, 05 Jan 2024 10:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704480267; cv=none;
        d=google.com; s=arc-20160816;
        b=aIV/xYRgVECGtjm3ThpcGTn4EjH9IlLLwbASq82XUXS9msr0NxoOuq8vnOqpSF0+qI
         rqzdl36tcnYwU5YzXgZ8usZ58zz4W/EFgsrQeEDpFLGdk63omcCpxAR76yYEufPKHwr5
         2zZOvulTdUSpMa4EG6k+S8wSeGRLMtPEeVE8pyLi/FhtiWRoZjCEPpQmIvoFdhEGLzj+
         An2dBsgJlz89a401F+1JvL36H3IwODZuEEnt//Z9+NmpUcVDnlWiT5NR594DI6dxblC+
         Nw5dmacd4FTyELVF+11H/Su+/OGEI072zjBc8WNGDHRvmMfo8G7IkpmJRjDuGbCJewAo
         dBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2XheI6gPr0kqfBkCeGZsoVngCMamKM2r3BSHHntDCuY=;
        fh=+cqBntnOJNCSmKI7HTeJnfMBGVCdJa5v998hK6G9pSQ=;
        b=adqMUKGrRbjdYCpx2NfpDSgGkqnTp/Q1uJ1SiKCBP61UTwQ/AvmAPa93A2y1G8Sfl9
         0o9+Ovv/j9gBxtiLk6XQw6jDH+gCgAgMkJLBnGEQBTw3rkSlqFwMd9IqGXv8wmkORZkm
         ZO4v4K1SIqbM/lCwe/5y5xb1OiGgBVmbitwW/Xo3WhSk59aRVGaDL3Ur323i1VLDB/LU
         CtRd+nTVFVFPDn6v+sznbzuKMbS+g0Y90UU5MPvs60+lBygKoSMMQLGCKZWlHep+3f9/
         72naPGfeuC4/c49Tx5e4E1F+++8INK7BnNQZVr4nTHgPXmevTnvVx7AkPsK2/99ujrTw
         a/gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rdBFuK43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16-20020ac85f90000000b004297d4cf98esi689225qta.476.2024.01.05.10.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 10:44:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rdBFuK43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLpAo-0004qC-GE; Fri, 05 Jan 2024 13:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLpAg-0004kn-UK
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 13:43:55 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLpAT-0000pa-Vj
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 13:43:54 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-555144cd330so2378767a12.2
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 10:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704480216; x=1705085016; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2XheI6gPr0kqfBkCeGZsoVngCMamKM2r3BSHHntDCuY=;
 b=rdBFuK43jHozU3ORH58motFiaaG2dzTobk9QZpFqCm06Wo1thbNAsguH6lJP46rDBE
 vpE1xfdieatbpnjqSlazWr+UIREnQNWkEfB7F5CLjyfAHHMG7WjW839ac1FR0NRK7/O/
 1WPr3hXxb9wEFwzsDuXpeDta91lt/6ZK+4IQJgr+7QrE6ggM7Cm4ui6PeeJFZvVJZhfd
 M5IRKNEFsevk8bNEXMmi8mwrqev4dQqYJK7ZYxTiaDOb7vw2i6TC6qPbE99cEQJEodJC
 fgCHy6JAB8J9giWizRn2jq71mMkPX1su3d8lUWk1cwCx25+TEwmREKvTvZ8xsvjqFP7U
 wt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704480216; x=1705085016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2XheI6gPr0kqfBkCeGZsoVngCMamKM2r3BSHHntDCuY=;
 b=L8L+EDVeRXmaWY3RNRVirRltKs7B35ufAU+/ZMIJLKj0no2VILpV99wzcZp91YQrA3
 ZVlN0fFivFYzxp8Q8Y+/xu6hWG3xBnfQRE4zf7Ontme3HDH+jTpphU4PsQAdEDFFUtex
 Y6N8iC9m7mw3QLROk1lksYW6I5NAw0uhe7If39AX6NRVMXBwq8zfqZr/jA2hp+U/2HtB
 +s/ZPTsAZO2JiTGgmqy19wv5B0ecZl7IccT+2NbvZVAdT8yo1eIuUbHg4ApAgoxBLlIt
 grn58NmmyAoFAU7vShZnHilmmG5hvNbM6V3jBA8EbVfuUvAb2XfXlN/Y+D3g2eFHz21q
 vftQ==
X-Gm-Message-State: AOJu0YwqAMqej3yA95I93j2lMWaOqsOC6kb2Nn5n9dLsltZNIA/LN0mB
 CUO710Kiz37rsS8vRl7ayC+GmF2m/I3wzbWeqVyvOWo3syDPvUxog7vPiPN8
X-Received: by 2002:aa7:c1cc:0:b0:557:4227:e2bf with SMTP id
 d12-20020aa7c1cc000000b005574227e2bfmr414279edp.35.1704480216062; Fri, 05 Jan
 2024 10:43:36 -0800 (PST)
MIME-Version: 1.0
References: <20240105154307.21385-1-philmd@linaro.org>
 <566d5a05-5cd3-40fe-b40e-8e82524d8ea6@linaro.org>
In-Reply-To: <566d5a05-5cd3-40fe-b40e-8e82524d8ea6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jan 2024 18:43:25 +0000
Message-ID: <CAFEAcA-1S7-eAU=_mLM0fsecKA8JTOx4LfHZZYOEfskTU=vjeA@mail.gmail.com>
Subject: Re: [PULL 00/71] HW core patches for 2024-01-05
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: 4dkd4sMDn+ld

On Fri, 5 Jan 2024 at 17:05, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 5/1/24 16:41, Philippe Mathieu-Daud=C3=A9 wrote:
> > The following changes since commit 05470c3979d5485003e129ff4b0c2ef98af9=
1d86:
> >
> >    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into sta=
ging (2024-01-04 19:55:20 +0000)
> >
> > are available in the Git repository at:
> >
> >    https://github.com/philmd/qemu.git tags/hw-cpus-20240105
> >
> > for you to fetch changes up to a318da6b3f6a88e6cfd6953c519def9457e8962f=
:
> >
> >    target/sparc: Simplify qemu_irq_ack (2024-01-05 16:20:15 +0100)
> >
> > ----------------------------------------------------------------
> > HW core patch queue
> >
> > - Unify CPU QOM type checks (Gavin)
> > - Simplify uses of some CPU related property (Philippe)
> >    (start-powered-off, ARM reset-cbar and mp-affinity)
> > - Header and documentation cleanups (Zhao, Philippe)
> > - Have Memory API return boolean indicating possible error
> > - Fix frame filter mask in CAN sja1000 model (Pavel)
> > - QOM embed MCF5206 timer into SoC (Thomas)
> > - Simplify LEON3 qemu_irq_ack handler (Cl=C3=A9ment)
> >
> > ----------------------------------------------------------------
>
>
> > Philippe Mathieu-Daud=C3=A9 (37):
>
> >    backends: Simplify host_memory_backend_memory_complete()
>
> I neglected to run checkpatch.pl on this patch, so it lacks:
>
> -- >8 --
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 30f69b2cb5..987f6f591e 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -346,5 +346,7 @@ host_memory_backend_memory_complete(UserCreatable
> *uc, Error **errp)
>       unsigned long maxnode =3D (lastbit + 1) % (MAX_NODES + 1);
> -    /* ensure policy won't be ignored in case memory is preallocated
> +    /*
> +     * Ensure policy won't be ignored in case memory is preallocated
>        * before mbind(). note: MPOL_MF_STRICT is ignored on hugepages so
> -     * this doesn't catch hugepage case. */
> +     * this doesn't catch hugepage case.
> +     */
>       unsigned flags =3D MPOL_MF_STRICT | MPOL_MF_MOVE;
> @@ -365,3 +367,4 @@ host_memory_backend_memory_complete(UserCreatable
> *uc, Error **errp)
>
> -    /* We can have up to MAX_NODES nodes, but we need to pass maxnode+1
> +    /*
> +     * We can have up to MAX_NODES nodes, but we need to pass maxnode+1
>        * as argument to mbind() due to an old Linux bug (feature?) which
> @@ -393,3 +396,4 @@ host_memory_backend_memory_complete(UserCreatable
> *uc, Error **errp)
>   #endif
> -    /* Preallocate memory after the NUMA policy has been instantiated.
> +    /*
> +     * Preallocate memory after the NUMA policy has been instantiated.
>        * This is necessary to guarantee memory is allocated with
> ---
>
> Since the PR is already in the testing pipeline:
> - if it get merged, I'll send a cleanup patch
> - otherwise if it fails I'll fix it.

It just passed the last CI job on a retry, so please send a
followup patch.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM
