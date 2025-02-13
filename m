Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp479405njc;
        Thu, 13 Feb 2025 02:14:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVFilZib/4vH+rXCpM2FwIDiPV+2SnsqW6wfn9tTpHsAXa1dFfOCco3h6m7ivVhXKpig4sZUvh80eBbtg==@linaro.org
X-Google-Smtp-Source: AGHT+IEV72zbeGdqoM2pNeCTwC0oDMEFnKo/mLchVauMOQlAAPYeTL7mwra6yXyUrbMho+5f2rGX
X-Received: by 2002:a05:620a:408d:b0:7b6:e9db:3b21 with SMTP id af79cd13be357-7c06fc67e84mr847475785a.14.1739441656142;
        Thu, 13 Feb 2025 02:14:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739441656; cv=none;
        d=google.com; s=arc-20240605;
        b=Ny0LvhGKabboVljZwdT8mSw6ZpFyr3CbE+9ZoMbXJeX+UGA96WtuTaqYLotWrGAfnc
         QdOWpvzh2ZOjRaP1iRBydGupTxGOXmW2iihFdTF84HUP4QfWait7LCuDuMpFslPjOeRU
         7PAZlxEmimgv31kLWJOE9oUNjmPTU/iHJcRK5GEtyWm8mLqzrCKLfRq+eXNlSSTbnD8c
         gg0dBtmrWkzM06jz/p0GP4SOmbZrvkue8KAny0LscT6mx/6/QzC/nNO9wqYRoM/ZnfkP
         KxfVCLpSI3BGpp5oEZ7cdGTovSPOMttJOJjZERaZAnzfVUD8nCaQ8XeJ79XGccJRPGAp
         XxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=x3xwWPY290dWRkVPYisyqKlfzl+YfA+8J4XALAGqCGE=;
        fh=fXizdRq1P1fuoVOZ+FxSfz25ZLQTKhRwdBr3b/9InoE=;
        b=HaPEqL+jQz4U89Lf9dNSwKbqXw2p+I9wujYglFDzn5FAVTB7L4J/DDKdCq9iUa+p+D
         sSjkG7jo8TDPbRaWmo1c25Xti85z85IrFrnPWJRT/q9CjmP1nagcdeGLN+AjPAsSIP9E
         UdjleuNuug8Frg+3H74xAx1n6qgsn0tN3RAqnRJ6NrG+yz44ruLEYkV1bh9dvxo/fJB2
         UAx5xT1bYcYx5wg/NwSGFW/qS98idrhF0yT/bqSjlZfCLDgsKR5Uy/aUKAZhtK8ySKXd
         lZfJV+IbtUWhTghOB/bsDHb4ehkBaKEaRSUJfy3YC2h/BkfLRi7RXUSXvlWoSMDgGufS
         jDUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eqxSAQXq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07da38859si70796685a.204.2025.02.13.02.14.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 02:14:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eqxSAQXq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiWEO-0004bO-91; Thu, 13 Feb 2025 05:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1tiWEI-0004az-Ot; Thu, 13 Feb 2025 05:13:59 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1tiWEG-00078x-Aw; Thu, 13 Feb 2025 05:13:58 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B8D8A5C53A1;
 Thu, 13 Feb 2025 10:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA05C4CED1;
 Thu, 13 Feb 2025 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739441634;
 bh=6Vca/JaGuKes76BeKlU7+5zMdE+wx0RB2G6+FZ9cjoc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eqxSAQXqIWGpkjfQAodVEuFzy2L1OumLOdjEcvbFX3LsB30q/eNVPmWDT06nWzkOu
 DJWNxO6hGqT72IQ4FbFZoXySn/vjh5g344yC+e3JvMwCmhPzLkWXk24gy3uOIiinLt
 GHHJJUiomjD8OMYOn15wKy/xdNN7UTwiP+AxV6x0edNTap015gjhaQUPWa6FuQ76oI
 +BauJVkcTKqwRQnpow6ZuH9CVhA45WtwEUrZgX3dqIoQEdopNQ0o8/d/Y0bqTnkkqN
 R0I411I2wLQ4z/nenYw4dAODEcBP1489aXzucqEoaKBp3XxFea2JhCRp/0gmZ3OfMk
 OXXwFNL3QdSiQ==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-545097ff67cso654490e87.2; 
 Thu, 13 Feb 2025 02:13:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUiZj5X6FOd4nRHkRIbHS8dOUDnJXyXzWEzng+QCVdxXhkGT7HfPYSAQSHaXPgBjTKib17MiXking==@nongnu.org,
 AJvYcCW+g4nXgmOPpJ3HOXxnzYvjB0uRB0sumAQ//j1IB3/MH1xJjIjk10nzCp7Tntnc8eSceYrAxiEuxUq08A==@nongnu.org
