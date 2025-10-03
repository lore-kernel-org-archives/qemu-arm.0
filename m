Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6A5CAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 14:21:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4gcy-0004Ok-LS; Fri, 03 Oct 2025 10:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4gcv-0004Nw-Im
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 10:19:17 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4gcY-0000NU-13
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 10:19:15 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2697899a202so23678865ad.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 07:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759501124; x=1760105924; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mtpvyaz05WnNRIvwV0z7Z6oqmwF0DfDKz/U2RLEI+Wk=;
 b=qowHoSlhUD7zR0clBYSTWli8UYESYqRkzhD1aFYN7AFKcYk+xbQ/QCdc1OMsfqH1nw
 22r3pGDFqZiX0upLB14G8UWJFEEuLZI3oZBG++l0C76T+DUwFXrfJxzgMIgEy5k+rcf2
 OIf86vmIgwa6T06ZvIOfcLCZoxhwb+0jeDgSV/YFnjteX4twJgzAS89HnpdPkX3HXbV6
 xFwblLmLerlocuih2g7F8xCp526KHy4Iv3L0Dm11G/YiL2kKNJjjsaRgR9SrcqSPno22
 Ij4Z5NkvQp2OaA8qjoEdXYFaXg+xGpVxThl/bf0lNTjGqNiJzOpPoLia4KGNTDoeP7+P
 dh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759501124; x=1760105924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mtpvyaz05WnNRIvwV0z7Z6oqmwF0DfDKz/U2RLEI+Wk=;
 b=UygOH3XfEZRzrS0kuxA3PBKcQa11PMysYMSulpGC8m6LA0X5cKXEW105zpKBU8lVo9
 XWraYxp0QQvAllRep1tm08ngBoZcDO3fCxvMc6Q/SU7IayeyPzgifWS9H8SohRLMR3Uf
 IdpkZ+weAo8MzA06x2DXQ2x5XRLYCCkTK1hMZyNWxO8moxL5si65u2wkRrz3R+N/fTmC
 3GUUsUN2VsFvMb/H0vlGZhFW5jQakRNJbbKls82K0p9uRlQMaLTQ76cDzfOiQalo/ino
 XElFa/Aa18sMPDSYfIcE2sg3fZneY9W8UValcWov3mFuFkMPtPLIkz0Z0yPs2ImELdRQ
 eVTQ==
X-Gm-Message-State: AOJu0YxBBTYFJ12nw9kbBY2/tgbmOGg1YLNssPeeVj5SGZ/fv22TOieX
 jGSHZOj95gREuZVpYtKms8zSjLMIkK0sSpKyrKG8LPNt0oJI20Zp0EBKNXMTO7yI0Gw=
X-Gm-Gg: ASbGncszAp9g6gAHbtKRCSb91u2LlHcNbdZOoiGVXLNtmSLBASxsntDXunxuUU+6dzv
 gmUspm/2CQN9X9R340j/jixLzzHqUAVL4vZ7z6pXV53HN+KELbis0iR44ilykxbOyPpDw63soyP
 r0QNPYoeHnW/2v9QjBx+3nFMn52Cg1eVo9VEOoGLIJpFgyGavZXjactAjYxwLar3s5ZJ9Zoow0M
 4Qb35qDQjdlJ6pRAbXBK8yjTAF7bLeiUikiU3qbV1GMksMCI+KglCMn6mnuoX+BmYmi6UzPMd/t
 tExD4vIczxBv/NLEvUUUBwraoHv4C2FkABdJrBINCPQheHNryhBFiIVbAEr6/ppMQ0CUsGVMddL
 HEgb6Zer6/MU5lBvSkvLRwo3WNyvlrV2JGUtOfhwL/QdSmTgtueHqxxzgPD6fUCuyFnU=
X-Google-Smtp-Source: AGHT+IFxb5Z1ueKe0S6WrcLScL/Nnmc4VK5AfIFlx2OugTXXpHfyeeHpAqYhciFOaMK5iJGtmNzKwA==
X-Received: by 2002:a17:903:3806:b0:26c:4280:4860 with SMTP id
 d9443c01a7336-28e8d038cf6mr102763055ad.8.1759501123898; 
 Fri, 03 Oct 2025 07:18:43 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d5635sm51759645ad.102.2025.10.03.07.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 07:18:43 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v6 6/9] tests/functional: drop datadrainer class in reverse
 debugging
Date: Fri,  3 Oct 2025 14:18:17 +0000
Message-Id: <20251003141820.85278-7-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003141820.85278-1-gustavo.romero@linaro.org>
References: <20251003141820.85278-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Daniel P. Berrangé <berrange@redhat.com>

The reverse debugging test uses the avocado datadrainer class to
create a background thread that reads from the console socket and
dumps it via python logger.

Most tests log console output as a side effect of doing calls
to match strings, but this test never tries to match anything.

This isn't critical, so just drop the functionality.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/functional/reverse_debugging.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/functional/reverse_debugging.py b/tests/functional/reverse_debugging.py
index a7ff47cb90..7fd8c7607f 100644
--- a/tests/functional/reverse_debugging.py
+++ b/tests/functional/reverse_debugging.py
@@ -34,8 +34,6 @@ class ReverseDebugging(LinuxKernelTest):
     endian_is_le = True
 
     def run_vm(self, record, shift, args, replay_path, image_path, port):
-        from avocado.utils import datadrainer
-
         logger = logging.getLogger('replay')
         vm = self.get_vm(name='record' if record else 'replay')
         vm.set_console()
@@ -53,10 +51,6 @@ def run_vm(self, record, shift, args, replay_path, image_path, port):
         if args:
             vm.add_args(*args)
         vm.launch()
-        console_drainer = datadrainer.LineLogger(vm.console_socket.fileno(),
-                                    logger=self.log.getChild('console'),
-                                    stop_check=(lambda : not vm.is_running()))
-        console_drainer.start()
         return vm
 
     @staticmethod
-- 
2.34.1


