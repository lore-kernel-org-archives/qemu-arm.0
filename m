Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E43CCA470
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 02:07:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v48hh-0006tr-CF; Wed, 01 Oct 2025 22:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48he-0006tD-Fr
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:05:54 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48h0-0004tb-Mm
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:05:53 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b54a74f9150so434172a12.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 19:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759370706; x=1759975506; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=36ywwA0xwnnyvEA2yV5ieTqkFpwxjO0iulzgzaKGyQg=;
 b=XpxKLQlIKCw1swxIHeL2NzdxeHdo5mMfauq6XvHCu+ITEUcKwedvZ2QVPzJZHTCLD/
 6+e67kLSyWQGA/U8+hp8kD0kcnqwyI0Q7eKAElHZwi3t1b8BBUL6q929eDifI9oPsxeK
 1WOudWkwF4SRaRDBX8EA5Qya+UWLBd7dPbZ0DSKSXkXt8lVWhpMlMMQ+TR0viDeaUA39
 xqe0omuD5Ql9Bm5ekNG0skgRt9j15TsJEzN1xxnKvm9wAiSAiZCIYuv3CST8ThKZuWQb
 DD2ebVDghQysXvv4V0QhvrBBDSI1SLgTfGA9bSWCnE3T7fTvzaMZ+mo9rdjWNKCmmYIN
 NR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759370706; x=1759975506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=36ywwA0xwnnyvEA2yV5ieTqkFpwxjO0iulzgzaKGyQg=;
 b=NI5Z0eWsOmetJo/snGm4O3zSWRIgu1vRs5hXxQW/oihU9lx/m+i66MZDFjzwnc5nWN
 +EkpQrcoi4CAi/GIWv45e1Lm3owO6dQ/13QqDKdv+hZpioNoHGxDJc4TkFJQN0Rv8ZRA
 RNppoY8C0lWpk7ObGBi2THfKDeDe5ph+5VmhA5BEyciG4JGf4CNFBqMVagXllS3v1DR9
 0g/IeeA5uxWClhHwob8DDY8qwpvVblveYmzoHRJq8jCxe+RALQVx5hB5CBN/TKYVoh5P
 BogQwdZ69jcFym3F2pYv80Puq3slZn9WOy5SPx1GSKgtraiE0WE95o7jXtNylZdR+Bhb
 zPVQ==
X-Gm-Message-State: AOJu0YxtNUz7lI7P0kPTI2KbjRyyEKShBtUugOtCPt1tI/wo72NdW5wU
 FBVSg1okWQ0ig91ynmH0LiRrixo5PdqM8GC3PbrgwJa7ySc9oC34PuEyvkVyeQulcF/m+T6nRMn
 FOziF
X-Gm-Gg: ASbGncvoxeEIx9EwfUlpiNl1YvMeaaWY4+RhT1B562RvYweF9AfbUlwg9IqDPqFOG91
 MXIrAsizXYNGvhyvNAaSvEwijKvXgzmAMxV3O5WLvae2q8sYLY4Y/9H2EGoaItlfnY+WgaG0MuV
 Y7WHppoBPEdO7H7FL/iYq1pthsaR0bRKzoJjqCmt5uQofIHkus2Zu6jqDxJUTctOECFcgA5hwNf
 kEgP15sXRS9VuNpdv81evYbHn75eqHWB3+rtWGd+OueZz76JtNFGZTQQu7bhtkE5rkfEKp35PSz
 OdV0KRVm3xMOU9d0+L1fEW/kxtYG7K4ceH6Q8pxPH1GOEcCyExrBnDCWKwcj9tBAGdOGqU8POQd
 90gvUDwyAlA97kP0+R5if4ha5/7l1EUkHbxWtBeERnWY0z9rZ/VVx0KWI
X-Google-Smtp-Source: AGHT+IEGzQJxhSLkM/78K47iQMjIFI3ZVf2uxUHftZi3defK8u6IpGpxLsHAzq8F9CBnHMn9llSxxQ==
X-Received: by 2002:a17:902:c404:b0:271:479d:3de2 with SMTP id
 d9443c01a7336-28e7f291facmr71074395ad.13.1759370705708; 
 Wed, 01 Oct 2025 19:05:05 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d95bdsm9476735ad.119.2025.10.01.19.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 19:05:05 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v5 5/9] tests/functional: replace avocado process with
 subprocess
Date: Thu,  2 Oct 2025 02:04:28 +0000
Message-Id: <20251002020432.54443-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002020432.54443-1-gustavo.romero@linaro.org>
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pg1-x52d.google.com
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

The standard python subprocess.check_call method is better than
avocado.utils.process as it doesn't require stuffing all args
into a single string.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/functional/reverse_debugging.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/functional/reverse_debugging.py b/tests/functional/reverse_debugging.py
index f9a1d395f1..a7ff47cb90 100644
--- a/tests/functional/reverse_debugging.py
+++ b/tests/functional/reverse_debugging.py
@@ -11,6 +11,7 @@
 # later.  See the COPYING file in the top-level directory.
 import os
 import logging
+from subprocess import check_output
 
 from qemu_test import LinuxKernelTest, get_qemu_img
 from qemu_test.ports import Ports
@@ -100,7 +101,6 @@ def vm_get_icount(vm):
 
     def reverse_debugging(self, shift=7, args=None):
         from avocado.utils import gdb
-        from avocado.utils import process
 
         logger = logging.getLogger('replay')
 
@@ -111,8 +111,9 @@ def reverse_debugging(self, shift=7, args=None):
         if qemu_img is None:
             self.skipTest('Could not find "qemu-img", which is required to '
                           'create the temporary qcow2 image')
-        cmd = '%s create -f qcow2 %s 128M' % (qemu_img, image_path)
-        process.run(cmd)
+        out = check_output([qemu_img, 'create', '-f', 'qcow2', image_path, '128M'],
+                           encoding='utf8')
+        logger.info("qemu-img: %s" % out)
 
         replay_path = os.path.join(self.workdir, 'replay.bin')
 
-- 
2.34.1


