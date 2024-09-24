Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2809990njb;
        Tue, 24 Sep 2024 06:01:12 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWppTrw1c+G7qRwuMd3KdGg1pFczz7BRHKjRX4iMNOpuKxzbQwb2cXu3AmeK0EkqBei2cZq4eO9HSEvTA==@linaro.org
X-Google-Smtp-Source: AGHT+IFIAo6LKSX48/hy48gweoRLg2f6fGz5WNBl863DBB0ESAwEQF9hcgPIJ9X6rsV2rCTjRqT/
X-Received: by 2002:a92:c24c:0:b0:39d:351a:d0a2 with SMTP id e9e14a558f8ab-3a0c9d90b95mr122543605ab.25.1727182871526;
        Tue, 24 Sep 2024 06:01:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727182871; cv=pass;
        d=google.com; s=arc-20240605;
        b=RJP7nqsriBiin/HegqmO/NtBRJGksIawiJk5bnoMOf0YbAycuglwpzNfO7wOUFPZte
         QC2SlHng15EZwxfydUWwzIj9uRb0JLGN8ZhADCeeySJZptQXKXvju1Ua18wKeKSzc2K/
         5denO5yZYAKwQaz9k+sFnkV7kuIFZwrovdkLGgd2tbarY8lAPf3K0KLWg+9EIs7gz9DB
         zrp4HRHuTg3zHXlUxlUhxUJf8OWn/oWY7J/fkWeDyn/3LefW6AYNIELUYZcgvo+ZHHKP
         JJfQ6JS2YR29qm6cCcWKmJnxBNyysKL5fIKxnfeQMPiS44HNgyTwq7IaT+NJ1j0s8Xan
         EBTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=mCupmcKMCY+oqtRjBXY08oP5mqol/tklMiOApP30G54=;
        fh=AOCC5tpeye5ckJ/ySRwTpsf+mLJ6bqpyTzU5DWRpiMQ=;
        b=b0XhFagnYETgTDSxZIC9Fx/OQ02ic0g3Dwn8+/AJSxFM/etCbkpm7q9EbezrD+4MYD
         IoALtb9TcGSF9RyUCKYMTI01G6oQdGucPbvjGh1Xat/vn+AVX5/wS9otxVfrYyu3WR+B
         8QCChYIYCiJZr/f7gje7nD9MzzfwYju+/LvPOqjKwPnXjM6m2DiPEmARD7QLE+gEcLSS
         cnHlvMKGzXRshr/tAd5jmIwjurl0nxRmaTQlcokT10Iwimnz/XfG+Pl1eXT+d+wo0yxh
         bJF1JXLwfMDQw8CSpdKNxbJ+oOMc5VA5aRLP1iHg/uR3eSPKsVHzflTH95yq4B1e/g3e
         Tm2g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=EZOrhIEr;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-27372-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-27372-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-27372-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7e6b7c8f5b9si1502702a12.362.2024.09.24.06.01.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 06:01:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-27372-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=EZOrhIEr;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-27372-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-27372-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C905E2845E1
	for <alex.bennee@linaro.org>; Tue, 24 Sep 2024 13:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5A615575C;
	Tue, 24 Sep 2024 13:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZOrhIEr"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7621B85DD;
	Tue, 24 Sep 2024 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727182866; cv=none; b=OW/9YVpJ0/W1rjrA2dWemWZPYWGqtDHf6JZ8N9awCMY1SGFipNCiLe1CrdWILwUl319GrbIxQljE5R0DDfnztN8XDFkMtdiYlGrFy/bPn2ntaevCyImMm6dd1jE+NR34MwCqQ73DqRhBw+Q6uIxGPgIw3GQ+sd32kqyBsR3/dM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727182866; c=relaxed/simple;
	bh=OakmT0sLzny8R4JiJYYxGXCumP8RVBEVBkER1UAFCqc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ejbNbUrblvOlBkT2UTme3J744XnPE6YNG/Si5R3Ik+OZwPaNHPC+8AArxBKTv/19MpAWkXDLH6wav4Vit0MuQAodIqNsitULIdEURCa9oqW1kOcjXezCvMz9hK0YxZ642ssG9w6NuLF4QmIeZ7zC7R1qmAwYMwlk+0XA+UJVBJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZOrhIEr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF214C4CEC4;
	Tue, 24 Sep 2024 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727182865;
	bh=OakmT0sLzny8R4JiJYYxGXCumP8RVBEVBkER1UAFCqc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EZOrhIEr2zgqlMHomrBGjn4qf2AhbOE/5eB6mnm/2fuMtMJ+ZgpprUbomnoTqy7hw
	 r845phN3j3ryzwrH2oXkLMqqrumYvGXzTZfHVZpbDthcvk5Co+iBR1CYw9D9ouqE/b
	 S2vajtRzNG2NBx7rDe9ELDr3c7gwBmoPDeYzuRcPQ0lsg6xuk9/x5ydgxqIxvHhA3H
	 NyvraLkHZlKLx73aIrpNLGuZdvHu0WCxU4h4Xkjook5JGxWETUEEvm6Pa44qnp0Xj+
	 y+D8ma5QUUc8fVqqVHPKUHghpVWrRgPY/uBJ+hDsN5SDWocjSK8eIxfOXB1fnjliL8
	 UIHsflQBF+d+Q==
