Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp1169073njb;
        Thu, 1 Aug 2024 18:00:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7iYYB+e5jVplXwUD9ScBjOJUZBdVYcGQf15x+5EhaSkpt9ta035dQGK16ynHVJjN2tJ6BeFupYJnLb2ULqRD5T9gRJ9D9
X-Google-Smtp-Source: AGHT+IGdtRKZo/GBkrn76E3xXDAL2dLQLd3ZW510aYlHi8TtfeLhUwnoCChEuM26N0+TcdW8SG8+
X-Received: by 2002:a05:620a:44c4:b0:7a2:ea4:d592 with SMTP id af79cd13be357-7a34efe2539mr218820085a.45.1722560459671;
        Thu, 01 Aug 2024 18:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722560459; cv=none;
        d=google.com; s=arc-20160816;
        b=CuYMeAVEZ+QvfwNxOOexiBxGo2YpXznchxba5aOKjcSz540YTHyvo+VlVHKr2BrGbp
         rMlKpPvcFOQGyH2eclfRAHLRvQwS7pmtbbRtafnn2XfRsrPKpHhq5+9KCg+Pfjr8eTvt
         VMkS0Cc7CqjKxaEf7EERI+U7X2hIzEnbP9FQXWLq5ypZ45RgzSLO0GQznEH4JwlLXxWi
         cMERKFiZkKZhreVEGDWDOYPp5kljIpF+aqs4SHTgTxQCxYxJVoHRtVWB3/RvftelbinQ
         fQXCDgPB8EixkfmJO+9fi1T7mEccVR/J5CspSXE5HA6svw8F2OT1/Gt284VqjOjI21oy
         n+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=zM7C0L6Fvwie9kg4zGf+RjPnTtCxOnj1yUYBOTGzzXo=;
        fh=6JHn3E+2GWmAbqjTH17jKhRwkSKHp3lc7HSS3POdi3c=;
        b=0N7dJBZROUOYqvzGoTgIB2oDqyJ8C3Gqd2OmyAfZxJZchOALzje5Q3TCDMZ0jKgMOa
         EolhjXkGUFwtWflGblL937gSJ5hjHJv3d5/bde76s7mvED372Y31s+CNMIqtFSc6xolI
         6t7MfxeutGi1xGULWOFYagwK58fUUqsXvPFTYvZUIhguExpQ0VeFFomOW7sFyTU6Z30K
         2z+quzHQnU+1wcTXdLfYqPHZtsKf9PMmbyaw4dseQTr/H4QWM97yKBG5wjvcB+3QsXgU
         BUjzQL5a0FFyx+GWBzDsZ90jUmjhMD27vahm0kZ5CQkb8AvG+eftGuiokKdu7ds2MOu4
         667w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GXczwTEA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a34f78dc08si113877185a.685.2024.08.01.18.00.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Aug 2024 18:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GXczwTEA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZgem-0004Dr-B6; Thu, 01 Aug 2024 21:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3NAasZg4KCC0JUNgaRLQJaMbXWPXXPUN.LXVZNVd-JaVWXWPWd.XaP@flex--alexrichardson.bounces.google.com>)
 id 1sZdtX-0000s5-Uc
 for qemu-arm@nongnu.org; Thu, 01 Aug 2024 18:03:36 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3NAasZg4KCC0JUNgaRLQJaMbXWPXXPUN.LXVZNVd-JaVWXWPWd.XaP@flex--alexrichardson.bounces.google.com>)
 id 1sZdtW-0007J8-Gb
 for qemu-arm@nongnu.org; Thu, 01 Aug 2024 18:03:35 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6506bfeaf64so137624087b3.1
 for <qemu-arm@nongnu.org>; Thu, 01 Aug 2024 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1722549812; x=1723154612; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zM7C0L6Fvwie9kg4zGf+RjPnTtCxOnj1yUYBOTGzzXo=;
 b=GXczwTEAhVhy0QKHm2pd10sypFGWAhKXV+jVBYbHRflqU1oIDS2pI0szmdf5ohFgw3
 YokGjfAMFAUaoawO0YbCd6AlND9mhaS2atWjPSd+PVr0m3BUf4/jyYBPy5+egVd4p+xL
 N4fQhZ/+442hFKz8tpRQ6m1C0CHjZxDz8G6Vs/Jd9ZH+WuLGFs1nUkx5mmnJW/yPf7d9
 S0wCqAVk5LGbPPgkYVU9kQJbtuez1jDDJLDvQWihrsDgFRAPM0hXBagoCnYkhc5zft6C
 UNZuoZYBM6T8NPyOxZgyHd43z6UG+ojtwhuxZHrxGWGYZGGlmN8gzWmjCQm4ZTb+IazQ
 Vbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722549812; x=1723154612;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zM7C0L6Fvwie9kg4zGf+RjPnTtCxOnj1yUYBOTGzzXo=;
 b=BqvW0go5uCBozGMoRbCs1246WQOzC7naF3PXdNV56oH08RqaBucxNR40noQVKNrlXu
 PPHhBm04ItWdZImuAxc0KnAGTofEWjjRIrZ6QPLlmac2I7NsviYoLljhlkhRhlUFK7/p
 0QN7az/MX5ICd1zViZ1XDx4UMZiVROtUJxVBmJiBpjVIJIPFB9tROFUAzMmC4+ZYAUtX
 3RAdAmKcZWyfOhRns6J1EL9RV2B+QM2yHHfBQb6GkIhFJAqj8ADVdD+h4BdxcA6w7px2
 yMxJ5WT0FyVS/wR+t4qWfYxeYfaBhMA4DHAdrw2DlUI82WElZXinKA5cteR2BLKZ1et9
 uXIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtov+avFJAw+u4ZeNGbPx+A0UbU3+Jr7Gvy07kbbyS44bG1ckXcBQkFWRF/miOSiTlTU4JxbxHy6rcDQqDZGQ+sJXP
