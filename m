Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11C5606A31A
	for <qemu-arm@archiver.kernel.org>; Sat, 31 Oct 2026 16:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2eEvLyE
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNC89-000207-1T; Sat, 31 Oct 2026 12:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNC86-0001w3-3l
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 12:40:30 -0400
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNC84-0007gu-MD
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 12:40:29 -0400
Received: by mail-dy1-x1329.google.com with SMTP id
 5a478bee46e88-353804b591eso2792611eec.0
 for <qemu-arm@nongnu.org>; Sat, 31 Oct 2026 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793464827; x=1794069627; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eGnVCnTQCp+6LgMeUUkhTtcg3Gr700DtQC6abT73vWQ=;
 b=x2eEvLyELCQGjquBnIwuRg1VgUXXhGtxZBdISNPDiTtpJDar1fxzzQxEFxXvaIArfy
 2zZanF9viiN1cI3PssF/p/kxQRS3OXMaa7qcFlizB8qSOWTl6Rg+s/CfauzLWxtb+Kxn
 8cr2gUHBfxYmBJwVV81QpdagsuJkgbOsuh2pTtjCO17Hpml92bCySIyAHNBYAr0/mPqj
 Ehr9k8tfSrWfhqkXhvYhVnEWuXIolP0k28inchXiNEVb0VtYCEKR5PH2UPTwMiXFIkgV
 uLzPvNbCQ30/n+WzwtFZNujq6DRbBsXaYE//2KlJCk/EqCk4khVZOaDbWo+IcLHZDeyx
 gKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793464827; x=1794069627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eGnVCnTQCp+6LgMeUUkhTtcg3Gr700DtQC6abT73vWQ=;
 b=RzGgXNt5ffEQIMgANbXFpEq958gDJFqq8SIyODXzPPQ6WE0+fpM8qvgu/hO6Z7iSq9
 GaJFzRm+FlCjDB1Pk+KYk7tG4fNSyNwPDNkHz9LFpm5cuHDNOG27Tuis92XWHDiy94/p
 nvi1xn1EIfBtucHaYCZEZ5Mn6LAKLDxb6L1QIij8pow72pvByQbl5YDt513F7Qb/mKsq
 j/yLpSiglohpPBUq2bnQeHIA2L9Z5tIbiFr0nitgoF6EBX6DhMYZcQBSeAQqOTVYW4Y0
 88Ugv+P1ZHZJKLJD/N19DKfGvWvYdU2zx005Ba2b6NhPprMvSLg+Zrko7WoG0HBIuR0r
 0EBA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhU1nLioxpuIJPfAQjowkqD0SOcl4nABmwUjgRxpheBejB2tf7QLsSPT/zQBykU+aPgwh2dxUItA==@nongnu.org
X-Gm-Message-State: AFq9FYIE1nqzGRqiOCmrBTLRuZ1dCUyYaD0dU7T671Uzv2M0b8zrjhUW
 kYwVEH9OFAHcvTWTDAzHKpCJMfkpRpcJlWZBVXLMeZ5amTyztfHN27Dx
X-Gm-Gg: AYBFou39eeuKWGfqhaCuz65TQwYxoxKz5HnI5z0yGjHSXn1BV/Pe5IOU/RWBgE5mdgC
 /QTZOA+n9M4VqZo54GYkaTi0YbwOhhxxw7O3bJ765ZgnPD7x8iqg5/FTuYyZlAsXCPcuPK7b6u3
 ixabN1bwNsG8jzjGfK0R9pYUqmzfLjaKZ+napWHASwkm9SIDQUDmet24LkPN4nM2LA9F8e+YLtp
 D7CFmluYeDIWLujIew9uPssj7MJmNR3XXHD8e5qEGm7ceeMmoxmcazMLIfX1UI0u3FUK94TpwaV
 5CDT6zolYj49zgHa3CS9Y0STnfC2U0b8imqWF3LhsAkhJPhe2oiZbAAng/nlHDQil4QlUsGOmIO
 cDDCQp2B3dqAlzpsO9uOXFtpPoskS9fjURY+DrMpJYqyhAFQR0fVKJzv3cQUaH3TjICQ9mQM6RL
 OJThSfX4DK2NXUxjoyEwQCbzYGjDvh9epDe50X18M0yxMKQUP+oi0wpvOZz0eF9/CjZBDCqupqc
 M3IobqMKJkiorAUTSWczRPEzdPYsOSrECYsWUH03zv8Z/aw9wbLZL8yjlrNLRgVlSeypdLfpkbe
 KFHmo3gGo0w8I6ZIZp/BOWA4cFrcq8PbXwW3fggQcjGYgz4u
X-Received: by 2002:a05:7022:1089:b0:14d:3c0c:79e9 with SMTP id
 a92af1059eb24-1ac5b027fccmr7653682c88.11.1793464826439; 
 Sat, 31 Oct 2026 09:40:26 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac193b8179sm19574572c88.11.2026.10.31.09.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 09:40:25 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Song Gao <17746591750@163.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 01/12] target-info: add target_loongarch()
Date: Sun,  1 Nov 2026 00:39:56 +0800
Message-ID: <20261031164009.2048-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261031164009.2048-1-luoyonggang@gmail.com>
References: <20261031164009.2048-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1329;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Report whether the selected target architecture is LoongArch.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
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


