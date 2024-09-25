Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp94179njb;
        Tue, 24 Sep 2024 21:04:58 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXQGHTm2Ie39By0NobxIPy9ePGJGYmVjKuruA/Q6Gvc7b3OA91Uck0Q2NVqKoGvqapEre4n7SI546k8kA==@linaro.org
X-Google-Smtp-Source: AGHT+IHK3VFO6Azl4XQ3Dzyrmmh+tzaaPsx6HJ0Zpc/DciB+99fvcreV5gVnOVZqEZ35aS2GesMf
X-Received: by 2002:a17:907:7286:b0:a8d:128a:cc23 with SMTP id a640c23a62f3a-a93a06c5dc8mr95792366b.59.1727237097937;
        Tue, 24 Sep 2024 21:04:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727237097; cv=pass;
        d=google.com; s=arc-20240605;
        b=R7+oEGnsJQTwaRSm+iN4IXmUCQRGnSCjNzJdMmR/xdgxXK6zivu6gtbl9ZM+UQ+PeH
         12VXRkNlbRf71vlP2yw1OogNBMuU4eP0Rik+u1pF2JDjg6dgKSN9DxyLEZdDLa+r1zC2
         UL1w9JANWSPpqGYXJwXZWEeFRoWQS4fWGNzp61WTlhyzxOnFGMt7edSiWPIA2t9qPXn4
         E9sU4VN/wzT184dLE10QxA6We67jFQ0p8sN0eCONNvEkEuL3+sAut+Lr04Rsv8s56XWD
         d07TxtPGVEpBEHnfcg+jOfuPac2G+bk4kNd0wV10woqsNa0ABEYJH9tGWwG3VrSXK7d+
         mBYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=+YUeC08ugN2JBtC9RDi/UUV820Wlh8ypgFGLGbc1FxA=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=UWJs/5TJnLoVPx+2tkOjVrOiSNHkSIJAsSZCDGkaCvRAK0eXqDGrsOQiI1snbK9/j4
         a51nsBtlA+ejrau/aiLYZ9rHTYfwc3sIDFJTo47BzdxbKCaEyLxGCVx40wHwFCk/8ZW2
         RQ/T41Fth0fyy/5qhuWbkSgSH/W72/7r5LolaP8RX/BUgbFopJkIr1xC7wj09EotT2Ph
         FnLWhjA6zIcEKCP8RlF4FBIjzZjdp6ki8+ToFmoiw1McFT0U2X/iaMAghRePDbA1TqZg
         shrJdn/BjIWAt5uu0pJ8u2oBDPxm/CjbLqErY1MdO+jVYC29hGsbcnUKiDXcIn5zHM9U
         yAAQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IBpqOl5V;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-337973-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-337973-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-337973-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a9393115736si186339366b.853.2024.09.24.21.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 21:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-337973-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IBpqOl5V;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-337973-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-337973-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85E2F1F22AA5
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2024 04:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8F014B95A;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBpqOl5V"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DCE14B94C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727237088; cv=none; b=aDyPbJvB4IGwJxFl4/TxNCGKAW2/NuCXE9oIhUWRaIuMnsUMAL/hNzWM8m3TuUicwa22f4KVzbjlud2Wl1idbZmVcJi3DgVsoqic1TcSlSeZU6QjRBJ7tex9/mBHj5AgVehvhBsSx4Ryhy1ouF7uEmeE0ol2KL6xS0N3cLdcaBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727237088; c=relaxed/simple;
	bh=BSna6PtTcJXhc2BwT04xbR58a+FIME41kCjBdqVnEa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDlI6PuWXByJNQT494DjyOUMHReeM0FEbBAu1bIXW4wQ06iZtoyhNlZ3r98qIO7UA1JL7kAf+P7wSxOUG7hSAuFxdkWp4W6AE009Y9MvAFSH/5wUV+YREEwh+5EB6lw/xh/Y5zs66fhHsmmGGbVZVoh/nvtthqv5j5N8oVW2DeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBpqOl5V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07961C4CECE;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727237088;
	bh=BSna6PtTcJXhc2BwT04xbR58a+FIME41kCjBdqVnEa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IBpqOl5VZruvvoSmGlu3kZ3tJ8SCyosM78IgpTjij0u3uNNeY7TjmHDdLXDSnKXcR
	 ybOWAg5aVBUwYafMsD2XG2xLTJuNdhVA2ryAVFb+5oEgvu0V7c7bJI6qKknRuWuQUu
	 q3v4iJ3ynhYsMI+LkM6kWZKg5qde4Q8H7vNHPwwMVtfJ+AYVpVcDDVJ+xe2pcE325G
	 Q+Q/5mHab6utJL/12m30b0q2I9h0fV63yXRe/m9l6l0KAvfVnotVgJYO6EzsBRe9sl
	 QkKvvV7HNfYZwRgi31YTpQnl4BEPB4TkwDdaU5Lfmiw6OIMcTKEp3I91rTaumHxI55
	 +roBRiu6iz/8g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1stJGg-0000000827x-0lpG;
	Wed, 25 Sep 2024 06:04:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/15] acpi/ghes: Fix acpi_ghes_record_errors() argument
Date: Wed, 25 Sep 2024 06:04:10 +0200
Message-ID: <58444cff65cc5b9164f47db4685910a2602b7d13.1727236561.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 6XrEtlZNTKrU

The first argument is source ID and not notification type.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

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
2.46.1

