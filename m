Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp99716njb;
        Tue, 24 Sep 2024 21:26:13 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVS0Ati99oDVuRQ68dHb6/rj7jTKkVruK+DPRnApW6S/BB6ha84bTmNNejbkiDsuNH6P+ip7T+PHlekvA==@linaro.org
X-Google-Smtp-Source: AGHT+IHiV/M3/HSy7RaZOGoB/bKxfOuhc1Yws7LZIKe6UX5UNJWfcX+Zb5Mw2br1RcNT3sef8lft
X-Received: by 2002:a05:6a20:6f8c:b0:1d3:b48:ee29 with SMTP id adf61e73a8af0-1d4d4aadee5mr2285043637.12.1727238373177;
        Tue, 24 Sep 2024 21:26:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727238373; cv=pass;
        d=google.com; s=arc-20240605;
        b=ThGxZC11Dmo2s/OIMmux5ahYO6UISUrTkYO0doEo+j0gfBpkShc5ny+9Vb5fqSJtK9
         zG9QI3mQZkv+6TuCDGK74P4CkpSZev8chQOyIbMOfjxAo2Lgo8SEMXWENHzflr4uVSf2
         7wzVAhx+U4VqFwwTbRPlZ4tZoRs3TPldRUzQn1zLjO2ulvmCSpVj9qiGzMXmX6/2uI5d
         yLqoG45fWX4UXAk8YiyyLIgFn61ELuKHND9gGsPPyfU7GtkkfCgZ9CiaG8rC+n+jMOS7
         qrVg0suD8xnmUdds3gCis7D8dWCOlVi7uWxmt98JfoKurdBqjKSVMe+8fIvv1JdWHo5/
         X+1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=rU6IesOVAtG/aH5kyEH4GX85NMvzIlVOfRyjtNdJ1Rg=;
        fh=AOCC5tpeye5ckJ/ySRwTpsf+mLJ6bqpyTzU5DWRpiMQ=;
        b=IRGPxzHK7u9XgiTC6A8N2P66PXJd/jsABXBKJKbecw0TChUMHiszbWzKWeR0hdHqjO
         4/Ktkqk4ffZfxtS2Nz+4V5aE4E80tkyhc8QeYhG3JOkUKh86dEQbURZ5XxhX1IncoD7I
         rXCvSkIo5khGSPYEaNJdwccTozAoJaQHdf+okp+Xua+W2LQKVoJdI/uwmkrxRdjZtkY+
         WqEQWkO4WA+CvycFM6pUo1RXjbUPLcbMNSoA16zPfkC9nIa8fr+zlplPzB9TEnXxm1vV
         xUzlAhVwGDEfEKGm4Fl6i6BF6KOVJbJmHY/+9n9Uvz4Q6k0WsbOZ+X9K8Dk93zTV2Y/P
         ChnA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=qfvajQ7W;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-27405-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-27405-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-27405-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7e6b7c994a4si3012667a12.326.2024.09.24.21.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 21:26:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-27405-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=qfvajQ7W;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-27405-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-27405-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B827F284D7B
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2024 04:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD2814B965;
	Wed, 25 Sep 2024 04:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfvajQ7W"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB7713AA53;
	Wed, 25 Sep 2024 04:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727238368; cv=none; b=iOx9+KBbF8RuYZaqxSMx16Li8IvNw+nwYd2ZJUfiEQGhbWa7VdxFY7eU0Cm+o7QDiwsncWkA3Hy5yCE7XHA+dEdq9eSm5Qk3/c3NjiqEjgfxIXnTtK8RqhSQZHvM4MBoaEqrjORFyaozKEG/5Bn0Yp2KuI1CxGWvrbPmRmcEdGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727238368; c=relaxed/simple;
	bh=Ynfd0JRm++Nr2Ee+rhT8wlroxPnjzYV/SOrelhCelmg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=efdKDIBKG9OjKdU0qIDU53Xx5Kth6orZz+oi4vUandOhwq+fkSsVvqDpUeldM3wjCAeSgxVX+Ba0JCcXQtr9oVyP975wcK5/tn8TfWerj1h3jlbfaximKO9kC4nblPR/opyPIl8n2BL+whpVz4Ij6G7J9VSCf8+7ZIF+fSlMJNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfvajQ7W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A92C4CEC3;
	Wed, 25 Sep 2024 04:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727238367;
	bh=Ynfd0JRm++Nr2Ee+rhT8wlroxPnjzYV/SOrelhCelmg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qfvajQ7WG0ypVLqcmpWxo+kxj698Cwbnm+r/0YhOX3PEe3PnWkgW57a5A2eo0Ee7D
	 B+LuTdFM+97a3BW1idyWzlu5ciUFDocJ+JUeYlmNmsb/8pEGOB4tYpXYdqzcIDnTCZ
	 L1PHsV5f8TUQQpB7xX/T3CavZr5mhYoyJqYzLq541F/A6Y5AkdSM7rFkHfAqVNVtUo
	 D5GK8ONk5257ePVWiM1eM8/8pndgpG6cmHbmVeZEtGDYE4cboH+ahc6ZQfzn7W+xyC
	 PJ53wOCz70H5DQYV8woUPwZYfC9fHOSyTq8K5uat4f5y7bnp0zP6l6fsm9biw6giaB
	 +kSl80LgePvqA==
