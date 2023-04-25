Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3715661ejm;
        Tue, 25 Apr 2023 12:32:06 -0700 (PDT)
X-Received: by 2002:a2e:9857:0:b0:2a8:c8c8:73 with SMTP id e23-20020a2e9857000000b002a8c8c80073mr3604599ljj.14.1682451126343;
        Tue, 25 Apr 2023 12:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451126; cv=none;
        d=google.com; s=arc-20160816;
        b=PfI3XTmckcB4ItgP8aLwFPCmseH0Iit2ZaYy6Rv6BUxPN3M3nQQDj66Yr0uoxbqKO7
         tZsBMhDGY+AX26Tqpo4iSCHs6y64vjXSEuRGrKwY/D9zwveiiN6J16ctoY+DszLs+nsx
         Jw8hGvNBOo84MUVxXdvaWLvFl8S3LfDCQW+M+LKbmaNb50uTb4h3I5kVeJBXsmr+RmWY
         ezcOMkvETWscJYnUE+gX/QKTAymzTLSGl+oG5I2nHh4x4UQJXXiShtfQ/WsBaufdLZK8
         BVrOayRTsh0s73C3uhIUP5UM6nvwhD1VKhl06SKFYRRI3+/JJ97opA88kTg41MExP0Zn
         T0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3lrJF/qXESqdgqxzYXiwMDd8bhgg68V4bNiRRkSEKr0=;
        b=xJMfNiu56h9ilxtcrItbk9YjNfN0ZxsKNk4aMZ1GHF3J2ImH+QLwCkBaGSCuMgn1Tw
         +/IfuCu3K0WVZhDOeSYzXxU82KojprU7Resp+L/AAIJB3ZG+GhMgV3wVrQuavX42wimH
         ZiyBaN2mJenfhMBxfHhfsX0SJ0c+qs2/lNmggSF3UFFZgMW/FsNwByCqIH7MxSGIW0eR
         LU3dw0Rh80daxJLgE1Zl8EDtJTIIvV+qm9QId8IrQxJIQfv8bJJK3EM4uHbMHOSTHnUC
         3LRhbr6Kv0049Vvh8bZVD2ylAlD0Nl2Zjeu9jKAslx2MW9YcSJGGvVWX7OX6V+VRavkG
         smVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+zZ5u3g;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a9-20020a2e88c9000000b002a8a9796e06sor4704226ljk.22.2023.04.25.12.32.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 25 Apr 2023 12:32:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+zZ5u3g;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682451126; x=1685043126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lrJF/qXESqdgqxzYXiwMDd8bhgg68V4bNiRRkSEKr0=;
        b=I+zZ5u3gA753DpP5BO5TOyihJ1P8U7gPF3Av7Zt3UhPqfHy5DV8WTGBdk4lS08QBVz
         0oQAaoTj/XlWRHaQWg/JlDXWjm8S70zX7bwyoMlnLeHCXOhZdTypUWko+gf934qrEU+6
         Z24SCEbDwjcGpVI89poNefs9nh9BN5rOSa4q3gZ3LyYPVH4s+N+nzUw4rgvgMOqiOSTF
         fCvKswuvgLjRuHYGR+QnK1a1CVQnFY4ykS4JTpmfyastT692aoP+Hf28nDl7yr+zgGLN
         7JS7Y+iVmIKtqgj4O4QfM1jhrcWRjwRcBHexbV17BLmm9Ko1oRBRbex/nzQUMa3ou/T6
         0DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682451126; x=1685043126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lrJF/qXESqdgqxzYXiwMDd8bhgg68V4bNiRRkSEKr0=;
        b=eLVUa+5y6XVXFdut3gVrxNQsOrSRkothcPjYIlDFIika4VlgbEWinHfRuuYFPaVGS8
         tWnCpZRROAwGOKoV8OVVvGUZjeD5HBvZO0lYAbE4hF12IWsIDpN/+dm/nr5jP115BnHt
         NNJPz2snCbaOWauq2cwztGc2R5tfZoClw0sUe9hemLVfJZhQ9k/owmz+0Z7nKTFW5CS3
         mCnIOLI9il7zsCSl3d4y04z8PgG4oSD1TkeKplDE9oszJ3b9DHFixHtp42ajI49IwJA9
         h1u71FL46ysGfra/+kF7nhVfdextv4ym9I+7sOrXTw3OSBaxoAQXXo1hQhCWlgJ6ui1s
         Exhg==
X-Gm-Message-State: AC+VfDywaK/5E8CAW3zPm+KRGKKMprBqMjqTTuuRzxKNWBs2cQ78mUZR
	Xq3NC6VBG7ayY4IvgiSCSH6T7NYFChMeogREBXDiGYMK
X-Google-Smtp-Source: ACHHUZ40V/gCBTfrOiARQdHi8KdyrUtqTSkEyQswfqvNRpw0+DoDqvVws44cCyTiS25zaQg6GUM4SQ==
X-Received: by 2002:a2e:8302:0:b0:2ab:19a0:667b with SMTP id a2-20020a2e8302000000b002ab19a0667bmr1315313ljh.0.1682451125790;
        Tue, 25 Apr 2023 12:32:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([91.209.212.61])
        by smtp.gmail.com with ESMTPSA id z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 12:32:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	git@xen0n.name,
	jiaxun.yang@flygoat.com,
	philmd@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 01/57] include/exec/memop: Add bits describing atomicity
Date: Tue, 25 Apr 2023 20:30:50 +0100
Message-Id: <20230425193146.2106111-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IsP0gwlhRtHu

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
