Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1784799lfb;
        Thu, 26 Nov 2020 13:50:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyh+q32BoES/DrkL4a105T66mOZ2bCay7X1cbjlwOqZa6HcXU235gah1I8F1b7JZDFHTdEG
X-Received: by 2002:a25:cbd2:: with SMTP id b201mr5578219ybg.437.1606427439205;
        Thu, 26 Nov 2020 13:50:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606427439; cv=none;
        d=google.com; s=arc-20160816;
        b=PzJjipJ/vp71ieSS+/RGXjH6lMtTkCDps9KkYhtEljMeoX7IrMpQI4OWDiM7lNTTcj
         RTYZBNY4AM06sKq93Yj1/jxCzyIJmvhbtlUuTO4sEe/Y/G4GYvmK291qm8CtkN9H5D+U
         BaYt46hAS2tPt0EDKe22w9kJs+KGsdI07fgX6VoHqY2SJiodcJh6iEAtr7muPYnRJvo+
         353bniNAIQG8Y30d7IN0EVP5VWr+Aw622M7jdiy1oSBlL81uEj3f28OMrp2ttOP4dbZd
         ohhgX6HvqKuhadBMpGNP/6v0j/vJrcVyTDbipfcQkdoBHp/2F8H8TPme9Kwl4bubW2jY
         7udw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=HQ+ij4fuKEw/WneDpIzcMpTLtHA7Y0aKmQKH7FuuIUs=;
        b=BdH7tyIMDWMF7Kc3mHLyOPqiB+zUEEPbQonTLWiFRDpFUt8bq5IfMYW0f9k+GCgA51
         ypp6PvEmB1NibC98exXlzc3V2DivMCgGtDIu5BSvsTtuuzya4vcG5Uo7bERMwdxH5jeP
         cseD003hvfCbxAWrTbknvHaIzKUONfQ88247y7l4z6jC6oWzfE7n2Q0RBQhc6UznSMhH
         wRlAjsb3QZRjwpWQCUMMpBcJH/X0EqOLXdUwhwDd+8CioM10CjznGdJQESEjKHpWy7cr
         Twfc4D/4OtrG/mr3uDXk6uIe6NdCA3z6cGwiBXstLFNRoNxLKNlZ3bqjOmuiSrGim5ts
         FWmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e193si2001099ybh.478.2020.11.26.13.50.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 13:50:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiP9y-0001k1-Io
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 16:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiP9j-0001jL-Vj; Thu, 26 Nov 2020 16:50:24 -0500
Received: from mail.csgraf.de ([188.138.100.120]:60506
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiP9h-0005jj-W3; Thu, 26 Nov 2020 16:50:23 -0500
Received: from localhost.localdomain
 (dynamic-077-009-187-158.77.9.pool.telefonica.de [77.9.187.158])
 by csgraf.de (Postfix) with ESMTPSA id 224CE390015A;
 Thu, 26 Nov 2020 22:50:18 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] hvf: Implement Apple Silicon Support
Date: Thu, 26 Nov 2020 22:50:09 +0100
Message-Id: <20201126215017.41156-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E4AT8zUGT+nJ

Now that Apple Silicon is widely available, people are obviously excited
to try and run virtualized workloads on them, such as Linux and Windows.

This patch set implements a rudimentary, first version to get the ball
going on that. With this applied, I can successfully run both Linux and
Windows as guests, albeit with a few caveats:

  * no WFI emulation, a vCPU always uses 100%
  * vtimer handling is a bit hacky
  * we handle most sysregs flying blindly, just returning 0
  * XHCI breaks in OVMF, works in Linux+Windows

Despite those drawbacks, it's still an exciting place to start playing
with the power of Apple Silicon.

Enjoy!

Alex

Alexander Graf (8):
  hvf: Add hypervisor entitlement to output binaries
  hvf: Move common code out
  arm: Set PSCI to 0.2 for HVF
  arm: Synchronize CPU on PSCI on
  hvf: Add Apple Silicon support
  hvf: Use OS provided vcpu kick function
  arm: Add Hypervisor.framework build target
  hw/arm/virt: Disable highmem when on hypervisor.framework

 MAINTAINERS                  |  14 +-
 accel/hvf/entitlements.plist |   8 +
 accel/hvf/hvf-all.c          |  56 ++++
 accel/hvf/hvf-cpus.c         | 484 +++++++++++++++++++++++++++++++++++
 accel/hvf/meson.build        |   7 +
 accel/meson.build            |   1 +
 hw/arm/virt.c                |   9 +
 include/hw/core/cpu.h        |   3 +-
 include/sysemu/hvf_int.h     |  69 +++++
 meson.build                  |  39 ++-
 scripts/entitlement.sh       |  11 +
 target/arm/arm-powerctl.c    |   3 +
 target/arm/cpu.c             |   4 +
 target/arm/hvf/hvf.c         | 345 +++++++++++++++++++++++++
 target/arm/hvf/meson.build   |   3 +
 target/arm/meson.build       |   2 +
 target/i386/hvf/hvf-cpus.c   | 131 ----------
 target/i386/hvf/hvf-cpus.h   |  25 --
 target/i386/hvf/hvf-i386.h   |  48 +---
 target/i386/hvf/hvf.c        | 360 +-------------------------
 target/i386/hvf/meson.build  |   1 -
 target/i386/hvf/x86hvf.c     |  11 +-
 target/i386/hvf/x86hvf.h     |   2 -
 23 files changed, 1061 insertions(+), 575 deletions(-)
 create mode 100644 accel/hvf/entitlements.plist
 create mode 100644 accel/hvf/hvf-all.c
 create mode 100644 accel/hvf/hvf-cpus.c
 create mode 100644 accel/hvf/meson.build
 create mode 100644 include/sysemu/hvf_int.h
 create mode 100755 scripts/entitlement.sh
 create mode 100644 target/arm/hvf/hvf.c
 create mode 100644 target/arm/hvf/meson.build
 delete mode 100644 target/i386/hvf/hvf-cpus.c
 delete mode 100644 target/i386/hvf/hvf-cpus.h

-- 
2.24.3 (Apple Git-128)

