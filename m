Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4648708njc;
        Tue, 27 May 2025 00:46:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXd/VXEGPLJYhU/phT76wOZJscxToIHl1q86un+puNWMZRTMe57/sPuiUpbFsvEsYmbvpxUx3t/UFmRCg==@linaro.org
X-Google-Smtp-Source: AGHT+IFmmKcX+cR9mk8IIeqCVEF0gS3mJQOkDG1XnkaFQkMMY3opYzTZ7zI7XsVpKHAeqXCgP23r
X-Received: by 2002:a05:6214:da9:b0:6fa:a52b:d4ba with SMTP id 6a1803df08f44-6faa52bd514mr134605786d6.12.1748331963634;
        Tue, 27 May 2025 00:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331963; cv=none;
        d=google.com; s=arc-20240605;
        b=RN6kdXLPqepNQlOCO1t75f1kSzhWpIbZCU+kKyiCZtuo7oIvUMETTRspDCzNMNQySv
         ww1CMs4iaK2oTGiABpxHpt8ICh8zp/RHXUvJ2TsF2NeqNKSpSZaifnMp0kXh+g/7KGIA
         +XophEhvLKps/CESDwUm+XSwWKdwP5+8/zPRZFE0zByYxfx/xFv9IywSgzlsAoZImxez
         bACVLUUcKi0trHvgt1kpBtGDzrbJfih3yXDFZLbI8DXGEZmcO+C7SHKsgjHnqaq6C85D
         Sa4PebUCZQjj8UcB5wgcQ4q6HKDmcaWTQHQRteklBJTteLCTJeDAu2CRAlb/F5VDGMUw
         TS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:cc:to:from:message-id:date
         :dkim-signature;
        bh=KD59lERqluJYrWAcejmzmWvtafWORDVkIwNU499+OMU=;
        fh=+O50JsS4vWc52j1F4wsbvlEsrI5IXD+RDp1ibZlqZnQ=;
        b=Ao/xGj5nkQxI8hum3lx49G+pDQjeqELgtb5voJJE/VGXf7Zth2N3XEYVsjWO79rhsl
         xW4ZTd7DzfFBvzZ5m4MI/hrXgfD9ylG/BAjuB2xOz8G1FIxqoaO7X4DN2WOtQd7ScFEG
         jfpCp6dbm/rjcH2j73i0lJsuHqJ9DTapjYaTbvo4V+VLnFtlL2/tIYWuwz4xqRWBo7JS
         NK0omGe0hJEHpBKfCQ1iE1BK18lriB21tO5jAmId3kQrkXLqsiV50Je8/oe3/iWm3O4u
         Mc38tssREtPUBiv2Jieg+o1TZvTuVt/19a65vxGMcozhs8KYE677PphB0sJHnJVfUNYF
         YdRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=r19i3bnf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6faa68bb3d8si50179086d6.180.2025.05.27.00.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 May 2025 00:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=r19i3bnf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJouy-0004T9-3s; Tue, 27 May 2025 03:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1uJouw-0004QI-JG; Tue, 27 May 2025 03:40:10 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1uJout-00080u-Ta; Tue, 27 May 2025 03:40:10 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 790055C0598;
 Tue, 27 May 2025 07:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD77C4CEE9;
 Tue, 27 May 2025 07:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748331597;
 bh=CK7B+DLHTo9Tt6vVecvTlPWhG2Uet410/kYVZcNVpdA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r19i3bnfhXEIGnONmw+mwq8DwGvuRcbIcMWiLwa6Wj+ye6/TPEAih0I9GPXXAKaIh
 oTGkWZ0Y1z/c98c9xqeqNwFQv7mNZDSepoNTow/G1x5uTU32bYIAuT2qY7o3tm+Etu
 lwd/6Oxb1hGCS8EWrIq/hdI+EtOuLPvL6dRS+M2XQ4EQY+K+xYw7sZlsMzdS4yXPWK
 NbesYdPiFOWB3bMkUbTt7GgKDLk840xdW4qOQcS5jsw+LZB9a6EQO+31B0tHMePZMm
 APaGOcXRHPa8xhzgnsUcKibxsqUvn3r2a2p6nLz7LUnwfd+SwSkLUdlQm3OLo1vAgH
 iy5VFtmPLQ+mQ==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1uJoug-000nrv-0C;
 Tue, 27 May 2025 08:39:54 +0100
Date: Tue, 27 May 2025 08:39:53 +0100
Message-ID: <86msayec3a.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, gkulkarni@amperecomputing.com,
 gankulkarni@os.amperecomputing.com
Subject: Re: [PATCH v5 0/5] ARM Nested Virt Support
In-Reply-To: <20250527062534.1186004-1-eric.auger@redhat.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: eric.auger@redhat.com, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, miguel.luis@oracle.com,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=maz@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
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
X-TUID: GYLlc+RRTBZg

Hi Eric,

On Tue, 27 May 2025 07:24:32 +0100,
Eric Auger <eric.auger@redhat.com> wrote:
> 
> Now that ARM nested virt has landed in kvm/next, let's turn the series
> into a PATCH series. The linux header update was made against kvm/next.
> 
> For gaining virt functionality in KVM accelerated L1, The host needs to
> be booted with "kvm-arm.mode=nested" option and qemu needs to be invoked
> with: -machine virt,virtualization=on.

Thanks for respinning this series.

Do you have any plan to support the non-VHE version of the NV support
(as advertised by KVM_CAP_ARM_EL2_E2H0)? It would allow running lesser
hypervisors (such as *cough* Xen *cough*), which completely rely on
HCR_EL2.E2H being 0?


Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
