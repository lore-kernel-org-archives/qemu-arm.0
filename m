Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2678837eja;
        Mon, 6 Nov 2023 03:08:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1MgC+YuHshJNKh8p5AyjYlM2n47Y3FdkamKePyPmFGfS66lIfZQ325bed4sjO8OfzDCwz
X-Received: by 2002:a05:620a:2446:b0:778:e431:3ef1 with SMTP id h6-20020a05620a244600b00778e4313ef1mr13088099qkn.32.1699268928476;
        Mon, 06 Nov 2023 03:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268928; cv=none;
        d=google.com; s=arc-20160816;
        b=v5HZ7hilSyefwH5NyQLE2BtV9URdTXxP2ek7+6d1I1AmPGstF38DzQIggsOUGdOcPl
         eXkOs2qCeWUlExOqm2bnVUWxbMlmEMVsWb3/kE3gT7R1cXqDJnnZSRrHfgH2O3jGtyWz
         yn+k79Z4m27Ee96WHYGabEy0NgKPt1gc7aCPi8snwfcpli9ypZu3TMzZB9aB+xV/LSb+
         6+Rqc/aXHtF/fkEkGRKvPZykIhZcVUU7/KS1WllECGPjMOsyRD+0WT3LW5iyDrqGUTQg
         ZZEsgEtCoy7XBdQacSaosxT0q6eqSgIZq+6Omj+rRY59l305RV46bNy/7heDsWR7u+zJ
         noBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=Osm9Rqk6Yz1bOcmZt0pCvMMd/TH5Mg1H8su36lKkY04=;
        fh=peUR+mHhwMfdoRcAtzcFE11OaVaDPRqJWHoUvEpmNtA=;
        b=dlixxfTMoq4pam37diNYlH9wurRfN+7A1nSHm5aGIltmaHM18oE8aE93nfXTSRD0Mh
         PpOg/8ayBekT7bWb9lfPuy1yCixoJqY39J6Mucww/cBMrro6k65tYThjzPylPgF/x4bM
         /oGMhBBREljaU8U7h9PLWeU7lBehEgUWx1WJK+/PaXeM+RmBW+M8Q5PGdrU/friwDOVq
         sa/n2pxHP03klAokKlAYHSv8Df+5+QK0iEtKGqloklU1bhaLL7Grsrrq9aSRSieJaffe
         B3PzhxuK4aEEiBRTw/QOzgGg+1gZjVfBPgGobjXx4Z3m8jv+qPWy7vI5y50RURexN8rU
         d6vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bJJl20XB;
       spf=pass (google.com: domain of kvm+bounces-713-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-713-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-713-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id or8-20020a05620a618800b0076d873a45b7si5565851qkn.706.2023.11.06.03.08.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:08:48 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-713-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bJJl20XB;
       spf=pass (google.com: domain of kvm+bounces-713-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-713-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2415B1C20BAC
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0721805F;
	Mon,  6 Nov 2023 11:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bJJl20XB"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5576C1A591
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:08:43 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C775CCC
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:08:41 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4083f61312eso33532885e9.3
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268920; x=1699873720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Osm9Rqk6Yz1bOcmZt0pCvMMd/TH5Mg1H8su36lKkY04=;
        b=bJJl20XBgU/XXQxL1ce5U1R4wvy8LNVQLelCs2lmbJgxjlAWlt6a6Yp2NyzvwaxfiU
         lnb3p3hrMCTNm76l9+gtqLplHtgNvT2zQWFY8nQty8E6zCuXbedl06KtnpzEGWCvnL8F
         EwMTH48sbsrerLUBamDOjns1BU0P4xA7uV055Crwqc0KiXkIMfqgl6N8x3as7DX7bu2k
         y96KEvIlN8ovn+LGqz23FZ3GyT6TWqVcDsgaPbwXZmvYs/SiXS6K3gMTaA8513TySNow
         t76MxdbzQJRcUVyKjRSVK2Px2Tthy7gqPi0rp7rIBJYxc4lMvau3x7jHWRVwaN6l9sYF
         dCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268920; x=1699873720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Osm9Rqk6Yz1bOcmZt0pCvMMd/TH5Mg1H8su36lKkY04=;
        b=Jen9RvH+/LUeRyB9nWOTwVx8Q6RwjmxYNd6D0IUq3YbDB3mZrVxxX6aVRWs+4ZEgCu
         MedXxxDDarANsQhIwG+jlD5iP3q0m2I/ZC1kIMpTl/GhGl1uI5kpBdQii4VebZj8/9Zf
         f5q3j1Mw2Rtfh75MXcxsemeqaIVL1YQ7JsykDrRUaIAce6rUhLrpbiaog96YeNPk80Wf
         vHIqZPb6EPs4UM6A/51B/iVyeT+/qbIhBCQb2J0/1ywmQkwn/o+ivTrHkZXv/TSFFudZ
         xPvOStHipzaQnNy1Vz4NidRYEHB/7Tktsepn/hRPpSYx8frAteS2HkBZph7HxGiCctJm
         0fiw==
X-Gm-Message-State: AOJu0YxD4RmVbDL8DhoLjYv8V36Uf4ThviFC1bl4l06Ts5WBHDHyRiFC
	sUQv/WbMr7B5+SAD7nqBNaobhw==
X-Received: by 2002:a05:600c:4693:b0:409:5a92:471d with SMTP id p19-20020a05600c469300b004095a92471dmr12443033wmo.22.1699268920324;
        Mon, 06 Nov 2023 03:08:40 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c138700b0040836519dd9sm11912962wmf.25.2023.11.06.03.08.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:08:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Babu Moger <babu.moger@amd.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 44/60] tests/unit: Rename test-x86-cpuid.c to test-x86-topo.c
Date: Mon,  6 Nov 2023 12:03:16 +0100
Message-ID: <20231106110336.358-45-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: M0lcuu3JO+Pm

From: Zhao Liu <zhao1.liu@intel.com>

The tests in this file actually test the APIC ID combinations.
Rename to test-x86-topo.c to make its name more in line with its
actual content.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Babu Moger <babu.moger@amd.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20231024090323.1859210-3-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                                      | 2 +-
 tests/unit/{test-x86-cpuid.c => test-x86-topo.c} | 2 +-
 tests/unit/meson.build                           | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename tests/unit/{test-x86-cpuid.c => test-x86-topo.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e8a7d5be5..126cddd285 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1772,7 +1772,7 @@ F: include/hw/southbridge/ich9.h
 F: include/hw/southbridge/piix.h
 F: hw/isa/apm.c
 F: include/hw/isa/apm.h
-F: tests/unit/test-x86-cpuid.c
+F: tests/unit/test-x86-topo.c
 F: tests/qtest/test-x86-cpuid-compat.c
 
 PC Chipset
diff --git a/tests/unit/test-x86-cpuid.c b/tests/unit/test-x86-topo.c
similarity index 99%
rename from tests/unit/test-x86-cpuid.c
rename to tests/unit/test-x86-topo.c
index bfabc0403a..2b104f86d7 100644
--- a/tests/unit/test-x86-cpuid.c
+++ b/tests/unit/test-x86-topo.c
@@ -1,5 +1,5 @@
 /*
- *  Test code for x86 CPUID and Topology functions
+ *  Test code for x86 APIC ID and Topology functions
  *
  *  Copyright (c) 2012 Red Hat Inc.
  *
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index f33ae64b8d..0dbe32ba9b 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -21,8 +21,8 @@ tests = {
   'test-opts-visitor': [testqapi],
   'test-visitor-serialization': [testqapi],
   'test-bitmap': [],
-  # all code tested by test-x86-cpuid is inside topology.h
-  'test-x86-cpuid': [],
+  # all code tested by test-x86-topo is inside topology.h
+  'test-x86-topo': [],
   'test-cutils': [],
   'test-div128': [],
   'test-shift128': [],
-- 
2.41.0

