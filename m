Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp572267ejd;
        Tue, 16 Apr 2024 12:01:11 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUgGwJ/kd8Zyvm6jN4+GOwJqhKCIplt3/p//rYCxHmLxqo1MFUH8b4zsFGXHvSgIU7xmjTDxXbrk+WQ2qkz8fVT1jk2IEc8
X-Google-Smtp-Source: AGHT+IErw6B1xxy+jxUFPDTsHjkUf8umOqGrCyHaRb6Y+RtxyGAZtMYZ5jSfVaMPBWNEy6wES6l8
X-Received: by 2002:a05:6358:9615:b0:186:e49:2f21 with SMTP id a21-20020a056358961500b001860e492f21mr14491574rwb.20.1713294071076;
        Tue, 16 Apr 2024 12:01:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713294071; cv=pass;
        d=google.com; s=arc-20160816;
        b=mwt5X+lELQke62nN4usiTIHKrmK2U5v+RRIaqBlQNpzhcweIUFX3fR+de/SJKH3wpS
         qKSRzEQZfJngix1ZbAs2iGpsv3Uk2yAtFmiHo/UC/fFKwYxAq4b0yzCRehlVCQdWhr0T
         UoEeSmo5YfCTH+spR/b+nMig2h0zkBJ4tL5nCuzbYg5KKnwSBg6u60U8lnIzuSsZ7CHI
         UwxcQXxSKi1R6avv25htRwBNnyjZrbJ9IpzP1z2RWTlg/q4T4fdkOQ1wo7x8gmUlS6G8
         gO5of9ZFPyR2tsjtuo7Cc330kLuvin9SZrpAMk+7bL7cI/fx4yBttBtRw2xFPsDgvs9e
         VG+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=xnRVHCDouTA+5HlMl31thguywp3whz3Nvn7kAUajqzI=;
        fh=2Gw8dSm2fu0H0Lj09RI/O1B5en98C7Ps9STI5EDkYcg=;
        b=okT42Uf973y91jqsu43BiZ+5WnlyhAZ8nF3Ye7m3YtoZpf5MoACvcrRJ9yVjW95MX+
         F9wF09WQ407aqNrjHBwEYDi2P9Ji9HH5mwGJjdeeGr6rjdjFLEO7+lkfGltx5JNWDbiW
         py5dGj39KE2kRYsYI2x56uizjKMzONaZiAGAUU2G1F4qtKny9IRgrmVhTGYSpN5iJFOt
         sl6GozGMdJ3KC7wNoimK6PhYTviDJ9p0V99q6MfVf3OsmoBY4EHGjj/B/mlYpJ3Uc0dg
         l0wgGN3I3oCOTsfzPKF5v0xyORPkWC7hTFdqpmLJsAz8KSv7+qTWxjWL/ntutWw0G6mN
         PTxw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s3NNC37n;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14861-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-14861-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-14861-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id ch24-20020a0561300c9800b007e8550e65dasi1816377uab.84.2024.04.16.12.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 12:01:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-14861-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s3NNC37n;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14861-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-14861-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAC621C211BA
	for <alex.bennee@linaro.org>; Tue, 16 Apr 2024 19:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E0E137766;
	Tue, 16 Apr 2024 19:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3NNC37n"
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242C5136995
	for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 19:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294065; cv=none; b=As+nFKyDB8W+x6deIeLp4aWrCQ6yjqdo8ncU2GPeaQQ55yBQN6qBSqex8g5gA3+xyt3Pxt8mFkrJFFNwLVB9ih44McFTrnDvl+vwO6NnYrwXFNkPtwja8xmpTZTDaqAlUbEBajiMvbXWE6uM9WCY+0bRSP4s+ZEYCKITLO3pIJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294065; c=relaxed/simple;
	bh=BQwlhQjUQcq2nriHOJya+FAAFEOaeheuofiucld0GrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P4D9VNrqpjb6d+23qfHMDYh2FFwdRLlNHAaKByw0SMBb6+LhPFfbGoLjj5vq4U7AVnnJE6G3caNzI0IXiVdr1xR/3yn/WOeJdtEUGVR1qwX9MnBubnrOtiqzmg75vb3OqN2ZR0t3yR7EQ+JRacvknODgUDF2y435SV7jtBf2foo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3NNC37n; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a52aa665747so308615566b.2
        for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 12:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713294062; x=1713898862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnRVHCDouTA+5HlMl31thguywp3whz3Nvn7kAUajqzI=;
        b=s3NNC37nyN3Soj2Vyza5Y6ht/E/YC3Nn/IyORyvB8opTwPsZ855yWMlSiQc179qX8Y
         0GjKAkCaZm5JTyaElnPzdxxpG9z2JhiWMtnytcqgQFamRuGtMr6rvvXyz/+DZCWpi/FU
         PEJXpz96YAhrvm7819CkFojUK1RxYHLsK6DkU3foqj9y8PZjROTSz4DGCyya50bFM7Eo
         nAGew7S77b0BVyzfIv67XojIwzTrb4RBG+PuOgeuEk4d2x9ZTUUSm+Xezf46+eUfc/DX
         1ZFCUgXy47V76oEZiNRtiiLbHh673pYS1S+aPQmsyHpj7iBTUOElK0mSrZKzdabQQRs3
         lNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713294062; x=1713898862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnRVHCDouTA+5HlMl31thguywp3whz3Nvn7kAUajqzI=;
        b=ky/u88XO7CRYpHbl7+v/TLIio+ox5hdn2Kw+pkfNKjzVbICAhNWYqbr7QsVy8RYiDG
         678SOi0gnAi/OqSP+ORQp9n2633lsJSKwe6ukvsQAEw6v30cR22D2754HQzK2W/Fkznp
         7nWKQU46jDZqTS44PtWeWy36ZfZDu1uf/joi5urQPoT0UGkUiiRY7L/olLNWazpDxtZL
         M2EDeWy3Lnf/Y8coR73RKygseDdyXAqYo6uSZPfXVuCJEz8uY9r0PTNgapsaH8lxp/b9
         +o4j66a1X4W6UFvNDTePD69nj2Ho2WbkUKembzirA32JqOZbHcW6B+9W3wyJjOMIJa0n
         63Gw==
