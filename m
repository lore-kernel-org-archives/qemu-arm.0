Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp382358ejq;
        Wed, 24 Jan 2024 07:54:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ2CVlfOJ8MQwftrcjSaWDatkr3PEupNCx2SPEJfCcuMI6Rau+ylntMW9kIk09Q21Kll+F
X-Received: by 2002:a17:906:e953:b0:a29:445f:a1 with SMTP id jw19-20020a170906e95300b00a29445f00a1mr927990ejb.140.1706111678304;
        Wed, 24 Jan 2024 07:54:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706111678; cv=pass;
        d=google.com; s=arc-20160816;
        b=0CaYbd5PzxIpk35mv7XvJIu2PsHJ4eDDQUxtkIBQFKJGweXloRcu6eAwRfg0Mkngyr
         P6hz7X6uj/ogBJ8ZDRozsFT3r2p7xdwS2Auq03d+RQ6tkwqbWpUYfi527EAFwhr4zQAu
         mBV8lcQx3SZfLf2NQJEwS82xyAlE1LATImfHE/Rdg01z8d2IjUsN98e93dHldm5Ebvjq
         ChWu/JqpzcSU4tO7A9JmfTCzYAAFhec7gGJvCXU8Zc2RRAfKR7UVmDe7HIvef0ZU9FWQ
         f8lm5rDa3zod/GTvMNp+7W5OfGrg845rx6G0jPCL/85coT9+hkfd0lvCIrjRAJwte7UB
         g/QA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BK/V9dj5YhGk0iLWuoz8QxmPAwCjQLFlhcHGZGmRcrA=;
        fh=xK/PpTBdOmWf4C8q/qM/JEZSr/jQk367oOzmeGjbBKo=;
        b=X6Z/CTkD6gj0D2Rgvq0T8TSllWKXVqz0NTEddEYlhoXSS28tYKGxc6UiKG9E7k2KYH
         AyVjR+/HiRZEI6n+k6aJu0Tu8WUL6NPXqH+dPwfpuAU/jkckQHU4i3RiXLWwXsZCtIQf
         g64yZ5xxT8Z53sitdcr+ZkE05MAiv6YURjH+hqkZ6r/ANee5bBsp0T+47A4GcrpOW+Wk
         gutAAryts6tUjGE4d+rjzpNomSoOltcODCR514KMtZsgc4VxFxeNkUGwUgbHni4T4YC5
         EDiswO3wWNbioJRbr8VFFteMpDOnWKi6aTcWuku/uqIPq4rHvH3cQ1am1GnNm4Hc+Mgo
         D9Lw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pa0XpX3P;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6838-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-6838-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-6838-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id le25-20020a170907171900b00a314ec3e592si22816ejc.147.2024.01.24.07.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 07:54:38 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-6838-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pa0XpX3P;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6838-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-6838-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AFB31F21A26
	for <alex.bennee@linaro.org>; Wed, 24 Jan 2024 15:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA147C0B3;
	Wed, 24 Jan 2024 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pa0XpX3P"
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F0D7C099
	for <kvm@vger.kernel.org>; Wed, 24 Jan 2024 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706111672; cv=none; b=HWp5tuDDzC0Eqxo8YEPqaXvyUx16dKyjuN+UUZgbccjmu4WE/j9dS0SaK3Rxgcnl9gDNLjyrCPTvGtweVg4pAY4ezXg3TmeOA++lRqlcEsdTpihNdnIMn2C0EwPoZZnXKLUCH9Cte28rZvpRlWwMrayC4+Qs8I7gzDdU8YRIpMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706111672; c=relaxed/simple;
	bh=RbqbZCIp07l5lmvZjXI3xa6wQBM2YLtpD34Zryh2DwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S1hZlGyhSIL3MgrXCrp5dyCbOseAwBqNtIfFPv9Xa439cn12NIFlW/K83Ho9ljiSsXoamnSLQmsiDbXR3lMhliEI1O5oKhFauh6kukw41GKNj/XOE5fU0l6UP3tB6Z86BZPdHKyRxSB8pav25m+kuyrVhZQA/4oBj3OKbs1fOXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pa0XpX3P; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-337cf4ac600so5240616f8f.3
        for <kvm@vger.kernel.org>; Wed, 24 Jan 2024 07:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706111669; x=1706716469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BK/V9dj5YhGk0iLWuoz8QxmPAwCjQLFlhcHGZGmRcrA=;
        b=pa0XpX3P4rqQCTbiF1i/gMefGpIRxn+VFO3uTH+1Rzx9e3g2vWko745YXXMcKhvHYM
         hgIefIXDsRG9yV2FgitLhZzISY2PDdixQwlEOOix0F9b301KeolMdWjdCI9owVoaVUFK
         B8dJpcTHsvl6W7TwEQ8lrEnUyZaVIjTThWcJbq9IO+k+N9tckxVGKRKqJ6ILd8EZWGUB
         uy8U5UaQA3K/70FoKDdQHG0Pt2Sjj5u7+EtbXI6SdsINyqZMbXbqK7CCgpp1Ee7lP9gW
         OBoMqw2UZBSclnsZNwohwm+wg9qQNTGwdtDssp6nJ+xdFiHR5Zfquzy5AkS2vUBtGS17
         B3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706111669; x=1706716469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BK/V9dj5YhGk0iLWuoz8QxmPAwCjQLFlhcHGZGmRcrA=;
        b=Af7x6PKHN/dgZ3v8V3gnuDE8q/a5RgZgdwbbfFOuU2Q2h4ybClH15hmeihK97cozW+
         4+xSLeFNE0umNhnRDmd3m/bueYwO/SqrWRTDLq99rlWYgLvjb9nCtgAMujwJvF/Lp/q5
         lE+c/WY0l1Y1BvQV0iOptwG5Ts/k9YhZ3v3QeC2fJQK0gpqsAbXA6AoQUSA6v9yLY46S
         gsPPVH3JrGMfio8TsgkRwybIHczzFmuu4wxQl7GdfSU+TiJV1/8UD7jP1DU5RNGlPtS1
         K/nwB3OOym4+/E4E/vGVH1oIzFN46mmAvIk7NVSBF5Xqowr1BAYmzYzIV6ZPTDhhyIqo
         tALw==
