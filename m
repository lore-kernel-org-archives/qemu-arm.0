Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1396821njk;
        Thu, 18 Jul 2024 05:13:44 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVIrg/SSoNdx+8BuFYNJbOI2Ob4J8//tklc3gb4zj/1zlMI2WdfQK0wOzcpWlTQEXGh7cqpLiHz8aSEDqAY/6WyUvbAd2YP
X-Google-Smtp-Source: AGHT+IHKS5ucWNIkZdgPyDYFHQBdiwaUi8MSN7YYNdsJYuNtP2CZA1XdjwNr84NUcDcI1BnW+Qlt
X-Received: by 2002:a17:903:987:b0:1fb:a1c6:db72 with SMTP id d9443c01a7336-1fc4e6a0e9cmr37942555ad.60.1721304824334;
        Thu, 18 Jul 2024 05:13:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721304824; cv=pass;
        d=google.com; s=arc-20160816;
        b=TqTJkuKznFuSv5RVGn82QyuPZKv9rJcM+xtiP5Cg9yynRL+HYdLYJYGE9YRzx9nlVO
         nM91Vn6EBF2FzAWvvpcac6bwlD2suZFvs5AmMbiHmQokXvMVBJojarBik6TcbZz8PGWl
         gc4NQOB6/d2S8VdpzMva6TNl4RNAUvrIEsCLkSOJTy7BIfq5I9uLBCwPtYfP08gqcQxO
         ydZvxoCUt6Jr5V80gyl07eQFqeJVRWA06eeazdnFrZIvIScTSFfqsY6OnUlB9T3qYKMv
         oSdNpuo2ubtk5iBO2+uk7VNlEKICoEDCZcdYsh2mzVpk7zy+XXqsHV9bmP/UmGadJxoT
         0cSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :dkim-signature;
        bh=3tpes5dxhfpKSLf56sc+8cBXu34tTXvDy19AAY0Wmsg=;
        fh=jtu4uUGo1Anl75QAuZkotq8p+YETrosr0UShRwu8fF4=;
        b=Cw1hnzT8GgI/zKBHn6TZxdqFvS9RhpAvHVjwpW5vveUELChKhrb66Rw4AFREftvvxm
         HJswVdoQph3Bh55dSb8YdPyXG2Z27cSfoLjlssYhGl4P4xu2sDU+V+nILV+1ImqnYBqT
         BidoScPgkG7Bm0hilDBTZDMGHcFoQjZqqzWwKl6kI6DaLpTUe5lofjHYiCFVG2lYEM3D
         r0HXvbY/0owZvBp5BSW0E0IyqwmkFa/IspmiURXF4OxeTdWWxYMAoF3u4k2PrdqocGz2
         SV6a7kMBx+XNPB48pE1OGF2dkZTcY+sXHHMDJONHtMem0bdmi/H7DuUfPkqf/pYKfK1y
         UStA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WiBDa1hX;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21828-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-21828-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-21828-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id d9443c01a7336-1fc0bc37144si114878645ad.92.2024.07.18.05.13.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 05:13:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21828-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WiBDa1hX;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21828-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-21828-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4504DB21378
	for <alex.bennee@linaro.org>; Thu, 18 Jul 2024 12:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5577712FB34;
	Thu, 18 Jul 2024 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WiBDa1hX"
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6A612C473
	for <kvm@vger.kernel.org>; Thu, 18 Jul 2024 12:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721304817; cv=none; b=Nm9zBJXTNOlZMEA5PkAJV5P5OAxpTi5SUOHCzl9niKkFQMaJYlzM31aYtn4r7gUdK6M/0CeIkhEkp/5Un6jsLZMkjSn3M4jG47wucB1mPPz6XIqg8Gjh4JkJcNKneUuhKhj/xAB9Pwj86BXRnrMiLXBovaeSw8iZ+VBhE1Up874=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721304817; c=relaxed/simple;
	bh=uZyYNi20RdtaILEV9Eh6a3WG61F0wy0OnDxjpdypgGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUWUkNf/No+QX5hEOAfEzGdrtneRwoICacTJapLu4r5U7Ak5ZMquhbEMuG6WvnlEGBNGMzgMVTpEmpn8UvS4QxxarIWnfYhM0SehhzOdjne1AecxKGL+e3UVpLRq/PlD5n/rkt9wuNqiAMzNe0neXeWPyS7LuVVin7ymOUyt8v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WiBDa1hX; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eede876fccso9005311fa.1
        for <kvm@vger.kernel.org>; Thu, 18 Jul 2024 05:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721304814; x=1721909614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3tpes5dxhfpKSLf56sc+8cBXu34tTXvDy19AAY0Wmsg=;
        b=WiBDa1hXs6sUJBF6s5fr8LOE0gMAPiqDVzspDYwBERuCJcVX3Iy2fkelRr5u+QWLQs
         jIAnnAlxU8FmzsBF7de3WM9r6hg1dsnf3qigAHSWqqJpEG5GV01eiGt6M5iuBHRlvknm
         D8Vt9Caj7ua36BR9k1HkoLUzdtjREbCoFqnBkfA+LwjnuxoWVe+r9J9vtg1IaglAW7Gx
         qXkIQs/usPTUAOWUvliv18PtHfZlgNPOU00oqprfIqQ+NBLJ6lQ1xNyFXQ9TfbVOrF5c
         kFvJZamNj+YeIB83+bQq/kkU/YlOHhDOSmgSEK+cyH4Gi+F2NoToNWuRR4FE5lwlTitQ
         xWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721304814; x=1721909614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tpes5dxhfpKSLf56sc+8cBXu34tTXvDy19AAY0Wmsg=;
        b=WI5OZSJ/BRqMwwCHv9jpyZmJVqRZ2yQF7eW0Ic0CHFU6r2zRoBAoVRhbWcfl9Djevh
         7dZuWqJsqOsW0N7HkIOnuVf43sGaqO/k0Tlx0bMXZACAlXG0W0TIq2B9WRW0LHUSUFS2
         /HltyTFKY47fmZaE+jfhFvQmWCe6H/CiyROXhwRhOZxWv5YjrhK0UXtLqtTdRviun1dQ
         zClJ9qMFaBu/+7heRmKWO0AY73CoHoSz7ZWiPVxPuDsdhAHycORtP0dmK2aKp6D6Tc6j
         uOtR7puRkQo0f3yAJn/QJZqL+J1HG/iH+WMZww1KcI3CmQ42qC/HfKhE/FcZMnjGPTRe
         gvrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJwKud+417eVjSKeQ18aLVO8qGCGQ0N0R+E5c3hKxBWptynZw+19jaR/crfCMlvfnYNpxnVTwBTPemICHyJYSTrjC0
