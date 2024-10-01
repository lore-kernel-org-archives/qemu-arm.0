Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1644841njc;
        Mon, 30 Sep 2024 22:39:12 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVLdcgCEg4xLv1DmGasW2cWrA6C2h2sO+VESUdZfJwSsZYp1m1SBqTHcr/8CFYnZFISkCR2dTf54672rg==@linaro.org
X-Google-Smtp-Source: AGHT+IHgrspWYLLfSFYG1t1OZGwcGiUTTglY5GhxFJ9avC1yec5W9LW+n8ZwpF3UGuLF5NaGXwvA
X-Received: by 2002:ac8:5fcb:0:b0:446:4cc5:523d with SMTP id d75a77b69052e-45c9f20ea6bmr190873651cf.20.1727761152638;
        Mon, 30 Sep 2024 22:39:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727761152; cv=pass;
        d=google.com; s=arc-20240605;
        b=QV6DiC1dmxFwJ5nGvqNfk2smIFBXnR7vfLcAD1RSDPSQPDGCW8HDN5yOLaYYgV6ySl
         yYhIN59CUd7gq5aMD9CWu8dW9Ma1JQGP0lbJLfcpnjel9Vhy5ZrOgNZ1exGw1YPBNnaw
         0VDlCDgc3l7xi/xOT9j+PQ/G/ztnZ46OZYna0hiUAGdIhpbVGxOUUQgfJRE5085/QBGs
         QN8atwtm8avdP4VxxDF/kNwL8VmOhFXPJ8yRdu/YZyvVyaRwCKMW3/yeBG8kCqMiNjUK
         leRCD+3qKQOMq8U4GMqhw8NQgV+Tk0vLbx/AeE0+SVBqQEy7q1CF8rmzVozT2oJzEHN4
         E01g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=mQvsFqy0oZQ3iXK+rdh3SXfWl0kGiWSAaFElUr6S+yk=;
        fh=j7GA3EfRet1H7jTzv9UDgZNjw8MUZeXqIU5NskuDe5w=;
        b=CgBndxrmt8LW/PYN66yR1Jv2xNiK4RCf8FD5L2N+ZU+YFUR3vCve0SI2kYluUuAPjy
         S6dHvf9W0D5fMi79TPQ8By9Yje70iRJwEhYlW345lQwmj7iD7rAtNEtDopEmqBv4sfQs
         JcIY8td+XSbpJByWtZJqQyK/GBE3g37jEhM/ac1HVlJjHU2CQYnMr93UvLr1kvgVF+Lr
         6ZBp9LB51dCphszarLxmdP0fCElJzZ+F+v395iEX0auMm2a4qDP1WGuPHzNolRYhhLJv
         /Y7TuiFeFENbnkze2OlgRYS68n3Ru3isr+UbgYmN8p1K9MQOUBOjDrOpkaj45A794aZs
         1kig==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MLft1ETq;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345262-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345262-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345262-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-45d6945af36si29928991cf.352.2024.09.30.22.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 22:39:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345262-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MLft1ETq;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345262-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345262-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 486501C229AD
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 05:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAB51BC074;
	Tue,  1 Oct 2024 05:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLft1ETq"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45801BC073
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 05:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727761100; cv=none; b=nbLM+fZuK9ArAfiTX993grKvl/eToV+xjkoqtXUlHXjrDGqpSmJAJedW4MZeHPLA4tnprFL06VfkIS5Zpy6WGRDavu5RU/uKv1my7OXBZCW2LZ8S5X5PFn+TrqHsC4qNkgqKK1CRmW41hHMX/GuE6fPHDH7b9j3jkA/v7z+DMvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727761100; c=relaxed/simple;
	bh=KWHKsBqafASDIcbljdst2Hf9v1Awn2C+S3J8HKqz9zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tp4ajOxKdn4fPzixhtdHnZxuVzPh8SrV30kY7H5/8zZ2V1q4JgiYhjYQZASNw6i/3qgCuCnXsTqDMD/CSp0L4WnDwWc4RVp4BXu1rYtLi0doXza64LspBb2iCOispDuwB41KMHocqvJMoee84eGQiCWTmPDw4aq6EJbC2h2XwXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLft1ETq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D3EC4CEC6;
	Tue,  1 Oct 2024 05:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727761100;
	bh=KWHKsBqafASDIcbljdst2Hf9v1Awn2C+S3J8HKqz9zQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MLft1ETqhuR+CYOGxey7FAl9KzwHTi606ejrkAgQUwX7PmST7+XdLxQsxu81hzqFp
	 lbqfLgzQcXbzq62hbSkx7gRbHG+deOfHSZcRy+GXp5V2xxQm1VFR76SnvZxZavastI
	 V7hhwfbkTAVcQPcu4p5QLIF++ZP+XV5ynbXuw21zKcNuj+X7WU9CTSMMUJLcagtHjT
	 gN3yePvGSk2KFs/WxdRlNYvgf3RErGl5vM3Aj5f2D3IgSYvE30G0bFMWgb6lm8uzJJ
	 +HwwF6pel/0q7SPIf7EgtZ5gdkmBtKwcLYMQoO6D9mz79ZiGKawjrqF9YETS2KsEr2
	 g9q0ZSNfe5Acw==
Date: Tue, 1 Oct 2024 07:38:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 10/15] acpi/ghes: move offset calculus to a separate
 function
Message-ID: <20241001073815.4720a986@foz.lan>
In-Reply-To: <20240926130348.00005e45@Huawei.com>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
	<5e8c2f0267a21d05ed09c8af616a92d94638c474.1727236561.git.mchehab+huawei@kernel.org>
	<20240926130348.00005e45@Huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: oIyllkHTtlE8

Em Thu, 26 Sep 2024 13:03:48 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Wed, 25 Sep 2024 06:04:15 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Currently, CPER address location is calculated as an offset of
> > the hardware_errors table. It is also badly named, as the
> > offset actually used is the address where the CPER data starts,
> > and not the beginning of the error source.
> > 
> > Move the logic which calculates such offset to a separate
> > function, in preparation for a patch that will be changing the
> > logic to calculate it from the HEST table.
> > 
> > While here, properly name the variable which stores the cper
> > address.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> Trivial comment inline.
> 
> Given this is a placeholder for more radical refactor I'll not comment on
> the maths etc being less flexible than it will hopefully end up!

Actually there will be two versions of the math calculus after the
next patch series:

1. one compatible with versions up to 9.1 that work with a single
   source ID, using offsets calculated from the hardware_errors
   table, which doesn't contain the number of sources. Such code
   will be used only for migration. This is the one on this series;

2. one that will get the number of source IDs from the HEST table.
   Such math will be added at the next patch series.
   This requires a migration-incompatible change to store a
   pointer to HEST table. The math there is flexible and should
   work with all future changes, as it uses all offsets from the
   HEST table, using the links there to the harware_errors firmware
   file.

So, basically, the migration logic will check if a HEST pointer
is stored. If so, it will use (2). If not, it is because the VM
that was running on QEMU 9.1 had its state stored, and then
was recovered on QEMU 9.2. Such machine will then use the math
from (1), which supports a single source ID.

Thanks,
Mauro
