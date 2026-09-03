Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303EFC61DD3
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 14:22:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x28Ke-0003qD-Ai; Thu, 03 Sep 2026 10:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x28KY-0003pK-8Y
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 10:22:19 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x28KW-0006LL-JV
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 10:22:17 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49b392ccaacso36156235e9.2
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 07:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788445334; x=1789050134; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6iLA/pEnby3j7oTa/5DmCZmMO+/WuYKFp0gUrdbgxMQ=;
 b=u0/T9f66r87Oof+PbQpYitxUyAnPD+nkwj46qJvCMyIxu9aH83Nn71+ry3f3PBjOzO
 ccnMSwUupVh9T/kwlib7pcIwqLZV0p91NnenJDZ8lOjw1upPS/Fw8Q1jcfMcq/jYFCGc
 cKAg4rC/uD3HPkIXrmKOpf5yWoJi7Nir1zizbMsf2T6RjZ9shGfMih3rV3Ps99MjalZl
 4vszHntCNbvM/znxS0OkUvxn0rPlVDU0oTCkQt2nrn5tasnyuNg7DTdSMJOZVGxG6xqa
 oDYrJC1AMyGVn0xavc/dVz194UMUKp0JigRTEDQqJNc5lkKzKv0gSfjsAuh4Z1PJhSg5
 A0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788445334; x=1789050134;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6iLA/pEnby3j7oTa/5DmCZmMO+/WuYKFp0gUrdbgxMQ=;
 b=OHz1tbZd2/ytfbhTL+ikLi/B6m7p6bIFbAqx6xvrn2b7KNw36KGWVs+XkPxiWL7pXv
 aZd0oYhwUf7xHvAGEmKEKXpAkPdWmWaOAaWNt1mqVxHiHDpeskvhKR+ldSGGR1ToUeQ9
 1ysc1mORem9yCIHfEmVxhPr3lJFcypK3+VPaP50hIc3O8+P+ydU4zDT1uUfTX9BbpAD6
 b8zzGwAEEofPyPhcnQ2AoKswUmQtX+xXvvH79V18xlTyJ4NTudaV02T77BsV4UXjmItJ
 svV6OcGgt2TrMBeVtpOb3mpARdYSXHTMRJPZVagKfEZvOuoyDrQLm/5b3IiCMApybafc
 ibrA==
X-Gm-Message-State: AFuF++kSe4QBydJSdEwkbazjPf9ucr/7uBEia4ehdrD3gbwAbVHEIKOu
 Aa1Pekx4YCfDvNDVg//eAnwNESmMjaYODpC/A986MIUU1XowEpfvGvryHwrxuwKa4jc=
X-Gm-Gg: AYBFou2ErdATfohTuEgesZVLE5vMpaicpxhNQ+Lbb5EMOnq9vNuN/FWY7x3ciVsIjt7
 DqUygyixFdGtjDVbxWd/gf+ubRB83Kp6IakjnTEQkApEwGKQPfBsCvsWKzR2LwMaTzx1bk8YX2Y
 QSCw6a1pR3wFFlGGDHXVBHGc4FvM/KMifdEnCRZx7cF4skhAndFTnlP1C1M+vuk/L0XbJjaadwt
 5gf82RN1bCPQnccsq5PBtw8jZ+S5V022UfTkDRl0IyrI0BihaCWla0f9st6bU6UEL77FZjuHW4X
 MttTZVpdw/9fxKYU9rP0J+JibjQD+g32ToRF5qWT5dtmLHywiYFNp+MVU6/F2zFpVLQ/MQt682G
 rEmiKe5nSkUyUSijPJczg19UvENxl+PO4JsOs40EBUzhPQn2+HbpxZKSXKbJglKiYLRpWqjRqPO
 qcXo6ytzqIplecB4fpwRiCL4xcGUmyNh70kmdb3Vyry9s4uWFoTUx9gjIwnZ0F
X-Received: by 2002:a05:600c:c16d:b0:49b:47b3:d6d with SMTP id
 5b1f17b1804b1-49ce5842737mr264248315e9.10.1788445334577; 
 Thu, 03 Sep 2026 07:22:14 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce47b9817sm116912195e9.1.2026.09.03.07.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 07:22:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6A3705F8FD;
 Thu, 03 Sep 2026 15:22:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/2] hw/arm: fix GICv2 bug #4402
Date: Thu,  3 Sep 2026 15:22:10 +0100
Message-ID: <20260903142212.1451770-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

I needed to exercise the various AGENTS.md changes to see where their
limits were so I turned my agent onto some bugs in the tracker.

Both patches have AI-used-for tags and per current policy can't be
merged. That said in both cases they got me to a point where I could
reason about the code and then manually cut out the verbiage.

Alex.

Alex Bennée (2):
  hw/intc: include CPUID for SGIs on GIC HPPIR reads
  tests/qtest: add gicv2 qtest test case

 hw/intc/arm_gic.c            | 21 ++++++++-
 tests/qtest/arm-gicv2-test.c | 84 ++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build      |  2 +
 3 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/arm-gicv2-test.c

-- 
2.47.3


