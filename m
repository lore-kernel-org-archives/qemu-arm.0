Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1363643njm;
        Mon, 1 Jul 2024 06:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWfykXYiQWJTAaPAp5hNp3youa2RRUkaFD/qtHdpJTMhkzUE2NTmI0YMyo2OHr7vFo5LpXRBOa7jvb6kQwbtbrKAcXwGkcl
X-Google-Smtp-Source: AGHT+IHk6MSiGLRIFIbntKOsR/6uL+Ww6mr3bd14r7crMMlQ0FHE57yY3eMDJ9PXHJixfy8JxPrw
X-Received: by 2002:a17:906:6d49:b0:a6f:dffc:54b6 with SMTP id a640c23a62f3a-a7514498f17mr365491666b.73.1719840771426;
        Mon, 01 Jul 2024 06:32:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1719840771; cv=pass;
        d=google.com; s=arc-20160816;
        b=HQRT9Ss7VjPfJeILZIvn8R5LGx5NkTIHDvISWhcreEhH0YlKjS8KnRr8RUOQof8HLM
         BmN5DOemgATp4rOarpl1kmZ35UZNHEzbhgNZR3IlcfIIjZXc4mX5RTJSZ8TZ5WUc8WpC
         lScJt5E0n4eW0ymTwajYKgzuzMj4l2pvz2ERrKmt5fLccmD/9H3iDMnQ2csxoeihaIub
         rkosx6bTjThi1G7vdzpoemqFMIz6Ec3DOXDcpFwM99echmDohJdvNhhXmZuntiAb174z
         JA1ouDNgXKKFD6ISWEWb3MLDh9lR6IVcZhuWUyTsdAuornJ1GzVKxLY2VtRHIG9du3x7
         sFcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :dkim-signature;
        bh=8e1CaWsVPtKpH+k7gT0yv3OQ/WjO4R1smXp48iZjANs=;
        fh=UYcrtWKoBIolL2+vLNoFkjVOpgOONHp34Hv0eJAPiSc=;
        b=Kevjoog/SkNvhYwiVwv4B3W0qeyh4MIyl+neZWphKIsb8wTR5UHxnvo5hdSbjHOCB/
         U79yVZ9mwbdkTA93Vhh5XGBUZS+evk+2e7j0jkJ/vCY7V5Uub9Za22eURrjYH1LNlUeV
         SqbMrM1IJmDluzbfhXCrT+FcfvynWNZgGZ35UGPFLjRO/+FqwdYMGzO4j4KqezKmfkV0
         UHbg2gksU18x1ezBoGaXEU10nIOyM5VGc7jWAnTnhY/LCoFPUdVYDaTU8iqUDDLajGtH
         mNu6QqxLa2H9m9JHMRb5lsauMXxwzwugT9CStzXYjW8Rza/eL2UYCNVkzS8U/Q7/Im1A
         huSw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BsC9rQnP;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-20799-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-20799-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-20799-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a72aaf242e8si345998766b.247.2024.07.01.06.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 06:32:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-20799-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BsC9rQnP;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-20799-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-20799-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09B2D1F22928
	for <alex.bennee@linaro.org>; Mon,  1 Jul 2024 13:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A00C6EB4C;
	Mon,  1 Jul 2024 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BsC9rQnP"
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCE682C8E
	for <kvm@vger.kernel.org>; Mon,  1 Jul 2024 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719840765; cv=none; b=erMDHYWZzAQEggAeD2rDi2PfkljLpgVPuwxbJTk/GAPkqu+7R3G6Kx7fe4MOvZ8WmgY/dodNL0caXfkqOzQG076WKSvpZKneKzXRgYugc8+HQ64DIxRZsUdsXlJ9Q+zaHOTOLT4thYoPv+5W5noKHPCjK1n7Rg0UXNbS5wnDAzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719840765; c=relaxed/simple;
	bh=RT1vX1kVMu21EOiFApSc+1M3ClO+ZeDeFAo9ZWSPdyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUVGfFJNjhz7Q0c8ryHcoc6M5EbstsxTKFoUHU3L9P5kIItvkPVxfMUprp0bqOTLtYldMEKMbfAL/ANQUeeUNOUtibI4avd4C4eM/UwabiZkE+kU9gHqTjdQ9r7l5wLpsYCBoaxJ1aBMYT/5VhvhiLAEWw6DRVArPxh8K7MG1PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BsC9rQnP; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57d06101d76so273203a12.3
        for <kvm@vger.kernel.org>; Mon, 01 Jul 2024 06:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719840762; x=1720445562; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8e1CaWsVPtKpH+k7gT0yv3OQ/WjO4R1smXp48iZjANs=;
        b=BsC9rQnPP+NtB1FrIeG3sv+MavRkeiKl/WNWUdvcgX+cFbLtYrlBZCyeErYRb+0cob
         WXbncnX1aYcUmVS3G7Z1tfoIZ4dvyri87zXVIB+n64F4Y4ip0bC6uo+a2iyJKRWum+U6
         qqdB9+EkZXkY2+EgNpZEZI4I0NHuMbBDv+WvlSQAnCk6z3899bhfnD/UI26P+fdmxqnu
         5BzOTQAkGWgX80+vNzH1xABXP+J09Cvpa7XRcdgnU8tjd2xSAimvYo4LrWZUedoaIa/j
         kN80n9GBxt58mrmk9X71q/VybLGUNFCcs3QzGrR7PmykQdXRbhooGbdKNHShQeD8aIzN
         4xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719840762; x=1720445562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8e1CaWsVPtKpH+k7gT0yv3OQ/WjO4R1smXp48iZjANs=;
        b=SKrjRbjmo96oz5o5okeMe2Tm8JHx5i5QHOEU5hdycPH2WFw67GZwZut+cPLvvmvER+
         ekgKvSWZQrx1Mll58GvFPLDOF8z5j2T+/Hmv18YYH4Oq3B+X01RYYF/dZsjYJW7M9yMw
         tpHLLYvC64pBxWxVUf9kzWedg7S0Txkxmbc91oAYaYF2piix9QgxIFVrmHcNoqAliBri
         XAx6+V0netcSQJ+ymQrjj2zktqejpMssHh9fmWKU9ujc1CKB2T/oYJz3g3ki5TKbYUk6
         /z4ZPd+gkaHDsb9UvMyQ+iLNGY5Ey3qDUHqs9ey5ZQjyierNmTa0ObbbHHnk0VL4t3w4
         DsiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc0Ptlg+806sdpzNrZzguU/cDc9KL3wd4FaTfKxL7qe7hqJS6XvKuy9AVuQ2xPKNgdItZs+mUkKet8xMO2LBgkJ1Gy
