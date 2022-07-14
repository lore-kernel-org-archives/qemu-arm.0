Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp666956lfp;
        Thu, 14 Jul 2022 06:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sakvhfZSJinperLw3AWofmtw0ybuirVlwHOZSr7Ucs/6MmFcqaIZHUuOCeuLiVQd+VM4O9
X-Received: by 2002:a05:622a:1d3:b0:31e:ab8e:ae0c with SMTP id t19-20020a05622a01d300b0031eab8eae0cmr7832078qtw.325.1657805026431;
        Thu, 14 Jul 2022 06:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657805026; cv=none;
        d=google.com; s=arc-20160816;
        b=KkMJuFztP//WMVOiHZoGJRBUjQ3Lijp0K0mJXP3RzTdshhtW7zXF6pD4uDRV67M8BH
         EqYeOlM/I8rSmJEaOZX87Zp5f+cOngyx95oz9nggrxnot+Q62qTfwMIxsPHc7ec2ySE7
         pBlb+IFPCu5afSkUyvFTDRoSGMK6+WBBFq1cS+qFn8yrEGxVDfk2/dq9RP135IyGbfa6
         MiwiSPTrA7fNhbEZrCXUYXlHphIMQPb+FLDFiVTpn0v+tJzNhiao/uOFsOkbMsudNhZh
         3VYYf47OhQbjwt7rWdytSuTdfRShqa9dvapUWS1Sfpuzxxk/Z9Z0xJxD7qqjaCZFDdkJ
         4o7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Hm6Vqd36HiGW6aIEn8mL/S4aOf9wNeOFchGwadxd8wQ=;
        b=MMwRLzwpqU97iikL76rv7/zDNL/5kpNJsQSjFYkoSZO7Ew1mT3YbaInNpeCSdzs1AO
         Om5gWbzL7l03N9IANx/z1PXK1B+JHz0X7bSVnBWe2MhXD5EvF9HsTzfwzzZYjkmu/72R
         vejEzVAH97zx7dfq8DQFdSo09oWlXpKq/U5w7yoYQ/eqf6pSNTDlZaUh/tdnEZkv1mZp
         rozSSSizkvcd7fjffYVEepqaBV4WW9DHjV1rMsAS3mBWvuty9J62ghdi0qtEHWHCUxPA
         At+c9VQQE4NwSIHEXuY5Rol74zHGySC9oiv8UY3pji3ZFlDNHfRbsRmhkjSjPDgG+vfs
         dM5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UKcn9MdA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs18-20020a05620a471200b006af5c503e56si861062qkb.455.2022.07.14.06.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 06:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UKcn9MdA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oByoj-0002BT-Oq
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 09:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByo9-0002Aw-BU
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 09:23:09 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByo7-0004ns-IY
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 09:23:09 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 i204-20020a1c3bd5000000b003a2fa488efdso2733866wma.4
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hm6Vqd36HiGW6aIEn8mL/S4aOf9wNeOFchGwadxd8wQ=;
 b=UKcn9MdAi/omtIb4OCE2m/wW3mNVhIOCYB39iAqZx+/JR6XJYtuj9H5l6dsqY01/Hw
 Tv9J8BYyz+spbCb9C68HLmo6AMBNUlLvYGJUlBOdsDSbo3YRBzoaWsCa6/tDK8pqzWQy
 xrhZHhvYg/w0eJFQtamZHRqiq6Vcz/ibJgkvhr7YMdftM5eb8Gv11yMGbuU/DQcHkWoZ
 mka9Tt0GB4aAOF2Krem6V8JGTsqB+IY2q6HXdogZ/x9kUXhCdmrNAaT9t0cVMnVaoZcH
 VQxG75pH/RA33hJLfaWgRpg8NCQimkA6iD6E05lzM1WkvmShe76D4H2auO+lOrrlafCB
 tHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hm6Vqd36HiGW6aIEn8mL/S4aOf9wNeOFchGwadxd8wQ=;
 b=Peq6tSogPymRTAe6SXVaSOusdE9knxQowGR1aFwSRB2U3WFgBRxVzLbuaD8MlMjMkD
 NrfudJECh14o/8iN2YloQouVeBWSaZXeBwSnFDuV5jjKwBE1I8OTbSpGPmSo3M2wnd97
 IQmYpDTq9ly6bk3qKub5mKupw3wYqu0GLPK05xwlGZbTmfCTfFFwKlgFSrIIu4KyXBP5
 43FYcGb0RprQwSuYnnzlRNtrcPhY6mCc8JEfEPfES093j6MSsACXEXU9Yrsq8303JzqO
 yiwrvGivScykMGo/VYDmgi7Cal6jDeuu4G8wZkGC0nwYmcX7LvYqdkR6NdxkI28GyJFT
 8oBA==
