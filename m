Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp1123194njb;
        Thu, 1 Aug 2024 14:50:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuZ3l8kCBWbd8kYqGPrVehgZK9w3HbP7yA0BEXKZh9qxAfGza8RvTXhh2ATDbjpVaispAJGPtvQiP6CfkMuYAkXX9tOytL
X-Google-Smtp-Source: AGHT+IFvSaxLLiA1+IZLHwbHL3Gh/UyNx8gGP3zJv33qIH4UcKdphUQ3uCEv1oP3VL40eYZLyp6s
X-Received: by 2002:a05:6214:3bc5:b0:6bb:841c:ec6f with SMTP id 6a1803df08f44-6bb9830f930mr24338586d6.3.1722549042220;
        Thu, 01 Aug 2024 14:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722549042; cv=none;
        d=google.com; s=arc-20160816;
        b=XHYVLP7T7kUmaqET/9uq4Si3RysCrOFJjCYKc3hjrb2eSpn9eEooCOThRMLlzFCh79
         URKc2Hv0J0khVC0YEoowOncpIgCyYcIbM6P8F0AuSqQL0Xlt+Mb6QkVz9cl1uZYu7FpQ
         S9eNwShjr8z4/4Hg1cDalT7NyF6dT4ce3HyuT/bMnYZ31WQ7mA5Ks4oKGm9QbZr/DdM/
         U0qusV7SVVzHOrxThHfN82G89JvMN5+DYxlYXxd8w0BJMC6bAVO3R252W8YKOHy2lZpM
         POwMpBwLNq0pTwAue3z1osyxc1WOeJVK/0cwQZ+EJRufCxv+l3PspAl9DP/ySbM0VLuN
         y1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:to:message-id:subject:date:from
         :dkim-signature;
        bh=/IGLPG6w2o0+TJsI/ncg6VmIPjh4f0DtiOfJsqgrVys=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=F0mYgemZfz0fSzx3bP3x5Flal6ulJdcCTuC+d3owP+5Lw1SxBfkbobrmpsBZ7AC2Dw
         fyip5M9Q9VcpvUB50jkLMV3JPDmma5z7OAFXblOETWwVO3lqr8d+GbEryLc6FlKy0fMz
         0yDCBS8MqIsqoGlgGS8miibIJ9MtNwbzdCA82Ut00HLweXbCX7Rlr3ZulDqPTo1CV7Xx
         H6T8srk9qRPiMiPwA+gMpuWpwidtl+DkP/eQBOGFC2zW5flTXfJ4FqI502gTysVbhTLU
         tF3dZriiT6T8SLS7knwohT4IaKlnYO0ya6TJYWn/Jf4vbFi9tnUsJeA55O6udYEyEtmV
         C5vA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=temperror (no key for signature) header.i=@git.sr.ht header.s=20240113 header.b=GUGyFzhU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb9c83d126si2366956d6.244.2024.08.01.14.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Aug 2024 14:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=temperror (no key for signature) header.i=@git.sr.ht header.s=20240113 header.b=GUGyFzhU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sZdgb-0002MB-Ty; Thu, 01 Aug 2024 17:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1sZd37-0006Jg-EL; Thu, 01 Aug 2024 17:09:28 -0400
Received: from mail-a.sr.ht ([46.23.81.152])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1sZd35-0002Nm-1V; Thu, 01 Aug 2024 17:09:25 -0400
DKIM-Signature: a=rsa-sha256; bh=UkruwxpzGN0nWml852+v7xpPKHyhVVIZCJ8N7KBWdEc=; 
 c=simple/simple; d=git.sr.ht; h=From:Date:Subject:Reply-to:To;
 q=dns/txt; s=20240113; t=1722546557; v=1;
 b=GUGyFzhUZz063e25UxUiXQWHa0jtbIGLAqA+SObN35od1suSBVp5mR9XF+DotxbFiR+tvLKu
 ddxW5x5i22XczRYvCI4W5DvfocHdNiEx9T94XL72iR+qF79X2nwafOitRXZwMRiUQlBzy99Sm6i
 oHl/t0zoQNFlBHGdfsCy7d8X8X2Tv/7xiGOTo5K/RwBmE36RpJ1/VUTDCrh3L3T5oTAP7p+0foa
 W27xE8NwxnDwuLdurjBYsPQM9Oj5MwuRNvc5hQrxEV/xuf1CmTbcEAYBCs4JgBz2xkXs731yyHN
 anBaNBj2QtEiooKGqmJKjV2NhNJ1aH7L1NtOq2EPHbTAw==
Received: from git.sr.ht (unknown [46.23.81.155])
 by mail-a.sr.ht (Postfix) with ESMTPSA id AC1E3201D3;
 Thu,  1 Aug 2024 21:09:17 +0000 (UTC)
From: ~arichardson <arichardson@git.sr.ht>
Date: Thu, 01 Aug 2024 13:22:57 -0700
Subject: [PATCH qemu] target/arm: add support for 64-bit PMCCNTR in AArch32
 mode
Message-ID: <172254655764.30961.6353738068636770908-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=46.23.81.152; envelope-from=outgoing@sr.ht;
 helo=mail-a.sr.ht
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Aug 2024 17:50:11 -0400
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
Reply-To: ~arichardson <mail@alexrichardson.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3QkYwRhHodVN

From: Alex Richardson <alexrichardson@google.com>

See https://developer.arm.com/documentation/ddi0601/2024-06/AArch32-Registers=
/PMCCNTR--Performance-Monitors-Cycle-Count-Register?lang=3Den

Signed-off-by: Alex Richardson <alexrichardson@google.com>
---
 target/arm/helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8fb4b474e8..94900667c3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5952,6 +5952,12 @@ static const ARMCPRegInfo v8_cp_reginfo[] =3D {
       .access =3D PL1_RW, .accessfn =3D access_trap_aa32s_el1,
       .writefn =3D sdcr_write,
       .fieldoffset =3D offsetoflow32(CPUARMState, cp15.mdcr_el3) },
+    { .name =3D "PMCCNTR", .state =3D ARM_CP_STATE_AA32,
+      .type =3D ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_64BIT,
+      .cp =3D 15, .crm =3D 9, .opc1 =3D 0,
+      .access =3D PL0_RW, .resetvalue =3D 0, .fgt =3D FGT_PMCCNTR_EL0,
+      .readfn =3D pmccntr_read, .writefn =3D pmccntr_write,
+      .accessfn =3D pmreg_access_ccntr },
 };
=20
 /* These are present only when EL1 supports AArch32 */
--=20
2.43.4
