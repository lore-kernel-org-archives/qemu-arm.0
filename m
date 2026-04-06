Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FE2F46C66
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:27:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oek-0007St-US; Mon, 06 Apr 2026 14:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oee-0007Oj-Qm
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:34 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oeb-0002OK-RO
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:32 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c648bc907ebso2969174a12.3
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499988; x=1776104788; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rVeSwZbNgMxucNnmt+bVJO+rTB1zblJZsZHbFuDjPLk=;
 b=s60y2N/H6jG6VHNtPxQmuEc0yUdUVoC6NdXi5NFw0cmW5TD2G3Jf0yb9uQSmU9tWIC
 G74FhlRuZRziJ6TAJVhmLJopv1Zk1yK1VvIQqoLoQcPV4DwrnLy2KO537JCyscu8WLxO
 nL5/Am7c1VE2eey32lH8eUOdEqr8NBP1pS0gs2jWoD1QrAQghhTzLAG5epdZCgPbCTP+
 DAa5RrT1QQVtxN3y85mDBRzr9LJ6xZILteXkKQVIJ0EeQXEQTDY5Z6rlw/e9gyEajlfY
 c+uLgyCxDt5PD9Fb9fPihID55yQ5JhWjFfMNTSVCOZ/NIget+GmetsasgT69dF9feH1/
 KJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499988; x=1776104788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rVeSwZbNgMxucNnmt+bVJO+rTB1zblJZsZHbFuDjPLk=;
 b=sojIn8jxsYG4/BxZzN5WUgtoU3HdwGwNdb6NZE2xm9d4Jcid5xIME0qtuOjF769BHT
 PU1JH70CycGCQx1ZqqIuODw1MKKQ3Fkcc4uQ5S3OBsN1QdbtDtB7skGIKXLTWLWUvTEm
 a+iv/RxBREBbNdxAJQOUAMG0AWB3O1aBClqTJECS95dlvQI/SLnX7dT5s2R79MGPdPI1
 G69SvAOSp9PyXxiOEuOT05jC1VZncjNM3HSiqHLUDUOmsyeW3BEwCmVJYQvOkQxcNs3t
 N0EGmh+mECahm1/p5q9lJdH2ugraWJmRgoWfPxldYHte79poXHvV8bkInCA8PvNr3oo8
 4dGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcQh2/AgUFUVrBFs35u6+sxEXFZCdDWNnz+9qvfeDrMBXnP1h36ZnVlzy2uLR6nWFNHmBJShtWPA==@nongnu.org
X-Gm-Message-State: AOJu0Yw4ReQLX9oDteAdZtAA4TOISweeYJ7ZvjmjpBd1D/o58xkPEL9Y
 y2yKXp3BGH2og3RnRX5vZvLAQJbI1O2nwhSrCyud5DMOQlhDjVMS4R+mAXiJZ3M3DD4=
X-Gm-Gg: AeBDiev9StocVhju0iPyS/lKaZHvUUfQhkYID6zIB6Ep3CjCIoPBXr/HxIC3tMYzpPE
 eEfUsyyFOUoqidqm5huSneGxzRmDdynSwoLNdjLlEVy0KvOBPNMlt6xmLY8/eMk3jAJVYZ8+9VJ
 HIhRBmvIMnrK8eLdI9+YUZwOtKWnDTrA+fPDYg5CgY21hgGPFDiDtr0uol2d4fTIFvrmzB/7qpQ
 752wC5wi06Gm+sX6F05/aGeMRovoYYfm0+Er316OntbH3XCP9HTwV1cThVTXRleptyeQKsHYDJm
 WhpWIRmSahl/5EB0qyT6XkeSAQmA6sgFDAprk6iBBwrCXKqXBqKy9zOQGO7930lBWnoMOSwIHU6
 vfHzg0NEMXAZzCKuRN0w/hiKZcrgf6bKyxJUykuZkXYgIZ0PKm0GkePYOtSVX6bp4yudx2vV1SM
 R0a1zNPXAJ7HkTsm8l5R69oMUjpkp/Xs/MHdJv0G81s+eKKO5eKg2ljjoh8lINDfAh0Mmk1fspW
 rpx1dcudpmnGFo=
X-Received: by 2002:a05:6a20:9145:b0:398:71e4:6287 with SMTP id
 adf61e73a8af0-39f2ed950d3mr13989522637.10.1775499988369; 
 Mon, 06 Apr 2026 11:26:28 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:27 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v8 10/20] target/arm/tcg/gengvec.c: make compilation unit
 common
Date: Mon,  6 Apr 2026 11:25:59 -0700
Message-ID: <20260406182609.193886-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x533.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 1fa26670587..0740de92c1a 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -33,7 +33,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))
 
 arm_ss.add(files(
   'cpu32.c',
-  'gengvec.c',
   'translate.c',
   'm_helper.c',
   'mve_helper.c',
@@ -72,6 +71,7 @@ arm_common_system_ss.add(
   'cpregs-at.c',
   'debug.c',
   'hflags.c',
+  'gengvec.c',
   'neon_helper.c',
   'op_helper.c',
   'psci.c',
@@ -91,6 +91,7 @@ arm_user_ss.add(
   vfp_d,
   files(
   'debug.c',
+  'gengvec.c',
   'hflags.c',
   'neon_helper.c',
   'op_helper.c',
-- 
2.47.3


