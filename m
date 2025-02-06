Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1524196njb;
        Thu, 6 Feb 2025 05:12:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNEexIbG1yK9CHkZdWPfpNj8innfm58gXwN8fYdVGmus8RiwfOXow4vYQoH7oKFdsPRFO+7CgBb6bkRg==@linaro.org
X-Google-Smtp-Source: AGHT+IHty1r+TPUocqjhQBDwCxB3o1R+KLfaeENJ9fsV67zPKGlvz4+HgaHlk3xZk/e7A4d8ZV3i
X-Received: by 2002:ad4:5cc7:0:b0:6e4:3eb1:2bde with SMTP id 6a1803df08f44-6e43eb12de9mr18080516d6.19.1738847550294;
        Thu, 06 Feb 2025 05:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738847550; cv=none;
        d=google.com; s=arc-20240605;
        b=bumTIaG4rcQZ1wnaPQPk4TF2E+p2+q3M1REgbd4md1SwtWkIWs4Pk6eEK1HVCZ8vgv
         E5xKGS9Nq3qfismgKlABbqgkAYcyzNkwmlYqca3KZttW7P0IbluPtImL7irSZa1Lw+n5
         RT8UBQ0BuYX941SZS9ypGWtaTuRR73NXSXkrGHQFJkIdcDAm05Ew2U6ASbaeFIrr0cfN
         fJ+B0a9IKmB69E6/XonscnA/dko1OrMHTkFx474ILBQzGmGYwbIiOkqRUJnwA+cAAZHO
         +/RlUf7rmP1rQKXheAn4DGJmg7kQENOJR6wMtWh6cYG1aKEOJTzZ7sbzAR0x6fx/+AVL
         vhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ca93GC7mN6YPt3WWqji2t66DsugWAK2ak9CpDn3N/CI=;
        fh=7NsVx5R+L140HvZ0es4udPXCD2KdHoHcZm3kdyNBbE4=;
        b=kc6gbyrt22nLIeMIb4KZg5f3BcdHqPJ1iG066DASFhlXrVOfWCU92BQri7GvfAL+Z0
         1TU4CNPS1dJZZ2TdNzEVyzUozXmWxVQCvfay+/1fLsHMLRdaXHI9ymVdSL5oTY1uoC0R
         T+Y9F7ipNQ9kLAZrd1WYP94xZLN8WqZ84wsVWj1xXeJNCqxhMbMgpdgktgV0+XU24oks
         RaxAlY8XrWgAl/4QPx9ibVG9pc8zYvnwqJiwZEz4+9reBPHrBSZN5d1ydw8yijfRL+vV
         xjsGCKxDbNNkYtDOxlx3k/qGzilGYpgQ4Q7HfNu5RZ+J5BhDvQUoOi7Hhv7SXls5tpiv
         z1mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RURTQN8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43ba2d0c4si11532386d6.75.2025.02.06.05.12.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:12:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RURTQN8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg1g6-0006RT-P3; Thu, 06 Feb 2025 08:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fr-00061a-QO
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:12:10 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fq-0008Go-BB
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:12:07 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4368a293339so9689365e9.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 05:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738847525; x=1739452325; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ca93GC7mN6YPt3WWqji2t66DsugWAK2ak9CpDn3N/CI=;
 b=RURTQN8ctGT83eS/AVxCTh1cuivsavHE4nwcjcBi26kl/blahsMr3RoFSqr74nVmxy
 yZjSXeLWTuP6QBuRXNDAagNNspzOfJngGmvnZz28jZkRkrQaMtfxOSRhYsZ6fMm5wQ4s
 kh2T3sjT2jQGVeWJ72eSUvjsPg1w6nBapRk5uoCZ2ltqV+LTNectb8ZGxGZqETZI4VWw
 4go2bRxQcuJ5D9rJnueOzv+Or3130Uld3sENmuPkojKJD70jcgiq8iYvBeFZuweSl8gX
 6R50iUXJAg3DNWQdmvgZXMvsv3xPlORd5+AC5IdKu5QWDlwJ8l3BAjgnC4OTkGn9tnWv
 fqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847525; x=1739452325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ca93GC7mN6YPt3WWqji2t66DsugWAK2ak9CpDn3N/CI=;
 b=OkYJSjD1dDtvOzWO58Kd9v/CUwEpMAd8ZfAPoHSWm4nMMMVAqw2ZXoJHrCYtmMvxCS
 qBxl/AJy/lvlpZu1vaHNKE7B7MBc5w7ySeUZO6cH9KA8IhBrh0vJybkKYfPhP7nw5ZXB
 s+mfCoa2GuNxbUH58h/NBbceHO66PgkjEBknWiTtz6lMLvXO+f/kjeT36LmyYaIO4LYn
 FpJqmtZwU2HNH5bhScB8qKN4IRjTtxtWrDG8v2apyY64VYTJHcYqhH6jx3sBwxSC6Zjb
 el9/59/2ZCpiuW6zUbWkzkQYiPzniVW73KNMDerHKr3+AUEdM0k1laQu4RidNX0sZPq6
 2M4A==
