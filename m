Received: by 2002:a17:906:fa85:b0:9b6:5cec:e61e with SMTP id lt5csp12009ejb;
        Tue, 10 Oct 2023 02:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFclNP1kn2lo+O1qJw1X69sJDgMWnGaADkWvsUjyAoDHHNJ5fzAowQRMFzM2UjgboQh1RE4
X-Received: by 2002:a0d:ca4f:0:b0:5a7:bcac:7d3 with SMTP id m76-20020a0dca4f000000b005a7bcac07d3mr1704126ywd.9.1696930184728;
        Tue, 10 Oct 2023 02:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696930184; cv=none;
        d=google.com; s=arc-20160816;
        b=TkI2rWHjANNOr3/YQBmgcPgUENLb1/o1kyTS4f0m2rqiNG0UuB4gRcCsxe/JtB2K7a
         vas8Gn1x6aiRzQESiykUJ8/UwaMHIc6C/+9gppjW5rHz3dcvY+U5YwdP44aSZ1/c9fSC
         +/72xAr6yMS8FI+yJjrllaPztsa0NQga92SWdeW0+5iZHoJ1GxRdgT+oQfmrSst/Z9cB
         qU496hxZZE8iKBx1Li5Bm3sPm7jq1aLo+1OPcF7kb4WiG/TDxUBJpX1LdqzJEeuAEYfo
         sVTNl69SMugU1lsXTNGuTP96AB2fdMl6BobzJQ2Lew/SCrWMrJLwpUFO0SFdCTcJe/Kn
         3Fsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VuKnrD3Kd1ngKxKit5HCcUa6RKlSi5wd8BzeyDj6qrg=;
        fh=iupQBrmerAoZOw8v6swRnyYBx+6KhbF7AbBF1Jawaz4=;
        b=ZjPFHNRRq4jA7LH2DM89er9sfCh65YYr9A7TDxeqEYjBifDBrDsKqIxs4SnfAYguGH
         60biKfgSxZGAMeRvmCtoyQ0I7aoPjH46L/fm/KFZgI0tn64sICtUJKtkDwrY5JmQvxoj
         JQ51DaVP1GbNKX93xEKtvuPezmlwu+I7ljgZxbzuKQtjPhVbRMNC3D/4f8wyb822EUew
         dNu36dJVTIvsRbYGxyU/imoQrtF3KPKHyu5dgA7gb9mTKsZhKP9f2OqkEVSodlD62lIf
         KrKXGyMIdQ14HnU25Z9mASeuvTvJpKR8xjFIZDUqmBiQpjSvgFfmZ0wrqa+e2a4+82Xq
         1PmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ge3zkIoo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5-20020a0ccb85000000b006582469f16csi7318183qvk.505.2023.10.10.02.29.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 02:29:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ge3zkIoo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq93I-0007zK-5r; Tue, 10 Oct 2023 05:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq93F-0007ue-Ef
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:29:17 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq93D-0007e8-SC
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:29:17 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53829312d12so14022502a12.0
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930154; x=1697534954; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VuKnrD3Kd1ngKxKit5HCcUa6RKlSi5wd8BzeyDj6qrg=;
 b=Ge3zkIoov5HsrKsvDmKFeGQv7qrJPvVY6qrt1VO2F/8RZrNO2RHWoyKrVuwczAugzp
 QXCdtMTe4TJZz2kMxI7hyMZoeBlW2OwDWj/QzDOfvzyTh6rrv23U+7Hg/wLKJogsX7iz
 u/6fLsCfGh320q9GFneEKq0bRixDtHduII6MpYwRPoXOq9lGT3Nwtewen2CLBrBkg6ul
 0vetT1oOJDTAO6fHhF5REX8SMYerMeC7nt+nKm+vLOXrAwsE5b2Rkr0itvYaEHNVkBCJ
 u54E2Ep7Bz/kD1RUpR92cwiAGzi/gM1PoML7zRUb9aF/m5GXCiBlrGfnHdc9Sg7VenLh
 W+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930154; x=1697534954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VuKnrD3Kd1ngKxKit5HCcUa6RKlSi5wd8BzeyDj6qrg=;
 b=s1kh0+iU2Ez/gCeF4edN1ihpF0ogiHWKZNcDbVRUr9+s3foXsrkFDaRsUcfLgPkiAe
 4Ab/dTBrVizQRTFq/IJ83rqeFB6lnqJgnb6xDpGp40iEfx8yqkFEHmCsVwhcP9AHoRgQ
 kjo/fBeuXlqsAh1UYm1TsJrQjBuYhQfSLZLi37oyQJo32Avm6d/zaixy5v7UpwQ7DT92
 pSvUzRdbbtVd1kxI8r574YXcdrl5D38Kt4pJjno/16A4uz1BMnU+C3uJXMbCkFabUHoj
 7l62onXTmOISI4Dx6cVTA6NcMbp197H8aUd9G83lv6ZfR5sYj1DzIM4UrRdBJcgi0Srb
 aiew==
X-Gm-Message-State: AOJu0YzVmOeTQcNnQfKBu9XjmihlLP1JXLtluuagX2xgeqzpNWgu6gZ1
 I0i3jLq65cdKkVoCUyR+ZaQF1A==
X-Received: by 2002:a17:907:318d:b0:9a5:c38d:6b75 with SMTP id
 xe13-20020a170907318d00b009a5c38d6b75mr12798705ejb.15.1696930154598; 
 Tue, 10 Oct 2023 02:29:14 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170906694c00b009b8a4f9f20esm8131582ejs.102.2023.10.10.02.29.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:29:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
Subject: [PATCH 01/18] target: Mention 'cpu-qom.h' is target agnostic
Date: Tue, 10 Oct 2023 11:28:43 +0200
Message-ID: <20231010092901.99189-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: du7F4+rE+6F3

"target/foo/cpu-qom.h" is supposed to be target agnostic
(include-able by any target). Add such mention in the
header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu-qom.h        | 2 +-
 target/hppa/cpu-qom.h       | 2 +-
 target/microblaze/cpu-qom.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 514c22ced9..064317a245 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM CPU
+ * QEMU ARM CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
index b96e0318c7..a89a4f3a0a 100644
--- a/target/hppa/cpu-qom.h
+++ b/target/hppa/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU HPPA CPU
+ * QEMU HPPA CPU QOM header (target agnostic)
  *
  * Copyright (c) 2016 Richard Henderson <rth@twiddle.net>
  *
diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index cda9220fa9..0e3ebaddb1 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU MicroBlaze CPU
+ * QEMU MicroBlaze CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
-- 
2.41.0

