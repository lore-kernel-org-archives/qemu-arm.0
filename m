Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp518757ejg;
        Thu, 18 Jan 2024 12:07:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaaa5fbfMC/KP0ucY04BMp4MF3mCregZLJ9jDkuMia6v0jUs8GtCebqR7Af2v2gj7xPj0K
X-Received: by 2002:a05:6214:2127:b0:681:557a:8b32 with SMTP id r7-20020a056214212700b00681557a8b32mr1701968qvc.122.1705608423655;
        Thu, 18 Jan 2024 12:07:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705608423; cv=pass;
        d=google.com; s=arc-20160816;
        b=1FLEo0xe/NHafigU29yoII8wW90pRSNJnrbi3w5XBd7rIjY79MxrUw8kGUFqnt4Fqb
         Tme7zpBoI7QkcWqdWH13mILDfhXd0AIuPGsBiDnB/eMHDs7N8YFOKx7W4FA8GqJCmu7d
         5eBsaXP8srSWH6h4us94+IoHBhTxFTtc/IwAKGQF3iTdm8j+AogyvP8JvxnFYjuZjShW
         kepDoos49cAWyqngNmVPHOk7r+yNjmvSI9jgYyXz3I8JJqhWiisYX9e5kD6CcVogSKM4
         U5jIUVKHB+/KGBM2d1EUxJAp/Yxo0Io5GNXYNfrmByo/emyM2RtF6Cuctfc1xpBgoqG5
         ajzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=DiNAFYNzh60Xuezutbt6PuwpTTLS/OKWcI7qaHfDd9s=;
        fh=cUgEM3TMHOIH70RmHTmTZxZmItZJnKfBWHSaci49aLY=;
        b=TF3oF8qAk0NYMWh9gKrxHxeHWT0WFba7ISDHiebRktMYdXpfAq2mPHu937Br+J0ABd
         FiWQwILc0KZbIyBRdatZgNcn3MPDg/4qk0mBIcdJW+hdkZJ3x4KaiY6DGJqHcLdaaI3W
         kwaMwLyAUj16Su3uhv644gy21nqTb1mOw+/K6kSK5Bigkjec5b46h/IuTfcvmJeCappB
         EU2rEqpTw3fQe/6kS7F5Oe35MFNM52qjRkQC3vo/6GbF2C+Er4AMKF6APuzqkNEBjYmh
         fPKboLFspTjVCVGkukhifXgAH+0M7cKke4WVzoJv+FwcD1TdexZdgfK2G7G91ELJ8WAF
         cXgA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LdNYBMjU;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6432-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-6432-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-6432-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id j6-20020a0cab86000000b00680c567b656si14860012qvb.196.2024.01.18.12.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 12:07:03 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-6432-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LdNYBMjU;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6432-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-6432-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 151731C24A66
	for <alex.bennee@linaro.org>; Thu, 18 Jan 2024 20:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834682E647;
	Thu, 18 Jan 2024 20:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LdNYBMjU"
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A678E2E62A
	for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 20:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705608416; cv=none; b=Up7lFfywJyda+ng1hxBEdGsSO4L9IWTvTyBQdVJU+pJD1pc+r2CZVClUC5nF82NsOXdzwfRMwQD6t+hQ2nrecqvGnnZAw9hOWnjo+zFVm99RLLINfaj3IT4q/n44rUeciI2mMdspixsNamWa1vJz3/CyFHEUIh5X3sVUNuQBObI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705608416; c=relaxed/simple;
	bh=KTGDetcjBm2dpi4YJvKoAoiNmdmzwwhHqGb9S81FkyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HN0CWQfyMn/N5MeFQOLm2no9Wk1flFgDq+VDb0Ckd5sRw6lH1H15FD/26La/4BUwkCJP+7bWfW+AavnqORxZWWxRKnlZmRbWtqT6iUwCmNMKmDpqG6QO+NyyZfnaKmMaCx3H/E+SH65MMScs/ChgNCWdWHRB6hnu+3hodCtUbpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LdNYBMjU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e60e135a7so301875e9.0
        for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 12:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705608413; x=1706213213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiNAFYNzh60Xuezutbt6PuwpTTLS/OKWcI7qaHfDd9s=;
        b=LdNYBMjUhQzJa1vFRH8Ep1RCB6r6GVcMOPs+x8A2Z4v8Us2exg/mjcvlG4qGt0cmAk
         EkKqGWtHJ4v3/i0BEU2MDUiliXvHoJZQC3DSdHskrrMWJk6qFo9of+lUXgNdy8hK4Yv0
         SRDPzP39KULlm5NTz2AvHRfgFxSDKLUvkKBc/Apg4whcqRaLCKH0J7E5f6bTeVVXHjdS
         2vYN3ufqCpKyS01YtOoDOce2OW4rGxT/I4aLDGPFA0IeiLrqvHYA7O8p2ADS8/zzlTJb
         0XN8S4dHNWxNAFxBhWExEhQuUe9DMP8F/Gy+4oqn1cJstxPHbEMNSfSJUWnYYFQTQOio
         z1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705608413; x=1706213213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiNAFYNzh60Xuezutbt6PuwpTTLS/OKWcI7qaHfDd9s=;
        b=Nw5BR6dnVJyMxVFneJlq29lrS9Bjv9cGGGJyyfZjbd6Jfhq2zJ6SPBRy5Rp2d8oF85
         mUTfbR3wZM3638m3gDwJl7JoHBvBKQR1/LmeLwTLnKoi0f3sKf51r5rPuWR1An5Wzz5v
         FVttqpzKOQ/pps1/5+um9g98J42pL1vGDO/MyBYiLKWVD7IBH/1L6hi6soPNetTeh5d4
         MAkx5D0BGnxWFejyv8BBRtNI2K31PHuBaJCoqSiOeEVvsTCIHY/aZCV/2C6VZq4E/dse
         qW6EfOSpzEvklIaH/aY5nNa4gf6mwhC915N42H0ovS/F5xA/GbNosIr+NOhRk3bHI2HT
         zjlw==
