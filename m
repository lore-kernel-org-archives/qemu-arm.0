Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp549328njc;
        Fri, 1 Nov 2024 09:11:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwRetfcmlHfgf62tRRNn3z11WlovuXcQxvz1HlTr0DquBcanrWxy0XZOqVLKJUKp52+NtyCmfdls03EA==@linaro.org
X-Google-Smtp-Source: AGHT+IED5jrmHh1S7tP21J9cyB8zx9KurD5Q/PIWHBMzMjvxJPOElQ5NeeD/h6+R6qQCiXQTeOKR
X-Received: by 2002:a05:6122:8c7:b0:50d:3ec1:154b with SMTP id 71dfb90a1353d-5106ae6decbmr7923981e0c.3.1730477501896;
        Fri, 01 Nov 2024 09:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730477501; cv=none;
        d=google.com; s=arc-20240605;
        b=T1QkoFI1T8eW+DTtDxmmV/LQPHrOYAH9HbhHO5AAfx/1uK/pMgL0uRN2mlYlCuQ9pc
         S7FLG0fecfT74MULsVv167VGs+DI3KdxkZ7c/wXgCC0GaQNMIiZAr7sm9yHyXmWGNvQf
         ZZTZfTl1U5jOnbamEe00GzbemIDs1Q7dlMnc2TdWMxKV4fVV5kyW/T4GsGr3C9DWgG9l
         ESRLoSB78Yr0aHw8Pu2yZwxh5jz2RRRTN8VqY0fho2+ypsA9iWRufGAdQZJdG1jFkKns
         syc/r1vSqpncSzU3b8q2Lk8Otljn9CgwgS8qZ/LgAjiJG3c6h+L+ZiohhCvrHdKbGsXa
         fLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=HKFOgXGoRqQTK5wGQoj2VTmlGEEPDpzJ2I7xF+qsPHs=;
        fh=hwTa052YlGcNkwsQ74pUzUToy+jInIcYI1vQhuOVwNE=;
        b=KnadNZYEMbaVfUq+aLl0OzZr52gQxvf12XxWFIJiNblYR8ukPxE2HscWjPFesRWBzC
         frnRqjfRA9OUD6MPuJURWBo4Uvy91Y0hwt6GICQvOqxolucO/x9hk5qxoyO723t/6pPr
         uOZHQ/I/nWqp+f7Vidqqbx6ppa9rPAg0YQSD/4aTxBkAAwFsbTDSlYis8H+EyfMU8+H4
         WDRMDAd7U/nDETGak7W22DSRMCnQqxHyDDTFNtoVdUUsg/32+U0HkHGGChWoq8jtt5Ck
         FTpRwuhkkwdrOyKtse4zx4+tYe+yg2H0Xz6S++LwsSOFA+xMwihUek9iwrMH16vo1Dvq
         3pPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hTYLEKHK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5106f404a22si1124600e0c.286.2024.11.01.09.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 09:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hTYLEKHK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t6uFK-0004H9-If; Fri, 01 Nov 2024 12:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6uFG-0004GT-Ps
 for qemu-arm@nongnu.org; Fri, 01 Nov 2024 12:11:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6uFE-0008GT-Vk
 for qemu-arm@nongnu.org; Fri, 01 Nov 2024 12:11:30 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37f52925fc8so1294425f8f.1
 for <qemu-arm@nongnu.org>; Fri, 01 Nov 2024 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730477487; x=1731082287; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HKFOgXGoRqQTK5wGQoj2VTmlGEEPDpzJ2I7xF+qsPHs=;
 b=hTYLEKHKSTNwsej5ecwrh1vqhBEh1LqJiD8a13KPOvPN7gFJ6zYrf7tSQPcAQLjQbB
 F4QWMAaP+3lOMZ76LDLCLIidTHbejpZaHfUI50HzBbf6/VSGts54l1FUrcQeumTs6tqw
 nBhkQRPtwcbnaoitLBlkGlg9UEfpwIayFcGMeLhkF/dw8OsT6EGJ4dbHc8Y/6VArQELB
 ZZ5Pe52fXU3zAoGpgOXYL9C9IMUHYx0dRYN3u4n4kKF6jDNOKNVhR3401+kKfkDx97xV
 Sf2Pz9tBdzPpFTf9Q7F73oywyidfgyfZmXeAcz9CzT7lMpSL04Bps0fK3jFMETIcQaGY
 Qpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730477487; x=1731082287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HKFOgXGoRqQTK5wGQoj2VTmlGEEPDpzJ2I7xF+qsPHs=;
 b=dlWU3i3AiqG/isXqzGoTytB58CyK3ivU8hLMHKi74jbOJDQbLDjQuz2CDoH1sllP97
 lnwieCIE54246XC50aAnwbq79s7rQsKtCL5uQfT1i4ub1f4W3zptbz8AO3sSo+qL10KJ
 JquBprDkokjkn0pSVmsdiZ5O+4nHCiubV5vCBXwfqoAPyf0e3hY3IM51UNMYzD1nxEWh
 e8AX3Rj+Yyx7VnPPy0Au9KiZpCVdGIfYx/uEQZ33nk4rjG7zw5YEkyse8wVvMiIgvVwc
 cA2Iww+ZjgxnddXnQ9ydgUHuI+JcMJbdFG3tWIqAT5dQuA5UiL00iJNVgklHLp5Sd1T1
 /BqQ==
X-Gm-Message-State: AOJu0YyPftICPWsrkP//xLpeAFmq6bqEQbzU2LhIsuJYY9Mr1AuHfuEu
 ORYjfcjZQgcmxhyrEs+47eCmFtUkp7N/zRozc21m6DMmK0Z0AX95v3YAm1QjvlEBQG11T6J/xSW
 k
X-Received: by 2002:a05:6000:1569:b0:37d:3f5c:5a9f with SMTP id
 ffacd0b85a97d-381c7ab2fabmr3730890f8f.36.1730477486658; 
 Fri, 01 Nov 2024 09:11:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7f80sm5658313f8f.20.2024.11.01.09.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 09:11:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/2] hw/arm/aspeed_ast27x0: minor IRQ number cleanup
Date: Fri,  1 Nov 2024 16:11:23 +0000
Message-Id: <20241101161125.1901394-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: 9o8zyA4oIk2V

In the course of a conversation on IRC with somebody who was using
the ast27x0 code as a model for a new board, I noticed that the
code currently defines a local ARCH_GIC_MAINT_IRQ with a different
value from the constant of the same name that we define in the
include/hw/arm/bsa.h header. This patchset cleans that up and
also another minor awkwardness that I spotted in the process.

thanks
-- PMM

Peter Maydell (2):
  hw/arm/aspeed_ast27x0: Use bsa.h for PPI definitions
  hw/arm/aspeed_ast27x0: Avoid hardcoded '256' in IRQ calculation

 hw/arm/aspeed_ast27x0.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

-- 
2.34.1

