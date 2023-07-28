Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp595865ejb;
        Fri, 28 Jul 2023 09:37:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHShc4YQZT8PUsZ8LfyOVp4g21AbnJYXaFo7CGzU2XEAsSgY17ZzkStEqCQpHi7J5UXJnCJ
X-Received: by 2002:a05:6830:1db6:b0:6b9:1917:b2f3 with SMTP id z22-20020a0568301db600b006b91917b2f3mr3229396oti.33.1690562220183;
        Fri, 28 Jul 2023 09:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690562220; cv=none;
        d=google.com; s=arc-20160816;
        b=mABHOaRl5605Csm8xESHjxyEkogf0sGbjtPN3K42ZRQG+0SADR7Y/lNPhHZ/2MAcoB
         OwviGpQrA1hQHKud3ZV4tJzq2+G9mejozgSU5VlkDXTqFf7WlOrwuoKtE+wNvQMDp6tn
         rscMxP4NtT5HS3uyt/bfyIEpsl1ERwk7Cz23vKC530UBfIMDFf3LEwrriP6t0yQCNdzT
         5VkOt5i33Mglai5VRHhhDWTxuZC0UOa/xQEMjGsy/muD6jkwNpbXC5QpwiaSbgYF3C8W
         NFxSsFAKOi4soHsAfDMJvbC1Rn8/AgC/7Kr+kQPWE6y0AMuPEisFn2UCB8oEInToTx1X
         ieHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=9creud7ffADP036CJBemj2r7ekswvmWnuyDLTNzzpEU=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=gLjkjIwsWpF9g7UKSTb8UpSwGtf8KtlB+NcGKWW1ptsn7GNXhQ9cFXRnQBs1sMbKKx
         sZVEN+Y5P/UAU+ZUp6nOovmcNSw3CeKH2QMZa8A17VtIDR0QN2wZIwR0gtMhH/EsvHVP
         7utO7X6AknCuovt19v+6P5Q/P9+V0UuOZh1p0juCeHC9YMQSH0B9NJ0P4EGlUlYUx6G+
         pOvdCUXf4cyuB0a9osfxXl4lHUhu+SblHHypAEys5O08nlYiBt6a0OCTywK7auO+KAVr
         HstrQgjgwAV7lx9DYNRWVNbUvYFv/ODVxCa/xYwJxExaMsHswbhNqM2RFTL/Hoa4RfNn
         nqnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=CUy0d56E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17-20020a0cf0d1000000b0063d1873cde0si2405721qvl.490.2023.07.28.09.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jul 2023 09:37:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=CUy0d56E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qPPxx-0004y1-5M; Fri, 28 Jul 2023 12:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qPPxv-0004x6-VO
 for qemu-arm@nongnu.org; Fri, 28 Jul 2023 12:05:20 -0400
Received: from mail-4022.proton.ch ([185.70.40.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qPPxt-0004eg-TS
 for qemu-arm@nongnu.org; Fri, 28 Jul 2023 12:05:19 -0400
Date: Fri, 28 Jul 2023 16:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690560316; x=1690819516;
 bh=9creud7ffADP036CJBemj2r7ekswvmWnuyDLTNzzpEU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=CUy0d56E5zGoJGELUBmBK+AnMJYvg7Td1w74auDPt2s4KgWNzeIZdA33IILIIM1Pq
 1WqUl+EORcfD+YzJtOjEilpNv9UKzr488gMiXNRtjP5bUpLTlkdKmEiI7KGvtXaVrc
 MRR/d9w3yUJiwZIXd5E4R7YMyZge8yNx6Az7BBZ/bcsHwR/R9tvwnbymsIuc3WuRYK
 +IQiPt497l89CIvkXekJmPvNMdD+3TB67hV12e/F3atpxZKLC42+Z9Q10Xb0suKsVC
 1nassoE43DFVWQ5yvNF7mhEcktxaxs4TanfACv7TD9oNbiRyR/LDIDHaxS+usUS+3n
 TKqNtydFuLXCw==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH v3 4/6] qtest: bail from irq_intercept_in if name is specified
Message-ID: <20230728160324.1159090-5-chris@laplante.io>
In-Reply-To: <20230728160324.1159090-1-chris@laplante.io>
References: <20230728160324.1159090-1-chris@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.22; envelope-from=chris@laplante.io;
 helo=mail-4022.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Mxx2inmi5D4Q

Named interception of in-GPIOs is not supported yet.

Signed-off-by: Chris Laplante <chris@laplante.io>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 softmmu/qtest.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 0f1d478bda..66757ba261 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -397,9 +397,11 @@ static void qtest_process_command(CharBackend *chr, gc=
har **words)
         || strcmp(words[0], "irq_intercept_in") =3D=3D 0) {
         DeviceState *dev;
         NamedGPIOList *ngl;
+        bool is_named;
         bool is_outbound;
=20
         g_assert(words[1]);
+        is_named =3D words[2] !=3D NULL;
         is_outbound =3D words[0][14] =3D=3D 'o';
         dev =3D DEVICE(object_resolve_path(words[1], NULL));
         if (!dev) {
@@ -408,6 +410,12 @@ static void qtest_process_command(CharBackend *chr, gc=
har **words)
             return;
         }
=20
+        if (is_named && !is_outbound) {
+            qtest_send_prefix(chr);
+            qtest_send(chr, "FAIL Interception of named in-GPIOs not yet s=
upported\n");
+            return;
+        }
+
         if (irq_intercept_dev) {
             qtest_send_prefix(chr);
             if (irq_intercept_dev !=3D dev) {
--=20
2.41.0


