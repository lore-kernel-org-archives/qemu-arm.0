Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3688034njk;
        Tue, 3 Dec 2024 05:38:35 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXCQMq4pUzje4lKZkxLLlstUHJc0p0RLkYmHxy/elKqu/81qMt116rWl6EprkkqXXjVUvW3vqWo8EfgNw==@linaro.org
X-Google-Smtp-Source: AGHT+IF7f9Ttuo30ZNl9o3j3MPNxcfQNHMoZ9lM0HvaXHj3/lCNZ6rtLI9uXu10bRAbOAC5BkFpQ
X-Received: by 2002:a05:6102:418f:b0:4af:2d25:c47d with SMTP id ada2fe7eead31-4af972da096mr3641581137.18.1733233115699;
        Tue, 03 Dec 2024 05:38:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733233115; cv=pass;
        d=google.com; s=arc-20240605;
        b=alkoyeAJpOTE5qtDvDinur/3YM3m3fJSeISjt4xMR8MLqEVphPefTwa1jL/EyOJdeh
         RMfmqyOkTex9CRJooxwsxcJWdybMAKlB5puQjYZllnu9ANo0yLKB9tBl+YEDDD754qWF
         Gb387AnBovOSf5vCfIsHOqM/tOv61IOp9ZnY7aUnrH5J+zKoxij6jp/QOWQEg8VN2HDG
         EG0SP6J0Wv0gGTy6CGFO14+/uXoml3rFYXwE0RVG7ldiXd40vi8vJakIi+G2LXHpScdX
         AbAymHf0k72g+qhwdFouVHprsaIfi4gqYGCir8KSX03XM0YDig6CXJKpe7WhlmB/tua6
         7MmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=JMbsjXKL72zL/DN940xOqLHt29dvyhY88PxsHwGzTwg=;
        fh=AJ8hn4ioKJA5lsG3NCMNx8yhntdFUmRi9f6dN5eYbeg=;
        b=css/x0xUKF/hC/Cfk7xYDaHMKHtKfsB0n9puI4HyF6NCUDcfkAN6611fcaml2ERzy2
         9bLZTkXetoH2N6upAwO0Uv0lk6q8pVZM7cVBu8YFktg+vaLsBYDUTyXRjMRERje938lV
         u96vLbGeFPCAlLCs/L4u0WIX8GiQpWY3CP1UWKmzXambdGscEhCl07RJAbDQ/lcsZJNE
         hX7MFml2HiA3N4piUfcUFy6tZOgLduXiPV9eciP5WmSQDT2AP+LyOyhVIeaO1ZFOH9/W
         gyhyQhwXj0zYRsen26oyDhO7TH9EJIEjHtWjWn32JX+60P1B1JFbxaJsrskJIoLj0gqo
         fZ9Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uqc9GqaJ;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-429556-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-429556-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-429556-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af593dc4a2si6471879137.730.2024.12.03.05.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:38:35 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-429556-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uqc9GqaJ;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-429556-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-429556-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01E13165DE6
	for <alex.bennee@linaro.org>; Tue,  3 Dec 2024 13:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467831EF0A6;
	Tue,  3 Dec 2024 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqc9GqaJ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FE81E32CB
	for <linux-kernel@vger.kernel.org>; Tue,  3 Dec 2024 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733233112; cv=none; b=lRTjHgym/LpVK5YRKpZECJdU3PL073R1HBuQZlCihkgOsKwLFw61ditiVHF6kGEiIiLSqggYPR+LXMoX+GeL3TH6V+fom2a25OWtFKAoyxD0BCl+lGn79yT4ivBYw2EQJBh7xXxdatj4K7qurgKxNUXc/CwRjZ6f3XiuUpH+AvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733233112; c=relaxed/simple;
	bh=7rxcTbvnhbMVz8ygNphkbF86kDtn0YCOEk/Z5XEkOIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ocZ3c+VxPBmlG1QLlQXjGUMo/JtwJ6nC1KYNNtmC0PIoYkTFQLvp76GL8IVcyQIfcHSq9hKiNHDljPHuyRSKALvVhJSMAOMUGk/YyAvTs2548F/cu9RKtwnzq9cczgteR89w13afxcMUtymPYa6gkA84rnLcIbIwbqIl06q9U6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqc9GqaJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C710C4CECF;
	Tue,  3 Dec 2024 13:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733233111;
	bh=7rxcTbvnhbMVz8ygNphkbF86kDtn0YCOEk/Z5XEkOIQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uqc9GqaJAwLMEfMTl1Uxxddq28fOYmkab+8EZHajCB9nJkl6YKkV66Rn8EIv7hZVT
	 /8RMKl+agEt1aQ6br0aQDLMDzW3UB6JE7QL30/BEmsTJVySuu9EkHoRsQHoYWyYwhk
	 7uJ4i5yV/ydkkycCttziqNqxlF1PdQ3hPAPZrAE/ZMw4qcizb7lHR+cCWHun4toi1l
	 zDmxacGiTGVe6QIvi+WYeAgY/EPFyFQ3NNT8ae3iMl4KPY69BpOsXOs2iywSthl657
	 jJ/vjf1/nsH+cac7j92JCCdpQU+jgO8SCeoXuA787bz8Xf0jbjt/V/csJ+W+hRLpyH
	 p/aGkoLSnWEkg==
Date: Tue, 3 Dec 2024 14:38:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 08/15] acpi/ghes: make the GHES record generation
 more generic
Message-ID: <20241203143826.4fd23e48@foz.lan>
In-Reply-To: <20241203124232.7948b2fb@imammedo.users.ipa.redhat.com>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
	<b3845a8c78ef36c633d5e20af868de4ed16650a4.1732266152.git.mchehab+huawei@kernel.org>
	<20241203124232.7948b2fb@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: koR5hw0g1R8s

Em Tue, 3 Dec 2024 12:42:32 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> > +    /*
> > +     * Clear the Read Ack Register, OSPM will write it to 1 when  
>                                                  ^^^^^^^^^^^^^ typo?
> > +     * it acknowledges this error.
> > +     */

Yes. I'll add this hunk there:

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 68fb30c2d5c1..4b5332f8c667 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -403,8 +403,8 @@ void ghes_record_cper_errors(const void *cper, size_t len,
 
     read_ack_register = cpu_to_le64(0);
     /*
-     * Clear the Read Ack Register, OSPM will write it to 1 when
-     * it acknowledges this error.
+     * Clear the Read Ack Register, OSPM will write 1 to this register when
+     * it acknowledges the error.
      */
     cpu_physical_memory_write(read_ack_register_addr,
         &read_ack_register, sizeof(uint64_t));


Thanks,
Mauro
