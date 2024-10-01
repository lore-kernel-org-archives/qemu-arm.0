Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1652916njc;
        Mon, 30 Sep 2024 23:04:05 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU89O92PPuLKTcq4FNUxJkyhzZ5W3vrhUrPPt2C1wVBMszZ8vDiKXTcW+dyGA6qgj84qLY2hQDFWu8ziw==@linaro.org
X-Google-Smtp-Source: AGHT+IHwtxWOhkXyR3XUEwWPJJPjhPe+rBfcJ+KaLoOcJqgq7NuCdyk+y91pM2sXkYid9A1ceXi7
X-Received: by 2002:a17:90b:3b4f:b0:2d8:adfc:b3d3 with SMTP id 98e67ed59e1d1-2e159f2f73dmr3416501a91.0.1727762645003;
        Mon, 30 Sep 2024 23:04:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727762644; cv=pass;
        d=google.com; s=arc-20240605;
        b=UgXyr5ryfMiTMAtHD9tuvA2DcM1FI/T87jcCB00CDDKUyRzkkQqNm1nSryCTE9YHz1
         9aqWYoL42Z3RuSBbJRifrnL4P+PoBZzrV3KzfAEc5XPoCHRG9hrVt0iIeE1NAYJ6MpSm
         J8sCdowrCazrWuGEqmAk5156SouiUk0U9jDMo6rzdDpk0/myT3kvYybKiUfQiI7uemy4
         /qXoBgiWXvzgAqStRsQRWIxT08aGbJ/x+9gG3XXoCV9JaAY7rYq0QiWMzRswvFh9obCV
         hJ5bvi3egKi3h6eMHcgNLsZhvssDL8VFDq8oOlYnf8Ub3cV65E29Zn8NGhCHADSqvSoY
         xntg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=OO7hXOrnOJfsg1XLiO7IftoKz/++usTAlZAeilP8yOs=;
        fh=j7GA3EfRet1H7jTzv9UDgZNjw8MUZeXqIU5NskuDe5w=;
        b=TFoT0fQKA2jfMqYBN7O1rL5MjxOSRzIoz5NvlvLPV/v7522vw01du4OTn4+mJx8WTs
         5TgKIMoSz+16QrtXMovELfZD66jTACu3lSOP2HBSBiQ4cT71ylCWqPE482KlcRPPPsAg
         8M974+pajPJhk5WZ66hq8fehRt5TwDBi7na7Ues4Xmz9ZpzgQQE5oKj2rnWdlN4b465/
         TT7/QnaUlLRGqlFk9ba32xSac4lNjsGUtM16E+Jx6y5Mdq1LYcSv0gHLIN78HxCnQyiU
         +5P8py8JhXZAq31iICdvdSgLW28Pg9qSi7GiWaqS9ewxCQJULdfp+NayzAZPIjUfKEVX
         m/QA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=QxgM0nZX;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345282-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345282-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345282-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2e06e301bbdsi9101669a91.171.2024.09.30.23.04.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 23:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345282-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=QxgM0nZX;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345282-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345282-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8184A283D1E
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 06:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A181BBBED;
	Tue,  1 Oct 2024 06:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxgM0nZX"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83841BBBC3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 06:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727762566; cv=none; b=l+7JlWVBBdLfMkqMXQTjOs4hZZIP0YIdzsY/XDSLaPcgml4YiBbzLwUTTE1JADs5SS4gso+p+t2BPdqda4KP+heXTbJbj8ApRTP8fcAtb7en/u5neAhG1KmvsbTdpiOQ1TAaHQkYvFMnlRnR+Xh+Ha2eHl2QZiEAiHMvWhsAXuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727762566; c=relaxed/simple;
	bh=rGURyU0q5IpmNAxeZNOxzNUHTX2mHMJxAi0SPIdKbRY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uePMSOtTibOiFoS+fvUIySYCtVTJZFZaGK9S3A9C1b4w1oKtqsfcBoVHB0OrzZX4bjn4n9NFUKLGZqWQu1FdgoCFSmxL2bECeP9MPfdeMe/mEvvVrQnHS1AggG6CZvjw8FscorUwGie9WFRsqAREHnx7WtqkpU9d2zow4QEt+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxgM0nZX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BF3C4CEC6;
	Tue,  1 Oct 2024 06:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727762565;
	bh=rGURyU0q5IpmNAxeZNOxzNUHTX2mHMJxAi0SPIdKbRY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QxgM0nZXvcli+3SxLlTIQ3jQ9d3zwVBWfTXDZqufc3WmF8iXSrAILhZhCHS6+JPGa
	 hIt3nfJfj9TE5vBKSy/F1fSS0pSIXWrlh7aKJQUMEP4iuLJpcgrWzkBrkfrfqLISqK
	 JsYvcjNOIEpbcrDytheCePB9MH0FwPE8DXtkpqqSdSgNQ3o0C/EhdAeCzrz1AjWFmC
	 blBXzIj0a7uykHqmD+HWqXKstPMTqVqJPm2GP/XK6JptLkduy9dbR8OTopiIUZ96J3
	 39CniiBYzPSVa3NpPC/+ZB34Oqw17lN07qAQZcQov+3DSh67cwFxyWAFVzv6nPwn9K
	 JSQDkUrlZySEQ==
Date: Tue, 1 Oct 2024 08:02:40 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 14/15] better name the offset of the hardware error
 firmware
Message-ID: <20241001080240.56a927d2@foz.lan>
In-Reply-To: <20240926131225.0000337c@Huawei.com>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
	<94dec32ef07d95940ee63445f151899ae7b430b3.1727236561.git.mchehab+huawei@kernel.org>
	<20240926131225.0000337c@Huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: /ndB1ow/VOci

Em Thu, 26 Sep 2024 13:12:25 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Wed, 25 Sep 2024 06:04:19 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The hardware error firmware is where HEST error structures are
> > stored. Those can be GHESv2, but they can also be other types.
> > 
> > Better name the location of the hardware error.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> This feels a little theoretical as for now they are always GHESv2 I think?

It is, but the new code that will be added on the next patch series
will allow future addition of other types as well, as it seeks for
the source ID inside the error block structures.

Yet, if we end adding other types, it will probably make sense to
rename ghes.c to hest.c.

> I guess it does no harm and may make sense after follow up series.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks,
Mauro
