Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5258185njc;
        Fri, 22 Nov 2024 01:33:06 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUdgBMoT3Zxg1xDp10RGXhpBsQvVO+JwbOuscuw7vg2DiccU4cqwNr1+uAcNJPCWKaiSZdGL7TwNLHF8A==@linaro.org
X-Google-Smtp-Source: AGHT+IHvMXB+yBbCCbus+cAHMC5ldwbBoWKzJeiZHHkMFG+zatGwi19g0DgQBefPypLLjJz6dZ+H
X-Received: by 2002:a05:6830:6288:b0:718:12af:7f01 with SMTP id 46e09a7af769-71c04b9ac1cmr2722185a34.13.1732267986472;
        Fri, 22 Nov 2024 01:33:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732267986; cv=pass;
        d=google.com; s=arc-20240605;
        b=jZraQ9dSfZ+xILUJsOLu9polCbwnoVjJd3bCTm4e4ItjfVoRucMK0VQIGqdgOTnfHk
         GI1eXAhIiaoZ8d+SPU5oDebo5aUJBZOgVQ0UvJ4xwJ1z3KZW0cm8NLnJ+xky6CkQKFrf
         9OUbZ7LMcweS8eLsbzHbNkdFyRnWqb2aKlKqF3VdvasC/BO+gQ00VMOYXHkinkrET0c4
         cwOb8cbfC4mgOmlTA3bYtJUqAayGy83HE1UAOTKtR8eridBMhr4YLd0pOLQH3YowSpGT
         6ODtYsPS4SD2/g64ILrAo4TyR8pDAMXCk8AapFnaKWg4ImpCU9ra4q8Xy9/zzGMqIenJ
         SbEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=9T8+4jAI5TpZWqz6YH9WIIcLPT2hvAOXw/DxIZy35L4=;
        fh=n65LQmJYxgizjZI6fWMaZcyyBB4igajCwQxeHjFFIJA=;
        b=cUXDcMM4gkS2mWdStk6Ye4asURSBqU1vjhY+XNPKJKNKFuvtDZW8iqxmxQG5QpZW3Y
         iGSKpY+RRxfXSDfaDeRQg5RDzNhzg4aJwiaFn1b7HKub/zD0nCH+GH3EVa+UgenJnOZ6
         nF/lbIWqpAjkeb7RQChI/HRa+m8srR5ncBg7MD/hViQzWaWToVtRExcwN5dwN5J0x+Gm
         xXrfwU5DEKT+gLBVwYT3nhBNseCcfVn6u/Y83RAIfL3DinoRTQgdsrd3vcc7SdMeAKtl
         HfM8GtvRn/eA0op62dDGXKqX9QmnvL78kgGl3O84vDkHg07kD8gF7AZw4dU/MLGvxkBy
         QH8A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dFnVG9Jy;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-418027-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-418027-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-418027-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7fbcc53b81esi1796195a12.555.2024.11.22.01.33.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:33:06 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-418027-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dFnVG9Jy;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-418027-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-418027-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60EA4B22CA7
	for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 09:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C27118B48A;
	Fri, 22 Nov 2024 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFnVG9Jy"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF21F165EE6
	for <linux-kernel@vger.kernel.org>; Fri, 22 Nov 2024 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732267979; cv=none; b=Z2vUbk9BO31bpVpriIUxEbvWwPfTgNIxIylEcUoveU18qLjNhHt1/Zkcqunn5JqULmaYIMUF3l/eJKbrPUPsBfdv7goXUvQOhLJIyL4Vl9XRBJVgcv3B3bBeTlDsovZmtepaRb5d70JhXFNU6N4OJsU/eVtZtTab1e7muBzuMs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732267979; c=relaxed/simple;
	bh=T7xjCoT1gSzZczvGnuo2h0UKlSlVQBVAb2ODDoOJw7E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pVM8ytDoNeTOEWv+sxhzCsa3aS97AW+j3Sw7oxE/zB5QXPE+TSMebspLnZI/5IS3qaei0tEqu97K4sYNcCA9GZkdw0tpNj2Fm6Q+6+M6vipDdsq4kBeEBmUCRQCiN9dP8N7LQwq3kqqnUSulnIX9rZfcgLGG61z7vp6rica6BH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFnVG9Jy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834DAC4CECE;
	Fri, 22 Nov 2024 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732267978;
	bh=T7xjCoT1gSzZczvGnuo2h0UKlSlVQBVAb2ODDoOJw7E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dFnVG9JydNxOkI9IcMrc6tSSTfPvRY820z//xZiXM4LRhOBK+QSHOpoFShEPZT8Rd
	 7X1GkaMEoMRoXSQPvfj4VZtQU3Bmt6+33MThK64Hravl8VsDY1j3xhbirZvVoeTQMy
	 H8dntZIOKz4lxxrDjyS0x06f5jixwX5pghf+nBhGsNn3nsXGfFWNjhMr59nzKYXK8d
	 YRYDHXuljFYtsK6WNv5G6svznNOCNI7zuEhNOixw0bP/fe9nGTPwraA5bki/fLUKYh
	 6X4TRI3IIrO7/mj5xJqgaPJtjU16MioxcQvwcGApzEHGyxLMhm8ihewj0UfDBzMxXI
	 urpExye60hXOA==
Date: Fri, 22 Nov 2024 10:32:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 3/6] acpi/ghes: rename the function which gets hw error
 offsets
Message-ID: <20241122103253.1a1e7551@foz.lan>
In-Reply-To: <20241120143308.00005c31@huawei.com>
References: <cover.1731486604.git.mchehab+huawei@kernel.org>
	<3dccd08b82755bd42ab61408d5d86b2bfe2f2f01.1731486604.git.mchehab+huawei@kernel.org>
	<20241120143308.00005c31@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 5oR6pULbmEag

Em Wed, 20 Nov 2024 14:33:08 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> escreveu:

> On Wed, 13 Nov 2024 09:37:00 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Rename: get_ghes_offsets->get_hw_error_offsets
> > to make clear that this function return offsets based on the
> > hardware error firmware.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

As there were changes at the cleanup series, I ended merging this one
there on patch 13/15:

	https://lore.kernel.org/qemu-devel/e5661a6383449675b28e15c8479ebca42c939368.1732266152.git.mchehab+huawei@kernel.org/T/#u
	
Thanks,
Mauro
