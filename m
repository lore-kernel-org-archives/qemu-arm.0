Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4826515njc;
        Tue, 27 May 2025 06:47:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUosQ96UDrwQeRhi/lTJ9WYfq9L+dgb3+DKHOOxIFWn4sJR2QBW8040ctVyn4clRLezg7OafHzZCH19OQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHhOhEQtylrYicCnJcoXv1r4QU1JFwB6YpouXUwPXl2IOKRiH4YKKGAcWASDmAkYlO09LUd
X-Received: by 2002:a67:e715:0:b0:4cb:5d6c:9944 with SMTP id ada2fe7eead31-4e4240ac4e9mr11034943137.3.1748353629022;
        Tue, 27 May 2025 06:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748353629; cv=none;
        d=google.com; s=arc-20240605;
        b=h4doWd291Q+GJCc/dAAKcdo7FcZCH+iD1kAoD8mTNJfiW8fc2m4qH5lit5ICii7vA/
         jcZia+iCVAA/Oj2UIm0Lod/VgCMP29oBEELBXg85VyIAJruJVPiGvHUl3n9CotSB113j
         IfIo2Fwi6AvU7r52nagMDrWg6Wu5ELEEHkRctJhb87cuPT1xEdfrQsi0PPZlwArMMT51
         KqBHdMQxsYzv/meP1TRPhRgJQ9FN2RVf2664dyabz4qDXHSxSIlh5zrEYxrNyV9yfaHX
         O6zUHI+kMIWLf1yuV7AhVA+nRAM7GDYLu2VgwHKt/K3diJYLc2TKZ20v2SxMR4OvmV4U
         xPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:cc:to:from:message-id:date
         :dkim-signature;
        bh=2ZxcszyNu5PQiA+RP2ooP9oKyZVmZ36uIkzonevfEqY=;
        fh=YSzsmHBVxrdPESpPegyfn1EKuQwVqHEVQP/gDhdU2pE=;
        b=Box/OWmP2tHu8/QY5ga9JgYoB4WGkrc4maLhudy8AtTN0JM9xG5XgLWt1HejiR3F9M
         ijLaLacr/76dhSyEDTtfed5JQ40Hb31iba9cNH+VZstWDjoolmR0qcT5/qYPQo1dXBLJ
         JMIxEXFFtd8teerdCi8tAbsjb5XUOznukoI8opbY50ArFluH9GX7UmPJ6h2LuGcFXngA
         OK1hBImjNyx7hYWDncUV2IvDugSEGQAfwpIgdeDzBwqXCwHXcsPqJ3DAqAVR4G1y23yp
         UFbeuLQGn0nxKXBHwiZWJhBClnLiEMEjZtXg2xulY7LgpCQWEMWDzhpTQvBMsgrCvA9a
         fRkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=m3TJWiva;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e55c13950fsi770164137.652.2025.05.27.06.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 May 2025 06:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=m3TJWiva;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJudf-0003yg-8j; Tue, 27 May 2025 09:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1uJudb-0003xx-VW; Tue, 27 May 2025 09:46:40 -0400
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1uJudX-000454-4O; Tue, 27 May 2025 09:46:38 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EE832A4F7F0;
 Tue, 27 May 2025 13:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98628C4CEE9;
 Tue, 27 May 2025 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748353590;
 bh=Y1djrcwd8g3/VnICyeA5ZpmMHHbfJJELISemveFiG2c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m3TJWivaP+LihNWg1A8f7RT3cfoMmKa+GSyT2hk3mb8Rdx/JDGPdfHAQPf1THc0Jb
 Kch5qVolPQZS5V7ukom96WTOoG0lSEx7MXemIC/F5e3Fp558j5yPHgIZW+2YJiVJAV
 Z6NIohDDj1POrOeljx0t5+Leap3wi1gL7IyORHVFB4IY31ziCi4+LrMf3HUhMfp6Gj
 5i0WBaR+6Qstc/bFwCdz3OIG1grGXN4P36ayDkBKMYtOpqPFqCWZamLoFE80DBioq2
 bRI7HceTvMvHY+y1sJySb4b/zT03L90AmVVCLRL6wQftb1lfVKGOlSEMYuXR1qQo2k
 Auj/n02GoPoWQ==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1uJudQ-000tZa-5q;
 Tue, 27 May 2025 14:46:28 +0100
Date: Tue, 27 May 2025 14:46:26 +0100
Message-ID: <86iklmdv4d.wl-maz@kernel.org>
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
In-Reply-To: <A5135210-4984-4532-B0AF-9CDC8255CBD0@oracle.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
 <86msayec3a.wl-maz@kernel.org>
 <63FE2592-DF4D-4CCF-BC76-D8656C9EFA0A@oracle.com>
 <86jz62dzxa.wl-maz@kernel.org>
 <A5135210-4984-4532-B0AF-9CDC8255CBD0@oracle.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: miguel.luis@oracle.com, eric.auger@redhat.com,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=maz@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dazY/LZR6Koo

On Tue, 27 May 2025 14:24:31 +0100,
Miguel Luis <miguel.luis@oracle.com> wrote:
> 
> 
> 
> > On 27 May 2025, at 12:02, Marc Zyngier <maz@kernel.org> wrote:
> > 
> > On Tue, 27 May 2025 12:40:35 +0100,
> > Miguel Luis <miguel.luis@oracle.com> wrote:
> >> 
> >> Hi Marc,
> >> 
> >>> On 27 May 2025, at 07:39, Marc Zyngier <maz@kernel.org> wrote:
> >>> 
> >>> Hi Eric,
> >>> 
> >>> On Tue, 27 May 2025 07:24:32 +0100,
> >>> Eric Auger <eric.auger@redhat.com> wrote:
> >>>> 
> >>>> Now that ARM nested virt has landed in kvm/next, let's turn the series
> >>>> into a PATCH series. The linux header update was made against kvm/next.
> >>>> 
> >>>> For gaining virt functionality in KVM accelerated L1, The host needs to
> >>>> be booted with "kvm-arm.mode=nested" option and qemu needs to be invoked
> >>>> with: -machine virt,virtualization=on.
> >>> 
> >>> Thanks for respinning this series.
> >>> 
> >>> Do you have any plan to support the non-VHE version of the NV support
> >>> (as advertised by KVM_CAP_ARM_EL2_E2H0)? It would allow running lesser
> >>> hypervisors (such as *cough* Xen *cough*), which completely rely on
> >>> HCR_EL2.E2H being 0?
> >>> 
> >> 
> >> Something that pops up is early_kvm_mode_cfg trying to handle nested mode
> >> while KVM_ARM_VCPU_HAS_EL2_E2H0 is set.
> > 
> > Care to elaborate?
> > 
> 
> Say host is booted in nested mode (kvm-arm.mode=nested) and host's KVM supports
> both KVM_CAP_ARM_EL2 and KVM_CAP_ARM_E2H0.
> 
> A L1 guest boots setting both KVM_ARM_VCPU_HAS_EL2 and
> KVM_ARM_VCPU_HAS_EL2_E2H0 and guest kernel's command line state
> kvm-arm.mode=nested.
>
> This splats the kernel from early_kvm_mode_cfg along a malformed early option
> message.

BEBKAC. You are asking for nested on a (virtual) machine that doesn't
support it, and the kernel tells you so with a warning. Try the same
thing on a physical machine that doesn't have NV, and observe the
result.

	M.

-- 
Without deviation from the norm, progress is not possible.
