Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2200734lfp;
        Fri, 14 Feb 2020 09:53:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyWnX65VLSW5Tk86sfD+T0dQitxUCozoMdn1lHJZ0D5Zv71xH8sFlsBJVqkBX6qJrBZFgdw
X-Received: by 2002:ae9:f016:: with SMTP id l22mr3708998qkg.101.1581702801317;
        Fri, 14 Feb 2020 09:53:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581702801; cv=none;
        d=google.com; s=arc-20160816;
        b=nU6rFDdZMoY2L2pqMQCNZWv94EWPiuCrQ8Y3mhTb5s0sIwUN7pqz6+tsGlK/nV79XS
         7MKQ7qFrgHFu+K6ATykvJ8yyBLrU+bFIqP362M6E/3BkiG1hriHrOk9MmCYOAs2nc8Pp
         IDxRb/9hCmk0KQgXtMSTXfzRQvl0unYe8YWE0N4PkdR4agT4XfHpW+oUGMetnXjXGD9H
         Oqx0t5fOPoF8Jqd4vnH/gFImQyRL9WBYJgVHjkLAqDYhpN/5oLJIX1jubhaC8xFdJsrD
         6Z+uMf/eZ8hcpJPir/P+j9WFeDlIcTRDahKpuwuCrS0somR9cdexhzlDOzCFf9cLxaaJ
         q/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Rq8pejBQpyfpBvg4MHykyjE8mwu9sHhOGcsrOcoZVak=;
        b=moVbbjElUBZ+u7OEFn7qMYwg2AzTpZJhlpXqHwzhmizn3Pbv0hLKR3LNSpaX4zrr5S
         Z5jPNm5xBizJ9yJoQ69inIT69rs+uUWenM2DfWxQsf7ZIVh2U/LWcxrV64l3kN8CqNx3
         J6xBYBl+ofKdowUyEd5YZcXswoxorMttWjlrYefdFvNZOiHvApfqOnYIq7Y3ic7mL+RC
         zMIx0WSvBsr+aUmSAi3nzzn+NVpvP2nS8ZqJON51kiIaLAiROHRc5V310nST0Ryw77xA
         zegImgrGvTKZCxPvHjmkowZxEgmjumBfDIkQTky7f22JfbmkS2vs1P/wQ58BOhd9nvap
         ERZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RrmcKadG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y123si3246099qkb.325.2020.02.14.09.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 09:53:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RrmcKadG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2f9U-0001I9-N0
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 12:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7e-0005lt-DC
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7d-0000g5-AH
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:26 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39458)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7d-0000eX-4u
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:25 -0500
Received: by mail-wm1-x342.google.com with SMTP id c84so11572167wme.4
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rq8pejBQpyfpBvg4MHykyjE8mwu9sHhOGcsrOcoZVak=;
 b=RrmcKadGWzlb3rsABzU8q5x+n3s+OuOkKhA9Msf3q/bLe24/66mDf8gJJS4szkY6rI
 kcmHf0LEuKfSRINe2qidCVI7ShBK1cPGbybRHIrnf9Gu5lHbaDS3h7qXf4fpNahUebBM
 O+c/EdqgyMquekt3WSf5P7VD3ZgDVoiSFRiD2ftXdqIvxeuPKy+vBt6z0112g7MwJnv9
 UqJxIwyEobtqeLQhZLQgze1QGr91YwNzFwl2lT+Gs3ikWftuqzZz6qmvIU4ttYHoyUJe
 SaHhbKRlgVP6hLu7KNPSRcPV2HUjHykNNZ8MKcPpCXOf5sMpTK3QA/w6R8zhyghRlppq
 Avsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rq8pejBQpyfpBvg4MHykyjE8mwu9sHhOGcsrOcoZVak=;
 b=o29mFOSacaVMaVpkE00kLLEkXyhvJ+8UPRa+yq0oBDxNRq0j60TARZ3R4Z5lRjQdbJ
 eGPPf4xIpyE4JoMSFWL+m9RzdC6njeEnl3QIYQ7xN/zs5YzCMJY1OifjmY6rPLxHUE9B
 9CEPxHNGEQHCRogElTFSiGY4kvdlZWvwbVhcvPxPGSkPuCWmAfYN67teWr6oa2xJ5yaX
 CjqEcodSgSnF+HVE/36wbAATp7B20MeObRou3G/FWFi7Oi+JMvyDIGsngcu+HcVB6JkZ
 0jxUfvsjhZXW/GlipI9ZGYE/stGH7qgltuHA5o5RNYe5JBg6uash3uDmUULVeZYdnPse
 AOJw==
X-Gm-Message-State: APjAAAWdBmJA+swT6Knba3nLCuxQWQnGMJxhKH+R9iUF6uovAoZgLbgZ
 R3EcJnRXkTRLP6NjSl5lPUmdht1javU=
X-Received: by 2002:a1c:9e13:: with SMTP id h19mr5955605wme.21.1581702681729; 
 Fri, 14 Feb 2020 09:51:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/21] target/arm: Check aa32_pan in
 take_aarch32_exception(), not aa64_pan
Date: Fri, 14 Feb 2020 17:50:57 +0000
Message-Id: <20200214175116.9164-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cR3feIJPBnyk

In take_aarch32_exception(), we know we are dealing with a CPU that
has AArch32, so the right isar_feature test is aa32_pan, not aa64_pan.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index eec3876610c..d4ed52981fa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8858,7 +8858,7 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
         env->elr_el[2] = env->regs[15];
     } else {
         /* CPSR.PAN is normally preserved preserved unless...  */
-        if (cpu_isar_feature(aa64_pan, env_archcpu(env))) {
+        if (cpu_isar_feature(aa32_pan, env_archcpu(env))) {
             switch (new_el) {
             case 3:
                 if (!arm_is_secure_below_el3(env)) {
-- 
2.20.1

