Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3040446njn;
        Wed, 15 Jan 2025 04:51:49 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXGzuTztzXWFJp45ls7HpF7r9qeGgWFjOXAY3Sdlhu5pEwDWAwSEkG1LsdwI+TgE6OJR3PY4hsO5loDMA==@linaro.org
X-Google-Smtp-Source: AGHT+IFBOEc/jfLoNuV3AemX8QvmRdQ8oSPudJxTxM2cgY4Dw3Z6EgiryDolJfXdbKs+izRX9sTq
X-Received: by 2002:a17:903:11c9:b0:216:2426:767b with SMTP id d9443c01a7336-21a83f4250cmr468110055ad.10.1736945508911;
        Wed, 15 Jan 2025 04:51:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736945508; cv=pass;
        d=google.com; s=arc-20240605;
        b=fIAZ1PWUoc9ytIIymRxHXzSzoc0DzANCiqNhPlKdM4fCF62Oqk0ufbL/CwRVCI5uWz
         LrTw/HwiemQQj1DG5WRznT6WETQF+7Zmw90zMLu9XakMb/2ITYxurZnx54XC8xN6vKc+
         zCVVGkbHabYwBzt/GocFEtXpzrAZjQQFKZyG8IOgzH78xhA8h/V9pO1D6w/QT2V7R2lq
         c+fN7WyLSCz20xcOPa+yaMoxr0n1uPCDQVfzvW8s1AfvtR/IWBSq8OGNp7aECy9zzGu+
         o2Hc6/AXU4/v4akc9u0GXv/JeP6JSQ3QyYkZrCyqwyoLvv/mlRsGuyrkVly6NHpnERuw
         n8NQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=vZzwLn0gMUL10FCpuIXjZKOq1Tpxem/DrrO2golTkHk=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=ChTcxw63Fn0LrsHIz9050h9B3SLqcWfFqbAuke1adDwMcvFK46vBpkJk745VHeVkkI
         E3a2srtKM6sx2pTs4Sqib6/hUZq7jFhP1/RCOYh9F2uc/iMVt+c+n8KI/58Zf1R772J2
         ZiCGBXDZr67LaMoxMVOMpFNdLbMkyg5eVY3qH6Pj9hGTpss5b/hhm1rdAKvPfU6553M/
         oKUqiiS434VeZzqmI6Ma83f3HvWxPPx1aFfdICGSD0kTpmUxJAuaadu+LKCKsgImzGS8
         ZBB1D3RcCZxY/IuGIruHiZ00h06HZwtpUJyBIYLMysZazlzFdsXAHrsiZXGmPBGy8Yc0
         ziwA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="pCngK6/F";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477905-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477905-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-477905-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id d9443c01a7336-21a916ecd8fsi164849785ad.5.2025.01.15.04.51.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:51:48 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477905-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="pCngK6/F";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477905-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477905-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFF9F7A270F
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 12:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D17243854;
	Wed, 15 Jan 2025 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCngK6/F"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A082D22FDE9
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945441; cv=none; b=eMTAKhGnTlPkEs4Ju988BsWFpaX/b4lsrmkWP1HPlHeGNq6UqfVNmKdvvWBm4aaNnS9E6koJqJl2B5jvfEfoqURfGqq51vqqLClJ6bpRIg3jXOZ78Nq3XjUrbqIvnoWbPBaLlefz+ChB9FlehjC+5nvhaJPWY2NmAOqpxnmzHoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945441; c=relaxed/simple;
	bh=WUvT8Ughz2H3l7zFkf4yAqTlDCn4hpG5JQNObbE2feQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgrzs24EQKtUz9hbQJgfe9hRpz2YQqOG4SdKUqWBRYwihOSbiAE8qFHRj9l1yYwnPH84KE/dPfbAJ4ahtV7XvO2QbFmPtDTYEJ7L71pf4HGYL1MOP2hJbJUyEnFQmAdGdiH+KCt7ZtTbh3SUL8pXXeU5w+4GJMA4epkznx773sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pCngK6/F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22341C4CEE8;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736945441;
	bh=WUvT8Ughz2H3l7zFkf4yAqTlDCn4hpG5JQNObbE2feQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pCngK6/FPe60s4xcZs9ZOQERYwO8e/2N3vRoLApL6Qyc5dBXYzjJqiNk4wSVR7ifq
	 wSu8MV6yYBJkOgWD6zeAGZskeTATmi5y6q2p74DR4ZQkfziQjn3x4wSTaGXXlVzXsD
	 rgPben40QTI6PTCuxDqN+wHXHLfqWvzyN6CZSMSDluSxqEe/ucfmWsDt1KLC83jt3V
	 C6bf2cJ6o8Mmx5n7ACHGwYlxAVqGRt4UBPjnNSeXocKQzeYPtazyyz4+1pkMoQK2Kl
	 l2pQN1vvYwOimpgmGs6UMmb/3fk6hE5ONMXrwtnv587ngSlaVvy/UYw/ng4GKr5N3o
	 S2DCv9oE8UrOQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tY2r1-00000004yFi-0d1e;
	Wed, 15 Jan 2025 13:50:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 05/16] acpi/ghes: Fix acpi_ghes_record_errors() argument
Date: Wed, 15 Jan 2025 13:50:21 +0100
Message-ID: <d55f2a6ede5a168e42a20a228b2c066cb4c60939.1736945236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736945236.git.mchehab+huawei@kernel.org>
References: <cover.1736945236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: AlwghizpAdyJ

Align the header file with the actual implementation of
this function, as the first argument is source ID and not
notification type.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---

Changes from v8:
- Non-rename/cleanup changes merged altogether;
- source ID is now more generic, defined per guest target.
  That should make easier to add support for 86.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/hw/acpi/ghes.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 20016c226d1f..50e3a25ea384 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -73,7 +73,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
+int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
 
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
-- 
2.47.1

