Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp128767njl;
        Fri, 13 Sep 2024 22:38:59 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWAZZJyeqOdp7xfLEsN9GlKt3a4Flrn6iMxWSTyHxRqoGg5hQFmVXVIT9dt/6nhdR8jMrEJG85VUC+0VQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEaQ13K8EP4MFnA5O3a3u+C5qufAsE+mEeAcKtlV9a9Jm5TEjJKHYSB2bWtHWVQq//IbCWF
X-Received: by 2002:a05:620a:14c:b0:7a1:e4bf:276 with SMTP id af79cd13be357-7a9e5efa46bmr963062085a.20.1726292338784;
        Fri, 13 Sep 2024 22:38:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726292338; cv=pass;
        d=google.com; s=arc-20240605;
        b=LcboIZ0j/e+QkgS05vUGkHtbc/Y2YNPV6B8fNI0Y8wo3Y+ccaw5X6b0qJ5pSTErq8c
         559/5Skvd4rdBxJsamqpIMmIPQhwdm8sNP+oHz6H2JLbIeQ3XrcyuFdohrCoptC0Pm6x
         i9n2Yy5AE1KxUj20b1wDsDFIKjVudAPNYYadewsPbDfhS1e3G/m4CF2PXbjdmjxIny7H
         /YIpXO1FHPjR7udNLBgf1YzBfqvRc9IPESEtO1OG7uVp2yAIYB6IZ4WDRElJrKDkfLBF
         EXBWzqJ9Jxhj1ldkDoQari1t3qVBCjx2Y+Ka89aoR6sfYQSWzHzSRgNK0cFCq5AG2u+6
         HMpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=L+nz9HJ0CxcZB5ArZizghat7kK5gjE2VYF78D4dm01g=;
        fh=33lchV9jbo6F1fNnffP4idbdCIaYCrmc6nnq6V4oNZ0=;
        b=GEIEYWSRTWqU6iWT1WZta+IPH0fG7XWVQEoo5GBbsqwdqSb7jmF/vuw/cf7YeOMMJE
         lB3rjNYkhWWGQcRlvtK/Ly9kbvNRb9RmgHVfXb7RwS4k+meo6l+Juch5X+R0wA4ty6kh
         NL8gD3nCvx/E3V7Yc/TRiPYzvwoiiu14WOzXCBWSJ2b77Aj9KXRbwbyStu6rPezxHPPR
         Yn6Ko1Xspbn/um2KL5aT6d5kTrJeHCZnt1pbjmROQ14cLBbQXUigZPueQMQ1WB7qRh90
         n7tl+4RaApFr1WlqUkJ9/RdaonPWfFDGG1tF3eUk9TvBMjOgrVHjY2T/6MFkwq+6DLKc
         mRJg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XpO1WWzY;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-329145-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-329145-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-329145-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7ab3e9aba60si87005685a.169.2024.09.13.22.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:38:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-329145-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XpO1WWzY;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-329145-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-329145-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D1201C2200D
	for <alex.bennee@linaro.org>; Sat, 14 Sep 2024 05:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998431CABF;
	Sat, 14 Sep 2024 05:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpO1WWzY"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5953D1758E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Sep 2024 05:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726292334; cv=none; b=MJyOIeePhstE5bCMl0ubGseJs2v14IJLrM3tx90gddeZ6Vc74ToJUxbV8R03ujHiz3xMLTYQD9M+uKWR7d0DAuSWv4j5C3prPDL1Z+XGtOhi/eIF0bVb96aDYCP8iYP2UyRQNmJ6kJHia/mBzgzK+TdxQG5jWuaZStPcbNow/UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726292334; c=relaxed/simple;
	bh=UlVn8fWFgP8yf3muvfLEqiwH/WZRlUZiVMyShTuifUY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=anJ3jJXVimoeCylhknOrP/zGZpKZ+w52Tmd82DGYOKAnu3lzwJzvlaRKnbOZIbMjkkSFmpRUg6bNLhT4ReJzQ3yGE3MsUcWeqiJZzHZAt/yssT1QkmW0uOPiaEbWnLbdEsb9e4g0g7vw6nyyM4IRPzv9mjb2cv18y+QetwDKS7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpO1WWzY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7547C4CEC0;
	Sat, 14 Sep 2024 05:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726292333;
	bh=UlVn8fWFgP8yf3muvfLEqiwH/WZRlUZiVMyShTuifUY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XpO1WWzYHYTwRtLfZGl4iOOc7d+02PCfjEXlKJgaPkkWLX5jvtsyvdEICyVPR88fz
	 1CLcPeREenOMSbsiVjC1eCVSNLpfRMm6OuAh7FVMzqV6IAj6TPakHA7AByFGg6mO2C
	 C4eqLv5pOy4s+wcWUiFCgd38TC6kczItyDizuNPEOlAn3KJWn4NyOmyOvQLnFVXGc+
	 5m2ERtBlScH1IwFeTDHnVF5Uhyoj7uZxI70kwpLOww07a411ZzUpKU8k3QwpVzcefB
	 2c+eY7LsP/CG6jUGv9zMFt4DzlfCrZKxySKF9JwcKLvFYJbkHgBH2KtcJQ9tIq0isO
	 Lo9HaYdhEumLg==
Date: Sat, 14 Sep 2024 07:38:48 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 <linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v8 06/13] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240914073848.7b8bd8f0@foz.lan>
In-Reply-To: <20240913142802.08571a15@imammedo.users.ipa.redhat.com>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
	<2c8970b5d54d17b601dc65d778cc8b5fb288984b.1723793768.git.mchehab+huawei@kernel.org>
	<20240819145136.0452ff2b@imammedo.users.ipa.redhat.com>
	<20240825052923.715f88bc@sal.lan>
	<20240911152132.65a7a219@imammedo.users.ipa.redhat.com>
	<20240911163436.00004738@Huawei.com>
	<20240912144233.675d6b63@imammedo.users.ipa.redhat.com>
	<20240913072025.76a329b0@foz.lan>
	<20240913111300.00007a3c@Huawei.com>
	<20240913142802.08571a15@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: /A3kN9OdAnOM

Em Fri, 13 Sep 2024 14:28:02 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> > > 5. Just return an error code without doing any resets. To me, this is 
> > >    the worse scenario.
> > > 
> > > I don't like (5), as if something bad happens, there's nothing to be
> > > done.    
> > 
> > If it happens on a real system nothing is done either. So I'm not sure
> > we need to handle that.  Or maybe real hardware reinjects the interrupt
> > if the OSPM hasn't done anything about it for a while.
> >   
> > > 
> > > For QMP error injection (4) seems is overkill. It may be needed in the
> > > future if we end implementing a logic where host OS informs guest about
> > > hardware problems, and such errors use asynchronous notifications.
> > > 
> > > I would also avoid implementing (3) at least for now, as reporting
> > > such error via QMP seems enough for the QMP usecase.
> > > 
> > > So, if ok for you, I'll change the code to (2).    
> > 
> > Whilst I don't feel strongly about it, I think 5 is unfortunately the
> > correct option if we aren't going to queue errors in qemu (so make it
> > an injection tool problem).  
> 
> +1 to option (5)

Ok, will do (5) then.

Thanks,
Mauro
