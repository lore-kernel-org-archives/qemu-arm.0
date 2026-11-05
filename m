Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFEE606A32D
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Slm5PH+F
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOu1c-0001UO-AA; Thu, 05 Nov 2026 04:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1xOu1U-0001T6-CZ
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:44:44 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1xOu1R-0008Pq-67
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:44:44 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a2072b9832so2239955e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793871877; x=1794476677; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=hMD+5cZf1lc0fXUnrJe8/OruuWHi0aOyw6bbqJ8NCbo=;
 b=Slm5PH+F3dnca07k/EUzSGJSSwpaI0d4PrGbK1iR7UXWoqL92sW+A/Rq5pz7IFvaER
 DGmrkAUatxInWWhjm731wqjCGulfcXFiQW6astu8cHxA9RiKQxb/ot2YzxaW3g0+nJbr
 RZAmLZmsMIZVSPcLrV8RZjO7a3/OlW1H4tOXTcxYTinLVjLUgvnAawIOudqQfbQWMeGU
 49Y198k1+6yB+jNewUszMk2TfU5QQMagD4fJTXtIoKmyeJlQl6V/ybyUyy22yuChut/j
 VRUuldCjCJP+mjc8WLOEccD04pC0adWl7++z+rVHMI4RqRnDYNx0sC539xNC9uWXSjpv
 F9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793871877; x=1794476677;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=hMD+5cZf1lc0fXUnrJe8/OruuWHi0aOyw6bbqJ8NCbo=;
 b=zAO2cSOe2Fmi7wnk+EVkvaSPRzm7xh4FBYahaJNv2PCTEu6+mddzIX4aJmi6yO4Zd3
 jkgLIapEnvm1Tg8Zrrwjt0Vf7ketNOsEGHos1Dzt8qF/udTs1//yGXHbME0ngmhBDEOY
 oW1HvCjykKGeZBYnacigVdKqSujm4A6VnZ7dFa8klTfErDOSbr851RWv0bHTXW4V0QE8
 maAiZdrCjgVeJK7tZ3wtkz+DQLaOJggv80beCMHEMm4ifpZH6VED07bEsoMsv1pZ7eY7
 nKE06bzWerEbRldTiOZhID/AmppmIWIhILRIhvHpvBw091HE5XmPNCOLjCHHxHTUNRfE
 rZfg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwZHkSJ3y35QeALn/2bE9BmvCjkROgrUUbo2HmjHxnBvMDjwFdE+T/007fFh2otSTKrfekfxyYl4w==@nongnu.org
X-Gm-Message-State: APuU4Z/Yk6GoIr/7lbdnBjy+WOu0BDLPARhkkZ906JCVPTRyzpohbSaL
 ywbdjpWdvgOohTSABMoojLQiGSEMG76GlHHwEeSJJl4O84v4rA8mz8yMIn6NKab27Ss=
X-Gm-Gg: AYBFou0eO4KXZSedDP2X0XcgTIlE9d3Haa5wlIgN55Rfh+sHGSqimn3IlQwJz0cCjCd
 e1e8c/HyQqIfUjANSymuAMIwemTv2lURzNeS62K5jvATLMx9IeBd2XSa7mUN2vJXgO2FNmcKiXz
 Qcnh1qHJTo8/mEEoRA2unYs5ytD7S/hdo43sIGEz/0aB+zq76DknVby8fFHypXKWTJ/C8ZbUVAK
 3OfLHGUlNZlUPvITUA+B6wTKW7HsWvdYvPry6HSflSA/+kApX4uV/Fy03wFAOSJe9erJcTShGDy
 3HagmWhufckEqQTGWAsFMo1tUUceEvLpXLpT+KzPlgfW5IWEcRbwNKZ9p0cW2gJKiNwTv6UeT+T
 +KqrQX1kS9BKoXmSVmyl1r/h+ILYuZRTJqoN2IS7fn9xH0WlRQj7UzunvG08VPTyYYu5haO7Ema
 9XTW7LeX5rlX8mudp2bwfbgpROoNz1DUeojAn9VmDFr2ZhJjHjvebFqM5KwnyNHA0QN785+O1kP
 WXdC2+p4EgxoFakpBmCw2T2J/qApxrtgwXY3uKNf4l9MCXWrck3aS79ds/lUpY5fDPGTAEh4S31
 d0lBOS8l6Dtw/NxmS9SGDPi26vw9yUYcZ4vA+8PNYC9JiKHC3fj/Mtec9J3hgWRlAySpmP6SlFe
 fcKPvMHeDM8izOVym5UDnCM8TD59w1QdeTgTvedd9Il551EL0nEBfAjs/or9bpAelKCmPNuXpXG
 3RyOJSLbRIhl26zAeMDMGYDL/cSOav/vSFzvVHyzhFrUDctp2O
