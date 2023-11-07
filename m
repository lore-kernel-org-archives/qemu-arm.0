Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp274840ejv;
        Tue, 7 Nov 2023 04:29:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYC+QLnMm8wqDfC1aO0dcXiI8STuF1DNM082J6SylHVS5abDq1KzQCeIhna/XmQ8FKBFun
X-Received: by 2002:a05:622a:90a:b0:41e:2c87:e84 with SMTP id bx10-20020a05622a090a00b0041e2c870e84mr29665500qtb.30.1699360145763;
        Tue, 07 Nov 2023 04:29:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699360145; cv=none;
        d=google.com; s=arc-20160816;
        b=LbVpw3MCOOvb5p18xvarFf+V58MND04c7qcRtO5scjAlLv+azItTQOyAc1rn3qEtjb
         yq9cNGA9mdvDVjV18v2iKFJV5aEBOwPoSusTgDsyozdKYXfsuOt5wHntJNwU4Y1+P8rL
         onyd45ww0nSy8G/gmmn1GM9gJSLY6q/c2TB2FKh03I/1qMxjPrGKYkQJYbt+gymDfxIP
         kqkXoFGlwf+Mg6srcYblq3n99wy5Elm7B9ZWGDTNb2QgvfHI6WhcFMMYSjFM62aqQk06
         sXIl4TBy/pJ6L3rmMPZ8Qp1DZ3WpAdDe9kumTt42lVKQuLnEQdwMOFzj0YSYMVLU48RG
         RAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=G5jwu7f17a+yqtzy4C256uds7gVdP2jJyZeTSPjjH48=;
        fh=66UNbUoIwQFpj+xJ72csPrpPDRhjYRBQvwtxL44rsDU=;
        b=Q43MbwsBIhHxk8w8HAEtLctN56+P0F95NNPDCvlyCIHdvyAkkNr5YJm+5UFsLyNO6b
         nHVBVKWbqmkfu+9FVOmGNHuHCGMfF8ZSdQKR8Pkme28VxRj28StCZeqKlZ3OqokQAbI6
         GqGa5wHgj38UFc4RNe64VpZqQzW4KQyXJGB05uRuEQT4bK7YDBnJuBeIMw4k7URSn/o9
         TkbrCHgVT9W8ayj/ivTfBXNCFL1z3UflRDakfDVxizjoUgEcwO3WUy5aPgb/l6lyMg5g
         Ml2Ko7Lq7Vufv1QWfUB/yecF3sCVEI8KYwujwyHqojkDYcXwmk9sgFwtOOKgz2LMrSFI
         hlZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mzdkjLFA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10-20020a05622a034a00b004181f199478si6546779qtw.721.2023.11.07.04.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 04:29:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mzdkjLFA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0LB4-0001eD-15; Tue, 07 Nov 2023 07:27:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0LA9-0007UN-To
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:26:35 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9v-0005K9-Q1
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:26:33 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9c2a0725825so834527866b.2
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 04:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359978; x=1699964778; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5jwu7f17a+yqtzy4C256uds7gVdP2jJyZeTSPjjH48=;
 b=mzdkjLFAtNlSHmxJWhBWOxnfd+bp2pQOClHzjs0mj/rdTVg4Ea7/LfIobDvBYYJCo9
 C9E4JaDH974mCL4duZb8BXCRyfnbUrQuNo8Z/+cVy5PfyT3zpIRCFuuZl2sVjLSEg+rF
 4/qzHmZe89N20Is8dyfZpgT4AH8b93WohCCkxXB4quzCzdWVbGPZBLPQiVMydEy2Gbn+
 t2ATShzJh8L4D6te8R0mrzkwUWLtTvuLOcrzRf1u7h7DpRPWcxnNL5Q7yAbsUSytGZ89
 v7xSmg8H4aYlip5PleiGnthU1lE24rbtl1mO9hJBuFdElnMp7h3xKzFEwa8B+EsOxZTB
 gF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359978; x=1699964778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G5jwu7f17a+yqtzy4C256uds7gVdP2jJyZeTSPjjH48=;
 b=jGMV38gHiIGM92cBHmlCWWF1TXpHXj56/3n54WGGkgsB6eLEA6k9TIBtUdeIUa581B
 /liBEsZjsRGPvSVvc9LCsoOWS8S8Nmos7eWA3rsRPO1oGIX2K1ei4V22C1tO3yQjTDNW
 SCRJihKpBJkkK18qn7IUSuDrB4Tc2WbXsNy2gwabpSqI7W8LCTJpV3xzebn+lJZzHPxJ
 vV2dqBltUoKa6pCm37xjjf9a8BSoBTz+hbVR2jilloE2OAyvNEdeSImh45uNceU7zFEb
 AeZuAgQYLAGep0/Lrj5LV0heIIEp/vz2k1FtOVOxvONCZsvSHGx18uSFf5Uou49a1njl
 62kw==
X-Gm-Message-State: AOJu0YxFO7PvkLeFlUnhe5PaaRw325pZvSCfO9PU92nJtr285hjEmhWt
 o6X0hf5tUkipMnkhkiCWAut3Ow==
X-Received: by 2002:a17:907:724e:b0:9be:5ab2:73c0 with SMTP id
 ds14-20020a170907724e00b009be5ab273c0mr16879801ejc.8.1699359977901; 
 Tue, 07 Nov 2023 04:26:17 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 md5-20020a170906ae8500b009ad7fc17b2asm989795ejb.224.2023.11.07.04.26.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:26:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 73/75] MAINTAINERS: Add more guest-agent related files to the
 corresponding section
Date: Tue,  7 Nov 2023 13:24:40 +0100
Message-ID: <20231107122442.58674-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: OeTh1mRvPHmt

From: Thomas Huth <thuth@redhat.com>

contrib/systemd/qemu-guest-agent.service, tests/data/test-qga-config
and tests/data/test-qga-os-release belong to the guest agent, so make
sure that these files are covered here, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Message-ID: <20231107101811.14189-1-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a9354e695..bc69253a25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3145,10 +3145,11 @@ M: Michael Roth <michael.roth@amd.com>
 M: Konstantin Kostiuk <kkostiuk@redhat.com>
 S: Maintained
 F: qga/
+F: contrib/systemd/qemu-guest-agent.service
 F: docs/interop/qemu-ga.rst
 F: docs/interop/qemu-ga-ref.rst
 F: scripts/qemu-guest-agent/
-F: tests/unit/test-qga.c
+F: tests/*/test-qga*
 T: git https://github.com/mdroth/qemu.git qga
 
 QEMU Guest Agent Win32
-- 
2.41.0

