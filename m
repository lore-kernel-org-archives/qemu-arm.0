Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1397516njk;
        Thu, 18 Jul 2024 05:14:56 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUgNZrwT9lXVr0dCfMn1IQ5a7n+hP1oyn1eERIo4/wr+ol48JCrvweDJ915VUZd8eS6XIuGTRMNyeR0Y0fuSIa4kKnt+bdi
X-Google-Smtp-Source: AGHT+IHA1FuwVnU/UJgOmMiAU2Lu+8PywT3zYsb5T23lJWIj062aAL3rDefu03xEs66JBaH68d/q
X-Received: by 2002:a17:902:f68b:b0:1fc:60c3:7b3 with SMTP id d9443c01a7336-1fc60c30feemr28656735ad.25.1721304895885;
        Thu, 18 Jul 2024 05:14:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721304895; cv=pass;
        d=google.com; s=arc-20160816;
        b=kaoetQKU9i05EpphORZb++FdtvIaZ/AXoDzxa96GYOIgyScfqlEVVlheglAMdlMqNl
         v6rt+++qLsakDpQ5BQFpyKdaaLSd6SkPldU01qoPQfhGHP17syGo2GNTIA4UNOBQhWP9
         Aa9KXLCcvgjujEXGbWH2hgFLs07MNV39I0JPFM7/C7NzGGaxxmBIe2HyFTtsqSRFvK4O
         bwHgY8Hkjt+ToifkxNX07/MyXknT5ao470v6nKrnTxVu4qDtfabkM48m2d6Q5+aEyiqy
         1O96IctDtFUEX7aahrsP65UFoEZL3euT8cWth660wZP8xvsAJXGMghideMZJKhANIh4O
         GnQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :dkim-signature;
        bh=9qsVsg1ViojjIwgSQ0F58P2aHMMy1cjG85swySoOl7M=;
        fh=yZ7kkNhFlYW+M3F9I3qmuQ8ZI2ySMff521Z9GburC1o=;
        b=NYHO1ffm+HKhl33FETSKzTbQ0Tv7kAInimY4Oaux4IlU2avGV0Ox1ii6Y3TpVN4mlj
         Bpw2XXcnvvqa+cSkwxOAsxCj1otFQy4iEvSKCMUG00YC5+unVwkfrXsYvNWAWT1yrBNs
         kyqJWVuEMaymWtmyp6zOdxkFYzMfYWHGGKg44gzsSWtpIZi65x6aaukzuRtfSPj0o0mD
         0lxXlnLwwvloGW4LEWLgeS6ipU2POgGOAvxEPy1CcPWvBYw7Ar7BncCsx0HZlInEvY0c
         IBLW5REC8//Sf9yUUKl4LWdZj+6gLsGs+kvubFkGHqTR2ulM0WIl6oExbaT9H3886P6Q
         Cjtw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVCdNCBd;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21829-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-21829-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-21829-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-1fc46dcdeecsi41356205ad.360.2024.07.18.05.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 05:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21829-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVCdNCBd;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21829-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-21829-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69F11282478
	for <alex.bennee@linaro.org>; Thu, 18 Jul 2024 12:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026DB12FB34;
	Thu, 18 Jul 2024 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OVCdNCBd"
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A0812C473
	for <kvm@vger.kernel.org>; Thu, 18 Jul 2024 12:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721304887; cv=none; b=DTh33ILfqxNJlrGcQnZzwrAH+JBw1kh4HW9XdTDorSaX2PDI3DBRLngUxuEpmcbnJsZVTK4L8AUC9Zipmg1rECnBW8Std4Mc6eDdYMFq63ddnFjevCor9EKXR5JJkoWP0hPOHT8z8q8B22EHuSX5amfaPkGHEV2rDp/cRVsj8lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721304887; c=relaxed/simple;
	bh=aco/3AAfoPmRyM6ToEfACnvAzDHiw25PsAVcEIIiBIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/B+bOBBKdCkpAA4mQD+ZDfam9DV/ya01bzrXYbmjor0sRbBHqDoy7gukBMCwIpD617naep/YHYF0PjFGg52cWdkLy9emH9sMNig/i5c5IiGYSOlE/rYcBQrTqMbCC8PoH1H98AgGe+lE0SlgxYgJry5cmmaUU9+6YE6YpzlDmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OVCdNCBd; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-36798779d75so709505f8f.3
        for <kvm@vger.kernel.org>; Thu, 18 Jul 2024 05:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721304884; x=1721909684; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9qsVsg1ViojjIwgSQ0F58P2aHMMy1cjG85swySoOl7M=;
        b=OVCdNCBdRUiCYtiR9mIt6JW856yJlrFntiRqk8t7m2d9pNewus2qKPk84RKmsiOrET
         EGtFjWPW0FYKvbs3V+LsE/sST9Ey5pzy1Iij+3i53A/tORAzyocBzUcYjFggcB5J6S/t
         hhR+j5BLB03vvpymxGSUdY7wSiy0C5Pp6RuKxqGq6yqiBOyulq+sl6pbAGcoxPWj9kPO
         oH0cfUVgNA4h7+/ysO9FXIC52pxarwQjcqt5dlIcqNfMuM0CikztQasHF9hQMtE8V4Et
         dUsB+qMVI4u8rSoXFqgD9d9+E0TNwtAyHSSfeKtTUnf5875b+zpLMMsmSe6CkmL2Wi/W
         AQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721304884; x=1721909684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qsVsg1ViojjIwgSQ0F58P2aHMMy1cjG85swySoOl7M=;
        b=wz7tWQsPy1Q51WDFDe2Z0K8YYRBzOZcUJgwgWw1TengpJF6038mBKCibFSZeMdCr2r
         fRM8Ixo6pglhi3ZtlKiuVhMQxSyfUQLQ6sJNtOo3B+ODF+aj11wwPSofDYWsyr+6ru0i
         47c89NyI5fMyCjPwmGkv1Eg3rIIfowe+n+1huJfalO9siS+LkP1oGoUfK0Q4vT188Toy
         OVSslHuchedeIpmMzNI3q1UtMwl39rNsnIF0sUmQJLnwzSu10ePpbhn5Yh1AILYK22Bo
         cJKFvDZ44v6G5A2PfISKUanE+pe9W3fVdfIfa1l2lh20WU7zYRbZp7tNc3cfDNKIavN6
         lEHg==