X-Received: by 2002:a05:600c:c170:b0:4a2:10f9:37db with SMTP id
 5b1f17b1804b1-4b55cf2fcfcmr33528285e9.7.1793871877441; 
 Thu, 05 Nov 2026 01:44:37 -0800 (PST)
Received: from satan.lan ([94.66.192.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56f5e65c8sm51500815e9.12.2026.11.05.01.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:44:37 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 05 Nov 2026 11:44:32 +0200
Subject: [PATCH] target/arm/ptw: check XN for ARMv6 in get_S1prot()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-armv6-xn-check-v1-1-fbeff926e692@linaro.org>
X-B4-Tracking: v=1; b=H4sIAP9P7GoC/x3MQQqAIBBA0avErBtQQYOuEi10nGqILBQiCO+et
 HyL/18onIULjN0LmW8pcqYG3XdAm08ro8RmMMo4rZVFn4/b4ZOQNqYdOcRo1UDe+gAtujIv8vz
 Daa71A9fshdVgAAAA
X-Change-ID: 20261105-armv6-xn-check-ebdd507ca5ab
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=CMQ/ElNoMou01q47s1nmPtmNWEwtljcd2wE57FrhP2U=;
 b=owEBbQKS/ZANAwAKAXcpx3B/fgnQAcsmYgBq7FAEXemRIWd7+U92DRkYMy0MshrFaVl7YkgXG
 KiNMcq4uu+JAjMEAAEKAB0WIQTMXBtORKBW84dwHRB3Kcdwf34J0AUCauxQBAAKCRB3Kcdwf34J
 0HVMD/9s0kAZV/EQSu6Tq0n8A625xWQzwb+THOLOTWzignB08mCeFeIGj6TELkFkEmU9bTFTvdP
 1Ni8r+XFAYVpq3HKce74PofWRHDwYXBv3pToBds8D3JOxptU4Qkd56471HaesdcgGdLssKiAxiv
 DWda8mTlgr12w9nyLgVsX8ukRDqqefW/ZWRvQ4C8G+MgN7g1f6nZ7OFqDVgs6gY/nnyEhZnUKLI
 JSl+s840IrzNA3bsLWyfiJhpodc7+3cPRUbIo1xhS9NdGXiHrR5MpDr3Ub4QnQm01xMgFNrfyNo
 XPL34n/vv7/AI2ombVFekjr3C6VA6AvR8gQEbrzkxKj49r4VcYc6UuiM5aw8VO8hg5/z4lw9e9D
 Pc57XBXUWo9fwMNYDX2bLNY28lwnvAEYSFD0BXGyc7K+NkTICuXnLzcqwJl2ZAyK+D5B0C2kSob
 tMltfNscb1+0A80QJddneUEbfAJuCp2Sm3x1LanPo+pymsAFJSiReP1Mh9b+QnHfbGskYrh3ZI8
 XhjoSRyzLPxrVtjWRNBYE/6RpsBxO9xHk97lEMXxNeeHVuLA9QONlz4a0nIz9GSA6XdLxt+hKvE
 ff2ipF5WANuI49w+ormSf6GbtXryYprHjLsOtOXfNc3WfjzSzsuuYBJpwtAkrICIvGOfFvJ+YyL
 N51F70IGowAJvnQ==
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32d.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For the ARM_FEATURE_V6 case, it seems like we retrieve AP and XN bits in
get_phys_addr_v6() but we don't check the XN bit in get_S1prot().

Change the `if (arm_feature(env, ARM_FEATURE_V7))` check in get_S1prot()
to `if (arm_feature(env, ARM_FEATURE_V6))` since v7 implies v6.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4367
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2e67d02493bd463cfd2d31ecf1316272ac3f1d99..b8b22b014e0574340a85abe73f3d9611d2360219 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1595,7 +1595,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
         if (regime_has_2_ranges(mmu_idx) && !is_user) {
             xn = pxn || (user_rw & PAGE_WRITE);
         }
-    } else if (arm_feature(env, ARM_FEATURE_V7)) {
+    } else if (arm_feature(env, ARM_FEATURE_V6)) {
         switch (regime_el(mmu_idx)) {
         case 1:
         case 3:

---
base-commit: f29ccc287a6cfdd51d3a4fd17fbe9af3310a0ac5
change-id: 20261105-armv6-xn-check-ebdd507ca5ab

Best regards,
-- 
Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


