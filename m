Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492311ejo;
        Mon, 11 Dec 2023 13:21:17 -0800 (PST)
X-Received: by 2002:a17:906:178f:b0:a19:a19b:c6ff with SMTP id t15-20020a170906178f00b00a19a19bc6ffmr3335592eje.79.1702329677679;
        Mon, 11 Dec 2023 13:21:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329677; cv=none;
        d=google.com; s=arc-20160816;
        b=Q0H5sZlcTC4xCrRrvfJiCnCGyiwu7qknh6b5xTFsINT1BHSqHqJg9KKHndYTwUKvLl
         SiYNWPkJR9tOUC1FtrTE2sQGjZ15T2vvcZjiNHobOtZmZp7XHIKmP5ujy8VG/QOSRJZQ
         7H9imBXCKx90SBYibJBjPHfPudTwNFXHyKZJUdBFTTTETJfvdRRBNDgJGX40sECAfwJo
         Cq7d2IVwPhfY/qoRKv4+EgfYxPRIIoMkkxZHTQ7n7QLJ99uRp3cZkwjjYwel6Heh22gg
         9JexlbZiMOqln5IZj9QH4wD7W/cWmWZOw1PrxDbu/ozPV2PIRy1m7gN6nYpmTElwfLBP
         q8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bTgCkgY7q586A21zu0JSDs5UTTpVyxNoAlIlHHAmSdk=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=IkIJQ3phARLG1m8E51RvuOhSv2wPHAVu2IeIK4F3fE7AdXYVQDBIiR7k8B5Zkizh8U
         dr4p1sX7ypZaFp8KUnCldYaNP4sFmXZKX99tQIYb3oKjrzLBZlFB27EzqGDhma2C1PoV
         VFkYAyGjCdUPOE7kzNqDrOFUqB5O3Hf047z+bTamt4ttPrJ/p/HrPntZKbvPmlKafDDD
         xQ8wKzr1XOhcKWWfOt05jfrHZk/iZC1GCdeakh4+hTR0P35alMwGj58xPPR++PYGIzqt
         IahHoKQqKZ48KvNfQyX1yeiWYrUz0ZCmKKy7lgwsVH6lvJCaipja6zlRiwOu3j09hfD8
         PFkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=URMXznrN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a15-20020a1709063e8f00b00a1f64efa8efsor1917348ejj.14.2023.12.11.13.21.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:21:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=URMXznrN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329677; x=1702934477; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTgCkgY7q586A21zu0JSDs5UTTpVyxNoAlIlHHAmSdk=;
        b=URMXznrN5jRxRSPGOLdM7SxqaqNHybNJwCCNlFQm2ILr8d+BwZqu12XgbnLPyoObdH
         N1CndbUcpTKjGVvSaGceSkmkm5DC0L3WPkVs/TF+ztrncu+z0KvJojpM+TjxgYDITVas
         8czB7FHGjlYObDzgPL4ClVf+i3DM91n0blTaebUAw33PazMyFpV7eJlk71nv0Me0Ktxo
         /oh/yn8hH3e9qW3TrT6V7FGRUM9H13Aua3235d4tbOOLFDVQ9RFdy0YNFcy68OnwlysZ
         yqfwKViS13vgdOD/NBVDxrLWnttSb5FXQsKPi7ITeIvKGi3TuD6enRDzP+vYmc6S6Mlj
         4KbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329677; x=1702934477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTgCkgY7q586A21zu0JSDs5UTTpVyxNoAlIlHHAmSdk=;
        b=jQRv71lvOwHve6BR+ut6d3073D5+ZK3+u1k4O60D2LdwV4p6gPYS9BqcCoLZnA7UGK
         nF6WIr9u8bXC8R9Bi9Oz02Qa6UyshhniQHHXlbER9kKSxb5GAnXHm2dzob3OsR2EyPHg
         D1l0LL1W2zUHHu4yUUXXk8S/JuguxqgA8iWZblk4hKO2yBl4mtzPP7Ak0WBlBYbcUCxJ
         g2nG8I9YAiXshEB3G91OjgAvA8DHl7VKJ3RWu8f1R8vsHLyjF5GNFQ9euaiTvuZiWE39
         h5TIRpSLv9fQe23pvC1KMXeOkGgc4vBVAA143XObm93pmr2k+dtyYeHZh+7tsNvnFFXK
         YLIw==
X-Gm-Message-State: AOJu0Yz1wBAo66HzXvY/u/E+OXO30SFEusa7gdBIUoU1rfcD4x+Zh/WU
	Ts4kRF51geLQkdIOJ0Sa8fAMrksw
X-Google-Smtp-Source: AGHT+IE7u8ErDB3qbkoxcWJBZGHg9TNyGS0VK2dx6Y5oKzk/mTl8UNR2B14GFHxyP9kq57rEnK1Ndw==
X-Received: by 2002:a17:906:738b:b0:a1f:84ea:d8da with SMTP id f11-20020a170906738b00b00a1f84ead8damr2472617ejl.45.1702329677390;
        Mon, 11 Dec 2023 13:21:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id tk3-20020a170907c28300b00a1cd54ec021sm5361923ejc.57.2023.12.11.13.21.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:21:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/24] host/atomic128: Include missing 'qemu/atomic.h' header
Date: Mon, 11 Dec 2023 22:19:45 +0100
Message-ID: <20231211212003.21686-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: P2/CVNgwQPo0

qatomic_cmpxchg__nocheck(), qatomic_read__nocheck(),
qatomic_set__nocheck() are defined in "qemu/atomic.h".
Include it in order to avoid:

  In file included from include/exec/helper-proto.h:10:
  In file included from include/exec/helper-proto-common.h:10:
  In file included from include/qemu/atomic128.h:61:
  In file included from host/include/aarch64/host/atomic128-cas.h:16:
  host/include/generic/host/atomic128-cas.h:23:11: error: call to undeclared function 'qatomic_cmpxchg__nocheck'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    r.i = qatomic_cmpxchg__nocheck(ptr_align, c.i, n.i);
          ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 host/include/generic/host/atomic128-cas.h  | 2 ++
 host/include/generic/host/atomic128-ldst.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/host/include/generic/host/atomic128-cas.h b/host/include/generic/host/atomic128-cas.h
index 6b40cc2271..4824f14659 100644
--- a/host/include/generic/host/atomic128-cas.h
+++ b/host/include/generic/host/atomic128-cas.h
@@ -11,6 +11,8 @@
 #ifndef HOST_ATOMIC128_CAS_H
 #define HOST_ATOMIC128_CAS_H
 
+#include "qemu/atomic.h"
+
 #if defined(CONFIG_ATOMIC128)
 static inline Int128 ATTRIBUTE_ATOMIC128_OPT
 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
diff --git a/host/include/generic/host/atomic128-ldst.h b/host/include/generic/host/atomic128-ldst.h
index 691e6a8531..12e4aca2da 100644
--- a/host/include/generic/host/atomic128-ldst.h
+++ b/host/include/generic/host/atomic128-ldst.h
@@ -11,6 +11,8 @@
 #ifndef HOST_ATOMIC128_LDST_H
 #define HOST_ATOMIC128_LDST_H
 
+#include "qemu/atomic.h"
+
 #if defined(CONFIG_ATOMIC128)
 # define HAVE_ATOMIC128_RO 1
 # define HAVE_ATOMIC128_RW 1
-- 
2.41.0