Date: Wed, 25 Sep 2024 06:26:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Eric Blake <eblake@redhat.com>, John Snow
 <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v10 00/21] Add ACPI CPER firmware first error injection
 on ARM emulation
Message-ID: <20240925062600.7cbfeb19@foz.lan>
In-Reply-To: <20240924151429.3e758b38@imammedo.users.ipa.redhat.com>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
	<20240917141519.57766bb6@imammedo.users.ipa.redhat.com>
	<20240924150058.4879abe9@foz.lan>
	<20240924151429.3e758b38@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 5S506P/7MzL8

Em Tue, 24 Sep 2024 15:14:29 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> > 1) preparation patches:
...
> > 69850f550f99 acpi/generic_event_device: add an APEI error device  
> this one doesn't belong to clean ups, I think.
> Lets move this to #3 part

Ok.

> > The migration logic will require some time, and I don't want to bother
> > with the cleanup stuff while doing it. So, perhaps while I'm doing it,
> > you could review/merge the cleanups.
> > 
> > We can do the same for each of the 4 above series of patches, as it
> > makes review simpler as there will be less patches to look into on
> > each series.
> > 
> > Would it work for you?  
> 
> other than nit above, LGTM
> 

Ok, sent a PR with the first set (cleanups) at:

	https://lore.kernel.org/qemu-devel/cover.1727236561.git.mchehab+huawei@kernel.org/

You can see the full series at:

	https://gitlab.com/mchehab_kernel/qemu/-/commits/qemu_submission_v11b?ref_type=heads

It works fine, except for the migration part that I'm still working with.

For the migration, there are how two functions at ghes.c:

The one compatible with current behavior (up to version 9.1):
	https://gitlab.com/mchehab_kernel/qemu/-/blob/qemu_submission_v11b/hw/acpi/ghes.c?ref_type=heads#L411

And the new one using offsets calculated from HEST (newer versions):
	https://gitlab.com/mchehab_kernel/qemu/-/blob/qemu_submission_v11b/hw/acpi/ghes.c?ref_type=heads#L437 

With that, the migration logic can decide what function should be
called (currently, it is just checking if hest_addr_le is zero, but
I guess I'll need to change it to match some variable added by the
migration path.

Also, in preparation for the migration tests, I created a separate 
branch at:

	https://gitlab.com/mchehab_kernel/qemu/-/commits/ghes_on_v9.1.0?ref_type=heads

which contains the same patches on the top of 9.1, except for
the HEST ones. It also contains a hack to use ACPI_GHES_NOTIFY_GPIO
instead of ACPI_GHES_NOTIFY_SEA.

With that, we have a way to use the same error injection logic
on both 9.1 and upstream, hopefully being enough to test if migration
works.

Thanks,
Mauro
