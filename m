Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEE9CA9ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 17:06:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGJSW-0005yy-O8; Mon, 12 Oct 2026 13:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRd-0005Hx-1e
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:17 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRV-00079O-Kk
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:11 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so1454247f8f.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791824639; x=1792429439; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0Y2a6FGFI+r/8p78enYrUzmu6Q/hgA5uiUs9Ch88oNg=;
 b=MI5Dc83tD+AJI8YCD6XNgu6YRpzCS1iN5OgdKlQXnh1ULfK9iWmXWs6PcCL+z3bHpy
 KcTfDlPUequ9BElINz3F185n8cvo/V4ZPFXTeiz5OemDRtTslmSPbniVZALV11TT5iXe
 12oulkeFcupVoTdBhJcmGHUI4JxYwz11lkJmGNHkEJJsDh8MYThRPvUNRUBz1mAq7H1k
 Hnw9UpmV7P6h3C3rq5Rmb0+ocfe242Z1MqzXUKRywsH7ye5fS4ZcmvoyuAvHL3L1T6ph
 oi+0YbpSuX2EgwTLMSSfCePUy8NkPJs9Qb66VMPw979x7D2R1Zj3ntUGFqR4Dhnzrox+
 TbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791824639; x=1792429439;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0Y2a6FGFI+r/8p78enYrUzmu6Q/hgA5uiUs9Ch88oNg=;
 b=Q67wUiBjDOjb4fRptn2DXX4wZzEHXEnvLWs4D/9uss/6dI+5oyzbZk5vwyvfgSYIjd
 NPszO2Jxpj6K3r7HLLgEW2jW2EViVlxDPFP2mbVUOmAty28/4SbprFDsrX2mrnSWTfY6
 xpsRKL9VxwMjE3cMAK4PoEjzlOzSWlxPC09nRhb5dxrXQCiL4QRBDTqZZvHkLGipIrbd
 Nr/4bDzlkoZ1vHXB+sRaPDAxDypZ8p0jGsMP++fhHeWS9FC26twa1rVrdGaMGw4y5N49
 8+Jg8OBKpWqh0OAiMHixCqHr0lO2LmqZpF3AEDR6sxg3ae6ZUpMM40adLT9lmYdqQh4S
 +jQg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz6Cb1HQghZDHINZk5OsREOwphoodSji6yAvaqfzmyYFDjNyoAHE2o4jrIMHDhCGkX7+q68UTa4VA==@nongnu.org
X-Gm-Message-State: AFq9FYIhSwSHDQn9+rba/UZScm6jbl8UAlkHUP46+f/Z+gkFmX6dhNof
 e+vTwsTd/Fv/iNyuNwejECQSzBOBo/bYPD1dRCj7HMxo/00RsgzQxu/YFG4CDPCMqYM=
X-Gm-Gg: AYBFou0KciVOXAnt5UvxWCtsG6gdN6OPF+oQKkGR1g2m0U0wmRjgZdqvh7VLHYE5iwu
 P/8g2wmruNI/GCXvQNHp3LCpb8y78SiAS0ZNFgyZ4qO4ruizIuTAJTyFtaJtAugUM5ZP6nsuJKk
 RVVlMyI0+mShZ8KU9m4HZ1JipTSxN8dHZFKSgkF6mWYE31oOzLPL0UoYmw2KJaY63uwArFnhoKO
 nT6lvdTjqXqoWhUkMoguzb0XwbjPGvWI7tqY1w2DtdK4WGz8mG6w3Zq2k4+TiarxGsBBbYEK7lx
 K5dMLUM9cueTrRXsjxC7NUS+J5HSyPSMHq45p9HAboH09u96KlK1JrtUqKAUmArZlojiJGWv8TD
 Q+C+OZ/qTiFDJiBG/oaRPIgFYm936FCKTtZjOvZVJ/9niMaRePnntY8ZA0bN1c6Rc/eQ9ToV15g
 OaxkwbTkkC9a0wtYSQomRG57mB8uXqf0X6iQtnS+ObsLGd1PUQUI//F7PpDe9a0RPj3emiIg==
X-Received: by 2002:a05:600c:c049:b0:4a1:9a97:c88 with SMTP id
 5b1f17b1804b1-4a19a971118mr68663605e9.5.1791824638966; 
 Mon, 12 Oct 2026 10:03:58 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18c1e33d2sm413546755e9.0.2026.10.12.10.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 10:03:57 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6B942618C3;
 Mon, 12 Oct 2026 18:03:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, Ani Sinha <anisinha@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Warner Losh <imp@bsdimp.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Song Gao <gaosong@loongson.cn>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 14/16] tests/functional: split s390x tuxrun into tcg and
 kvm run
Date: Mon, 12 Oct 2026 18:03:28 +0100
Message-ID: <20261012170330.1144446-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012170330.1144446-1-alex.bennee@linaro.org>
References: <20261012170330.1144446-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

Add an explicit "kvm" run to the tuxrun tests. Although running on an
s390x host would probably have defaulted to "kvm" anyway we want to
exercise specific features later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/s390x/test_tuxrun.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/functional/s390x/test_tuxrun.py b/tests/functional/s390x/test_tuxrun.py
index 8df3c6893b7..086466af81f 100755
--- a/tests/functional/s390x/test_tuxrun.py
+++ b/tests/functional/s390x/test_tuxrun.py
@@ -25,11 +25,22 @@ class TuxRunS390xTest(TuxRunBaselineTest):
 
     def test_s390(self):
         self.set_machine('s390-ccw-virtio')
+        self.require_accelerator('tcg')
         self.wait_for_shutdown=False
         self.common_tuxrun(kernel_asset=self.ASSET_S390X_KERNEL,
                            rootfs_asset=self.ASSET_S390X_ROOTFS,
                            drive="virtio-blk-ccw",
                            haltmsg="Requesting system halt")
 
+    def test_s390_kvm(self):
+        self.set_machine('s390-ccw-virtio')
+        self.require_accelerator('kvm')
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_S390X_KERNEL,
+                           rootfs_asset=self.ASSET_S390X_ROOTFS,
+                           drive="virtio-blk-ccw",
+                           haltmsg="Requesting system halt",
+                           accel="kvm")
+
 if __name__ == '__main__':
     TuxRunBaselineTest.main()
-- 
2.47.3


