Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1378203njb;
        Sat, 7 Dec 2024 00:56:52 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUrkKXSwJaDZDa6hjA/MoMAvj9FFsNv3c1UWeoYlgBrofRnzU17SeFCjU/DoM9TyCyL5bE8zxWCzHKPAA==@linaro.org
X-Google-Smtp-Source: AGHT+IHfII0mC8BaVdTGn/Pzg/ZjKrrN9L1YERdFH2w2A15j9Lys1O4KUuohAev62u7FtujbHT2m
X-Received: by 2002:a17:906:4ca:b0:aa6:312c:5abe with SMTP id a640c23a62f3a-aa63a266610mr564350066b.58.1733561811943;
        Sat, 07 Dec 2024 00:56:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733561811; cv=pass;
        d=google.com; s=arc-20240605;
        b=Ba1MMw/RskxdFabMizAIBZvmbaGiedGrh8zxMwoeJZPORUWtfLZGAKvYYO60HInvbx
         Hs2HUleMGTJvdv5jqpgzytlGWviIfM3TqQ1Jq7RSYHUnFYU+Y4GiU/aZa2tBq19hI33E
         /2cgGhlw0vSYMIzoLt9Egnf8r5bqGP78jHxY453V+CFzmg3O/at27Iw+JtN332Ofx1LO
         wHJPUeneqs59BhRNQtVEKPDXeq1cTWtC/NLkVV6xy5gqgmgH2gUbbpC6GR7QQFv9XHOO
         Djc7ZJmDWStEMouEGfIDfP7+dk3wC6QCAQQsCA/Luy2XKbZKvHIm1p/8wtgzUsKAxbhO
         BvNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=lR3fVOY3g4ehb77yW3uS7yXNPGV/+fMXvzpHnEiTBAI=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=fu9fZQL6Kzlh4Qm1NN58Mgo151Iw1bjdoOukPe1NKSHKi7XvSnF6srDE0vzpeXj+Hw
         VMynbdLAo37RmWgAzD1UWwPwDLd9qM0zGjFyxHuVGtyHpkuM0BERrsXdljEJd+DEAcwD
         zwayMh0P6AXSE15xw77v4R33HnQDr1LgXa7kf7NHinFRC3j4mrNrSP9PjUCg1VuqggER
         ExbU/u3A8ybt+B4rPYseTqbsvx5kf41jdP+2uShbvHTJv3G08z7AXXVfkeQwVrPrH8RF
         BlC4AS4NktEc1GDHaF+Wk3U2vNid9Glp4QNvJkjeV0JOvYcP7Wrf+cVXj1QPbPomDnox
         kNjg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="oICXu/MZ";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435955-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435955-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435955-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-aa6538678b7si49016866b.478.2024.12.07.00.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 00:56:51 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435955-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="oICXu/MZ";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435955-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435955-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AED6D1883B36
	for <alex.bennee@linaro.org>; Sat,  7 Dec 2024 08:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF3313BACB;
	Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oICXu/MZ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2AD136331
	for <linux-kernel@vger.kernel.org>; Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733561805; cv=none; b=fhHqf6Fx/L4dpd634SC4BDeQVhqcvXCNdxonhPKxt1Me9h7jcAAbTWq4sYYXYeae4nlnvWzYILJ8hmuDbQ85F1LfO5XlbgBaNLpHituc9Qiwi1Jr/fsfGhtzpv+loPUytVqtn+C3Jl11RXMgn6Y8Hdaffd3EJG6mMhGA6YjOy/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733561805; c=relaxed/simple;
	bh=XnsenWzyXY6TfpyfSZrWfMTz6cEF8BKuThN2HBT4U7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAdPmiwH1XARTNKIH7C94oSm/yPUok2RUXwHV3EtKdp4k+OvH8o2gEe30bPJOz3jyTeZWZV0G+GJ5UK4ddkPQH89kj0BftKmO03SJStUCa/P7xskXZj0J+ooJxfzp8im35on4bhm+ECDTWw4EFb89uf9L/YbQl4kK32md5/3X0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oICXu/MZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8C9C4CEDF;
	Sat,  7 Dec 2024 08:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733561804;
	bh=XnsenWzyXY6TfpyfSZrWfMTz6cEF8BKuThN2HBT4U7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oICXu/MZBjiZeFK7HCi+8cnh5oiVoKPLaguYwjFkgfdA912Uoj94b9NY6vZ+nzk51
	 e5t3Rd6N8fdXAqfBqawNarDnxBPIyVTjOuPuOwv+4hQPgZKFlKRg4Ioe+ySDxjvfSI
	 XD82eyeVBj3L5JDoyjejhS4IY6nTHGRuKwqog/arNmVe9FNEKblwcQx/SNiu900qdk
	 WRQD6V+s5oR62yzGh4HggcSo0uo3IWcbxah9/P7EVE67DQfgj394DCB4lL1vSLGlGF
	 CHJWIyerH6z6oFt/+4qzZrOwh/81uVzDqN1o/1jh1d56Jf3cfNgWZCGqnuoUWzZVHY
	 6YOfeh1NXH8LQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJqcE-00000005j4Y-3vp6;
	Sat, 07 Dec 2024 09:56:42 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 01/16] acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
Date: Sat,  7 Dec 2024 09:54:07 +0100
Message-ID: <4818bdd98597822033a10c15fcca6d736db93bf2.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: smjtLaTbmsNd

This is just duplicating ACPI_GHES_ERROR_SOURCE_COUNT, which
has a better name. So, drop the duplication.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 7 ++-----
 include/hw/acpi/ghes.h | 3 ++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e9511d9b8f71..dc217694deb9 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -34,9 +34,6 @@
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
 
-/* Now only support ARMv8 SEA notification type error source */
-#define ACPI_GHES_ERROR_SOURCE_COUNT        1
-
 /* Generic Hardware Error Source version 2 */
 #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
 
@@ -396,7 +393,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
-    assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
+    assert(source_id < ACPI_GHES_ERROR_SOURCE_COUNT);
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
@@ -407,7 +404,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 
     if (physical_address) {
 
-        if (source_id < ACPI_HEST_SRC_ID_RESERVED) {
+        if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
             start_addr += source_id * sizeof(uint64_t);
         }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 674f6958e905..59e3b8fb24b9 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -59,7 +59,8 @@ enum AcpiGhesNotifyType {
 enum {
     ACPI_HEST_SRC_ID_SEA = 0,
     /* future ids go here */
-    ACPI_HEST_SRC_ID_RESERVED,
+
+    ACPI_GHES_ERROR_SOURCE_COUNT
 };
 
 typedef struct AcpiGhesState {
-- 
2.47.1

