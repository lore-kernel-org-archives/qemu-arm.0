Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7CDCAC5BB
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 02:06:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v48hS-0006qv-Oa; Wed, 01 Oct 2025 22:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48hM-0006pZ-TZ
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:05:39 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48gz-0004tp-Ik
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:05:35 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-271d1305ad7so5861735ad.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 19:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759370708; x=1759975508; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mtpvyaz05WnNRIvwV0z7Z6oqmwF0DfDKz/U2RLEI+Wk=;
 b=Zz8rKNNMubCPCMibysLmq1A+8eORgk1X6omtXPz7X27LjQKtSpYw9q9jT8KNDiEgg+
 kquTjHgJ1dQX3PeAyg/Dm/jhQkybnKkKT3BRcZFmzbAbk/qD4mOUyVhxGKAukf8tMHaw
 Y3G20iEed6Jwzv0OxrFWUwMzHSmagunl74jrCX7KCN6rH6cA4Wkv1YNrQHpprwAZYBSs
 WZ2mpk4nefDzcZBlRsygjLUNlMwuz/rc+GQv5bFHlcOmBzH5EknKIwjzOtTVjxwAe4nX
 VXKnJ3EJP5W7FOsHMqIdhH86uQNhgucQ/6qxVsc8U+y6CdyfPgdSs1fNpkyvXGnbLKkY
 sQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759370708; x=1759975508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mtpvyaz05WnNRIvwV0z7Z6oqmwF0DfDKz/U2RLEI+Wk=;
 b=dl1aYwF0s1D3EGIYkQ1YskN+d/H2WFGXo996aLZ910n3E0EA/Whz+mJn1gCbCksgQN
 aGnZtzS3JOWGGXYIWsahSs9P6QUh5axcv8iO127CDNYUhgHk1C/0bY9IpLfU923JYnPp
 W6l8yimFxgIy4cSpu2QvZohwUm9qN8YLHNoXao/WyFShHPUJacrgAz2in6c9qVYzNSzM
 JjMpN87J6Jb4aspCD/Eap45a3qpBwj0xyRog6lAI5ywV9ccZsHZcV4W4DbRzKfIxB4ys
 8pXSp4Yxv0ItkabarVLdi28SZ+fPIUzKY3XEZvFIHPC6W90Pe6F6ajXTJX4/HU+SQRpO
 M+3g==
X-Gm-Message-State: AOJu0Yw/0OoXU3Mrq6ag0/tM/20GJUjNdCAuEBuTthpy5o7iXoBvC1lG
 Fyo9vdfkKO8x/BwII0AOmoKSjnBYA5oJ6wD2f7oVVvji2YGWy/lmlDTCy9nbaPniigQ=
X-Gm-Gg: ASbGncvEz//DkvIfavxXZ+dcPMzjCpEmIbE7cZjvPokzzVC34hSc3EfeqWVcTI4m2+k
 a3V9x5nnhmO8Lt0n/X9ouCpnuZRQNlSn22mZirSLTnHK9rXW0O4rhLZRqMD303k05Q9SdbwDbUQ
 WoC1ZwQbmAn27wGZ1NR72WRvyWXr+iGlyaB6WBkqaUT+20pyLPoctoZQj5DlXRESfdFEgn8PtDf
 zEkYB/UtIUBdN5zlEu+czVmUMHLsNaeKmRFiHnL2z09ewp1M8V/fpIjInBsDIjjLYIUpmOVa5P+
 iM2+JNbamrXw2PSDnK+xzRB8Kgr1CALTbNN032P0MNw4oMtVfwDISR0YjV8KNlzx5kLMA1XE3gX
 AHppULVrWEYXL7wCqN5f23fL5nlh9aYQxbWMddBc5CpXnK4gX6ISW93em
X-Google-Smtp-Source: AGHT+IEP4CGxPPw0ViZchboaEnCt4awv2kbuJhQBGjZsgZG6c6Qxi7pxaulv8ViQzwuNb+Dq6D/5TA==
X-Received: by 2002:a17:902:db0c:b0:268:f83a:835a with SMTP id
 d9443c01a7336-28e7f45526dmr66392765ad.60.1759370707920; 
 Wed, 01 Oct 2025 19:05:07 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d95bdsm9476735ad.119.2025.10.01.19.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 19:05:07 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v5 6/9] tests/functional: drop datadrainer class in reverse
 debugging
Date: Thu,  2 Oct 2025 02:04:29 +0000
Message-Id: <20251002020432.54443-7-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002020432.54443-1-gustavo.romero@linaro.org>
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