X-Gm-Message-State: AOJu0Ywt87+nSir+0+Bn+EPAx6pgGwwuK3yK0qBn03j9xnlAXIB4i//h
	U3C86edTLv5rIMthzb/rQAhhkjeFxhQaPUFhyv2dKK2K/sxerQe+u+H9rnmp67I=
X-Received: by 2002:adf:eace:0:b0:338:fcdc:ad19 with SMTP id o14-20020adfeace000000b00338fcdcad19mr698831wrn.6.1706111668791;
        Wed, 24 Jan 2024 07:54:28 -0800 (PST)
Received: from localhost.localdomain (lgp44-h02-176-184-8-67.dsl.sta.abo.bbox.fr. [176.184.8.67])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d5711000000b00339273d0626sm11842179wrv.84.2024.01.24.07.54.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jan 2024 07:54:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] accel/kvm: Sanitize KVM_HAVE_MCE_INJECTION definition
Date: Wed, 24 Jan 2024 16:54:23 +0100
Message-ID: <20240124155425.73195-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: CuhKnU7S0AV0

Trivial replacement of KVM_HAVE_MCE_INJECTION by
KVM_ARCH_HAVE_MCE_INJECTION (not the "ARCH_" difference).

Philippe Mathieu-Daudé (2):
  accel/kvm: Define KVM_ARCH_HAVE_MCE_INJECTION in each target
  accel/kvm: Directly check KVM_ARCH_HAVE_MCE_INJECTION value in place

 include/sysemu/kvm.h         |  7 ++++++-
 target/arm/cpu-param.h       |  5 +++++
 target/arm/cpu.h             |  4 ----
 target/i386/cpu-param.h      |  2 ++
 target/i386/cpu.h            |  2 --
 target/loongarch/cpu-param.h |  2 ++
 target/mips/cpu-param.h      |  2 ++
 target/ppc/cpu-param.h       |  2 ++
 target/riscv/cpu-param.h     |  2 ++
 target/s390x/cpu-param.h     |  2 ++
 accel/kvm/kvm-all.c          | 10 +++++-----
 11 files changed, 28 insertions(+), 12 deletions(-)

-- 
2.41.0

