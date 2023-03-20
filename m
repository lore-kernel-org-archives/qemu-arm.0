Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp3305828ejb;
        Mon, 20 Mar 2023 14:56:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set+4lsszT1iCGbRwmTW2GZ6p1zSaRiyKxKzY1cfhvLXqMWEdWCL8CL3qEe3ChRLK78XEtd0n
X-Received: by 2002:a05:622a:11c5:b0:3de:e129:5dea with SMTP id n5-20020a05622a11c500b003dee1295deamr991347qtk.68.1679349391627;
        Mon, 20 Mar 2023 14:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679349391; cv=none;
        d=google.com; s=arc-20160816;
        b=j0xO709c1mzqnln1yEyRqN9DyOstpXQdt8+nxEzN9A9uZiGI5LoHO4yZVDeevQoBBi
         P5zf4CqQkaMix1wmSd53luURON4UtSyR7L2bEfo8xU8dxgRJdFvJbhxE5NzMkGuynEA7
         UspiyZfdEb3F7XOLqtW6/tQLVAfzZbfB88PjBaRzBoayXVDCxnrRkiKCJxCUtPuB3zhp
         9OcPoswkm/0Ia8ODoaFHH4Jbym/Dej9rmGIzbI6qiglCMNIJABsaoMd4fbqPEdHzm5+i
         Cu9y2DmGolr9caZaBzmavi+jDADT7MdkD2P/A/nXiFnU/z4Dqviy3xqKCDOA/moZumta
         qMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=Kl9Rnc3jC5wN7ou+/okayIAPmuVV14qj7WXT6LiSRPk=;
        b=yc0Zaidd/UXrscXpa2GHC9ARIUcXDdeELwai7bq6rynIAkV9LPOCn3X5Grf58MzjDa
         d6iOXD0EmoC1F7GLSwFX/2ofRzUmy3X5TQMFKJKs4zYpJIrDMBC1N8qGLseMa9eqjhuN
         YjMP4DJrkHpc5NHOVRQfs+HYp0wMsgc/uGwx8kOyDpxP2w180OqX/uaX7PwciPamNVWO
         jyKdgpmRmXJjdp6BOyu31xeiLPyoO+JU+vnyzLlHTWBekDLb8BXNtgHUt1FIPFeJ8PRz
         52BrP0Gi26uXrDSwtXt6wkRe46kOQVpMhztPVLfhSYMDf7o2ApZ7mmAPjwvErdRirOgZ
         E87g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Tyhvs+k/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14-20020a05620a448e00b00745997a009asi6707317qkp.355.2023.03.20.14.56.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Mar 2023 14:56:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Tyhvs+k/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1peNTb-0005YG-4T; Mon, 20 Mar 2023 17:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UNYYZAYKCIc4t4532rzzrwp.nzx1px5-l2xyzyry5.z2r@flex--titusr.bounces.google.com>)
 id 1peNTZ-0005WC-1t
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 17:55:33 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UNYYZAYKCIc4t4532rzzrwp.nzx1px5-l2xyzyry5.z2r@flex--titusr.bounces.google.com>)
 id 1peNTW-0006Yf-Ag
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 17:55:32 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 l84-20020a252557000000b00b61b96282a4so12351649ybl.0
 for <qemu-arm@nongnu.org>; Mon, 20 Mar 2023 14:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679349329;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Kl9Rnc3jC5wN7ou+/okayIAPmuVV14qj7WXT6LiSRPk=;
 b=Tyhvs+k/tPaFAgnWcIHKjCvZ2oKuT9qiO/B9VpGSyIbJzdKSzJe7C97tp2kLWTb46V
 UcsVaFVOM5dkj+/yglxK9fapRktqx537fXiVq+wywrhyrbNWSvT3b/0WXD3byFuscnEj
 Rw06GOQ5Z481IKLXCa9uXT3VmAvqAnG2VccNFVTqYXZidVYcvL1AzYaV+Z4T4RG7w7hf
 gG5ysnknOCqssPxIFedxpSgt12U3ErEakgYSU5TloKf4C8Yk5I9xBcZP7fwja7GLonoV
 e44Udl+Lz31BmyXL8l9UEIT3LgdO2/hG3NWHvE47b5X1UCL146aKg7P2yR4YMH8lCK19
 vnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679349329;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kl9Rnc3jC5wN7ou+/okayIAPmuVV14qj7WXT6LiSRPk=;
 b=PVXzYNNdiNBua+YFFUrWHL1iXLkoVKUGf409VtEevhqXuE2gPKLcUwfgDs/amCfxxu
 pXn3jRhOqK5lXWZwoVwuWhRO0/8h46IHAFTWGaVlb4LjyrcgSc+IEwzt/QDPq0ziaPRD
 lGjxLTVv76qLocrbXPcCus90yINBeoRRZd8GIVXbvQ1s5IWtl8ARtamEzIJckEZl+WY6
 drJ8JZqNqu1lgayKR8m3lR40796VJrslPy5YA63aPjELwZEUYBhkSgO5cpGbebWM46+s
 pLk9cwbXjOcAwKVs8PYhjIsGPLSwAW9gIVaSYAlXoFxv8L0REN7Y5PAm4EqbdnAMN7Fh
 0HLg==
X-Gm-Message-State: AO0yUKW+vHqy2NRhjlh2hN8mYtstEqB8S1XCtDFSajXj0HrFwjS/YbaI
 Dar1VL9blgup/yywrlfot14L5TavEDk=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:b663:0:b0:52b:fd10:4809 with SMTP id
 h35-20020a81b663000000b0052bfd104809mr11343138ywk.0.1679349328865; Mon, 20
 Mar 2023 14:55:28 -0700 (PDT)
Date: Mon, 20 Mar 2023 21:54:55 +0000
In-Reply-To: <20230320215500.722960-1-titusr@google.com>
Mime-Version: 1.0
References: <20230320215500.722960-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230320215500.722960-2-titusr@google.com>
Subject: [PATCH v3 1/5] bitops.h: add deposit16 function
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3UNYYZAYKCIc4t4532rzzrwp.nzx1px5-l2xyzyry5.z2r@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: JgHSeZMD7o46

Makes it more explicit that 16 bit values are being used

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 include/qemu/bitops.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 03213ce952..887b8f8ce8 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -446,6 +446,32 @@ static inline int64_t sextract64(uint64_t value, int start, int length)
     return ((int64_t)(value << (64 - length - start))) >> (64 - length);
 }
 
+/**
+ * deposit16:
+ * @value: initial value to insert bit field into
+ * @start: the lowest bit in the bit field (numbered from 0)
+ * @length: the length of the bit field
+ * @fieldval: the value to insert into the bit field
+ *
+ * Deposit @fieldval into the 16 bit @value at the bit field specified
+ * by the @start and @length parameters, and return the modified
+ * @value. Bits of @value outside the bit field are not modified.
+ * Bits of @fieldval above the least significant @length bits are
+ * ignored. The bit field must lie entirely within the 16 bit word.
+ * It is valid to request that all 16 bits are modified (ie @length
+ * 16 and @start 0).
+ *
+ * Returns: the modified @value.
+ */
+static inline uint16_t deposit16(uint16_t value, int start, int length,
+                                 uint16_t fieldval)
+{
+    uint16_t mask;
+    assert(start >= 0 && length > 0 && length <= 16 - start);
+    mask = (~0U >> (16 - length)) << start;
+    return (value & ~mask) | ((fieldval << start) & mask);
+}
+
 /**
  * deposit32:
  * @value: initial value to insert bit field into
-- 
2.40.0.rc1.284.g88254d51c5-goog