X-Gm-Message-State: AJIora+tjeB37wvUkSZn3GUHnHjnPoSYI/aSSJGZvNV7iwSEK3NogKfN
 oYyK2krNgIgMaCNKOqJ8D6VHqHHkugyzRg==
X-Received: by 2002:a05:600c:2c4c:b0:3a2:dd0f:fa03 with SMTP id
 r12-20020a05600c2c4c00b003a2dd0ffa03mr9083600wmg.18.1657804985918; 
 Thu, 14 Jul 2022 06:23:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a7bc40b000000b0039c5cecf206sm1925079wmi.4.2022.07.14.06.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 06:23:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH 0/7] target/arm: Handle VTCR_EL2 bits shared between S and NS
 EL2
Date: Thu, 14 Jul 2022 14:22:56 +0100
Message-Id: <20220714132303.1287193-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kg8oec9/jUmE

In https://gitlab.com/qemu-project/qemu/-/issues/1103 Idan pointed
out that our regime_tcr() function doesn't handle the fact that some
of the config bits for the Secure stage 2 translation regime are
shared with NS EL2 and stored in VTCR_EL2 rather than VSTCR_EL2. 
Currently the only visible effect of this is that if the guest tries
to enable LPA2 via VTCR_EL2.DS QEMU will incorrectly fail to honour
this for Secure stage 2 translations.

The final patch in this series fixes this, by synthesizing a
VTCR_EL2 format value for Secure stage 2 by merging together
the shared VTCR_EL2 fields into the VSTCR_EL2 value.

The first six patches get rid of a very longstanding
micro-optimization of our TCR register handling that gets in the way
of fixing the bug.  Currently regime_tcr() returns a pointer to a TCR
struct, which contains both the 64-bit TCR value and also two
'base_mask' and 'mask' values, which are pre-calculated when the
register is written.  Those values are used only in the
get_level1_table_address() function.  That function is called once
per page table walk for 32-bit short-descriptor page tables only. 
The pre-calculation saves only a handful of logical shifting and
masking instructions, which is a tiny amount of overhead compared to
everything else we need to do on a guest page table walk. Conversely
the microoptimization adds extra complexity on TCR register writes,
and code complexity handling the TCR struct. It therefore no longer
seems to be pulling its weight, and we're better off without it,
rather than jumping through hoops to come up with a fix to the
VSTCR_EL2 issue that lets us retain it.

thanks
-- PMM

Peter Maydell (7):
  target/arm: Define and use new regime_tcr_value() function
  target/arm: Calculate mask/base_mask in get_level1_table_address()
  target/arm: Fold regime_tcr() and regime_tcr_value() together
  target/arm: Fix big-endian host handling of VTCR
  target/arm: Store VTCR_EL2, VSTCR_EL2 registers as uint64_t
  target/arm: Store TCR_EL* registers as uint64_t
  target/arm: Honour VTCR_EL2 bits in Secure EL2

 target/arm/cpu.h          | 31 ++++++++++----
 target/arm/internals.h    | 34 +++++++++++----
 target/arm/cpu.c          |  2 +-
 target/arm/debug_helper.c |  2 +-
 target/arm/helper.c       | 87 +++++++++++----------------------------
 target/arm/ptw.c          | 38 +++++++++--------
 target/arm/tlb_helper.c   |  2 +-
 7 files changed, 96 insertions(+), 100 deletions(-)

-- 
2.25.1


