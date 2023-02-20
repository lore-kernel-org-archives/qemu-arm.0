Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2106336ejb;
        Mon, 20 Feb 2023 01:25:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/3rFbQpVD/Fh6FC/wrmdJ13hcwFLA/+Lc1dqrAa7Ai4NsEV2lOd0YZEP1U7pXRMGoQ/tZN
X-Received: by 2002:a05:6214:301c:b0:56e:ae9f:a51b with SMTP id ke28-20020a056214301c00b0056eae9fa51bmr3760395qvb.39.1676885125909;
        Mon, 20 Feb 2023 01:25:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676885125; cv=none;
        d=google.com; s=arc-20160816;
        b=KUU4DxtLLoF3H8WAOKYmW8ofqgYEoqFWNaRCM2cFY2T93QvMhY7U9cnAdn3ByEgYP5
         FgKmgO7YDo04K0uD7eKzVTGXLuLFQzU27h/flq13Ll2nwvqad3WNUrwp9LezZtUIX0vN
         gJzepehBJj8LspSpYP9pQJyXZpfuUV2w+3Qpq5jkTMM0MRtemChukfBsEfuV3Oy2BEU8
         pguQ9mIU1J2RgRFCKCWIijrP11EZ0ofGp7wqVlBk5x+4dUToX5a3XZkFfYifDvxgClrA
         4BOpicNB9XvvOiYMjHYgLk9a2WnX0qsUN2oRTkOaeixtxgznvJp2Y9isezPoyisI4/RG
         bVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PYSWNkl19vdmz07TNk4hcBZdhyvX8ZTfJLLhpTEmM7g=;
        b=b+cjMG56BB20spq4Q2h1Tuw0jNSTYIkSwxXIiy7qZg3ok8NoqM907GqGj7enB5W0c0
         B9WSZ6ns9VhOOrf9HU7CQSVdEVlBeEtcngCc5khEfEBc2vUWbAh5bXSJLbnFMQ5qFrxj
         pls4uPaijqx1CEnOzNysJmhBPV/1+4znNv7fVSpaHFzU/sJ6si2Q1WqG/o2xzc1L4+Qu
         hY6Uxdul+tlrrEq5h3vww2mcppqGGhEBRyxx/tEXFGKrEOhYvE8eyUdKcl67/w/EzlUD
         qJOm62CSGnZW7jXU6szm7QQTT4RT3+qq6NUo7fW6noq/JLd+JLDkaRM50TN4lskJaVTw
         yKdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VMMF68If;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1-20020a0cc501000000b0056ea7671856si9259267qvi.317.2023.02.20.01.25.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 01:25:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VMMF68If;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU2Ft-0005oe-Jf; Mon, 20 Feb 2023 04:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fq-0005nV-Px
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:14:38 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fp-0003kI-5q
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:14:38 -0500
Received: by mail-wr1-x434.google.com with SMTP id c12so336145wrw.1
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 01:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYSWNkl19vdmz07TNk4hcBZdhyvX8ZTfJLLhpTEmM7g=;
 b=VMMF68IfCFBiDNEPh2dFsd5bYegYPyfqkTAd6Wm+uAcTN42e87fDZX7tljlFHKUz0r
 nCjsFJ42bcvyhzqmbdvKRRqjFWLeStLnTwoXMLZW/Df1KPOfunFVQazS/XZzPWoBt812
 wCh6metLi+npgDYELGFsfAKpKaPfO/WwqZLpXr8KOznKfl/pKXogh1NPNX0sqgM8hRsz
 cio9jLxRR12hIfD3eCgkEHoOnGO9HmRYxSmVoBVv7mRCa4nyiHT+U913l4hhDnXiKMTA
 3FWtqdenLKc0TBxDWiiEMCyH6ZvQ7UQUKA4Di0tDsaEDba+2rMRIanbahdFYTQTr6QSV
 c2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PYSWNkl19vdmz07TNk4hcBZdhyvX8ZTfJLLhpTEmM7g=;
 b=4TOgHzDeAK5JfjkTGnoV7Gpc++E/MYjfyE9I+RQUjY31eAk+IiM37XDTHctw+H0D7g
 0K0F9DAt4yQzfakHmK2nTGKh052E7y7jnQWT5ulQQScuk2fBOwVk+7EONJr0Q+Ur+ri1
 Hx9mZLR1RMWdzdNSd7Vez7//N5m7TWXSEoDb5M/hlLWEa2vu8AGj5z3TXpuXhJ+On/zt
 fXQhEA4QT21NahIS1+R1rmn8UR2x6r+gxmP9iZL1OIm+ID/Uxi48rbTJ4G6u4teX4Bzi
 AQx8loRsA70tNzUP/Cqc1P9NurzIK1aYBfLAUCYUeFsLanS6K8wRPkJFVwuDMGRMDr6t
 LmQA==
X-Gm-Message-State: AO0yUKVmfIraw6Ktuj6Dhwyax082h3di87hdWCTy54M/fMYF9ERMcTb/
 o2WdD3RFvaTFsM95JuUPrRpJ0g==
X-Received: by 2002:a5d:5e93:0:b0:2c5:5297:24ae with SMTP id
 ck19-20020a5d5e93000000b002c5529724aemr1418808wrb.2.1676884476580; 
 Mon, 20 Feb 2023 01:14:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w15-20020adfec4f000000b002c54241b4fesm5428562wrn.80.2023.02.20.01.14.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 07/24] hw/ide/atapi: Restrict 'scsi/constants.h' inclusion
Date: Mon, 20 Feb 2023 10:13:41 +0100
Message-Id: <20230220091358.17038-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: 6qZ+d/HG07d6

Only atapi.c requires the SCSI constants. No need to include
it in all files including "hw/ide/internal.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-7-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/atapi.c            | 1 +
 include/hw/ide/internal.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index 0a9aa6f009..0c36bd0afd 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -27,6 +27,7 @@
 #include "hw/ide/internal.h"
 #include "hw/scsi/scsi.h"
 #include "sysemu/block-backend.h"
+#include "scsi/constants.h"
 #include "trace.h"
 
 #define ATAPI_SECTOR_BITS (2 + BDRV_SECTOR_BITS)
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index fc0aa81a88..29a8e79817 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -13,7 +13,6 @@
 #include "hw/isa/isa.h"
 #include "sysemu/dma.h"
 #include "hw/block/block.h"
-#include "scsi/constants.h"
 
 /* debug IDE devices */
 #define USE_DMA_CDROM
-- 
2.38.1

