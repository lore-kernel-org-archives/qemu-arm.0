Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp316375njb;
        Thu, 27 Feb 2025 07:51:36 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCU8r6oG+h/8J00Sz4mz4F2/WcgpGZJOgTQ/KgabsqEIcA5tPbuvZb9DrAAlJ8MzRoLGtkZTvCl9hZR5VA==@linaro.org
X-Google-Smtp-Source: AGHT+IHeR4LSj9868RMWH+wgC8DVMN82ARV0NOoF/gf82sQbtwzhu1AIhT/IG+YR97h3eA+gKMDQ
X-Received: by 2002:a05:6a00:228c:b0:730:8ad5:90c1 with SMTP id d2e1a72fcca58-73479101286mr19537696b3a.14.1740671496606;
        Thu, 27 Feb 2025 07:51:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740671496; cv=pass;
        d=google.com; s=arc-20240605;
        b=CLLl54jWp2FmnY0cqZ1Vg3y9cMGGbVE8kldf28jWTu08aOLb5RRJnE8kVvBlwnrCPi
         3+OM8+FOUTiGhdxSbvBY1/bAU+4Zi+YwZ9fNFAIt1HgUi+MAoxUvP2N9OXv+4dLU49BN
         Eys9Xyw6ZnI4t71CsWEByhJ0QlSI0KiGpriRMg5md54lx3w1E5CXMKh48viXmtHBuLnC
         /dLuqp7Svzyy3e9tJq3JEsENT91yP+gDfFZrrS/OO/D9SsigLAwbwIFsKiZH6QUqWKRZ
         TI2KiVcW0ovqn4LCAVRpFfEqjPfMFiC33p309uFBiQMf0HBQn5rmfuoyU5GlphYqYXoX
         9ceg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=GBOZo1OYXLFTgw9scfIGbEjzc35W1vPTsa38B4QCRtI=;
        fh=M1mtX7cZi0t85VQR/mcECo+lXmLxQopat7cygInhRIE=;
        b=UH0i0AmnRq/+qJbvfZ0lNPk8ARjPtThFCrkG9jKVyuQ+N0EdhfIBJwp+/s3jmwCU7n
         RQgG1VurJVoCNLYLkQlDUZojezanNsSZS7RRh0c7oaGg7gXCaWH3ecRMeSGIxYN03e/Q
         0hc00E6odbsxJmpa307V49XU+YfvOIBEKXGUH0ZArTNDxpkpnarOU4SG89uG4KeIzSrK
         zdU45uZsMiqilGYJZkEtMz0GHYiubIfaD+/p625OZa5e7ZPSr4bdENoWFGd0jZuxAXXP
         xc9BFn5vzy+YefkE7taC5VhncRq9Cdgu1snP5Yvun757ED2BEu1vm3kJ/aG5Ge+Ng1je
         UG0Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=vI9s8NCS;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536732-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536732-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-536732-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d2e1a72fcca58-734a0060141si2526085b3a.275.2025.02.27.07.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 07:51:36 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-536732-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=vI9s8NCS;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536732-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536732-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FD523AC4EA
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 15:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305F718E743;
	Thu, 27 Feb 2025 15:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vI9s8NCS"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CDB27002F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740671490; cv=none; b=gPvGCZf+r2rsocMRcCTCIY5zi1Ft+HiXj+SCiEfJq5px5yE8EEafavIKAPlLZ1TMLdfWd7GhMcVnhqthSP/Ii28ExWBnDSG7T0SXjLsXIFESsZ/Rc+BW47jT2gk87lEkSY/Q2rDOzpwEXoA2CQXx4nHTmDJeMTaTcghNpMHfIhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740671490; c=relaxed/simple;
	bh=PHJN1RpbO9GMEWPKvKo8ZGNRDOt2AAgARtGo6eeodlE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uTyhkIQf4hkiaU5myHg4dt/bQ+w58NkK6gSlRDMiZcmAgPG8OLpQKdwhRWQDvyMFBgaW15Ibn+AdsO/Y9zfEMUGl0Ix5tPI6exQt9Qhr736tDjGstXGiX2o4sSOpOdkbUVxCe/RKkBnqgr43IzXD67qk4JEZYgi6VEFs+GFOMQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vI9s8NCS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE05FC4CEDD;
	Thu, 27 Feb 2025 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740671489;
	bh=PHJN1RpbO9GMEWPKvKo8ZGNRDOt2AAgARtGo6eeodlE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vI9s8NCSEzDAoFvgPzU1qh5MCL9IOBnnspb+eNUrxnLkhf8JsddPi7oSkjFfPjdI1
	 36YsEp8HvfILAwdOPXaN6DLjMezy2xilcZCbXtAeR2VTO2bGL4Vlo5oPsrGw+kjDfH
	 2a02Gg/aPOJixzHrYEWwHxo1pG9SL9NFuHTfqLNrf3qeQ4Cw+MRZAO26/K3CBstNGb
	 M/Dp6nvD8ugZZS4rF4ZjvIWh7qXSrtMjTIqGI8mSBdlLm4HqHtcxLJQnT3JGPrzb1U
	 wS1A9QkcES7PtlX2rGtFKxjWtkDryIF9jLsXaW+NLE9Ee0QB9ZuqdHi05X1ndpA9I6
	 I3VH7J7Ec9jwA==
Date: Thu, 27 Feb 2025 16:51:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 17/21] tests/acpi: virt: update HEST table to accept
 two sources
Message-ID: <20250227165124.221ef1b2@foz.lan>
In-Reply-To: <20250227141603.3957e78b@imammedo.users.ipa.redhat.com>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
	<9d57e2a6ec3f523eb7691347403f05ad40782b94.1740653898.git.mchehab+huawei@kernel.org>
	<20250227141038.28501d73@imammedo.users.ipa.redhat.com>
	<20250227141603.3957e78b@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: f74jQiB6MOND

Em Thu, 27 Feb 2025 14:16:03 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Thu, 27 Feb 2025 14:10:38 +0100
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > On Thu, 27 Feb 2025 12:03:47 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > 
> > squash this patch into the next one
> > 
> > Also at this point there is no visible HEST changes yet, so a soon as you remove
> > white-list without enabling new HEST, the tests should start failing.
> > 
> > I suggest to move 20/21 before this patch,
> > as result one would see dsdt and hest diffs when running tests
> > and then you can use rebuild-expected-aml.sh to generate updated
> > tables and update them in one patch (that's what we typically do,
> > we don't split updates in increments).  
> 
> on top of that,
> it seems the patch doesn't apply for some reason.

Hmm... perhaps the diffstat that I place here (produced by bios-tables-test
output) is causing some confusion when you're trying to apply the patch.

Any suggestions to avoid that?


Thanks,
Mauro