X-Gm-Message-State: AOJu0Yyz3fuVEVX7Nd/yq1iWk4QHav7X0FtFRAIUckNgJHXw4hFJ1Vnl
 cLllBdwsrUA0j5ffe7LcxJyc6AwkKt6wm0C8eHRMbCNQt18EG22j1HajcRciz2UpyxXXemTPQCD
 Bcq9foWBnUsbs1IREf+yOezGSp2o=
X-Received: by 2002:a05:6512:e97:b0:545:4b0:8a1d with SMTP id
 2adb3069b0e04-545184bcfe9mr2162009e87.51.1739441632369; Thu, 13 Feb 2025
 02:13:52 -0800 (PST)
MIME-Version: 1.0
References: <20250211092324.965440-1-kraxel@redhat.com>
 <CAMj1kXE289FkzV=GZSUARF7TFUyRuxYVX-090ic06Erb_RLGrg@mail.gmail.com>
 <cc41f19c-5778-4376-a1a1-762a92c8584c@amazon.com>
In-Reply-To: <cc41f19c-5778-4376-a1a1-762a92c8584c@amazon.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 13 Feb 2025 11:13:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFaoZCnXpAsq+i5nzpCOjcrsN4QA2r6Z=F6UUwcUe_qJA@mail.gmail.com>
X-Gm-Features: AWEUYZlg51Z1Tt_zVC_1CRwzJSq_hfim0Du2WMOrMWNA-JlBE_QiSF49Jd7zHV0
Message-ID: <CAMj1kXFaoZCnXpAsq+i5nzpCOjcrsN4QA2r6Z=F6UUwcUe_qJA@mail.gmail.com>
Subject: Re: [PATCH v3 00/23] hw/uefi: add uefi variable service
To: Alexander Graf <graf@amazon.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: kbM5p7QIrMZX

On Thu, 13 Feb 2025 at 11:11, Alexander Graf <graf@amazon.com> wrote:
>
>
> On 13.02.25 10:41, Ard Biesheuvel wrote:
> > On Tue, 11 Feb 2025 at 10:23, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >> This patch adds a virtual device to qemu which the uefi firmware can use
> >> to store variables.  This moves the UEFI variable management from
> >> privileged guest code (managing vars in pflash) to the host.  Main
> >> advantage is that the need to have privilege separation in the guest
> >> goes away.
> >>
> >> On x86 privileged guest code runs in SMM.  It's supported by kvm, but
> >> not liked much by various stakeholders in cloud space due to the
> >> complexity SMM emulation brings.
> >>
> >> On arm privileged guest code runs in el3 (aka secure world).  This is
> >> not supported by kvm, which is unlikely to change anytime soon given
> >> that even el2 support (nested virt) is being worked on for years and is
> >> not yet in mainline.
> >>
> > The secure counterpart of this would never execute at EL3 on ARM, but
> > at secure EL1 (or potentially at secure EL2 on more recent CPUs). But
> > the general point that this is difficult to virtualize stands; I've
> > contemplated doing something similar to SMM emulation using non-secure
> > EL1 in a separate VM to provide an execution context that could those
> > the secure EL1 payload (using standalone MM) but I never found the
> > time to work on this.
>
>
> Sounds very similar to what Ilias built a few years ago?
>
> https://lore.kernel.org/all/20200511085205.GD73895@apalos.home/T/
>
> Which reminds me: How similar is the protocol in this patch set to the
> one implemented in U-Boot? No need to reinvent the wheel over and over
> again.
>

Identical afaik
