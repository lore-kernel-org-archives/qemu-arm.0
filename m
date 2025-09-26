Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498D4CAC5BB
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 05:18:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v20ox-0004mo-Gi; Fri, 26 Sep 2025 01:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v20ot-0004l8-64
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 01:16:35 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v20om-00060x-AI
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 01:16:34 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-27eceb38eb1so20637625ad.3
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 22:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758863783; x=1759468583; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8qxry6y1z0qQGV3uHFHjxCr8kbyKn/3ReS6+iwe5go=;
 b=pAEbcY4vJtZWge0MzehHUv/C42VRTlOYpFRWkC5J2dyBFGpnKXrXyhTMIuaOAo8tSS
 h/edFGeAewRPc3LC+6nqVMvWdyvepFOPY5MYw3qqBLIPX7+PIijWYdXauEFLp+ensAzG
 PIuSTyvzRJgg6NVKt5FuD7D0bpwpgEgOJOU/99bPgSZvTiaCOV62EVA9EXX1AzBblQRQ
 OlDXhcbxRfItMLxJWEf9BIYWlvGjTXgdMZtzS/G4ASDs9X/NSw33b/okFLUeXdf4rRog
 pieyS0Keq0cfUEHffhqYYmLlnh8NCh2wyxFf4PlFArDpKNncobkM1Nfu1D+S75SEgjEm
 Vnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758863783; x=1759468583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A8qxry6y1z0qQGV3uHFHjxCr8kbyKn/3ReS6+iwe5go=;
 b=cRhLLDzrSRrmd+fy2bRxRr+63cWm+GSjtmJVJ1jUybIZXHXQWbTM+kNZQC50ba31B6
 vIg93HdX2P3FcVTXfd3IB+67ZsVechA1aDZUmrXzvqtU5SAGfrpI20S5usLxK8oumfba
 sySwBm5CnmyS68HhnsHfvPNItA62YmWs9gxvLp4aab/o5JCW44qug1D6RctJZ0Zzto8o
 e4cD3OJ3rD+EycYaw5d+paxy/9oxMGmhNon85SlhGPRGVnO/jIXg1cFpE8eXDOzcR1w1
 HNSLWwuaAdWBXPR4Nm9Jfb6RKgyF5Mm7iDlaXAelfxzATRshh7SvgB47FX27KZDF8r+1
 6RIA==
X-Gm-Message-State: AOJu0YymqAQUH/LXaC6MPR7TegNHPLsdu8o0zOYbNCeS7GQzjY/z+IO7
 UXknTlNPlfBF20RX/EcDCEHEdKPFyn1EJjOpQwYD/Wxkqugm+LXWa8QtC548I1HEJyE=
X-Gm-Gg: ASbGncu4C9VOlKa5o1Zbk6pCMtRZfrjf13lMmCSMPk63PsJD+ztPJ4yvubKRsqXfAt9
 U4yFiG6Q7YrslZ7CS67xkkkvHUaIi0irXCkjv8pU6S6MFipc9/8LZ4CTLECnd+pxUPmKza8zpwk
 U5exuYq+PUo3ElDaHXrII4LL5jZo6g6lUZIGWvuzso91hApDOWEXDvy2mOPAz1/lKrV7nwT4n1I
 YIPw1Ps1whyhHMcU1mRG3QAJGrRK+kMXrBfrTFl+pYe/BaqonSwlsxYSP7cUlpoUE+Saha8Op5s
 h4aDskbt5NLmAOwBIfBYytPgD2i8pKwdw6SZY3g2F3HoRGM+UZMAIXW0aIGaiQbB1lE4SeSwCYz
 q69/GXfnUKsF6S4H4qg1JowzGX2TDodPSVuhl9IqbYPBU+w6ecCmIJAav/5LD4DJ3wPm8
X-Google-Smtp-Source: AGHT+IGbsw6PoUjjNBRK/UL3bi1UNQOe1bXaSwEcY/e2fh2jEivINMtlpTKtmOZ6o4HV+auqGSnnww==
X-Received: by 2002:a17:903:2c9:b0:259:5fdf:d79c with SMTP id
 d9443c01a7336-27ed4ad65e1mr54084735ad.51.1758863782936; 
 Thu, 25 Sep 2025 22:16:22 -0700 (PDT)
Received: from gromero0.. (189-47-45-49.dsl.telesp.net.br. [189.47.45.49])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed672a51fsm42160085ad.63.2025.09.25.22.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 22:16:22 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org,
 manos.pitsidianakis@linaro.org, peter.maydell@linaro.org
Subject: [PATCH v4 6/9] tests/functional: drop datadrainer class in reverse
 debugging
Date: Fri, 26 Sep 2025 05:15:39 +0000
Message-Id: <20250926051542.104432-7-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926051542.104432-1-gustavo.romero@linaro.org>
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62a.google.com
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

From: Daniel P. Berrangé <berrange@redhat.com>

The reverse debugging test uses the avocado datadrainer class to
create a background thread that reads from the console socket and
dumps it via python logger.

Most tests log console output as a side effect of doing calls
to match strings, but this test never tries to match anything.

This isn't critical, so just drop the functionality.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


