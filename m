Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2431510lfb;
        Tue, 7 Jun 2022 14:39:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZy7twU0k7TuawL3rwVgqEepAmAE84A7yGqW11+pPwCJD6e//bVy+Pro/ZsoUiJc8vu5h/
X-Received: by 2002:a37:b882:0:b0:6a6:8b1d:f60a with SMTP id i124-20020a37b882000000b006a68b1df60amr18959622qkf.5.1654637988514;
        Tue, 07 Jun 2022 14:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654637988; cv=none;
        d=google.com; s=arc-20160816;
        b=CxFIzrRL7qO34FaKVG8KlJbX8k4YnaqIUtneo917UmBvKzM0Ko5+08pOazJEbLiqkl
         orPjlEkKFy8bU1Y8kHfUE7F4WAcTqEi5Lj+yL5eTlxXQalN89N+t4t4SIVPdTxBz38S7
         nYWRl/IjaSYCiqoZI6A5n3qLdpNcBFU4qG8sgKULylFkejeqTpBJsJhMarcMFZ9P+/N8
         Ilx5LJzYjarnc8C5zTDV40RjDG0PIzXlz3Z1Dx32fb95iKWkiF8RsbuL17L2SU+tlvsq
         AiRP+dsps4LxyI6mdYwp4nIS9t5hYBpQIBrZxFN8JUptUDNW6GTsCzwmj2zkroHFjROn
         fMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
        b=iD3XUsJ+lFbtYUL1QHlA5OyQJCzHdODU0TtVJo+PyHj1jNE0nRscDjKwH2FeQl8n8P
         0Zzu5aeX0+0dq2yrQuPyMhwPIyYNm0REzHe8C+b0gz3uRnuzX92c3YUD9Xig2tClJTLs
         AXmIkuJCOkQYrBn/P01/SbG1hHmdsOYi/fEnckjwyunGzd0Li6RBbZrUVhYwWjnsX8lT
         hnunhqGq14Dt2zE+cLlvbPongra9BjuN85Rrl1qKAPXz4Zr6Q7Ci4bTE+4+2/CONNoRB
         /GabD+M/W3zbtlN+Z0F15anrsRqacgcLvYbVfJyKcb3m4hhhhUICER3lI8I0GpUmsS0U
         d+Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZAjjgadE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5-20020ac87f05000000b00304c6ed1bb0si10971749qtk.289.2022.06.07.14.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:39:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZAjjgadE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygvT-0004zU-Tf
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwt-0007AE-Hg
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:11 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwm-0008E0-OR
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:11 -0400
Received: by mail-pj1-x1031.google.com with SMTP id j7so16657334pjn.4
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=ZAjjgadE2Bg7RCCjuuzOFXghuaZuR+KAvojV219qSd6n63WjYs4xH4LEiBjFWYO9pH
 3Ue/N/ygU0PdOwhYoXQ5lE3uZD9zCPWbfDZ2rkbRO0xJmbzcRgzPgRekEhHjNGMLAFDd
 oZBrNsaFpX3oCRjDVl7Zw/rF3WUF6dnD3I6VEHD4itUHpu4NrlTm/QKNNKltBk4pJ61C
 z5DqwJ9kr1NcJ1sK1yt6WkMd+ofjYFuW8BlTwzCCgAOFFZBKNJtcd2kHsy+XT4zDqQv5
 f0PQfkbrTdjuCe10SNL58DRJmyg2W+mjnZEze8Cfl624d84oOz0NmswrfDg/Nie7aNcY
 grIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=ETqSIHsg2688bBxx9M2XuRBhzfelpzrquZdvcZ82Q+FzLag4V3H5d3iRTVVhqVgQ7u
 5KVqdx0ynmPYpFfQFTVFQ+IcR1MeyuGD8mY36DqGMK9a0dYPmcL8/+4pxmseqmFHgwL3
 mHjqC/D5mVVQD5lpglSXxL6SROx4kbDfh5AGCcBie4BrjRtF3SXyPHc/lGL7PjGiPNv7
 CcKWA1+66oWsNVrME/HqRjHPLo//QblrrzM9axvizUtmNOmRM906YP+eDFD8P2zj+EfF
 jOhGDYgp0cA4v1NTNYHQfVvsSVwH52odw3rbSTnZCRVmTf51ZlTsf9YPRYI1G/1qEqxN
 xRJA==
X-Gm-Message-State: AOAM533qY7eFsdZvW6VY8pAbkYtCn0caH+sVYptat8MLAp6YcLVsoDw2
 R3qhBgNQbnr9cS+ECsePyd6/rQ==
X-Received: by 2002:a17:902:7b8f:b0:162:467:db7c with SMTP id
 w15-20020a1709027b8f00b001620467db7cmr29671017pll.140.1654634224007; 
 Tue, 07 Jun 2022 13:37:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 61/71] linux-user/aarch64: Add SM bit to SVE signal context
Date: Tue,  7 Jun 2022 13:32:56 -0700
Message-Id: <20220607203306.657998-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oiPxYtcSbmJJ

Make sure to zero the currently reserved fields.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 7da0e36c6d..3cef2f44cf 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -78,7 +78,8 @@ struct target_extra_context {
 struct target_sve_context {
     struct target_aarch64_ctx head;
     uint16_t vl;
-    uint16_t reserved[3];
+    uint16_t flags;
+    uint16_t reserved[2];
     /* The actual SVE data immediately follows.  It is laid out
      * according to TARGET_SVE_SIG_{Z,P}REG_OFFSET, based off of
      * the original struct pointer.
@@ -101,6 +102,8 @@ struct target_sve_context {
 #define TARGET_SVE_SIG_CONTEXT_SIZE(VQ) \
     (TARGET_SVE_SIG_PREG_OFFSET(VQ, 17))
 
+#define TARGET_SVE_SIG_FLAG_SM  1
+
 struct target_rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
@@ -177,9 +180,13 @@ static void target_setup_sve_record(struct target_sve_context *sve,
 {
     int i, j;
 
+    memset(sve, 0, sizeof(*sve));
     __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
     __put_user(size, &sve->head.size);
     __put_user(vq * TARGET_SVE_VQ_BYTES, &sve->vl);
+    if (FIELD_EX64(env->svcr, SVCR, SM)) {
+        __put_user(TARGET_SVE_SIG_FLAG_SM, &sve->flags);
+    }
 
     /* Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian store
-- 
2.34.1

