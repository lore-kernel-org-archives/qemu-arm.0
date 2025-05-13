Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp688472njb;
        Tue, 13 May 2025 10:48:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJEgLBj9sMNiQ4M5sA2Wvdxy5pc6xUPHooHNosEhg6aXyj7Fa/tbB0Od/WYv6dQNL6QmcvMcVPP9o3Gw==@linaro.org
X-Google-Smtp-Source: AGHT+IHCAaPx4Mi8EhcbSaRcNb5+G/GWiIgEtdG+UDkdkazf6roYNKizSurEzA5G6TF/jN/qVZcD
X-Received: by 2002:a05:622a:40b:b0:48d:8053:d8ed with SMTP id d75a77b69052e-4948732f035mr67544721cf.10.1747158512108;
        Tue, 13 May 2025 10:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158512; cv=none;
        d=google.com; s=arc-20240605;
        b=BYFK6+0TgRNQ1Y4O5k9ZrWtY7UGrIYYGWH8yQNCjjWpf2aiS/WWirmgEUEhANMyBGS
         dUsjm9Xo57CMstF9pOThNxj6HKmTeINoHIf6wIZW0ajRJ4ZfRt/riHeUQMDiAPICX1eP
         1ptGZhmFZAjez1PNPJVjfISm6+RT8iUPVW5zqIpPaP29+Eiss8EsQuXkFY8SZX9XRLro
         YkyCcuTIqNi0CmC6ork+z9GtPKBQMrRP5/eVVtz5CKuQCBBFKTq6QmysViS6E8OaTbq1
         ETzEYSNYUDJk4YRdoFcz79NnGLjvtlpc73Vy2MY8O8r4GNgeXIISOgIgZ23BJmxIhNzh
         kp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j/lGVjd8P+mmHimB41hBIfndruizKSfZ7N3NnHpeffY=;
        fh=NK+Jj15tbBC6F+CUBJi0oo3RYFSnUsMFdZmAHsYNDFQ=;
        b=JyBI74wuHHRRZ98CZuWQGRqyevrNBGsov1S+5aj/OJ0rhLm6QQ/Th9x6QOvj6Ian+u
         Eqt7rJ/NS83SXHYUcdROOBbYi0zzzZvTIHy7KJ/3zbdTmGMhYoJlGFmjaD6waxmeO6Mm
         epOhsRjYycQ59C8LN2gZ0EqHMOlV8Xfkwu07yxP/GeJSyo9sDcLA1B7Mzeq7GpA9xEBb
         MTu5+T2eVUDztCeenxrhrjl1QKY7lu5DttJE/OZXzGJYtWdoUtA9ZGQLh1xKcn3rAHLj
         G04i0gLtK3NW+v+p96tmeoqHJA7C5MOVJRuro7MbrRMu+gQ3kaGrQewn/KajW7fis2R6
         /psQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=njWLMuxO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494525b364esi109649911cf.670.2025.05.13.10.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=njWLMuxO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEtjp-0008J8-Bw; Tue, 13 May 2025 13:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbs-0000B2-UA
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:09 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbr-0003MD-1J
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a064a3e143so3431847f8f.3
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158005; x=1747762805; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/lGVjd8P+mmHimB41hBIfndruizKSfZ7N3NnHpeffY=;
 b=njWLMuxO+4sD9GurbFKevQDfEvqow/KgyTXQdILXrVE8P2mLN7E+57M6cGQGUVPT6K
 ddRSxijVudA/l4jXCfO+Uz7173r5h1Z+kWEAgEV53JLd93bTfUwCpnkwSM4U9Z0Fkm4n
 3ePAVI7gSILFr3qLJybp/1sNbwJRijWatJgNEn7LQWAROukNr4x2tlfZnLAgchQPMyMR
 3teQwyxRg7nkIfKIRsV+iVKQTsFnDNJyOh24FHh2i2T1tGD51XyeAxHWu56kc5KvwtsK
 7+3v4LU2fUjzJeX3Fi9vOK5XTE0aZ7550kqAY/6RCZNdLgD6okEG4UhAfXK9LAqZWoth
 HWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158005; x=1747762805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j/lGVjd8P+mmHimB41hBIfndruizKSfZ7N3NnHpeffY=;
 b=W8ciAfkZJktj8uQOiu49fUqcd8yBRqDTkGF2sy+fvBk4khfeLfcclN0Bu9d9UTlHF1
 L9kJkl67WH+gN82E5HLyNwG2hDNsdDKDg8YpKYHBLeLWO9PG3w5Oy/9k9vN+XerV29Vc
 BUOmEPRparRANQF/7ywuiGOOfFCvtw/nC9WR9NOv9Snq7+EOA6XYp3vP8JWunWSVBRUT
 HHuo56Uio3IBL3n38JLxjX2DlUtVjNLDFCj2/pxfNiKyfaYXjJiwpLD2cYfFiNRyOAKA
 stLvlMshnst6CRSleEBN2zhgPobApgsqBEyppEmhQZ/nbODWq6mee2mVXi6YMqvWOC61
 TbYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW37zXIzY7nd1d+hJHmHcUjmdPRgQpBwS0hpjn1a5QEny73KoiSIGGv7wPYlDtZZTU8RTdUJPEUAg==@nongnu.org
