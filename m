Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp132477ocb;
        Mon, 3 Oct 2022 09:32:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM44M1YSPhntD4+AV8QnRZVmdFlW6gn+2neZuO5ZWXCy+rZljZJBL4Vb3Iru+ute/uCDc7hV
X-Received: by 2002:a05:622a:307:b0:35d:47f5:c1e1 with SMTP id q7-20020a05622a030700b0035d47f5c1e1mr16452898qtw.206.1664814734154;
        Mon, 03 Oct 2022 09:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664814734; cv=none;
        d=google.com; s=arc-20160816;
        b=NzSsVAkdN2Snd4KlK10MHAWpBIQsgSXJZMVSYrpkm6kLn4JKUWGmIlUuvNfD+Jdfu0
         CH/LlujXWJiOhiWPk2js8Z9340rSVntjoBqevHV+W4Y5/369LEodVLnYuaJOk6/xwq9T
         kMcTcrocbfJx8nsvcatOs3w1PwDt1nBHoSNGoakZCWRdtt/hyjk57uJ0xNV/1qj1rE49
         dbi6Vm3LSGuqJd5vRFjJ3a3Rx9Cmjd67+We1Kd+9uO2CPJ4qYUtm7pxkqFxh2R/4Hz59
         p9+a6SvtlKXLfxizt/qNWCB6D/1gJ00FP0rEmg9xfdxyaT3f9zmQZU58Su2jK2wgc/Tw
         +iSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Lbf7DgzaGFcfNvaM2KqWvg7D8B8oETdPLTVE9MwyWyA=;
        b=QIea74BTfc06ZXZtUCuAIZkpZgcqI8rFWmbIeHEK/ccLftrrmmy4MNUqOuHC2Qm+7x
         fxx32mF2Br8WpFUQ4Z4EOU9ns28n+S+QN88ngGdSmDZK+ElKn+bVSuLGAtk/V2s8+9GL
         +aXmJWFMRoIZ7qR7g86zLqdHWNcthtFAcKqdpeuBy34Ektobe+Qgd0dxsdpmIZZu2pmL
         rFh+UDvqtLXgSObEbhKgMsaLUmNo8p5UnNaJIZ9jJUg+P5rzVRaK/3fUJwjBkYYcFL/g
         Lup1eZ5KMLIEwWmL5BXrbE4PpGt9Qn6AGH+L+kSQBgGsmqSFQ424vHwM6n54lyMJ7Z55
         1PKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ztonl5fA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn13-20020ad45d6d000000b004b170e4267esi140972qvb.110.2022.10.03.09.32.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 09:32:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ztonl5fA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofOMX-0005BN-MY
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 12:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofOE4-0007sR-Ex
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 12:23:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofODx-0000Hl-37
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 12:23:27 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bk15so17502396wrb.13
 for <qemu-arm@nongnu.org>; Mon, 03 Oct 2022 09:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=Lbf7DgzaGFcfNvaM2KqWvg7D8B8oETdPLTVE9MwyWyA=;
 b=Ztonl5fAaT/D1XIUjRAGtBLqZtEtQcOO1AcvFUMECHec08QSr81I/6drRHu7Vo04kZ
 TafWgLq/jo/oVeDQBhbq/+yjvy+neYzsDL1nhY9HshWoQ7H5YifBu/zrFDuVnTrArAyh
 dqgzyKH5AEu8pzIszOGakyk4M5TXQGU/uYEFw9pKVdD8K6oXAuJBRe94fWIC1cnN7Hzb
 5JkCdreKWWSudhFlLBYT3av90wbwunr4PatY3yLslPOJ0sqPH2KU9RnofAAM8yAWwhiK
 mnWbcaGZMqYVbb8cW/MsYTvGxPr2KptdfHJ8JAoDjDunQs1wT3OobfAZTPvO/UZnp0ie
 VyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Lbf7DgzaGFcfNvaM2KqWvg7D8B8oETdPLTVE9MwyWyA=;
 b=73PbN0fkVJteTvgscbMEvUXN4UWJMV6hBZ5RvQOgO/Z9Dx9ZkU9S7wz2aQC/I4X5XY
 vbPdN1iMMn6qobDmDNGv30qn5CEVn8HAcVzgvK8623iVwQ+ML1qSg8g/96aJXb89uhUE
 kgVXEPqJ0L9PZIVgem9u66p+2XhIperRqDnAaDC3hH5UYcdG5jZbuelb5POL10uUnF7Z
 YeG2TcVXXBulk6akIHAeBpARX62bzeK/mVkiscMl+W3TR7D8Rin1m+4wzOE715Q3RUh5
 Lk5pUQVQITBDbT+Lk7PKjuHChpSMKvk22e+8+nJ9Z64VG8TvdCzmoGOHlHbaXjBzu5YI
 sYXg==
X-Gm-Message-State: ACrzQf26weyUeQ0ut6oQ3QIpt+aZKGy98WZUOvqY3G37OGdcZU04937V
 UU14zxstFV3dJd8x1Aw6DTwlr3WCda2bxA==
X-Received: by 2002:adf:dbc3:0:b0:22a:d393:bd84 with SMTP id
 e3-20020adfdbc3000000b0022ad393bd84mr13600563wrj.626.1664814199791; 
 Mon, 03 Oct 2022 09:23:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d62c2000000b0022afce9ea93sm9897856wrv.40.2022.10.03.09.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 09:23:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] docs/system/arm/emulation.rst: Report FEAT_GTG support
Date: Mon,  3 Oct 2022 17:23:15 +0100
Message-Id: <20221003162315.2833797-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221003162315.2833797-1-peter.maydell@linaro.org>
References: <20221003162315.2833797-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JGlsqX+ngAU0

FEAT_GTG is a change tho the ID register ID_AA64MMFR0_EL1 so that it
can report a different set of supported granule (page) sizes for
stage 1 and stage 2 translation tables.  As of commit c20281b2a5048
we already report the granule sizes that way for '-cpu max', and now
we also correctly make attempts to use unimplemented granule sizes
fail, so we can report the support of the feature in the
documentation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index be7bbffe595..cfb4b0768b0 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -31,6 +31,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_GTG (Guest translation granule size)
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
-- 
2.25.1

