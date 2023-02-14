Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1426635ejb;
        Tue, 14 Feb 2023 08:33:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+BQC5FzPNtaaTWgwPCxogpbzrQCYjEAVZDb6Z190QRRHbxFnVmiTLE+iSbrzlshuAVbDb+
X-Received: by 2002:a05:622a:1995:b0:3ba:a6d:a0b1 with SMTP id u21-20020a05622a199500b003ba0a6da0b1mr4999502qtc.40.1676392422271;
        Tue, 14 Feb 2023 08:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676392422; cv=none;
        d=google.com; s=arc-20160816;
        b=ly9S5SzPIxaWBOmzhfomw4NEHMqZfxKa8zL7pBt/BBxqffGC7nej3LPms/YT+WyRW9
         BXCC9dxhwXrQgZeAl3q07qnRJzcTI5mZLZNiWSEZ6fwHTDTZigckwl5UXV+Cyyro94AZ
         GedU+H7qo8iVr32Ds4GGvZgWOu0evNzFzPmyiuy2cRz8IJr/O4hH2p2TQaHM81dKSl+1
         dFlA5oO3TWDGwqFdZv+bNJBByVIJwoCteQMDqivvCEJD+7PijERsZ2fHCOUSHbPQu81X
         4t+8sxjfEaPsSLTMmTsdGqdTx+64gMSB8ZvFI0/FUcZRtchPdmAnUf0PuwzMuU1obYPm
         5tlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DHtifVEb490wvqlj18C8e7MT6laK9IGTMe9tkX1/5mQ=;
        b=CGyB8joTU7J26QxiBSFFwG8n/DWNuz0oN1MvFDBhyci9FxTRlmWAnt5OJ2Fy1tBkaF
         W87PyieSbYhwxf2THznpeBjFuECmOTa/C4/txnjdBCDGyPp8NF1fsktyuwKuzeBPyxpg
         nK21mIc2uqVVbiGSzNHZYYj0q+10Tyfd8QZZcJUk0lZmdfRJt2ZcONfX7NJn96XBZfAn
         Y8MnbmGmwBvyYNALSDNwEC/Aw/P7YYE15o5/0BkGNQ9Koquel+wVAR4k/yXksJ9s8/bY
         UoE6umpz9K/iZE/efAakaIG8HeVdGSUZT+s5lT/JDtU8rbOQEZCHBC6d0isKdTubMq8n
         j7bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iLrf6cVv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v27-20020a05622a189b00b003b9a6a98002si12463216qtc.692.2023.02.14.08.33.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 08:33:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iLrf6cVv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRyD3-0006gh-Vz; Tue, 14 Feb 2023 11:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCv-0006Ty-Az
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:31:06 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCt-00028v-Og
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:31:05 -0500
Received: by mail-pj1-x102c.google.com with SMTP id bx22so15606621pjb.3
 for <qemu-arm@nongnu.org>; Tue, 14 Feb 2023 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DHtifVEb490wvqlj18C8e7MT6laK9IGTMe9tkX1/5mQ=;
 b=iLrf6cVvPRaxm9SqmCbpUOmcDb0O/r2uPKIEzYVfG2GVkMWN734F24AChU75ahNPGW
 R4QlwKd6yk4ZmAL59P1N0kslEM3pSP/ql2YEcCLMqqdOlU38/hIrnp5UphDVsGvIVqfM
 VRrWvGTiqIQUCJwijhz8sjjhkIwVHSUC0ZfnDh3wVEyQfM1bKIMqM3TPpCCqIchGJUrI
 o+V2rgeh8pgs1C7l1+UmTZEu+c2TF1KNkrv/j2b0dk631km7knaDuKT/ZF6ZVpvlEMKK
 crvdPRCBulZTybfQOiQH7mdJ3FvwaZrhucX1CboDr+9UbIIhRNShagsqPN6OkddVFJxN
 10Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DHtifVEb490wvqlj18C8e7MT6laK9IGTMe9tkX1/5mQ=;
 b=csqoTQjwK8UIHW+8xeKLN81MgUM8Z22ETW0zpgSyQlrZcl4zd7fJfDRLkdynmar7LB
 36/te7dQTBDPKQxVxpdZA+C+NI7yiZNvO79AdogjioA37KUgeuvtCyGBRXcWtpf3DDqb
 XhlowKjaZVy4FS4ZSWcio32fajD+wKaof2NchQH+olJk+wEVYkonfiQ3Qcms7N/AsuUQ
 hRj2shNalpE+yDqY1KR4CrsjCPuVGh1fNFjPd6VK6aAwcY7MjAaakkcq4rrAt89A0LaA
 bkXk3e7RAIh9vwIfwxyehVUmIr2VUPrPYDcIIbKHJ0cAzSFgS6wT8AZnSeh6QVzPH85/
 hYJw==
X-Gm-Message-State: AO0yUKX/qlGsj9fWt8kNkgdmAye3HdEHz/z9ZfWIKV72ujdJNarX4+IT
 /1/JXiD6j5f64FEtuT2jHUCnNjLmc7EXjwFxwf0=
X-Received: by 2002:a05:6a20:394b:b0:c3:cc65:165c with SMTP id
 r11-20020a056a20394b00b000c3cc65165cmr3773521pzg.61.1676392262149; 
 Tue, 14 Feb 2023 08:31:02 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:31:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/14] target/arm: Fix svep width in arm_gen_dynamic_svereg_xml
Date: Tue, 14 Feb 2023 06:30:41 -1000
Message-Id: <20230214163048.903964-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: fTHxlI+LqgSx

Define svep based on the size of the predicates,
not the primary vector registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 02a0256c5c..ec61211949 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -297,7 +297,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     /* Create the predicate vector type. */
     g_string_append_printf(s,
                            "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
-                           reg_width / 8);
+                           pred_width / 8);
 
     /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
-- 
2.34.1

