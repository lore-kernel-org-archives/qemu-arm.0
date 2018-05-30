Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5022927wre;
        Wed, 30 May 2018 11:05:16 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKOm1y0uSfHnjYuaHbfsOeMV6K6cwQmNJxtflDG414/e4gHFIBDz9Jc/D8jypQTfe/iUS3T
X-Received: by 2002:ac8:31b7:: with SMTP id h52-v6mr3663649qte.100.1527703516899;
        Wed, 30 May 2018 11:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527703516; cv=none;
        d=google.com; s=arc-20160816;
        b=ajuwTlBki25VKB2bySNTTPwPCTlK+yz8dOLvkq0Q9y59e+oOz5VI/OodLRqIwlq5Zg
         ZWN/bXGlrH7dyZMs/dYvqOnU4jbvDwpFJhIwoD2mHIstitNJqLx/4kl7MBTXpE2vw16O
         VcK06KMN0QQRUTlyW0KJqZD08aHC62aYxtRNdLcqbljGxzQu6+4yv1nTksdeq+PqAYh6
         tJljRcnG4KNTenPSYZ4W1z5mv5e42k3UAvXfqtz8DKrxdqf+mRPay2Ia6Uj1SMr/nJzz
         mnaNsyE6cYb/PCdcxRf4LDyqUobqJ1faII4f86m6tyYTI2zNMVIDJUcbxqLQt0ubx1Nc
         cF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=oyxFM5ORC2u3ySgE1d8lEI9lCFBcoWljxqJhU6kL95s=;
        b=UNwlqTL/DSgHtFHur7LIBVn1+HhkBIYQnPCcS+cY9p8ghbprTVzzvYsuNnBSxHFPYH
         MOt+0X+hMbWp6LKEnqOu2aGIac6OjM9p6fgPcEDwmU9h7HMRf6IKLEGiwbnwtCLbByqe
         Rp7ECr6m1vNQNE0FO6j6I4hOJbLkDRIa2F7+4Tfqj2BHmGL/trXhewA3CKmxdgIbvkkD
         AAVxch1xeTWdBON5Vr/L4UqHcmoGNucgWkcGMYzbPoG4cXxHhErTYtcBwbNYDvX+sbqd
         9UoZN1BGo+H8VvURtNPBcKDvMPN9rMz+Jt9/LI/C+ES7ePQ1f5PfsA8hJ4ri6VrxOoa7
         RLdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YU0eCKMC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9-v6si3012975qtd.107.2018.05.30.11.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YU0eCKMC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5TI-0004Pn-AV
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:05:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pb-0001kS-7f
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5PZ-0004L2-If
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:27 -0400
Received: from mail-pl0-x236.google.com ([2607:f8b0:400e:c01::236]:45908)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5PZ-0004Js-Dc
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:25 -0400
Received: by mail-pl0-x236.google.com with SMTP id c23-v6so247577plz.12
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 11:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oyxFM5ORC2u3ySgE1d8lEI9lCFBcoWljxqJhU6kL95s=;
	b=YU0eCKMCqeRO/43VLApx+GDVJ7sHLA90x5kPJSaMKiZtL0eVOH1fgasbgNmGeIVdwi
	R4VyHCDF+iQsNKQH6MQqgdnnbt5qFQ0kviuhOtqGErPsZK+lu26o0e9np7uoHUWXSNAo
	QO87XdBhz4vDJI04N369VzbQgmCvjF7ZYLmrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oyxFM5ORC2u3ySgE1d8lEI9lCFBcoWljxqJhU6kL95s=;
	b=GLAANvjL8LZKC4b4Xva27FErhFKWMsFsO7R34w+RjLbCMeSNWaXnSxdSfGZTBtIgMc
	MyEySy9ZyuKpGreb+NQQCwMzlkongt5KF6RzVHWDd4+0hSO01o/Q35cQYzPKEsKQOkhr
	vprmwakgCXcs2IEwlcHLqdl5aqFDMgBw7YhZ7CyNWbWf5WaDf2ks+DtMGvK3Rjo2y+Bh
	MZLCvoMMQjXnR0WUGBysGVFBfmrnXMW0K/aAA5ZI82/PwbjajzFO8YoHF2H6mrgpiWWU
	n4HD3sklawXoi5aJkJsAaT4lrpJs8gcjhQCmWhC7HlUE/naF888T0iFTuPXQNnw7A7NJ
	3o2g==
X-Gm-Message-State: ALKqPwf+CR/gv9IASi4tbc7a1pDWZoMBXf/Oq0h88sqC8OdXf0/D6OI5
	AUaianPOIx2Be6y37WavCYGYNZQdzHo=
X-Received: by 2002:a17:902:6b09:: with SMTP id
	o9-v6mr3850823plk.256.1527703284384; 
	Wed, 30 May 2018 11:01:24 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:03 -0700
Message-Id: <20180530180120.13355-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530180120.13355-1-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::236
Subject: [Qemu-arm] [PATCH v3b 01/18] target/arm: Extend vec_reg_offset to
 larger sizes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jVF0PIg+d33O

Rearrange the arithmetic so that we are agnostic about the total size
of the vector and the size of the element.  This will allow us to index
up to the 32nd byte and with 16-byte elements.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index dd9c09f89b..63d958cf50 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -67,18 +67,26 @@ static inline void assert_fp_access_checked(DisasContext *s)
 static inline int vec_reg_offset(DisasContext *s, int regno,
                                  int element, TCGMemOp size)
 {
-    int offs = 0;
+    int element_size = 1 << size;
+    int offs = element * element_size;
 #ifdef HOST_WORDS_BIGENDIAN
     /* This is complicated slightly because vfp.zregs[n].d[0] is
-     * still the low half and vfp.zregs[n].d[1] the high half
-     * of the 128 bit vector, even on big endian systems.
-     * Calculate the offset assuming a fully bigendian 128 bits,
-     * then XOR to account for the order of the two 64 bit halves.
+     * still the lowest and vfp.zregs[n].d[15] the highest of the
+     * 256 byte vector, even on big endian systems.
+     *
+     * Calculate the offset assuming fully little-endian,
+     * then XOR to account for the order of the 8-byte units.
+     *
+     * For 16 byte elements, the two 8 byte halves will not form a
+     * host int128 if the host is bigendian, since they're in the
+     * wrong order.  However the only 16 byte operation we have is
+     * a move, so we can ignore this for the moment.  More complicated
+     * operations will have to special case loading and storing from
+     * the zregs array.
      */
-    offs += (16 - ((element + 1) * (1 << size)));
-    offs ^= 8;
-#else
-    offs += element * (1 << size);
+    if (element_size < 8) {
+        offs ^= 8 - element_size;
+    }
 #endif
     offs += offsetof(CPUARMState, vfp.zregs[regno]);
     assert_fp_access_checked(s);
-- 
2.17.0

