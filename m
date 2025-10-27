Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1427ACCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:13:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL9d-0006Y3-LX; Mon, 27 Oct 2025 07:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9P-0005rd-TC
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:12:36 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9A-0007bu-45
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:12:35 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b6d6c11f39aso616706966b.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563533; x=1762168333; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OP5xRq/2+HQuKT/1mrxcUI8zA2gE9pSdxS9XYDeOM4Q=;
 b=OQLI7QvPFveRCOrwb5IIxbZ1m4mb5TJzkJJ6nH9l0AZmm8RDsHn+yvLeMLt+nkPgRg
 ixpkyPtRT1mmvJ9Pni2bwTqn8sK9wx8tQiCvY6VCGrysawJJpnNhqUP163nH3DAIVZoZ
 p4RqWzy5/zbWmNM/s+QzcfxR/ylQ9DC5hDK3YrfCGLYuhQJLs2EcYhn0DLZknB07Pts6
 D6lWWD8BTICRsMSOq5JxoSg5haT0R6S28S59eZp2tt3LiiAzBXxJ/reSoCBrtjkj+Ly6
 BbWexSNj7fhEPmJCeTh/F0rinFPsaVAxpWqueNJtyrGPwTp8Arlp3uo99ozKrs9iyktn
 DPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563533; x=1762168333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OP5xRq/2+HQuKT/1mrxcUI8zA2gE9pSdxS9XYDeOM4Q=;
 b=QR9eJ2NnoY+5Am3kXqIoDwQBZvs0/EWPO4NT4B4tifhuF0hxzSc3ae0/ogQGzfTOYN
 hkl1mxtMhulpaHS9h5BBtZM2wghvhcxnG8ra77l43c8yAkTYsaeCEhh5I62CbvK2Y/rf
 qFArjV11jjfN0zhXtmISUIopsbXEeimy9n07oWcU7dyId2vDU+5CFq+0n6LCadWo5amk
 mR3dSwxwiiHXYURQc1SZ1+aH09q2L918r7Ef/l3gRlc6xFPaux18rzMuBzcSEmy3o8pl
 zebv+9hyqiBLJU7mdxuLcfk2/X8M+plcGKZIVCxdFh37lVmaU11yx8ZzJRYJqP3cSC+0
 /hSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWr174xTU4a47OfE6RD3NUVf5J2H8lKKjp03rVRFgz9SNXuctpbhiefDq9occoBDUqk5dYJ13MfA==@nongnu.org
X-Gm-Message-State: AOJu0YxIm4EvdwpPDbnzXZQbAd0Rn4di1DKmBXYuG82yryIC/steZiqI
 dVkoRwBZf8hLJ5smLAzgLmuepxU6EFgQ7dLKYZunDU7eL1u5WwyQlucPO+aYkVr8gGY=
X-Gm-Gg: ASbGncv1Emq9c+soUscUKgc92OlBGooZFmC2JLMe9/ChFcOXwpV7nalfaYtvvpxIU+G
 maHYuGqHLQCLfRj1YHtCYKR+4EJ54whGBAvTE0d3rgrWAgliWmsHfJ8qLNOSjMDEo9raNC4ct03
 MMbgwgWK9bDLNovFgmTESZMByDh5x5WG2UGNPmUMLKvLKMFbM1PvViEYKqI6fY+37MujA1JX75o
 tqRhsxujW8aP25ovABDMd3dhDAmVhuWl8jv1H9KkX+u1dxFZZZI3JM31cTXhZ5REy6BZ/CkTQbv
 XqIqta/B48gxsOhvevc376MB6IYiZmLavOSkfMYnwrTxBmL22intPDjlttz4iLRcLgRw68hQmk+
 QkFCPK3m741W3eCnUuX4QKRNRhqSjYqcyIr+Jw21s1nYNTJ79Cd0QzT3lc5Lt2Ot0KPOQMx0SbN
 tW
X-Google-Smtp-Source: AGHT+IFf1e5BUD3bGIAW80hEOc4A/ZMLN+6c91S7j0DbPYjB69Ht/8CPBBkQ+pHOyAdD1COvmtiQuw==
X-Received: by 2002:a17:907:7f07:b0:b3f:9e3d:daa4 with SMTP id
 a640c23a62f3a-b6d51c50982mr1328725066b.65.1761563533351; 
 Mon, 27 Oct 2025 04:12:13 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8541e99fsm728060866b.61.2025.10.27.04.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:12:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7247B61534;
 Mon, 27 Oct 2025 11:03:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 35/35] semihosting: Fix GDB File-I/O FLEN
Date: Mon, 27 Oct 2025 11:03:42 +0000
Message-ID: <20251027110344.2289945-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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

From: Sean Anderson <sean.anderson@linux.dev>

fstat returns 0 on success and -1 on error. Since we have already
checked for error, ret must be zero. Therefore, any call to fstat on a
non-empty file will return -1/EOVERFLOW.

Restore the original logic that just did a byteswap. I don't really know
what the intention of the fixed commit was.

Fixes: a6300ed6b7 ("semihosting: Split out semihost_sys_flen")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 61001267965..c5a07cb947b 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -316,10 +316,7 @@ common_semi_flen_fstat_cb(CPUState *cs, uint64_t ret, int err)
                                 &size, 8, 0)) {
             ret = -1, err = EFAULT;
         } else {
-            size = be64_to_cpu(size);
-            if (ret != size) {
-                ret = -1, err = EOVERFLOW;
-            }
+            ret = be64_to_cpu(size);
         }
     }
     common_semi_cb(cs, ret, err);
-- 
2.47.3


