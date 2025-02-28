Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp901311njb;
        Fri, 28 Feb 2025 05:04:53 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUcLIp9I7J71rWNJhkhWLSqq8NS1wjr64b+yPPy96Wvbuyyl/nPyYqhHDAVg6SuH+gPsV+9XL7O8sS52Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFcLLPD1zhLeRSviteQTiiYU2eB2PMdviTBNuJovhZHQ6IGjkXlQlTwXmRX19hSW170GKUi
X-Received: by 2002:a05:6122:f8f:b0:520:60c2:3fb with SMTP id 71dfb90a1353d-5235a8e57efmr1762828e0c.0.1740747893543;
        Fri, 28 Feb 2025 05:04:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740747893; cv=pass;
        d=google.com; s=arc-20240605;
        b=XGvWCKMiAHoij1VLF/LpTdyL5bxQjcBBt9Y4+k6YLk3pdTHvnR/GmxY4Mrj3LYcTYe
         lxHdvTCuLFi0NGhL9tL8GSwOJp6CRuXVqAMbgtE2o1qDDn50/tkGUcJ+mMeu/A+FKEAl
         xAhbYr/p/B37CiFIGjlUP/HhMp7cwQevJw+PATIe4L5jJMRYskWyHANLjDAPGlY1YKJ1
         4NyKj/fj9s/t3dYXaNGUR6OeifQQQyvoANBj0y9nfwM9n2qeAb1NaqZbLtiCWrj4BhAg
         /b4H5IRmwpDpN/ltvGfQgoBHP5BIG9jlIReFq30P/nyFWQdOp4XzotKNS82vNLMzoR5B
         AMKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=mu9FPPsmEvEks/3/xAxXVst93bcV5zsiog/7waQuz+E=;
        fh=ZCcchL8DjkVLnELh20r+gPB27KmMbpmRTRl3+TgxvdA=;
        b=FBsp6woLGQjiWCSqRbmeyKuw/XeLdnl4x9Iy7leBmxMxz+2gQPJNg2iXFP/tSVQmu7
         LmGJ50qH70w85sB7gL+y7BQNbXGlfgr6777949QBnojAxE8h6vyzHhJiPEfe1zJmGs6U
         iChs2IvZQad8HFUP/a+jgztDEsNcVx58JPpojJAOsKLGI9Fra+tKfKktuy+j1W6pIiRq
         eRY5wUbozlEbSSByJ1H5IbaZTdkNQXdW+6azEhX2WkeHqUwBL2rjoeihh/mjjWVH7ATa
         ssPqDQl//ugXWJhjNdrSsZOxAbujpqMpaoCvjBgl4/x2RuMx6vlonSRUOY4ibXXb/Y9S
         nndw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g0Pdu54/";
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-538555-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-538555-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-538555-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-86b3dbede1dsi563429241.9.2025.02.28.05.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 05:04:53 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-538555-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g0Pdu54/";
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-538555-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-538555-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D934C166EEE
	for <alex.bennee@linaro.org>; Fri, 28 Feb 2025 13:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776D326B2AA;
	Fri, 28 Feb 2025 13:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g0Pdu54/"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1FC1C3029
	for <linux-kernel@vger.kernel.org>; Fri, 28 Feb 2025 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740747889; cv=none; b=T4RzwSlRIYKhEwMVvZupNp8AOSWL5iyGnUOljJgpd/4uALsuWuTqpOp6yaU5xX1r+fYWTj9qV3WvEGBqx1cuzt2RxZ4qZJDS6jGn261Y30yZYSBeV709wynB4uh5Na4OHsafFzwck2Tl+ezG6mRlCY49dPSP/jxz50j7ru7uVUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740747889; c=relaxed/simple;
	bh=tinYoFUDnSoJv83Xdv0Ojlm/TOuCnsQi6lk8rGtnM3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gYdzUky2BTPgNmPYkyvFQL1TJd5RlJen79IesnKURVPdEc8K1HmkytGzFDttF1CXPpHqGXqnV9B3BrQtdIkshOb5B1coSmTfwXzVpPh1LNWV3A9nkGPzpcOmxRdaXq7pOJrI2O7YjzpLFTyAZcip5t9/a+YNemF1K+fFpSPGq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g0Pdu54/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740747886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mu9FPPsmEvEks/3/xAxXVst93bcV5zsiog/7waQuz+E=;
	b=g0Pdu54/sk59t+s9lRV3JDER139fk9g2NI1OUtbn2z74lWMngPVfNulTyip3wzOe185LoA
	LgbuNyPJ2UrErTY1dKmphICe7nihYyJDsu3zLyMQwfWuG6m5rcMJ/ARl348VwYPlU65vwx
	RdsqcliEEWYphutO3TX1e4aFtuSHyqs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-Sy3OzYv-OxqBt-dtKmo9Lw-1; Fri, 28 Feb 2025 08:04:43 -0500
