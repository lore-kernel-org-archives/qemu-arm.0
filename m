Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp666006ejb;
        Mon, 18 Mar 2024 07:08:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuykR+/8rL+tIgIKer7tRJ6EduOAwGGZFhXxJcfxup2WTgU8a1em6j8PK+XHY4zyH1PsfCp3xbv4UoY8Ew38l1zIx0GXQI
X-Google-Smtp-Source: AGHT+IEVSLi/pW4zlPDrAXlOW0t9/bLQEgvPTLWPw5Vulpcx9wRdHiQHWeORMvRl32fTihbMdBP0
X-Received: by 2002:a05:620a:5653:b0:789:f1b7:c612 with SMTP id vw19-20020a05620a565300b00789f1b7c612mr6901620qkn.4.1710770912222;
        Mon, 18 Mar 2024 07:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710770912; cv=none;
        d=google.com; s=arc-20160816;
        b=Ad+vi6YJu/Y5lh7ksMAMkRwg+C0UwsH0AhSH5a/+ntbbmEsx2tpjOILcn8m3VZrCt4
         5vJaAIhfCQRd4Pyr7emSo58oJxqCX7og6Q/0Bu+DVLY34k6RGZujm3s7h1jrFLoZjNd4
         OdxqhMmHZztlYDLaJmtHhs6hF77ngF27phQV+dE/bHVXPlbhbs2nvnXrc8jwxqtFdGCF
         V8h3Oztci7S+y5SOhcl6rPWSdo4UWIhlPB9Z+fMvfHlmXTwieH+4Vf6BHrgOP90BwZ7q
         ZcZSLlJ4YL0S+iDKS6CZZV8eehgH0ZXAeg/LsvUNUpSQcq0dqdl4/tILDcIU0ZpD/sKb
         EkGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:content-transfer-encoding
         :mime-version:message-id:date:subject:from;
        bh=INH9iCv9W/TPNvyTBzKGJyEOBkv/lAyqU6hP86QBLOc=;
        fh=LC/OdAGxp8XjCcxyMB5oH3DeKOnqJHpFVM0U3yCY+4A=;
        b=telm7PA9BCHkA8VI0jrDTuYy0uIj7hLsVQ9dvzmRZt4T1A1mZ6vY68EtPtGbLdj2MX
         VCbufkeBRAVCzjHCLN8BGcF1K8E28WkLazjYURctiQj0MVwpc+g9CcXE4eCbLuYc9oBa
         AHQb3hr2iTF3ywR7sjiqkz2wmPyBAYjWBjfdo56l2KAePkdtELX7tHOE+O02UR3DQbCk
         09PCEa2ro0Mnse6TsCZjop0KlgHW29/3ZQdDOWvcPI6FLMQyQcviaSq85OiH9K0oOa91
         z6i24iGIu5+IY1wg7bPqU1YzKK8SEipIhtLDAfEPQPzrTfp+ZA1Wqeov0qB5Vk9Eigdh
         cNOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 24-20020a05620a04d800b007883231ca49si9297713qks.130.2024.03.18.07.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 07:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmDf3-0001U4-2g; Mon, 18 Mar 2024 10:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rmDez-0001TQ-W6; Mon, 18 Mar 2024 10:08:18 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rmDet-0006Fo-C5; Mon, 18 Mar 2024 10:08:16 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 8A950260CC8;
 Mon, 18 Mar 2024 15:08:07 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id WnRG1pdPX_zP; Mon, 18 Mar 2024 15:08:05 +0100 (CET)
Received: from [172.17.0.1] (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7367C2600DA;
 Mon, 18 Mar 2024 15:08:04 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3 0/4] tests/avocado: update sbsa-ref firmware to latest
Date: Mon, 18 Mar 2024 15:08:00 +0100
Message-Id: <20240318-sbsa-ref-firmware-update-v3-0-1c33b995a538@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMBK+GUC/43NSw7CIBCA4asY1o7hTXDlPYwLCrQl0dJARU3Tu
 0u70o1x+U9mvplR9in4jI67GSVfQg5xqMH2O2R7M3QegquNKKYcM8IgN9lA8i20Id0eJnm4j85
 MHpRQ2ulWOqEbVM/HuhSeG32+1O5DnmJ6bZ8KWad/oIUABk+kVJhZwSk/XcNgUjzE1KFVLfRT4
 j8kWqVGCGWFFEJb9yUty/IGeDTaXQsBAAA=
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
X-TUID: rVmtw2CrnHq8

Updating sbsa-ref firmware for QEMU CI was manual task. Now it is
replaced by CI job run on CodeLinaro Gitlab instance.

This patchset updates to current state:

- Trusted Firmware v2.10.2 (latest LTS)
- Tianocore EDK2 stable202402 (latest release)

And Tianocore EDK2-platforms commit 085c2fb (edk2-platforms does not
have releases).

Firmware images were built using Debian 'bookworm' cross gcc 12.2.0
compiler.

And while I am in that file I dropped use of 'virtio-rng-pci' device as
sbsa-ref is supposed to emulate physical hardware.

Added 'max' tests with 'pauth=off' and 'pauth-impdef=on' variants.

(01/11) test_sbsaref_edk2_firmware: PASS (2.51 s)
(02/11) test_sbsaref_alpine_linux_cortex_a57: PASS (23.72 s)
(03/11) test_sbsaref_alpine_linux_neoverse_n1: PASS (23.70 s)
(04/11) test_sbsaref_alpine_linux_max_pauth_off: PASS (23.00 s)
(05/11) test_sbsaref_alpine_linux_max_pauth_impdef: PASS (29.03 s)
(06/11) test_sbsaref_alpine_linux_max: PASS (80.69 s)
(07/11) test_sbsaref_openbsd73_cortex_a57: PASS (16.05 s)
(08/11) test_sbsaref_openbsd73_neoverse_n1: PASS (15.97 s)
(09/11) test_sbsaref_openbsd73_max_pauth_off: PASS (16.22 s)
(10/11) test_sbsaref_openbsd73_max_pauth_impdef: PASS (16.11 s)
(11/11) test_sbsaref_openbsd73_max: PASS (16.08 s)

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
Changes in v3:
- left OpenBSD at 7.3 (7.4+ is known to not boot)
  https://gitlab.com/qemu-project/qemu/-/issues/2224
  https://marc.info/?l=openbsd-arm&m=171050428327850&w=2
- added pauth variants of 'max' to OpenBSD tests
- Link to v2: https://lore.kernel.org/r/20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org

Changes in v2:
- disabled 'max' tests on OpenBSD
- moved tags to 'one tag per line'
- added 'os:linux' tags to Alpine ones
- Link to v1: https://lore.kernel.org/r/20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org

---
Marcin Juszkiewicz (4):
      tests/avocado: update sbsa-ref firmware
      tests/avocado: drop virtio-rng from sbsa-ref tests
      tests/avocado: sbsa-ref: add Alpine tests for misc 'max' setup
      tests/avocado: sbsa-ref: add OpenBSD tests for misc 'max' setup

 tests/avocado/machine_aarch64_sbsaref.py | 86 +++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 28 deletions(-)
---
base-commit: ba49d760eb04630e7b15f423ebecf6c871b8f77b
change-id: 20240313-sbsa-ref-firmware-update-7579d9f6d59b

Best regards,
-- 
Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

