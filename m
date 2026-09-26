Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7419DC98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:09:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMUX-00087l-S2; Sat, 26 Sep 2026 03:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRx-0005R1-6P
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:02 -0400
Received: from mail-dy2-x1e.google.com ([2607:f8b0:4864:36::1e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRv-0000ge-MJ
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:03:56 -0400
Received: by mail-dy2-x1e.google.com with SMTP id
 5a478bee46e88-3437a48f386so62877eec.3
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406234; x=1791011034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D2M0WhvqFMAcnKU8D314BNttBtcbqrejLVZUCvsEr2Q=;
 b=JJzeVTWFqeFp+1h3PlnBvbC5w7dGn6Eo2ZKP80pLNO8bSUstqOkmG6pittmXf1DpbY
 agaVDu7PSTWj73I6TZ4qJYQ9icWuRWqrp0i3iHH8ax1LVOUE+kamHzx7+s4x0TAuf5qn
 EiWYAigjXTUc5MsdvXFwlIcnbUX70uu+LDW1LdRsqL/Kbs1y3hZXFRl1TCjJyN5TchhG
 PvzpqUeV+rnyi31fRk5ZLkytuQG/3ALLY8+wPXH0MIUrZoKbZGz0efQg8QZ77fUtjBeT
 Qg8W1kxcrBA7ZEXRwH7Ko12RVcLi109crU3s11GlIAbAr9gE81FTo6SoAlViUntHydsw
 +smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406234; x=1791011034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=D2M0WhvqFMAcnKU8D314BNttBtcbqrejLVZUCvsEr2Q=;
 b=ZdZe3mK2TOFm323OegOsmpHBXMIoXcn07r4hMTL8DUZ3wit92+nezUBNM/vAmFLu4Z
 kXBpNfesOBs8LofHEvte5QRnCbpigibhCLIjBjkxImJ7vCx0Xns8H2Yu4bbkQqnNSaTW
 TMG4W5CdXiXEoPLL8O7oycLGNDDrXTeo4pAPX1J28jGziiUJdwweJErexlJKRMU7ghD/
 D317CkOJcLlDsEq704QKcczAa2moATlTVx6mTXirBK6YJMHFjrItCLocqE7pQRkyRrRk
 1gwdm+Q5dav2yvPiJmFCoHanAV5m2uIPZg/EjlfqJDgArfj3YTmL0ZVIygt5AHqF1CNF
 pShw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx1h/Dr+jv84lFgTvEtGgAb4b1P3tylp5e7IRn9xxpYeaeV3Se4IesC6lQsMsML9zfvH9fsQqYG8w==@nongnu.org
X-Gm-Message-State: AFuF++lKp17QBxPgG7s2B7V3F6578dA5Si7FN8Z9GfrmQNOjIqbPpTms
 1FGWVRxlt4tlVCqwIUU1vY8FmolAGh+5xrFXpWmM01lvBj8jTi9e7KRP
X-Gm-Gg: AYBFou22GTBx9mqsZpPGh7wrsHl+66hi7ff6csJMSOB8Er+ZfvTaURTBaB+cBfIOcOC
 yxJttLYVZoCutE4c7fWr4XxZsik/ms6koiXSFZNDHfMyCzHAJ5WzWs1XTwEj8xrbMxpVGygLydo
 72NbK+9caqjT9T5weLsz4bjXcYfg92JkeIE6EyIc5RA9iPsBfLGNcPrM9JlD39oczfJseITrgQU
 sg/W3Zh2QPynPvH2lgNGoG/7ot0YWIKjrr8ac3fXFrn//+5Iyw+GcqEy402H8+g1/I66PC20i08
 xJezavvvn+gI2C544ykVJeeiTdLDERdLGAAq8VEZzJbza4CEVVNwbuwhEhiuWfzSBJkZvGo1jCZ
 qye5IIz5FFxg1Jy/nDrub20feVAk1s8tWnWwZLVQnyjHhEwmAWQ7qTu2eXl2787rwI3VrizF0D8
 EM+cdDiL3BYbcsvjPWePUEUSFNCFHiR0IzBGT0jxgJE7PiYIqgIj02B4iPlwfGwclQfxaeUk2Dj
 FgYAL7guPvj4sAde/6EbVNyJ+kvvJs=
X-Received: by 2002:a05:7300:4f1c:b0:342:19b0:1c92 with SMTP id
 5a478bee46e88-34273549d27mr2573139eec.35.1790406234000; 
 Sat, 26 Sep 2026 00:03:54 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:03:53 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 43/55] accel/tcg: tolerate NULL target_cpu_type for -M none
Date: Sat, 26 Sep 2026 15:00:42 +0800
Message-ID: <20260926070057.1234-44-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::1e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x1e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Combined qemu-system -M none keeps SYS_EMU_TARGET_NONE, so
target_cpu_type() is NULL. Skip the CPUClass lookup and leave
MTTCG off instead of crashing in tcg_init_machine().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 accel/tcg/tcg-all.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 767e8805552..e44856f8304 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -107,8 +107,13 @@ static int tcg_init_machine(AccelState *as, MachineState *ms)
     unsigned max_threads = 1;
 
 #ifndef CONFIG_USER_ONLY
-    CPUClass *cc = CPU_CLASS(object_class_by_name(target_cpu_type()));
-    bool mttcg_supported = cc->tcg_ops->mttcg_supported;
+    /*
+     * Combined qemu-system -M none keeps SYS_EMU_TARGET_NONE, so
+     * target_cpu_type() is NULL. MTTCG defaults off.
+     */
+    ObjectClass *oc = object_class_by_name(target_cpu_type());
+    CPUClass *cc = oc ? CPU_CLASS(oc) : NULL;
+    bool mttcg_supported = cc && cc->tcg_ops && cc->tcg_ops->mttcg_supported;
 
     switch (s->mttcg_enabled) {
     case ON_OFF_AUTO_AUTO:
-- 
2.52.0.windows.1


