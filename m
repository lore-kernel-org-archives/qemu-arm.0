Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2430258lfb;
        Tue, 7 Jun 2022 14:36:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/9krorxlRbINJX8Ye5BuDcHjKaFP5meWNF57XrTpVAVNw3eH3of7YRtDq0EvrCjKT4aCk
X-Received: by 2002:a05:620a:b42:b0:6a6:ab7a:8d0d with SMTP id x2-20020a05620a0b4200b006a6ab7a8d0dmr13159132qkg.515.1654637818881;
        Tue, 07 Jun 2022 14:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654637818; cv=none;
        d=google.com; s=arc-20160816;
        b=xPsukdCVDgm+6A2yZ6+cMmjX8ftcfhek0h25Nh0m+/QwId3cv1MW0Fcs6RoLcX3owv
         YnrylEevLlJ3l5csdupGekJIyF0nYcU5d27lYHYbtzoJHM6SYNhUMy5+hTqV/DxAyFAP
         9iCoOGHO3WgGaGrQn2wUR++zsOXsWsW0nUrp2altRXTZjByCldJ+GHZy4aB+AEfo1gVu
         acqPtxv/c8KQrayZ/4LCNG2JKU1nMzyA6z/ewWjP+k0lGwq/WfQg+MJFYtxxg/dS9Wiu
         QjM4TAq/hh6psDYAON2RqaeWujfu54DknSNd+Sl7yDGTcw2YuVXF2+eYqHgxprQmtv0P
         ObIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pyZCOGTvs2PmDR4WHKguGZ+NHJT+1M/Dn/XfXNcerpI=;
        b=mIsqEZEKlmUQAD5fC/oxtbfZGm+nrBTTTN0/QoB7u9jlXBxFkj5lobFjj8O79fUzd2
         iBJcRu9zcTOAadLxEBDFriB3/TMJjKp3Zssfzj+1Agn1/cXy1x8SfNyGV9voVhD/Dyow
         1SMeUN4pwfAyKrSuRfO+obkgckqff7LvLL1RR23oU5+Iyacx2Y8hUaDV+khA6HdE2uJk
         pt/OZhtrBXg4rKUmrvkB50g7SE/F+68JAB5jUYL0cWrG1s63zaw6k97VPP6SqBOCcKuY
         jWrsflyr/nt8XkP6CQz/0+bUJne1/yKbSvhR20xPnoZEAT6TlWsnGjfm3s7rb2scgmK5
         a+dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q8spuEpN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2-20020a05620a414200b006a6b9378a5esi4589147qko.15.2022.06.07.14.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:36:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q8spuEpN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygsk-000881-BL
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwz-0007Vg-AM
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:17 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwq-0008I7-Lh
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:17 -0400
Received: by mail-pf1-x436.google.com with SMTP id bo5so16515071pfb.4
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyZCOGTvs2PmDR4WHKguGZ+NHJT+1M/Dn/XfXNcerpI=;
 b=q8spuEpNSiC5KQFE3GOsN7tYvcrEC/bl2kgFDlo/ElW12e4k7pylrE2D9twSnFWeYU
 X1tzK2EFh75lJs5PTpwVG7eCl9oCDxPnKZz9ZeMlkcv4OrEa8EZanBxWRj7OMNlMHlIX
 cza+ZHx6QaKRu/dkwVsUPXLL+ZdDCglXRwwx4SP5UHrTCuUe4MBFAM3OgaHETTVqwsWj
 9+hZJneML3V8njnfVxwjuhAPxtOfy4pzMxoY+UE0BiIpbDuWILEaUUPiRPa0lXOA4qk/
 SwDnU1swwLPtnf6XBoo/oLl0HGARQfCiwRMQnqKL/Ox9DYFprPOvNs1tAQECVInmQKu6
 j7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyZCOGTvs2PmDR4WHKguGZ+NHJT+1M/Dn/XfXNcerpI=;
 b=cr2Wn1/bpqu4RAD77dRFzmZEunXs9QdmF5saDlbUK/1iG7Xrjq67v/ZU7nchdRIMzv
 L0/ZoOWWmFTuid6DOX1XD9oJSX6w87IW9H0PAoQCudMnWSa20JRJLrV54wReUiIXxvZj
 o/o7OP+qDFFxjmC0zq6qsna0oWH9V1RIkXtoDf4Sq3Cz7eRQnYFXsgGV3Qe81DAH1nk7
 RZuND1NW2oHem78lFz8dl/fDRzCFT60+S2bghSldUhEkTeojOtMAg8vRdjy6N5N/+Opi
 egN50vw5duBXtqcRMpbI8ZGHkotNCCx1DYH7naL1axuE37696xfSQjiuuDfnIJBEhT9l
 zMKA==
