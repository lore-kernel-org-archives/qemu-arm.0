Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp19305nji;
        Mon, 26 Aug 2024 23:46:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9OsJjF4/AX/HtbGyfHO3swZR466Sigqv3yCxZ0AgqBKUHm6jBbMG0V+Oisw0XF3bZW/f2tuKW4ackow==@linaro.org
X-Google-Smtp-Source: AGHT+IEIVaxY9Yb+XQwke7VHqcCKx8TGbf/BlotND4jIVrktyeQfNwN+kEEIBpqbAEKoYuHJzONc
X-Received: by 2002:a05:620a:2409:b0:7a1:d025:434e with SMTP id af79cd13be357-7a68971d532mr1390304785a.31.1724741179475;
        Mon, 26 Aug 2024 23:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724741179; cv=none;
        d=google.com; s=arc-20160816;
        b=TfLf7ZMfOWPo371dYbs3BNMtGwqdxwiF77uIvyy8nuutaFqluy7ZRSLZLssgq/Pgmj
         TlAwSBiQ/GCH/olUxGncaWFtLXKmHc9HHbTNT2UJtl7PF8ALUK+n+O/aMwGdEZ/RnVe9
         MCIQIP05mSMYT/NanopHsXvwoPV0+L4w0rbVxB2MAt/+paGPnVq75tVmrue7szYBD+5W
         C/hr6p9g/v3YjWFvMhEXD+1FonnRB6GxdwRaIq4q/s6OG4UEccX0nY98KxYp1znBsszB
         WUMHdFwA+0nE7vvVliltvN9a+mIzY4rWg8b909lDyP1NepUk4kh+tZd3Y0w9W1yAU7qa
         n1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=v9oflfpPfEUdfMbwTLTWxbGbyPrsj6gup4qbjEdCGHw=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=cz24v3tHL6kqFt5DohLnabW/JQKMhHDYSVv/BoYwjibg00OuL8XrFU8AnSm1fumrxB
         H7S1v37awBG0J8sPpBHONX4egj9EnauEjNZfnnSBGmRyMD9jlYpN8eJg1JoC6M2vxuMm
         Z6PKTqAV74lzjpZ2ixx4l63iiceCm5N6375f1rtUjiObHcywM5/LKN5vbyFN7YfalYDv
         AnypYGXJ/nuydhtPHipjLmkSWeTLj6Zpa6MUcr5yqOQeWZQJpqeTplLPreuUChuNMtL4
         ov5M/LeoQcOok825ryuk4QMYHkHp+o49GV2WUbXesKPNV97gYKJAEbFNkuO1NLKMXnoH
         s7aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=n6mVlQr7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f328a18si1231445385a.101.2024.08.26.23.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 23:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=n6mVlQr7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sipxW-0002Uv-4k; Tue, 27 Aug 2024 02:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DHbNZgUKCmscJeRYPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--tavip.bounces.google.com>)
 id 1sipxU-0002TB-Ov
 for qemu-devel@nongnu.org; Tue, 27 Aug 2024 02:45:40 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DHbNZgUKCmscJeRYPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--tavip.bounces.google.com>)
 id 1sipxT-00063i-4L
 for qemu-devel@nongnu.org; Tue, 27 Aug 2024 02:45:40 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-71431f47164so5369660b3a.1
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2024 23:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724741133; x=1725345933; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=v9oflfpPfEUdfMbwTLTWxbGbyPrsj6gup4qbjEdCGHw=;
 b=n6mVlQr7eNzXsh5GZ0yrEKErqBremYzO3KiHb2eOEpoct0aKp9MKNdWXBIzsMT74ah
 fjiB9y4U2lyEmg4sGzpSRad/v0G4GL2NsSxFUnRL8tpCYwEZfz0+8NLV3n/mKhmnLm10
 OK28Z9YDWLmJ0CaZO67cR15eLWieW95bYEEG9x00yLGVxWaT6zVxYL5CH9Y75bhYxdjT
 vP5CbSLa6SpxbDqF802+JSiDRD8P34Y0ziq+2rbP1jzE+F93RHU0QS3E8Pqsbx0R/nKS
 fFerAQruI1nGdSL/8z4wewnxkAOPHF8RjkxHRUOlD8PwXvQ+zYuAddaevl0urZ79XEho
 BRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724741133; x=1725345933;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v9oflfpPfEUdfMbwTLTWxbGbyPrsj6gup4qbjEdCGHw=;
 b=Apb4xrje+GNO7WeyOUf7FV+41bBBfzCIDvsDkPcvgxpc6aHhghhhfOoGD97vhP68xo
 t+JSneSzLnfMve8ZZJtY54ltg0mgdYiVKyYAPkW+FqadGnqIqMkK/EMOjnKYEWXJuWU2
 XV9t+pZGTt9zgDy/ea6G59u/KL0Nka1NtFCGr2HbJ1NueHDh3VPtEnjIpCYBx8KQeXV/
 FcvA+lQgeSQ+hjCRRSrKgY2JS+YPPVl6Q2hSfzMs1LVoM4fYzTvHnjM/6B9UWv3NnTGr
 oCDYqAfqdkgRIx/M2147pHolKX8aAlw3C64nNoJFjMhYYdckJUadD+mWGm6YfwLWbs6u
 HyMQ==
