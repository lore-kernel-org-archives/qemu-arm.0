Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4761822njc;
        Tue, 27 May 2025 05:03:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdWh14YieUzys6Icn2AyiJ6MLEjl1Qu3ZB16c+GPSlZxZ6vKxT8Lc5f44OdT1j68yFu2zHmpCVmhl8MQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG8hyuH1JkVzBUOKznemScTBVOjydnAFNqBt0ydUjZN/tE7xDEfYDVv9bNsm0EQdgLEx2gR
X-Received: by 2002:a05:6122:d9e:b0:52d:b8fc:991f with SMTP id 71dfb90a1353d-52f2c57b845mr8656568e0c.6.1748347394803;
        Tue, 27 May 2025 05:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748347394; cv=none;
        d=google.com; s=arc-20240605;
        b=Kp6XdIrsVur2aBCWQJCoPdYqV4sgX67iGxMtKRVVCKBydqADNarue/dw6yvdvDwglv
         5cF6MCvtIeTtPSU9USYa/Iv/XnPf6KfDAmoatvo01zBK68OuSbOfSiweBo0l5JEf4JkY
         3ZxV7VUs3x8FtTFQ4WK4v4TGWRjxx7S1YnH967wYPfvQRZ567egszhuwkKNKMUHkwiAW
         kmSOojYYOrIUNiD3kPchbd4aCpNvHDUAS0io2Ju1NtzYWPkum5KJY1o/aj7aRg4gs9JG
         gV2tR/ZcsIc2pDwAPSUuEBksQHnu4gdh9uIckUQwC3IwxXMW8cPXa3OwL6KOv9H4IC9t
         n+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:cc:to:from:message-id:date
         :dkim-signature;
        bh=tfgfwFaoyztxrYW+tXBfIZkAYDHBnA0CE0ae9lKmK6o=;
        fh=YSzsmHBVxrdPESpPegyfn1EKuQwVqHEVQP/gDhdU2pE=;
        b=jPgWpiXqZuCpkxdf8MDyJAFLapdjHaMzZcp3QZTdcuDWgpg5/sHcdUleOaesZpdXp9
         phjU2bH8W10JP+iy9zr1pxD17FqSJtFruueJyq8xiHiRioU9sX3oMuVyaAMPtTRP1qT4
         uF6RiO23/sMwlXWHQp+xYWnzt7yl/tB6F33XEbmrBUPN4fI9D6yScbmG82T0UXi/lBBg
         vfUBy0AaY+0Hwy1NIRenJIFeZwShsswzSkYUqfN8+jbOdKT0mCKszIkQvmE+SJJY71hp
         E1tg5n+KsRRuDScEKp7p3U++6cvgkeGLNBCed+UTSHVGZncQXDdtvHiuliJXxcibMc5b
         kohw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kyuSkRnq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e58e2da684si280202137.299.2025.05.27.05.03.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 May 2025 05:03:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kyuSkRnq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJt1L-0002xp-C1; Tue, 27 May 2025 08:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1uJt1F-0002s5-R1; Tue, 27 May 2025 08:02:57 -0400
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1uJt18-00055L-BZ; Tue, 27 May 2025 08:02:52 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8428149F73;
 Tue, 27 May 2025 12:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6239EC4CEEB;
 Tue, 27 May 2025 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748347364;
 bh=Ui0aXYvfGfPsz+T1F+p5UBbskki77yIqRyr0snwyzVI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kyuSkRnqJH9Vhe85ViSyTM/N2JGDqkFS3s1iDHdggYGgmkxBhiiK9ymem4BNlk6rV
 iJSTUfer4SBKgZ/eIxoILcaxQkaT51kzCwKvshePtGDZuHPjEFqyR6NFXtQkySCeuT
 dkEMStC9v/XuGQ/AO0U0trSV29OcqQ6UxQYRO8CaE1xjY0bEOOVrdMBrrmAVrp36ry
 dFCC66K1MURp3wun+CCDyB7VOoUS4bt1fzOzL/iHJK8MjVVLRWL0lrOPA3aVwAI4My
 MWQza+cfz27bofU9LsL6tSuLDiHY71edZaZrG7Uryd9QgZXTqu212Nd9BZEEA3WR5L
 nzeejnQbyzOBQ==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1uJt10-000ruQ-54;
 Tue, 27 May 2025 13:02:42 +0100
Date: Tue, 27 May 2025 13:02:41 +0100
Message-ID: <86jz62dzxa.wl-maz@kernel.org>
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
In-Reply-To: <63FE2592-DF4D-4CCF-BC76-D8656C9EFA0A@oracle.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
 <86msayec3a.wl-maz@kernel.org>
 <63FE2592-DF4D-4CCF-BC76-D8656C9EFA0A@oracle.com>
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
Received-SPF: pass client-ip=2600:3c0a:e001:78e:0:1991:8:25;
 envelope-from=maz@kernel.org; helo=sea.source.kernel.org
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
X-TUID: bLYAO1Coyzzx

On Tue, 27 May 2025 12:40:35 +0100,
Miguel Luis <miguel.luis@oracle.com> wrote:
> 
> Hi Marc,
> 
> > On 27 May 2025, at 07:39, Marc Zyngier <maz@kernel.org> wrote:
> > 
> > Hi Eric,
> > 
> > On Tue, 27 May 2025 07:24:32 +0100,
> > Eric Auger <eric.auger@redhat.com> wrote:
> >> 
> >> Now that ARM nested virt has landed in kvm/next, let's turn the series
> >> into a PATCH series. The linux header update was made against kvm/next.
> >> 
> >> For gaining virt functionality in KVM accelerated L1, The host needs to
> >> be booted with "kvm-arm.mode=nested" option and qemu needs to be invoked
> >> with: -machine virt,virtualization=on.
> > 
> > Thanks for respinning this series.
> > 
> > Do you have any plan to support the non-VHE version of the NV support
> > (as advertised by KVM_CAP_ARM_EL2_E2H0)? It would allow running lesser
> > hypervisors (such as *cough* Xen *cough*), which completely rely on
> > HCR_EL2.E2H being 0?
> > 
> 
> Something that pops up is early_kvm_mode_cfg trying to handle nested mode
> while KVM_ARM_VCPU_HAS_EL2_E2H0 is set.

Care to elaborate?

	M.

-- 
Without deviation from the norm, progress is not possible.