X-MC-Unique: Sy3OzYv-OxqBt-dtKmo9Lw-1
X-Mimecast-MFC-AGG-ID: Sy3OzYv-OxqBt-dtKmo9Lw_1740747882
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4398e841963so13426825e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Feb 2025 05:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740747882; x=1741352682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mu9FPPsmEvEks/3/xAxXVst93bcV5zsiog/7waQuz+E=;
        b=ZkmobPVDJzVSqynv4xexqFzNidQEXHl27BYDQZnqRA2HH+ooqqd5QFNJVn/l7lH1xe
         1+dzD5hFqMN8zfIz5jRigdlU/hId0TgnSG7xnrsjB8Yb4a8+c8AgbZX4m8op6L4mkL0C
         mjP20IMb5WKmPoRr5L4q406zhaFiSN+G/fPEfZ6Y3ws0VsRgSHTpKP36zixIHaknXtGS
         AkWH1iIMQm9WfOFKProEDqdfMAiXnWFiv8wSEv1T2ZRPVN6EoShE92vXc/sQqNxq53X2
         yNX7f3sF8WRPxe6Mc1Psd9mD36eQqQYetjhJLhY2qkB5vzFJWdwaXiLPYFLN6/Vd9TlK
         24Uw==
X-Forwarded-Encrypted: i=1; AJvYcCX75R9avD/m5goqv3LgKdSfr3Rg8B2Dv6ZPqYi6Yhb1S2beARDrwXBDPQmSdtlYWIsq10IgnZWqEhF6/vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyiLCn+k+Ql7wHCKWLQBlyIrH7/KL7Hm9TCR8TLo8/n1tl40dt
	0xxmhmdi7ByRbRW+8/ZLkgg7XhtXFyoai+kHBJcXCrIzJaz8O2VamRUDsgh1Dqqajr+fFXILacE
	I3EO8AZG2nakjYNLtohFhDK+78Rae1U7R0w6p/SP9vzwynDijzzJ3xVgDkKqdKQ==
X-Gm-Gg: ASbGncviDJS5R3ePfBai/llplxxAM8EmO0nEWn/mQycBL6829KnYJY+ZWO3JOg751CA
	n9+0O+hDztE8q0klQsI7YN8XvvfU8zTQTmE5du1EVsiPpSW6oRc2kFXJUJgqIN1Xdb1xvzEB7Ez
	QI00S6hk8knmKDfftuo/O5nZ+cWXGHe7p+sbzMZuJyjJFrOfn4wP+EZrLmUa5vnwy/mQ5xA1mSV
	kx3PQ5umK9FVH80s2x0hn7j9ECE3/NXNzKp/78lSrkAIr3jGVqCPCFCQHlILY8Ek7r8J+WlWrpJ
	pJ04h6xInRkrg/Dtz70hB3Ig3871WipeTKoMJnKFxA7ypIUXkOUXuqqwsBVWjj0=
X-Received: by 2002:a05:600c:1912:b0:439:a1b8:a246 with SMTP id 5b1f17b1804b1-43ba66f9643mr29722475e9.8.1740747881717;
        Fri, 28 Feb 2025 05:04:41 -0800 (PST)
X-Received: by 2002:a05:600c:1912:b0:439:a1b8:a246 with SMTP id 5b1f17b1804b1-43ba66f9643mr29721915e9.8.1740747881242;
        Fri, 28 Feb 2025 05:04:41 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5710f6sm91962555e9.29.2025.02.28.05.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 05:04:40 -0800 (PST)
Date: Fri, 28 Feb 2025 14:04:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Ani Sinha
 <anisinha@redhat.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 17/19] tests/acpi: virt: update HEST and DSDT tables
Message-ID: <20250228140439.450611bd@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250228104400.5ac2f7b1@foz.lan>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
	<7a6a1a1ba78f7dac2be6b7335280c1d0b380a175.1740671863.git.mchehab+huawei@kernel.org>
	<20250228173318.00000f9d@huawei.com>
	<20250228104400.5ac2f7b1@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: iM74amfwAfzu

On Fri, 28 Feb 2025 10:44:22 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Fri, 28 Feb 2025 17:33:18 +0800
> Jonathan Cameron <Jonathan.Cameron@huawei.com> escreveu:
> 
> > On Thu, 27 Feb 2025 17:00:55 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > - The HEST table now accept two sources;
> > > - The DSDT tables now have a GED error device.
> > > 
> > > @@ -1,39 +1,39 @@
> > >  /*
> > >   * Intel ACPI Component Architecture
> > >   * AML/ASL+ Disassembler version 20240322 (64-bit version)
> > >   * Copyright (c) 2000 - 2023 Intel Corporation
> > >   *
> > > - * Disassembly of tests/data/acpi/aarch64/virt/HEST
> > > + * Disassembly of /tmp/aml-DMPE22    
> > This is an artifact of where you happened to get file
> > from so if we are being really fussy drop the change 
> > diff in the patch description for it.  I don't really care though.  
> > >   *    
> 
> True, but on the other hand, this is the only place at the diff
> saying what table the diff is against (HEST, in this case), as I had to
> remove the information before @@, as it was causing troubles when Igor
> were trying to apply the patch (plus on checkpatch).
> 
> That' why I opted to keep this hunk.

I'd drop this up to '* ACPI Data Table [HEST]' line.
But doesn't really matter, as long as reader can get what 's going on.
(there were precedents just putting snippets of diff)

Acked-by: Igor Mammedov <imammedo@redhat.com>

> 
> Regards,
> Mauro
> 
> 
> Thanks,
> Mauro
> 

