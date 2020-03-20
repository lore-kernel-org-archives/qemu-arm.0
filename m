Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1065598lfe;
        Fri, 20 Mar 2020 09:06:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuuzQPPUFNSTBmUHTfPygThuZoJiYW9rrwbv73eymnRcVwYfAdawIT9XlnixWUTnBHOQLk3
X-Received: by 2002:a0c:f88c:: with SMTP id u12mr9195152qvn.156.1584720402068;
        Fri, 20 Mar 2020 09:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584720402; cv=none;
        d=google.com; s=arc-20160816;
        b=AUb7uOR1vP8Rrf5kYttdkcJYnAckJJShVwn8YlxwQmELe4g7SgfDnEAbiBGSqgcKgm
         vDO9WRbqp8EZumFNLCYhz6r13WkfPvl9WOzFtH26RtsZqpxKD0Dr6SPv+GZFh0YAN9Ng
         ftf0odKkSPb+5D3VYmKn7AwpXfWxm+v/wnobl2D8MFmd6vmqmZkZ3YZ42G/aZl0FK2El
         JELhNJ3yd6zHcp9VHu5nYPvP/L5kY/dvpmMjyWEbqfz43Lb1L+3K/c9LPNR+cThwMYy8
         sWRvaPtZWDeQikojIiR+LQV5BucPNaZt7QeQa/IY2gbMh7liqN06FxnSZVDdCQhYG0SS
         9s5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9N6FLF8sUw4XVnPIwBVzCdAPTwyubp1J/tKDvqzTiXA=;
        b=vtPOu6ya62zNHVXSB2nBNHK5J7wzeX32ungqRwXYcLjTCRIyyKBfA0y/EhhH3HNj2K
         QwX9nE0OGYEgBqeN3eJqusCyU+S/8EG1abVUMNPINQUiMXRNuG9OFxcIh3eXPg4CWQJ6
         aFwEN2lLfbLS3W90QCCU2QGg9FfYDqVIsd7IcrzG4dI0I2Ui+TChN8z+4G0LhLVEjzG5
         dm6P7EqbxLTQZpm73YyXLfiHG75clNLokHMEuhsWs7qm7xFehFlVPCpiyN3B6U/xnrZP
         wOSOKE3A3qeJtY2lOkqAt/0Wn2BJBHEk6XQw70qGdVNR8F8hoT8BRFFSTlrHKhxq0h6/
         9iOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sinYBWdK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x53si3774159qtb.391.2020.03.20.09.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 09:06:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sinYBWdK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFKAT-00024o-Ew
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 12:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jFKAI-0001zy-7z
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:06:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jFKAH-0001cf-5m
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:06:30 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44598)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jFKAG-0001c2-Vd
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:06:29 -0400
Received: by mail-pl1-x641.google.com with SMTP id h11so2661247plr.11
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2020 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9N6FLF8sUw4XVnPIwBVzCdAPTwyubp1J/tKDvqzTiXA=;
 b=sinYBWdKPXM87ZyspIJS8N8F+GXUJppxt202/ZQkT99Eg8bR4pvRLUmgByGD0hx0xI
 nJFDBVddSlbNtOc6IsVeOcW7Tm6L5sPKvCgsoaOmuUD1XJlE+tis5nD6VRBTKIlAk5DF
 F3dSjk8o9T72oL00+HtVlQoDUpngTeVf5XJDLApLB4dZptJSlUEcLDh7ToUMgw/0JSa3
 1mURHO/iqOuys/U9K3Ghrxbtn/e38w0ZJHpYIX2m3ib4knFoZLLa9ncbXOVHwRwdHJj2
 TFxbgDdYz0RszcBptnHmH4N+Hg9u7TCGO2TPSUb8Y9QJEvorDknLz6jlFl39uxdiKDgP
 tulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9N6FLF8sUw4XVnPIwBVzCdAPTwyubp1J/tKDvqzTiXA=;
 b=UrX5HOogUpRXnLnrDWazTf0AN9nmnDigUrRCDlO5OMaa/oztpO/6iV1Q3bkvMNdX9n
 QvxUg9uyT1RcgUy0iRA4/OZ64WDmMRWPWG5a2A4wO/sQrUuOnTp8Z84pNhT4MXBL7m4A
 N1nzWL39k9OZqLmCnq9gvad8GLiUAQNcV+CWfpMNbj/Pgb3Aq1pvGrnRq/mMIAxzLXvr
 UEEPQxal7k90/lUat8BmidjeLVnXClCDKGF70lU/GiWRKDC1ln8iXPzCd4iK544C19r7
 yusNvGPycwyVsAC65NRglpOjePCNf5bWyEJII4ambElw9weBYMeNPWPIyKoYseJTycmj
 yYOQ==
X-Gm-Message-State: ANhLgQ0eoYKhC2Pw+ekjaCBv9/KM/owZx3ULNZLUTCkAbdRo90R5AJ3Q
 Ce3qK7V9l0NDsi5HfJ4XpB9ITw==
X-Received: by 2002:a17:902:eb49:: with SMTP id
 i9mr8953254pli.91.1584720388077; 
 Fri, 20 Mar 2020 09:06:28 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id nu13sm5272745pjb.22.2020.03.20.09.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 09:06:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/arm: Move computation of index in handle_simd_dupe
Date: Fri, 20 Mar 2020 09:06:22 -0700
Message-Id: <20200320160622.8040-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320160622.8040-1-richard.henderson@linaro.org>
References: <20200320160622.8040-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-TUID: hdpNmTgRus4Z

Coverity reports a BAD_SHIFT with ctz32(imm5), with imm5 == 0.
This is an invalid encoding, but we diagnose that just below
by rejecting size > 3.  Avoid the warning by sinking the
computation of index below the check.

Reported-by: Coverity (CID 1421965)
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 032478614c..7580e46367 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7422,7 +7422,7 @@ static void handle_simd_dupe(DisasContext *s, int is_q, int rd, int rn,
                              int imm5)
 {
     int size = ctz32(imm5);
-    int index = imm5 >> (size + 1);
+    int index;
 
     if (size > 3 || (size == 3 && !is_q)) {
         unallocated_encoding(s);
@@ -7433,6 +7433,7 @@ static void handle_simd_dupe(DisasContext *s, int is_q, int rd, int rn,
         return;
     }
 
+    index = imm5 >> (size + 1);
     tcg_gen_gvec_dup_mem(size, vec_full_reg_offset(s, rd),
                          vec_reg_offset(s, rn, index, size),
                          is_q ? 16 : 8, vec_full_reg_size(s));
-- 
2.20.1

