Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1413952njk;
        Thu, 18 Jul 2024 05:47:52 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVZVaS7IGLEo9wABxVC8dYjSDk/8RyvT8qJfdhW6jCBIpx4kIG4GTK7/9IlFCQ9pOnjy8IqHn70jyFBzGA/q9xE4YP4BSEP
X-Google-Smtp-Source: AGHT+IGXKYffUHmB0cn6UJ+SrOI6VGhsfqp03gUf11/vGTC4WGaNZN4ng9D/i3q6tt0s4Kzf9YDJ
X-Received: by 2002:ac8:7d8e:0:b0:447:f942:50c1 with SMTP id d75a77b69052e-44f96d98907mr9900011cf.29.1721306872393;
        Thu, 18 Jul 2024 05:47:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721306872; cv=pass;
        d=google.com; s=arc-20160816;
        b=hHaE6D/ArEVwHVBJ3nvJ0UXsqDqBWp0Tkgy2yIDAehPP4fEDcy20ymeCEaoUQsKF3j
         LxJXHQTzNrbBeL7szTD/f0PFmOPWo4tK+cEzyV5aRHevVlffH4UCF1mlCkcx76e/6nK0
         1OgAZ5oWmvMqARmpOsZBsGaZe7ZEQyrRiT+dyf0fhn1eOyf5eUBgjBPhGT3SXRSTKL/1
         zCkUowe743RDvLXfl3VYN4uUFIemN7hipvrWXcHFpaiXXctONuPmZ4F5OepfT3CKF7IS
         XkSmHs+VwA5Y5tYxGZw3Uc4149RDidnRF0D3eTSXNz6yhb6hQKcsfPuUtsgfzmjVxD+B
         4dvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :dkim-signature;
        bh=XdDrtQYVI7pRTfjiVCqeFj/FSqkdT7olrHwvukUpSgU=;
        fh=cV/Poj7wjL6dnK+q042oauhGW2N606BSGktb0T4DGz0=;
        b=XFC6LL9TcfAEFKgpg2EjRiE4VSpIhCgDUi7348rDa7vnqgLfw+w2+IhSmNeu3P3lrH
         hqshSJW59wceC97jtfebzPyJj7aVPPBwEqNlN6YXdk+HVRpnRSfdb4dMTLNsatxeYG+p
         mMltEf0/T/EFN3p8X7o0SRtcloypiIF91862L+Gg+xVBFSYKVAaeHg24LhB414mwdmoJ
         j3Dv4wrlZvjIwIqANhyUWVACjpRC9cV3Js95yaGIBNNR5xBzc//JnuyYwZuZKV521HfI
         cPzIC+SM3+eybKHMImYJVzqBWsMLRQbUm5xFg5b7wZAOXPUInjGwPDYt0oP0N4oMrc7Y
         yCyw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r6KK8biy;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21830-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-21830-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-21830-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-44f96abdb7bsi4689811cf.667.2024.07.18.05.47.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 05:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21830-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r6KK8biy;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21830-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-21830-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17A2F1C22122
	for <alex.bennee@linaro.org>; Thu, 18 Jul 2024 12:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AA513D28C;
	Thu, 18 Jul 2024 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6KK8biy"
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB7613C9A7
	for <kvm@vger.kernel.org>; Thu, 18 Jul 2024 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721306858; cv=none; b=WTrNdiHZRYJ3xVqjsr48q6n2laMV0hEohb+h7Yx9n3FU+YxIBBNegq8lKcljn1I0Dm+QTn/f/b2eZhOryPflLJXdkY987O/vyWGhAFWaKD0dm0KxG4RFbVkGC/ZZ7B6eY6b/KHCpx2YXuMi8WBGNRnZ6fU/FD2VzoihepANigZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721306858; c=relaxed/simple;
	bh=a2/Df7tRAq9WHUNTLqvXbyvp85QaRvDtpL1QG7j3yg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZxhj3GNNMclOQvuDhGQH2ZmhvULOpqL7myFriJsXEj7g73CPY30SsAJM4NcE6nAE64fg8ot82cLrs9WnI/vsm86o0zM1LCj1sIoXX3yU2dWQhZxIYWuRIKQ+0ZV94jPI3aj3JvJYCHqZEiEECfbbupRvSIF5ShRubGtBcfUsa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r6KK8biy; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so8579321fa.2
        for <kvm@vger.kernel.org>; Thu, 18 Jul 2024 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721306855; x=1721911655; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XdDrtQYVI7pRTfjiVCqeFj/FSqkdT7olrHwvukUpSgU=;
        b=r6KK8biypG+Sh5hlfSW8LENbSLxgpw0MT4SVspFj9ZNffgOpfLu9zNrcny8YRuCQjN
         x9X5OUpxTLLHKl2kys1UJO5V6YqE0gXYYtNjtNJhFqmYEA1JrL9NZRKEy1+g768nNaoJ
         +sdy9CyJ/yesxHFMRSjJ+WcM1dVPb5rZyYaGigSDU7lBVtQ1YqxNSZM6pKQquY5O9XYk
         4yDmEzMRcJnAgmfylFVUYZ091eX05guyKmXNfkEcaX9yYWridICAoQFKppdlCqtIUKpK
         NVAKp83fiRQ9cp5DDbBILR3n63C7tXQNV7eAFmI3JGWEOyEK4nsH+v837iKJIJjyWtSw
         mQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721306855; x=1721911655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdDrtQYVI7pRTfjiVCqeFj/FSqkdT7olrHwvukUpSgU=;
        b=xSrbMIBN0XzvwuSeGyalJ5isUzYMrOYC0UXmGhXo6cOr8RwC3nHTU9qtJii3v5SH4R
         99Fp2Ie9SSIWx0ua0CMwJN/zMoiwYx+HPljl5L6WE6CQX8jF7n4TAKqE78ZpVj62PyXb
         JCN23pD+6JuoBhn5hiQwddCsBdIXZHxHexm3uBprDc7jcQz8Fex7tkC0+4r6G4fpR+VZ
         hS4D/O9LqsNEh+Gj+PhmNDFQVDZlkjk6cxj4k1LtL1TAwqmz4wfwf7dvSSn435DlL4hR
         67H29cz1MPNpG8im0FDvxDYV5Y9/Z6Ho+o6/+2z12dR4sX1nCU0tN8kvIgj1h8lKxm7l
         XfsA==
