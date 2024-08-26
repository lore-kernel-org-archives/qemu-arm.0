Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp902328njb;
        Sun, 25 Aug 2024 18:53:55 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXQhYEua2C/LqoR5VAn9iDwh3TWAJVn5AlzSTBYjolEVvLdfG7666nvNk642Z2VPk+M6O8Kd1HmjGc5xw==@linaro.org
X-Google-Smtp-Source: AGHT+IE8zsKsiZ2p8EJiLdrQkU8TuaC6cZscsHnzGZ2ecxMja0BfdnSPTKw1ygR2YeTHjG1/Owpd
X-Received: by 2002:a05:622a:2b07:b0:446:58eb:5ca8 with SMTP id d75a77b69052e-45509c33cdbmr121112021cf.27.1724637234952;
        Sun, 25 Aug 2024 18:53:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1724637234; cv=pass;
        d=google.com; s=arc-20160816;
        b=AbZfQtfCnuvOgik0gIJh/w2PITPc3QbiJBQGnF1Bi4e7dnQGiQbXBSHAcIv0xhnaRS
         12EL+knkqa6H1curv2UU8bknvAv54sny/lxrc8Mfh1zCTguf05wpDoh2mUhlSk6/OTmn
         crSwnoSm4sWIvInzr7NtmZnzUX1I9AInoGdriuwi2+dsozMfhQvrZG3ZlvHjvXNMPv1+
         +1eNoTRsD4VM6wp0ZQL0F15N+uTi2iJNMWhCSoQwsB09USOwyZA7t42jy63AQTFs/Vwf
         sSz8F/DE3pJCZ8+TXZd6/OkCBGfJ9esT+8DlHYQYGw6lkgjd7i5wzfvrWjz1KI5kYgJz
         GcfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Kpv4jNStwyWbqT5J45KaNbteDEiaQs4xrz2/IK3PApc=;
        fh=1bMal7ZNSX/lDuqHQwwjFV4AB4ocwHHpWUn+K9h0zSg=;
        b=L+gl37sn39TnPScLJvO0mqXHCMQcLLIWPTyAT1n8hIXJk/9eEdWc7Nk9+puC7scN/n
         Vpbm2uRekOuf080d7T83kdc+RtderCgAEbhEGAA/vxnrAhCMwgpBzpREa5JtGkmhZxds
         d0A5qsOhbvp0dXKYXWIIpJgb4r+qM4mHzKRKqaLWmOZNJxLUFDHu7S63eWVklI78PyiK
         zr0SweSkdwSrfuWthFQYPg5zZUQKt9fMEq/nCHt8/GeoykTmIZCkT/CdDJZ+afC+g8MV
         IsSyQNILGQ1hyzpZmMGTdGDdn28cWO4kHRBW3mHN55UpTRi8UrxB3S+cCdvSDnmBtAcG
         3eIw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="N5ps/gIC";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-300641-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-300641-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-300641-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe1efd6bsi93806541cf.475.2024.08.25.18.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 18:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-300641-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="N5ps/gIC";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-300641-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-300641-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 984971C2089F
	for <alex.bennee@linaro.org>; Mon, 26 Aug 2024 01:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2523079DE;
	Mon, 26 Aug 2024 01:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5ps/gIC"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7D07489
	for <linux-kernel@vger.kernel.org>; Mon, 26 Aug 2024 01:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724637229; cv=none; b=GHmJ1V1OwIVaN14A/0QVLjKWZ0w6a2wzwpCxDIByqA4sKkLHBLVVP/fuDjEXFATXlS6abDel4faLmE4FbRlj3AoxSPBWj9a+x7o08Tgf1l4+jClbAwThzWc2/DxLpaSekVlV4j1rJ5Y9GsjcYw1045r4ujzisTvnVZ1Hlfex5DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724637229; c=relaxed/simple;
	bh=ebMyJy8EwG4eBNP+/2Ms59r287zOgET9dUx6Qw6/Jkg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z6oXBWXJbyOeFzwI05sU1JfO2pJrfmQrgF1wjHIEEAEXAOp1u4w7JFLQBU+N1wxNBdQ6IfqkCEiB/8Ebtm1rCJK0oDh2e69damf7acZfm9a4Hg0jz2SbYQbtiz92nTAxQVsfWwpfIVtNwWiSHwY3bj/Or+9qX+M/yLs0h79dip4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5ps/gIC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3608DC32782;
	Mon, 26 Aug 2024 01:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724637229;
	bh=ebMyJy8EwG4eBNP+/2Ms59r287zOgET9dUx6Qw6/Jkg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N5ps/gICmyo/YFf2tf8GtWWGdzv0Of5jVXGPEYqZgIQGZ0IOA9hnVxQaBE5h2fjBR
	 FplQ7OSzQZpTNiJvJBwvExcBlGw9LLbD0BwON6dTLrdpLJydmem7Gie9OMN/Xvqsty
	 koraxE3fQP9rUjrhruBqpQR/1y19ZirU6pY1/jiYrp2BnJ1o5lgBvDEocOHA30Wtza
	 kgA1lGHcwNKkimze5QpjCDTaHuHXNpLzSfxG5JbwmwTAzukF7p2tKjZwrJjD11V4Jy
	 lrj1cfSajLh9jBZ9IFM183HqxVfChoibrswzkwa/qSHYkV+x2o1LKvb7VRB0mqBg2Y
	 M9dt9obqND2bA==