X-Gm-Message-State: AOAM5339kqkIryX67oDjnh00nR+MHIIBXvBmvgdHfOmSJS9S9yGrSn9q
 AHgr7AbDN0Agh0OuDfeTuo5XWA==
X-Received: by 2002:a63:f915:0:b0:3fd:876b:808e with SMTP id
 h21-20020a63f915000000b003fd876b808emr14116646pgi.403.1654634227784; 
 Tue, 07 Jun 2022 13:37:07 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 65/71] linux-user/aarch64: Move sve record checks into
 restore
Date: Tue,  7 Jun 2022 13:33:00 -0700
Message-Id: <20220607203306.657998-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: lTp2wa9OJKzL

Move the checks out of the parsing loop and into the
restore function.  This more closely mirrors the code
structure in the kernel, and is slightly clearer.

Reject rather than silently skip incorrect VL and SVE record sizes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 51 +++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 9ff79da4be..22d0b8b4ec 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -250,12 +250,36 @@ static void target_restore_fpsimd_record(CPUARMState *env,
     }
 }
 
-static void target_restore_sve_record(CPUARMState *env,
-                                      struct target_sve_context *sve, int vq)
+static bool target_restore_sve_record(CPUARMState *env,
+                                      struct target_sve_context *sve,
+                                      int size)
 {
-    int i, j;
+    int i, j, vl, vq;
 
-    /* Note that SVE regs are stored as a byte stream, with each byte element
+    if (!cpu_isar_feature(aa64_sve, env_archcpu(env))) {
+        return false;
+    }
+
+    __get_user(vl, &sve->vl);
+    vq = sve_vq(env);
+
+    /* Reject mismatched VL. */
+    if (vl != vq * TARGET_SVE_VQ_BYTES) {
+        return false;
+    }
+
+    /* Accept empty record -- used to clear PSTATE.SM. */
+    if (size <= sizeof(*sve)) {
+        return true;
+    }
+
+    /* Reject non-empty but incomplete record. */
+    if (size < TARGET_SVE_SIG_CONTEXT_SIZE(vq)) {
+        return false;
+    }
+
+    /*
+     * Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian load
      * of our 64-bit hunks.
      */
@@ -277,6 +301,7 @@ static void target_restore_sve_record(CPUARMState *env,
             }
         }
     }
+    return true;
 }
 
 static int target_restore_sigframe(CPUARMState *env,
@@ -287,7 +312,7 @@ static int target_restore_sigframe(CPUARMState *env,
     struct target_sve_context *sve = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
-    int vq = 0, sve_size = 0;
+    int sve_size = 0;
 
     target_restore_general_frame(env, sf);
 
@@ -321,15 +346,9 @@ static int target_restore_sigframe(CPUARMState *env,
             if (sve || size < sizeof(struct target_sve_context)) {
                 goto err;
             }
-            if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-                vq = sve_vq(env);
-                sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (size == sve_size) {
-                    sve = (struct target_sve_context *)ctx;
-                    break;
-                }
-            }
-            goto err;
+            sve = (struct target_sve_context *)ctx;
+            sve_size = size;
+            break;
 
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
@@ -362,8 +381,8 @@ static int target_restore_sigframe(CPUARMState *env,
     }
 
     /* SVE data, if present, overwrites FPSIMD data.  */
-    if (sve) {
-        target_restore_sve_record(env, sve, vq);
+    if (sve && !target_restore_sve_record(env, sve, sve_size)) {
+        goto err;
     }
     unlock_user(extra, extra_datap, 0);
     return 0;
-- 
2.34.1

