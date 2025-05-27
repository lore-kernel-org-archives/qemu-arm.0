Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4949750njc;
        Tue, 27 May 2025 09:53:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXphVAjQE14l5M4cZkAF05k/mzp+869722q7ZXFvBnxgb4JfyCDDMzs3FNF4p+hYPV9RxQ0Fm2qeDbPEg==@linaro.org
X-Google-Smtp-Source: AGHT+IGvrOEFFh1mpD7tFtYReGXCiH2N+6zJkKGEr7+P2YhVW8XOeZkHT8t6ucy/PuDRea83/JxX
X-Received: by 2002:a05:620a:40ce:b0:7ce:e916:c953 with SMTP id af79cd13be357-7cf06d186fdmr198443185a.5.1748364801896;
        Tue, 27 May 2025 09:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748364801; cv=none;
        d=google.com; s=arc-20240605;
        b=IwfWxmwN7JeSa3FXqhEvzL1MmWy3/sN1h1I3lYRyebXjl7wqjweO6M3anl5V4flwVs
         VRNdfif9YT2EeuZ+9quR2NgBsku3toH0rzTOBx4v52ggmfVN2rP/0YW8x44n+8I96U6A
         1ZUS/i8v8pNplFOvm9I4CXEf8aB0K8+U13XfFg+bLKuLJVdxCfiW9Gtkx9yt7SkTvjB7
         nd/RYctyWPiuoxGGTvoBIzZ51eK090HiYc2iGzyQOhAS8ZNFyBkQ3KEt/17t18c9pWzW
         Rdd0pkYrk3xcAf/NBw0ck1IU8lW0yhbUt0wRV0w6BPmtYahVpK/fvMdbPEE3yR8bWNsM
         en1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:subject:cc:to:from
         :message-id:date:dkim-signature;
        bh=qDFuVubLDsJCI03SdwPYDBSSddHqsa5Y1bMb3gGJr9M=;
        fh=YSzsmHBVxrdPESpPegyfn1EKuQwVqHEVQP/gDhdU2pE=;
        b=Ow8/eorkKl+Qsc3r2IKKzT2d9lx/6njTrqVcGEoXKVBPxbEqhhFGAkd1mTQK5L79mo
         8R3Gl8qt+llSWHpfGBMzViGgGUYxIBveqz6VBPOcnRdMXmC/pL/2VUerEHINnNcqESFF
         OHpvoKLEMN8nbL5Dy0hy6QtjuwOtcA7PF0w9XOsJqCobBbus+MGEeN3bPJfsN0qEL51l
         3kFw+6wRhuerTqqK7y1t5w185SISflUGuUsH0p6SIr1he7ONUpmfjYHd9OLIwLf8IF8r
         3jZLBUgvstwQdoX1de5p52I6LWYO66hYcE9gKSqTDrvlH9nQLi/5vOMucubrxJhOOt2Q
         Bqsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XjQmzOvu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468f310csi2251104185a.644.2025.05.27.09.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 May 2025 09:53:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XjQmzOvu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uJxXp-00011i-ET; Tue, 27 May 2025 12:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1uJxXl-0000yf-F6; Tue, 27 May 2025 12:52:49 -0400
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1uJxXi-0004wd-SR; Tue, 27 May 2025 12:52:49 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4CDE6614BF;
 Tue, 27 May 2025 16:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025AFC4CEE9;
 Tue, 27 May 2025 16:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748364764;
 bh=Bt4JVL3Ubk1mgBtVSBYDxQXRmjiIs5L9++W1pZpayhk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XjQmzOvuQHmuPS8iC69A6FwUqcD/9aIP3CYmVPfFs/sqPUoZsl2MvvcwM0AqANqpz
 Eo15s15z4A/ETEbnqX+hUyldI47pMYeS+MCtR+VS5ASndQS8B/mMzjGatfL/rPuOaf
 ySIvxwPkfj1OL3LESs5mpgAFMTp6d8TnDbeQovCD8iacRnSWGlhmrM+Pb9AZEP8MHN
 zqJho4bGibnInfN5Hif8fdVIqFVOPu/LkIbbi7PTefEgSerRZOKHyiE+REEn/IDEnP
 uowoHumPCLNps3henuTCNdffLipgsbHwHXxyolxesxZoIPRPrGDGzqzr9khnQ43pC+
 sqNIKd2YXzTmw==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1uJxXd-000wKE-RG;
 Tue, 27 May 2025 17:52:41 +0100
Date: Tue, 27 May 2025 17:52:41 +0100
Message-ID: <86frgqdmhy.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Miguel Luis <miguel.luis@oracle.com>
Cc: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
 <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "gkulkarni@amperecomputing.com"
 <gkulkarni@amperecomputing.com>, "gankulkarni@os.amperecomputing.com"
 <gankulkarni@os.amperecomputing.com>
Subject: Re: [PATCH v5 0/5] ARM Nested Virt Support
In-Reply-To: <A3872288-67B7-4C99-84F0-19812758FCF0@oracle.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
 <86msayec3a.wl-maz@kernel.org>
 <63FE2592-DF4D-4CCF-BC76-D8656C9EFA0A@oracle.com>
 <86jz62dzxa.wl-maz@kernel.org>
 <A5135210-4984-4532-B0AF-9CDC8255CBD0@oracle.com>
 <86iklmdv4d.wl-maz@kernel.org>
 <A3872288-67B7-4C99-84F0-19812758FCF0@oracle.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: miguel.luis@oracle.com, eric.auger@redhat.com,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=2600:3c04:e001:324:0:1991:8:25;
 envelope-from=maz@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) DKIMWL_WL_HIGH=-2.907, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YGlJ4m7VT/5S

