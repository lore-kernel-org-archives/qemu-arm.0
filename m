Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC220CAC592
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 17:51:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyZp3-0006va-EG; Tue, 16 Sep 2025 13:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Y6PJaAYKCB4SO5CHTAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--yubinz.bounces.google.com>)
 id 1uyZp0-0006th-Vj
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 13:50:30 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Y6PJaAYKCB4SO5CHTAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--yubinz.bounces.google.com>)
 id 1uyZoz-0008A0-Gw
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 13:50:30 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-ea3dda83840so3378300276.2
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758045027; x=1758649827; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rVlErkAKc50MZMZDYr0nE/2HAp3uCy7UnfuAK6J/Eh0=;
 b=rOMKTZ+af+6hvOjhhlWUtFxBXQraUdy5JKnA1WOnlsNGOxRhPOPUXikMR1JjC1kaF8
 FpI+z3Eu5MP1diCcreZRYfdFMQD70qv1t6QBRXQeFCBhb/5ovNDQfdI2PIrt99SbcmeA
 9ilkIp9QrT7MYCo2fygapD8HCKzKd9PmTsQbGSgoRHcxvHemB5t0jLWv7vF4F1i9Z3UE
 7EtaVdr4NuXitNYOt80x9r0AAhGdaDhaqZaJ+N0YDqXcjkIUx9P1ON+F93iB/dDpetkN
 7XMISISMkiQUsiyjkilrzAS4UT9M7fgkH92BnyQ0YMrCZ5Bp13Tb4DYLvM+9yzxogQeO
 2i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758045027; x=1758649827;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rVlErkAKc50MZMZDYr0nE/2HAp3uCy7UnfuAK6J/Eh0=;
 b=BIsNaTmnkVNp7c5Uj91BEdODjrNsGpCCHvRt6hF+kX/rPa4qJelvLBrIEleUbEMlP8
 D0dmFtKEndnybNOKAFm18stY3CG/fG6x03g0l1u+gGq6ve7pjUZVKz15VEpmcINAvwlM
 THOLd8l0ET2Zlz/0/020ik1NTYCrhDwfBDEaG+UcrmPbIl0Uclydl1ekzpFnjvwNgAqa
 8g6do0d1jZAbVHFtg5JM6ZTDC0gQgPQJs4Fch8bpr2gozYbvThXYVHqHAOlzLUMDrsN3
 rDqiWH88LF7Vfn4Xyz2SEgATfo9fSIL0o+YMfTRNsBLEBe0m5nSU2mr7CH5m7VrkbsBD
 bglw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUftDXxZF5YJQI8shgxxyi46fvCBubhec40HBwbpyOcfRZPppKamblwlgD2rayQMmBR3bHeExQHZg==@nongnu.org
X-Gm-Message-State: AOJu0Yx3QI58+kClY2KLAlJnTSSBegQY03MZwnOh+o/mCJPF7znzAJkI
 yxnL7nUocjCak1N57g0Smiip6+DKQ2gnTymXhlPybgfwbbEWDU+TFEAvlx9HtL4W0PaE+9V6e/s
 YJKmDPA==
X-Google-Smtp-Source: AGHT+IGN4ZKUQFs8/oLG+fRBfUoUkdh3rLmQENSz6qpfnt3vqYO84J/Am9XPes8XlzIJeqAS8VC4q2EI/Es=
X-Received: from ybbgr6.prod.google.com ([2002:a05:6902:6206:b0:ea5:bb58:2a02])
 (user=yubinz job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6902:2d05:b0:ea4:156d:2cab
 with SMTP id 3f1490d57ef6-ea4156d2eccmr6513816276.0.1758045027069; Tue, 16
 Sep 2025 10:50:27 -0700 (PDT)
Date: Tue, 16 Sep 2025 17:50:14 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFajyWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0Mz3cLSxLySRN1Cc8Mc3dTUgqL83GJdg9SkZLNUAxMLsxRzJaDOgqL
 UtMwKsKnRsbW1APUixodlAAAA
X-Change-Id: 20250916-quanta-q71l-eeproms-0ebc6e0486d7
X-Mailer: b4 0.14.2
Message-ID: <20250916-quanta-q71l-eeproms-v1-0-3648692cc441@google.com>
Subject: [PATCH 0/2] Add drive-backed EEPROM support to quanta-q71l
From: Yubin Zou <yubinz@google.com>
To: qemu-devel@nongnu.org
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Yubin Zou <yubinz@google.com>, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3Y6PJaAYKCB4SO5CHTAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--yubinz.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Overview of Changes:
This two-patch series introduces I2C EEPROM devices (AT24C64) to the
quanta-q71l machine model, representing the Baseboard, Frontpanel,
BIOS, PDB, and BMC FRUs.

Improvement to QEMU:
These changes enhance the simulation fidelity of the quanta-q71l board.
By modeling the FRU EEPROMs and allowing them to be backed by drives.

Impact (Before/After):
Before:
The quanta-q71l machine model did not include the I2C EEPROMs for FRU
data storage.

After:
The EEPROMs are added to the appropriate I2C buses at their respective
addresses. Each eeprom now can be associated with a QEMU driver backend
by using the `-drive`option.

Signed-off-by: Yubin Zou <yubinz@google.com>
---
Patrick Venture (2):
      hw/arm: add eeproms to quanta-q7l1 board
      hw/arm: enable eeproms for quanta-q71l

 hw/arm/aspeed.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)
---
base-commit: 190d5d7fd725ff754f94e8e0cbfb69f279c82b5d
change-id: 20250916-quanta-q71l-eeproms-0ebc6e0486d7

Best regards,
-- 
Yubin Zou <yubinz@google.com>


