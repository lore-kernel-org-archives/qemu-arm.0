Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638384ejb;
        Fri, 26 Apr 2024 12:46:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3tH7HeM1xB9GEfJ/H87YaB6PZn6utiFk3qusMrMcfTYL5S/u+L/lnyowOep2KT65z7/i85EwkvIq3RMFavcI65CIkT6Rp
X-Google-Smtp-Source: AGHT+IFY3v2UlY0WvMKuGfdVNkSzL1BuK9fbqpNS116c3wqIa83YSzzTlqJXXpeiunHPFs0g+nPT
X-Received: by 2002:a05:622a:4b17:b0:436:5951:6006 with SMTP id et23-20020a05622a4b1700b0043659516006mr3928358qtb.49.1714160796808;
        Fri, 26 Apr 2024 12:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160796; cv=none;
        d=google.com; s=arc-20160816;
        b=slMOanuCDJ1Nv+3J92CqV29Sg4xEtTLP8/Cipx0fZEp5tEebmw9oaF814aYGGY4KnO
         Uxwv9mx0PQDrMs8o+4p0KNePM2yoGTuBZrZL6geaGYGMw+c6vDpS/SUy1HckwBIvcwqj
         jz3t3dvT6GV9zcbRscosn2qIcr1DKbdk45iIvd4rgFMK6RHwQ0zncXZI6rYJd/T8S3+I
         69VcMvhmJGHaIx1KdiIMKxx7It/ClkOKWL+MnF5sjXMExniZJeie5qUGNw4/z1Q8Eu4a
         aSSPWhZP2H+d0CAOrwxN5+plLAtlx0SqnSpoaBlTgUo7lb784mbvYguQiNqWlBrABeSX
         jRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ImXEe3AsI+IkHscdZF2OSgUHx6phFwxkW/+zKfz8Om4=;
        fh=YHRkik9JmJQ8w2izVVfzcTjygDrvNfNJ7sJS/zde/Xo=;
        b=T69nWXyMakVUHvexJV27v3N45DxtA6eI0F0sXmv0l3EPiWcMqTQU2ZGSXnMVw5f0sl
         K30l6pwc7caT01fFz87q5xvca+sztDLhz/P5D+mLc7jwdThPHXJNCKRelgz1rJ5zBq7g
         bd9Y1oW0TIW40qEiqM8m/7u1ISMmC9f7Mwr3yDYUpgbx9OnEMayje+j5HO0KDiiMuoAs
         jGqFP9HEZ1oJiCw7GzqE0leblttVVl/9drUBK8qLced4wKcIgwqbqmOvttF7nvsXvl/5
         HVYfPl8g0zYed/jH+B+IhVycw0j7BIqds732CpxDgK9RaaQySQG/daP1frtsPaS7Bd2A
         bNeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSLu+ROa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fg19-20020a05622a581300b00439a184a6c8si13676008qtb.155.2024.04.26.12.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:46:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSLu+ROa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s0RUP-0002uF-Ky; Fri, 26 Apr 2024 15:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RTo-0001lb-Bm
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 15:43:33 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RTk-00037p-Tx
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 15:43:31 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a58c0a05a39so257227366b.2
 for <qemu-devel@nongnu.org>; Fri, 26 Apr 2024 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160606; x=1714765406; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImXEe3AsI+IkHscdZF2OSgUHx6phFwxkW/+zKfz8Om4=;
 b=BSLu+ROaLKnJztDBtlI+JzJ7mc05sfBehSZB4Rnj19t/cPvC/New8fvqtT0NfEKOx1
 QJEmbqVi0EdWKTIVdXlXMHwJpoQM7M3OAE6k5inlK7anaubCg29UqHOl+YrmLeGfZiJ+
 TINyT4bq1yqxWgfgNE8bOzWH7IXcEIE577txzp/Hac6Cdk5Zq/9TGluo7gEOuh3mnPYb
 JpHh6amhV4Qno4Ul4gOX/WOSP8hBAvRRj78+BanHaUd3NGnW9rzEOgtTuvju6BYgqqPH
 VXYpYcYckoqSa/A+/+7bsaWzD94JgaqpajdDqtGp/kbXmtbyQ/ZFSuBxuSNWTiB5N41I
 O1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160606; x=1714765406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ImXEe3AsI+IkHscdZF2OSgUHx6phFwxkW/+zKfz8Om4=;
 b=ZYW/nIT+VKQhT8DoM5OSgxtFMctKYZHueDoQTySLuot9hhRjH+asI4Ach4d500PPtA
 lULCbLQO451nh38c49tQSn9qzZRXFgu8NCJBl8/vTfZBQNFjB/aKFDak0rNTsdbxGiv7
 +jCDBnRUpi6oUtp4BqchJAwvTn8xLP43HhZ0fCDsikU7lnckq09Dl08FvzoHOqRnkEx2
 IUWJ92vyQe8FrSpKfmOB175DBVLCUY8xNcPhiTD1CYPzL7Dwrb+fCV7MzJL9ouIcT6Co
 7obBxm9sB6jFnrLfCINP1fI2/djB+gv4sT9KHseqJ0SxzNRVtrjd6IIwFbRDQj3I3Ar/
 sfVw==
X-Gm-Message-State: AOJu0YzZWKq8HUHSNR0QI9OdUqf9BQh5TCCgZITN/8EdGmYX4NRJppUP
 otFbgISIZxdmuOr7cqzUoPnKz3brO2nKr6V5ipr5cUrrYdCihmvTUkA3VdQuLjhx+QrslKXZ2Z5
 GBas=
X-Received: by 2002:a17:906:af19:b0:a58:d757:66bb with SMTP id
 lx25-20020a170906af1900b00a58d75766bbmr1292294ejb.14.1714160606653; 
 Fri, 26 Apr 2024 12:43:26 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 bi14-20020a170907368e00b00a5588ed8fa2sm9358983ejc.113.2024.04.26.12.43.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:43:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 14/38] target/i386: Include missing 'exec/exec-all.h' header
Date: Fri, 26 Apr 2024 21:41:34 +0200
Message-ID: <20240426194200.43723-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pFrX3ZZQPnzT

The XRSTOR instruction ends calling tlb_flush(), declared
in "exec/exec-all.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231211212003.21686-13-philmd@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 4b965a5d6c..ece22a3553 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -21,6 +21,7 @@
 #include <math.h>
 #include "cpu.h"
 #include "tcg-cpu.h"
+#include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
-- 
2.41.0