X-Gm-Message-State: AOJu0YyENULzQ4BkFC+7MmrVzDbG59Y2sduzl+VV3y6/GXo4GZWYMZA6
 RH2KkSdWldqdgxhwQbpEo0LrHBJ45bDjF4EPyBTmkEui+tocXomPU2HIRjsXRmA=
X-Gm-Gg: ASbGncu0tdN17oev03bc75PEp66qMkTjwZDKbui/SPgI1GqDA7+IPX7EVIV2VtlLR3H
 kaHB76WsCj47ViL1bEa3Up1ZifQM/utJu2sEUfgfHqo3kKmgQDD2AInzdY6FCkjtdF9NZtQCCPB
 8ndDC8qLENA2v39933QVm9c/GNC2ya9hbMCMFB1zyQc58CW/rBWrl3eRuWnALDnwy1SB+weB0Q9
 w7efUS+fUfIIbCmHaWK0er+XkraxVpHNx2xyUIQkhAL2eflkvzrYZnpIdkVx8DPNom2NUlJlYZ+
 w+7LXZ1DcnU6828xLsIb2sO59MOKMqDq6cHuajSt9SVkyucuViM/7fpRvb2PGXdmdn4RXUx0tM+
 p8c54N8ySjVkIxdv4XblZ6sWsSSWj
X-Received: by 2002:a5d:59ae:0:b0:3a0:8495:cb75 with SMTP id
 ffacd0b85a97d-3a3496997d7mr196089f8f.9.1747158005233; 
 Tue, 13 May 2025 10:40:05 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f57ee95asm17105644f8f.11.2025.05.13.10.40.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:40:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/19] target/arm/qmp: Include missing 'cpu.h' header
Date: Tue, 13 May 2025 18:39:16 +0100
Message-ID: <20250513173928.77376-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: N5qCYpDdUyZq

arm-qmp-cmds.c uses ARM_MAX_VQ, which is defined in "cpu.h".
Include the latter to avoid when refactoring unrelated headers:

  target/arm/arm-qmp-cmds.c:83:19: error: use of undeclared identifier 'ARM_MAX_VQ'
     83 | QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
        |                   ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/arm-qmp-cmds.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index a1a944adb43..930ec37413d 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -30,6 +30,7 @@
 #include "qapi/qapi-commands-misc-target.h"
 #include "qobject/qdict.h"
 #include "qom/qom-qobject.h"
+#include "cpu.h"
 
 static GICCapability *gic_cap_new(int version)
 {
-- 
2.47.1

