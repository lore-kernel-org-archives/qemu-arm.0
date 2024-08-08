Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp545254njc;
        Thu, 8 Aug 2024 08:06:35 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUDke3oLbTfCa254M6SgQS3h5+xSMmM7h5v9PMND/BkG2G2u+kZGjUdrP7ZQZT3C+h1GVtD+hhvCMf6vQWH4xUilD7xdzez
X-Google-Smtp-Source: AGHT+IGtu6ndUjFYaoFNb9LbQlkenU3xI9nBocviqbHRh7n58T2J+Q14KDo9Cz0mBO5yJOekQPR0
X-Received: by 2002:a17:90b:80a:b0:2c9:6d8:d823 with SMTP id 98e67ed59e1d1-2d1c3363e6dmr2696439a91.1.1723129594830;
        Thu, 08 Aug 2024 08:06:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723129594; cv=pass;
        d=google.com; s=arc-20160816;
        b=SLbS7hsa63XRu/qevSOYaK/cw6l8a9OgkxfS/xmoznlgQZe8gG4ILi+O7Bwv42/T7y
         z8vdcXw0OrOnqM4d51KwaNYRkhjYr7db1zVmyoxT9BVl9xLWJmb2qIbq/SUxqG5PYH/p
         Rmyj/Sw1ygLLZCAy0l8B0h4W1BS0dhg3TjkyAGyWOoGSm5V6GJSx5ps4nH/rBfzrx5Zy
         ynIiRPOmnOi2AOITKcobYISv6Bv2dFVfeKkEYvvla5GBmRaNCeW0fUzzcFkG8oMvalmf
         s3HtZINx7UGp+2Y3cgXbyUJYUh1Cgp2X7PGBY0rwdBQZDeEHYU5iXgBPtFLOPlTOY4Gd
         ralg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :dkim-signature;
        bh=pKbSP4Qie7SKDPVYTOOt5vthjkc2KCL/iSENWLQZl8E=;
        fh=RVxYdEqTt61/btUiQZxCwF4Fjx/v38D7ymGOgpxSgkQ=;
        b=S4w/qDqbnqgVVhYUbARL53R0TJ2Ti+jFDarKghdNLsFzfQmifWej5muhMYQmslNvzF
         HGIOz9qUz/KYb/sbsBGD2ygZHy/tIBU9mpkayjU9hd3yn0BDpHo+f8+6SAuw1Pho2Z/K
         49gXp2Q4eteQAUMGjTOUgmHOtXZBbBmjcyN6UaQwq3dF6Frk90CieUDM28nJNZB7tzO8
         8oVhd43rQecHXev87rCrFT5pXBugjnsC12n1IwRD6pRJI/7m/JFdOHXVvr20ov/dEU0Q
         ZKmxY44uipfQnkRFFqQGlCf6Y0drQT5ILusTnG3U9jkfOL0viOB816ljLDcQ21JV1trt
         4xHQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZawYHzt/";
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of linux-kernel+bounces-279691-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-279691-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <linux-kernel+bounces-279691-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2d1c9dbd12dsi1115164a91.142.2024.08.08.08.06.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 08:06:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-279691-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZawYHzt/";
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of linux-kernel+bounces-279691-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-279691-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B237DB24855
	for <alex.bennee@linaro.org>; Thu,  8 Aug 2024 15:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9AF18CBE5;
	Thu,  8 Aug 2024 15:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZawYHzt/"
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25A44A33
	for <linux-kernel@vger.kernel.org>; Thu,  8 Aug 2024 15:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723129588; cv=none; b=g/cjq7p8rXXTjeIhdC6A767YBqg8BgpwBgQedNonbpMOjr4B0fIKDWgWj9rYIhuJtm8bL8CPCz1i7NmGqa7NmKeYRZlzuKQMFvfYaiQEzqMTBfpMjkI/a9w74mGK51vkVV+CQ29lmBBRasjbdjwRN8kx33zInVFAXCWzpPVqWBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723129588; c=relaxed/simple;
	bh=pKbSP4Qie7SKDPVYTOOt5vthjkc2KCL/iSENWLQZl8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0MccSaJOLfxNAVLjOgDBPrHmxvPTayCsPQjUXQgKblKmWkMc68yDDChv8RAn00rfnql7D7SqFz6qlaZq8EieSh2YPcF43ukZUGht3m+IAuf/Mcw54wYh3/IOhgL1zJzN/qctcO0GbdC3aJsDmp0NjEOfdOHci7tEbUfIiQ8BfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZawYHzt/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a6135eso1615799a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Aug 2024 08:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723129585; x=1723734385; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pKbSP4Qie7SKDPVYTOOt5vthjkc2KCL/iSENWLQZl8E=;
        b=ZawYHzt/YL0qUQOzv63Q1ec3r/1s3lZaKNlGyLJu8W+AFkSVhBTTepREd0WbVEEPTe
         QTEcGeduJWF+Vk7pT4gfcBl9JrMms4lSl2Q5rmcu5T9HmCe39Pbx0/94nNIfBteKc+Sx
         NiyMe3WdRj3ciTkc50SrO8rdN/zH5DzKEN+ZaJEdxg+PxLHt61qsgCWUN+KIxCY2afQz
         9bpirkDA9jpdJBwczEvtEgB10dAwuBZIMF3fliI13lG8NY3Wljq4XUdWu0/Z/y9LiHNc
         o+xCdxqyJc2ps38rHUgC8I7S3gM6kMakjBuoK4oy4/wgYiSNxr0BzFa26BIrFpIhawUN
         DcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723129585; x=1723734385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKbSP4Qie7SKDPVYTOOt5vthjkc2KCL/iSENWLQZl8E=;
        b=qM/795LkYlSKDlbsfWioqQ0evGshxPlotHkpw5LUTOo7A2xhCfLrZtva5R7SgDyvhs
         ewetFaZg5k9lkn5GeyTvXQGmLFfw6G3xSnqcQxHs8oqnHKn9hEPbu2fFVIvWSoVY6P4P
         hj8beAjSJmtYbRrHKx7HAJgpkvHObyy5Z22PH9Eu8BsD3zxIriMawChdWmw0SIhwaEuD
         ZGGjcsyItxN8yk9LoaOh3ofjedf5ZbXcYzuXbV9cNo1QH8DSFWyQ7fn+LTNNS34l/RnE
         mNBt0Blf7Wqr0aL2adVV36/8l4Y5NYhbVsQI2+nMjoFerpXZZHdmeysyUSMmo7ohqBhm
         9aTA==
