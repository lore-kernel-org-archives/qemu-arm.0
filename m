Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp518931ejg;
        Thu, 18 Jan 2024 12:07:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiBvexe38zeYABm0H0H11HVCZCanDDHUJlxH+iPHBXkQJa7HgxFOG/mfmoQAS2gTDeq3rM
X-Received: by 2002:a17:90b:1208:b0:28e:2294:78ba with SMTP id gl8-20020a17090b120800b0028e229478bamr1193191pjb.93.1705608439914;
        Thu, 18 Jan 2024 12:07:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705608439; cv=pass;
        d=google.com; s=arc-20160816;
        b=M/oXsImzd6bTx9HzHuQ5oOzhOOcyX/zm+WL3Ni99uGU/C4VBytSeteL6VLOa7By/RK
         xj/crw0iQUTrko09Aye/gcrnfxVubIhqT22U3cMNHWI1vp893z17iQG8Up4zV1n6+siY
         SJhd09eHtIoEI9mR2deoVSTTIfOKy6bYSEKzL3s8RvUeLETgiF3YS0CkVan5D38u5jbB
         01Ryr8yVCbZ/wtE+9hsuIV1VCW6OQVa99zTL+E2fldOCKawSYgRpdIIBAoKp8lJohqb9
         p+G0n3efg8JeddbE5c8RkrXnhsyZuocEqP/d5s4GNCAN6+KeIQWz/vERNMCNQbAtyEfG
         Tm7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=5DV0gjEvxVYdSUXbSGfE0SOvd3u+uIvvVQeLb8GJ57M=;
        fh=cUgEM3TMHOIH70RmHTmTZxZmItZJnKfBWHSaci49aLY=;
        b=oXfX9ujL0xtwUe0bmr9jzXVLoKY0NaviZi6+olc4LshQ4kXiXXROCIH58LBg2KyN3Q
         S/CNYUMcGOMw4fcwWtawfQwnqGnboYqU/LIB5toJ1EI/Mog82j+ypvw29mYZPDXxlYS4
         2AxagDi1FSZPNjvFMnNtTnbS/RZvZIoBstmHNu+hAEz978loZbJnz22V8FMFYlCsq1JM
         s4nYU33oVu5p4naSAdKOHkEJGYwofUQEcIV4COxLz/Cfb1s7tBfqL+TRjvlSGSVADa2d
         upIOOCSECghJgbfyU1wM4D6+BJpzy+ZdNSF0Su5XvInPB5R6U7mxIRmwcFXdf7ozt6eg
         689Q==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ga3/pHlI";
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6434-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-6434-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-6434-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id cq16-20020a17090af99000b0028ffc9c1453si1962074pjb.21.2024.01.18.12.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 12:07:19 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-6434-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ga3/pHlI";
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6434-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-6434-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84B12B25FCC
	for <alex.bennee@linaro.org>; Thu, 18 Jan 2024 20:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A5C2E62A;
	Thu, 18 Jan 2024 20:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ga3/pHlI"
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C6D2E641
	for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 20:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705608427; cv=none; b=QyhvEVxb+j4k9LGPNSLy2WJP0j2hOXlsL6Cy6+0aGTQPpNxyifEcs5lZziBNCLyhaynL0azOn6It77uu4cG+FzByApgTlIKsQHTw5eebpkwxevWw6maxpbXlNI5C8W57F8mmmzuJxuB8WNPXQFrONDD9a3nd8T88vVucSbYGQnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705608427; c=relaxed/simple;
	bh=tv4vAiOcp6184qBhbcUf5afz5+FGGf+V6gkBDL5kRR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xid532NVacbgjznMePN0QBOo7EhiJNLp4rrb3gGsCa/FEW6PfB7ZZWDX1Es8cGXeaomNn3zqhtFGe6+XvYpxyhAJYeGMrhcHRg8N5S6IY9/0Ewq0jQ9Fq+pzQhnbfvsLJUSCVudSqZ7YuVQdh4iFgwL9+RpHuiT+zcTm5Z7kK34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ga3/pHlI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e958cd226so125725e9.2
        for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 12:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705608424; x=1706213224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DV0gjEvxVYdSUXbSGfE0SOvd3u+uIvvVQeLb8GJ57M=;
        b=Ga3/pHlInLDyujuWCjy7x6StVO9rTvf/uxu2H/Wyx1wl+aX2mwoyKyFffWsbivtqtt
         Gb7WHgjzBAYVjH9tax2xBXcHfE+vTX77XxES5Y0ym2nu8g1B4keM6VmmTvdHoLEbT2PK
         SdZrmFT+wCkq/1XzUuVJBiQbJ24X/Lx5oP+zAS5o6uRIYKon0nQZT+3HYRjN+jxqXjE/
         pu4AW1Hf/702Lxku+T6QbI1s/obfskkoEXyUK4WTD9cV38OmRMysBh2JFRujQMoLJ4kv
         nwRXiPZx2VVQw/WONbWlbAHrTXRnwrevp8hAkG3tvldQZJFtja6L2ZxpTu+AAdxlmzAz
         60aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705608424; x=1706213224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DV0gjEvxVYdSUXbSGfE0SOvd3u+uIvvVQeLb8GJ57M=;
        b=AgDJYd8dc/STDxLpEwOBmNafX62ur4dEAYUnIp8eiqBtadXCH40NzU6Gv510xcziI2
         FW6cJN2L9UCsHGkvHtm0wPSCizNzDk8gHNFUgqnbaiXVgZ1XFgTYgtshieQrOjo+n/Xp
         RvTJew1U2DXykvei/XVVJtKzFY7o/mKf73rgfboDwhLuTszEesMiA95SOI7xg9dyVTh5
         6VqlgjuxIU4e1pAgM8+wFqF3IBzPvMIjWbp8qecJGB2ZJ0U3LE8eLdWx7P8OxO6cu+aF
         GOA1KtrQSVZcBhqnJZKr7t8NhI8aRxL4gswZ9DG9gZ28pjBLisUwnxNskw2hmSP1DoGS
         pfjQ==