X-Forwarded-Encrypted: i=1; AJvYcCWB/PFknRwBhE/FTHbQy61JDNX1/Q5uY9orcYp9TVZ5xCvqDgzIE6fNQU7wqmn/PDXn1pbrDQf7sG4fbrelzU19tdms
X-Gm-Message-State: AOJu0YySNWJCmlFPJmvOeKpnrjmFNYKniE+d2GBx0lm3iqYmJ7CdKOZ/
	cqNh0d0374TS4vv4TAiaSzwP++VP6Mji7hANOLUDeuSKNtBD3dlFWEV5IOZs5NOy/YUAMU3fD1+
	8KU8N553Gq+5O2Gzukp6gp7BZb82MoAAlJnf1HQ==
X-Received: by 2002:a5d:5009:0:b0:368:319c:9a70 with SMTP id
 ffacd0b85a97d-368319c9b62mr3353986f8f.5.1721304884408; Thu, 18 Jul 2024
 05:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-pmu-v3-0-8c7c1858a227@daynix.com>
In-Reply-To: <20240716-pmu-v3-0-8c7c1858a227@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jul 2024 13:14:33 +0100
Message-ID: <CAFEAcA92tB_Hf9AcYsnCSfzCu34RDOb1Mxf8QsQzV1Re9aGfDg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] target/arm/kvm: Report PMU unavailability
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	kvm@vger.kernel.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: lYnkKW4h39al

On Tue, 16 Jul 2024 at 13:50, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> target/arm/kvm.c checked PMU availability but claimed PMU is
> available even if it is not. In fact, Asahi Linux supports KVM but lacks
> PMU support. Only advertise PMU availability only when it is really
> available.
>
> Fixes: dc40d45ebd8e ("target/arm/kvm: Move kvm_arm_get_host_cpu_features and unexport")
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> Changes in v3:
> - Dropped patch "target/arm: Do not allow setting 'pmu' for hvf".
> - Dropped patch "target/arm: Allow setting 'pmu' only for host and max".
> - Dropped patch "target/arm/kvm: Report PMU unavailability".
> - Added patch "target/arm/kvm: Fix PMU feature bit early".
> - Added patch "hvf: arm: Do not advance PC when raising an exception".
> - Added patch "hvf: arm: Properly disable PMU".
> - Changed to check for Armv8 before adding PMU property.
> - Link to v2: https://lore.kernel.org/r/20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com
>
> Changes in v2:
> - Restricted writes to 'pmu' to host and max.
> - Prohibited writes to 'pmu' for hvf.
> - Link to v1: https://lore.kernel.org/r/20240629-pmu-v1-0-7269123b88a4@daynix.com
>
> ---
> Akihiko Odaki (5):
>       tests/arm-cpu-features: Do not assume PMU availability
>       target/arm/kvm: Fix PMU feature bit early
>       target/arm: Always add pmu property for Armv8
>       hvf: arm: Do not advance PC when raising an exception
>       hvf: arm: Properly disable PMU

Hi; I've left reviews for some of these patches. I'm going to
apply "hvf: arm: Do not advance PC when raising an exception"
to my target-arm queue since I'm about to do a pullreq for
9.1 softfreeze.

thanks
-- PMM
