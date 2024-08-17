Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1490406njf;
        Sat, 17 Aug 2024 03:26:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWADO0Uin5biEl4o3X05w0NKFR+HVm2kD/NZKThQ6gN5OQ2tHvIOgp/naOyScTfrmyaPpfGCV1jdXsjacpLFui3HSYCl7WN
X-Google-Smtp-Source: AGHT+IGOZt1G4qQC2MaxwP3vNGFZh1eYabQHB9VoMirnUnohTg0MTve4tjJAr5dnhqgCrj3FvPT6
X-Received: by 2002:a05:6122:4103:b0:4f6:a697:d380 with SMTP id 71dfb90a1353d-4fc6c9f26b8mr7106185e0c.10.1723890410433;
        Sat, 17 Aug 2024 03:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723890410; cv=none;
        d=google.com; s=arc-20160816;
        b=v0djhM3YTif/JSwrsMVYe4dlPULYHYuAh4fymSCbwcxtgYYrsxLSHchWIfLkvYa+tt
         hvN2dOo0HSymLIjXpqt2Dgq8L2Nb4Sp6YqPfGMhfHOrbjb0Zy66E62f8jAsl7H/lE+YC
         8MjwSi8RKR179fQfiXjopEoCqrf9pxRtyZ7i6Gs7CMiGZvAJpA/++VUc/ua3x5YrT9bo
         GM8zx8XWnh/5HL7cuVi6Qvj4mQoqQZUJpDXWBmKc611nDhcJrGpi1BG4xkcPXt2KfU8V
         kcRoXH5w8xWCYXKHD7NT0TmwsEkRGVMHO+qbiUr21akZMDLwP395hZ5qmc/uA50fMi4C
         ScsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=g0XCLUPYxGQ5i0atXjj8FMDAblhXlT56A5I6yFI98jg=;
        fh=pITIqJh0Z5XaT4QxI/zJAgHBZTuNeZPw20HbjxZRX7I=;
        b=OLD9q1ghbbALAGtzkYI/NWej4YQM+fXKd61AH0MauEH3DgiSyuqARFd973jmm+hqgH
         dDvBysIDg3cFko2ZF2C/Swc/pZMs2WmeI8cVj25fRz5S/jlC+tOr/EQMN4JDGJFjDfGr
         rwduevJnxB1YLpQmjEaLbdhTkTjqhO4cyzmBMTBJ9l4hIFeCz2QXI5FDa0hjp05icyAc
         T0k98xJSOqF5+FBjSLDW97pndcXGOI5C3iZrqFeyAtcDMo7D+cnLs+q0LtVxt6po6C1z
         8QIo+si01KxTl16DeXLK1nDxmMeD2QdTnNXoMaKuyz0170JtOqG8RJpABLFT6BJ4X+rD
         PQtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Q7x4fsAh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4536a06d3f3si60765261cf.314.2024.08.17.03.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2024 03:26:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Q7x4fsAh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sfGdU-00061N-Pa; Sat, 17 Aug 2024 06:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wXrAZgUKCPQpWrelckkcha.Ykimaiq-Wnijkjcjq.knc@flex--tavip.bounces.google.com>)
 id 1sfGdT-0005um-6I
 for qemu-arm@nongnu.org; Sat, 17 Aug 2024 06:26:15 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wXrAZgUKCPQpWrelckkcha.Ykimaiq-Wnijkjcjq.knc@flex--tavip.bounces.google.com>)
 id 1sfGdR-00036h-M3
 for qemu-arm@nongnu.org; Sat, 17 Aug 2024 06:26:14 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e13c4519ed6so1502702276.0
 for <qemu-arm@nongnu.org>; Sat, 17 Aug 2024 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723890370; x=1724495170; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=g0XCLUPYxGQ5i0atXjj8FMDAblhXlT56A5I6yFI98jg=;
 b=Q7x4fsAh9vMLnZpJ7qWruB1NmTkEJRGX10fMr/hge24uMMm3IeWxJiFe6BgAYyPKS3
 P57LBtj1FwqmLUOJFyIqycj+3P+SS8GcaFWhN1/ebnV7lxF2ejzyc1ZK704wqDwM5Y21
 0SZ+lwkDrwqORRvlmXTN92WuYewJYxfqQ5CT9QUaIJxNX2VMl9EEHijslWmvawB5JhDm
 uYGFGbsYFBdtHi9DeV2DkM0kHRczo2WQNDrKtk2yqeYNhjaetM1iq2uF9vq2ZuwBcF6W
 lrcwcyEZFJCm0L2A5MZ7xVRyjSjMeeLxkNrltt69D9nOzzXbsEKM0O/el+xstCQm9POx
 N5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723890370; x=1724495170;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g0XCLUPYxGQ5i0atXjj8FMDAblhXlT56A5I6yFI98jg=;
 b=w+3awibYtcVkn0nKxw61poAmcbslZgDTXO4nh9BGYFHsX7/w6BXBwF71zH/7Enyobt
 lGwCKXu/loap8ErkKlLyvEIcurVdQdn6+VVj0dTQ4JH5UOKW43Vq1HVDYiqtOzB/p7zt
 EIz9WMJFi3bdg1Agi7ic9XKliu+gRv74RC3KS3WVS866cyKv9nyUpQsKQT8+gAMDZZPA
 86H15BIcU5dgBFhu/y6nou+cAkw07fjyuleN9S3V5MEBar/uI/h3KPNK/FNq3o1cnnXQ
 Abdiajh4Hylzx8VY4C/t18AAiklTBWGQNxA5K4/b7GEYFTLFWcDNOXPEdRsj2G3u4rLW
 Stbg==
X-Gm-Message-State: AOJu0Ywzym7jbwvtJT7IoCQpFf9Zsv3fMAlF+/wjysv+Gph+tsjNfe53
 RY03he4RW4mH1iDxqAnzx0InZdPuzVuEolB3jPK6q6pviBhhZote5b13twbBaMN5+jSP+QyUHQ=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a25:910e:0:b0:e0b:a34d:f223 with
 SMTP id
 3f1490d57ef6-e116cecab95mr126463276.5.1723890369867; Sat, 17 Aug 2024
 03:26:09 -0700 (PDT)
Date: Sat, 17 Aug 2024 03:25:44 -0700
In-Reply-To: <20240817102606.3996242-1-tavip@google.com>
Mime-Version: 1.0
References: <20240817102606.3996242-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240817102606.3996242-2-tavip@google.com>
Subject: [RFC PATCH v2 01/23] fifo32: add peek function
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 thuth@redhat.com, peter.maydell@linaro.org, marcandre.lureau@redhat.com, 
 alistair@alistair23.me, berrange@redhat.com, philmd@linaro.org, 
 jsnow@redhat.com, crosa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3wXrAZgUKCPQpWrelckkcha.Ykimaiq-Wnijkjcjq.knc@flex--tavip.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: CJPKSJnI5jyt

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
2.46.0.184.g6999bdac58-goog

