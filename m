Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1530944ejc;
        Fri, 13 Oct 2023 07:03:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN4jIv3sk4w3dGlphMHcqfX/NSW3S5bQ68IwrGZs5D7xHjees0SH38D1bmaQmIjj8YusxD
X-Received: by 2002:a05:6870:6127:b0:1e9:cddf:f825 with SMTP id s39-20020a056870612700b001e9cddff825mr3663776oae.15.1697205804121;
        Fri, 13 Oct 2023 07:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697205804; cv=none;
        d=google.com; s=arc-20160816;
        b=du3jGGQDYgMxJvCZifiTYzT4CA2E3F7ZrFZ1s7BBLiY6sSxi5exr8N9076PoEg3Jc5
         fZIzxbw8xEGSoLfpfvvD5PNzKSTMM0aiyOWapneEO2eCYLd9fV2WYBdzR45FHDXN9tY3
         E2zXXfLbPN5Tap2F4ozL48gtuTaHRTi0AJxGGAyS+bEx/mp+iqfq1oGL/KyUUtvRSqzq
         gZ7rkmbivIpdqb2I/nLTllz+ZiIYWZitttZXhS9HsRw0chFb5iOpxSXsc8d6bPBcj0fd
         CRicqGw6TApz8tIdfEj41P1lyJrNCoeXybp2+xOmfEDhD2EIweXiv9IA1UCqxc7tqNXi
         Df0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zoUpF/tcrnIyHCTbzMglqeDjmRuZtQK69UeLuQY2xSo=;
        fh=yvC9ZPM7MgJn7Xb0eJwxiCf2t+VfzDAYAfYYKFMFkpQ=;
        b=kT8B1NZ5++q+bwVJtVEpAHaAok7QXkjErQB+Zjsx5h8hJnoXkyK4aAM+6YwL2hBNjZ
         WtjcdhENqGEHEXhQHV0aF0f/ThWGl8r01MI/38egh70BTDV1STQC8cOVVbg0S0TzpqfB
         NkadtIq/kD0pHlxe2MATBQuYQLtXSOEs8nUCBX5tpcndy1XWVwmtFPuV6ZiQN6RSkunW
         yNYkgyF4cPz7m5jVJCdJLE2CFdG2mpXwV+q5KPgNjf4vvEFtUyA4RKDFXTd3jzuhtfh2
         k5wcDN23foQaxmXffHErc08DWutZ1OtZTwil9BIq4uZrGiyNWhVRtocvDQ7hiVe99vXz
         Oxfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaq4QFii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13-20020a056102036d00b0044d5f78b144si144467vsa.515.2023.10.13.07.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 07:03:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaq4QFii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrIkv-0008AJ-El; Fri, 13 Oct 2023 10:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIjx-0006p4-4o
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:02:09 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIju-0002FA-NS
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:02:08 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53db3811d8fso4352019a12.1
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205721; x=1697810521; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zoUpF/tcrnIyHCTbzMglqeDjmRuZtQK69UeLuQY2xSo=;
 b=iaq4QFiiM79y1DPjBcq/zrbamQ56JbE8OMVsuSMfvxbA1cGszCHXZ3bF1NXaw0j2f+
 ERZR7c3uTHAn3nHUMcMta+EWrfCFoesW9+vhNxc5FumKgYbBUwaAENrnshxQJ6dZJhUM
 CRq1Cmp5SaDZaq7Y3pw7k31XHxSv6lPCtmVU90upivFAeL27fpLA9bP/xk7lOx78k8qw
 PXyQahDvvj9d8lX5dWtbbSzqxdFNTTAVqZW7G+hy/A2JCKEfeXJDIDpYdS2v8nMWTxQv
 Yn0KWnZfTHkHZsYpWS0oMRGtguQ3ftSwtl5gToUVdmIC+rLRz2RFLUXOP8b5HH9yKUwX
 BG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205721; x=1697810521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zoUpF/tcrnIyHCTbzMglqeDjmRuZtQK69UeLuQY2xSo=;
 b=AyTQb4bphDUU+LEl1yiqu5OAqVYNjtOvBKD6Q0yTAhPQie7WPOKOmFqAF4z4qLTBZD
 GbyU0sCS4+nmFPHT3a0FZMgIfHC1lDavKlQtDbRYQuf2CQz7OM7KQ5sJojMHw05Xcm/P
 VYJnbbBzS6kQB7cdf7odhMuO41Au/n+zQrJYLnlVrYb203I5B6qVNVlf4JKZz9lAc+7O
 lb1jjOgIlc1GBvBz4monKj7TYpZ5eWikEFuSrS69V/nbCHE2YmcPkmQPM0Lil/HZFoID
 O2OZH3fKOQ8RDhuwZ5RBA66C+Zx9RMEZOsOJoW4Mwe7Bdz5LZa0WrZ/XBKFKD0p/Qrf7
 kGWQ==
X-Gm-Message-State: AOJu0YwOFVyeIyFbx1UbxKX1jOscF/c4tFg5O3xB+ilBoJ1lv9OvyIMS
 Ts1I/TSQi3QNOqMpU4LIXT0nrQ==
X-Received: by 2002:a05:6402:5c4:b0:531:14c4:ae30 with SMTP id
 n4-20020a05640205c400b0053114c4ae30mr193149edx.0.1697205721359; 
 Fri, 13 Oct 2023 07:02:01 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a056402125000b00536159c6c45sm11321292edw.15.2023.10.13.07.01.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:02:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 04/16] target/ppc: Remove CPU_RESOLVING_TYPE from
 'cpu-qom.h'
Date: Fri, 13 Oct 2023 16:01:03 +0200
Message-ID: <20231013140116.255-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: E0qfIpEVxaXk

CPU_RESOLVING_TYPE is a per-target definition, and is
irrelevant for other targets. Move it to "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu-qom.h | 3 +--
 target/ppc/cpu.h     | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 6d39ad451c..a8e0dcf2de 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU PowerPC CPU
+ * QEMU PowerPC CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -32,7 +32,6 @@ OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
 #define POWERPC_CPU_TYPE_SUFFIX "-" TYPE_POWERPC_CPU
 #define POWERPC_CPU_TYPE_NAME(model) model POWERPC_CPU_TYPE_SUFFIX
-#define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU
 
 #define TYPE_HOST_POWERPC_CPU POWERPC_CPU_TYPE_NAME("host")
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index cf4629036d..f8101ffa29 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -27,6 +27,8 @@
 #include "qom/object.h"
 #include "hw/registerfields.h"
 
+#define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU
+
 #define TCG_GUEST_DEFAULT_MO 0
 
 #define TARGET_PAGE_BITS_64K 16
-- 
2.41.0