X-Gm-Message-State: AOJu0YzphTG3mawDefgeZJ2SzGfIR8MDl1fei3UM/OTqvjMmoa6RUthI
 EKs4MF0SBnSwhRfwDWvtOllICW62rJS6EF/uycwE3XgeFfm0SHA2q6RACGWA0xgNZmR7aQ3u2xi
 OZ0ZuJccLhJiV/tgKrOEym5oLcbHwuS7hymdxwvCp5jG4GXpaZpBDFIaW7k8ZrxJtxowBMZReIv
 CcrHJc+Lcp2W6GzMADHW0o+SATFw==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6a00:1d93:b0:714:202d:df20
 with SMTP id
 d2e1a72fcca58-714453f3033mr45518b3a.0.1724741132269; Mon, 26 Aug 2024
 23:45:32 -0700 (PDT)
Date: Mon, 26 Aug 2024 23:45:05 -0700
In-Reply-To: <20240827064529.1246786-1-tavip@google.com>
Mime-Version: 1.0
References: <20240827064529.1246786-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240827064529.1246786-2-tavip@google.com>
Subject: [RFC PATCH v3 01/24] fifo32: add peek function
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3DHbNZgUKCmscJeRYPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--tavip.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BlWSAT7yShZy

Add fifo32_peek() that returns the first element from the queue
without popping it.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 include/qemu/fifo32.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/qemu/fifo32.h b/include/qemu/fifo32.h
index 4e9fd1b5ef..77aab488ae 100644
--- a/include/qemu/fifo32.h
+++ b/include/qemu/fifo32.h
@@ -140,6 +140,34 @@ static inline uint32_t fifo32_pop(Fifo32 *fifo)
     return ret;
 }
 
+/**
+ * fifo32_peek:
+ * @fifo: fifo to peek at
+ *
+ * Returns the value from the FIFO's head without poping it. Behaviour
+ * is undefined if the FIFO is empty. Clients are responsible for
+ * checking for emptiness using fifo32_is_empty().
+ *
+ * Returns: the value from the FIFO's head
+ */
+
+static inline uint32_t fifo32_peek(Fifo32 *fifo)
+{
+    uint32_t ret = 0, num;
+    const uint8_t *buf;
+
+    buf = fifo8_peek_buf(&fifo->fifo, 4, &num);
+    if (num != 4) {
+        return ret;
+    }
+
+    for (int i = 0; i < sizeof(uint32_t); i++) {
+        ret |= buf[i] << (i * 8);
+    }
+
+    return ret;
+}
+
 /**
  * There is no fifo32_pop_buf() because the data is not stored in the buffer
  * as a set of native-order words.
-- 
2.46.0.295.g3b9ea8a38a-goog

