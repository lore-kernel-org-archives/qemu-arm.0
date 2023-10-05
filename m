Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp69879ejc;
        Wed, 4 Oct 2023 21:52:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa1NvYgHhUFb/F1xCIVNhdt6X+ExWRyzIZHZGMo+S+DBT5jpbMm88v8attwf56Syc86f3V
X-Received: by 2002:a05:620a:1aa5:b0:76f:9e:4f0 with SMTP id bl37-20020a05620a1aa500b0076f009e04f0mr4899990qkb.58.1696481535732;
        Wed, 04 Oct 2023 21:52:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696481535; cv=none;
        d=google.com; s=arc-20160816;
        b=rCANmrhlntoyHQ3zVrj6iftHcNVQa0AqmTNeqZeVhuOWRw0UKwBOjmP6V3BQ3ZNUmH
         G3YZO72/cvUXvkoqWM1R77wNOERDkrcNAUjDu5pLAKSlpGZd5fgWDTFLgQrH3n9G2+tJ
         vuLHuxxPE/V4QMMhURUAeLH+LmLfjaMpDv4bpgA+7zVZx2qJC7+aTBIx6JbDlu6f8ISC
         mEQ+RxMIAUouPx9UCgbqGRW/vB2+FP5i2LeOP92T+PFq2cmpfCJ6v0HEmjqb/dHuihkh
         hK10DmfUlG22Bf3O4aqllAGXYpsHDqvZGRVjQyzkzXdDx527nrkmS4VCoItPmGLgg01L
         7jrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GescFgTUfXFoVvcmAz4axPebdRl/aulbPng86nuCdlw=;
        fh=sJoShjc+22fNqMxUL+tIPcryN+fZ3hVRk+hhtgKxgXo=;
        b=Nt2k3tcqS444WqATCYfXC07CGmv087cG7ZvYqByHEljBdeWVObqCMeX75vwFt561+q
         pIXqQXlvBsfO7Tary7K/UZK0zn1/H1lNB5wciO5pWisaKh5lZp4YxPBdy0STkup3bbMw
         3y/WTYuwLSxItKfxoGwsyPUMlAu0q/BrLlw3BvGILaRCpVDK+C8wxg6FHbc3oVWfOunR
         /j3NYE667fW0LwXQqYcFJeZWAOmD+fQz42hVRp7v5+n6AWKoVgHWPRD1JW0ncrlEknIV
         Y5XoCqK1dlS2iwLIF+VXTutzCFHwMP9ZaiGfGWV6X8oMwZuTaNBwnQKM+NMcCT8VqKx2
         xvMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l7uFcOCt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a05620a284400b00774373352b2si409583qkp.761.2023.10.04.21.52.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 21:52:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l7uFcOCt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoGKk-0005lU-Ij; Thu, 05 Oct 2023 00:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKj-0005fo-4H
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:33 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKh-0005ap-IN
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:32 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-405361bb94eso5258295e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 21:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696481490; x=1697086290; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GescFgTUfXFoVvcmAz4axPebdRl/aulbPng86nuCdlw=;
 b=l7uFcOCtRzmUqLB1K42VH6z8E6Say+znLJID+2p7OkEJvXa4J8R3/GWJNxegNkQX1V
 7jb3SpqONoB3PmlaZXF+Fi2dJIpGlPflSXW6BW5uA70APTNDhrMvR7/Tue5s1GHUnvqP
 NIY4OgeDw78G1Tw24/ZYtl5n1+g1XEFzx5o62DyyKI5ZC+9H4kj7WLA6NEKJdxAcbq9G
 6x/Vtf0TSnGHI238+fdGMcAhGAObJTOp0S/SueAGQ80JyROXC9cSBDxksc4vMEcMSAvP
 N8qyMQ3GRezI79dmOM8eYxAW/QO36KHWP7yk917OS2QdKo6v973dxdkKB9LdYOkqOokW
 m7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696481490; x=1697086290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GescFgTUfXFoVvcmAz4axPebdRl/aulbPng86nuCdlw=;
 b=XgqithEhPAarCMTkDNqNT0NYJJUtEAf0LkZV3Vz/wh/fdWEPL3Cp68ReqStEDWGg/z
 4959BzYifZwq2Mj5E+kQhDU7E2DX/FXS2200K7sMw/y4w1Sh3RO+l2ciCyAVyurMy7cy
 SlV9iqahUGyLUklU8X2DZjLohcqlwl1xZXAHws57vnJ1H7U+o9KS2to69HG8nlkRGegk
 MEbTGUjw+8HcctlKXxGjL1OWloAQaRO6FeqSwAPzvhH3FthqHH2rf8KkZyO6R5MIVM3L
 Mz/Z1+ZjGjv18eiRkdZ6+8SRnGoKIH5JjPoonv+qjiewNCHGHtd0LMmDO+mRE6cK9a3l
 K9pA==
