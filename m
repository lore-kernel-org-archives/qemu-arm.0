Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB6606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y3FHA2Lp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSkw-0005jO-Pt; Thu, 29 Oct 2026 12:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSkp-0005fW-Rf
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSkk-0000Ww-31
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:27 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a218c463d1so15709725e9.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793290393; x=1793895193; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0JbuIWhW1BcJHm1QAY/X2j2Jm9tDF/6TriAlWiKBCIw=;
 b=Y3FHA2Lp3qLmo0Gdk4iaW06wyCXXz+JeJLxI6Bsx4Jv8kiIUBL/6sCWqiaShgeGG88
 Bx1Eh1HKdnzIsNNaUHJ9Zb4tG6Lr69BANS8517x2PeSHViHfGpkMPqnJ5Yzf8gbfgDWB
 89CbkbRoIVzGXPkpTtKicDtwx71rb5+uJmrXWjNxDPGIrVdY693gWX2Heoe9NSuOdbHD
 WAgjXiwXMfpjIhNMDyuMmQ3PqcqJZrNitYBp87p+Y3Ot1AfzNvKCR7TJEzfHwk/Izc5f
 kCmJ3wcR8NxnLjgKmu44q+UguRoAB/Hl1LajggnqBXQTgn8uSrTxLsBd+mBVWeFoCpHa
 OwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793290393; x=1793895193;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0JbuIWhW1BcJHm1QAY/X2j2Jm9tDF/6TriAlWiKBCIw=;
 b=hYh1aeQeS4kB4Ic8wM1SNWd218bHrP7Kuamo2TzLbMf72eQPIifMa4qOAi6Pa5wAcQ
 cWhv78rVr/RFqPVptgCQDiV+A1hOirMyWwx8a7jJSw3erjyQLQ2zX1UshQf5ZqJLWVYq
 abiBv0Cs3O7GuzYnyEk8TR40QJWNmIMGCiwBCaWrHg5PCVA3+qW5bWy4sXHP5PbHQ1bb
 VD3cK30FkOvjgl1RNqgMk3QVeECw7+AvmFi8zJ2hKdI8UXIyNU4GLc7QMAZFbX35vx5R
 3GioMUa22jeqVM0TtdK78XzynPk1o9bw4Fm/zW1D8YEYhECA7eFcRiS9BxoM4UcvzbxH
 26EA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzu5C6UFGUbG4VRL11u7K9PRpW6QuHyd4+aU7PfP5JP/tQOp3hu/DP6gJ60WbKi5Ah+WfiJkMTSiQ==@nongnu.org
X-Gm-Message-State: AFq9FYKBCnDUWASOSeDC5BERqd1RzkVo/cVPrTO+2wz1s7NbWMrLEAj/
 IaZ5Sn/mocl2BK2whKaWGF2LUYZwbkpEnYkII2Dw48GmdNGBuyCDK+cmMlLyDD9UopaDBrdfpvA
 FW9zROis=
X-Gm-Gg: AYBFou1RBeB+BElG36pOa99ECEhsz0FuOehf2zzY7bvgsQl7J4DBsGW3gbbnbeq5cR3
 IBDFutwS3iVgEHGKYNsaHUb0XnyyQAtm7e3MtutOxsJdy9pfweF6kR7YQ1bHSf0lR4NvCjzu4ID
 Nn0uXySdSOOeZwZtU8Pby1xN+pfSjU/7PtsYrfS1dSY5QaNkp3i0PlNozCjROtBQWuDIgGfOo9b
 OqEHIPXQ7utVggrDOxK86+n3gQU7bgi/lkgbk99pWbFGuyiGZZQeCb/DjOPLbkCLICcCYfjjJ7d
 ep8vqiFFC9rft8pp/mlVXxlXb9p4C7IQ40IcG23ZllrdTaM5nlKFNESX9OplGTZgal1OYeQ+XXd
 sHUmWujRtB+S7cFDE1WbPzP++f6gSzGed475Ksbh0O/BFtDcYcB+AwAHOUeaKgZCG1GSUgf4gIN
 bH/IEWZ/8yzUor4Ny3mbKXmS8XW30dEeUYSRAE+I2jdqhtUIb+iyU308MNIu3yy6sMGcBsiohDM
 +ecRM//MDrKKOYcWYTkB149u2BCIpbeQs5as4qIMBWdozruNzbAnX2bd7DklJ4eW+F/wmpUbxJU
 78SMO/NyGt+PRAB4BPebwQ17xiXe
X-Received: by 2002:a05:600c:1f93:b0:4a6:30c3:1114 with SMTP id
 5b1f17b1804b1-4a96667dd5amr122952925e9.12.1793290393361; 
 Thu, 29 Oct 2026 09:13:13 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6df960f8sm90356f8f.25.2026.10.29.09.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 09:13:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 49C105F8CE;
 Thu, 29 Oct 2026 16:13:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/8] tests/functional: fix call to common_tuxrun_gdb
Date: Thu, 29 Oct 2026 16:13:04 +0000
Message-ID: <20261029161310.2065290-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029161310.2065290-1-alex.bennee@linaro.org>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I applied a last minute review fix to the api as it was not used but
evidently missed the one place where it had been set by copy & paste.

Fixes: e0a7139b2134 ("tests/functional: add tuxrun kvm gdb test for s390x")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/s390x/test_tuxrun.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/functional/s390x/test_tuxrun.py b/tests/functional/s390x/test_tuxrun.py
index 3821f985196..1dd662aaaf0 100755
--- a/tests/functional/s390x/test_tuxrun.py
+++ b/tests/functional/s390x/test_tuxrun.py
@@ -55,7 +55,6 @@ def test_s390_kvm_gdb(self):
                                rootfs_asset=self.ASSET_S390X_ROOTFS,
                                symbol_off="0x3ffe0000000",
                                drive="virtio-blk-ccw",
-                               haltmsg="Requesting system halt",
                                accel="kvm")
 
 if __name__ == '__main__':
-- 
2.47.3


