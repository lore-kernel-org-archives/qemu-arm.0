Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD54E67A8D
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 07:42:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxKP2-0005Bb-SB; Tue, 03 Mar 2026 02:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vxKOz-0005Ae-1n
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 02:42:46 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vxKOw-0004PB-Vh
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 02:42:44 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48372efa020so45857105e9.2
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 23:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772523761; x=1773128561; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qYw0v4dAfqI0Ioj085Isp7luoBjOrSq2PJeFJzeo5jc=;
 b=wbzuu07zQuyzcGKMwYk+Y3mf0+WOLtAYjOBwQqsr2OEukg+rRs2vvW37jx2qtVE8Bc
 W3foYKd5x9EGK7ao6xbalPqN/GaN1y8jK9QfsU7z/KAY4vS5taTthScnL54md86/R1SD
 K38G4z8TOt+5BJZ2ePxfMKiEdIec0JpuhZzdoZ2644gv7QttOj26zreNkEa8CDmx48QQ
 OGrz65UWrlPrSijmbo77NW8eR7HBWgrN7VXNuhY6ei6Eu/eaZ0AGkaj7hLojOFxjm40a
 kmcpfBSe3XNH0+ADhtFVcYyt1wI/zua3Zbw3wmn/C4JJldY0Hk/IK8dxtXNX5Mntz75E
 dShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772523761; x=1773128561;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYw0v4dAfqI0Ioj085Isp7luoBjOrSq2PJeFJzeo5jc=;
 b=oLuiP36B6bCUiNBLzQSM8JRAYhzkTFUcnaxFx+3IedWDANExzQEWCStbIrLXggJC/j
 yfXBX/TjnRVzQcpPPW6TUZAf+PLmQTYg79eIw5hd84fnOH6nCRyMUAZjWjlVeQDS3IaA
 0dMQdnLGw02/KZPxf2S/56mE546RDm7SpK23xMhe9FF0IO+g5eQR8ne6PyUz722+vSRH
 8uvzljAdn2nyRzQnyGTISt7byZLm+FyLOWxU+yTS9MXgcqqXowEIpr5diAshuFNWw07s
 zY2pxjR9YdrCdyeNdZD4IoFuQf4MIS06c9YWLNIaJnyb37JW7hMA4P0sanMIm6EmpuUP
 cnRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4S35fl8Rw0acB+H0myUpVoiv/M7b0eu5rNnv+dY+junNdbR+zh9z6I8RBAteFP3azHB/8K+6gnA==@nongnu.org
X-Gm-Message-State: AOJu0YzeZ5nmTcqJ2oP63X5fs79PhmV5sa671B3Sx7rPOxmPpdOo0OwV
 +4lSfoKnG67sI6o84cpv56++iWPlRFst5t9gpHVa/bZtsnp3ofaQIpXP/pA50Rms80w=
X-Gm-Gg: ATEYQzzX8PJrX5itxsWd39dHfyGi63Krr8N4yOHY3LI/3sQMV4TvUscvmH7dujHIlj2
 LSM7R/5xqUbDcURLXVg31GiKGLj3SBozyNuj1fr15KOPgMKwfWDuJYxIMRKQic/hYznSToinpY3
 TaWfomwNNEMnFaUBC5VoErxW129jLSIMOIKaZ7lfur15NYugvAQEnKfQ82VD3W6w0CSA3Jx4CTP
 2KCvrHsxaH6AWcmpQzRnXsQJzp87r3B5WS6GMU8WYTfgVxicAe3tt+CjrNnOK/GvqCJKVUB+Q4Z
 /e/TTON9XZ6Iup9HdOCMTnP0RhL+aeL/HfNGbBA6+7s2FHGuF5O2UL1pTByWOcae1R8ljczMrYb
 gEhJNUFLdAWsTZ56XSlrDwJNRQ3QotDxsyBJgDbdydzLJLIJyRIqx/lHnGUf6L4hcH+A9AinBTl
 nP8FeTwNhh5I4AOIeW7ELdsjJMEkU5D3Mly0/IjQXTFFxIdfSUu/EzUTdEudi8sxpj7M7MNVE8n
 ZAaMb01WBpGpxiWFLQlBjAa1dBvsQVPjfP7E9k=
X-Received: by 2002:a05:600c:8108:b0:483:7907:ea02 with SMTP id
 5b1f17b1804b1-483c9bfa9eamr274259995e9.16.1772523760866; 
 Mon, 02 Mar 2026 23:42:40 -0800 (PST)