X-Gm-Message-State: AOJu0YxsMAeFbEGRkVcrLDcl87X6GOvv7QkJY7wmQ1PraA9Bx7SubydO
 v532eGMVG8CI5uQ0S1ETNKiHyfLwWVmSG0hlClAU9rpUQcUQWP4DdqRbA6GYUb4=
X-Gm-Gg: ASbGncsZat+Z9WOhmPV5aBUCj0zAEQICVPkskQD9AIIHINZyXIVCBTZ2IpPb8GWVkFJ
 sclxycWFzU4yv8Nf0IoYoMrtMosPu5qXb4Nn9WVPzYfmRyuvYmJRPXmBMoX24mv70doCxFZVovy
 Oa3obHu9P5msEv1PiIwzgcI1KMHVI+bNnVZx72YJK5K/UahL+pCs0Q388TWqvDKFtHUwFCgGwmJ
 l+01lqDpRO4aLE3w01jEwFWwC86E16g/8FAB8aSbSEzZGWEWZwA+aPY5bqCoKeV3nj47ZqS92fq
 ebFEeHJY5YzGiQB+HkYR7SNDGpfXtrXNAS4cNECtoCTlDJKFg3+eu+f2SmOQyAh+Ww==
X-Received: by 2002:a05:600c:3511:b0:434:a202:7a0d with SMTP id
 5b1f17b1804b1-4390d569890mr50269095e9.22.1738847524879; 
 Thu, 06 Feb 2025 05:12:04 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd1af14sm1703873f8f.8.2025.02.06.05.12.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 05:12:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 14/16] tests/functional: Remove sleep() kludges from
 microblaze tests
Date: Thu,  6 Feb 2025 14:10:50 +0100
Message-ID: <20250206131052.30207-15-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206131052.30207-1-philmd@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SuPJJsAX/0p7

Commit f0ec14c78c4 ("tests/avocado: Fix console data loss") fixed
QEMUMachine's problem with console, we don't need to use the sleep()
kludges.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_microblazeel_s3adsp1800.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
index 715ef3f79ac..60aab4a45e8 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -7,8 +7,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
 
-import time
-from qemu_test import exec_command, exec_command_and_wait_for_pattern
+from qemu_test import exec_command_and_wait_for_pattern
 from qemu_test import QemuSystemTest, Asset
 from qemu_test import wait_for_console_pattern
 
@@ -31,9 +30,8 @@ def do_xmaton_le_test(self, machine):
         self.vm.add_args('-nic', f'user,tftp={tftproot}')
         self.vm.launch()
         wait_for_console_pattern(self, 'QEMU Advent Calendar 2023')
-        time.sleep(0.1)
-        exec_command(self, 'root')
-        time.sleep(0.1)
+        wait_for_console_pattern(self, 'buildroot login:')
+        exec_command_and_wait_for_pattern(self, 'root', '#')
         exec_command_and_wait_for_pattern(self,
                 'tftp -g -r xmaton.png 10.0.2.2 ; md5sum xmaton.png',
                 '821cd3cab8efd16ad6ee5acc3642a8ea')
-- 
2.47.1

