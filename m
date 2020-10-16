Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1780970lfa;
        Fri, 16 Oct 2020 11:42:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:15d1:b029:155:5c2c:c28e with SMTP id o17-20020a056a0015d1b02901555c2cc28emr5167529pfu.3.1602873735371;
        Fri, 16 Oct 2020 11:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602873735; cv=none;
        d=google.com; s=arc-20160816;
        b=Wh5MZnZMAZYMJAGyi7xDtRwX+aHu99E5iuRnZdYzTPK3pBuyyzFF4UO5Kp88ozcHw/
         y9OfvAPEnMlCI4zH77y27f0sggqIMaUUQF1Ke2jodDYXMlPIpzXwHzSEdoxhlCHJ9Few
         n5KwzniXwRUm1sed6vzPhuyEqxZTRn/RgOaBe4Qx+kUmInNYKOVa7kI5MPqA4kh6iv13
         hH1CvMWQBwZ/TkGIoskrCXDsxyviXbE04hSIOiH0uFHSLV3/CDvHSZCJ/IvEEJuv04/T
         FieUi2v3dNfJS2XIBnz0Y5oa5jZTBA/Q6xbI/tTDShzFTBYAlZDRmKqi/mnRUGWR3Vox
         PyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8JkogZW08o4QbERarC4qat0jsqD9fmDjl7gKGBrUP6I=;
        b=nbeRhXwD2oqlLgAvXsFpxPB/PB7LQ6CYU8//gHEyzswJm92fKXCFuK7Inpa+hK6kAD
         AvR9zqbtGZsDYkCj7NiEKcEpS3iIn2NDWiiEAAMtPGiHbpggp1Ci0mAHtIkHrVhw+mgG
         CldGo+7vQ1V19dF2ua5LFIsrVfb1TxZVY5dlUpveYj7p9PFmH6ViILDLtbegJwih2+6L
         sZKZ3Xt7DWmjPCnTJ6ApQJgBErDu0X8j+FgmfJdGkuqyjEutIlLog0S3DvLeGoOP65UQ
         J8UovH1yD7lMBE/kiX+pVroOtTgOdTf7WO+b8MHWWK7T8tcUnkCAkm6X4H7wCml6g+V4
         bwLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pYxAmiXs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l65sor1510185pfd.29.2020.10.16.11.42.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Oct 2020 11:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pYxAmiXs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8JkogZW08o4QbERarC4qat0jsqD9fmDjl7gKGBrUP6I=;
        b=pYxAmiXsf+Pkx1zPHtkgQ26+gslMTryFI8G/wZfTj1+dfUuDy226R4InFWRwX41VFr
         qxVN5dnY9q1VyMYdQUdvBFXNa61vjefdGUfsXW3kDRNUTroXLjF1J6+Uz9ERKKa54/OU
         NCP8OCHvxUGbaCVvaqBtZiBOHosXeagmAUzbHlG2vIucJL59bb+w11+MNgTmObqeswiH
         dzyyiOPXavsDxL5MXILiuUtQnYAK5FsrWg/5CwmckUPZ3M5dLrJ/TecdOSlBZdnSelp8
         6c5NkJ6il+IBr0CNEsldRsDuElb/w4itX7tj7u0xB3Zf1RRKokiXxVNOQACIIfx04Ly6
         Tivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8JkogZW08o4QbERarC4qat0jsqD9fmDjl7gKGBrUP6I=;
        b=j1WcQ4CblNPp7kDHXeuuOL9F8Pkc1GE6H7usn355Kq+9rI44FVNyeJ/hMvtKuDQEyC
         uwIevdktTW0b00vMo4I51h+qVhB+tNYGVwHaoBDY0A533KtkQf59r25beu7NJu+VlAWL
         t3RLDm4mqXSdipeT/rBh+I96253Vb0sD/R8+TFulMk8PomDeNHbVSuN5VeEmfnYtCgHX
         D0sKnJzsId1KCOzbSHeNFE3Gokvq+9Z2ohrOevZP35cSCLxPTZHyjwA92c8fEuSr+pFs
         N00nr1izooXj+/SH+9QRQtdFh2sK8Nx0OelrD7WW4O70g5Fxt/QlPwKLAKAxWZ8Xlr+t
         7EBA==
X-Gm-Message-State: AOAM530tVtUml+aS+4sHJN+MRmBxJqUrYti5fq7AylxEXTrGRy1REmid
	A4W88/o/6SZ6p1TwzWydN6Ad4vKl
X-Google-Smtp-Source: ABdhPJwR5ETWzvZxN7kI3cwIm0wEq/IbQRHhQJbtb2EWfqMipSqa6orfExXnKpIzBmcVlNSemWa87Q==
X-Received: by 2002:a62:16ce:0:b029:155:2e1d:9c06 with SMTP id 197-20020a6216ce0000b02901552e1d9c06mr5016448pfw.6.1602873734883;
        Fri, 16 Oct 2020 11:42:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c15sm3426011pgg.77.2020.10.16.11.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:42:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v11 03/12] include/elf: Add defines related to GNU property notes for AArch64
Date: Fri, 16 Oct 2020 11:41:58 -0700
Message-Id: <20201016184207.786698-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
References: <20201016184207.786698-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YpLnPyhELTvY

These are all of the defines required to parse
GNU_PROPERTY_AARCH64_FEATURE_1_AND, copied from binutils.
Other missing defines related to other GNU program headers
and notes are elided for now.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index c117a4d1ab..10126ff809 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -26,9 +26,13 @@ typedef int64_t  Elf64_Sxword;
 #define PT_NOTE    4
 #define PT_SHLIB   5
 #define PT_PHDR    6
+#define PT_LOOS    0x60000000
+#define PT_HIOS    0x6fffffff
 #define PT_LOPROC  0x70000000
 #define PT_HIPROC  0x7fffffff
 
+#define PT_GNU_PROPERTY   (PT_LOOS + 0x474e553)
+
 #define PT_MIPS_REGINFO   0x70000000
 #define PT_MIPS_RTPROC    0x70000001
 #define PT_MIPS_OPTIONS   0x70000002
@@ -1657,6 +1661,24 @@ typedef struct elf64_shdr {
 #define NT_ARM_SYSTEM_CALL      0x404   /* ARM system call number */
 #define NT_ARM_SVE      0x405           /* ARM Scalable Vector Extension regs */
 
+/* Defined note types for GNU systems.  */
+
+#define NT_GNU_PROPERTY_TYPE_0  5       /* Program property */
+
+/* Values used in GNU .note.gnu.property notes (NT_GNU_PROPERTY_TYPE_0).  */
+
+#define GNU_PROPERTY_STACK_SIZE                 1
+#define GNU_PROPERTY_NO_COPY_ON_PROTECTED       2
+
+#define GNU_PROPERTY_LOPROC                     0xc0000000
+#define GNU_PROPERTY_HIPROC                     0xdfffffff
+#define GNU_PROPERTY_LOUSER                     0xe0000000
+#define GNU_PROPERTY_HIUSER                     0xffffffff
+
+#define GNU_PROPERTY_AARCH64_FEATURE_1_AND      0xc0000000
+#define GNU_PROPERTY_AARCH64_FEATURE_1_BTI      (1u << 0)
+#define GNU_PROPERTY_AARCH64_FEATURE_1_PAC      (1u << 1)
+
 /*
  * Physical entry point into the kernel.
  *
-- 
2.25.1
