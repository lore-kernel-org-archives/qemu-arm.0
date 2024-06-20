Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1870290ejb;
        Thu, 20 Jun 2024 03:20:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwmH+M0eP6Po2dAlQN7BFgYfahIOCzGztntiLvSUFzH1/FWzuRLWGndgfJ0vOyn6uAozNgTrvdlzyOv9FqBxTxLUAe78v+
X-Google-Smtp-Source: AGHT+IHwVq1morEcn3gzJV1TL6D2IJAlmC6MGTrlUttr9i7/OGsTPpg/sq8JBcMfs0OJd/oF/WJA
X-Received: by 2002:a05:620a:4454:b0:795:573d:6192 with SMTP id af79cd13be357-79bb3ee353amr517812285a.77.1718878844435;
        Thu, 20 Jun 2024 03:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718878844; cv=none;
        d=google.com; s=arc-20160816;
        b=UatJ9RljZEokzkEwAnQ1Us+pk11nKABgnTOBXPTKXpg97mUJyKirErQNcI3uCfXdlE
         ord+A10ecWjF5gDmjQ3cM1+eL52flwntPKnO6RH9tScp7hPJuzW7QARNoUhLnEqqd7tU
         i9WWAoWOnoNZT/u3BGCGIskBjuT9H5VpTFCBX32Zc2HDHGlFVAmBQ+2dtWuFoFR8PUIq
         Ly2wygaMgYVtTSKnZZHJsdnIYwf4PY9yffNNX6ByenWEiZkcrbVA/7raEPeJmou2nBqh
         HU4+iXcUQZI15kcFWDEacJOR9+ogR1cBnLLWfSU9JMF73vxR0lVcd+hEaDAI35jErGzZ
         W1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=2AJE1qYqxwtxxBg7+lADhoMRVndOyx2JvS2Mmry6pT4=;
        fh=V5vxXQ+IqdfQGwyC5zGLWXOc0z8EtcFzLjSj1F25uQo=;
        b=AxiFvptlhm7TlojO3Hir+lDdSsFjjgJBZwf6hXTsCYEKdJQ9/DWJZbcst/stKQSKxK
         jli7BG0rpUs2htVjHocF+lmjRkF852TsWB8VGoWrXMw9k95ifykga3tN2pJXbBugnCo0
         q4jpahpistOak2xoIO1ew8KbRtbMiS8mYIhvmHSe6KCBEuOMa3h9huUutapxCDBTCRb5
         tyr1yuGQDGmto5i61V2J0aNzRq1jVjZvnCenlmgYPstwe0FXhxyfGEAwNBQ0YgZs8QAC
         34uZunM6xRoxke8vS7cksY2M5J2rmMTjMM+1azQ+Pft1/1RcEE8PGlwzIR8Qk7Bm/ESe
         wXLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bc396b5c5si178828985a.528.2024.06.20.03.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 03:20:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sKEth-00020T-SO; Thu, 20 Jun 2024 06:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sKEtg-0001ze-7Z; Thu, 20 Jun 2024 06:20:04 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sKEtd-0001T3-Ph; Thu, 20 Jun 2024 06:20:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id A24CF2619F3;
 Thu, 20 Jun 2024 12:19:59 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id A8L72k9JCi3L; Thu, 20 Jun 2024 12:19:57 +0200 (CEST)
Received: from applejack.lan (83.11.22.244.ipv4.supernova.orange.pl
 [83.11.22.244])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id BE88D26071F;
 Thu, 20 Jun 2024 12:19:56 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Thu, 20 Jun 2024 12:19:48 +0200
Subject: [PATCH v3 1/2] tests/avocado: update firmware for sbsa-ref
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-b4-new-firmware-v3-1-29a3a2f1be1e@linaro.org>
References: <20240620-b4-new-firmware-v3-0-29a3a2f1be1e@linaro.org>
In-Reply-To: <20240620-b4-new-firmware-v3-0-29a3a2f1be1e@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>, 
 Rebecca Cran <rebecca@bsdio.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mwIoAuBLbPBn

Update firmware to have graphics card memory fix from EDK2 commit
c1d1910be6e04a8b1a73090cf2881fb698947a6e:

    OvmfPkg/QemuVideoDxe: add feature PCD to remap framebuffer W/C

    Some platforms (such as SBSA-QEMU on recent builds of the emulator) only
    tolerate misaligned accesses to normal memory, and raise alignment
    faults on such accesses to device memory, which is the default for PCIe
    MMIO BARs.

    When emulating a PCIe graphics controller, the framebuffer is typically
    exposed via a MMIO BAR, while the disposition of the region is closer to
    memory (no side effects on reads or writes, except for the changing
    picture on the screen; direct random access to any pixel in the image).

    In order to permit the use of such controllers on platforms that only
    tolerate these types of accesses for normal memory, it is necessary to
    remap the memory. Use the DXE services to set the desired capabilities
    and attributes.

    Hide this behavior under a feature PCD so only platforms that really
    need it can enable it. (OVMF on x86 has no need for this)

With this fix enabled we can boot sbsa-ref with more than one cpu core.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 6bb82f2a03..e854ec6a1a 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -37,18 +37,18 @@ def fetch_firmware(self):
 
         Used components:
 
-        - Trusted Firmware 2.11.0
-        - Tianocore EDK2 stable202405
-        - Tianocore EDK2-platforms commit 4bbd0ed
+        - Trusted Firmware         v2.11.0
+        - Tianocore EDK2           4d4f569924
+        - Tianocore EDK2-platforms 3f08401
 
         """
 
         # Secure BootRom (TF-A code)
         fs0_xz_url = (
             "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
-            "20240528-140808/edk2/SBSA_FLASH0.fd.xz"
+            "20240619-148232/edk2/SBSA_FLASH0.fd.xz"
         )
-        fs0_xz_hash = "fa6004900b67172914c908b78557fec4d36a5f784f4c3dd08f49adb75e1892a9"
+        fs0_xz_hash = "0c954842a590988f526984de22e21ae0ab9cb351a0c99a8a58e928f0c7359cf7"
         tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash,
                                       algorithm='sha256')
         archive.extract(tar_xz_path, self.workdir)
@@ -57,9 +57,9 @@ def fetch_firmware(self):
         # Non-secure rom (UEFI and EFI variables)
         fs1_xz_url = (
             "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
-            "20240528-140808/edk2/SBSA_FLASH1.fd.xz"
+            "20240619-148232/edk2/SBSA_FLASH1.fd.xz"
         )
-        fs1_xz_hash = "5f3747d4000bc416d9641e33ff4ac60c3cc8cb74ca51b6e932e58531c62eb6f7"
+        fs1_xz_hash = "c6ec39374c4d79bb9e9cdeeb6db44732d90bb4a334cec92002b3f4b9cac4b5ee"
         tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash,
                                       algorithm='sha256')
         archive.extract(tar_xz_path, self.workdir)

-- 
2.45.1