Date: Mon, 26 Aug 2024 03:53:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v9 11/12] target/arm: add an experimental mpidr arm cpu
 property object
Message-ID: <20240826035324.6b1edcc7@sal.lan>
In-Reply-To: <CAFEAcA-OaQ1ypa7LXz5nOs+6+fjmYNHzNL0VVgapoXEHU=rHnQ@mail.gmail.com>
References: <cover.1724556967.git.mchehab+huawei@kernel.org>
	<b88fe895e6f71711387ca153f4f1b3fbb0aa2176.1724556967.git.mchehab+huawei@kernel.org>
	<CAFEAcA-OaQ1ypa7LXz5nOs+6+fjmYNHzNL0VVgapoXEHU=rHnQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: pTwd0Jn9qB08

Em Sun, 25 Aug 2024 12:34:14 +0100
Peter Maydell <peter.maydell@linaro.org> escreveu:

> On Sun, 25 Aug 2024 at 04:46, Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Accurately injecting an ARM Processor error ACPI/APEI GHES
> > error record requires the value of the ARM Multiprocessor
> > Affinity Register (mpidr).
> >
> > While ARM implements it, this is currently not visible.
> >
> > Add a field at CPU storing it, and place it at arm_cpu_properties
> > as experimental, thus allowing it to be queried via QMP using
> > qom-get function.  
> 
> >  static Property arm_cpu_properties[] = {
> >      DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
> > +    DEFINE_PROP_UINT64("x-mpidr", ARMCPU, mpidr, 0),
> >      DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
> >                          mp_affinity, ARM64_AFFINITY_INVALID),
> >      DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),  
> 
> Why do we need this? 

The ACPI HEST tables, in particular when using GHESv2 provide
several kinds of errors. Among them, we have ARM Processor Error,
as defined at UEFI 2.10 spec (and earlier versions), the Common
Platform Error Record (CPER) is defined as:

   https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html?highlight=ghes#arm-processor-error-section

There are two fields that are part of the CPER record. One of them is
mandatory (MIDR); the other one is optional, but needed to decode another
field.

So, basically those errors need them.

> Why is it experimental? 

This was a suggestion from Igor. As for now the QAPI for external
error injection is experimental, It makes sense to me to keep it
experimental as well.

> The later patch
> seems to use it via QMP, which I'm not super enthusiastic
> about -- the preexisting mpidr and mp-affinity properties are
> there for code that is creating CPU objects to configure
> the CPU object, not as a query interface for QOM.

I saw that. Basically the decoding by OS guest depends on MPIDR,
as explained at the description of Error affinity level field:

	"For errors that can be attributed to a specific affinity level, 
	this field defines the affinity level at which the error was 
	produced, detected, and/or consumed. This is a value between 0
	and 3. All other values (4-255) are reserved

	For example, a vendor may choose to define affinity levels as
	follows:
	Level 0: errors that can be precisely attributed to a specific CPU
	(e.g. due to a synchronous external abort)
	Level 1: Cache parity and/or ECC errors detected at cache of affinity
	level 1 (e.g. only attributed to higher level cache due to 
	prefetching and/or error propagation)

	NOTE: Detailed meanings and groupings of affinity level are chip 
	and/or platform specific. The affinity level described here must 
	be consistent with the platform definitions used MPIDR. For
	cache/TLB errors, the cache/TLB level is provided by the cache/TLB
	error structure, which may differ from affinity level."

Regards,
Mauro