X-Forwarded-Encrypted: i=1; AJvYcCX4LitNdfdE3tTIetU4xshFG9kgpt9JumqByzt3S2fp4d5W0j9POpZNxK0xLH+r80iR+iVylcwxMaKjUQx3kqvhqmPV
X-Gm-Message-State: AOJu0YyG/TNKtntB4IuztQ02YiQ5SY0XRXdpl0Mh+A1Gs9JE10g/C/Ml
	bnrIrs/kJbohaDtDqjsbZD0gT3qSemafnvKO8CJwoUGkbV8Br0qoJEQinGQtIUQ=
X-Received: by 2002:a17:906:594f:b0:a55:428d:5de9 with SMTP id g15-20020a170906594f00b00a55428d5de9mr1810772ejr.28.1713294062573;
        Tue, 16 Apr 2024 12:01:02 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
        by smtp.gmail.com with ESMTPSA id q23-20020a170906a09700b00a519ec0a965sm7143556ejy.49.2024.04.16.12.01.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Apr 2024 12:01:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v4 12/22] hw/smbios: Remove 'smbios_uuid_encoded', simplify smbios_encode_uuid()
Date: Tue, 16 Apr 2024 20:59:28 +0200
Message-ID: <20240416185939.37984-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
References: <20240416185939.37984-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EiV2seLX2a4b

'smbios_encode_uuid' is always true, remove it,
simplifying smbios_encode_uuid().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/smbios/smbios.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 8261eb716f..3b7703489d 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -30,7 +30,6 @@
 #include "hw/pci/pci_device.h"
 #include "smbios_build.h"
 
-static const bool smbios_uuid_encoded = true;
 /*
  * SMBIOS tables provided by user with '-smbios file=<foo>' option
  */
@@ -600,11 +599,9 @@ static void smbios_build_type_0_table(void)
 static void smbios_encode_uuid(struct smbios_uuid *uuid, QemuUUID *in)
 {
     memcpy(uuid, in, 16);
-    if (smbios_uuid_encoded) {
-        uuid->time_low = bswap32(uuid->time_low);
-        uuid->time_mid = bswap16(uuid->time_mid);
-        uuid->time_hi_and_version = bswap16(uuid->time_hi_and_version);
-    }
+    uuid->time_low = bswap32(uuid->time_low);
+    uuid->time_mid = bswap16(uuid->time_mid);
+    uuid->time_hi_and_version = bswap16(uuid->time_hi_and_version);
 }
 
 static void smbios_build_type_1_table(void)
-- 
2.41.0

