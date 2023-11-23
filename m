Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp592307ejj;
        Thu, 23 Nov 2023 10:35:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkMz3tn7qalGNKBNXNRSezaoNcatNeugaeVXSM0LKX/jpL2+LfnI8vhI/z9/9xPGPIIbmw
X-Received: by 2002:a81:a0d0:0:b0:5ca:b794:fe30 with SMTP id x199-20020a81a0d0000000b005cab794fe30mr194397ywg.25.1700764538694;
        Thu, 23 Nov 2023 10:35:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764538; cv=none;
        d=google.com; s=arc-20160816;
        b=BnJ6k+DR5v2wep8bkV9LdVhFxSPV54SQvhvQOSqWjhZaqONR9+5Df7/hZgKDquZL0l
         6r0ObvUbK/FeO7+BJkkHcYuuUz1TXPnKs5hyCpIxcUDfJV4haF/qfoQxSKhD0AJF3fv6
         /T6aywPRqenvpiU0fiS7su1i1TlJC5RnOTXL7OfeLDgWi0BkPtcVYrmnIKqWkdffnkEE
         IXFevMgpTOA78uEKa8XaVXNguCqz3wQC6DdS+I2vCmBF+Qhn2v+j40aTGKgOV4UMONhp
         MMgdMsDo0UVf2KH8f0i+Mw2UY5fiZa6aHW7NHcgrAPkLt+eJreBx0grQVGQqm3rYmXiP
         fr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=BmQzUMP7VYVa7fjT/YSlrE9ib44vaPa3uhyPvwmHEck=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=qwXonw6Y5I4w3SUBVvT2mLtiHX9UzX+xDwCdifUl94bGCkNFp+tZz07/1/9/MrFP45
         F7wCV2HWGzsjpR7XJp8qnyMbAkdW2o8OJdXxyWtkj61TrfCZQWvHtawHSxQftK1ozd3u
         pgJiMESLPbrPg67MdNCmF2pcc7D757nW5ziUXN38n62T/cemaJ9H+eFwGCAkQQxZwIMR
         1SXWAdJS3V2KAVWyJ91s//14OX2FROzpqDcHBZASmLmZP3xhfInRyyJTSyq0VslKzvgQ
         Q4DxXCddPSsIr90EDlfDrvvAwvmK53oXHgGQqNSclCHRYiJPtglBEYD4tfKq/rcd9k4e
         Ixmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UnDT9DEm;
       spf=pass (google.com: domain of kvm+bounces-2371-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2371-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2371-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id jq15-20020ad45fcf000000b0067a074f4b45si1555580qvb.350.2023.11.23.10.35.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:35:38 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2371-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UnDT9DEm;
       spf=pass (google.com: domain of kvm+bounces-2371-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2371-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 591481C210B9
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3C54B5DA;
	Thu, 23 Nov 2023 18:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UnDT9DEm"
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922D21B3
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:35:33 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40b394f13b1so941455e9.0
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764532; x=1701369332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmQzUMP7VYVa7fjT/YSlrE9ib44vaPa3uhyPvwmHEck=;
        b=UnDT9DEmJL4iyDTrxQUT6/Q/XH4yQm1oXmf0i3lYbdd0Xbl/RsQfKOOcNuUoc0yftu
         eMnQL8jNYOZGC8R2o+OEXOg9ruF18O8ZbAE+gYAI8Y59g2utMkGDamvXQeHoHx+VI6P0
         P9NxjKieWe0LeBQ1E94AxHEiuZdIRSRJQ9NZ7j4FQm8uAXtwsxumfrnlwkZr4B7MeYdM
         +qtMrTfZySnZqD3fjieDDZlnEuf27YOAfUVRtL+cx9zZd3fBeX+E7Yn6aEDQ/E+xMGOE
         gUxzHsfanp9Dy8/9SNjz4Diws2mzZF3M8qlv47mpXdcjo1+b2WjQaVjh04KM2cNDPfMZ
         oYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764532; x=1701369332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmQzUMP7VYVa7fjT/YSlrE9ib44vaPa3uhyPvwmHEck=;
        b=oivx6EvP1PeYZNqQFygI+zODky+rZ2LeAoM/lCmDVtEhECNxVlBoHtOZ7yJKvWTFyx
         CoKj+b7nZk5O1C594mA7aD64qcck/nd4F5+Au+Wr+byLKVsfUu0gQPVC0kVCjbOPaegR
         mP9sq1UV6fuU97TFCB5dKX2LG0Gpq8Xp1Ij0lcH7YeYUwhP61IKWdXs2bui1HZuTrFd3
         bNtVcd4/FGei/g7nwC+OpdWsa6YK77V2Bckv8upInMvvRdogKw+L60NCl2MO597LCeEt
         wKFDRMAYfhcwKXSRu9QyRPsiOE0Y8agGKjabS31RNlLgMxUx+mCPCehrcZYAGnXwqSdG
         yoWw==
X-Gm-Message-State: AOJu0YzAEWa4FpMZaSB5PVm+hI1KaKgf63ehWu95LqGpB5O5ObQ6R05s
	F/xQhIg2Ds4Uqb3zn2P34bCDAg==
X-Received: by 2002:adf:ec03:0:b0:332:c723:12ad with SMTP id x3-20020adfec03000000b00332c72312admr176313wrn.66.1700764532048;
        Thu, 23 Nov 2023 10:35:32 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id o10-20020adfcf0a000000b00332cda91c85sm2327141wrj.12.2023.11.23.10.35.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:35:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 02/16] target/arm/kvm: Remove unused includes
Date: Thu, 23 Nov 2023 19:35:03 +0100
Message-ID: <20231123183518.64569-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123183518.64569-1-philmd@linaro.org>
References: <20231123183518.64569-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qeRp8BZGEvgc

Both MemoryRegion and Error types are forward declared
in "qemu/typedefs.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm_arm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 2037b2d7ea..50967f4ae9 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -12,8 +12,6 @@
 #define QEMU_KVM_ARM_H
 
 #include "sysemu/kvm.h"
-#include "exec/memory.h"
-#include "qemu/error-report.h"
 
 #define KVM_ARM_VGIC_V2   (1 << 0)
 #define KVM_ARM_VGIC_V3   (1 << 1)
-- 
2.41.0

