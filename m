Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3361434njc;
        Wed, 24 Jul 2024 15:09:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVE/NzRAVt884s0AA3iweGRqFRa5aUMSrMvheeDRc8c3vi+wxkMM9a0wknyBEnrLOk3ocaRrT3oCFihWO3gcuMAAfpA/MSZ
X-Google-Smtp-Source: AGHT+IE28taJaRJkopoPAwF+IQtL+NiDdmzHnQaSdEOefb15DpXKQhubu3X89HAHnZ7r5ECYg+EV
X-Received: by 2002:ac8:7c56:0:b0:44f:5eb0:ea4a with SMTP id d75a77b69052e-44fe916042bmr161721cf.4.1721858952192;
        Wed, 24 Jul 2024 15:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721858952; cv=none;
        d=google.com; s=arc-20160816;
        b=nS8NxlfYNPEvaRTlk//+fM85S74e9aTxTMjoWqmDKTzrxFTaEI7KVNn6Nu0ydpgVSx
         lYPLajKmVHP/ukkmpsSd8rsCZ0+pEvqsuRHMknfS7v/JB9a7BTcD+rTmrGERSbUpoOxk
         838tqZa9LECmfsXdshblfgpTv5/wWaunlk9WQuAd5EL5h3mGsak5VCjRUQywpcyU7746
         nJkMMzt5tvtj3TZ+Jh/Uf7olMbpfmKbykFjcJ1Zvn6fRPCSxPsst4+OSM9f+WFNZmbc1
         psC5MiRIKB4+iPRAG9ktvNkkZ8mxIbBBwrxeqRNYxC3QkgLoFztAbc6K3qKZ+gYUaiic
         S4yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tYJVjZqOXEiJ+YQNx+XkrkSOeWdwAX68dW81gy1dzYg=;
        fh=9jCKrkak+VeAwU3gvcvotHmjHRkUpxxzg9HcpKza/OE=;
        b=k613MsYWIbmzoyEywOaLPgGVe/SrhYt1o6xd8dHJY9JMk9SMS3L/Hz4tMO37HlcE3l
         DFqccEIUNEd7hliVd5QbsRtAwq0RTUGSX3m/T+JrM7Rf6C+3W8kGrwNR9sifyUoY8f9S
         hHxrNtulZSCurEg+islc/z6VLBUZnmB3SHhhKzHVBmqZ/RubBZBbDX7nT90XmrN5An/M
         PMDKdsGl0WpUhKHFKJlugsavc5AIPGavxDhvUzoS5kqKiaO8tSGfzSm9EO6/luEkMizb
         rtozyILnaTfsH+a0x+uTv0MIHi8SUYd3jq+HP7/pSxmXddy3wEOgvB52kBfw0vIA9FjY
         Wj1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=p5CmUrSh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe840760dsi1110591cf.461.2024.07.24.15.09.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 15:09:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=p5CmUrSh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWk8J-0001uK-Al; Wed, 24 Jul 2024 18:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk8G-0001ex-Gm
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:48 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk8F-0006fI-2V
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:48 -0400
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-80767b21543so13516939f.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 15:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721858806; x=1722463606;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tYJVjZqOXEiJ+YQNx+XkrkSOeWdwAX68dW81gy1dzYg=;
 b=p5CmUrShRpFYoxMZRHsdg0U8AowhqNCq1m0f+xYJ+98p2GFKV4fs1feTeCjknjVeIY
 r/PtaV1dHDFhFs8dx/6FV3I5X6djjR2HaW1kjBtwrKP9mkIfCRhe2/YHK4b1gI5cZ4xF
 5+b1NI9+UTB1C3DBkv/B2IwDMw8SzGzNS0gBk0lKSAlIWIu/FxmQQ8HK9dHmziG/UnEW
 4QxbNP9MSixln5PolTTfMrDdcyO/EHCgWa36y587QT5hVZX9Y9oTsY8AP7POvUbikj79
 TsTqMRfwtPrmxcUirdzfSD5Rrr2KOI5Kk6UipEBXhyfZ0DDCeLQFb+QR+JIcWzcq4gRj
 /1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721858806; x=1722463606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tYJVjZqOXEiJ+YQNx+XkrkSOeWdwAX68dW81gy1dzYg=;
 b=jBojDUhXEv5EEoclvcCoLht+oM0K3hncjFZsiI8FAZEfTskGOXVeWCBe0lmx0rPqXt
 yu6cvaB+fYHi1NMyxxhi5lHiNJgykRwvoWVTyb7VvWoOG7+V8dBJ7KtlpCPOKQM0X9aw
 M3cUnyxLEUDVBetAyfDcHXTFYHBMIsUHmtKq+7gFsKYLMwsGzRNqpIzhfWMAKCxRUIkM
 tansxpSFItO0VXFNsrffmYnbas0RDMLgB6BWKXl+7s8mxPztkVmHbUMTYdEZ+SNz46vl
 UKnjrXRA5SyYksrg8xLTs9oB9zexEnJVJfzXlUqcrpKzQqNbfba2xqQ1NAdOOeF90aL+
 Y6hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqvec0/euozLfmsuo5E1nLv0Gi68sry6jcCLoCu1YpNNatGY6hnaPN2wt0lG1pPV53YeEcGuNncnH4J7g/SBGFlFOO
X-Gm-Message-State: AOJu0YwksdqF2CNOjoIGXqAk/Ycrp/VaLnIDkqLbPvoE9PQYGxBS1p0O
 UJE+ICdJKmPvFtazpaTsi19KqrrfBkzvndnj4s6YrKR4TxjuRza2M6VyoNrdojWMVEr0VXE0LOz
 IDAs=
X-Received: by 2002:a05:6602:27d1:b0:7f7:d2c7:3b7a with SMTP id
 ca18e2360f4ac-81f7e2f0af6mr22411639f.0.1721858805960; 
 Wed, 24 Jul 2024 15:06:45 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c29fa983f8sm10086173.47.2024.07.24.15.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 15:06:45 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>
Subject: [PULL 15/15] bsd-user: Add target.h for aarch64.
Date: Wed, 24 Jul 2024 16:04:48 -0600
Message-ID: <20240724220449.10398-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240724220449.10398-1-imp@bsdimp.com>
References: <20240724220449.10398-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: o0J3AfmWXfK0

For aarch64, it's a 64-bit API, so there's no pairing of registers for
64-bit values.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/aarch64/target.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 bsd-user/aarch64/target.h

diff --git a/bsd-user/aarch64/target.h b/bsd-user/aarch64/target.h
new file mode 100644
index 00000000000..702aeb7fc57
--- /dev/null
+++ b/bsd-user/aarch64/target.h
@@ -0,0 +1,20 @@
+/*
+ * Aarch64 general target stuff that's common to all aarch details
+ *
+ * Copyright (c) 2022 M. Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_H
+#define TARGET_H
+
+/*
+ * aaarch64 ABI does not 'lump' the registers for 64-bit args.
+ */
+static inline bool regpairs_aligned(void *cpu_env)
+{
+    return false;
+}
+
+#endif /* TARGET_H */
-- 
2.45.1