X-Gm-Message-State: AOJu0YxU6QFbY5iOqr+nuQJutnyHHIOQwiJwaaS0a/wJnInMb+5hnUYO
 92wXlAf6mbWnpxdcMG8eeMmRmQ==
X-Received: by 2002:a7b:ce8f:0:b0:3fe:2bb1:11ba with SMTP id
 q15-20020a7bce8f000000b003fe2bb111bamr4170385wmj.27.1696481490269; 
 Wed, 04 Oct 2023 21:51:30 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr.
 [176.171.211.120]) by smtp.gmail.com with ESMTPSA id
 w21-20020a05600c015500b0040652e8ca13sm2856084wmm.43.2023.10.04.21.51.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 21:51:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 07/22] qapi: Inline QERR_INVALID_PARAMETER_TYPE definition
 (constant param)
Date: Thu,  5 Oct 2023 06:50:24 +0200
Message-ID: <20231005045041.52649-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005045041.52649-1-philmd@linaro.org>
References: <20231005045041.52649-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: z6tIJIw522NG

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Mechanical transformation using the following
coccinelle semantic patch:

    @match@
    expression errp;
    constant param;
    constant value;
    @@
         error_setg(errp, QERR_INVALID_PARAMETER_TYPE, param, value);

    @script:python strformat depends on match@
    param << match.param;
    value << match.value;
    fixedfmt; // new var
    @@
    fixedfmt = f'"Invalid parameter type for \'{param[1:-1]}\', expected: {value[1:-1]}"'
    coccinelle.fixedfmt = cocci.make_ident(fixedfmt)

    @replace@
    expression match.errp;
    constant match.param;
    constant match.value;
    identifier strformat.fixedfmt;
    @@
    -    error_setg(errp, QERR_INVALID_PARAMETER_TYPE, param, value);
    +    error_setg(errp, fixedfmt);

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 target/arm/arm-qmp-cmds.c        | 3 ++-
 target/s390x/cpu_models_sysemu.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index b53d5efe13..3c99fd8222 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -154,7 +154,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     if (model->props) {
         qdict_in = qobject_to(QDict, model->props);
         if (!qdict_in) {
-            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
+            error_setg(errp,
+                       "Invalid parameter type for 'props', expected: dict");
             return NULL;
         }
     }
diff --git a/target/s390x/cpu_models_sysemu.c b/target/s390x/cpu_models_sysemu.c
index 63981bf36b..4507714493 100644
--- a/target/s390x/cpu_models_sysemu.c
+++ b/target/s390x/cpu_models_sysemu.c
@@ -111,7 +111,8 @@ static void cpu_model_from_info(S390CPUModel *model, const CpuModelInfo *info,
     if (info->props) {
         qdict = qobject_to(QDict, info->props);
         if (!qdict) {
-            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
+            error_setg(errp,
+                       "Invalid parameter type for 'props', expected: dict");
             return;
         }
     }
-- 
2.41.0

