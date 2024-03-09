Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp370548ejc;
        Sat, 9 Mar 2024 11:31:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXp3NqtZN/RyeyOo3G7DtR/px1u+PRGpbN8R6W017ESLOqdVHuELMWlioeMx2hABUND3GxvVwirFVUCSX8lnOcDqWjL2VM4
X-Google-Smtp-Source: AGHT+IFAoIpcDnUn6yo0Ukv0xY1ohmBYRbAiiP3Gc1JrgYl0axQgYqAcjVw2ksSVNXwUbkuqfWj2
X-Received: by 2002:a05:6214:1246:b0:690:ae7b:ccdc with SMTP id r6-20020a056214124600b00690ae7bccdcmr6944367qvv.25.1710012673917;
        Sat, 09 Mar 2024 11:31:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012673; cv=none;
        d=google.com; s=arc-20160816;
        b=SEHnDGlli0BHw9lzihNQuKJ0GpocDOBMqhP/k6TpoMZhQcoE3yHK/UForObqq20+bJ
         Y077UE0P/NaBCW6AWTUccj+QMzS856o5KQYbnAqysH+GyJ8hIl00V5Qvv8JUJnAKXN0E
         OyILQRxjSNjTGIwU6Xg5p0PkoyX9R9MvOTpPY7YzUNs8IxsgARbn9jlvDUHEtQOgRx9g
         HiLsbtI9JndVYQrswJcs+UGoYXDcAG+orXCisYMDD4PN/B6jIGtYHi5kfgfaHhb2xNLe
         t17WRTDxQkejEH0PtelwefNTqbjTwkq6cnPOw6SHeA4rsmG7h7VjgDzijtPewYoeQ3NG
         1DAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=97WMuYDRb3w8xARFK/GrtRAFlIvridMB6pm6DUjdKys=;
        fh=pqIcpSQvLI0TvEnunCJLB3VAMKGR97V1bW/lp8VXiv0=;
        b=sYDvImxBoiYg8IYmXQ4a1V2CZ1VxDyddHwTvICKkp4lLixqv4OucRd0+cq4lAiFeea
         eWyQ0YOkh3sNzjbzRQdlQA+/C0LnqWXnxrjpIQtBFx4AnVK9Ap6wF1OEG3LjBSNF7bgH
         wvDtm/Yz2JM58f5UwidSXHHt8i4UZSL0FB6gxjm5bOJ33e8ACNc9JtDIy6u/HLQgaVpP
         Bx3bNHyhdC+GwafUoneNMuufL2Ps7oOGapqEWApOUxDr37gc1cEghkDO6GVz13rtwsf0
         Rmh1KqFcEz6B1zyhenKGbHg0KIIz/kPLhijW7gfm7eSaXIWo/6YR7aPLCvPDuPBu8xRY
         VHSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RW1+ZiNn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8-20020a056214212800b00690c67ef185si932062qvc.603.2024.03.09.11.31.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:31:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RW1+ZiNn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rj2Iv-0003Rz-Uv; Sat, 09 Mar 2024 14:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Iu-0003Ki-Hv
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:24:20 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Ir-0002lL-R5
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:24:20 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so503146466b.1
 for <qemu-devel@nongnu.org>; Sat, 09 Mar 2024 11:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012256; x=1710617056; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=97WMuYDRb3w8xARFK/GrtRAFlIvridMB6pm6DUjdKys=;
 b=RW1+ZiNnMgLzrLGBaoUUPSwngxaNdd3W+WXdEhzOXZOWCy+yZcdobHSaXJ+zldWyTS
 oGaMmb3fGBcRz0r8bZEFWshEt5SaC3h8hCe3P12d6WDYKfm4CmO+DvdYHSxoZCyHxlxh
 w3QLC/LTMKMwc0nmImY0x6A28KOL49ikbvt7PZYYfNzKQ9Y/jxAFblXggbQnGWMvF18R
 N1s/58tvUAU0pi4GiOMGpus95CSRR0lH7Vyfg+dtubUjISF+dzPZEHJUAUZXssAhE40o
 44v7ffVBpilwvuoRwMnOf2mBdV6ECRduBL1w4aHZFyio1NXPU6CxLgH0MwuHbV+LkGXH
 mRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012256; x=1710617056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=97WMuYDRb3w8xARFK/GrtRAFlIvridMB6pm6DUjdKys=;
 b=nyAYjVtqXijPiJC0AqRlthce9uJhPAbhFETSOYSkenhjpoZrr6//6RSXGruvGXY7RY
 A/T0r8k7Viha1IWcwaNeYIzMoUBS/EvSADkDIfc80iN/IiUdcZT2xVgIhTEAOaCduJ6X
 ZkXsXoH22Y7n5ezU6yH6t7AMeIzwNbOeT8fRDO41+UpyHhwLgaJP1S7KEUcr/mEf35Nq
 4rCFr0G7TyUQsR6lcOo6xC9TMzSeSq0B2cMPjIAfINSqs+X8bpqu7F36TUWV/K+NHGif
 4PNNP9Bq2mJU19G5CNJRRxFK9DcdtTSCbLm05Y0gEMzLu5Vl9213qIdj4FFF5cs0zfHC
 Uykg==
X-Gm-Message-State: AOJu0YyvIssTxKA1dX6WiCGyPjfEX+gbm/Y3lE0aAoUqgEQi6JhPuEP4
 fg/X0XDKh8a2ejUTyn+QOTJjRG5L4m8XgOSs1wxLYHF0onZP2GSdsZUmCwj/Q9VuF82j9F5aPJC
 8
X-Received: by 2002:a17:906:ba87:b0:a45:f262:bc2f with SMTP id
 cu7-20020a170906ba8700b00a45f262bc2fmr1624704ejd.5.1710012256103; 
 Sat, 09 Mar 2024 11:24:16 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a170906a41700b00a440ec600e3sm1176464ejz.121.2024.03.09.11.24.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:24:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 20/43] hw/i386/pc: Use generated NotifyVmexitOption_str()
Date: Sat,  9 Mar 2024 20:21:47 +0100
Message-ID: <20240309192213.23420-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
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
X-TUID: C3IGBzyDdzJN

NotifyVmexitOption_str() is QAPI-generated in
"qapi/qapi-types-run-state.h", which "sysemu/runstate.h"
already includes.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240301185936.95175-3-philmd@linaro.org>
---
 hw/i386/pc_piix.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index e123458bbc..ed777e3d61 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -61,6 +61,7 @@
 #include "hw/xen/xen.h"
 #include "migration/global_state.h"
 #include "migration/misc.h"
+#include "sysemu/runstate.h"
 #include "sysemu/numa.h"
 #include "hw/hyperv/vmbus-bridge.h"
 #include "hw/mem/nvdimm.h"
@@ -383,9 +384,6 @@ static const QEnumLookup PCSouthBridgeOption_lookup = {
     .size = PC_SOUTH_BRIDGE_OPTION_MAX
 };
 
-#define NotifyVmexitOption_str(val) \
-    qapi_enum_lookup(&NotifyVmexitOption_lookup, (val))
-
 static int pc_get_south_bridge(Object *obj, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
-- 
2.41.0

