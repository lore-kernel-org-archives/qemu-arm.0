Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21838606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LS24SGI+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSko-0005e0-FA; Thu, 29 Oct 2026 12:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSkg-0005bm-L2
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSke-0000Wl-0z
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:17 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48dfdd0678dso1499554f8f.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793290393; x=1793895193; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=woVmwsyvDlCmkyZgqC5zSuMkvRNOYByorzJBxOcFY00=;
 b=LS24SGI+bqsrfv7hR4bveqPUCricadceGDfkGreChb0yFEtlfnrKMEtPiyn/WBERgX
 16ZCBZnQJ4AnywlomhMbg3c6SgRQX3QXwaZdzmc3EaQ/jbS2LyIZy+aymjgQcU9pBCMN
 3rd6849hw5rhn1oTEao5xqfkAH1kCuDVk6jOO65gfKBiSR0FRshggVAZWRce+emSYvbw
 tA67TanNjIUxATloD699bGI0c8K9VYehVrWED8gXnk/cSGDbA6p3u6QB13mIOGjT/rjn
 63Z/BVpZsaVlkI9IngLT4Dl3f1UwXDEi5lPxu6MahwCZNW22cmh4F8m6mn6w8jq84noM
 vr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793290393; x=1793895193;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=woVmwsyvDlCmkyZgqC5zSuMkvRNOYByorzJBxOcFY00=;
 b=o7VoazigoL2pi54OVlEjPjITLLnBwTtuJNP78+BLej3jw2M0HcOh2/qP9ACQCqZuDi
 Td/svA5mtQrIoMuxYIzxXLMY1efVTt2W9GBY7f7EyB5NQt7uOFDztt2pyryiYmwtGBVi
 19rNIt/wqURKQr2szaXxN5hZlsY0fqsZn5TEN9iu62k1Z6AyWn3X3ahAOFba3b+9zC0h
 +2CgKKZLMF71edTGMH57sPHTZzpyy0tF5E0+8AmDvBLOJe7kLwVQKnwgEaV9VOhmXRv6
 AVhnF3JDcz60g3aiuoDccdmRq5SU0LpnoauS2T/1/aRKL/TUz6cZ0JKlE9diNZHPzVaK
 uoeA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxyW5CuotBABEAAVLNSFAfy85HLbPHVw+/cn9ff36dQ1gZV/f2ibFg6LviPLt0glNKukODChOKaCA==@nongnu.org
X-Gm-Message-State: AFq9FYLXsLQ/fnRgKW4MNSa1/XeghsGwt62t7Lmu2p1+mykXwK1rtz76
 D3VWpKTCvPNj62sUqkQSudZzKxdd0su709kCrnyavlCa0pe8dAX+p0WteBfGWBxwupQ=
X-Gm-Gg: AYBFou2oeWegDiRs4Pu0yomXp6qYOH4nWU0+TijIWlKbElcOHc6QPgnvT0u/Kl4txj1
 tZF5WrwE0HVj59cJLGKO+zHwlWTeEFSaNaLHO8tJjMP6kw436LT68VZaWMjmGAOp+MPTG2GJX9E
 RsaNS25dqDu0QivZMeera8Faj9Ea3pKDznU49CPKcS4689KCtifST25OOQ6js1tjPj5afjx6d5W
 3B/CgQP75kukyxdUV4WBL6by+8TL0unx1miwWN+VgnovcDSP0VminEkRsx9AMOj7Q7zUMFGsSlS
 M41ZEnPYGY2S77+F+H+l81LgaP1aYziD5Cww3PWR3vOUyUKxgZUN6DlDr3Q9+8h9IUMb+JI5FOs
 Y3PINJoQdkakSoKrnDdsUOufyfIjnwlEH4Ecl/FU6fqQIP79VHkU/2wgBcb9IyNSiFpvuWyWA1s
 zIFKAqtRYynPs4D9UEQiiLGO3JzPpGBNJF98n26YeeLcYzbFHnFboZ4gQtLZgyvX0fACUq+MtQP
 2X/d9JWvIgGo2cYPdSMYjJF2cs7sUqGuKaYF+FRYx34J6qaVHkRFLRLPT75BaB84qK7y/On76Si
 fv1Sw3cvq/jxKx6NfQPpyfvnbjHu
X-Received: by 2002:adf:ed91:0:b0:48d:fd1f:9a9b with SMTP id
 ffacd0b85a97d-48e5d2f9535mr10358256f8f.34.1793290392498; 
 Thu, 29 Oct 2026 09:13:12 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6df87f26sm91409f8f.17.2026.10.29.09.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 09:13:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2DEF05F8AF;
 Thu, 29 Oct 2026 16:13:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/8] scripts/checkpatch: validate fixes against origin/master
Date: Thu, 29 Oct 2026 16:13:03 +0000
Message-ID: <20261029161310.2065290-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029161310.2065290-1-alex.bennee@linaro.org>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The current check for a referenced fix commit relies on the developer
keeping their master branch up to date which is not always grunted. If
you create your branches directly from origin/master this will keep
failing.

Given that origin/master should always be up to date (module the
developer eschewing convention) lets use that in the test instead.

checkpatch complains about the line lengths but this seems to be
standard for the perl script so I didn't try and fix it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 82f62f60212..60e8b6bf7bc 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1913,9 +1913,9 @@ sub process {
 				}
 				if (which("git") ne "" && -e "$gitroot") {
 					my $hash = defined($cid) ? $cid : $orig_commit;
-					`git merge-base --is-ancestor $hash master 2>/dev/null`;
+					`git merge-base --is-ancestor $hash origin/master 2>/dev/null`;
 					if ($? != 0) {
-						WARN("Fixes: commit $hash is not an ancestor of master\n" . $herecurr);
+						WARN("Fixes: commit $hash is not an ancestor of origin/master\n" . $herecurr);
 					}
 				}
 			}
-- 
2.47.3