Received: from [127.0.1.1] (ppp-2-86-215-248.home.otenet.gr. [2.86.215.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd6f26d7sm475943045e9.3.2026.03.02.23.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 23:42:40 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v6 0/2] arm/hvf: Add SME2 support
Date: Tue, 03 Mar 2026 09:42:29 +0200
Message-Id: <20260303-sme2-hvf-v6-0-b473702d8287@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOWQpmkC/3XOwW7DIAwG4FepOI8JmwBhp73HtAMBt0Hakgom1
 KrKu8/tZUzZJF9+y98v30SlkqmKl8NNFGq55nXhYJ8OIs5hOZHMibNAhVYBDLJ+Esq5HSUo46y
 D0RsEwefnQsd8eVS9vXOec/1ay/XR3OC+/aOkgVQykjeexzptXz/yEsr6vJaTuLc07KXpJLJEi
 mEYYUqOaCf1j0S0ndQsKfD3Ok00BdzJoZeukwNLnQJpCDA6m3bS/CcNS4hWBY8eVBx/yW3bvgG
 K7UxIiQEAAA==
X-Change-ID: 20260114-sme2-hvf-105767189521
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 =?utf-8?q?Phil_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2067;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=g3jcVkG6n1C5Dc6Rght9i1yM9ZLBNPrz46QbLWi+4Ng=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQnBwcER2RlpVM2FCMlJaNzNGT1NBMjd0b1JCc09QCk5YNHhnWW51eHU1c0tQVktI
 UitKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYWFhUTd3QUt
 DUkIzS2Nkd2YzNEowTmNpRC85VjJzc2NHaldra2hhcURUK0liakNoeUNReTc0aUM2U3JNaGpvbg
 pVc01CNXF0OWhEbm9idUJ6NmFFOUVrNlU3UklXT3NMT0I5d1QySVErVWZ2TGRGcXhmcnR6M09mc
 ENaeVA3N0RXCklydWhPMERpY3NzcEtxM2lEalBWNVRQUVFjRnJxRE01N1ZFb00wNXZOVUR1QllJ
 b3BzenVESnY2WUVkUnBpbmYKSGxCMm9XU2hmcUwycFZjRHEyVk9KZCtlVVVpR1ZrYStmSDBxVWt
 3WGE0cnZMRGszVC9CT2lzeGx2OWN4amU3Lwo1MVJTVnRDWU13MjdQb1RMSzY1NWZDVDV2bEFpYV
 FKRWRnM2JjMXJtdUJKeFFUWTdWTVYwQ2laeXFoVzRCRnYwCkZmSStYSUc2a3FXcXFrR0VmNlBnc
 G9NOWlnTVE2d2lockhLNUJCd0J6c2VvRWxrc2pTSVV4YXpqanFYT0FUL2IKd1J4RnBsNFJPZ1ZH
 NE1vWGpkZ29LZHlCeWdVVndvRE4wTGRNczJROUdUSFBRUXNrbFRCRmlBcjBTQURqWGwvTQpoVnp
 iaGUxYytlWkhRK1pjc2ZPUEEzVDVXTjd4eHE4dFNNcG1aamdvK2NWMHpmbjVoQ0p4SE4rZlhONU
 VNSXdkCkRRNEFLdHdDU2VxRW5ydFBDTUU0LzFVZWdOMUxPRXNqRm5aU3p1cFR4dzJtb1hYNjdUZ
 E9keDR3OVNCa29YMXEKNVJocGN1UW1WbGZkNFFBcjlOOVFxK1RWZFl0TnoycVhMczk3aXNUWkRx
 cUxpUDJFWDVxMkdUcDRCMEFhM1hpdApsTmk1VU8rMWtXODlmckdEaEV3Z0t3cWxHb1NQMElkTnd
 GL1YyRTFwU0QyL3daU3N4OHpUenZ0WmhHalJjRFd6CmprYjAyQT09Cj1rMU9tCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_TRY_3LD=1.999 autolearn=no autolearn_force=no
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

M4/M5 Macs support SME2, and HVF exposes this functionality in its
public API.

Add support for it in QEMU.

This was tested by running an SME2 benchmark from Arm [0]. savevm and
loadvm during the benchmark's run were used to verify migration works.

[0]:
https://learn.arm.com/learning-paths/cross-platform/multiplying-matrices-with-sme2/1-get-started/

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Changes in v6:
- Remove host isar adjustment (thanks Richard)
- Link to v5: https://lore.kernel.org/qemu-devel/20260227-sme2-hvf-v5-0-1c60a92910c8@linaro.org

Changes in v5:
- Fix NEON registers getting zeroed when loading vmstate by setting SVCR first
- Link to v4: https://lore.kernel.org/qemu-devel/20260227-sme2-hvf-v4-0-3dae31a1876d@linaro.org

Changes in v4:
- Set cpu->sme_vq.supported in hvf_arm_set_cpu_features_from_host (thanks Richard)
- Removed two rogue lines that were smuggled in by git-rebase (thanks Mohamed)
- Link to v3: https://lore.kernel.org/qemu-devel/20260226-sme2-hvf-v3-0-ea5763dbeba2@linaro.org

Changes in v3:
- Rebased against master now that it supports SME-without-SVE setups for
  gdbstub
- Link to v2: https://lore.kernel.org/qemu-devel/20260115-sme2-hvf-v2-0-2eca481bd7ee@linaro.org

Changes in v2:
- Added stubs if hvf 15.2 headers are not available (suggested by agraf)
- Link to v1: https://lore.kernel.org/qemu-devel/20260114-sme2-hvf-v1-0-ce9599596736@linaro.org

---
Manos Pitsidianakis (2):
      hvf/arm: handle FEAT_SME2 migration
      hvf/arm: expose FEAT_SME2 to guest if available

 target/arm/hvf/hvf.c           | 312 +++++++++++++++++++++++++++++++++++++++--
 target/arm/hvf/hvf_sme_stubs.h | 158 +++++++++++++++++++++
 target/arm/hvf/sysreg.c.inc    |   8 ++
 target/arm/hvf_arm.h           |  41 ++++++
 target/arm/machine.c           |   2 +-
 5 files changed, 505 insertions(+), 16 deletions(-)
---
base-commit: d8a9d97317d03190b34498741f98f22e2a9afe3e
change-id: 20260114-sme2-hvf-105767189521

--
γαῖα πυρί μιχθήτω


