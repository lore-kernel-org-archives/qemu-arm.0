Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3754058lfp;
        Mon, 10 Feb 2020 04:01:49 -0800 (PST)
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr1685929wrv.9.1581336109412;
        Mon, 10 Feb 2020 04:01:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581336109; cv=none;
        d=google.com; s=arc-20160816;
        b=cv+v8FdH1XaNpcNwp2bsOJQuiHAL2do6gBESnpqv5Ga6JKrTxrnf1me0251Jj83QNE
         Eg92GV+YEcAWm4BH5uxMbNUT+AMpY/hpDDzSYNilXFImSkpJAxWGcNjHRBbN3v2BOrfG
         DB0SQByUxIOA9nXDFYqkqoCFjWLlPO9E952ePzgLTaUH098MW4LPbgXQgiUOH9T+WOCH
         rteIMjcgO47M0H8xUNVIdk65OloI52j7BU1J90UzCfTF7fDyGJvWMPIwouDaJX8xU+Sl
         HV+9wcRjF2ut/Mfv60a7L2wMMbRBwFB4d5t5tTrKM+TUl9ybSqmIycSDLkCylVEQkm0y
         NDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Jle24mRVWyhiSlJz0ynMllgtOVUvCHA26143XxrUarU=;
        b=H7/naGdWZjoHmckigfs3+gUA6xdTlotmpUHHwNm6l2tJXEXJOOWx0iNDGXX8vby1sf
         PMJgVNaFa4Qj+GAgwiF72eWb1nAyMapx9AX6uL2OXOd6BDXYJgperl1nfUrhCwCmwNRi
         F+ZHAob+aU9QU4i2ss+hC+iO+uZf+lbhgHaYYNbsEusqbeUeluenbMPKgmgKe5PBT8JX
         H4/fe72qohGeiytq/jAe00AP/9KKDOfTVAhzjsGY2KZVeOymGvAGSYeAITshBt+EfZqh
         SCkSfsjzBMcvaCJFHlVfXDLrhvd7WbEPt/GEurKuJ+x+zfEu5qBbe6VvBAQhVnIWnA97
         dNBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JLALmue8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a17sor197628wrm.3.2020.02.10.04.01.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Feb 2020 04:01:49 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JLALmue8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jle24mRVWyhiSlJz0ynMllgtOVUvCHA26143XxrUarU=;
        b=JLALmue86Vj1WLKga3IYxtsrrrSb2fZfVjSA/kJG0pu36CzPRvUzZVsTZS/MLQqECo
         B/pvVjUTXM2FfA6nJobQCJk0k/y8NSiwzqPgxjKcgZAoFz8rn71bfPPxGQCDxk0R24zH
         aFOfDq8za89nqwXw4+yDu+04uuodJjU/HevVrYpZLmUGFY67Vw+4qIB4QNXNXJbhDVc1
         Z8lCl7cLpJmLKfevGWR5mTlnnQxW+GE4v9atmDDeJOxbC3Muo7CKfioLGNM+r1y6Ytd2
         /oFDA7M9wtA1d5esX5qfb7XZGcxOIxqLpQMwOSYNhX+FTBU5VvX+DBqTyMzwO2aDIdTO
         trTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jle24mRVWyhiSlJz0ynMllgtOVUvCHA26143XxrUarU=;
        b=m1bNsow1eglrO+fuisvCAWKfV3icy7EFzLUT0pbhw7HFk5QxLxTItKbzJGuX4y7KyR
         UR3mOQxUCESUqIjEr2yVbWlhGpYVncK+v3NEgRnOy4a5eOF5LsRgDzRHIRCWQLRreJRz
         dV2IvDaiZd+mhB2vgJjrSHOB+n0zaPSqGInnIDqTJpBdldKVxfI3bwzj4b/X9bEuBChn
         Dh+331Orq6TkGaJT001Cbm66z5BHW6+GF9FXn7qjxXGjZrCsv9RSDJurJDL5e7xxAVKN
         u5WfHhf0erY2PreFStrtENfe0V3mm9P3o7zdQOaybBrQe5KsxMpUMjNe9W4AIAEFlEvL
         QrVQ==
X-Gm-Message-State: APjAAAXslah7binSECba1+4OAtxxjYQ4/0G98CNfD9bIYqdoVj7k3cRH
	Ys0E1PYfpRujKVlcavY2YkqNbuV5
X-Google-Smtp-Source: APXvYqyY8rjzha/DoA1j0XJXXFrzjrREp1fthxF8UV5BIn+M1Xk/cMSEqSeOnZp4Ay6VXzm0A6gxcQ==
X-Received: by 2002:adf:f28f:: with SMTP id k15mr1637970wro.230.1581336109096;
        Mon, 10 Feb 2020 04:01:49 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id p26sm311305wmc.24.2020.02.10.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:01:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] target/arm: Implement ARMv8.1-VMID16 extension
Date: Mon, 10 Feb 2020 12:01:46 +0000
Message-Id: <20200210120146.17631-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: n2x/w+1fBlli

The ARMv8.1-VMID16 extension extends the VMID from 8 bits to 16 bits:

 * the ID_AA64MMFR1_EL1.VMIDBits field specifies whether the VMID is
   8 or 16 bits
 * the VMID field in VTTBR_EL2 is extended to 16 bits
 * VTCR_EL2.VS lets the guest specify whether to use the full 16 bits,
   or use the backwards-compatible 8 bits

For QEMU implementing this is trivial:
 * we do not track VMIDs in TLB entries, so we never use the VMID field
 * we treat any write to VTTBR_EL2, not just a change to the VMID field
   bits, as a "possible VMID change" that causes us to throw away TLB
   entries, so that code doesn't need changing
 * we allow the guest to read/write the VTCR_EL2.VS bit already

So all that's missing is the ID register part: report that we support
VMID16 in our 'max' CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not something anybody's been asking for, but worthwhile as
a step towards finishing off support for all the v8.1 extensions.

 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2d97bf45e1e..bf2cf278c03 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -672,6 +672,7 @@ static void aarch64_max_initfn(Object *obj)
         t = cpu->isar.id_aa64mmfr1;
         t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
         t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
+        t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
         cpu->isar.id_aa64mmfr1 = t;
 
         /* Replicate the same data to the 32-bit id registers.  */
-- 
2.20.1
