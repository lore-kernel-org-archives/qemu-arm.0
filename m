Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4467427njc;
        Thu, 7 Nov 2024 11:55:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV4rhDZLgpqyumbs61gKsLozzIslDlOtEWOLz2iI4Bx6KS0ZvcoEQvyathtalZX/aVGJ1i6hnyqekhNBg==@linaro.org
X-Google-Smtp-Source: AGHT+IGzDeHa1rYUhr0K23kLPiVnlDDTc4JCBkVLXaiYzlcu1z32sWp2fT8KAvvFAizuqYE/7Li4
X-Received: by 2002:a05:620a:4416:b0:7b1:4cc0:5e1f with SMTP id af79cd13be357-7b331dcd068mr56756785a.7.1731009322186;
        Thu, 07 Nov 2024 11:55:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731009322; cv=none;
        d=google.com; s=arc-20240605;
        b=N02/gRQbww3k3iPrx+g+3rLw3TdniiV6RsM4DdpvZ7+JqfznlBUtMXcpcBJNVKO/BQ
         dZ1Xgw3SVvqzPnzCIyUiRjHnJWrS2nTb8ONP/kRkoPm9OkrWNK6wbBflIhY2oGRSGtqc
         il741z7u9iV3DxFzCcV4K5Hqz9Ybxg+0q0yjd3WXHel8UXCU7Y7lHQnW0QhNqiB3SFlC
         CQBnkDv7tgm20GsrlhxA8YMNM6keyJUL8+iVuZ6MIJCd48S/TAlLNv9LSblTjr/bsLj1
         /l79aUU5EhMeXzBCURACCapHBmNAi2lXactjS5Po2aYnjdD6Q8luSTy4Id4/T5km34pC
         8TBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=3Z/XclSmqT8Xhgqma+tYcLYhVDFwTbVxhxPc4Sd2yjI=;
        fh=XuBrA54R9ySozHoD/qCHuwIA1pKE6YAf4KhJE72ECqw=;
        b=dXq+w7/btF3zyOHGgeQHwLnCqkVIDxzdx+UkIcjQwtgLtHIkw2x7PvdS3JCyueB0SW
         JAOJFSQUIwRqkMXwsDZPXSpkj5OA++YPamz+5RGwxlszSe12JhfCXYEeHoCC0XorTYEn
         BEdF4FQQQhGNd0CgcxCywmFwtwsNqe016+hR2l1ezXpAceYp46FkELUQ04qHmvKXHU+L
         mZFrvgvEaKRoX0Ij2SV0npypepAMzgVTWFEG4R63bAGS7Xv5N0FFpjgtJKfHG+Cf0i2W
         +HoVIPeFcnnJDALArmLv9i9ey6Q4CgypF9mSICcT2YSb1qAwQSARBDqvX//v2Wk8nQR+
         MKTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=ipc96J9G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32acee7e8si221433285a.410.2024.11.07.11.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2024 11:55:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=ipc96J9G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t98aw-0001Uv-PF; Thu, 07 Nov 2024 14:55:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3EhstZwYKCD0shstrqfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--titusr.bounces.google.com>)
 id 1t98au-0001SC-Bh
 for qemu-arm@nongnu.org; Thu, 07 Nov 2024 14:55:04 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3EhstZwYKCD0shstrqfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--titusr.bounces.google.com>)
 id 1t98ar-0003KI-C4
 for qemu-arm@nongnu.org; Thu, 07 Nov 2024 14:55:04 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-6e32e8436adso18843927b3.0
 for <qemu-arm@nongnu.org>; Thu, 07 Nov 2024 11:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731009299; x=1731614099; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3Z/XclSmqT8Xhgqma+tYcLYhVDFwTbVxhxPc4Sd2yjI=;
 b=ipc96J9GZq6QWQsckbNsetr6naEEjQigxVOuz7XCBliSo/UT9yHMg/k+oSmB9R2JEf
 3QmUSn8bgMw/k2UiZQbbO55srT2vMWfpJLYnK0//mR/raGdyx908XIXi0hrNqttvxHwc
 KheWPVoRS/sKdjXxb3hwj3K5UQjCBrJ4gTINDcCuoreqz/nTBJfUNTlGEzpsm7+DpBC4
 bA+ttdBe2bMU/HRmgNgciroWrBzdlhAOvHJSgMQS1YHwujW5JZKWLlPcocto4t3JSWNm
 Ikl/sWa2LXVYbW33RMU3+r5j85OHB/Gdix9SXStLw7dF+dWaYVlsgcdrrxRopou48k3r
 40Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731009299; x=1731614099;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Z/XclSmqT8Xhgqma+tYcLYhVDFwTbVxhxPc4Sd2yjI=;
 b=m7kllOLHQgs/xbCTyCQ6FlBLy5FWs5/NCVTl9F6NGbRaWNPIHk4KALO8PeS3GnYLEH
 +IGzcOHe7mmv4fN/JJc73HmRLxtQWXoUQJJP2eaidHiMcumGvZrPUqQOKtTG5a15zI7+
 yS5c5f3MJnqscPXluUrl1226kk33rfMdG7ZoU3PNSYir6YQDvbaCky7sfviQZS6bVSmH
 hFL/zQcezzB3qG6B2WJjp8/i4XPQn3wqF9ZvIzDkawKnpC2pa8ZoxBedRNIGBmHadQE0
 e/Qyd85xEjGlZJbpDS3s3PGHu9mfW0r66dy70RIvf+goNpGD4sHBMHWLhZ7mmkb8K2+N
 RCmQ==
X-Gm-Message-State: AOJu0YzrXJEXijKLwpmSWZ8gcgiVSXvPoyHei6+X1hSzzBFoDfCCNJKF
 UuvIy+0w6aIvjBxKS4KtprSaA7kwLfO5k84PdbqghrAfn7V7AHpivb3HY7+Np6ozps+36e8R1jz
 eTA==
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:dc:567e:c0a8:e14])
 (user=titusr job=sendgmr) by 2002:a05:690c:887:b0:6b2:6cd4:7f9a
 with SMTP id
 00721157ae682-6eaddff31bcmr1577b3.8.1731009298680; Thu, 07 Nov 2024 11:54:58
 -0800 (PST)
Date: Thu,  7 Nov 2024 19:54:48 +0000
In-Reply-To: <20241107195453.2684138-1-titusr@google.com>
Mime-Version: 1.0
References: <20241107195453.2684138-1-titusr@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107195453.2684138-2-titusr@google.com>
Subject: [PATCH 1/6] bitops.h: add deposit16 function
From: Titus Rwantare <titusr@google.com>
To: peter.maydell@linaro.org, minyard@acm.org, clg@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org, 
 venture@google.com, wuhaotsh@google.com, milesg@linux.vnet.ibm.com, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3EhstZwYKCD0shstrqfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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
X-TUID: qXjvZcqhrKRV

Makes it more explicit that 16 bit values are being used

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 include/qemu/bitops.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 2c0a2fe751..05179e3ded 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -459,6 +459,32 @@ static inline int64_t sextract64(uint64_t value, int start, int length)
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
2.47.0.277.g8800431eea-goog

