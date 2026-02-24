Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6785CF3C99B
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 15:44:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuuZz-000830-0v; Tue, 24 Feb 2026 10:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vuuZr-0007ti-4P
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 10:44:00 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vuuZm-0006JF-WD
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 10:43:57 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-65c187dfc82so6966457a12.2
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 07:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771947833; x=1772552633; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hoSqACMxBpjn4o73gjVBwtRN5Jt4IHBoZBFOG4xNiyc=;
 b=H8Y2mJJH2kWiS5cTKGPQC0qBSul+KxlGYVxxW5Kd3oOV4EqmWsYgst3+69/YXAGR5E
 nYCC5ddVIrURa7M2hi7hpw+GU0e32gUJmwcXqKEwR7jBjPFDa0Y8JGzz78yv4mQ3Eo6g
 41TzRPY5fXZANyWLEOT72U0cXotp0I1RkhlYsV52SycN6rcQlQwcUvZp3dCqX3wDJdL+
 YHtMqWp6hS0KiYRfIyacYLK8N/wxdmFgKQrXeqoYhoXMfo1FUYj9A6nmiR2SYXVan5I8
 jCGGI07YZYpZk+3SCK/tyMEJkgxUV7Mrf84MNeNVMhxKmIS8Bzk7A+/uo38/H2fQQTiV
 dCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771947833; x=1772552633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hoSqACMxBpjn4o73gjVBwtRN5Jt4IHBoZBFOG4xNiyc=;
 b=raTmESjO+XFGK8BLFKLVRTMyt6+Z2SrBpSY4puuFP6zpvaW2PzHxV0FRlGHmT3OCHR
 v6HWNOuiqxgz2fUbNSrx9YQwOc18VRIPLl5IbLGVJuDqbq6GB0goY9ba+rG1r3vHUXqu
 wA8pLPJVx0v3MMbfJPZy/YKk4w2O8n0bQtrn3ObKDQsbMkcdvDpjIW3LTQdGk4TVVxl7
 xo2l2rIBw2T5QDqOFo43rrBR+AL81yMWnVfpEmJscXaIRhuAn+gHEg88n0xFRW2GnWgl
 y/jYxUphh6wQpi8y0TFsOwxtZydNP3O9ByoC448m9sM1cLKt3bq6boQ07isj9kp8St7Z
 NeqQ==
X-Gm-Message-State: AOJu0Yz1WTXb80+hiULcmPBhf4D10M9anecw2D60Wzb3X2dzJhUd3rDs
 TPt3ZvSXz8UIaYWnO/7DqnXUALwXYqdpG99rmk+kE0McTYMN6d6KqmGM675WQImvk6Tnp0PHjRy
 klKaI
X-Gm-Gg: ATEYQzwEzpcUBxveGO4JPVUMWX/F2bBP5k6N2snvx9FoottJj2RFZUky8Js8o8KmdK3
 FpK4O2AhWlFacskgYIeArf0uWTYYYr+krHvsQ9R6iuM9/wIoD+0qaT5tqEviJ2ciYD4iidT/+sj
 kkc2Hg3PNr5OCvfcncFDenBhNCIw9OlLUlvii66M5bKuSxS29a2LHXQI9RsSRXx31K2Ce6Jllmw
 ZHqP6y8FK2X4UV2sY2CD35WVHmdfNwQIlEmghBn+mV0yBPc4kr2E7Qmq0G+yEQ3h7k1rTAO5lDt
 Wq8k/vxI7TLBaau5TEwcrsQnCyZMcpxp+YUnZpdyxyydjGqU0TlDg5pDvB8A+H7s1TC22BXA60t
 ihmzkOWRDLQrhjCZs0hqsrIyNQWCPMBIQ9Hc+Kg16WFyZjqqMUiO3eE3TFi4e9mtEQ3ys2V3maU
 G2nNJcWl0nXiUuC6yrvpCmrgM=
X-Received: by 2002:a05:6402:3496:b0:659:4099:877 with SMTP id
 4fb4d7f45d1cf-65ea4b5bb64mr8317087a12.0.1771947832666; 
 Tue, 24 Feb 2026 07:43:52 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65eaba3ff47sm3558690a12.30.2026.02.24.07.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 07:43:50 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3603D5F7B4;
 Tue, 24 Feb 2026 15:43:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/4] target/arm: fix WFIT syndrome reporting
Date: Tue, 24 Feb 2026 15:43:42 +0000
Message-ID: <20260224154347.344219-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This adds support for reporting the register value alongside the
corrected syndrome information for trapped WFIT instructions.

Alex.

Alex Bennée (4):
  target/arm: set the correct TI bits for WFIT traps
  target/arm: use FIELD_DP32 instead of open-coding syn_wfx
  target/arm: pass rd directly to wfit helper
  target/arm: report register in WFIT syndromes

 target/arm/syndrome.h          | 24 ++++++++++++++++++++----
 target/arm/tcg/helper-defs.h   |  2 +-
 target/arm/tcg/op_helper.c     |  8 +++++---
 target/arm/tcg/translate-a64.c |  2 +-
 4 files changed, 27 insertions(+), 9 deletions(-)

-- 
2.47.3


