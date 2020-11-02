Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3985675lfa;
        Mon, 2 Nov 2020 06:43:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmwss2t3Z6ruV6oTSnxuizY1MDKtsUru+qA8PmZDvS9BMY38b6e3iR2F+F1OYPQID4Ybmg
X-Received: by 2002:aed:22ab:: with SMTP id p40mr14122134qtc.200.1604328206690;
        Mon, 02 Nov 2020 06:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604328206; cv=none;
        d=google.com; s=arc-20160816;
        b=SNxMKYVp0o7ReBy52YqC9SN8DIVLYos8UNOps/f1wLLpv6RU1ZOvv0D82x8IdjWuhz
         kZ+EMBjPIEZAqR1HQfhCP06fJ498SagUGBw/J+dCvJZ3bd8E8txEeCyP3htKr0osrJP4
         0XdFMcRa23nuNTotSlrK3Qh5zKCerfZ7w7Scxj8q+FqCe/mAm5LefTpiQSEMBnSoH8we
         F6ToK0Xx7DM+2eIs3FJAtGlSFNV+BkZd/zhDXr6fweRX/NAB01gfAD47QOCIwS6Hkbz1
         zJtukFkBhjhWEGJia0vX9s9o/ksh/CoBZq+OLwibUG23DvseIFaOjRxhEHZbcQIKLvJQ
         JHqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0UYZMAjZdsbOMrPX+8Jgmz9tN62XrUtMBK1x3PbC+Aw=;
        b=xor+ErRPplGTp6WHocI6A2JHwmc2cuRn6lCoB+GUJ6DNThosr62iiR0vJA8QVAdrP2
         cXGxXizT+NR4l3Z8Rz5Su6z0WWhHSRmjFJwxJpV5EOSKyQef9M8WIyTh/0h4IItyyAgz
         B/+b0Hfp5RTwL9YnJBH8s5KYWyw4xDVrTgUkjDz1RF3/zPTccl3UnJAwDO44Ycyi87vx
         Ffk9rFCv9JexqZbqoL0KgvkkrEoJAt0XCt2OcL5n6mLlvrfzrYMRmaBq45HenRy0Id60
         tO//gqxhEjTqry4uj67SKZeEMQAuD7WfSRuUyfwtE6qpM0nw2OVDTpX6hQdiHXpC1XLJ
         sz+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LtbojD2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l72si6979586qke.79.2020.11.02.06.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 06:43:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LtbojD2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZb3O-00025o-2R
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 09:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZb2y-00023S-W0
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 09:43:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZb2x-00056E-8K
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 09:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604328177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0UYZMAjZdsbOMrPX+8Jgmz9tN62XrUtMBK1x3PbC+Aw=;
 b=LtbojD2UPEE4dOrrePbAtncm3NDMlZlZvzVzGZgCOTSKmxO6MptR/O3yLk82/7cKs3gHzj
 UjPLMKsFj00z7Sl5e0j8erPCQzw9uFoole4I31ZOoykyLmTkj51EfylKApX/j8mWEGWm26
 uO7AdoQxlu3NMr4XaEO2HEAXE2xy4YM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-hKM3z9pDOhqlOYPxspv3cw-1; Mon, 02 Nov 2020 09:42:56 -0500
X-MC-Unique: hKM3z9pDOhqlOYPxspv3cw-1
Received: by mail-wr1-f69.google.com with SMTP id t17so6531579wrm.13
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 06:42:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0UYZMAjZdsbOMrPX+8Jgmz9tN62XrUtMBK1x3PbC+Aw=;
 b=jItD/U1qJYw9/i3ZAVDqbqvnz0gBe2YaSHsQ/iPD81NemEub61cK4tgBAqcwlHgTfo
 00EFG12gBmfJ49sxF1L7Ycjw11JeBJdcTb5a5/215ch4038nYD8owujmrq0ZzQLocsyV
 yXsHf+BKa3VT/iRDgM63hNWl/Gifp5otWEb11sHAMdJLNwqK0NjDhLz8EIXgb5RoudPm
 QJkszpOCLmj64rPb0Jxi3I+LPq/MvAW14Y0MndOA6/HIAyMbT0aayRlZbeHYqFLUDaTq
 FGGEeIQoYdOGouokziNM7nrUIrftx8N/PMqNFm4Eqgb6z8BWU7GiDUnoUKLEkZGsUt1M
 7lDg==
X-Gm-Message-State: AOAM532RHMxuDPqQEjbj0o+NksEjpWWdZAtBvmy9f8qH3AUqrb6I+9l5
 qwyBcGkZ1nROqyLVXLUMibc+OtJwYIObsLnCGOzVGXigmRVj9GOKGpQu6ZTeWkYm1NO/fi6FtFx
 fn4QIw5j+0vQV
X-Received: by 2002:adf:fd8a:: with SMTP id d10mr19953667wrr.85.1604328175170; 
 Mon, 02 Nov 2020 06:42:55 -0800 (PST)
X-Received: by 2002:adf:fd8a:: with SMTP id d10mr19953642wrr.85.1604328174982; 
 Mon, 02 Nov 2020 06:42:54 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id b8sm1715681wmj.9.2020.11.02.06.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 06:42:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH-for-5.2? 1/5] tests/acceptance: Restrict virtio_check_params
 tests to X86 target
Date: Mon,  2 Nov 2020 15:42:41 +0100
Message-Id: <20201102144245.2134077-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102144245.2134077-1-philmd@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>, Aurelien Jarno <aurelien@aurel32.net>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BxWtQodD7+tX

We disabled the virtio_check_params tests in commit 2d6a6e238a2
("tests/acceptance/virtio_check_params: Disable the test"),
because these tests were making multiarch CI fail (virtio is
multiarch).

We took the big hammer, as we can restrict the tests to the X86
arch. Restore them on this single arch.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/virtio_check_params.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/virtio_check_params.py b/tests/acceptance/virtio_check_params.py
index 87e6c839d14..fecf1c094b1 100644
--- a/tests/acceptance/virtio_check_params.py
+++ b/tests/acceptance/virtio_check_params.py
@@ -42,6 +42,12 @@
 
 
 class VirtioMaxSegSettingsCheck(Test):
+    """
+    This test should be multi-arch, however only X86 is implemented.
+
+    :avocado: tags=arch:x86_64
+    """
+
     @staticmethod
     def make_pattern(props):
         pattern_items = ['{0} = \w+'.format(prop) for prop in props]
@@ -117,7 +123,6 @@ def seg_max_adjust_enabled(mt):
             return True
         return False
 
-    @skip("break multi-arch CI")
     def test_machine_types(self):
         # collect all machine types except 'none', 'isapc', 'microvm'
         with QEMUMachine(self.qemu_bin) as vm:
-- 
2.26.2

