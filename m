Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1150008lfa;
        Mon, 12 Oct 2020 08:37:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSq1RSIG0oDs47gntZ5JO0Uu9st6ygMOnqGE9iYax2Yd1PwmhHEnqFsvfLejtN78yJA/rb
X-Received: by 2002:a25:f206:: with SMTP id i6mr32103755ybe.68.1602517048207;
        Mon, 12 Oct 2020 08:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517048; cv=none;
        d=google.com; s=arc-20160816;
        b=r86c2SmwPiZ7S7iHpz3eZzJxyBzWAo8hNsZ4KmzLDCl63tdzEYAuwwvi7PxM4YI0jw
         k/AUrKg6RIIwiHekbhbPY6u7RJdD3gnru6VL/qX3Brim5p2dZpnoOToLxhyKoan72Cl0
         +ZgtlOjTiCHlHdw2Br//InbNHPRVLJodK/vTwd7oW+uykpjhhSJUo7+qJjWGiqqCfA9p
         cQZwP7o1u49mpTNRISnLdB9f9TiuboTDx6iYxqh+Zg92UAahI4G0Lf+FDXdQoZ7+Hkwx
         yGYOrIPwANDl1TLs3Y7/4+cNCVcPp5yyLcBS72rex3xKysvgXHIX4arJqPZx/qN3z7En
         dd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+ZwHV1TY0j+MTqvjQNw1IJRg8wBizhyo8ltO1jMhlE8=;
        b=MDnpCS/sR3En3sfVms7fmeeQaYd22SL3I/kfSglLqTgeT1fvMVMkhCFo/x/RttzmZv
         wfGgaAUVJD/CjMikXzndFXLTfnX6fq/Gh3UAxR0dKPjKif4/YuVuiSh45df0dgKwf122
         zBfJ3eN6ETKVZmeHkHtYwlSIwehgc3TCWIA9q6WqDmBGYzz7JiwG70/6qul68ST9+e/u
         AwZa9TVlVLFO3ssIzurf55eQ0Rscn0i8mFc3RBuVo6EmuoSuRGQWqWZoIbxfjRyctjVl
         WZGpWN/Nx5N4ldV3n+65jFjogURV3vKEJQVwdMZe/B+BsRLW1b1W5axg+ljkW99osxT9
         G0XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g69A2tRd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 65si6002870ybb.207.2020.10.12.08.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g69A2tRd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzt9-0002GB-II
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq6-0006QQ-Up
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:18 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq4-0007E5-Tr
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:18 -0400
Received: by mail-wm1-x343.google.com with SMTP id p15so17501989wmi.4
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZwHV1TY0j+MTqvjQNw1IJRg8wBizhyo8ltO1jMhlE8=;
 b=g69A2tRdba4f0A0mocmGIFdBA2FhKTst5Hfi38fpzLPTYMcOWIJ2xb3L/R6gyPxbyU
 vFhpNFQK0daY/N7M12Sezu+aUv6wzLnyIWSDk5mTrCaTThXvSg8+lHNae3UCa9xYO909
 6oXPexeakZR8Hc5HdYfYsG/fCoruErjK+iTWI517dMwUu8M+8xdHoUd7m7Yu5Z5OGZ/n
 bcY+685c39s9kort8LIBatCnsC8r7DEkJgjBKD4J/8MwxCVQxt8bVtRTEV4/2Z9QD2MU
 vuaRPNIxh+zkZg7Eofkw2P7b3b03oqN5pk/7dUYgubdVkuvEUKS3OW9BaWHx6uR+Nfjt
 /UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZwHV1TY0j+MTqvjQNw1IJRg8wBizhyo8ltO1jMhlE8=;
 b=NxGngPR1pgBMW+Jei3scnuiElIEibq3stoTVBZRuukFe1YxiWtGMD/i0sqlsz6hSVe
 pGOe4qSzViqmxXZH9wDnyRXevaZyo5sLOQMtu+Cs1VsmNzENjdGxVG0LtNOlnkVYLjp6
 VZFyDk880iUDsGizgz/ntz6Cpf1hZL7NiQ+4pKoXEPsQJ20cCQF4pdwmGCcxXbTY+s69
 AbT+Ljrw6YzYyuonURHgqPd+nx+RHSYud0QBjn6vSrJ8NvnlWDquqPxAGHyJ9OOomrih
 +awZdtA3FOYI9JRnKI+nxuTq0gm8fYW/oNodl6DK9gzVjqCXBx6boCa2Ux9NaM11he0D
 V5JA==
X-Gm-Message-State: AOAM5305JuREQmWZpr64DXuH+qz53rKZMH10C01TnasiZBHqCF1QjiEC
 434Pn/ptmECq7uApEZEM7MDAsQiRlAPdkz4n
X-Received: by 2002:a1c:e045:: with SMTP id x66mr11411611wmg.104.1602516855317; 
 Mon, 12 Oct 2020 08:34:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] Makefile: Remove config-devices.mak on "make clean"
Date: Mon, 12 Oct 2020 16:33:27 +0100
Message-Id: <20201012153408.9747-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7fZZ5pxlUSJQ

The config-devices.mak files are generated by "make", and so they
should be deleted by "make clean".

(This is different from config-host.mak and config-all-disas.mak,
which are created by "configure" and so only deleted by
"make distclen".)

If we don't delete these files on "make clean", then the build
tree is left in a state where it has the config-devices.mak
file but not the config-devices.mak.d file, and make will not
realize that it needs to rebuild config-devices.mak if, for
instance, hw/sd/Kconfig changes.

NB: config-all-devices.mak is also generated by "make", but we
already remove it on "make clean".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I didn't remove the existing 'rm -f $(SUBDIR_DEVICES_MAK)'
from the 'distclean' rules on the basis that config-all-devices.mak
is explicitly removed in both 'distclean' and 'clean', despite
'distclean' depending on 'clean'...
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 32345c610ee..c2120d8d48d 100644
--- a/Makefile
+++ b/Makefile
@@ -775,6 +775,7 @@ clean: recurse-clean
 	rm -f storage-daemon/qapi/qapi-gen-timestamp
 	rm -rf qga/qapi-generated
 	rm -f config-all-devices.mak
+	rm -f $(SUBDIR_DEVICES_MAK)
 
 VERSION ?= $(shell cat VERSION)
 
-- 
2.20.1

