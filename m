Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp58337njg;
        Mon, 24 Feb 2025 23:56:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXs+S9XqEjLWz//rgv8c+Dfr1jDiAbDmvwlgg3G6DOo7ZXK7v4cZGUTO/Gh5kTPxn6n2KY5ygO20cyyjg==@linaro.org
X-Google-Smtp-Source: AGHT+IG8jjCXoy63+j/KcuDE2LFU165uYenoHACeUfSFov5ioLiJEecaoV8OtEISiCVH6Chlkj4r
X-Received: by 2002:a05:6214:224b:b0:6d8:aeda:dd93 with SMTP id 6a1803df08f44-6e87abcd3c5mr28399626d6.39.1740470215503;
        Mon, 24 Feb 2025 23:56:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740470215; cv=none;
        d=google.com; s=arc-20240605;
        b=lA8KZwdkN74BjdZTeY8KgWd3wefYG5aLI1P8RbDh5JrJ8eu7KdSMNpKzSyIjL4vox7
         +jLwiaFfFXd5FIUoIUZOEkJ6dlqJGKX+Fxh1KjWAZMiR6Mgx38rq2l0ZCFt9E/GdNR+q
         atnD+LbfFM8dxCGk//votOWQWey7tiI9mO1fhtzSx5ioLKVq0VVrZDQHjY0Gxi7hHFrg
         F7CoxQizImave81SjN03/b2xwnZYjHtKMS6/n0sXQna5HP1xJkO2DaHoWMvV6b4VME95
         T4KI+1rsPJAYqDpvyGrW6lDRrufL7JKhNGCy8TA6ILRXMfVifd1kPH1D2+K/6oPvfr3W
         IyAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=rklDPtG0Hx2jBiYEduEAHHupdBwBpIInVhHuEoCpwE0=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=I6PwuMS47mOQT/9+KLrBQuhNiQ+6ebZAP+RRy5uyPnhDnTdcdH+xfbNYv9QhFn9uAE
         VSeguQLv1rKnbUxRRoPv3i7sz68/pf9HyU4U2ATyy7gHMwe2j69Iy6maxd+Aco+Xmj3W
         1ZqxgcFLAYRgv3UySF1tZw0/lsxBvp6oPdyzCfsgr7CVC8fVdrdAL5tkzcCq4hE6XSlf
         ka1IQBg0FRIkGmESOyt5meZZSVNfcrjj3XzcvL/scCU7jCPCgo0uW0Ary1C95AQKVQVs
         HMdI6o5j8AxFlrpozDU1aP8C0G7S3H3OWPlcmJhtbu/5lKg5HmgGKDOa312ckaXCgFP8
         XLbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b0e5521si10890396d6.368.2025.02.24.23.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2025 23:56:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmpnu-00010b-61; Tue, 25 Feb 2025 02:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tmpns-0000zu-2O; Tue, 25 Feb 2025 02:56:32 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tmpno-0001io-W0; Tue, 25 Feb 2025 02:56:31 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 25 Feb
 2025 15:56:22 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 25 Feb 2025 15:56:22 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v4 0/4] Support HACE to AST2700 (resend)
Date: Tue, 25 Feb 2025 15:56:17 +0800
Message-ID: <20250225075622.305515-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DQTbcHW5Vcyp

This patch series is from https://patchwork.kernel.org/project/qemu-devel/cover/20250213033531.3367697-1-jamin_lin@aspeedtech.com/. 
To expedite the review process, I have separated the HACE patches portion from
the https://patchwork.kernel.org/project/qemu-devel/cover/20250213033531.3367697-1-jamin_lin@aspeedtech.com/ patch series into this new patch series.

v4: Support HACE to AST2700

Jamin Lin (4):
  hw/misc/aspeed_hace: Fix coding style
  hw/misc/aspeed_hace: Add AST2700 support
  hw/arm/aspeed_ast27x0: Add HACE support for AST2700
  hw/misc/aspeed_hace: Fix boot issue in the Crypto Manager Self Test

 include/hw/misc/aspeed_hace.h |  2 ++
 hw/arm/aspeed_ast27x0.c       | 15 ++++++++++
 hw/misc/aspeed_hace.c         | 55 ++++++++++++++++++++++++++++++++---
 3 files changed, 68 insertions(+), 4 deletions(-)

-- 
2.34.1