X-Forwarded-Encrypted: i=1; AJvYcCV7IZxR+fdrxwfF2RunZpIcivSeKc70jrcpvZNsI4MIyXiHqJ11hpSqjiTYtK472dwI289WM+0JCFRtkl5iyxCA+BtO
X-Gm-Message-State: AOJu0YzjYxhhLeOnrEUP6gQ7BfDc+3/n0Oy3dQ4dKHgKi9yGVkTGOVU6
	6G/3+br7KTM1mvm+E9S39tm48mIk+xDCcZBVK98wW7LbkwWFLf/DBZV2qqshql9vFgRz8P7yHqn
	EtiURCq4W6ctjYDVmrT5VjxSffK4ce3weoHm5jw==
X-Received: by 2002:a2e:914d:0:b0:2ec:543f:6013 with SMTP id
 38308e7fff4ca-2ef05c798fdmr16433141fa.13.1721306854559; Thu, 18 Jul 2024
 05:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-pmu-v3-0-8c7c1858a227@daynix.com> <CAFEAcA92tB_Hf9AcYsnCSfzCu34RDOb1Mxf8QsQzV1Re9aGfDg@mail.gmail.com>
In-Reply-To: <CAFEAcA92tB_Hf9AcYsnCSfzCu34RDOb1Mxf8QsQzV1Re9aGfDg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jul 2024 13:47:23 +0100
Message-ID: <CAFEAcA_WWAe5bL+dJ=hwSKVKY0X=TskyoG8hFtRYgJAbZ_xoPw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] target/arm/kvm: Report PMU unavailability
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	kvm@vger.kernel.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: uxJTIfUPQ2yn

On Thu, 18 Jul 2024 at 13:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 16 Jul 2024 at 13:50, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> >
> > target/arm/kvm.c checked PMU availability but claimed PMU is
> > available even if it is not. In fact, Asahi Linux supports KVM but lacks
> > PMU support. Only advertise PMU availability only when it is really
> > available.
> >
> > Fixes: dc40d45ebd8e ("target/arm/kvm: Move kvm_arm_get_host_cpu_features and unexport")
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > ---
> > Changes in v3:
> > - Dropped patch "target/arm: Do not allow setting 'pmu' for hvf".
> > - Dropped patch "target/arm: Allow setting 'pmu' only for host and max".
> > - Dropped patch "target/arm/kvm: Report PMU unavailability".
> > - Added patch "target/arm/kvm: Fix PMU feature bit early".
> > - Added patch "hvf: arm: Do not advance PC when raising an exception".
> > - Added patch "hvf: arm: Properly disable PMU".
> > - Changed to check for Armv8 before adding PMU property.
> > - Link to v2: https://lore.kernel.org/r/20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com
> >
> > Changes in v2:
> > - Restricted writes to 'pmu' to host and max.
> > - Prohibited writes to 'pmu' for hvf.
> > - Link to v1: https://lore.kernel.org/r/20240629-pmu-v1-0-7269123b88a4@daynix.com
> >
> > ---
> > Akihiko Odaki (5):
> >       tests/arm-cpu-features: Do not assume PMU availability
> >       target/arm/kvm: Fix PMU feature bit early
> >       target/arm: Always add pmu property for Armv8
> >       hvf: arm: Do not advance PC when raising an exception
> >       hvf: arm: Properly disable PMU
>
> Hi; I've left reviews for some of these patches. I'm going to
> apply "hvf: arm: Do not advance PC when raising an exception"
> to my target-arm queue since I'm about to do a pullreq for
> 9.1 softfreeze.

...and I'll take patch 1 ("tests/arm-cpu-features: Do not assume PMU
availability") too, since it's been reviewed.

-- PMM
