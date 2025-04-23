Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp3228865njd;
        Wed, 23 Apr 2025 11:37:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwCp8QMgCu54HhZEfcmElod6GBDGErtCGJ1Oq/g/lhFqrCJj5JK8Q+poNy3U6c0zm3aLajMSFTOGn5Hw==@linaro.org
X-Received: by 2002:a17:903:98c:b0:224:1780:c1ec with SMTP id d9443c01a7336-22c5360dc12mr353205395ad.35.1745433453112;
        Wed, 23 Apr 2025 11:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745433453; cv=none;
        d=google.com; s=arc-20240605;
        b=CzekBVCXpcdvImhHCP4STikH4vY8vtpQSza8/gRQ+PHUqO56tvagr7BEgKfiqnveQX
         r3jN/otYL1LpCxc/xGUQckYzyT7uDR1UENbsG2mr1TKH8YUiz+mqbq0f/NDRBL20Gxdm
         MdWabffrF6VWxwqS9dIOoV64/VE53ERKu9SIliEIuvgGANNDWwF+WyYbcMQ0po+cxQOj
         SdJ3kMfx+VlfnMMylJ80w5SVbsXydAF9kZNacKN6JLmPUxG5SVOlJHMWtlkGTLgeuVPE
         wWsuPryQJkMCPtJz5tSJYYoNxJ7xR3OcQnaL6MBMqdWGmq87Ek7QoGOu92LpesgJItYY
         JEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:from:subject:message-id:mime-version:date:dkim-signature;
        bh=nY1a3kHuX2lbkjX+z4gIYyiMc7As84sOZpTaaoTLSGA=;
        fh=irY2gayOcixX8WGFLEXwzAOsT8dR77eX+h+H+c/cZD8=;
        b=W1gc0hwMWcnXdJuMl49KtigDxVD7WxbM6edO4Bw//VL+5g71srG+b0+ujBZR6znojk
         ul/5nFQUtkb4pM3LlZyPblTT7yA39zgBIZF9X3lNxz/K6+zgHePRvCo6H7Srv4aRZhJs
         Kr9DA7t5bKnyCGoPdRJ+P3tBoryB2MRntoyN7AssMFDkATE4WfXDourVcvmeox297iZm
         irKDmpR3oM7S1nBfKY9+G2vjRAsXdn3EyJB/9JfaDbpQci34X8HoR0AgmL5u7PmtRmP4
         zP3g8IacomOTUn0OySdeJpKiXGZs6y2PFP1WpUSgjpZV9btm27uMkZ6DIyb878r8r5Ge
         Cc4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=IiE3fpaf;
       spf=pass (google.com: domain of 3bdmjaawkcz8obcjiftufgbohpphmf.dpnbmfy.cfooffmjobsp.psh@flex--nabihestefan.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3bDMJaAwKCz8obcjiftufgbohpphmf.dpnbmfy.cfooffmjobsp.psh@flex--nabihestefan.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3bDMJaAwKCz8obcjiftufgbohpphmf.dpnbmfy.cfooffmjobsp.psh@flex--nabihestefan.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id d9443c01a7336-22c50bdaea3sor86435715ad.2.2025.04.23.11.37.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Apr 2025 11:37:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3bdmjaawkcz8obcjiftufgbohpphmf.dpnbmfy.cfooffmjobsp.psh@flex--nabihestefan.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=IiE3fpaf;
       spf=pass (google.com: domain of 3bdmjaawkcz8obcjiftufgbohpphmf.dpnbmfy.cfooffmjobsp.psh@flex--nabihestefan.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3bDMJaAwKCz8obcjiftufgbohpphmf.dpnbmfy.cfooffmjobsp.psh@flex--nabihestefan.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745433452; x=1746038252; darn=linaro.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nY1a3kHuX2lbkjX+z4gIYyiMc7As84sOZpTaaoTLSGA=;
        b=IiE3fpafz5OU9mOFaJLpfPC78aM8OI2/4A+qMhGJIMqcalyPgzCVlv+SHtq+xFXVew
         2d2ZedIfppoz63a9O8VZaBbb5Zkt9RAn2kiwXt30ZGVHBIec/kBXnMPwn5UxTX3LIVnG
         C8vxH+f3ihTdikKPygAcC7U4q2T2805+hZV2R2sTLWjkWN+jBVLVCRk5o6u44s2k+233
         3hufCE5Vr9W4S5cyU1fS3EL9hhMOWdGgNnA830sr2PnSKpys1l+N8SYNTVyevVTRicnq
         r5onV2HaRmWeBq7icP86wUmREqAMCNKTWaUCrrSm1bt3sdw5WPkJvRirI+Wm/VlLfrg6
         bXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745433452; x=1746038252;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nY1a3kHuX2lbkjX+z4gIYyiMc7As84sOZpTaaoTLSGA=;
        b=CNO/BX/GehLtcAvLyxaH2SyhzklvT5WVDoLPdVCfaUzIBhRE1qFpWoVTpaTudiFgJy
         aTgKGy5p9v6AA8ZP0n3wxTNWbANXqqGofHOYAq//m/YvFVsWKn0vapD/1aJeoYqQq8Tj
         K60rl9OAcI9cY27vrBgSTcDSRiSmmBfD9B9V1UHKwxF5IkJZu3LlW01nZZBayuj+Ztbc
         PvIhEsVYgVFizeJMHerj5RG9qxStaPIqs8cj0d2ZY6UGmB+sG13NFgAN1uUs59KSAZm7
         06Efi2jEY/4XxfdNdCdG0ZAjClOUgjX5Yy1GaZJG8uaFXZAXCn429uXO1xqoF+qyatmN
         ZIVA==
X-Forwarded-Encrypted: i=1; AJvYcCXlVZuwbhuDCCaAbadyTcuyNCN22nuWVMkmEQIxACuEuieJcwuolmNsOEDTwaZkdaidKnkUx2IUMoPthQ==@linaro.org
X-Gm-Message-State: AOJu0YyuoZATS31TIwxMwBcRBptFBWhR5LClT83hK3msYca6eC5xKeni
	Jj9M1wQLR/oo/gl8oUngwyPu4Jw9j0mBe4TQRgXV1I0XFpSbP6Abnc3b1FTbA4H3PtOza08jU91
	mgerY32TaKtLn/dKset/p1f88XQ==
X-Google-Smtp-Source: AGHT+IESBL6Ft8dkObtuVCZvyVQf10sDkqAj7azX903oUBxUS06u3rNNyzEgUTRN24uyJ+feO+pUKJiMHbvnEhTyP0M=
X-Received: from pgct21.prod.google.com ([2002:a05:6a02:5295:b0:b11:dd2:e84f])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:19ed:b0:223:54e5:bf4b with SMTP id d9443c01a7336-22c535bfe32mr332222985ad.25.1745433452608;
 Wed, 23 Apr 2025 11:37:32 -0700 (PDT)
Date: Wed, 23 Apr 2025 18:37:27 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423183728.3860325-1-nabihestefan@google.com>
Subject: [PATCH] scripts: Add exception to license check
From: Nabih Estefan <nabihestefan@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org, mjt@tls.msk.ru, 
	berrange@redhat.com, thuth@redhat.com, alex.bennee@linaro.org, 
	peter.maydell@linaro.org, Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: mdTXOhE5QiN/

The documentation for trace events says that every subdirectory which
has trace events should have a trace.h header, whose only content is
an include of the trace/trace-<subdir>.h file.

Due to that, we should skip it in the checkpatch license check.
I'm adding it as an exception to the check instead of its own if so it
still throws the warning on all new files instead of ignoring it.

Change-Id: Ic2dae14f8cded0dd02d5b231588bd38d8a00e40d
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
---
 scripts/checkpatch.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 365892de04..b2c6ac2477 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1685,7 +1685,9 @@ sub process {
 		if ($line =~ /^new file mode\s*\d+\s*$/) {
 		    if ($expect_spdx) {
 			if ($expect_spdx_file =~
-			    /\.(c|h|py|pl|sh|json|inc|Makefile)$/) {
+			    /\.(c|h|py|pl|sh|json|inc|Makefile)$/
+				and not $expect_spdx_file =~ /(trace\.h)$/) {
+				# Files to include auto-generated files don't require a license
 			    # source code files MUST have SPDX license declared
 			    ERROR("New file '$expect_spdx_file' requires " .
 				  "'SPDX-License-Identifier'");
-- 
2.49.0.805.g082f7c87e0-goog
