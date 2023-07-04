Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2992592ejy;
        Tue, 4 Jul 2023 08:43:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61uNSctZGtfUr+xmcP5VsQe5KmvHLdq94M0C4yMZfaKP7Vn8qKndi2zgw7wOlnCwhWo+1O
X-Received: by 2002:ac8:5c4c:0:b0:3ff:797d:5e89 with SMTP id j12-20020ac85c4c000000b003ff797d5e89mr21230621qtj.10.1688485431997;
        Tue, 04 Jul 2023 08:43:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688485431; cv=none;
        d=google.com; s=arc-20160816;
        b=SNUP2xU+nzBs6KfAEPQz92sI0qc001B35J4yFlhC/HT08UwP+HAJT9Dw3uS4Grk0Gd
         5SywfK1BLuwoEbIWqiA+pqAY5+d4MGxe8yKIesP1kY61/AL05W2BiG8KQxs+gJXSqIgr
         NuEEli0GFSfdSSMHxbBBz6miOs8H9BEf3IxqZA3/uVQx4gJaB3Cd8Jqj44QTuQbAYQgm
         T1ZbBy8qhsHwAunrtKShEGk0abKYVWgkjlk7mUYJDb/IeIfinQ+15LkXsheGb7gNPnKO
         n3ePJxnE7EijDcTTFpqCMgOxJ19U4p+jHecNU2v+YVpdpoVSZzMwJT9gQZWU403ZnZTJ
         Az/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ygTlGglnECShwUVIe7MpU8KSDdPM2zi5lkhBBqOyaMs=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=byLyPJp3qtDT8TsbqZbbiKC0cEJbPre5U7ZZm8Eh5WUwCzirAt0/EcWlDEk+TnsEyM
         aYuA4lo/BC9dq+J+2KlEd1rFdNvenGnKOnMP3Q3pbpuWOmUKL7ugLikpmunX19NtAjuQ
         kkCy8TcIois92UPpUnOBIQo284TUyaztd8iIpJj25QA9FrhcGV6B2Kyl8hmemxzesGcx
         7OTL7rC+rgpOEcJuI+7ZRtLhlTgg/mGyLlnpHkjpLXUxbyrEgESKUo3/+uxeIU3QMgu2
         nwvvriOON5AgeHgR5DLacLv3+dQVFApIoc6kSuso+8l2+a25c6S3kVOcdZBbXAAIdC4y
         uQEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tdp5jZQ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020a05622a010200b0040079335675si13087140qtw.206.2023.07.04.08.43.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 08:43:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tdp5jZQ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGiBn-0000Hh-8Q; Tue, 04 Jul 2023 11:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGiBl-0000Gu-MJ
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 11:43:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGiBk-0006EF-46
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 11:43:37 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-313f61890fbso6226637f8f.3
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 08:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688485414; x=1691077414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ygTlGglnECShwUVIe7MpU8KSDdPM2zi5lkhBBqOyaMs=;
 b=tdp5jZQ0XfrL0uyp09kCyzGEBDquBP11sTjXswWfaeGNYqUcy1yQyUtUhZPBUHypA2
 YdlwloU+m8gnPxRYMaHEVEyQ4ZMkME5mDGwqPE3BbDf4llFrQXWeW+cd9EUg2hHoBpOH
 /cduyymkMFNzkkQZsTy3kFCL/Va9iRp2pI3MNR2zxrYtRNT4R+DrI9SaNa8pAp76thDI
 IuuToxFqin6n9SVcR1XFqfgdtK4V0fQ3Rl2Osdx9p2cw5K+IHHQF7JCiACX/CzDnV/8a
 wAwwjpAzVwEvZo13Ghx9P9vKdYG4m+UyD/GACgK8jQ2ZcD/VSHMhE5Rb9xR0Zx7IW52G
 8Fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688485414; x=1691077414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ygTlGglnECShwUVIe7MpU8KSDdPM2zi5lkhBBqOyaMs=;
 b=bLhu64kchEOkeTE9dR0j6UkLXBu+hnjQjH8DJyDea4zCjoXCbI+AkQ0rlQd/jM8Y8r
 RkJbUW2198th5MKj+tXl32b716KeCv/X64KLsSO+ogySMykECIT2Kjo7VKDFg2+j9yPj
 DSiMVpYMI4DfN3HTGKJ5SAxTLy0eHyQ0c9DKnccSMeBuCsdYxeiB7zuZKKrE8a9iHwMS
 l7MD+X/nS9jFjKvotFpY+0meVC9ZrRgfgQd/gAtFM8AsXNCLNm2SiAUtmSIOYyY2RlSg
 b1X8FKvVUt5Xe75zRDeDRfRkzAx864yKHMw4Jwyb9oTA67DhQA1CAE1ArdvPpzepBDPt
 wFjQ==
X-Gm-Message-State: ABy/qLYN0ZoJeT/KOzDsO01BpPo6PXKE6T7phz+k4OfqooOOY3IFlVvT
 u9F4kVocSLbX2s/ZdIPwIJPXzrQRjSmMU431hAs=
X-Received: by 2002:adf:f20d:0:b0:313:e80b:2273 with SMTP id
 p13-20020adff20d000000b00313e80b2273mr10912590wro.46.1688485414428; 
 Tue, 04 Jul 2023 08:43:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l1-20020adff481000000b003113ed02080sm28472427wro.95.2023.07.04.08.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:43:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Avoid over-length shift in arm_cpu_sve_finalize()
 error case
Date: Tue,  4 Jul 2023 16:43:32 +0100
Message-Id: <20230704154332.3014896-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m3/psscaMtFW

If you build QEMU with the clang sanitizer enabled, you can see it
fire when running the arm-cpu-features test:

$ QTEST_QEMU_BINARY=./build/arm-clang/qemu-system-aarch64 ./build/arm-clang/tests/qtest/arm-cpu-features
[...]
../../target/arm/cpu64.c:125:19: runtime error: shift exponent 64 is too large for 64-bit type 'unsigned long long'
[...]

This happens because the user can specify some incorrect SVE
properties that result in our calculating a max_vq of 0.  We catch
this and error out, but before we do that we calculate

 vq_mask = MAKE_64BIT_MASK(0, max_vq);$

and the MAKE_64BIT_MASK() call is only valid for lengths that are
greater than zero, so we hit the undefined behaviour.

Change the logic so that if max_vq is 0 we specifically set vq_mask
to 0 without going via MAKE_64BIT_MASK().  This lets us drop the
max_vq check from the error-exit logic, because if max_vq is 0 then
vq_map must now be 0.

The UB only happens in the case where the user passed us an incorrect
set of SVE properties, so it's not a big problem in practice.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6eaf8e32cfa..6012e4ef549 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -122,10 +122,10 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
         vq = ctz32(tmp) + 1;
 
         max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-        vq_mask = MAKE_64BIT_MASK(0, max_vq);
+        vq_mask = max_vq > 0 ? MAKE_64BIT_MASK(0, max_vq) : 0;
         vq_map = vq_supported & ~vq_init & vq_mask;
 
-        if (max_vq == 0 || vq_map == 0) {
+        if (vq_map == 0) {
             error_setg(errp, "cannot disable sve%d", vq * 128);
             error_append_hint(errp, "Disabling sve%d results in all "
                               "vector lengths being disabled.\n",
-- 
2.34.1

