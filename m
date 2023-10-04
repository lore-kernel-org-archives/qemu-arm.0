Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2817521ejb;
        Wed, 4 Oct 2023 10:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY3HUpnL9f3ELmrTk6Jbxq9nT/CoiO9NSGWOEqpTExOFXTvaGl0q4YRLS5ENVS1bim5vSp
X-Received: by 2002:a05:622a:285:b0:403:b23f:9e16 with SMTP id z5-20020a05622a028500b00403b23f9e16mr375012qtw.2.1696440805567;
        Wed, 04 Oct 2023 10:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696440805; cv=none;
        d=google.com; s=arc-20160816;
        b=PIbl+2HJxM01zm4J1OBAEj0h17wiAAXNzXPllkKTyKfkozgddVR25uh71PyOe6gVfY
         fQiA3MvOdyowWZnXy8/NdU21oBPb0PaWXa2a/h1VedpFcWFFVN8i6OGYjSCMa1m8w0S0
         Vvw3vS3wOKOTlSnjVIUtKf1CZrf9Kq4NrynimNB5341vouy3K+7ljc7vLnh/MBk5cTNF
         ldA+dmWRA0NkbKvgJbhyYKdmgbycsaaX6333BBUR3jgC6R7W7eoEj9efwPMzYj1aKX52
         SIHmcmgBKRRGCW7F1Dhf7NcC01CTi7wTtB8C/PbAoHjLIimvljpw5dvLrMu8mIJ8lw86
         9WQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MGJIXDRJu9nRlkvT0HuUW6wiDMZ2EXW42Fkcow2Wmmc=;
        fh=UPlpOzpKkZ1dSPpfBHy+BnAbBs36b3IndytgbAru6fk=;
        b=fMNTOgx00nwy8cAw9kbQyerMW3Gdj5TuNm4S2Ych261urYZSVgPbX+wZiJtcVwykCs
         bplQavssrNkNrYVxTQgudYhrRkAC0fDnXEuMZ4tbow+mAqFSyCNjUcXT0sDElEGCzu8T
         qsXb53mWK+MgVGnrOfu5dQf7uDekkcrjA56sFNg8Nz1/82QqrxDbJn/4o2D3dBTZw1uf
         R/8EoiFK6jwMsFjSlWXK2X2Jl4WfwrHoQty5yt+ikXJDptb2CTW+XbzVH58brDcSFKVj
         Qe9uJuMgGAZizfIT5+x1Rk3rZBFyOeF10E1bkRrKq3dzOHAj9B56xbNgEtu8UBqO2j6c
         PEdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dAtVN/H7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21-20020ac859d5000000b00403c3fb27d8si1670789qtf.678.2023.10.04.10.33.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 10:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dAtVN/H7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo5k2-0003aV-Ae; Wed, 04 Oct 2023 13:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5k0-0003ZV-FD
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:32:56 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jw-00012M-2Q
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:32:56 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4056ce55e7eso375725e9.2
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 10:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696440769; x=1697045569; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGJIXDRJu9nRlkvT0HuUW6wiDMZ2EXW42Fkcow2Wmmc=;
 b=dAtVN/H72dd5veYTUlbJ78N8jmDPHy/V65XrqcC9foxksc1IWZHI+MuW3vZonXwRJ9
 U6zkUMdHm9ZH6/sLzvhVjs4rSLhnMf4LXNE1WPL+Hq/iaqySJ4J12o2Rsi1bwTXrVF9E
 R+oOk+vrhhVUvboaymYaOFYpuF4AaukL5lE+G9Mj7BUrBQYxZ8In7cflTmhuzfbZBWGp
 3FlimrnvVmMcAV7OI9AnJ6/oc24lGHTOxphfM3lPl1D3CK8A2i0MqW1lPXS0ySIZ3vU+
 6+6sFqYSrHxZkS5KRSFNvSTp6SXobHqXIO+xzg8RAgj/+y6zPS0LkakIepVQjY20/CdD
 /86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696440769; x=1697045569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGJIXDRJu9nRlkvT0HuUW6wiDMZ2EXW42Fkcow2Wmmc=;
 b=tkYKWhqsmHGsWFtA8jvyaAZy34DksK4dTk/VSAqabXzdIJrScLSsmrSvmPe4wH5N88
 A/sSeuIgoqXRLtZ4W9jIOHqxwk2VYnmEJ7kYm2SSkif8sM4vunZM+AfyqMgXpjeEhTiI
 Z0yXJbcbfU9NSqB0zte4zSs/slleJAP/vZHmG+IZ1wruDzOfWlLgxHx4U+h52Xyq2lpR
 FiemxrHxvjAJ75zv0wXGz8osSeGdqdAA4lnX0kRl1A03aT8lF8g2T/2QtrdcqML10tL2
 Kp98M2FDlL7WJxn83hNpxfQ7ElBd0vYmDGbMKAw3phi0nOg4plmc8omMUbc0MbWDvY5M
 H4eg==
X-Gm-Message-State: AOJu0YzcTiMrjTdcSpgHEbnzMX1km3KNsJPrRqJZJ3RhfixJomoiEY0F
 b1n0vySUQSViemQcTQHO7ZeLzQ==
X-Received: by 2002:a1c:4c13:0:b0:406:7d74:a29b with SMTP id
 z19-20020a1c4c13000000b004067d74a29bmr2907167wmf.13.1696440769157; 
 Wed, 04 Oct 2023 10:32:49 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 w21-20020a05600c015500b0040652e8ca13sm2011782wmm.43.2023.10.04.10.32.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 10:32:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 07/21] qapi: Inline QERR_INVALID_PARAMETER_TYPE definition
 (constant param)
Date: Wed,  4 Oct 2023 19:31:42 +0200
Message-ID: <20231004173158.42591-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004173158.42591-1-philmd@linaro.org>
References: <20231004173158.42591-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: DfC68QR6s4GU

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

