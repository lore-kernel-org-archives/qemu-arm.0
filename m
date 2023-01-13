Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp643863ejc;
        Fri, 13 Jan 2023 12:03:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsCykxQ7IiR9KmlaLK9scXHDzYyoiBjWE3K4Se3/NVwWabIkZR+oI+mXOCXxsx5KnaXllpp
X-Received: by 2002:a05:6214:168:b0:4c7:6945:bdef with SMTP id y8-20020a056214016800b004c76945bdefmr15109993qvs.3.1673640206089;
        Fri, 13 Jan 2023 12:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673640205; cv=none;
        d=google.com; s=arc-20160816;
        b=XmKpKVmi+SfuOI0m2C0eCe89H/XSUatW2x5AqvTi9+rDCrYwmfPmh7ARr/tLI+CUsU
         xCQ4GKQgHS61uDVNzYX8MAePserzG/wskiYmkmvHeZ+8N52ybren1vzWA6NNEdhMoG+j
         0/ZBxXTt+vIOs12tdMYZoEMLlP4jl8IXDtbfjqKDQ6R8vcJIBXG/cxLatG0AJ3/wm+M7
         ZoTWHYgfx3992UftzdII8KahlWBbwilMC5mFN/tLmFj2dAgYhO6Rk82z893mdWebpL+r
         GwMJeepTkPOtr5B6ybEpBg82HmGNwvHRItpHK3IYBS0Ajw/Yrdqj4vHXS8rSSW+kHlN9
         /o3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cfx0zFqCbh87Y8xDP2juuUaDdoqJVp8e6EOhMeHV/Uk=;
        b=yJM4ZNKBAw8Qq6Mw2oWvn1mOIbptPqoAQ8PTm82jxwRrdc4shn5BK6+dzR/rdiqB6y
         1UVp0fU76SwgV2F23RskbfpwjjvAKb1CxUi1KTZL4atYbVtC3u7tlp7PmcvGIi5uU1Pd
         0fdPRCgcjALYwXgr+un+nKdZU2x8XlpMCNcOU1ldhKS+q1upbNIUnu45uW9cziMtbRuC
         2uv1wIYuYJkdNUgGGOg0v6hO5Nq1Ch0JqyBd22c4oKjjPibNva/FwCmMH2W3JCQHtyIh
         BJaNpbjxOfq6MgbS3fkdBFAN5JHX9dycSyBK6kS7t7zGM2CAWpy3+wjuvNgk5PwGoZJM
         hfFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yd4VADnG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf5-20020a056214250500b004c7528af8b6si12952450qvb.517.2023.01.13.12.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jan 2023 12:03:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yd4VADnG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pGQFb-0003dg-Ay; Fri, 13 Jan 2023 15:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFW-0003br-D0
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 15:02:03 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFT-0006nc-O4
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 15:02:02 -0500
Received: by mail-wr1-x435.google.com with SMTP id z5so20985282wrt.6
 for <qemu-arm@nongnu.org>; Fri, 13 Jan 2023 12:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cfx0zFqCbh87Y8xDP2juuUaDdoqJVp8e6EOhMeHV/Uk=;
 b=yd4VADnGyYvVFjVhslN7ei4pR2/ws5LjuJs2oC+/TPQwbLiF5yqCT2x52JRaKi90YM
 vzWOlm0PglcWAc/1dFqVVsE/tFZXNvTRdIC9VUdoKdGJdVvRF7UPN3BXgTpBcjkQUKYi
 tFSJNfvsCbUXwyCgKriCu4ECgcVSgJjiOB6hGx5VAmp8tQptqZLHzssIXpf3ZyTSmuFA
 uIcPRyUBULU5vZqBRLckMXZ61riXRDVoHC+BBuBGDzSU07w0OXq8ug/Se6CcxNpUn+CD
 pGdnd/uQuvQ78L5358ClrXKo/lq3pyDDrMKZw3cv/pbQ80KkD3iTlHFZ5AF+Tpu+tdtW
 rwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cfx0zFqCbh87Y8xDP2juuUaDdoqJVp8e6EOhMeHV/Uk=;
 b=udGDAPcpjgt8VjIoOO47KF6i1W6Itl+8Ba5nzgZ39+dRVcthSQx0WNchYX5Jg3aMfK
 5AdnorQRtI4+ezuACkomEQjIAWb9PESdH8LjhUYQMy/qAA4WYfKq+0QFGZ3p1UyQsdc+
 BvO0I7zoXWyZw1jw/tyASOKVwYUvgeXyCzfxMUMlCXj0gI0Y9JX85pCO9hbuP2c98+xr
 SqZgW5yjiB956avnNKjoG1dqmaosN5Y03crFaKecn1ih+4mzwtXzDhfzZlVz1LeZpVxY
 pStCNLfwFHf9RVysuPJq14+rXRHPxKSuoQiALpGVuAA64HEz2ErIgk2cYLsBEH40G0Kg
 cu7g==
X-Gm-Message-State: AFqh2kqpXltLI3jmsrbdqL0fa7l37zomJm3sXZUDn0UF4MbxQ2N6jTkD
 pQj81rs6SSnB1PSY0LoZ+uQ6BA==
X-Received: by 2002:a5d:530f:0:b0:2bb:dd87:3485 with SMTP id
 e15-20020a5d530f000000b002bbdd873485mr15258163wrv.30.1673640118403; 
 Fri, 13 Jan 2023 12:01:58 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d14-20020adffbce000000b002bddd75a83fsm2591341wrs.8.2023.01.13.12.01.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 12:01:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/4] hw/or-irq: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
Date: Fri, 13 Jan 2023 21:01:37 +0100
Message-Id: <20230113200138.52869-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113200138.52869-1-philmd@linaro.org>
References: <20230113200138.52869-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: sGqdf2/3bsnG

Missed during automatic conversion from commit 8063396bf3
("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/or-irq.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
index f2f0a27381..131abc2e0c 100644
--- a/include/hw/or-irq.h
+++ b/include/hw/or-irq.h
@@ -37,8 +37,7 @@
 
 typedef struct OrIRQState qemu_or_irq;
 
-DECLARE_INSTANCE_CHECKER(qemu_or_irq, OR_IRQ,
-                         TYPE_OR_IRQ)
+OBJECT_DECLARE_SIMPLE_TYPE(OrIRQState, OR_IRQ)
 
 struct OrIRQState {
     DeviceState parent_obj;
-- 
2.38.1

