Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp666284ejb;
        Mon, 18 Mar 2024 07:08:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUyhaDK31gov+xPdYKCPg3+z7ZGyohBj0APxjXeSbuKAtSrkzwyuYCbzZjvWxrVnhaRLeswteN+1ewmw6E3KcfR6lNkOyV
X-Google-Smtp-Source: AGHT+IEpBqkcPPUrxGrMwW65aL8J9iQPUTtHUizznh65YLhKtQ02vqGBvwRKmk986arAZBJJW8FG
X-Received: by 2002:ad4:538c:0:b0:696:2e6d:93 with SMTP id i12-20020ad4538c000000b006962e6d0093mr55324qvv.0.1710770933972;
        Mon, 18 Mar 2024 07:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710770933; cv=none;
        d=google.com; s=arc-20160816;
        b=LdLLVwLjAsIWHnurezXh0gVPDhxBaSyLm0lvrPX3/l22qIYgbnIW1bUvDmXAU6GAK1
         6Piu16A6ThsPXAtgx4mybw4vA/5WxBplqmq2eNrtpmpS1N93USfr9a/zKpRFIQXewmdM
         4sYwa5DsMJJvCo8HUxBihH+oYQOXdcp5zsh7XKP7kU2ilVOYUhcq/SrTccWNRE5dxnJW
         bGY4LeEbfyat/aXcTzulSgkscw/+GN9Pl2P8XuBwpc6yEaAuNx0JvSM6mI6vaW0Fkwq9
         bzaRvdl2/3fgcrsH0HDlFhHVofVnPDFyhDwLfCqr1HPvuNguSKOtCSL8phMrbg0/Zovu
         XCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=caJKMCVgz/4gnFbNz97BlPifioYjsyPV5gCVBsw/Wyo=;
        fh=LC/OdAGxp8XjCcxyMB5oH3DeKOnqJHpFVM0U3yCY+4A=;
        b=cnlqkgE0bc8rWgPOfbYFmGcXSmDs9uTXkOMpmLHCMj9pscv7DNY90a10vs2/y6emcU
         PKaXFeutIMTZfmgmYmrw4MEescADiRd4e67JddNjTPVIUaknTJnuOlgoaLfuAAvaWmoa
         KqgTv2q3eGc/yz5azcZ3gSBMZjwxybOC/HAflCnMScNRbtlF7h266y+asP1K5oJ5b5Kw
         +YGg39IZza2fEn6Ns5RI5NH15JBlzGsY6skHtabGOgqJ6KPiSc4RZtT3f78QOLWfMqD6
         KtXSSqJAOB0mva3ZG0mCq5pZj4sNoOoaZaabtWddZATnlN/1e/x4hce6dC0XRJKy6k4M
         MspQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gi7-20020a056214248700b0068f07fbcbffsi8576912qvb.43.2024.03.18.07.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 07:08:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmDf0-0001Te-Rz; Mon, 18 Mar 2024 10:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rmDey-0001TD-Kz; Mon, 18 Mar 2024 10:08:16 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rmDet-0006Fu-8C; Mon, 18 Mar 2024 10:08:16 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 61BD5260AB8;
 Mon, 18 Mar 2024 15:08:09 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id IlarQtBE3U9N; Mon, 18 Mar 2024 15:08:07 +0100 (CET)
Received: from [172.17.0.1] (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4B8FF26074C;
 Mon, 18 Mar 2024 15:08:06 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Mon, 18 Mar 2024 15:08:02 +0100
Subject: [PATCH v3 2/4] tests/avocado: drop virtio-rng from sbsa-ref tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-sbsa-ref-firmware-update-v3-2-1c33b995a538@linaro.org>
References: <20240318-sbsa-ref-firmware-update-v3-0-1c33b995a538@linaro.org>
In-Reply-To: <20240318-sbsa-ref-firmware-update-v3-0-1c33b995a538@linaro.org>
To: qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>, 
 qemu-arm@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.12.3
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: L5Iv02fBNZOF

sbsa-ref is supposed to emulate real hardware so virtio-rng-pci
does not fit here

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index cbab793455..259225f15f 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -132,10 +132,6 @@ def boot_alpine_linux(self, cpu):
             cpu,
             "-drive",
             f"file={iso_path},format=raw",
-            "-device",
-            "virtio-rng-pci,rng=rng0",
-            "-object",
-            "rng-random,id=rng0,filename=/dev/urandom",
         )
 
         self.vm.launch()
@@ -179,10 +175,6 @@ def boot_openbsd73(self, cpu):
             cpu,
             "-drive",
             f"file={img_path},format=raw",
-            "-device",
-            "virtio-rng-pci,rng=rng0",
-            "-object",
-            "rng-random,id=rng0,filename=/dev/urandom",
         )
 
         self.vm.launch()

-- 
2.44.0

