Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3261117njn;
        Wed, 15 Jan 2025 10:14:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVPETa8XNG5fcT3UyPx/d280FPgReUJ4PTqUA+vnCi/PZ8YyYmpYDM0g9I6TWlSLfH1JN7t/UMe/lBVJA==@linaro.org
X-Google-Smtp-Source: AGHT+IHF+1M8gZPgcVcvQLxB843aoi7EH71JTPshwrRD8k37QbBhoP3TLTBqc/x2aLvvyngxFs03
X-Received: by 2002:ad4:5aa4:0:b0:6d8:aa45:a8a2 with SMTP id 6a1803df08f44-6df9b1e5b75mr323277546d6.11.1736964882417;
        Wed, 15 Jan 2025 10:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736964882; cv=none;
        d=google.com; s=arc-20240605;
        b=eOuRWfCxIS2XnFfB51a3Qn2gpM1oYpJRBKq+YObX5ouGDs3TdGTTCV+MKA1ne23PDs
         nBW24Lzt9E8UiYtGjBgAqMKqmKSbB0uNrk2Y8meof73vmrPzFNFE/0/mUQTxwAkokNkM
         FKSRqCHek3kMLNtWoxEkYQiX+NRJ1P55WVkp/O46qeY4d9uTgJOkS6qQwq16Mvph7hFr
         +aCf7uVt75HCXXW5jRPM6rk2Vz9WBVacVSSfjDCYtfauo7AgtKBiYhkg60xzWg/hDvZR
         yms9f2QTUxcJRoUpPemCh7A6FbnzpH65ArHXXV5ppY9TMa5pEScicxDU4M09WeCfyFRy
         g1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Kii3OpRcU1wXLSEo03c2NmodU8Ev9h2TzMQ/hu40ANk=;
        fh=ucn1jh7drrJI4AeaSlJo/yeFbVqHDwEZjHOWfY+aW84=;
        b=FeH9v872zYTj94QLWMcIV9SNsH/UmvG/dJJZ41Gu1X2SG2f7Y0SzBd/ibWkASDr8RB
         HDKa48kmkkmKnNne7XZRqFRPHy01Mk/2riKM+MV2slXC6lEhFDGmuPajHivSWBV404gP
         /RUMoK+CNtA5V1Tcms5MdR+PcOfsZlRe35fyVcVCKobW2e0VdHVUYy15b1OQKgn54BzN
         vkD/EUqhnc5EvKGWDR/gBMvaPl2FqGRjZUK5KsWORA7M3zjcf+h9dRggbN49zHoIBE60
         BsRZ8CUmXfonRVcL6LaLCNhKCAOWc9Ea08QX3ql5Ztaa1YY8+Hx5RoyMb9Y+E7CPd93C
         6KCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DvC3FD8Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfadfa134dsi142951116d6.378.2025.01.15.10.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 10:14:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DvC3FD8Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY7rn-0003sP-FT; Wed, 15 Jan 2025 13:11:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qk-0008Db-93
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qd-00070m-S6
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736964630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kii3OpRcU1wXLSEo03c2NmodU8Ev9h2TzMQ/hu40ANk=;
 b=DvC3FD8YS5eix059ZgmQVf1XP5RCdL+b67ws0zo4fhZDaRd+V2hGoEj/bERFjqVxcoYYGZ
 UjpmHw4MoD8QX5CSJaDAx8KydzNQQpVL/PUfincZymG1a0YRve9N9ijxC4Lkym6Ft2ARW0
 Whjd2P3wll0/XUecj1A0LisTp/deF5I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-1Ls9EmDwNm-lQ3szYBKYDQ-1; Wed, 15 Jan 2025 13:10:29 -0500
