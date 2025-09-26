Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAA3CAC5BA
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 05:18:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v20op-0004jI-4b; Fri, 26 Sep 2025 01:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v20on-0004iG-7A
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 01:16:30 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v20oc-0005zm-Jh
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 01:16:28 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-273a0aeed57so34259995ad.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 22:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758863772; x=1759468572; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfw6pFN7dnHUrHR6X6D+GvMv/TVLaMbzCXTmrNOoSP0=;
 b=YHbwLtX31PryrIlTldrR2vi1FITcOrDSwu7CgvFWQasDW8nSXyb3k+JrWOLQVl9jMe
 KpWkJmdw9rcJ5DTA0u4fs7s/ouKLflhvj9SIQewvUpcE5R00Ge8IYzvNdIXm2teQQCfv
 VVPC1McllqX2emMtE3HW23Z2zMlK+WuWHJ5iGE03UwUXfmAQRBfyOq8ISP0xYilU/lZQ
 Abvc5IrBWxRe0K2iTNoGwH+gPe/m4y50WcGZ6GP/y0zdLx6Dx/q/xGnYgiFfnGrp2OT3
 meu0HjmU665pNmDPd4Ffj7jR+4iNXHrG+dADWFr/gqDkvhCWxM7omUUpWaFZ/4CLcbTe
 CQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758863772; x=1759468572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gfw6pFN7dnHUrHR6X6D+GvMv/TVLaMbzCXTmrNOoSP0=;
 b=hY9Moy/Eyvun/cETdSzQUFJzsDI9haUINMhH0HdRzzh9MygK9/2lSkivQzsRIYQZmh
 9YwxBiZtwc+YXlI4EnTQFpigtE8Uc9BM17Wo4NTozZEc1eM6SaQgKsQej+19fmqKw5cu
 iQZL0xk0Apr4wLLL6LvSGpO74XV/UuyQWHCvFCrSP0517moC5fxlBOfFah+P8NJoeCVV
 78Y8Ja7wFGhIWYchLqP6IkUJzK1yn1aAP4ys3lWL29hoJueO/Gwpt9uofdIG/qdD1o03
 /7sPXgjHP9wiuYUqginGoyb/6PJnYw79ry5Qlbx7fwSyj4gaMEwAgC3TUOuLw1i6sTW9
 FYQQ==
X-Gm-Message-State: AOJu0Ywwamrh9dkflYfSaxNhQkGfK49lsVvurANvtzCkt04Pf/fw6swp
 aapeASMWzJm3wMUnGm/pZuwzaRkQB0p+ejXzjBZmVNG3GcnIX0PBSJyDhajMrPpn8Sk=
X-Gm-Gg: ASbGnctVhO3xjb1RmJ4rzLpFu04mV88qFv+A/ttvo+P6/K9JjhQIQSrJugtz02MuvLs
 k+W/KNyamJ8Y/ybKjPZh6TEJcA20gE0Dl+3flvfuGRXq0ktpNVcdcpIwQsHeDeH1J5eAtzvOOdv
 oTQbExLjVZGHwUY1rNTz7eLsCGcOtg0oQpi/p+SuWs+OFgagRVAUl51+SBlNj7gNd2B/ldvLwI9
 jb1UMfyYhRjjC78RLad66MdOfM4Tonwdd0eCHZhFehG3rvIa11SDmkQXdGd59ZTSL2odQHGdI7m
 BcmoFmye7/yVu3/kUO+BmM+tm5rwQCAu39x0fmQmfF8mvSU8FqAskajv6csAuQe9Lq2pwZoV4Zg
 AwFAzuEMmNTKdB3t7eiB7gt443VIZ1pk4qNxyzsAopkJEhqRkX/IDKG+9ZQ==
X-Google-Smtp-Source: AGHT+IFdImT+dvV4PUe/mWQhlxfU2I54JafCP6wqf0CCaG/0neUMikNw1l1puERlaBxmDuTb+lvNiQ==
X-Received: by 2002:a17:903:1205:b0:269:95a1:94c2 with SMTP id
 d9443c01a7336-27ed6ad069cmr61483825ad.3.1758863771994; 
 Thu, 25 Sep 2025 22:16:11 -0700 (PDT)
Received: from gromero0.. (189-47-45-49.dsl.telesp.net.br. [189.47.45.49])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed672a51fsm42160085ad.63.2025.09.25.22.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 22:16:11 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org,
 manos.pitsidianakis@linaro.org, peter.maydell@linaro.org
Subject: [PATCH v4 2/9] python: Install pygdbmi in meson's venv
Date: Fri, 26 Sep 2025 05:15:35 +0000
Message-Id: <20250926051542.104432-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926051542.104432-1-gustavo.romero@linaro.org>
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

The upcoming changes in the reverse_debugging functional test to remove
Avocado as a dependency will require pygdbmi for interacting with GDB,
so install it in meson's venv (located in the build dir's pyvenv/).

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 pythondeps.toml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pythondeps.toml b/pythondeps.toml
index 16fb2a989c..98e99e7900 100644
--- a/pythondeps.toml
+++ b/pythondeps.toml
@@ -33,3 +33,4 @@ sphinx_rtd_theme = { accepted = ">=0.5", installed = "1.2.2" }
 
 [testdeps]
 qemu.qmp = { accepted = ">=0.0.3", installed = "0.0.3" }
+pygdbmi = { accepted = ">=0.11.0.0", installed = "0.11.0.0" }
-- 
2.34.1


