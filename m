Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1689522ocs;
        Fri, 30 Sep 2022 05:32:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Y8tmIbEFjVKOEStD6bGt+f1l5z+LwMD8bHrSis+Y1SYlUoF6ZqevUaxImLLvpISWn8/YW
X-Received: by 2002:a05:6214:d8a:b0:4af:b727:94df with SMTP id e10-20020a0562140d8a00b004afb72794dfmr3100704qve.122.1664541134352;
        Fri, 30 Sep 2022 05:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664541134; cv=none;
        d=google.com; s=arc-20160816;
        b=VVPvOE+qRgeO0srtlmycN6n1pL0V5jb+I9kygzTpFQKEPEbQBj6C6rP5NYDnK2WHIc
         jPYS+fp3OHDeTtWCybTQCx/f/smTT7Bn0ceT/cm/gf8/SPcs/eXNuJZPsXZVKRbjkSa4
         V5mQmxXq/2eUbEZJpbpAHPSN4QZKDPhb094xWt0Mdmzfe4px7UuG+TiyFoZS6D0SRRu1
         F8PLK3csfZ51oq0YUlmKcFK4HSD5GnbsehMXaMGYBDDykKnRRoLNtTqledGpZC3EnZ99
         Bdjn2E+QUGhbThIVtv6jDDnsmviWJbg9HI5PMVJjtvTyh6eRaR66zxPC6vRjmqWbtBMG
         Wruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:cc:to:from:message-id:date
         :dkim-signature;
        bh=qGVdo1g/GxUjWqjx09CRIGMVs/hXLtUOG98DsfTybxU=;
        b=D3FdPn9TFxWfnB6MXEjUYlH6y8szqLpFuYXu+uejKLT7lm8HO1boUpIytk13Qu82U1
         iB7zbd2wUlsrtZMTmIv1/nbCviW/ZRlrnJM/i2nASPRAcjRqyQVbGIPiFFYjw0iUqvro
         uM4HGzc4QvXjjzR4PDn9VryPTTeqx/xMWfbjqdXnZYM2T6oZmSMgzv3z8pe+sYAqdfzj
         4LNOJ75CrwOBJwF57iR6tUeNREpj3UAGcehLAHkSuo51K2K/eEBm00FocU7KNvtTByio
         4fDy0AVqatvzdMyVr0uNDs+SETfR1pfcZYe6t56xdn2coII1Hcg4osfUG/nNqFDXQkPt
         RUSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jK+XtVTG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ff13-20020a05622a4d8d00b0035ccd12f394si1040204qtb.70.2022.09.30.05.32.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 05:32:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jK+XtVTG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:34750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeFBd-0005PX-DS
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 08:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1oeFAw-0005Nw-Mg; Fri, 30 Sep 2022 08:31:31 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:42790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1oeFAu-00035r-Bd; Fri, 30 Sep 2022 08:31:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A4428B8271C;
 Fri, 30 Sep 2022 12:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58949C433C1;
 Fri, 30 Sep 2022 12:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664541078;
 bh=N4GyIeMxKmEL4Hw5rJ8L7AwCbUmYIOZB1pZfiNoF+uY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jK+XtVTGitsNsOpzC8RazBAPbsiE0a4oqewvEssLGBgt0aAcj0+wo9gxTBdXqyZCG
 svd9m3QXOz3WK+81byNQvkhk1L8HzZa7yYnzQWoHJnwr4T8jdSpQGYlkgXw0g9ctzU
 fD4hUtzoMa/9T0RY56TXGTTSSq35sCkjuybx9lrNoC+w2qcC4mZasO4pU3GYjQ8du9
 tb1pE1QMoSrVUZeAAQ7/l8tBZNN4zylyW4Uz3FJSefEY+yBOc7igPSyhZjPvnJERlf
 89h1PRsjb2ik3sr3SHcWkU/lNygiMD+NY4XNnieMk1/mqKkkV4E0sUU9AwWwYjkNEW
 1aCaME29OPFEg==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1oeFAh-00Dlan-Vc;
 Fri, 30 Sep 2022 13:31:16 +0100
Date: Fri, 30 Sep 2022 13:31:15 +0100
Message-ID: <867d1l6o30.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Vitaly Chikunov <vt@altlinux.org>, Eric Auger <eric.auger@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] target/arm/kvm: Retry KVM_CREATE_VM call if it fails
 EINTR
In-Reply-To: <20220930113824.1933293-1-peter.maydell@linaro.org>
References: <20220930113824.1933293-1-peter.maydell@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, vt@altlinux.org, eric.auger@redhat.com,
 pbonzini@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=145.40.68.75; envelope-from=maz@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cqv2QIkRfZfm

On Fri, 30 Sep 2022 12:38:24 +0100,
Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
> there is no pending signal to be taken. In commit 94ccff13382055
> we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
> generic KVM code. Adopt the same approach for the use of the
> ioctl in the Arm-specific KVM code (where we use it to create a
> scratch VM for probing for various things).
> 
> For more information, see the mailing list thread:
> https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/
> 
> Reported-by: Vitaly Chikunov <vt@altlinux.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The view in the thread seems to be that this is a kernel bug (because
> in QEMU's case there shouldn't be a signal to be delivered at this
> point because of our signal handling strategy); so I've adopted the
> same "just retry-on-EINTR for this specific ioctl" approach that
> commit 94ccff13 did, rather than, for instance, something wider like
> "make kvm_ioctl() and friends always retry on EINTR".
> 
> v2: correctly check for -1 and errno is EINTR...
> v3: really correctly check errno. This time for sure!
> ---
>  target/arm/kvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.
