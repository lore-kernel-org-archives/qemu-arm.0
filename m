Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp287709njk;
        Tue, 17 Dec 2024 07:21:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXPA6F+IeFu1rqmfCgP51PimnJttBNudkCAHzB3jqMHDve0rzadr9x01hHt5OQbYFVi7gqlV8fby/kzA==@linaro.org
X-Google-Smtp-Source: AGHT+IEfMK85IDX0mCITJundni3emZAjWNsTW2PY049xRaKvuGijd7xRpgLJkeYoySN1fu6y3aig
X-Received: by 2002:a05:6870:ac86:b0:29e:6d29:d3ff with SMTP id 586e51a60fabf-2a3ac51ed4emr8088770fac.7.1734448881997;
        Tue, 17 Dec 2024 07:21:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734448881; cv=none;
        d=google.com; s=arc-20240605;
        b=Zcgk8j0CJwsOAZTq6TQpGpBmNnPbvdk+1vD8hWMifzaUu02K3xdHNWasfrgoja7tih
         Fy6OgIJGQAZk4wqyFg1Xf7KKS3J7gk5fXmBBvi3SuJi/zS6jevonAinaBUo7AA7+Gj7A
         34gqdDHtq4yVuioP4HCWIb0bBwLbuVvQwS43E0E8PQx3v3wSuZlUb5WHLz1U0bM1WojM
         pr7SDxBEsCDldMHpVf57hyP84ed/R745xtKK4PIczslMDURTMrlLcoy+3yimNVctzm6r
         GvU/NlBq5eMvASpwzy0ApQVicnj/z9gz7yyMbiExtsvEpMWqbI7B8q+/C0CP+UkPxZBJ
         sOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:references:in-reply-to:subject:cc:to:from
         :message-id:date:dkim-signature;
        bh=kMNvCJUAScbqN1mfd7Ed+Pc+i6T3SO6hdu4R++j0kVk=;
        fh=M9IGPqzCvlwYRZmitoF3Os13Fza8XodbUcWXmIZpaC8=;
        b=XYQtTh5zdVACQwwC4iNlGmg5WUSBUn1JNHpQZPUj52dGJ+KVriFOUHJNwS5JLdY40m
         c+7yv4cBqlO8f6x3XgihFtFqaXeZcsLRZoPCeNCQ+/PSiJnj+hMuEQutbfVSSS8UeehX
         hzsI+2oIsrr1evx9wrFVb7S+5LZBSyRRKLRexLFlcsV8QVMPhK69UpmyDcx4qSIHh9fK
         Wl//GY5ws96KQgOSlb96xcGHHsbdF2VoI/SXg0mQTX3odUpAtWh1C3DB2XT2ohsAHi++
         0524F/WT1PnNCeZmFXEG7t4UMo4xcCVmo9VOiCj6lhE5ZtOJHENAm6Rj7jqnPjkLb2Wn
         RQgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Ks4qRnM1;
       spf=pass (google.com: domain of maz@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <maz@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id 586e51a60fabf-2a3d2445c09si4056223fac.53.2024.12.17.07.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 07:21:21 -0800 (PST)
Received-SPF: pass (google.com: domain of maz@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Ks4qRnM1;
       spf=pass (google.com: domain of maz@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D2CC25C5F9B;
	Tue, 17 Dec 2024 15:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8116C4CED3;
	Tue, 17 Dec 2024 15:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448880;
	bh=dK879g794qcUQiGAgdNVuQBSKvfyXP7Cb2+vlps/UdM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ks4qRnM1VWBZ826cl6ud0LvujlH1rhUFb5oKLHh23WXwfM9W2R1BxYpGRUz/gUWPf
	 WaOPoCao0yC6vHs8k52a9MxwDXezc5aMrwXm31tizLJ33Vd+/c9FmknPjITbj4wCL5
	 h76X3y92fMtaRN29NBQR/VrpQI6e7EbYEAzKfwPgIJFLe2j6TElSXzSEuRVDIAOyc6
	 1rzkyAHVqOxB8+SDfwd2y2Reo+2w+0Amw8WP2zbCjzBlNwdsvfPkUqGIOEdwCGV0m3
	 E+tMsEcK3EVDQcN1Ql+Fn6K/p0z/DfXJ14C5FYXRhebIP5FvptLddhTY1NvNdCu55n
	 PZsbH6l5Vb23w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNZNu-004bpm-PV;
	Tue, 17 Dec 2024 15:21:18 +0000
Date: Tue, 17 Dec 2024 15:21:18 +0000
Message-ID: <86r066qqs1.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64 KVM host model
In-Reply-To: <20241206112213.88394-1-cohuck@redhat.com>
References: <20241206112213.88394-1-cohuck@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: cohuck@redhat.com, eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org, richard.henderson@linaro.org, alex.bennee@linaro.org, oliver.upton@linux.dev, sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-TUID: b+q520O4kbfM

On Fri, 06 Dec 2024 11:21:53 +0000,
Cornelia Huck <cohuck@redhat.com> wrote:
> 
> A respin/update on the aarch64 KVM cpu models. Also available at
> gitlab.com/cohuck/qemu arm-cpu-model-rfcv2
> 
> Find Eric's original cover letter below, so that I do not need to
> repeat myself on the aspects that have not changed since RFCv1 :)

Does anyone have a branch containing both this series and Eric's KVM
NV support series?

Asking for a friend...

	M.

-- 
Without deviation from the norm, progress is not possible.
