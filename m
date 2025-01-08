Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp875879njb;
        Wed, 8 Jan 2025 06:19:39 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWuXzcZQUCxdhC09ol+4JeMRLEgurjxDwf0ke/cPpLxgb7rwa6C3ruUzDzReXsoXcee0l7iI/xV47VJTg==@linaro.org
X-Google-Smtp-Source: AGHT+IHnj6M+5OOpRm/+AOGSI7cUMLAWF/JGWqfQOuUn/Gfwqf0Vw46K12+PcY7uwNtMhC7uuI8R
X-Received: by 2002:a05:622a:41:b0:467:7cda:936d with SMTP id d75a77b69052e-46c71003b65mr39326181cf.14.1736345978854;
        Wed, 08 Jan 2025 06:19:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736345978; cv=pass;
        d=google.com; s=arc-20240605;
        b=NnlamOGCGQRzIb+GaQKOQdeNeB/I9EyQlRpU6vjjRkQPdmAPVo6Q3qC7N0TaFt09yB
         g3J2KobJS6NjLQ29hUSV1ogI0SVOQspbyrlTX6rYlMoaFvDBgSzePrSC9iU3WsoH8rUf
         Hoo0jrEHTmcDhUqpLJrfcx2MrbeQpfyjMRokfdov5PGNI1oNCICo2kNilVnrE9JlQBJi
         +7EuXtBgi/7Czgsi5BWf5lB7k1PBh6EiPSAvx3oMGucQHTI3JdMZmC1/iX5iErT8wb5Z
         bdj7HdJaPAEo7vWY13qHoY/NaoBzpPXtxDbKP52Hh/PFYewRXB4gs+j4KvlYPtuCNRbE
         e75A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=cSrWrQ2htSdpY37KMH2GEWu8jny9z/CoQD8A4cOU1m0=;
        fh=cvU4tksDRdiJk0apu26xlLZevYEl2a3BbwxW8iKvrhw=;
        b=Xk+NX7FoZz/irDnYtAh12bTDf6yiUqyEwAHCInlR9N8fTkWROnV3qmm3nudXfZoMJl
         6GhXo4qgMguVYREp04MYl0ICxypLoPkBSskDxmZ+VlVNLpGZ043Hb0FnyHi/NwPmrUOQ
         4Bg8jx95lvvXpf8yVxEgOcF83wMHi1zsDwhmLzZy42bWVoYhhtOgeV9EtVjiDERBqXhm
         0+sMldI/4pZLEGJtYYCCVG7Z0SgXqaZitkton0Zbu8wVY6keVQFUsV7WU8tRbJzoDf+1
         QyfQ8YPowi8EZnqabMJxVwkhddcH0CvLcBNduo2wCGJASOyXydn9kaDLz40UT+KjeZ9J
         yJNw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FiuMaGkf;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-467882-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-467882-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-467882-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebd747csi467504751cf.556.2025.01.08.06.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:19:38 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-467882-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FiuMaGkf;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-467882-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-467882-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AD481623D8
	for <alex.bennee@linaro.org>; Wed,  8 Jan 2025 14:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358901FC7CC;
	Wed,  8 Jan 2025 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FiuMaGkf"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786CC1FAC53
	for <linux-kernel@vger.kernel.org>; Wed,  8 Jan 2025 14:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345974; cv=none; b=R8xrsWgmpGXTlkK2VIR/hEJbQXIPYGC3HSXFBArxtOvfh9E8mr9O3gr+CWsstODXl/kE1y+eWHTfcZf2qf4svaOSoiRmxJHAqGrZj13mZFdJqwXQUyefk6/H+4BnI2ha+cNY/j3ZV0oHvv6W3B6X5Ve92ssaCP7t7xII08BgsAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345974; c=relaxed/simple;
	bh=vK1IN5Dyq05umuvO6zGZxlftusRlxJsEsWVxts69M+o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N89aI6wKJSHj7jGnNABGx08AusctzH9QqzNLmqTCu4U7dQj7yVZvWnkE7CSa+/0gNd/+dl+jUQHRmDbUBrYFtBbQHuQBpG8OySwGQLCslz6RVcng+QjuOXv0NdRwwupTGc2Gi0SRqP/8YTzqirrgy9F9eH/L/t9nGmQlMPFI2DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FiuMaGkf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16405C4CED3;
	Wed,  8 Jan 2025 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736345974;
	bh=vK1IN5Dyq05umuvO6zGZxlftusRlxJsEsWVxts69M+o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FiuMaGkfk91ZuJ039RrSBrGseGzRiLq/ZP2JeDgcYWM6BXiFhfSUVB0tPmAsIUQe0
	 CqKkk5dEn4jJjM3PWwzkOMY9AlESNJ652ekVT4WqJ0My4mwSBb+cxxGF/Xq58ZUwIc
	 0U/hhvFqbgzjb0NLM8TtT4C1NxAFuRyzT9lZfTfnWRziy4i8oUE5gle6ccDJTcSLCQ
	 gWdiWOJWcE6G5TWPWdkLVNQvrkojxIQYn68tG8ijI3WKcYbyV86Kd4Ip+GmAetxFlF
	 2w3kPVyOPzbe6k/IOwIBquaQTSvsMsKURkwS0SEmys0ZMYyOuPMqDOKqt978M8P1aW
	 YiikMFVQOYuTQ==
