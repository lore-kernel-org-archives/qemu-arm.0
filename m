Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2420800njc;
        Thu, 12 Jun 2025 08:18:05 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUmpMJgRWch4EceBCuJLNazwrtY25Fpvx/feM0LPAbGQFgaQLyvli1ICludvjxqrv9KW5USn+KzdC9gSw==@linaro.org
X-Google-Smtp-Source: AGHT+IE/x1fpEkXDUMKZv9+Dre26yH/QfWwHHQIZKz/ctXmhuXWXcN2gRDuvIymOdpmDJvbq1YnX
X-Received: by 2002:a5d:584a:0:b0:3a3:6595:9209 with SMTP id ffacd0b85a97d-3a5679e3992mr336391f8f.36.1749741484953;
        Thu, 12 Jun 2025 08:18:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1749741484; cv=pass;
        d=google.com; s=arc-20240605;
        b=kv6hQ2Opc1jg70o6sX/sUjuq71ULe+j1ti6faIUYJi9zkSK6hscq7MKAqOlCzo9aP+
         6Pyz/fubHm7gQHRgCJ9HbcmEg2YpmPc94zHhKaJU9B9RqIC1Ty2qkZuATz9I7C3/9dKL
         Ccle0W6FQJuk17R/e0SOBHp82g12Y/0yNj949fW+HjVpAR1miYmy+aJuTLf1DG1IF7cT
         BpFefVpOfrV+IK8+aQQ3cAnLjlta3cTjr0kvaDB4v4hRBBdg+PbgYX6hvwu7fwepmL3X
         0WJr+kLlMiI/Pjq3/Ez3ScCQTSYrtU/luQ+pdGBdJWzuWevsJIC7MeK16IrroRMzFVbd
         VlZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=RJjJ9SAFxofuKHckZxGhb04A9CoN900KCP9r7tkNTI0=;
        fh=hTLU5mNQKwnri22ef6rNORXQEnayYeGogGHi7V9gOk8=;
        b=Xd3VToK1n+aPQZjAn0hUUuI/k4Tl0Hi80AgItL33EEmyLMoZGNEHHJKbDYffYU1Dg7
         IOhUnnDA84Rh0gygbI1o+D9tOlhIjk5HIzBLNgRGPqpe+4E8YcUpptjQUqdFA+VtEgKq
         82hK4Lc9N/58076BpGHEu3u46+wqbPSqpM7PSl0S2UjJOuPpMvWpsvqZOPUZ2YY/pQUV
         tBGQUHLW10mCsrCz51iqo+5C0g+gZSEh8i8l86wUSK9PXQ6ySlns7b6E1RMxeuKiFKHD
         S2ufX7+gskEnnYHnr/LZjczanDsTfwEcYggA9lzoA3/sNhFKufu/KKc81WTuRH5ruzwS
         ECDw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Gs1Hwq5N;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-49276-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-49276-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-49276-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a561a0cc6esi1562475f8f.304.2025.06.12.08.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-49276-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Gs1Hwq5N;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-49276-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-49276-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A21F03A0304
	for <alex.bennee@linaro.org>; Thu, 12 Jun 2025 15:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1026298CA7;
	Thu, 12 Jun 2025 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs1Hwq5N"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD17B2F433B;
	Thu, 12 Jun 2025 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741468; cv=none; b=NBcuUHyQXKRaCkkRKdIzsqmZT467FuW8TwHAyZ+O+ELDm7WoVAwx0uDZCKaMFppHNArXwV/QbrMWBgmC7Psmo9h2aLkRR9dADPN/3Yf2SzuyTwgCToc7KHJTmloB50WN5++Eq0QMHOtECFnSfAAUIkJ9Xz+i9bIcUWXV4gILSNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741468; c=relaxed/simple;
	bh=aK27Gkfn9OFGufJJSptOJpvTy7cfsAOawnwDMBApJqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjMcNugAtf5rZvSKmZ+cbZV1OSzoRCuvV8hKBXnhydHesCX99FSPKsuY3pj7CrkRzhvcoG7b4upFPIm3lWbFhafsR34dlPIqp4wrbY0kUc0WqF8PMyLyl7Pc6svpAS8BGWG18ZFk4RbHFUhHold5PtStG0rn92NxXHc0VipkVp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs1Hwq5N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89846C4CEEA;
	Thu, 12 Jun 2025 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749741468;
	bh=aK27Gkfn9OFGufJJSptOJpvTy7cfsAOawnwDMBApJqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gs1Hwq5NSDfoLIYcEa245EJoIE9CRxRryCKssZbbBk9FMO6AF55JdHxnzEL2coZTd
	 bAAxu2xlm3WeF5A7yyvT3t0CaCTzsTthrfR7dH2AiPThXLG8JGjFX4hZzbH4I0gL7r
	 df8+bDPrsPB6WcSdvTROHogi1ZmV7iZkgHXYjDaM7bgMP/mSbSMkdhSy0rNbI6VAhV
	 mckL4Kfl9lJxLh9/2I8PHi/PJX2yXsrPQ8atWGYMr7Kkp0JNUE66Fpx5DeoqeNEaDC
	 mLUf5ZMy+Ms9e0CUDanc6dWVFlvN9j2N4iRPBagcCUatr/7nUfGWqjiQabPB0ZbA3o
	 5CzGwiuadzkhA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uPjgY-00000005EvG-36qt;
	Thu, 12 Jun 2025 17:17:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Ani Sinha" <anisinha@redhat.com>,
	"Dongjiu Geng" <gengdongjiu1@gmail.com>,
	"Paolo Bonzini" <pbonzini@redhat.com>,
	"Peter Maydell" <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Shannon Zhao" <shannon.zhaosl@gmail.com>,
	"Yanan Wang" <wangyanan55@huawei.com>,
	"Zhao Liu" <zhao1.liu@intel.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 (RESEND) 02/20] tests/qtest/bios-tables-test: extend to also check HEST table
Date: Thu, 12 Jun 2025 17:17:26 +0200
Message-ID: <9ce77140500ef68cc939d63952c25579f711ea52.1749741085.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749741085.git.mchehab+huawei@kernel.org>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: IjNEByJfWxwf

Currently, aarch64 can generate a HEST table when loaded with
-machine ras=on. Add support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0b2bdf9d0d4c..61cddfa837b2 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2122,7 +2122,7 @@ static void test_acpi_aarch64_virt_tcg(void)
 
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
-    test_acpi_one("-cpu cortex-a57 "
+    test_acpi_one("-cpu cortex-a57 -machine ras=on "
                   "-smbios type=4,max-speed=2900,current-speed=2700", &data);
     free_test_data(&data);
 }
-- 
2.49.0

