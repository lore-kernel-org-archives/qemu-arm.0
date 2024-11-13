Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp207184njc;
        Wed, 13 Nov 2024 00:37:45 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXBjvZRMNHlLLfrG+5HN2z46ebmqoLV/YGGoc6Y/JwXBG5gc/65eo+bkjiONxJF5+/3+p9H+AFYmjZmkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGfKVWUqqvREQ400BfiR/xYnSwwBTJW0tqy73LGj9KnY8+xN/S/hi/xVPzjquMmurlxkUL3
X-Received: by 2002:a17:907:961f:b0:a9a:420c:d1a6 with SMTP id a640c23a62f3a-a9eeffee0a2mr1936659966b.48.1731487065276;
        Wed, 13 Nov 2024 00:37:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731487065; cv=pass;
        d=google.com; s=arc-20240605;
        b=fRvQVvNv2g0WP/1alZH0lpIG71iJJdHZvLEsN2GSgWHw5u+y5/GLLK0BfsOdo6YqmM
         hrsRiugsirAqOFWou7bwPhsP7wJHDTRxIdUsuct3l3q45aBg8e6anksgXKrBPDjNjhcO
         XROWgKjJtjUiEDMdNQnjPL4xveqY48gkY5NOc4N/NZs0ZZTTRZZLqrTs/90l0iwpj1Ie
         F4z6tsYCEOSxkEzMaRVP2Ta49Mw9XU2rxqPSJ0Vr9fCz7QbSNAStlEjsJpm5Jm27FF3X
         dFZ/JDZuHkIlLUkUB6myQdp2Jam3WaQgmwz8tyjw+mlp2TaYJ6M8l9653o4b0TjMCzVJ
         Zs7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=BX2L262XJu69IAb33i2A+r4fI0M8pczjnOdgH4i7JCE=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=g8VXwvBMbNUN5CZmh5xQMtREl/uT3KPuAGCxHleuGi6RyhN28jTlYYPpYc7JH2HM4g
         dAi2c61nYbzZyjKJZGgpgyalrbniqPn6X4AyaRhIOLAk51UuqQaR0VhVY6GWSoI+ILwM
         8bwX9y6UVP59c/XD0FkG+CHkjV65hWmRipgy3lCOQqec6wUXAmaQs5lsiXxsMnKKDc8H
         7IGA381ezsbOA21bkjRl40KLXWwA8C/D37h1jAdjKEKuJv0pyrTPJqclVqhU2YGvlm1v
         CHQmRF29jO3InqnE8PR5v2DDq8Pss+SEvPiOWMjvk1xc5OE9HdIABCCzyM2Ri/3NVZnS
         LBUQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=DHZPti3N;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-407238-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-407238-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-407238-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a9ee0e2d923si918037666b.768.2024.11.13.00.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:37:45 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-407238-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=DHZPti3N;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-407238-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-407238-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAAC31F24511
	for <alex.bennee@linaro.org>; Wed, 13 Nov 2024 08:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C85618A937;
	Wed, 13 Nov 2024 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHZPti3N"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D143189F33
	for <linux-kernel@vger.kernel.org>; Wed, 13 Nov 2024 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731487058; cv=none; b=dowThznZ5S2xcbZOpUfDvloh3UPS7BnGB59WHcuLoo48JIXEAjXrdM3SA3d3wbzY7VYmmzfsQrfTHYt4XI1ejDaWlIFGbUPtfBDiuSTseE0Di4SuFkwotVN8ZSbPWSKqMi9ss0Yz3yzBOeV2pl8uV4i1vcsHfn55Pq250Qrtr3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731487058; c=relaxed/simple;
	bh=lwZ1IuYRe5DepXtgbkyvIhp+Y4LghKbMjDoi/VUdCE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=trT+wkNZ2J2g3c2RzqOJGJQJWQEartvLsBhLsn0388H//YohUkHCnn2kUZje7JrAEk9QyP5etpeOpdoR+nt4x1+2IH9aewSujti0TU4FjJiP7JpcVwigVHVvj0Vj3JdbKsi9GqRk1Z/xFccsmt1OKBm1y09T1FGFkh41CfvLopY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHZPti3N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5FFC4CED2;
	Wed, 13 Nov 2024 08:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731487058;
	bh=lwZ1IuYRe5DepXtgbkyvIhp+Y4LghKbMjDoi/VUdCE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DHZPti3NrNr/nB9WNK34DSpnoerejVPDIZd8LPTwgfyh5EE1e2a6R/FJl34ek9DHq
	 2YxxlABSLWXNG1lnI6HM1V1ONtK8+ikIbqUAP7+I6mXGX3tMWf6M9cegfDp19MJAvz
	 td32tEJWZdeqHLHAeg6TsbSFjZLbQN9nK7TaummK93APgOI1rGve8yfWJEihIuDb+J
	 whRl9ThXVg9+oe3m8pVoeKMdx3UJ+0pGFVq2otWojx/y7lUCPK5vVFdiGMK5N10Zq9
	 dsGNvded3W7dQFG4puOuEa5ZIi0IUMHbtq0NNNSy6H/XUhKtmbRHySnXkHRf4vRBmP
	 AvwY5tNHE6I6g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tB8sZ-00000001Kw7-3WGE;
	Wed, 13 Nov 2024 09:37:35 +0100
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
Subject: [PATCH 3/6] acpi/ghes: rename the function which gets hw error offsets
Date: Wed, 13 Nov 2024 09:37:00 +0100
Message-ID: <3dccd08b82755bd42ab61408d5d86b2bfe2f2f01.1731486604.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731486604.git.mchehab+huawei@kernel.org>
References: <cover.1731486604.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: OJeyw8//X3cs

Rename: get_ghes_offsets->get_hw_error_offsets
to make clear that this function return offsets based on the
hardware error firmware.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 4cd79d42cd04..c93bbaf1994a 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -399,9 +399,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
-static void get_ghes_offsets(uint64_t ghes_addr,
-                             uint64_t *cper_addr,
-                             uint64_t *read_ack_register_addr)
+static void get_hw_error_offsets(uint64_t ghes_addr,
+                                 uint64_t *cper_addr,
+                                 uint64_t *read_ack_register_addr)
 {
     if (!ghes_addr) {
         return;
@@ -445,7 +445,8 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    get_ghes_offsets(le64_to_cpu(ags->hw_error_le), &cper_addr, &read_ack_register_addr);
+    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
+                         &cper_addr, &read_ack_register_addr);
 
     cper_addr = le64_to_cpu(cper_addr);
     if (!cper_addr) {
-- 
2.47.0

