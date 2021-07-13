Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp604195lfc;
        Tue, 13 Jul 2021 06:49:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZG4l/No5hjjAG+XCuLubk3YHcTuXq6FH1jrnduwKnsquoBFsKqv3DfRulKz0t8u7Ev3GN
X-Received: by 2002:ab0:778c:: with SMTP id x12mr6050354uar.88.1626184178223;
        Tue, 13 Jul 2021 06:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626184178; cv=none;
        d=google.com; s=arc-20160816;
        b=PcVWx2sXryoyb70WT8ei+LX945G3WTc7OuqbnK0683yIKt7y5qTFnm2wY8RUsMMSM/
         UHc0cC6ikF6t/w56p30B9KClAICfx8OMbg6phvehfTBhN0x76cGcdiMMt4D6ayobXLlQ
         eQmmVCo4A16irB64vVpKZuu1IHzdSyOmByj38pWHWMJIEPMNxxFx2UVcdG/+4sDmLYkS
         f8zGAon+8km9DEY/u0UAerNexZQESDPyJe9/S3TwqbvsVja9vA8S9eA5vnP6cERQtjNt
         Oun0cJQJFQS1/PVwA3yX8sUPcX9I56YozlDxoXCIPfk+AIkYlTpgaRjqQWe3eT66ToP4
         x2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+Lu7dJm1TE887g0x9UEBakZnKs1VKB2KmcyMjuqzDNs=;
        b=sl+nwnM3M4nFAS7wdqLmDfFJF5r8BvJiucPNDe6yBJ6zCuPEL5GXlEy9gE9pXXSz/K
         f4DHgzWMCjdmzDRW6FOs3N29W6A2HcJVfcMzpY3rh8Zakkreehvb6q5iZlQaTYeEZedG
         1WhPHVDFwnjGLxObAEcE4Gi5MlxJq7NkY57hzvCNcVHwUt++ndtTAyXwZsHVKTZfQvwv
         B/dNBvmZzCKk/ULBMOiKCF6IbhnvGhgS4aiNBeYYLtZr++U4u4EgQ/TbrhZhGIcFlplt
         OZGvQcpNK5GOLXiaad7mRa/qEQMGBZnSSB7III8GzucbxXS+tvUSJ+oJaEYxGzMeAFhw
         LRnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KCvcGlFR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i45si14594215uae.233.2021.07.13.06.49.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:49:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KCvcGlFR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3In3-0005Lo-E8
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibf-000064-Eo
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:51 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbY-0003jF-JB
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:51 -0400
Received: by mail-wr1-x432.google.com with SMTP id l7so29612550wrv.7
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+Lu7dJm1TE887g0x9UEBakZnKs1VKB2KmcyMjuqzDNs=;
 b=KCvcGlFRz8nVXWUDiOiiwluzhitAUgKzD+XXpntIwBfbofFxCkYpQBNkJU8L+udvnL
 OSX7R+iDIVQkreLrNMpraRtbnffko1QixSpENw524P2dpWEE+FSAyf+wBURO/B7GiIo3
 t8tTlMXMBwQAuYSz6NcQ93x1Pdpdd4XAJiEjKLEU8k/pgNVSn/TmElW3UcrRkpTQe/fq
 RrXobLUtgMgLqRijqUcoQJnf9mPeuQCVb7q6i17F2d81Bz6SUwi4ff1NiBDWKoEDgDsV
 6dhbwOm5AcVr+LDopDWTmo1KbsKyicE2Xu6L3m5c7nDYUuVzbskvnp2FgOgr+fWuyylF
 Dc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Lu7dJm1TE887g0x9UEBakZnKs1VKB2KmcyMjuqzDNs=;
 b=HgCpQW+hkM0KzNNt3hgDgIn5OSNFpPhFhZgIrF7Gh8jVZtvfpqc/9sHnzAqpgmlMpW
 tmHhKFtuAW4bplSiyRjAbxrRWKyLeUWS32hTjrnYtvCyIAB+6mik/LqkEq0rzRLxRGLa
 R38AJOtF9BOIgR3A2NKyxQpxfgqBOOuGpKc6jF1OBQoQveRSkOdHVXTbBQx+NF6YziIi
 xnjtO3YUkeKzyrhrIqIa40/Q0p2biVAsr5FIfcqKbYGiMdEogbVVxOjhBoPJqMt2UjLg
 d7PAIxkIwX9J2IntIkYqNj7knZA7uCDSjOaAurrM8P9RmbFajppmpgsXu2ffpCXg0FbJ
 fkGg==
X-Gm-Message-State: AOAM532lHXa7FmvNe/s7a1kqC+3eMNkAaoYXxHOjR986+kRV1Kje02lK
 IET+n+NlwhYWqCWzpOa2bBOt1X5hgn3UsAC1
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr5863322wrr.57.1626183463369; 
 Tue, 13 Jul 2021 06:37:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 19/34] target/arm: Move 'x' and 'a' bit definitions
 into vmlaldav formats
Date: Tue, 13 Jul 2021 14:37:11 +0100
Message-Id: <20210713133726.26842-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: IbNiULMtjnOO

All the users of the vmlaldav formats have an 'x bit in bit 12 and an
'a' bit in bit 5; move these to the format rather than specifying them
in each insn pattern.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not sure why I didn't write it this way in the first place;
when I came to implement VMLADAV I noticed the oddity and
preferred to fix it rather than either copying it for VMLADAV
or having VMLADAV different.
---
 target/arm/mve.decode | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 1a788e438de..67bd894daf1 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -305,19 +305,19 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
 
 &vmlaldav rdahi rdalo size qn qm x a
 
-@vmlaldav        .... .... . ... ... . ... . .... .... qm:3 . \
+@vmlaldav        .... .... . ... ... . ... x:1 .... .. a:1 . qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
-@vmlaldav_nosz   .... .... . ... ... . ... . .... .... qm:3 . \
+@vmlaldav_nosz   .... .... . ... ... . ... x:1 .... .. a:1 . qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=0 &vmlaldav
-VMLALDAV_S       1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
-VMLALDAV_U       1111 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
+VMLALDAV_S       1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
+VMLALDAV_U       1111 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
 
-VMLSLDAV         1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav
+VMLSLDAV         1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 1 @vmlaldav
 
-VRMLALDAVH_S     1110 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
-VRMLALDAVH_U     1111 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
+VRMLALDAVH_S     1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+VRMLALDAVH_U     1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 
-VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_nosz
+VRMLSLDAVH       1111 1110 1 ... ... 0 ... . 1110 . 0 . 0 ... 1 @vmlaldav_nosz
 
 # Scalar operations
 
-- 
2.20.1