On Tue, 27 May 2025 16:55:32 +0100,
Miguel Luis <miguel.luis@oracle.com> wrote:
>=20
> Hi Marc,
>=20
> > On 27 May 2025, at 13:46, Marc Zyngier <maz@kernel.org> wrote:
> >=20
> > On Tue, 27 May 2025 14:24:31 +0100,
> > Miguel Luis <miguel.luis@oracle.com> wrote:
> >>=20
> >>=20
> >>=20
> >>> On 27 May 2025, at 12:02, Marc Zyngier <maz@kernel.org> wrote:
> >>>=20
> >>> On Tue, 27 May 2025 12:40:35 +0100,
> >>> Miguel Luis <miguel.luis@oracle.com> wrote:
> >>>>=20
> >>>> Hi Marc,
> >>>>=20
> >>>>> On 27 May 2025, at 07:39, Marc Zyngier <maz@kernel.org> wrote:
> >>>>>=20
> >>>>> Hi Eric,
> >>>>>=20
> >>>>> On Tue, 27 May 2025 07:24:32 +0100,
> >>>>> Eric Auger <eric.auger@redhat.com> wrote:
> >>>>>>=20
> >>>>>> Now that ARM nested virt has landed in kvm/next, let's turn the se=
ries
> >>>>>> into a PATCH series. The linux header update was made against kvm/=
next.
> >>>>>>=20
> >>>>>> For gaining virt functionality in KVM accelerated L1, The host nee=
ds to
> >>>>>> be booted with "kvm-arm.mode=3Dnested" option and qemu needs to be=
 invoked
> >>>>>> with: -machine virt,virtualization=3Don.
> >>>>>=20
> >>>>> Thanks for respinning this series.
> >>>>>=20
> >>>>> Do you have any plan to support the non-VHE version of the NV suppo=
rt
> >>>>> (as advertised by KVM_CAP_ARM_EL2_E2H0)? It would allow running les=
ser
> >>>>> hypervisors (such as *cough* Xen *cough*), which completely rely on
> >>>>> HCR_EL2.E2H being 0?
> >>>>>=20
> >>>>=20
> >>>> Something that pops up is early_kvm_mode_cfg trying to handle nested=
 mode
> >>>> while KVM_ARM_VCPU_HAS_EL2_E2H0 is set.
> >>>=20
> >>> Care to elaborate?
> >>>=20
> >>=20
> >> Say host is booted in nested mode (kvm-arm.mode=3Dnested) and host's K=
VM supports
> >> both KVM_CAP_ARM_EL2 and KVM_CAP_ARM_E2H0.
> >>=20
> >> A L1 guest boots setting both KVM_ARM_VCPU_HAS_EL2 and
> >> KVM_ARM_VCPU_HAS_EL2_E2H0 and guest kernel's command line state
> >> kvm-arm.mode=3Dnested.
> >>=20
> >> This splats the kernel from early_kvm_mode_cfg along a malformed early=
 option
> >> message.
> >=20
> > BEBKAC. You are asking for nested on a (virtual) machine that doesn't
> > support it, and the kernel tells you so with a warning. Try the same
> > thing on a physical machine that doesn't have NV, and observe the
> > result.
> >=20
>=20
> Ack.
>=20
> I find trying them a great way to improve resilience.
> I=E2=80=99ve tried the scenarios below which have similar results on the =
guest:
>=20
> 1.
> Host: kvm-arm.mode=3Dnested
>=20
> L1 Guest: kvm-arm.mode=3Dnvhe setting both
> KVM_ARM_VCPU_HAS_EL2 and KVM_ARM_VCPU_HAS_EL2_E2H0
>=20
> Result on the guest: No early_kvm_mode_cfg splat, boot proceeds, ends up =
in a hard lockup splat.

Setting kvm-arm.mode=3Dnvhe when KVM_ARM_VCPU_HAS_EL2_E2H0 is set is a
tautology. The very definition of nVHE is that HCR_EL2.E2H=3D0.

>
> 2.
> Host: kvm-arm.mode=3Dnested
>=20
> L1 Guest: kvm-arm.mode=3Dnested setting both
> KVM_ARM_VCPU_HAS_EL2 and KVM_ARM_VCPU_HAS_EL2_E2H0
>=20
> Result on the guest: Splat at early_kvm_mode_cfg, boot proceeds, ends up =
in hard lockup splat.

I don't see any of these lockups with kvmtool. See this:

	https://pastebin.com/uyYzsBHc

for an example of a boot with both capabilities set and the nonsense
"nested" on the command-line (your #2).

> Does this means there=E2=80=99s a default fallback mode in which nv gets =
on when=20
> kvm-arm.mode fed to the guest kernel cmdline differs from the expected?

I don't understand your question. We have two modes of operation:

- HAS_EL2 enables NV on the host, and additionally enables recursive
  NV. As a consequence, HCR_EL2.E2H is RES1. This is how NV will be
  supported long term.

- HAS_EL2_E2H0 restricts the above by not exposing NV to the guest,
  and enforcing HCR_EL2.E2H to be RES0. I expect this to gradually be
  removed from implementations, and eventually disappear.

As you can see, there is no "fallback mode". You pick the mode you
want based on the guest you want to run and the capabilities of the
hardware.

	M.

--=20
Without deviation from the norm, progress is not possible.
