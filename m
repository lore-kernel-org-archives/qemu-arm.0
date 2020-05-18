Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3153247lfb;
        Mon, 18 May 2020 08:47:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXd1lufV+wQzXqio5SbBRzroALFvjAPxsCfE+CcaHrs840+wliMtIQXpkiwPI6LqUBcZ3E
X-Received: by 2002:ae9:e894:: with SMTP id a142mr17199813qkg.296.1589816858119;
        Mon, 18 May 2020 08:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589816858; cv=none;
        d=google.com; s=arc-20160816;
        b=RP+tpryb6MYxVVT+YQr5l6TbL66NkkGM8umwt7foRLjFhbPk27vuDi0seo8mzBNlC7
         dDseRudLfVsEmXvEktdPPkUjx3Wo6AzPu7LFWBB8fR/h0syWMRsFn5Z+8bgnsW0D0/tX
         J7EBZET1B02HHjK3+5MNUGWY8nMmzoTAOQBT1tN/k5kVdbYz6QH4WHQfA/lTYOfXANTS
         eTY81IHQZ3KbmALghuztGyjYG4K0fFsSd580oIlhs7/IgHiDEcw9En4u8Q81W/F6xfUA
         XRju+lZyTdoE1eYvxU+JCwrFsmkqpHUniPkIpyHXCykgjsE4MSWsl8n9dE69uT7dbbL9
         Habw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=sKzcEV9wkONoPB+ynBHsD63nfFrJQCqRKP35Nd+BbUw=;
        b=KExIJghp8uCNNFznInMvAYfGsPpyb5DpNR56o93sJWcH7PaOqbo2EqwMtluBVYvirJ
         k1bQcw4kqogBSi1T1jN8KNACpUWTXpYBjjX/yRia8TNxCojMnDVr4pQ5tWCekqlhjMok
         Acf9N3CXJaBmUGhgR0tkmyur8WyQkvvja7jwngVr9cqDfS+pMkVX/t+ndjx9csU4+49+
         B0jqaGDTyiFmCFJhQiGYv8pm6QhIZeWpSLI5+xjkrWJPSfXLXQFSIrv8Y05NV4bbqK9a
         eiZhimMskoOl62ZjLzxhcAdN33fm3QBpViBr4HKUFQQBfb6iUSN0/QMRcAoCQ8INP5l6
         5ZwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fTVCTCrx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eb11si5727449qvb.2.2020.05.18.08.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 08:47:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fTVCTCrx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jahzN-0005Zf-Gd
	for alex.bennee@linaro.org; Mon, 18 May 2020 11:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jahzF-0005Y1-Sh
 for qemu-arm@nongnu.org; Mon, 18 May 2020 11:47:29 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jahzE-0006qU-R0
 for qemu-arm@nongnu.org; Mon, 18 May 2020 11:47:29 -0400
Received: by mail-wr1-x431.google.com with SMTP id i15so12401671wrx.10
 for <qemu-arm@nongnu.org>; Mon, 18 May 2020 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKzcEV9wkONoPB+ynBHsD63nfFrJQCqRKP35Nd+BbUw=;
 b=fTVCTCrx39WctUCz08VjkUeRTC3jDjw44YtMVBcFGoX4myyEpAtWISyAL8Us+55BTs
 yuY/vbTziibqdeZDoXCTaCr/UgccEnaiJsDMD2m6zzz4ik2/FiCuUiRonLyq1otYFpK3
 rER81wtnNoAoZEg9NzERh5ZRYiZZZLq7pgIl+6LwN5sFiB0n/BuYiElRSX+ggEdhIZH5
 5MW2gTSguHKwvvFzriVtP4JSxT8fM6Kt8W/HeSDKRUfWlyfpW3ZpQRi6HuVBDTOjOrSw
 rlxCqp6H3Hjo1t7QHxjgC8j5RUCLp5FgB7tArkOoqacNvgtfY+jaGId30GSZsmCaR2x6
 wT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKzcEV9wkONoPB+ynBHsD63nfFrJQCqRKP35Nd+BbUw=;
 b=accToWNURYSvhwltevuUHWR8b9DZdFTztyEK/0DKS4GC1oJDl0wBnbz26sAIEntW4h
 S07Z2La2nWaYBVkV42JgK85N+bo4nSK/xvsQ3VFdx6FnIXll2N0rKgt5Pe15cFescoKC
 X1/bGLx1A2YDBnRpjUwMLiDc0pTS2NHPrVzZi5GxcgTl6ezO3ekHS353BpAexloqCDjS
 t9GPaUMzbVp5PkQ1qMtUOOKLE1jVdh8QK8PDt0q4bvtDLubcV0qxSRFEX4BCQwdrgVfa
 17oBwPJUQbfpMFzaRjI4xfpoeQ3s01OFaf79VHAfaQz6U0V3gDV6Ik523X/PI6HTK/wi
 LzLQ==