Date: Tue, 24 Sep 2024 15:00:58 +0200
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
Message-ID: <20240924150058.4879abe9@foz.lan>
In-Reply-To: <20240917141519.57766bb6@imammedo.users.ipa.redhat.com>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
	<20240917141519.57766bb6@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: GLbhD8Zpk8ur

Em Tue, 17 Sep 2024 14:15:19 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> I'm done with this round of review.
> 
> Given that the series accumulated a bunch of cleanups,
> I'd suggest to move all cleanups/renamings not related
> to new HEST lookup and new src id mapping to the beginning
> of the series, so once they reviewed they could be split up into
> a separate series that could be merged while we are ironing down
> the new functionality. 

I've rebased the series placing the preparation stuff (cleanups
and renames) at the beginning. So, what I have now is:

1) preparation patches:

41709f0898e1 acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
5409daa41c78 acpi/ghes: simplify acpi_ghes_record_errors() code
2539f1f662b9 acpi/ghes: better handle source_id and notification
3f19400549c1 acpi/ghes: Remove a duplicated out of bounds check
f0b06ecede46 acpi/ghes: Change the type for source_id
9f08301ac195 acpi/ghes: Prepare to support multiple sources on ghes
2426cd76e868 acpi/ghes: make the GHES record generation more generic
3fb7ec864700 acpi/ghes: better name GHES memory error function
1a22dad3211e acpi/ghes: don't crash QEMU if ghes GED is not found
726968d4ee20 acpi/ghes: rename etc/hardware_error file macros
f562380da7ce docs: acpi_hest_ghes: fix documentation for CPER size
69850f550f99 acpi/generic_event_device: add an APEI error device

Patches were changed to ensure that they won't be add any new
new features. They are just code shift in order to make the diff
of the next patches smaller.

There is a small point here: the logic was simplified to only
support a single source ID (I added an assert() to enforce it) and
simplified the calculus in preparation for the HEST and migration
series.


2) add a BIOS pointer to HEST, using it. The migration stuff
will be along those:

c24f1a8708e3 acpi/ghes: add a firmware file with HEST address
853dce23ec39 acpi/ghes: Use HEST table offsets when preparing GHES records
c148716fd7c8 acpi/generic_event_device: Update GHES migration to cover hest addr

Up to that, still no new features, but the offset calculus will be
relative to HEST table and will use the bios pointers stored there;

3) Add support for generic error inject:

f5ec0d197d82 acpi/ghes: add a notifier to notify when error data is ready
f5e015537209 arm/virt: Wire up a GED error device for ACPI / GHES
3b6692dbf473 qapi/acpi-hest: add an interface to do generic CPER error injection
620a5a49f218 scripts/ghes_inject: add a script to generate GHES error inject

4) MPIDR property:
2dd6e3aae450 target/arm: add an experimental mpidr arm cpu property object
02c88cd4daa2 scripts/arm_processor_error.py: retrieve mpidr if not filled

I'm still testing if the rebase didn't cause any issues. So, the above
may still change a little bit. I also need to address your comments to the
cleanup patches and work at the migration, but just want to double check if
this is what you want.

If OK to you, my plan is to submit you the cleanup patches after I
finish testing the hole series.

The migration logic will require some time, and I don't want to bother
with the cleanup stuff while doing it. So, perhaps while I'm doing it,
you could review/merge the cleanups.

We can do the same for each of the 4 above series of patches, as it
makes review simpler as there will be less patches to look into on
each series.

Would it work for you?

Thanks,
Mauro
