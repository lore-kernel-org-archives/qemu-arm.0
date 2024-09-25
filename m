Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp94470njb;
        Tue, 24 Sep 2024 21:05:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhElkfE0gVdE75kSKQ7LPS6zXX6HcxWLZ6H8z2ChQ3vKSCIVPYZbRmT/NPVirmYQglgEVH295/MZWsjg==@linaro.org
X-Google-Smtp-Source: AGHT+IF8Sxd2SCn6Q+k1+yGLsgAffw90ii/r9W5uO47a/qSSezHAf1dt+25/X2XWi7mDR8HOshsn
X-Received: by 2002:a05:620a:1a2a:b0:7ac:b118:a732 with SMTP id af79cd13be357-7ace7412254mr217949885a.32.1727237155711;
        Tue, 24 Sep 2024 21:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727237155; cv=none;
        d=google.com; s=arc-20240605;
        b=HNG5kBIvATQwZnnTLliBZlS/Hrm4FnBDYPzjjdM7FQj1+IRHPTgccb3An7v8mbqKmZ
         SdfeEBNx9Kes5Fw9rxu4C7Zw6fp6z/C80K181V4WWMpkx78D2RX+F/PKlG84vr35q4rc
         kgo5aQ/CmZFoCc/tggbimA84mjMxMQg2d/1YCz9EraKyIajuwPQa4J+6Y4ldbn4G+noW
         iaVZtxzIrX5IoIJEK5G/9oeYsWP+lODhtiTCrHgf7es9KyLrf9nV5HszADp/XYjIA4RE
         ina62TlR2Y6FnruTJfQ8dJ5PZ9ZPhvGQGHSSa5tyStvk38b9pmFjqi7vE4KW+8aDeBUq
         seyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fiJKsEFf39TWI15EhWIQiNibmAdjy6exbzRh/bfdMXc=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=ZNZFf50GjD4dUcOOGtH7hxzKp6g/L2KCgJvcbpmjqho9baNjtO0t/nSU5gN4H4dHpx
         huCHXqMkIA3a2BAZtAHqjVLSV2O+AyavsO8cvnAaon25hER647wGLqzJVCZwyEpPOnPs
         +KGF4M1tQxQR7W4s+6zhDNcXWf2z3ZQ5oW7X2AX/n7Cmu0PbxEua/5EwQ/qjm3lwBjWc
         Nj07kp88Nlaz+1ChuqUPq6bduVZr1xQBmMkXVv+tSMVvdmuoZ3irLF+Dm3nIpzFpmx/O
         6SzXg2eI2+KUXDjdFR22ttiNDPnRCswn9WpzB9jMseQaz9XdVmSLbQ5z5BEc/pgf24KW
         iyUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kYfIcqzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acde52c895si318137785a.38.2024.09.24.21.05.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2024 21:05:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kYfIcqzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stJGp-0005ds-9e; Wed, 25 Sep 2024 00:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1stJGn-0005Z9-0B; Wed, 25 Sep 2024 00:04:53 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1stJGl-0001x6-Ap; Wed, 25 Sep 2024 00:04:52 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 502045C5CF4;
 Wed, 25 Sep 2024 04:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6A1C4AF10;
 Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727237088;
 bh=v8wm2+xdvIMDHDnfcAvH4A02Zc/d9CmE9Hcf+GpD9Zw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kYfIcqzp0UzZL35M6KmLaIhTwWDDmhYeLyKGKZf0S6NBRGxhw2bXRf0DzK7zFVui7
 BocC36UvUywwEqkbEMkUZ9Mihv8btx8wvwWZzzf3e9U+HB8K4LH093mXdL2HF3K2sI
 Xy1/is87vKOOvlzahmdVL6RozbPchWiPE3BSgDBFTafBRDAA3QxbfKLGiwVuF0IidF
 oXgKoAAupEDhclaGsw3CYEa3G89mMSUaG5FlZjxA5ag4VzHHlxYOHa95pohplyIYHR
 boRHKO5b2mpf+oHB+fDIvl85w1qYEhoIdP+lnrb9uomhlRakkzcUZZZ048eyZ7P665
 mOi/y53KjakBA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1stJGg-0000000828P-1YBD; Wed, 25 Sep 2024 06:04:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 12/15] acpi/ghes: don't crash QEMU if ghes GED is not found
Date: Wed, 25 Sep 2024 06:04:17 +0200
Message-ID: <dc61673f18e44b0c169762a084b77acb6a76c738.1727236561.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.09,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: pL3aqhGDd5N1

Instead, produce an error and continue working

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 3af1cd16d4d7..209095f67e9a 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -418,7 +418,10 @@ void ghes_record_cper_errors(const void *cper, size_t len,
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
-    g_assert(acpi_ged_state);
+    if (!acpi_ged_state) {
+        error_setg(errp, "Can't find ACPI_GED object");
+        return;
+    }
     ags = &acpi_ged_state->ghes_state;
 
     get_ghes_offsets(le64_to_cpu(ags->ghes_addr_le),
-- 
2.46.1

