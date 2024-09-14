Received: by 2002:a05:7022:4195:b0:8a:132c:44a7 with SMTP id i21csp213655dli;
        Fri, 13 Sep 2024 23:14:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU7po0r6gStD3IkqezQyyWLF5ol9x0l8LAIEoxY/a0pt+k7liGLDOsknaCYqmLzUU0UkOU7ZbIkT0fegQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH0OlCV0y7jIO+y4eeIvuckDMrT3pndqniN1/kn0o5MCsMAzAeqRHpunU9CA0BqFEKxTBaF
X-Received: by 2002:a05:6214:3a86:b0:6c5:297c:da5f with SMTP id 6a1803df08f44-6c573570b58mr150761156d6.33.1726294487073;
        Fri, 13 Sep 2024 23:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726294487; cv=none;
        d=google.com; s=arc-20240605;
        b=KrcfuMTX695F77q7ua9em4rQaNNz8fD7YEsbryLm2lZ4tzjTPlLKFpzEMkmxs54AqC
         R5NNZu8ZLqdWXbUglN9pAQftmNA7ZwRojbO1mUXLaF8jy1t+S/0oZWc8DjBedgHpIyk3
         +FwnEZ9SFtryv7m6zKc9ioW0HAo9+fOL6OaVjzyA+nEk3qWeLJT/N+tIZ28vJPNrTSeK
         LiO1O4d7uvkdRv2kAsdvafW+EROAL+UVJXJougVLIRnp0QpoKvl21r+2nur23UQgMjRY
         e4qbp1iO59fKuXRC+A9Ctuhc9Sqx7M4CcWmGOkJ6/VRrxQG9q7+YfmCGDevU70LVpHQ5
         Xs+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Sq2VHeBYhEhDSU6/WxBfkHUI5XIZ+cKenNR+o5/Ybhk=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=ByehvqwoKwh30ot6gZl7yJCW9/toXI5TaK0dzlKiwjrSQwZwiaaMGOk5DRTADf/SB/
         iS0zLqzkhS+DRa4EUB9GzExCepH0UGAtkdfq5jN09qkMUnpftyPoaRLAc41cpWaT9xfQ
         oVqt0t2BNbloRCejzzx+Ob1rGAx6NLAElKPlZrsH+o3cj8ox80OMh+CCgyi5kb7HhSla
         QLkMuWEyYdW81lCMhgozZmrHlegwU0fOBVBRc3WOYK5ZYSEtIGDPGlY+Tqhifwnjq6GR
         hTRiPA+/X4wfufAdixDCVqUpsGax9Kd0n7q2fV4k+8bh79cw4xxZGnGL0mStHGZ9NgAa
         lqOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=euhGzDg+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c58c7e3437si8592196d6.489.2024.09.13.23.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 23:14:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=euhGzDg+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1spM2k-0008IV-LW; Sat, 14 Sep 2024 02:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1spM2i-00087i-6j; Sat, 14 Sep 2024 02:14:00 -0400
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1spM2e-0000v6-3m; Sat, 14 Sep 2024 02:13:59 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 22E31A40269;
 Sat, 14 Sep 2024 06:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B56C4CED3;
 Sat, 14 Sep 2024 06:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726294434;
 bh=398lt+dM/AeQyr12FaU/wO3g2lZqBP80FkHI8K0fguk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=euhGzDg+oAezRRnu7M6VV0DJocPTu6XQlbNzzVpBl1Hm3D9PlLJgQutabQYei93Dc
 RCIjmzSWTM/naz7e1HK/Hd4RAepts2tSb43dFgj+EyQcAzLZf9xYayu+TBaD+p/UIX
 XR1IIUgzoJz6vGhX1ckSxW/J7b1XRrGyPtHdOFclsdPXFXrQ76bNqTX++Qq9gT4FBo
 leKs9edBdoQZULis5Tiu03ol6JWdSoWkAnm80VfmV3lKWBGZw8EHvLU6Eaw/3AJv8r
 raK6h+E5yEc6aWhBRJxwUKPc0uBViwL5JFgRTBR2ZEsIhQwt2JwRTXo2mH70VRthVj
 0qRDngYKyl/0g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1spM2a-00000003V5n-0O8Q; Sat, 14 Sep 2024 08:13:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v10 06/21] acpi/ghes: Remove a duplicated out of bounds check
Date: Sat, 14 Sep 2024 08:13:27 +0200
Message-ID: <25bdbb971c3f7ccbc0e1964605dfe954193b8fcb.1726293808.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726293808.git.mchehab+huawei@kernel.org>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=147.75.193.91;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.147,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eB21fcvkxhlC

acpi_ghes_record_errors() has an assert() at the beginning
to ensure that source_id will be lower than
ACPI_GHES_ERROR_SOURCE_COUNT. Remove a duplicated check.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 939e89723a2f..36fe5f68782f 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -420,9 +420,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
         return -1;
     }
 
-    if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
-        start_addr += source_id * sizeof(uint64_t);
-    }
+    start_addr += source_id * sizeof(uint64_t);
 
     cpu_physical_memory_read(start_addr, &error_block_addr,
                                 sizeof(error_block_addr));
-- 
2.46.0