X-Gm-Message-State: AOJu0Yxcca19s/IkJqMNfKjWyHTt37NNvrquV+LD+QPRarSe6sdmIf7D
 3AsKKtIWNZfcEgBlP/Jze5iV5Y7OAk9jM9i2GyuJx/spO7Q8YFn23D1qX4/asU0zLG6VW0cveIc
 nhkJE+0avIygdlTJA4GH8FoKRPTYk/0GtyA==
X-Received: from alexrichardson.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2c0d])
 (user=alexrichardson job=sendgmr) by 2002:a05:690c:113:b0:62c:ff73:83f with
 SMTP id 00721157ae682-68964b5ad18mr223807b3.8.1722549812058; Thu, 01 Aug 2024
 15:03:32 -0700 (PDT)
Date: Thu,  1 Aug 2024 15:03:28 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240801220328.941866-1-alexrichardson@google.com>
Subject: [PATCH] target/arm: add support for 64-bit PMCCNTR in AArch32 mode
From: Alex Richardson <alexrichardson@google.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Alex Richardson <alexrichardson@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3NAasZg4KCC0JUNgaRLQJaMbXWPXXPUN.LXVZNVd-JaVWXWPWd.XaP@flex--alexrichardson.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Aug 2024 21:00:31 -0400
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
X-TUID: dSbXzwS1Id2d

See https://developer.arm.com/documentation/ddi0601/2024-06/AArch32-Registers/PMCCNTR--Performance-Monitors-Cycle-Count-Register?lang=en

Signed-off-by: Alex Richardson <alexrichardson@google.com>
---
 target/arm/helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8fb4b474e8..94900667c3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5952,6 +5952,12 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
       .writefn = sdcr_write,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },
+    { .name = "PMCCNTR", .state = ARM_CP_STATE_AA32,
+      .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_64BIT,
+      .cp = 15, .crm = 9, .opc1 = 0,
+      .access = PL0_RW, .resetvalue = 0, .fgt = FGT_PMCCNTR_EL0,
+      .readfn = pmccntr_read, .writefn = pmccntr_write,
+      .accessfn = pmreg_access_ccntr },
 };
 
 /* These are present only when EL1 supports AArch32 */
-- 
2.46.0.rc2.264.g509ed76dc8-goog

