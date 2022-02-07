Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4405223lfk;
        Mon, 7 Feb 2022 04:14:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxasSL8sTUdJtPeJgOtw6BkHnK8XGB4mpLd1VuJaxmfM9IA4jdwp0Fddrf1Q/1J4C1a09L8
X-Received: by 2002:a25:9703:: with SMTP id d3mr7344162ybo.546.1644236059603;
        Mon, 07 Feb 2022 04:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644236059; cv=none;
        d=google.com; s=arc-20160816;
        b=hWJyqXQZzlMXUfdpbx3jEOeGe2BBnqhfujnBRL72I+HOyT2EveqweBhXFxWTTWOAJU
         Aq408WNNTaz+SN4+mJPAsNTcMm2ZwjNOOzm4dkFFOhIyHp9EeDrI2paVJrOayPmnZ5fC
         aX1pBCn9XzCWRsxhTq7DdSftEHBWTCYjfNDGtmLlk8R4A7mirFFjKMM5iKKcvBaS2p8P
         6+2tCOX8J8t3g/xhcSeV1Q4I3MZhdH54OpO5Gyq5waWwrlOufPI/uoneAI9VLgEgr2zq
         SGbcy4dwAq071+IFWD0FYRwXMElZucxhQdbuxhNgC0cnZP/N9CuUKWW4ZhUiUaz88hJu
         ZcxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:subject:to
         :from;
        bh=ZIblpTF5onL84PaspxLsTbyOO8Pw+fGhTdZqljO7lJg=;
        b=v1A+vtNWtCIKnPp1dTKOZzIFp9noA+o28tbvg6I0iccztNqXFh9tfZT759YFw998zM
         zpqe8wb+i10bUP7xVUNuqXkkyp0KcCjLq+ka9xVxlI3zcgo8bXwCk9qoisR7bKKpycDl
         tJE0Srt+SWclyLxR2K6Cl2caK4+JFLIQZ/ofqJT3JBrZW5wgskMmRHbK4scQXrkZmlCm
         YuB+HTi3sksrpdB6OnFqnTqtrKK6nOmPj+ZidEgOvXOEuj8rxR2RJ4oPK8sC8XRRAhP1
         0Otht6p5Lzc3HzcOX6foTvKeW0moJrGbqCqXGkXu+3q7LXWDDEQS6N82iOTTSZAmgBGK
         OSAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b145si779882ywa.281.2022.02.07.04.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 04:14:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nH2uQ-0001Yt-BY
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 07:14:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nH2tU-0001Wx-5X; Mon, 07 Feb 2022 07:13:20 -0500
Received: from mail.ispras.ru ([83.149.199.84]:43928)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nH2tQ-0000Le-P6; Mon, 07 Feb 2022 07:13:19 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 6553140D403E;
 Mon,  7 Feb 2022 12:13:12 +0000 (UTC)
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: target/arm: cp15.dacr migration
Message-ID: <662aca02-da99-524f-d9df-cd61427ca520@ispras.ru>
Date: Mon, 7 Feb 2022 15:13:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VGZMaMqh22jv

I recently encountered a problem with cp15.dacr register.
It has _s and _ns versions. During the migration only dacr_ns is 
saved/loaded.
But both of the values are used in get_phys_addr_v5 and get_phys_addr_v6 
functions. Therefore VM behavior becomes incorrect after loading the 
vmstate.

I found that kvm_to_cpreg_id is responsible for disabling dacr_s 
migration, because it always selects ns variant.

I used the following changes to solve the problem, but I'm not sure that 
these changes do not break anything in KVM.

Can anyone give me an advice about that?


diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c6a4d50e82..d3ffef3640 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2510,11 +2510,6 @@ static inline uint32_t kvm_to_cpreg_id(uint64_t 
kvmid)
          if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
              cpregid |= (1 << 15);
          }
-
-        /* KVM is always non-secure so add the NS flag on AArch32 register
-         * entries.
-         */
-         cpregid |= 1 << CP_REG_NS_SHIFT;
      }
      return cpregid;
  }


--
Pavel Dovgalyuk