X-Gm-Message-State: AOAM533m2qzBwogkkQf7J+2momJmHSyG80jzjd0hv9IQS/p9JaDpYbD/
 2Cz15VfSVWvC0KqW9WnXWxwFrHoYJC+LSQ==
X-Received: by 2002:a5d:40d0:: with SMTP id b16mr20247390wrq.218.1589816847071; 
 Mon, 18 May 2020 08:47:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i6sm19242882wmb.41.2020.05.18.08.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 08:47:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH RISU] arm.risu, thumb.risu: Add v8.2 DP and FHM insns
Date: Mon, 18 May 2020 16:47:19 +0100
Message-Id: <20200518154719.18562-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: MS9lL/312oXV

Add coverage for the v8.2 DP and v8.2 FHM insns in the Neon extension
space.  (We already had the v8.1 VQRDMLAH/VQRDLSH and the v8.3
VCADD/VCMLA, so this brings the risu coverage into line with what
QEMU has implemented so far.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I added these patterns as part of testing for the first part
of the Neon decodetree conversion and forgot I'd never sent out the
risu patch for review.

 arm.risu   | 18 ++++++++++++++++++
 thumb.risu | 18 ++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arm.risu b/arm.risu
index c16d245..f8b6deb 100644
--- a/arm.risu
+++ b/arm.risu
@@ -861,6 +861,24 @@ VQRDMLAH_s  A1 1111001 q:1 1 d:1 size:2 vn:4 vd:4 1110 n:1 1 m:1 0 vm:4
 VQRDMLSH    A1 111100110 d:1 size:2 vn:4 vd:4 1100 n:1 q:1 m:1 1 vm:4
 VQRDMLSH_s  A1 1111001 q:1 1 d:1 size:2 vn:4 vd:4 1111 n:1 1 m:1 0 vm:4
 
+#
+# ARMv8.2 extensions
+#
+@v8_2_dp
+
+VUDOT       A1 1111110 00 d:1 10 vn:4 vd:4 1101 n:1 q:1 m:1 1 vm:4
+VSDOT       A1 1111110 00 d:1 10 vn:4 vd:4 1101 n:1 q:1 m:1 0 vm:4
+
+VUDOT_s     A1 11111110 0 d:1 10 vn:4 vd:4 1101 n:1 q:1 m:1 1 vm:4
+VSDOT_s     A1 11111110 0 d:1 10 vn:4 vd:4 1101 n:1 q:1 m:1 0 vm:4
+
+@v8_2_fhm
+
+VFMAL       A1 1111110 00 d:1 10 vn:4 vd:4 1000 n:1 q:1 m:1 1 vm:4
+VFMSL       A1 1111110 01 d:1 10 vn:4 vd:4 1000 n:1 q:1 m:1 1 vm:4
+VFMAL_s     A1 11111110 0 d:1 00 vn:4 vd:4 1000 n:1 q:1 m:1 1 vm:4
+VFMSL_s     A1 11111110 1 d:1 00 vn:4 vd:4 1000 n:1 q:1 m:1 1 vm:4
+
 #
 # ARMv8.3 extensions
 #
diff --git a/thumb.risu b/thumb.risu
index b8afa59..357b791 100644
--- a/thumb.risu
+++ b/thumb.risu
@@ -449,6 +449,24 @@ VQRDMLAH_s  T1  111 q:1 11111 d:1 size:2 vn:4 vd:4 1110 n:1 1 m:1 0 vm:4
 VQRDMLSH    T1  111111110 d:1 size:2 vn:4 vd:4 1100 n:1 q:1 m:1 1 vm:4
 VQRDMLSH_s  T1  111 q:1 11111 d:1 size:2 vn:4 vd:4 1111 n:1 1 m:1 0 vm:4
 
+#
+# ARMv8.2 extensions
+#
+@v8_2_dp
+
+VUDOT       A1 1111110 00 d:1 10 vn:4 vd:4 1101 n:1 q:1 m:1 1 vm:4
+VSDOT       A1 1111110 00 d:1 10 vn:4 vd:4 1101 n:1 q:1 m:1 0 vm:4
+
+VUDOT_s     A1 11111110 0 d:1 10 vn:4 vd:4 1101 n:1 q:1 m:1 1 vm:4
+VSDOT_s     A1 11111110 0 d:1 10 vn:4 vd:4 1101 n:1 q:1 m:1 0 vm:4
+
+@v8_2_fhm
+
+VFMAL       A1 1111110 00 d:1 10 vn:4 vd:4 1000 n:1 q:1 m:1 1 vm:4
+VFMSL       A1 1111110 01 d:1 10 vn:4 vd:4 1000 n:1 q:1 m:1 1 vm:4
+VFMAL_s     A1 11111110 0 d:1 00 vn:4 vd:4 1000 n:1 q:1 m:1 1 vm:4
+VFMSL_s     A1 11111110 1 d:1 00 vn:4 vd:4 1000 n:1 q:1 m:1 1 vm:4
+
 #
 # ARMv8.3 extensions
 #
-- 
2.20.1

