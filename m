Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp640249ejb;
        Fri, 26 Apr 2024 12:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW63C1yVChi1WcJG1f9p7o02VTsggCBvbxTv1NiC2XagLUfz66JkBi/V8VoLZGrzVAB2nvAD+/h8bR4v6OdVMrdQQsHH1uE
X-Google-Smtp-Source: AGHT+IGdTx5Ct5cuG96xPzuwPK2+6k81+CGK3WOghkeHXZ5nNzlU+5k7Vy5x+iXp5ki6qjqY7feT
X-Received: by 2002:a05:620a:a85:b0:790:86da:a9b1 with SMTP id v5-20020a05620a0a8500b0079086daa9b1mr3841040qkg.63.1714161029847;
        Fri, 26 Apr 2024 12:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714161029; cv=none;
        d=google.com; s=arc-20160816;
        b=lNwXt8nvYQqaLCqtIEJkv6UzZsDfuW3TrRwhIRiRAo33EZzbEog13gop4uJHyjk9H6
         BzWIM/SUSF4cmtNrVxnsuEjdsf0Gnu7GHuNigl/LhwvWZQFqm4/kmPB8Tfv9OXDaPV10
         z1NiDfc2fU8pCbssRzL2oAFA0vWVkYy7KUIHNisbHdFI+fDvJyoxnLD9bqURiWj+af4w
         2pTXJcR7uYbseI4MsJT7R6fDQFHTxIheNNrD+3UAyNXnccMYyrO/g4+eEL+boUFm8487
         mB0Twy3tV72OcSLNDiDRCdNtD2ZJH+SSHyqGnYSiWRWMXgHbhgqgjwPQihZvdZRjmwjU
         cP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LQMRED2mjhykafQx2tnnAWOSRm9bpyuzeSKJlhGVxZw=;
        fh=SfiFowSzI5ATZYdt3xSfg9ijceQjtlPRNX0VSBhOddY=;
        b=APa42XixT5JFNjiaJb9VZijvHVyJKPCvGmYXNXcE+1V9NzcF1omjv0oYpDRh7NC52c
         gnk3GN1JXEe1JCw04rD8cErk7lV4j6AgAQ72lE1TGhLg/UfqTVdjICRLkaf8XIUbIhGI
         jOqx8nD0mG1HQ4LW9oukXKqE1xCbo4airrt8xWKwUf1HwmJb8LiFpD0BD0tgxjpWRI6a
         bBBzAgaRd3rHe155ACvtvfK/QMikV641Cif18se5EOE5Uhoy+CjOtA81i23yTNbXn1kv
         Oy6JTiKwRgY39T8YmajASWwYEVTek04lQ8JkOx0qPiVQGkULQVxdUrKsYZO1eNTz7oof
         ENnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kLCeSw48;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a05620a148700b0078d6100f3c1si20919336qkj.651.2024.04.26.12.50.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:50:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kLCeSw48;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s0RV8-0008Df-Eu; Fri, 26 Apr 2024 15:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RV5-0007ux-IM
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 15:44:51 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RV2-0003zY-Jg
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 15:44:51 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56e48d0a632so3786306a12.2
 for <qemu-devel@nongnu.org>; Fri, 26 Apr 2024 12:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160687; x=1714765487; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LQMRED2mjhykafQx2tnnAWOSRm9bpyuzeSKJlhGVxZw=;
 b=kLCeSw48jzbLw6FmZf9QirNjOA8veHZkAjtOoXIxMqUjLZwWRBMDrmzv7/aQArBYOD
 a4NmYjIrROvBakxedvSY9Lrb9yc+QuYCUidiJxgXFtpcR7G3uxy1ZLltvO/4bpJrvBDM
 r9mpYCLaflT3RRWPZmDXa+ZbCeowHW4q9GTOri1F55Za1ECKUARQJVjKoYK78QnfxcAo
 zVQrbEd6hsfZRR/pAdCx85h75v37vlCvEH5SUyED0N+Blt9J/ckpg9sPi2umpQAzY+jr
 Nzo6uozJUPp8CW7Ok2pa6UK/smTUBoBeped+bQXTlN1ZT5AMY0neV65wLBEOvgwA61XK
 6kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160687; x=1714765487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQMRED2mjhykafQx2tnnAWOSRm9bpyuzeSKJlhGVxZw=;
 b=ufbRJlQvb3Avr52HMOYmxSFDJ76t5SW/PW7cE/LhTu65KKsTxKN/sntSCRzIusKLf8
 8hfuWg9barfA7oNNmFONBQTu5Pcp77DvkjT4/N0POf6ONKXnNYzkaiQBo+1muygVqDg5
 Q0U+A1O1h+hq9ZZC81pVzxNAB7jhV+0RvE+WKM5t+qc66LKbDk4jWeTLIh5+I/NBdrxA
 1eMubDqLSq/QNZFbyy50VFWb6qCYnxqzKM+pH22DuOP8cgKhfFQKLSPtM5a2EybAOah1
 sJ/w/1GZZmkHCCWCUe0iJec94sslIL2qiMYBsytJad6NBdKw1cU7ybMnbqNrDvwCxpmh
 VxRw==
X-Gm-Message-State: AOJu0YzorRkU5n0/DYyYwPaAv6K9dTTHETWq9CJLEX6F8rA2kz2KO5SZ
 I/t2RS5ttDT/WAlQ3/j2HB+paioTbZL4kfW5nuGPYnH/S93uBIoCa250TGra+hF09cyhMQU0eb7
 /A4U=
X-Received: by 2002:a17:906:f748:b0:a55:6602:e3a9 with SMTP id
 jp8-20020a170906f74800b00a556602e3a9mr3903164ejb.1.1714160686795; 
 Fri, 26 Apr 2024 12:44:46 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 qt11-20020a170906eceb00b00a55ab2630c3sm7155905ejb.38.2024.04.26.12.44.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:44:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>
Subject: [PULL 28/38] exec/user: Do not include 'cpu.h' in 'abitypes.h'
Date: Fri, 26 Apr 2024 21:41:48 +0200
Message-ID: <20240426194200.43723-29-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N3uBT2HW/l6L

"exec/user/abitypes.h" requires:

 - "exec/cpu-defs.h"           (TARGET_LONG_BITS)
 - "exec/tswap.h"              (tswap32)

In order to avoid "cpu.h", pick the minimum required headers.

Assert this user-specific header is only included from user
emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231212123401.37493-20-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/user/abitypes.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/exec/user/abitypes.h b/include/exec/user/abitypes.h
index 731f345ff5..3ec1969368 100644
--- a/include/exec/user/abitypes.h
+++ b/include/exec/user/abitypes.h
@@ -1,7 +1,12 @@
 #ifndef EXEC_USER_ABITYPES_H
 #define EXEC_USER_ABITYPES_H
 
-#include "cpu.h"
+#ifndef CONFIG_USER_ONLY
+#error Cannot include this header from system emulation
+#endif
+
+#include "exec/cpu-defs.h"
+#include "exec/tswap.h"
 #include "user/tswap-target.h"
 
 #ifdef TARGET_ABI32
-- 
2.41.0