X-MC-Unique: 1Ls9EmDwNm-lQ3szYBKYDQ-1
X-Mimecast-MFC-AGG-ID: 1Ls9EmDwNm-lQ3szYBKYDQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4359206e1e4so32477805e9.2
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 10:10:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736964628; x=1737569428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kii3OpRcU1wXLSEo03c2NmodU8Ev9h2TzMQ/hu40ANk=;
 b=GXjcXYyFzvBNLhDkSGMZdjUvT/1NYs3lU4oaGPebJH7MHo15zKlsa0L7zQ/zqsnedu
 ZG/COcWF6R9dtaQ0WQ1WZn8EdfVUHy75WW64Geft4w26ka/58FIo+h3Foi/80vxcNq9E
 LkkzNBylEUBbrotPbZgWpE++z3hw58b0/V4Hd7JYnQC4zGYFQh4J4gx2kLmZEwk2RpBp
 PS7/ECBdjasZqpRVDbQSrvHJl4D+MojoVXZETNwhnY43+1tqjSEJS3z7bsRdzdwm/9eV
 vpIknQLw9FNp4MWBhazohMMwtmhwOJUW1T+UlrPZ3X5uZ2oaDv8Iq1pyUIdL8T076B8W
 ZteA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWB2TcsUX/QweNlByoeshZ0jIsDuTRehSsN+rFV4qTdICE5U2g2pBD6QwMXlHWEnpd5q/r2xKrLQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz8oBcKX98pFNW83EMJw0mnanwAYBTN3McvXqn1sB1Wot1j0+0Y
 jq+DB7GxwoyViAiRrT/wlYsgOj4X8qz+uXr46xTmx/His8NKK5cfv1yJG6+sp+mraGKxkINDFhk
 Akty8C9mPlBTc8n5gKr0udSSas4//Gvsgk2OQJyM6mFwZsrQXyQ==
X-Gm-Gg: ASbGncsbxk6bL0ApjrDQ9KP1x3IXC5ofcJB3WkLFnjBbFkvGJGLTAO828v+GhHNV8p7
 h7r9yILwRS4vaUxlY9UZtvHM6jcECZwi9vVxwsssF6xJlQem25jrn03Y0601xM3gsWwGiz/tYhQ
 BGyztNUHYfuh+fGZecx4VHbYb/zqQxRlNVYpaIzZo1+Q86F0ATQl3DD9jCPA65h306kZHkmaZQz
 rrcMfK4gz4Fs71m5bOW+jB5Ki/ckeFBnvU01T3znnLp80YsO32w
X-Received: by 2002:a05:600c:54c5:b0:431:557e:b40c with SMTP id
 5b1f17b1804b1-436e3fb231cmr256182565e9.27.1736964628338; 
 Wed, 15 Jan 2025 10:10:28 -0800 (PST)
X-Received: by 2002:a05:600c:54c5:b0:431:557e:b40c with SMTP id
 5b1f17b1804b1-436e3fb231cmr256182335e9.27.1736964627999; 
 Wed, 15 Jan 2025 10:10:27 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:342:db8c:4ec4:322b:a6a8:f411])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c1664e8dsm43324755e9.1.2025.01.15.10.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:10:27 -0800 (PST)
Date: Wed, 15 Jan 2025 13:10:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 37/48] acpi/ghes: don't crash QEMU if ghes GED is not found
Message-ID: <1acc8d4e647e3d9fc45cc43c216e784e47a74809.1736964488.git.mst@redhat.com>
References: <cover.1736964487.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1736964487.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KxQl9sfcl7HmB0e9XNLbIRqJTsx37pC7R9HO2BSVvU0_1736964628
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TCrzmUQvONZD

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Make error handling within ghes_record_cper_errors() consistent,
i.e. instead abort just print a error in case ghes GED is not found.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <c7e1665ba46df321f0ce161d60dfd681ab827535.1736945236.git.mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/ghes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 66bd98337a..6843ddf64b 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -371,7 +371,10 @@ void ghes_record_cper_errors(const void *cper, size_t len,
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
-    g_assert(acpi_ged_state);
+    if (!acpi_ged_state) {
+        error_setg(errp, "Can't find ACPI_GED object");
+        return;
+    }
     ags = &acpi_ged_state->ghes_state;
 
     start_addr = le64_to_cpu(ags->ghes_addr_le);
-- 
MST

