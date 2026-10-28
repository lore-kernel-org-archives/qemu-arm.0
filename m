Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D34E606A31D
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nzfGdFj0
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMA4K-0004xc-2Y; Wed, 28 Oct 2026 16:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4I-0004wZ-PM
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:16:18 -0400
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4H-0002Cb-9i
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:16:18 -0400
Received: by mail-dy1-x1335.google.com with SMTP id
 5a478bee46e88-3550c917fd3so2011373eec.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793218576; x=1793823376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cWoyICeXIEDcF+ntNhHWZ5R9npUPu6GPUvFCsQk32MY=;
 b=nzfGdFj0vJIWSJvBIPhLSlTeBUhNFF7qz5xNDRrDzqAdvPSTRagPsONybug+PW5r0g
 tfeLIzUmqcRtqgbSzRwegr/EQCP69k3YmD3Fy+ABD4WXxTw9+ngFldiAw1IlmpSYNfyO
 yIMh6h5nslMQuo4VES2xMsw9w+aVoQ/j5Ax19k5euGwK2k0AnXWXAo+ciTnBB9dWqzNr
 YeNuEQEWGkZPiW7W1NCv3qlEezpo6zsNyxLZtzsa9b50t3wjDT7Aztkv9ZQAENlLBfhQ
 /mJWqGjlvU+c9tN3NOvIFqwEqVc+byljC8ok4L+ysEqIp7PqVUnEvqErKGAbeBk4QYL2
 D3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793218576; x=1793823376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cWoyICeXIEDcF+ntNhHWZ5R9npUPu6GPUvFCsQk32MY=;
 b=cWqj+3CKtmDyyp+w7CdJtLr5a0oMmOMtD8yQzz5gMwfR4CrCqsTIJolrCSh9P1Ab1P
 pZ0DhahRlYuAXKcqFNOO20RqnJQmLxjSgBcngaj5sP0ERie7kZjeqQUUpsYBfmoh297q
 SgfNFV3+ug61k9075sQQKFtOSOA/8f1W+UME3oWMxxUvWJ8BRGGBLdCPbOvhfEOqKNpR
 b5yy0TKobS1/LRjt0TG0WaPrYxdw3QOBetsohjJBtYZmb3BFRGnh3AIe0u/MWs3qMVP6
 9shQD7CqaYist4xhLBur8NaUa1t4/RIqmNYM/+g5lStUQmeKDfxr8B0tOH7QN7NaMK/F
 4XWQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy5lE88JlsOrAtX2JOOKR1/xlpHg8J2vdDLmnG5lZi6+tB8xagh1K+mMA977478vcGMKp+Ud5tzkw==@nongnu.org
X-Gm-Message-State: AFq9FYIe8lTTOUTsUusRz6WX0J7sPOj1LHQBk3r5lGgm1S7XMYIsylS5
 SjoNZec4FSWCCyRFV3L3q7oBRodufPfSRQY550u9rOEDCl8l2ijkdQkL
X-Gm-Gg: AYBFou2Q6WLZwZB/ahfWgC07LpeaU+lNHUR2PBeCUAmofgu4H2IDsEwQ60E0xEBq1UQ
 01ee1AEuAVshtl3a581RMctmsGn1flQWmvs0XX0DrOPvQ/tVt5SYR0CAv2jXptEEc01gLnE3duF
 VFmvt3+kSDyjz6LD8fEqW/BzNwaCdB7UM9UybdXMfJehCEBHQ6Vo+Q4Och2kTu9QnGdN7YYxrpL
 5DnEcJmlOAh91qhDce34FfxQDE2BomWfjJTQzpFosQvn+LIvjK6ujmkfLWVpy7Tk++dQUUU7Cs1
 brm0eDgWm6Ns1X97/G59cR6MixgXRV8uS4A7EcH7KI9vSbeNzn2XUnHL94tUfDPJIPhXCoB5jgO
 eGNnW+irysLVy9c+LyDjQkdSWoGFdiQI66f4AzL+jviuMJ9UzQUfGj9Nq6GZ9aH6HmGANNl4FWP
 tIeoqcr8qirgMbEUvR/6XEHK0TRMjXuT+cHFikakMrectVtAR9gbqaZNE+hwgWDo7skh46RhkCw
 ZiqSiFiHyry646HtLjrLx0ZxlFhw1rC8VLxSt4H/wkyz6cqjnvxb/WPtyb8HkvlgKmHh0JB5O9I
 B1NWslpmVDktJ9HUhDVU19BxnL4hap2WWOSAngqNC0Hf0GZ6
X-Received: by 2002:a05:693c:20c8:20b0:369:ef63:ea90 with SMTP id
 5a478bee46e88-36a203fe357mr4711973eec.28.1793218575593; 
 Wed, 28 Oct 2026 13:16:15 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-36a23951e00sm12016896eec.20.2026.10.28.13.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 13:16:14 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 01/12] target-info: add target_loongarch()
Date: Thu, 29 Oct 2026 04:15:45 +0800
Message-ID: <20261028201557.2688-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261028201557.2688-1-luoyonggang@gmail.com>
References: <20261028201557.2688-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1335;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Report whether the selected target architecture is LoongArch.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info.h | 7 +++++++
 target-info.c              | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index 2cd4cc5671b..6c4e2809ad3 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -92,6 +92,13 @@ bool target_hexagon(void);
  */
 bool target_or1k(void);
 
+/**
+ * target_loongarch:
+ *
+ * Returns whether the target architecture is LoongArch.
+ */
+bool target_loongarch(void);
+
 /**
  * target_base_ppc:
  *
diff --git a/target-info.c b/target-info.c
index e67d7bed520..b6d9cd8d97c 100644
--- a/target-info.c
+++ b/target-info.c
@@ -84,6 +84,11 @@ bool target_or1k(void)
     return target_arch() == SYS_EMU_TARGET_OR1K;
 }
 
+bool target_loongarch(void)
+{
+    return target_arch() == SYS_EMU_TARGET_LOONGARCH64;
+}
+
 bool target_base_ppc(void)
 {
     switch (target_arch()) {
-- 
2.55.0.windows.3