X-Gm-Message-State: AOJu0YzEwQFT+OJr8z4xOoZ5eqdMHMOZtM1bRvq/Mk5bvvOA95Z1dVLo
	5QCrgZpQ3Wx9Juku6cXO89+q6cBCdllNJZnw9v5XOFn0NKsfKXrWqsCue6bh+CvAU9z989pzHO1
	aFMPcfWdKw0G3FzwWAU2zzXkeL0ICr0vSmBQALw==
X-Received: by 2002:a2e:be24:0:b0:2ee:7bed:2cf4 with SMTP id
 38308e7fff4ca-2ef05c91135mr19181041fa.23.1721304813628; Thu, 18 Jul 2024
 05:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-pmu-v3-0-8c7c1858a227@daynix.com> <20240716-pmu-v3-5-8c7c1858a227@daynix.com>
In-Reply-To: <20240716-pmu-v3-5-8c7c1858a227@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jul 2024 13:13:11 +0100
Message-ID: <CAFEAcA-XMAhxO1Zz9vpBAL-Kf1RwrU17J21ZaaYbtbXSQNavSw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] hvf: arm: Properly disable PMU
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: S3auAxBEBFiA

On Tue, 16 Jul 2024 at 13:51, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> Setting pmu property used to have no effect for hvf so fix it.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  target/arm/hvf/hvf.c | 317 ++++++++++++++++++++++++++-------------------------
>  1 file changed, 163 insertions(+), 154 deletions(-)

This patch is doing too much stuff at once. If you want to
change the API of hvf_sysreg_read(), please do that in its
own refactoring patch so it's easier to review.

thanks
-- PMM
