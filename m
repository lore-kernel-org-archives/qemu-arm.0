Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1497064lfc;
        Thu, 11 Jun 2020 07:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCp36kqVtXgcB5sUrHqd6HcEDksYr8I2EZHZjMZgZt9UWfFjm0N9OKO/xsDiiBvctmL+G7
X-Received: by 2002:a5b:74e:: with SMTP id s14mr14331886ybq.104.1591886764367;
        Thu, 11 Jun 2020 07:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591886764; cv=none;
        d=google.com; s=arc-20160816;
        b=Cm2ffv0JdrNm2hAlV027AJQrfr2t4UqzEeYb/TaoJpVUGlvdJOJ88JMYDKLL5iArga
         HowwTGcPVmUPYV7kHocnchhZC8+XPKu7D4vJKpNtpeeBiJknezFjC9CXLFctVHZaf5ww
         Z3R7rwu5N8Vd9AKs7lPRHPoc6SXuG+/rcDI4dz3ehk60SCw/78A2KFlkjF2eLUZfSJcD
         YsRbWF1iISCTdp7gRYNERluoeMNfvmmPBJjvGR4cxYB9PsGb7F3VOiXLI3o6eSgHlGdJ
         NmXaUWCVWRZLUcXuNyWhnW1HUISCoYvqz/NjbjSZPUP/q1+D+ifuRhxDB5P+XW3ALvnZ
         ilVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=GPgXjokSL0nkYUP8XQBRLPlsmz7/i7RySDFmZrOiI4A=;
        b=RWdJg4gVyGRsrQIHP6CXXCkeFWR4T2F1NKjnC3YIluVo+s/VyN+1NhcesfLbc1dffK
         d/LL+AQHGeUI/i2RNZ1QEzyZGCyz9HHDjmpsVCWtmOd8DpKS+tkqHIHT/koYK24kwsH+
         P28qGLLkvkbcpKu7WoO4+IsoQYKgOscGqhmEEXR3Pr4Diejd7Xw0VBua2beiahuE+uSM
         N0sY570u+N+u/AU17hEWvFQficgL0oLUQvhP19dG8H9uvv04nR2hbz7UI7sqpnuAtrtl
         M/zeCvLlKw3GHbPHmWPfyCBItCSpvzD2AFP1X/L9e4PWVpLQswUSDHx/vPjP6K5Kv67z
         ElTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOKWqBLH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si2437022ybf.393.2020.06.11.07.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 07:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOKWqBLH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjOSx-0001RA-NP
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 10:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSf-0001PI-Ic
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:45:45 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54552)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSd-0003lX-Co
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:45:44 -0400
Received: by mail-wm1-x332.google.com with SMTP id g10so5204169wmh.4
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GPgXjokSL0nkYUP8XQBRLPlsmz7/i7RySDFmZrOiI4A=;
 b=nOKWqBLHsMpmQGLC32xv5bKefbRn+lk/GsAKjxNDBUaBjLOgcQWX6IBe/XjdvSAWwk
 5tu8lB07rn5qKOJhc+q1EHS6jOnqCwPWczdUxTtAUxjUrKqFB94lGDa9hZsYVApcOirW
 4AyCfH8G2emb4pnkx8bTxbOWktegzd8I/7WAa8JhJLN0LJL0ZsFEgX8+mHl+WWTAo4o5
 HU5Gl+UdF0pk8p1FwddyTt1E3ZvzHjCtYBxg9jOUSjErJ6X590HGsOz2M8THC0hRdVru
 4pY10zY5UAssRrUJ/bTYCU4uubtCfXYV3vbWOWhqBvOrJEDc6xKR/wqWxlFotqaJvJzt
 M7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GPgXjokSL0nkYUP8XQBRLPlsmz7/i7RySDFmZrOiI4A=;
 b=GXyHFAjWwtDlrNqdZ40XInEJY7MNdYIBS4A84nxaL/Vyid3NKx60P0tZV6AW+HLT/Q
 rujTG73tnaNlzmqaLMPIkrTOwZHDMtSNUk7lllXp2pBN2sMx0fXCkmG8JnyCYYKt+m7I
 UCbyy7mTw24NmCIzDqs8Ok+1Ltes0wfez0r4D+8dqxboJV6n7uEgvKxQ9UJUgyeL24Az
 gtZ23YaMc0j5YhUeWctS8jTwbXRd30B6oOWDu0X7mcivxUWbeqoD6QsJLy2X2OhE43dj
 8k6d4EKlXJ1nNSOepuTbf21oGmv+SmgccIn7AfC4+3Wu0n7QXD5PEsRmdfO2TP6wsNlc
 /s1w==
X-Gm-Message-State: AOAM530Uq7Ocd4FwNImlG9kI5Uo7XWsLv1aJBNgrQ1lsizX3raMZU30F
 eNilxdZF0diVBGXdCWos8HexVByX06VKlA==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr8210172wmb.3.1591886733452;
 Thu, 11 Jun 2020 07:45:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h18sm5271658wru.7.2020.06.11.07.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 07:45:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/10] target/arm: Convert 2-reg-scalar to decodetree
Date: Thu, 11 Jun 2020 15:45:19 +0100
Message-Id: <20200611144529.8873-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5niNgGvaRWQH

This patchset converts the whole 2-reg-scalar group to decodetree,
together with the VEXT, VTBL, VTBX, VDUP insns which don't fall
into any particular group. The only remaining unconverted Neon
insns are now the "2 registers misc" group.

Based-on: 20200609160209.29960-1-peter.maydell@linaro.org
("target/arm: Convert Neon 3-reg-diff to decodetree")

The first two patches fix minor bugs in earlier parts of the conversion
that made it into master.

thanks
-- PMM

Peter Maydell (10):
  target/arm: Add 'static' and 'const' annotations to VSHLL function
    arrays
  target/arm: Add missing TCG temp free in do_2shift_env_64()
  target/arm: Convert Neon 2-reg-scalar integer multiplies to decodetree
  target/arm: Convert Neon 2-reg-scalar float multiplies to decodetree
  target/arm: Convert Neon 2-reg-scalar VQDMULH, VQRDMULH to decodetree
  target/arm: Convert Neon 2-reg-scalar VQRDMLAH, VQRDMLSH to decodetree
  target/arm: Convert Neon 2-reg-scalar long multiplies to decodetree
  target/arm: Convert Neon VEXT to decodetree
  target/arm: Convert Neon VTBL, VTBX to decodetree
  target/arm: Convert Neon VDUP (scalar) to decodetree

 target/arm/neon-dp.decode       |  60 ++-
 target/arm/translate-neon.inc.c | 627 +++++++++++++++++++++++++++++++-
 target/arm/translate.c          | 468 +-----------------------
 3 files changed, 694 insertions(+), 461 deletions(-)

-- 
2.20.1

