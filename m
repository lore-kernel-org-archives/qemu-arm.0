Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1569318lfr;
        Fri, 9 Apr 2021 08:05:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUAS8yf9IacRCsp+V/fvJQgubYbL/lp9mZO2/h8YigHabNVVyP4XLHA0GlCQb2y60Mpm0o
X-Received: by 2002:a05:6e02:b2c:: with SMTP id e12mr11745416ilu.161.1617980752457;
        Fri, 09 Apr 2021 08:05:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617980752; cv=none;
        d=google.com; s=arc-20160816;
        b=sDhCXgxgUtC8RVVX6fFcQ53JjgAVT8OosuDpge3zLrSml0yllpavaNGyRp5WrdCuHD
         pOuVzzTqTwC2lnawQisaB6qRr0HvkgSD3TNfiwhuW9CrRZJ5hWVNsB2VAyaB7k/tjzhx
         u7mC+zoKCjRbg/vp9tn5GatYqawKS2h68c/DCDA6SygwMng1i0fmzKS+FeLjo9+HdoIP
         FBl0kwgM8iXv4IgBLsxbN6hWteCol86Au9ku6FG3ut5q034kNSbPOEZtLs0dWheDM1/2
         abmzNfv0TIwkhz7tKSbDzNCEe1xMFB7XD+cl+dNDxL4lUHS+sjKInjZ3iZkODrBuoRB+
         082g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZLG8bwrpw0+l/goPl94UIiaUdFIfsALImfUpgHbYc3M=;
        b=fg2CSjRu16mnyv+4IljuHw8tPnqkgwj3bK1pa2lhpzha6cRnIKrnh8XnSlgbp7bxt9
         9anxgTx6SZ+Jmi5npeXz6LMXOFqNU7cwiRmDMOLwsbFaxT4R9EQFs57Vk6ho4Qx2/MVf
         U0MVcpwu0zZgalk2IwhwUGlhKh+5QzmWWbmNDWxw6sC9pMyID1mjreVG6FQnZMqfZUcI
         JwxPQJ12TtORkFESanOBl35LUfh1KkrsISuhthtpipQecd+0/EWkPqn8I18dxh/UKQj7
         5XYDdhOIiNkGFaxi36OpjsK2rrfWvS+TuGw75PKL7zjtf4le/qiQlugp5+HH6QtWoR1O
         XiGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dn3GJHLh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si3032318ilh.11.2021.04.09.08.05.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 08:05:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dn3GJHLh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUshj-0002b5-BU
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 11:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUshS-0002Zo-Ae
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 11:05:34 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUshP-0004Qu-L8
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 11:05:34 -0400
Received: by mail-wr1-x435.google.com with SMTP id d11so2059431wro.13
 for <qemu-arm@nongnu.org>; Fri, 09 Apr 2021 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZLG8bwrpw0+l/goPl94UIiaUdFIfsALImfUpgHbYc3M=;
 b=Dn3GJHLhS9rwcgNusmHMGrbzTyjMON/VJsK32/EmRUYIBaMMRiQ13Pwngspnkb2oVi
 EmTlvFSyFMR4Zd6Zga6CoCEBPV66JyizLoK4YQPP+FfaR73xtzTwljRlbyBo0ef9fTSe
 u66xLMFc3uXUqkmVQ/eLa+ftqUUUcBI47V7fkwQ31BG9e0UFFKoit3GBTuTFgZJV9Cri
 lHzpz3CNHpT2d1hgXFtsOiNvxdbmeL8FI+/6TmPw8fNVxSy7Jb7C4t4GKF9djqASYQ0u
 OeBdUSstbzxxydIo4juPkPqb63iGRcx81q+f6qkqjJt/evzvNr11o+RkicO5D/t519Vs
 K9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZLG8bwrpw0+l/goPl94UIiaUdFIfsALImfUpgHbYc3M=;
 b=bgx4ATPPxE+LnfXknyhIF0zP4Kk60MnxtALV/oAj0sgGcqbiY9HWco9PhgtYviGzP5
 nTGZnzl93xE8xfbU+rAcz2UIDjyFs/qT+hqcmT/COdWYhksBhH0kT+US2RZSL0OuDQ5A
 pv06A8IjHqahSBXetEG9xi+jNey5S9z1MoiSlb4VLwxT1Y25trFh/cBXMvk6lIuBoAsi
 dEos+NhjMl6j8LwzS6XJy6Sx1hdfa/KZ9mxczEf2F/C1fA8XqpzCBjiysQwZNBM7acNm
 lcVV7LSiHikAACsh9Gt06a2K8koAhshk0Yjr0Np568aSuUU761jdP1Un1ao3qG0DTSoH
 1Zqg==
X-Gm-Message-State: AOAM5310e6ssAFttY/3GJmEgtrYk8zfPbywDovgoURY6mEClMF7kfkac
 topKDOWdm5qIWsM2KlGpu19j7SwfqiC12Fdw
X-Received: by 2002:adf:ee03:: with SMTP id y3mr17549843wrn.323.1617980730383; 
 Fri, 09 Apr 2021 08:05:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c18sm5048094wrp.33.2021.04.09.08.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 08:05:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 1/2] hw/arm/mps2-tz: Fix MPC setting for AN524 SRAM
 block
Date: Fri,  9 Apr 2021 16:05:26 +0100
Message-Id: <20210409150527.15053-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210409150527.15053-1-peter.maydell@linaro.org>
References: <20210409150527.15053-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: YsWmTnQxO/cl

The AN524 has three MPCs: one for the BRAM, one for the QSPI flash,
and one for the DDR.  We incorrectly set the .mpc field in the
RAMInfo struct for the SRAM block to 1, giving it the same MPC we are
using for the QSPI.  The effect of this was that the QSPI didn't get
mapped into the system address space at all, via an MPC or otherwise,
and guest programs which tried to read from the QSPI would get a bus
error.  Correct the SRAM RAMInfo to indicate that it does not have an
associated MPC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 3fbe3d29f95..5ebd671bf83 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -238,7 +238,7 @@ static const RAMInfo an524_raminfo[] = { {
         .name = "sram",
         .base = 0x20000000,
         .size = 32 * 4 * KiB,
-        .mpc = 1,
+        .mpc = -1,
         .mrindex = 1,
     }, {
         /* We don't model QSPI flash yet; for now expose it as simple ROM */
-- 
2.20.1

