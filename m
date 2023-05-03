Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2651709ejm;
        Wed, 3 May 2023 00:06:59 -0700 (PDT)
X-Received: by 2002:a7b:c5da:0:b0:3f1:9881:78bb with SMTP id n26-20020a7bc5da000000b003f1988178bbmr13433967wmk.21.1683097618877;
        Wed, 03 May 2023 00:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097618; cv=none;
        d=google.com; s=arc-20160816;
        b=r3aDZW3mtNmYrqeGaNZbe2e9nDgPeul/wtSg/ShVQjXCOqL9gCxB7Sa1M8RQ07kwkr
         p4Ykb80n+OwjkZTGSThk1knJWvCYxx1l/yuOaTuFjlLScja+W61YgJ+yDjNp1Y3ZcG79
         AmWn8Ld+CFwpMypn/kWvsN6SpQGQOpjHWnKnOMFCQglwQWafQbveH6hjAoGAwcNVklrX
         kUUaeojCba6B3Kp0MNPXx1EYShrIZQRdopcvGV8UaGcPKhW1apyVlJJlpClcq2Y49q82
         qnYcZD/LUMF0rUuwoWVGRLYy8TMzCw92LvdluP9P8QW/J+w6YXlq1ssMctz2/dWbh5jf
         PlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3lrJF/qXESqdgqxzYXiwMDd8bhgg68V4bNiRRkSEKr0=;
        b=n8RBuFiKn5ftvdSH0npBmzEfyNbeEIt0FWB/pCR4363+01jQ/xG3SX7BcXK9QYoI2C
         zyBRb0PMYuux37iCWXDbL0ues9RYEg25MJGdemlnbVykRjrRVUZpObIMo2/pBqug//9/
         Vde8Ov1woue2r2Y0anu8mMbdJYlnWvRBSmaOhbEe22BddIfToMGjNO3uWCQQBUH1lijh
         af4ZbwYAKwMukE/WKhK9cOTfSNPBItXeQerp2Xcb0QL5JQ0IItTiebHF2S5NsV4BHqzx
         kcExZpI+5Fcj2uxvIfHpMmnqOC8lCPi59C0H3wlSWsoSBDnwvzF+siWMaPK7/MC15i5F
         Tlsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rCmOgqNA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d21-20020a1c7315000000b003f19584893esor212220wmb.4.2023.05.03.00.06.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 May 2023 00:06:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rCmOgqNA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683097618; x=1685689618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lrJF/qXESqdgqxzYXiwMDd8bhgg68V4bNiRRkSEKr0=;
        b=rCmOgqNAQXzxJaeE44P1uzRxHyYzgGSz+R20lDdTbMbEeULdSML9aJ7Jy6O8YKxeua
         RQnf0qy6x2T3KLgONhUoeTN+4yxzxYCmkjLYYDEmyxrOC00Doov9XJwAvv4e9n4yTz+N
         UIzjh+1vq0Sc5IPjn6js4IDLQ6DMzgUj14Bj4AMQo9/2LxS+zeSLTXkTuJVWCDQwuToI
         Od688Wzlfjnq/rB3ZbOAUHj/WIa/hMG6SK2fYfiZ/JaTD5LsThm60muVfThy19pMhBt4
         wDYpshDaeuSWEyNc+S+krKRRhBw0IqUh0YxtwS9RnzX9JkewWWc6QnPtigfy9TX57zYV
         qv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683097618; x=1685689618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lrJF/qXESqdgqxzYXiwMDd8bhgg68V4bNiRRkSEKr0=;
        b=JeZkMvxuAtQEcrbJnag6EJyNvTJourrKFbxJCIjMhXtJZuIYsbdPA1vm3oah0rDecJ
         wpwPbLzSwg1xZzyeSOb+T1ieWov3a1BYcHO/P7rVQCEH/re8qjpbZzwK6Hyvpwy4zuN/
         uRi34d3DfqvvdJW3HoH5TQGaJWQhGii+dsDDiyWvAay4OxOGLyrYUmHJN/DAntUyHoCF
         jaeHLkYRukMqcglkXqiXodqKSsvyDuXLfF0/k3lg4fX8vzH7WoF8i+qqdl4A0Kn2j7Em
         j0rDy3O+FgbZ7op1noOyarP17DXKZQETJDivxs/XBNcqzKcGP0ABxBAWmQJu1AB6piya
         Y3RQ==
