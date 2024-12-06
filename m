Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1015459njb;
        Fri, 6 Dec 2024 09:24:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVV8JEBg0cO9LtTtuhw3hEDA7IHjmA90WI9fCVqE7qC+/R5UmL9Cfvbq+Ex0hGmYM0cW4rvGkr9sTVY9w==@linaro.org
X-Google-Smtp-Source: AGHT+IExlczHixhcB2H85SmM0/UFl8re3wG5gxoIAigijKeHaa7f4DzrNtwDnczo8cC7e89H9Yf4
X-Received: by 2002:a05:6214:f0f:b0:6d4:b1e:5418 with SMTP id 6a1803df08f44-6d8e71a2f8dmr46778116d6.33.1733505899158;
        Fri, 06 Dec 2024 09:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733505899; cv=none;
        d=google.com; s=arc-20240605;
        b=dNvcrw+sK+fPxJ7gX/cXNEh4IX7FmfhPXATr4auJaV5jvAfWh2ixa9pRPCB37hiNTw
         QjQie6+G3zbZ/HQrtuMhHjZCyjjivvgA4igIIqvbeCFdVcEePdbIFh+ztdEojiGPls55
         ig9ZMxI+Fiz3qlMIZPkyOGnnsO9JrIcGGnP3MA98nOQf8wWUJrOc4GkV25batMaGWuBd
         7ezZxgSHj/gA4XKHWk3rdJ98dNbGSLikOJmGhz+W1qe0eRPANQRTti6mAKRnkwzu7urg
         0XOuq7TapSROouQKebBMT30WiX4RxOC/74/oPevWL38JJdH25KLOI8kT+HF5yOnizZsO
         RoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=m9IXTpIFyGKl0rOyjVfGOaiDg+6SYxATRRSFoMGDEiI=;
        fh=LDn2J4ZvhJC0UF2TP4zO7FgurQWDiPRlsw1tmw1yJNo=;
        b=Y/IGUkkpqIUWAVnfnuZteGqTKwFi2m4q4lWfbthhZDVfI7P++6BjciySc3xsDYyVDo
         ozBWh2nUgRxg/avFdfaf50NUyyQWRuXj85Agt/3XdD/IgRX2MVIeijlTMFPRoW/kuSy3
         23bpkTri7IcYncoZMp4d8FfS7YAH743+5YfDG28tTkhr8SIRVZb910Wu6v0M6HJhqoZz
         +RKFM+x4qr8jvHXJyKypPvDHEEj39nLgdNFCwQqp+J6UVGJvSX177XIsziOD0/dnMwOQ
         fngJOQl1etWltIZnIO0yEqE+nWlo8NZbbIaXLXSpJfov1VaAZ/9fj5/LMYs9QoDcGWNw
         jCXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=m6EmjH7h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8f05b504esi12419486d6.368.2024.12.06.09.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 09:24:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=m6EmjH7h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJc1k-0004XT-O3; Fri, 06 Dec 2024 12:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1N-00046j-HZ; Fri, 06 Dec 2024 12:21:41 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1L-0000xo-L6; Fri, 06 Dec 2024 12:21:41 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E478F5C6ADD;
 Fri,  6 Dec 2024 17:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10107C116D0;
 Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733505688;
 bh=zxKfkNm+pSVnAEPcR6JZVOzcfRxvG1fLSm0I+c3SdBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m6EmjH7hdesUTYtwkieXwyndcBWI6xVvNKwqhUzmwbIWrGouOSzzxNCSVvvrrFZhz
 qI+OQA9NjACU1kv9SfAtYtUxsdMKYAvNTPgpSOwzKgeP4eJlPzpjtPQcQIbwrEeB2n
 sQRvctKw9GRFOLW56rszrx2/lgJxTekexq7GkCzVWjLwKHV/ROgYNapgILtLqj1bUs
 AiuEhcb1yaDVbgwRO85FdqcSLxe4HkI0oAq4eacLblzXEs37m5iY+at434OWnGMJ1s
 YIjrUjdkIGQn1OsOACYPO2hqCjw1bmBsdZiaRckv11thmBxCuQqSDXDbGIIwtElTn3
 qxJAHN1Mto09g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc18-00000005RLO-18Wv; Fri, 06 Dec 2024 18:21:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 29/31] HACK: use GPIO as source ID for virt-9.1 machines
Date: Fri,  6 Dec 2024 18:12:51 +0100
Message-ID: <bfc2a2537a301761115bd960e0c363a437ad65bb.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: n15jy4bD4gGW

This reverts commit 692373fc8838a6450ff5b5a8708646a673b693dd.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 31f2db01458d..55d12562e83e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -896,7 +896,7 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
 };
 
 static const AcpiNotificationSourceId hest_ghes_notify_9_1[] = {
-    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
+    { ACPI_HEST_SRC_ID_QMP, ACPI_GHES_NOTIFY_GPIO },
 };
 
 static
-- 
2.47.1

