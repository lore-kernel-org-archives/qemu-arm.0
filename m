Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp24255njb;
        Tue, 3 Dec 2024 23:43:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUSGVdxIOflwZ0rsGBzLSOZMCMFMAsEZD3DNWOznmS4eOEtFLEUO5YTLcL5h0KeXkIBbRkYxoiwVKQ+pw==@linaro.org
X-Google-Smtp-Source: AGHT+IFqjw60Z6csldy68pwUIYMn9NXgA6OrqHSCbbwn5SRffvynhATFvS6w7FxAA5AZRTUy2wIF
X-Received: by 2002:a05:6102:440e:b0:4ad:5dcd:2c44 with SMTP id ada2fe7eead31-4af971bccd8mr7637551137.16.1733298210229;
        Tue, 03 Dec 2024 23:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733298210; cv=none;
        d=google.com; s=arc-20240605;
        b=YRfHniPWPAGmzw9oQUwDrcSIgzEYTAzEayMrSA9pWe21hh7YhkD4pLBh6LeYOHeZPJ
         pUAtLq0W2Oc25yrrj12W3/rkyIY0vTnI1GvqyavkR3kJIT30fIZPdU2LXm/gfXFCd4Qb
         0wAABTyyZxGGtjn+6+nP7GhyNCbkkdHN6SNd6/6/L7hFwHQ9FsYwZKU7OxTj+2DbcAuF
         ePvOOR8Dd/BhQ5XE0oTY5MMGPf44xXZWGCFDvKZ5sXInm54qatH1bvevW0dKiJXA2J25
         NZtxx5Ul1ZiF/Tg8yfUlwDnmn/Nk/4SYhPUMplsExGLVD4dhm2aMH71+bCVltFfWYnmT
         Gq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=njN0mQtiwNhoeXILTLsJquYkjIFqajhmhvFXoetcr2c=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=Fmp2zFnYtdE+EMnBkq9WSTOrhn6kBvaAZXtWamlZ81OxlLlmSnrZW1noadSk8BTBQM
         Tnp6nMiDQmsRXK9w/3u9+6lm2vrS9Lj4khcWnqrkdxZq0sMx9kEzMUFN+EPMdAz6hHf/
         GvLBEzdKozJnNwRZ4K8nPVQ/bzMcsw+rzXBnZsUES0dYl5/eQSCkvR528WmTqRxkhbo/
         Zk1YYRqDyMqrfQtNM47eQzmSP+GOW6VVRxt1WFCX87vcz3moPQjWf/ugMrNPR9INi7J/
         AChLvpha83ddCLNYx7qCP4M33b++bWdPZ/Mw5qVUhpO/tQCmJUDccFMGwizsnr8iMqLF
         40Qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XEBd8xOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4107d51si186756341cf.300.2024.12.03.23.43.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 23:43:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XEBd8xOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIk26-0003pV-BH; Wed, 04 Dec 2024 02:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tIk1v-0003m8-OJ; Wed, 04 Dec 2024 02:42:41 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tIk1s-0006Xa-Dj; Wed, 04 Dec 2024 02:42:39 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CEFDE5C68BA;
 Wed,  4 Dec 2024 07:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A567C4AF09;
 Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733298153;
 bh=EZFsmHMf3WbcMSlyh1u3n8d24jrZ2fM6gqwzFgnZ1EY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XEBd8xOGayV49WeWOwFn8wQfRHGPP9w7sohNjZh8L6XGyDbOASMSeY41VZ/Lykev/
 80zwdT/xzNQ4uM1dnCAECKCB452rlyAFsbdtrOMpa07mBDBuvVX52mdYummYAcrI6k
 v4fl5Pom1Js6d4C9D5OlOiMoaFLWvI6RFwuuLn2SMppxZ2EIc+j1lyypLeSZ+ezjbT
 zSKi7opI3jmz1EXdJNXBP+y28O4RJg0bRecMNJEMCLd+KMPYLe3yerepcK7Lm6WUZA
 tqduL3TVjcMMMWDwoyR3svoz93JCRxP7Tg2A6tO+yQTmn3I8m5Yitx0++0SMkp7wxI
 2Ghr0hv3IDhJg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tIk1n-00000004KjM-0vha; Wed, 04 Dec 2024 08:42:31 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 11/16] acpi/ghes: don't crash QEMU if ghes GED is not found
Date: Wed,  4 Dec 2024 08:41:19 +0100
Message-ID: <070b31b912eae803a47ab070f1ca747bd1e69e95.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733297707.git.mchehab+huawei@kernel.org>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
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
X-TUID: ROG1gT+cdr/W

Make error handling within ghes_record_cper_errors() consistent,
i.e. instead abort just print a error in case ghes GED is not found.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 414a4a1ee00e..2df5ddf68a13 100644
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
2.47.1