X-Gm-Message-State: AOJu0Yyitn0xAToAV60hYrJDf6sVcb4t4TgXYC4V/OgeSbrseYudON7U
	nbYL+2vRT9dSGh6PcbrVtPQw4jIma6MH1/Ktp7kQyps6yXhx9fdKGPZHEUSdwjk=
X-Received: by 2002:a05:600c:2981:b0:40e:954d:1a1a with SMTP id r1-20020a05600c298100b0040e954d1a1amr749105wmd.76.1705608424346;
        Thu, 18 Jan 2024 12:07:04 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b0040d53588d94sm30769470wmq.46.2024.01.18.12.07.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Jan 2024 12:07:04 -0800 (PST)
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
Subject: [PATCH 03/20] hw/arm/smmuv3: Include missing 'hw/registerfields.h' header
Date: Thu, 18 Jan 2024 21:06:24 +0100
Message-ID: <20240118200643.29037-4-philmd@linaro.org>
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
X-TUID: FGKNZ6QI8b4R

hw/arm/smmuv3-internal.h uses the REG32() and FIELD()
macros defined in "hw/registerfields.h". Include it in
order to avoid when refactoring unrelated headers:

  In file included from ../../hw/arm/smmuv3.c:34:
  hw/arm/smmuv3-internal.h:36:28: error: expected identifier
  REG32(IDR0,                0x0)
                             ^
  hw/arm/smmuv3-internal.h:37:5: error: expected function body after function declarator
      FIELD(IDR0, S2P,         0 , 1)
      ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/smmuv3-internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 6076025ad6..e987bc4686 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -21,6 +21,7 @@
 #ifndef HW_ARM_SMMUV3_INTERNAL_H
 #define HW_ARM_SMMUV3_INTERNAL_H
 
+#include "hw/registerfields.h"
 #include "hw/arm/smmu-common.h"
 
 typedef enum SMMUTranslationStatus {
-- 
2.41.0