Date: Wed, 8 Jan 2025 15:19:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1E?=
 =?UTF-8?B?YXVkw6k=?= <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter
 Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Yanan Wang <wangyanan55@huawei.com>, Zhao Liu
 <zhao1.liu@intel.com>, linux-kernel@vger.kernel.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/5] Change ghes driver to use HEST-based offsets
Message-ID: <20250108151926.1602394f@foz.lan>
In-Reply-To: <20250108090815-mutt-send-email-mst@kernel.org>
References: <cover.1733327276.git.mchehab+huawei@kernel.org>
	<20250108090815-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: JgLVkaFZhL7B

Em Wed, 8 Jan 2025 09:08:51 -0500
"Michael S. Tsirkin" <mst@redhat.com> escreveu:

> On Wed, Dec 04, 2024 at 04:57:54PM +0100, Mauro Carvalho Chehab wrote:
> > This  series was part of the previous PR to add generic error injection
> > support on GHES. It depends on a cleanup patch series sent earlier
> > today:
> > 
> >     https://lore.kernel.org/qemu-devel/cover.1733297707.git.mchehab+huawei@kernel.org/T/#t
> > 
> > It contains the changes of the math used to calculate offsets at HEST table 
> > and hardware_error firmware file. It prepares for the addition of GHES
> > error injection.
> > 
> > The first patch was previously at the cleanup series. It prepares
> > the logic to support multiple sources.
> > 
> > The second patch adds a new firmware file to store HEST address.
> > 
> > The third patch use the new firmware to calculate offsets using
> > HEST table.
> > 
> > Patches 4 and 5 add migration support. They assume that this
> > series will be merged for qemu 9.2 (maybe it is too late for that,
> > as QEMU is now on soft freeze). 
> > 
> > I tested migration using both virt-9.1 and virt-9.2 machines
> > on qemu 9.2.  
> 
> So this needs a rebase to the next release. Thanks!

Sure, I'll do the rebase today.

What about the preparation patch series, from where this one is
placed on the top:

	https://lore.kernel.org/qemu-devel/cover.1733297707.git.mchehab+huawei@kernel.org/T/#m3b56bbe7bd400369f9e38b56faf4e65e64069955

Could you merge it? It should apply cleanly on

	https://gitlab.com/qemu-project/qemu.git master

and it doesn't contain any migration stuff on it.

Thanks,
Mauro
