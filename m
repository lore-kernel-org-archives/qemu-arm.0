Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp140925njb;
        Thu, 27 Feb 2025 03:04:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUzsLDPJS7WfPtkKpzXNUo8GybfHzdr75N85e0EZAlWICTrw59oZqHzDcL37k3R5B0LXQtNUaiQWIROMg==@linaro.org
X-Google-Smtp-Source: AGHT+IEK4LdmUQbYP1pwz68ETQVoNS2EpYVfvRB+ezVPwaOOzplJ9Q1fanqw4tn6YwIFcYIhNmED
X-Received: by 2002:a05:6102:54a1:b0:4bb:c490:7d88 with SMTP id ada2fe7eead31-4c00ad441camr6496016137.12.1740654296637;
        Thu, 27 Feb 2025 03:04:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740654296; cv=none;
        d=google.com; s=arc-20240605;
        b=fqd9wkSheQLg6SmH9ZsyLk/2KbQTrg3p467F+9Vkvisn0ztc9EC2V5q6dDI/vNj7LQ
         9zkOODWWxCoVGs8ItLZkz18aOEeTpZUvTrNnnmarXgWttQLkv9gkwRg7NUOVlgqIYRzp
         NQwy3PgvJ6UaV7ASLqqv8ccgCdZvVYHOkV3BJdhaDrAp8/vvev/8bN7hbwXqleQkL30o
         u1vYI/tCRMkRMxydWFoQM+vViehIdiwJFPN1HHKS1IHD1yBYTH4fyGYxcOzr7PLv10Ur
         PEhvMr1/pYWcQU3Em1mnhP7TC3NzJU1pxnpr65Dcw8U9ja4yH2ooeVkx93frWJL6p5xR
         O3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pB0hoYS7OUiMONNmtFAYKM9PCvowUtwhTN6ohhyMh7s=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=CHQUe/HsSvmyg6k/Ib8mPur+AGuu3+DXz7V3p35hRtnTwIP082KdY/dioGx27Fv336
         e5HcPj4GRftd9jm6hLPHDtXSB4+Md6BVDOyhESsCFtWSMG8ldtDoViACXZungTRH3Irj
         83csYx8mxPk3u9fmIv9pvnVZrvU/YoCchgDY7LPJ4JdnGo8iuCw5Gsj97Epo8Jcscfxr
         HUupjVU+GXQ1n8QaCRZxy77pMneamdJH3uHtZWZsSXZgkaaOyJBeCBOABn3OHqNrrsNT
         pOplw4wXWt5uUkSiqmRfw2W+1VYlvxJHzfIl9vhuLUdFzAXe+3M4o1EaPz37SGLO/wW7
         485Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BAXPfdMC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c03485ad62si157486137.453.2025.02.27.03.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 03:04:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BAXPfdMC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnbga-0004ob-94; Thu, 27 Feb 2025 06:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgV-0004mS-UZ; Thu, 27 Feb 2025 06:04:08 -0500
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgS-0007Tk-65; Thu, 27 Feb 2025 06:04:07 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 52BC4615A3;
 Thu, 27 Feb 2025 11:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27009C4CEF6;
 Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740654238;
 bh=k5E8zYD/Vp0nYR8SBW8TZ3Ix4TuME3pXjKPF5NCHL7s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BAXPfdMCrMPBU7IgB4t5XJ/BQJkIRXb3OenmvoEGV4Kdd50m7ma1vEVvieXJZukEZ
 A7LtOryDUG0ckFqqhJe+EOA0fYBiSIeV9OQ9RIPAUclFn4ZOAkmbGAo3P+uYdiUMgV
 OwKAS5LOWxSd5r9Od4gSIg8P4BWp5eNVnVajF0T87Qqe/f/XO9/zeFeR7M16F4F1Gu
 OQZ9TwjXl0GLFKR3AqMkwjmQ0Mh++ctP2xmR/7UBeO6FzLnJcvJbADB3IP/xayIA/2
 wx/ikDbMTa7UdxI/QqDML8wIK2mJ9tnAiIIIkIJCHawV8KyElEHDbI7asWC/nLrBJu
 HD6dQSXCxIc/Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgK-00000001mRA-181Y; Thu, 27 Feb 2025 12:03:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/21] acpi/ghes: create an ancillary acpi_ghes_get_state()
 function
Date: Thu, 27 Feb 2025 12:03:40 +0100
Message-ID: <a84cb4567f087231991ce05980d2f331b772dab5.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2600:3c04::f03c:95ff:fe5e:7468;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
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
X-TUID: tRuGAS8kYBNg

Instead of having a function to check if ACPI is enabled
(acpi_ghes_present), change its logic to be more generic,
returing a pointed to AcpiGhesState.

Such change allows cleanup the ghes GED state code, avoiding
to read it multiple times, and simplifying the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by:  Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index c3a64adfe5ed..0135ac844bcf 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -608,7 +608,7 @@ AcpiGhesState *acpi_ghes_get_state(void)
     }
     ags = &acpi_ged_state->ghes_state;
 
-    if (!ags->hw_error_le) {
+    if (!ags->hw_error_le && !ags->hest_addr_le) {
         return NULL;
     }
     return ags;
-- 
2.48.1

