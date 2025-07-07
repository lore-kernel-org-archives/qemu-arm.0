Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A806AC8303C
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 17:23:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYpYn-0006qy-SE; Mon, 07 Jul 2025 13:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWu-0001Bd-J4
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 13:21:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWq-0005GT-SE
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 13:21:23 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so3174717f8f.3
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751908878; x=1752513678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvxMUI2thDzOMTo1pay//3ftJosdxs4d110g7m8EMAY=;
 b=YcHqdutKAnXeTd0OxYYnFQOiQucuo2mW0crzGtcGtbiqY4aJ6vVEEr3xvPr+0D4n2j
 X6dztEBHEGGOS78UN1LqSp3HyJDADqXoqU+P95fGH8WAIPIPbqODfyn2Kq+Fof0NqnkQ
 kqbbnb7ERHv050ibcqcFJO6f58sRlaMAbkwNERUBA5AknKZQnOis5s9gFIDIKHPB4x+K
 zfmr1/9KuAvP4LKXLuw53hsrcwuXjcyFiJwWoOV5tlp9x7HWvAsdDVeV6eJbMpsqx8Wf
 wp3aH1qDkt/9l0GiucnVYL2gOMIizRDhuQUchE9FstGeVzMhGFTljkJLEJSVj8AGCpB6
 etVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908878; x=1752513678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvxMUI2thDzOMTo1pay//3ftJosdxs4d110g7m8EMAY=;
 b=Y0SoehlvTfqRxk/q1ymcur5UF7IKv+1WJZFXRDi30zYNQRKicIE5JEP9ep4xgGOQ5J
 cNHXNKlbk5HUP+21cUIDADgJ1sq+SBgVxMPcYPQiv00ewu32JTyVkErS84IucfN58kzt
 3BG52eudmQaO1+9ONtcQXc00DYXMFY+QIJ75d1GNWE5iztV3KSqcBlpPALZ/5mSe7nLs
 89fFXA7H7c3qOLdmqjFPN0Xd+gD2j23L2/hpy9WYN/b5uWE3nrrSLpF3i6wnMOPVFN+o
 vde9Yieu1LYz7zwar86vyar4p1lvcth7/CmFQAyEFVsh8arNerpEq2g+Za7uU9V2bffh
 darQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcjl4Yp1q9sCmLO56obUNwM7FXGcimZz8kAlj49vkQCCKzoeuG5/Agzoc0xoq66bkQphJsUBvgvw==@nongnu.org
X-Gm-Message-State: AOJu0YwMsbDAGMRCbbWL4LRJrShdb2JbPrTZOAcqorj+cNG71jCCDxlM
 Rc2ybh+0GWUYQuu2nUHixHB/KJbH0Aw8x1FwjvLt46TBHmpHXm076mWnmG8lZWrrmtE=
X-Gm-Gg: ASbGncuuWJY3kxC5aOE82ckwaqWgYiAUu1z4xvGNJ7wJjZX9baMxLzV4nmsiaJSHjZf
 LXn6pJAtrLyAWhlD7N+g1RuvHYdyI8QvXiz+sLdg22TxcIdabhU+fHQSwqDHi+dheTQfq695VyP
 0YsfOz2FgmGyAAVoS1Bt7lHy6/rpC2TicmFbxkSZnd0VFtLI3IrcJpn6a5NR62HZ8NOMgzq3Mn7
 P64l93QxCNnyDYviC+A+Abe3Jv0Hkby13XSzczukJE3QCf8jPCThkDmMicbwp9w0kjU9w2Rc8NR
 35PnJKzMQ8s4KOHpMab1tgV+x/n82dUdHIcgx5n7jcO3xUAhiYUSXH0N5DNxBJveORpUQAKIK1t
 THGgbo19AzE8G4/L39IolP97ZLCMQ3wWY2D+I
X-Google-Smtp-Source: AGHT+IG3R7nzDUbI7ywyegfqyBV4/z9vERQ/HKQhcLB40Q0IMcGvVvbb0hYfAK75Dye22kA1OdRJjw==
X-Received: by 2002:a05:6000:4703:b0:3a5:2465:c0a4 with SMTP id
 ffacd0b85a97d-3b4964feceemr9778712f8f.20.1751908878378; 
 Mon, 07 Jul 2025 10:21:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225b5cdsm10602448f8f.85.2025.07.07.10.21.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Jul 2025 10:21:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH-for-10.1 v6 13/14] hw/boards: Introduce
 DEFINE_MACHINE_WITH_INTERFACES() macro
Date: Mon,  7 Jul 2025 19:20:07 +0200
Message-ID: <20250707172009.3884-14-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
References: <20250707172009.3884-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

DEFINE_MACHINE_WITH_INTERFACES() is similar to DEFINE_MACHINE()
but allows to pass a InterfaceInfo[] pointer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/hw/boards.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index f424b2b5058..91ccb68113c 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -761,7 +761,7 @@ struct MachineState {
         } \
     } while (0)
 
-#define DEFINE_MACHINE(namestr, machine_initfn) \
+#define DEFINE_MACHINE_WITH_INTERFACES(namestr, machine_initfn, ifaces) \
     static void machine_initfn##_class_init(ObjectClass *oc, const void *data) \
     { \
         MachineClass *mc = MACHINE_CLASS(oc); \
@@ -771,6 +771,7 @@ struct MachineState {
         .name       = MACHINE_TYPE_NAME(namestr), \
         .parent     = TYPE_MACHINE, \
         .class_init = machine_initfn##_class_init, \
+        .interfaces = ifaces, \
     }; \
     static void machine_initfn##_register_types(void) \
     { \
@@ -778,6 +779,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+#define DEFINE_MACHINE(namestr, machine_initfn) \
+    DEFINE_MACHINE_WITH_INTERFACES(namestr, machine_initfn, NULL)
+
 extern GlobalProperty hw_compat_10_0[];
 extern const size_t hw_compat_10_0_len;
 
-- 
2.49.0