X-Gm-Message-State: AOJu0YxzVIVElYm7iugHN9no1oiRdIJycR3ACQ0e/0Qe/v6C9Qd9ZBvS
	WQrHGLJrdEewKAOyRLFM4gpFH2iNvHE1JnqvogpMbfioqX0r1+7tHZKCuy0eFtJh1OqF9iuwCI+
	eD8qCJtUqVdG4+9sLK3rBriwHIvRZWbILbwKv/g==
X-Received: by 2002:a05:6402:26d4:b0:57c:6a71:e62e with SMTP id
 4fb4d7f45d1cf-5879f9843cdmr3350165a12.23.1719840762361; Mon, 01 Jul 2024
 06:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240629-pmu-v1-0-7269123b88a4@daynix.com> <20240629-pmu-v1-2-7269123b88a4@daynix.com>
 <CAFEAcA8FQLQF69XZmbooBThA=LeeRPDZq+WYGUCS7cEBiQ+Bsg@mail.gmail.com> <1b5608aa-5cd5-48b1-bc7c-e356afdc9865@daynix.com>
In-Reply-To: <1b5608aa-5cd5-48b1-bc7c-e356afdc9865@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2024 14:32:30 +0100
Message-ID: <CAFEAcA8+BzYOv4aO9QWHNBYFoCy0hnx+NSn+YH0gA4akCYE+Jg@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/arm: Always add pmu property
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: pagHCxF60a2s

On Mon, 1 Jul 2024 at 13:17, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> On 2024/07/01 20:54, Peter Maydell wrote:
> > On Sat, 29 Jun 2024 at 13:51, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> >>
> >> kvm-steal-time and sve properties are added for KVM even if the
> >> corresponding features are not available. Always add pmu property too.
> >>
> >> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> ---
> >>   target/arm/cpu.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> >> index 35fa281f1b98..0da72c12a5bd 100644
> >> --- a/target/arm/cpu.c
> >> +++ b/target/arm/cpu.c
> >> @@ -1770,9 +1770,10 @@ void arm_cpu_post_init(Object *obj)
> >>
> >>       if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
> >>           cpu->has_pmu = true;
> >> -        object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
> >>       }
> >>
> >> +    object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
> >
> > This will allow the user to set the ARM_FEATURE_PMU feature
> > bit on TCG CPUs where that doesn't make sense. If we want to
> > make the property visible on all CPUs, we need to make it
> > be an error to set it when it's not valid to set it (probably
> > by adding some TCG/hvf equivalent to the "raise an error
> > in arm_set_pmu()" code branch we already have for KVM).
>
> Doesn't TCG support PMU though?

Not for every CPU. If the CPU is, say, an ARM1176, then it's
too old to have the PMUv3 that our TCG code emulates. And
that kind of PMU doesn't exist on the M-profile CPUs either.

thanks
-- PMM
