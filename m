Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp289245ejb;
        Fri, 9 Jun 2023 03:48:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7gfO4sIXWloN3W1+PrUfi1JmOY7i/FfwL8E7zIrXu2LFbOyzTsHE8oWkLqf2B+cUeM7K1j
X-Received: by 2002:ac8:598d:0:b0:3f7:bf8e:5e06 with SMTP id e13-20020ac8598d000000b003f7bf8e5e06mr1508610qte.10.1686307702313;
        Fri, 09 Jun 2023 03:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686307702; cv=none;
        d=google.com; s=arc-20160816;
        b=UTrS8sePIPnwAHYKuLhY9CV7LYnIYmMzAV0oPpwetG6PcrOu6z271VPXXvJEUsVjvr
         cik1KvMslTkKjvUe7LlCxwQTM09vvHj0tEpW2hciUUIDijRIbPKI8YiHYCbKuZIe7g3e
         /pmnsskbjiJi6I8iMyVDlrudq66I2PNXBLNeNEMib/iCklhUgWi2Yo2E37BBFdEQ5SI6
         N63BUz0mpN7HucVKoPgvsPxoo8X5wp9UAv1NEKq9zktYRaxT408XDerSKkTrls2ka72Z
         096SMV9HAdBojUkprSkN1w7A436QwxLN6pw3+wV5zu/bnVkslesjyC2kaFkict6f1Zxf
         8/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8SETXkVu42iYrYwdrPf+7GUyYB5TIaCrhCdi2IDdcRo=;
        b=MiZWRLgSMiM80W4Elom5ocsQ6GQzvfknUs69eqlIA4bdDJmqVwoWoq6mSUkv5jH4j0
         Nh0lv9xQQauxLghzVgchJq5WvWOOfvk2+CtFAJSQcBx8F1PkhJcLFkOwSgix5swMa802
         umzRofAs8KWuTFtKnRtxXU44EPaQqK7he6zt4+BhOhTfHv5QSkpfQETPjXdKggAS7YZH
         YRSDvdLF9npZyc7P1nrGJsvIOlFPXb3pnMZtZsYHZV0+k0gmyWG8lM/A5xYcdtEc+YuD
         kgD+H+VMk9AA04q/ZZSrkBlDqY8XRW4TINAs72VExa5lY9BR3l8gQuZgB9dOlppUaMnp
         vPsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SwzEPOIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21-20020a05622a02d500b003f9a6395ee7si1967498qtx.243.2023.06.09.03.48.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 03:48:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SwzEPOIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Zec-0000og-Ef; Fri, 09 Jun 2023 06:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Zeb-0000oM-5C
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:47:37 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7ZeZ-0001Bq-Lc
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:47:36 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30ae5f2ac94so1608782f8f.1
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 03:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686307653; x=1688899653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8SETXkVu42iYrYwdrPf+7GUyYB5TIaCrhCdi2IDdcRo=;
 b=SwzEPOIJTOe/tptid0t2x1uvOZLNUBzfuQjpkwTTVALykjGv2GvhAhupkeXfzNOU5c
 56QRsaCmWE8/vlTRFLMttfaG+uyScKoN56P7ObnMsgYD70GrlkcEMHpgbpDG/oIEqWV9
 i8D14x7BEpk3h4OyPndSb/EQ8rsZyTr2i0C6IiB/XYvbcXVZ3qfhsxlg6AP5YMElXCjZ
 vxH3YHIrXSNwthJcBHaoUrXKsMlfnWn2R6qu8w+bGu1O+iC4uL+eKb1RjZUNGGBcejEE
 sUAqhAAXpPM9XAYY41lOO6x3V/JBlgMWQlqu2dHhAyzqseTjAR99Z669NZ2V5sOtFj9J
 pxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686307653; x=1688899653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8SETXkVu42iYrYwdrPf+7GUyYB5TIaCrhCdi2IDdcRo=;
 b=NsIE3Kg8QZ8vdSr0wmntt3XhaYVwQ6cZOGo1gMfkxyTvXTc04zCyx9eQLPhmXSo7Ak
 YfrBAAoCmknrAzsIJowW5u8UaCbUlL1LJYEzOG1MiQl6Pjl68SRMXflVeH2YCSZlcryu
 oPBZ+fRHy48Y5xTPDsp+VO2ZjfQh5cMzvKqsSK4p1AzkIjPz+/Rry4plGz2McdyuVE9n
 oUSFeYLx2uWr8yt59Lr+LcsPOCEgHnOMZnSRCLp3TBagWEZO0pX+8l+CVggE26Bpsvtr
 iYblGx9pAWbUFfsEYLlI7Z98awHz5WM+0WQAyWs1TsW2nPyh+OdIcJ2nwaLQm0wy4VYu
 RJIA==
X-Gm-Message-State: AC+VfDzgCNnFgq6hRcBY7LWY7egHVxWzEXSf4kgrxut9JPTcKNfpVPR0
 k+DwLSfDCDt+rRCloN7YJNdQiA==
X-Received: by 2002:a05:6000:1cf:b0:30a:e619:3a71 with SMTP id
 t15-20020a05600001cf00b0030ae6193a71mr794048wrx.23.1686307653277; 
 Fri, 09 Jun 2023 03:47:33 -0700 (PDT)
Received: from localhost.localdomain (23.171.88.92.rev.sfr.net. [92.88.171.23])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a5d4604000000b002e5ff05765esm4117651wrq.73.2023.06.09.03.47.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Jun 2023 03:47:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/22] accel/tcg/cpu-exec: Use generic 'helper-proto-common.h'
 header
Date: Fri,  9 Jun 2023 12:46:57 +0200
Message-Id: <20230609104717.95555-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230609104717.95555-1-philmd@linaro.org>
References: <20230609104717.95555-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ehh9io539VO5

We only need lookup_tb_ptr() typedef.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cpu-exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 42086525d7..12362177af 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -38,7 +38,7 @@
 #include "sysemu/cpu-timers.h"
 #include "exec/replay-core.h"
 #include "sysemu/tcg.h"
-#include "exec/helper-proto.h"
+#include "exec/helper-proto-common.h"
 #include "tb-jmp-cache.h"
 #include "tb-hash.h"
 #include "tb-context.h"
-- 
2.38.1