X-Gm-Message-State: AC+VfDzN3OoVo6lXNGnJoWK2V/WtiSmp4y4NxhmzjMNN5DBU69v3c+6t
	eF4ShZZe175CPmyXIV/2YhxRbF3f
X-Google-Smtp-Source: ACHHUZ6HZknxjkIjOTnL/jTJnQK537wsWbM7Yod/9DV9Ne602iFmwSW+LsmqsaVqKJ8hpFb4xRUTJw==
X-Received: by 2002:a7b:cd18:0:b0:3f1:9525:7bb6 with SMTP id f24-20020a7bcd18000000b003f195257bb6mr13570542wmj.5.1683097618487;
        Wed, 03 May 2023 00:06:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
        by smtp.gmail.com with ESMTPSA id q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 00:06:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name,
	gaosong@loongson.cn,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 01/57] include/exec/memop: Add bits describing atomicity
Date: Wed,  3 May 2023 08:06:00 +0100
Message-Id: <20230503070656.1746170-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7qctdDD+A8DU

These bits may be used to describe the precise atomicity
requirements of the guest, which may then be used to
constrain the methods by which it may be emulated by the host.

For instance, the AArch64 LDP (32-bit) instruction changes
semantics with ARMv8.4 LSE2, from

  MO_64 | MO_ATMAX_4 | MO_ATOM_IFALIGN
  (64-bits, single-copy atomic only on 4 byte units,
   nonatomic if not aligned by 4),

to

  MO_64 | MO_ATMAX_SIZE | MO_ATOM_WITHIN16
  (64-bits, single-copy atomic within a 16 byte block)

The former may be implemented with two 4 byte loads, or
a single 8 byte load if that happens to be efficient on
the host.  The latter may not, and may also require a
helper when misaligned.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 25d027434a..04e4048f0b 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -81,6 +81,42 @@ typedef enum MemOp {
     MO_ALIGN_32 = 5 << MO_ASHIFT,
     MO_ALIGN_64 = 6 << MO_ASHIFT,
 
+    /*
+     * MO_ATOM_* describes that atomicity requirements of the operation:
+     * MO_ATOM_IFALIGN: the operation must be single-copy atomic if and
+     *    only if it is aligned; if unaligned there is no atomicity.
+     * MO_ATOM_NONE: the operation has no atomicity requirements.
+     * MO_ATOM_SUBALIGN: the operation is single-copy atomic by parts
+     *    by the alignment.  E.g. if the address is 0 mod 4, then each
+     *    4-byte subobject is single-copy atomic.
+     *    This is the atomicity of IBM Power and S390X processors.
+     * MO_ATOM_WITHIN16: the operation is single-copy atomic, even if it
+     *    is unaligned, so long as it does not cross a 16-byte boundary;
+     *    if it crosses a 16-byte boundary there is no atomicity.
+     *    This is the atomicity of Arm FEAT_LSE2.
+     *
+     * MO_ATMAX_* describes the maximum atomicity unit required:
+     * MO_ATMAX_SIZE: the entire operation, i.e. MO_SIZE.
+     * MO_ATMAX_[248]: units of N bytes.
+     *
+     * Note the default (i.e. 0) values are single-copy atomic to the
+     * size of the operation, if aligned.  This retains the behaviour
+     * from before these were introduced.
+     */
+    MO_ATOM_SHIFT    = 8,
+    MO_ATOM_MASK     = 0x3 << MO_ATOM_SHIFT,
+    MO_ATOM_IFALIGN  = 0 << MO_ATOM_SHIFT,
+    MO_ATOM_NONE     = 1 << MO_ATOM_SHIFT,
+    MO_ATOM_SUBALIGN = 2 << MO_ATOM_SHIFT,
+    MO_ATOM_WITHIN16 = 3 << MO_ATOM_SHIFT,
+
+    MO_ATMAX_SHIFT = 10,
+    MO_ATMAX_MASK  = 0x3 << MO_ATMAX_SHIFT,
+    MO_ATMAX_SIZE  = 0 << MO_ATMAX_SHIFT,
+    MO_ATMAX_2     = 1 << MO_ATMAX_SHIFT,
+    MO_ATMAX_4     = 2 << MO_ATMAX_SHIFT,
+    MO_ATMAX_8     = 3 << MO_ATMAX_SHIFT,
+
     /* Combinations of the above, for ease of use.  */
     MO_UB    = MO_8,
     MO_UW    = MO_16,
-- 
2.34.1
