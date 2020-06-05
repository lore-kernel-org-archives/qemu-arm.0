Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2073066lfc;
        Thu, 4 Jun 2020 21:19:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYkcNGZVF/Pv//zIxEPgm1s7OTwuUz+m3pXgzVMN2HMMoNA3ZM8zzVsSNUNcC7ocF/bG33
X-Received: by 2002:a25:8888:: with SMTP id d8mr12690701ybl.87.1591330775287;
        Thu, 04 Jun 2020 21:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591330775; cv=none;
        d=google.com; s=arc-20160816;
        b=Ss73VRiObvtkE1cdSmWvYe7EIkcg3cDm1P8dTDNWZQCrGr3zRcjks6d/OeQXcKYDHl
         RW0lkA71Es9tZlGJL+LF0nBAx3XMkCzORrWGwxKWRY4sULl7ZwIL6O5Fp6EC7PRyZ6+x
         yzy95oHsknr1WIDp99k/8xlEs8C8kSH1PHiCeaF0TL4ljopdb9EGuSiLhTHT6JiWo9Nm
         v+Vn+IUOUJn//6pcLWRbh79pPOcnrEy8QOA4nAhbtJhq/9+fhS91QyJ3JB9tFCr5kzHZ
         0zT21NPz5mXUElTIdLg11UOfM9vnVNgHPH8OwIgPC3dEhGIDqkPDaJZ8jkrNlGnB3K61
         3ONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nqqofQziFBqWdXP+8khcoigsyFvMbdt2vH117/pVwFo=;
        b=flmNmK5rPgJrGcPJbIUDRBqgLJp0aPtzgqfHcq9pPV9szYIOiZH/k1o1E4W36p5X1x
         U0zLB2jiu0guUOoO6aONIsM5Htc1fIZrMI6zhba4hR6+X38PoBcl+6Gvj+4wSwc6ar6B
         BTirnan8+IR8E0VksaidSno9BCyOYUVhjPCdnynD9TnnA6sRntPYZUwIDCCzM2mtWKQl
         YplEbDrrlud8tBF+CwrfjIT9Mvx/A8U0AQVF4AQJILfiPRvkAlYXyr1kyqfOk+n2m+Om
         MoGMgKJzOfRrJ/9C8NNY0EuEOJcY1GRlGMnDm7YH5aHOrb1dOxWP9H/sQt3A6Nfl14+n
         CBGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xyKzTnUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d78si153856ybc.122.2020.06.04.21.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 21:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xyKzTnUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh3pO-000896-Iq
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 00:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3na-0004FX-CF
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:42 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:55969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nZ-0000jR-Hv
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:42 -0400
Received: by mail-pj1-x1041.google.com with SMTP id fs4so2053733pjb.5
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 21:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nqqofQziFBqWdXP+8khcoigsyFvMbdt2vH117/pVwFo=;
 b=xyKzTnUoermMpUwPDDOvda0xWv7DakzouPKnECbhodlQTTmqQHY3y5wDHVpNUkudKc
 5nZMV4J5d3QeKHmtH/WKEU8h8mGbFhgS+qjoJx7OmYNf1/ZSHSavCutMk74RS2TDX1IU
 IlXPdq1uDZlj9vKIDz/fW+nFGTrbkqf/cBZv0rkNYXliiE7aT/Nk2gSIBzi2UA+Lxu6q
 mYHxAn5sKl/AuOASnN5mNnjdi5BPyY9USNVxBH51SPKnDiSvQDGCP9Z5URJQsp46kbHh
 g+Er9rkYF9X1iR0svgXb0JeAR9ONRR1ZVL3padv8JVnV4D8e2NPSn1azB4JzoCgR7ffa
 hcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nqqofQziFBqWdXP+8khcoigsyFvMbdt2vH117/pVwFo=;
 b=hUmD+Tl8pOX121iAzPIIWSR8ZaCaJY9L2Ex+DkUwF+I8VxincAyW1T+YGdUGkaLYbL
 segix7hV/jPh7bOZ+9gmiT7CWinh0O1RcBjnSKqdPlFMHV+pInOji77JWBPMvWyu9JAz
 yK15Y59vt4l6uAQECRzoYVUZF1mk+z1jCtPQhuA1Ye2b4rae03IN6eeK6sU6LuYrMJaN
 pFlYKnfNaKZTv8CQcPrhKfRA7S3eg/qXiS1r0kiABEBv0DPwZnfM11EM63drKEVUWqgE
 3BrmWvChJTGAroMR6dvd+typ205z6xb8GP9yg9wo9MBe4RrKj7d850j3m4yVc9u5U8e6
 UZ+w==
X-Gm-Message-State: AOAM533cHK+bjFj/DSfwsjEaa3ck0z5i0Azn6rXdlKa8OuuFi5btP5o3
 8AEYGjHPvirjxlj6YLRVZGG5dA==
X-Received: by 2002:a17:90a:17ed:: with SMTP id
 q100mr740057pja.80.1591330660238; 
 Thu, 04 Jun 2020 21:17:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h15sm5440902pgl.12.2020.06.04.21.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:17:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/17] linux-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Thu,  4 Jun 2020 21:17:20 -0700
Message-Id: <20200605041733.415188-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605041733.415188-1-richard.henderson@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TIPYoxMXDwn5

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 2bf35e66ac..a8dde8c609 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -464,8 +464,8 @@ extern unsigned long guest_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
@@ -477,9 +477,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
          !guest_addr_valid(addr + size - 1))) {
         return false;
     }
-    return page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ :
-                            (PAGE_READ | PAGE_WRITE)) == 0;
+    return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.25.1

