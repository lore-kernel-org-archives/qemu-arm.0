Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp1123189njb;
        Thu, 1 Aug 2024 14:50:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEE6ll1rnFyBXWYpk2kqe2h50UWHK1fz9CnuJv6iI/7Ml7I2NwxQlNCNGyYVJ40AzHZSoLt+tE23FEtmXATI3d1nSMOgno
X-Google-Smtp-Source: AGHT+IGwKoCIidFQ1Fg/ZZxoaVW2/GtGfROaaS8GuZws3nc1tlj8kNLxyfNfAx2MFLBZZ/Wr05b7
X-Received: by 2002:a05:622a:e:b0:447:e58e:a881 with SMTP id d75a77b69052e-451892a617cmr17451351cf.30.1722549041481;
        Thu, 01 Aug 2024 14:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722549041; cv=none;
        d=google.com; s=arc-20160816;
        b=TI02eesbdxCGXYO+O0Ui3b1hpF74o09wYxidT8TxDTdo9nPzX4ghNG50soOqsiffN+
         Arn1eqxyPPoQwaJ4Bk1DbNHh4Ll4j2TVE0Th1sskmI06xD7laoKIATitL6INmM7/6soU
         7UsIZ9AeHc7jbNge8KwFhdk20QZx5jpHRhOO11hA1n7SgIFfgadTf8zvwD70V4lIEMgW
         Z1jwOASHAXwIeoJlX+cKva7b8Y64TPtIFEGl70L1haPRuLr5O8yzTvXXCLVZVcRCehXT
         rtzg+XHCv85iCsz9uyu/qpYrXFJ1iSGYi4orexqpD7Ara1kTi1BTUvRbom5NOWqv2eVj
         2c6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:to:message-id:subject:date:from
         :dkim-signature;
        bh=/IGLPG6w2o0+TJsI/ncg6VmIPjh4f0DtiOfJsqgrVys=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=srBEZ52nDUeowY532e3RYHb8uQyJMmXp8f/UCn3MeGAid2lee7HjJsy2CvzkFvjcRh
         sDDXUF6X60Y3T8AFiIvfFeXu0/lA4Jrr5IJBQvb2oGu5zpCGIB7qO/Tl4T6GIoSpZx2p
         41yMNsqsyyJuPFqcltxafJ3kQVDOdkDW3G57SCpf2DqdLBdAEpCklvVnPpS5I0ym5PIz
         u7Irf5sBnQoNyPO+V4laFL6aFmdNZC2m1PDoQdgkoRGWDMyEozZxXvl/ZFQLuZoO7xqx
         bYRPKlAVGEgfxF35/JiI9nNJHYUXXZI0Xf3D62S50Z6OSHEjp7CZTNqFXpG8PqFd/Umm
         EeHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=temperror (no key for signature) header.i=@git.sr.ht header.s=20240113 header.b=A1T+o2bc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4518a7bc74dsi7257841cf.721.2024.08.01.14.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Aug 2024 14:50:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=temperror (no key for signature) header.i=@git.sr.ht header.s=20240113 header.b=A1T+o2bc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZdgk-0002f9-55; Thu, 01 Aug 2024 17:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1sZdYn-0005c2-1T; Thu, 01 Aug 2024 17:42:09 -0400
Received: from mail-a.sr.ht ([46.23.81.152])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1sZdYk-0001f4-5K; Thu, 01 Aug 2024 17:42:08 -0400
DKIM-Signature: a=rsa-sha256; bh=UkruwxpzGN0nWml852+v7xpPKHyhVVIZCJ8N7KBWdEc=; 
 c=simple/simple; d=git.sr.ht; h=From:Date:Subject:Reply-to:To;
 q=dns/txt; s=20240113; t=1722548523; v=1;
 b=A1T+o2bcUkLdcso2OAw/NNR3mcMWXAX6LJfoxjvFiAwmVhu7p7IhusWzH/doagoP3hQZXjKI
 tJtyY4yVbbn2e8p9mEpKXpPCJjI83kQNKDgmTk46ceYoSHSQ1C0fcUQWOJQZwh0L3GlWtku2//A
 5LmIPRU371pUMlWGkXwdaxPn91+yiPOV5cD5vXwYvF8ungRLvNRW3UQyg86kszB2W/zpFmuKSqJ
 0urccIcMompil4BNjdZSSzMCqiCqPj7c3nyW6iHd01lVIC6E+X/iSavIBYm/wj19t+EtKOkV253
 Vuo2k6zyDNUVTQzgH+HAzi8ElGsnU/KQJSvAvoHXnS0sA==
Received: from git.sr.ht (unknown [46.23.81.155])
 by mail-a.sr.ht (Postfix) with ESMTPSA id 1B1CE2026C;
 Thu,  1 Aug 2024 21:42:03 +0000 (UTC)
From: ~arichardson <arichardson@git.sr.ht>
Date: Thu, 01 Aug 2024 13:22:57 -0700
Subject: [PATCH qemu] target/arm: add support for 64-bit PMCCNTR in AArch32
 mode
Message-ID: <172254852305.13451.4513785887599072710-0@git.sr.ht>
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
X-Mailman-Approved-At: Thu, 01 Aug 2024 17:50:20 -0400
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
Reply-To: ~arichardson <mail@alexrichardson.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: n+vuHXY+5DxE

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