X-Gm-Message-State: AOJu0YyyBiRkjZKM7dGHSysHNVcYoeqTMTzzAvhhGPLhGRRkFkBLua6x
	ZYm1pUI2e0t+vRqmce3RPToVNu1+7/ijDwU+j3fOFrdL/0biNlZpbhReycqoakY=
X-Received: by 2002:a05:600c:3317:b0:40e:85fe:af82 with SMTP id q23-20020a05600c331700b0040e85feaf82mr1044508wmp.24.1705608412751;
        Thu, 18 Jan 2024 12:06:52 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id je6-20020a05600c1f8600b0040d8d11bf63sm26933714wmb.41.2024.01.18.12.06.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Jan 2024 12:06:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	qemu-arm@nongnu.org,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eric Auger <eric.auger@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Alexander Graf <agraf@csgraf.de>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Joel Stanley <joel@jms.id.au>,
	Hao Wu <wuhaotsh@google.com>,
	kvm@vger.kernel.org
Subject: [PATCH 01/20] hw/arm/exynos4210: Include missing 'exec/tswap.h' header
Date: Thu, 18 Jan 2024 21:06:22 +0100
Message-ID: <20240118200643.29037-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240118200643.29037-1-philmd@linaro.org>
References: <20240118200643.29037-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UHFSKQqSw9pR

hw/arm/exynos4210.c calls tswap32() which is declared
in "exec/tswap.h". Include it in order to avoid when
refactoring unrelated headers:

  hw/arm/exynos4210.c:499:22: error: call to undeclared function 'tswap32';
  ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
          smpboot[n] = tswap32(smpboot[n]);
                       ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/exynos4210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index de39fb0ece..af511a153d 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -23,6 +23,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "exec/tswap.h"
 #include "cpu.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/irq.h"
-- 
2.41.0

