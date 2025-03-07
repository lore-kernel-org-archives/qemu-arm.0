Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2405520njm;
        Fri, 7 Mar 2025 11:16:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhRSRwynZL9VsNJZlaaR1Q6t/lwTC95diej3jD4TTucVJOegCrTt5GDTRSGh9ac31FCnWkPlxbYvzqgA==@linaro.org
X-Google-Smtp-Source: AGHT+IE8KpHA1wrR0/pqdrC/2KU7tPIUZJvAclEqNUHJJ800ntA5f96xAjAt/wmzmRyL0Ke31BE9
X-Received: by 2002:a05:6122:8297:b0:520:42d3:91d2 with SMTP id 71dfb90a1353d-523e4031333mr3421935e0c.1.1741374970829;
        Fri, 07 Mar 2025 11:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741374970; cv=none;
        d=google.com; s=arc-20240605;
        b=QZHS+Rj9vku4vCD5sCp9wRCPgnfP54osgsHVMqEeTGrfu1uFL1qdth30UCn0mZIaE4
         Bq1TLdu23hkLSDyijce3mkEnhyUl8R3LmNOahaYBoz+8TmQTO9xsNuhyOCnldEg9KmzP
         UaN2DBagk2MdgPviH0zg8NybfoaY+czUPylJyDkC7im2rQ6eEYXaVCtDo1eKIOxpc9Jb
         egOPM4p8LlJMoFhM2m1FBj23EAvum9/5znZvN1hRSUeAVY9fluhGrcqICcOVeBTp9Vbz
         fpxqkhveJmLV0e9t3ZUsySd1YIrblOYrSpmYKf8FbU3NBXlYd0mUJ2sxSr/hkrRdFKZo
         ZG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=On4l8+ephhyxnF5Sg2hS28mxdMItPRQFA8cbtmg/w4E=;
        fh=G/iztjpJmuf62QnY8qQLa8MWWC5y4XWz0BPBBAr0A/k=;
        b=AbFHBVNjNEP7e6+s4o6JneGtjP0W3IruL7qjtiJdVp1UI/9s3tgLhv3zISmxrOo2jN
         n57PApfqzsiOo8TyacB7xyBJ5U6zD+G8cYHS5d3c7v22HHDMmHY8Y9jUhpMPgDAnsjoL
         RKAXH/Oo8fQFGwnSeXswXo+P6lrUNEJ939rQryqsd1cROkpj+O94GByVfhzysDrIpAFz
         Zh9tkAJ0pTEZ0TJx83BF+v0H7i/PtpthNElhbiHDk8404TAvad6Uzgtgcm17kTv2q9R0
         jVCmDSWeC+rVEFS13Y20bh0h6Ju3JwAkk3scDyv+G5qkunALHubTscUvv1wDeOueK8Ow
         lHtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="S5M/BiAs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-523d8a85298si910326e0c.16.2025.03.07.11.16.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 11:16:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="S5M/BiAs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqdAd-0006DV-W5; Fri, 07 Mar 2025 14:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tqdA4-0004tC-7x; Fri, 07 Mar 2025 14:15:09 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tqdA1-0007wz-78; Fri, 07 Mar 2025 14:15:07 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 70384A45182;
 Fri,  7 Mar 2025 19:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C754AC4CEF0;
 Fri,  7 Mar 2025 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741374897;
 bh=AJ4q+ksNB/S+00rtzYs71awF+2iIilrq6aaRwUt1Pzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S5M/BiAsKnzREVeCWrCdJDADY7iq1bCovnPnakVUuBQguNKzCDkcAwvwfzjUhC0S8
 xGW90W2lvOjR0XFO4YhlTKB00Pe2QG4BgD/L0JOOe7S+1Z8pMBHWpLvC2C3b7x7Xkn
 R6jdkef0x0rmDUwn/xLrmyp1a76hlmbnXt4ZXTLAs0kL41q5d5KiSoqS6IXjTAbm3B
 pV7bBvwcg2AUGkU99UMbX1UMSonzfx++ZUFRvJAPitO2m9igNbG+115JeSMLXNdfh8
 128zFpOPown4igGulbo9z6IpokKv3JevS1l9z3GsQN7bo1MuiW+VRl2qKTJBA9TPll
 6eGWOgU8MV+Sg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.1)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tqd9r-0000000BQmJ-2qyw; Fri, 07 Mar 2025 20:14:55 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Gavin Shan" <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v8 02/20] tests/qtest/bios-tables-test: extend to also check
 HEST table
Date: Fri,  7 Mar 2025 20:14:31 +0100
Message-ID: <48dfa6e0c11faae34e63d6cbeb834fd9b6e9b095.1741374594.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1741374594.git.mchehab+huawei@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: kjx1s5P+GPep

Currently, aarch64 can generate a HEST table when loaded with
-machine ras=on. Add support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a333ec43536..8d41601cc9e9 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2122,7 +2122,7 @@ static void test_acpi_aarch64_virt_tcg(void)
 
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
-    test_acpi_one("-cpu cortex-a57 "
+    test_acpi_one("-cpu cortex-a57 -machine ras=on "
                   "-smbios type=4,max-speed=2900,current-speed=2700", &data);
     free_test_data(&data);
 }
-- 
2.48.1