X-Forwarded-Encrypted: i=1; AJvYcCXgRX9kpnbNHxx/UZn2uKfI9UhRUBn3kLFTduKPjkLQdJSm51c6SR+7qmJgUQZx2G+nxvgiePxvd5rnhp7xlRRwMp4f0HXYCzCg/lS0
X-Gm-Message-State: AOJu0YxGvhkEbsRmDbk6q/JXNZ9zi8l6c4qD0PsTPJfioNuBhP1oaMTN
	j1xE3I/Ehi35/9LRw3XbYb7hr5SbH/g4QfClwNBO48f0HM8h0YKP7aefYXE9Y+zor2vz1hcNRAi
	LV+E4/fCiY9eEmcxtQrfI1thTFzf6DpA/kYjezg==
X-Received: by 2002:a05:6402:1d54:b0:58c:b2b8:31b2 with SMTP id
 4fb4d7f45d1cf-5bbb3d1d1f0mr1760801a12.17.1723129584983; Thu, 08 Aug 2024
 08:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ef0e7f5fca6cd94eda415ecee670c3028c671b74.1723121692.git.mchehab+huawei@kernel.org>
In-Reply-To: <ef0e7f5fca6cd94eda415ecee670c3028c671b74.1723121692.git.mchehab+huawei@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Aug 2024 16:06:13 +0100
Message-ID: <CAFEAcA-rvu-X49cw8SHpqnmuLO_yqcaLHnF=9v0Oqz4WVQom-Q@mail.gmail.com>
Subject: Re: [PATCH] arm/virt: place power button pin number on a define
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, 
	linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: pRhF7BnHYc72

On Thu, 8 Aug 2024 at 13:55, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Having magic numbers inside the code is not a good idea, as it
> is error-prone. So, instead, create a macro with the number
> definition.
>
> Link: https://lore.kernel.org/qemu-devel/CAFEAcA-PYnZ-32MRX+PgvzhnoAV80zBKMYg61j2f=oHaGfwSsg@mail.gmail.com/
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
