Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp487137lfo;
        Wed, 3 Feb 2021 11:10:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxya2+YeJnFJElrQY5EZft/cYsPPqyr0Jt/8MFr6SqzXNP48uV3VYx4zyR1gBNPkDKXDgt5
X-Received: by 2002:a25:1e86:: with SMTP id e128mr6721796ybe.326.1612379405721;
        Wed, 03 Feb 2021 11:10:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612379405; cv=none;
        d=google.com; s=arc-20160816;
        b=Orzcx/ZZGjXFsP+oU0tWzwAhbCFjecX2wY6FctFFaGu+dA10hwzdE61DR52uF+Jwjx
         HLuWSfkrqzaxMyNxq73tGUEA9uFITEdAnb+rRYM1RomfUSpgaEatVJCPERYppj5MTr2T
         s70OS037YbcYFRlZHPVx9TqkyNDhwnNqNwRo7EdVtiIDB0lA0OlHBsiQj012L8bKLbfW
         Ry55qj2orCUEGZt0kOEuPLtPMsYe58lHZ25m2F+Bgjz32tB1OL2pyuSLPIyjOTMTTLWe
         rutcLpMiyNF6PH6q81OL29Y35KI1r6cvFWJ5/DJxuNjMWMG9v0DSQeVjcFQzgwc3eslt
         3NmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Kyzjq96nH0KWrOiii6echH6ofV70lplGMBMMhcVo2Uo=;
        b=a12LQPmrthzap/msE9sy5LSXVSqjn+TVU7cxOcSF1wmQ7maSNDbpzVy5zx5NhrxEvQ
         UWRtQIh5w0+T8b/ym/8BC//xU4p0E5dmcg6yZ95BaO/0WoSr8a0FBoRCzbKlHuKcXtYD
         G4ig/ZzJjrlamuaABdXHgr4BgkJtvbpAgHsopN+Wc5wTYSyeTMH/GCVX6y1dya8jlad3
         ZAPMKzpdvtOSJDc2qC+tIEbwC1OI1STpKRsooEziHdqcD+g4CR/5DIuPkx8W2cNNosI3
         W4dJDa80TDaOmNG7xLkZ5MQ+zvSACsZgLDJvkrNntxq8RGvYOsTADhfxJCfIWLokzg5k
         V/Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F1CpBz6K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 65si2982090ybh.65.2021.02.03.11.10.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:10:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F1CpBz6K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7NXR-0005is-2C
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOJ-0007Ej-6Z
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:00:39 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NO6-0001Wz-VE
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:00:38 -0500
Received: by mail-pj1-x102f.google.com with SMTP id m12so223832pjs.4
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kyzjq96nH0KWrOiii6echH6ofV70lplGMBMMhcVo2Uo=;
 b=F1CpBz6KI8pwYOdtsjrzYcnoFUgg6t6MPUbKQ37abf29plDfhp5Ia/GX5cs0qA//dA
 3N0wtxcry/4ZS8oP9TuNzIFnTfMQonvee2WpyQ/XBdvDLA/81beZqcP45SpWqAdBX5/J
 xNQh8gi8cGdjBLOzxVKiTBtQ91cP7g/BdsWQmRtU7LyJXn/w6HzB89pqP7xX9AxVR1go
 AxJxXP+KNHMWjObKeaYVHjhOrsILHx86Hysz4ncDKyN9tXnef2CzmpYdPiSRMsCeZgtI
 QIdNtJNgXb+2m9mnd3OF5qS0qqRD5PIAQIzQtvkTnA3GFSWOtqslFoa2MIejmPJmY5Tk
 P+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kyzjq96nH0KWrOiii6echH6ofV70lplGMBMMhcVo2Uo=;
 b=bNgwkYyvNTt8+n3BhTcXEsTDpFaUBzQsafMs/onRkAm5Rfpz2+J2boqncdoPBgeKyy
 40N5DMCqX2HxdDyohLzi42y05TvtYP7oMW7ayl7xIcrHEDqkooLvtr9OqlPnzMz+WdGA
 AjmuT4LFHoNch0LM/I2CGRD0g4w765Q6chvS84F7iHY5ZOjVTyeV5I8qIwCynU9FU9bP
 YAKGN0I82ZdCfCj6FQ0KxK9lgYBdmx4AJiZIOZiTBNeonQlkxYuj6NwjBHwH+1u0fPw7
 6xhykeUjJ/QDcKRIOUrzlAx4jWjMV4MYO/lt7tv1y3B0ospZN2ilxS8S8fb+FrXFqkrm
 DRPw==
X-Gm-Message-State: AOAM530zxFSgMUGNOasqT+XMEnvS2T/bxlFdH166nhab7IokL1U4pdTr
 VzWj6AFpTUM6UhDnH2sa9GRFKg==
X-Received: by 2002:a17:90a:fa09:: with SMTP id
 cm9mr4235955pjb.160.1612378818964; 
 Wed, 03 Feb 2021 11:00:18 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/31] linux-user: Introduce PAGE_ANON
Date: Wed,  3 Feb 2021 08:59:41 -1000
Message-Id: <20210203190010.759771-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3v7z2Qjp0E8N

Record whether the backing page is anonymous, or if it has file
backing.  This will allow us to get close to the Linux AArch64
ABI for MTE, which allows tag memory only on ram-backed VMAs.

The real ABI allows tag memory on files, when those files are
on ram-backed filesystems, such as tmpfs.  We will not be able
to implement that in QEMU linux-user.

Thankfully, anonymous memory for malloc arenas is the primary
consumer of this feature, so this restricted version should
still be of use.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 2 ++
 linux-user/mmap.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 99a09ee137..c23c77589b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -275,6 +275,8 @@ extern intptr_t qemu_host_page_mask;
 #define PAGE_WRITE_INV 0x0020
 /* For use with page_set_flags: page is being replaced; target_data cleared. */
 #define PAGE_RESET     0x0040
+/* For linux-user, indicates that the page is MAP_ANON. */
+#define PAGE_ANON      0x0080
 
 #if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
 /* FIXME: Code that sets/uses this is broken and needs to go away.  */
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index c693505b60..7fb4c628e1 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -599,6 +599,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         }
     }
  the_end1:
+    if (flags & MAP_ANONYMOUS) {
+        page_flags |= PAGE_ANON;
+    }
     page_flags |= PAGE_RESET;
     page_set_flags(start, start + len, page_flags);
  the_end:
-- 
2.25.1

