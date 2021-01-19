Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3226493lfq;
        Tue, 19 Jan 2021 03:13:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn9I1DWiJuydU+Il/X+zF4rZWnDcRs6LqlBqIziVyG/SgulyejrzgBX0jQ4D1aYCnL/k+V
X-Received: by 2002:a05:6902:510:: with SMTP id x16mr5380881ybs.317.1611054821555;
        Tue, 19 Jan 2021 03:13:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611054821; cv=none;
        d=google.com; s=arc-20160816;
        b=YjsPNVTJPEMEVXG/e4ku7WLKIAUMRiIEPfaggbbUeP7lFBGGuS1uiJjzoNCtHPTOsk
         9RocVwv+EerYDku8rjCOuvTtS3/vUCAegh7euSF4pUFoRw8FybgRYY8cTx5QMyOuybyD
         r+bQQNPAKVhUxOxaiY4zK3T1tQp8NRwT77rMT5u9fpVGQxEfMZcQgVnPD5hnEgQl59rK
         YajyphR8JWJgfIGDE1wvC1rX3+x3jelUNt2mbAykb1CuoTeldjT601t6MdZ9ihEmB3t6
         qnr5HpZqQd/CECx3SUFRr7dLh2rEDVjQS2LFC7PSBb1IfburrdqATUYKQwgYmDw6WekL
         P6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Va2ToqzuZXjLYTsrbZlOjg9ZDsVIJQMzTwvNuZq3HZY=;
        b=N8xlw3PDDkX9w6XMRYd8NZcwSxvx7QjZvGRbNJDLSVAfLvLLKOZWQoQKwhyqRP3EP2
         RySfnj4i1pH2Df+NHnQxIc5P8VE9R92MybdvMHYzwnFOVYZ/rnHGgeBQwxMNMcYzxB9F
         12mVE9tt9nRTVJsZhBoCKhVdWdDfE3iDBlDMWz4/M03XDYS6Q4sKTF9zMvcAa/VlZkw1
         pZeD2DyUTF9N5QGfDAom5AFNYHm1bFzOPyl6q+6glrS/8e9Bate+YSIddmUGMTkQR4k3
         AkQnEjQXjthcGOY+UubnaDxiBXcXTPqNQ4cG+CmfoMNVusW3bTUckH3ed8+TOHAaana7
         fFlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x40L2mUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k199si19721771ybk.295.2021.01.19.03.13.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 03:13:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x40L2mUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1oxA-0005Ji-Vw
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 06:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1owx-0005JY-RE
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 06:13:27 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1oww-0005LJ-4G
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 06:13:27 -0500
Received: by mail-ej1-x62e.google.com with SMTP id gx5so8684097ejb.7
 for <qemu-arm@nongnu.org>; Tue, 19 Jan 2021 03:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Va2ToqzuZXjLYTsrbZlOjg9ZDsVIJQMzTwvNuZq3HZY=;
 b=x40L2mUUILLpCyFJxOTslHgDR5TQOztFfbS9hrrx1LLz3sDUCFQQKGHxSLmgs26Q/1
 h37m5PxmJ90zHXZa8cWEykSmn2bOGPhUmM9TQs8mE0vPVxN4dvg1c+geIlD3J65fxWKq
 lcutKiv8akQkiu67TZ2c2LTgRoF2aYwM8zVucN/3/QIPwEqEQ8F41hSPSP3M2n5pCQV+
 bLLcr8M+3jenP8+70Z1yS1UUCFWiflu7M2mJM4nL9PMwayR1qkChpQFQ7IFd+dxPEOSr
 fdQnHESyzmQEnbnlQp7BVsi3dg15h2hB+h1/DWBiINHw2heXsm/iFLC9ZUaN9WbpJ0fy
 y18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Va2ToqzuZXjLYTsrbZlOjg9ZDsVIJQMzTwvNuZq3HZY=;
 b=OIJ0gEzKR2zQpqjJkgDMpKGuploATELeKySceI+YZiIAFGrmt9OUd3RWs8Eq7PMctO
 Nq7NgG+3VPzEY5Lq/fh/6dffOdBpxATnUAg8WT0Vvj+rLz6z4uE+UwzO75IT2Q0wqC1E
 Ej0o2J0MtXHT7kA/Wjijo9NeyA9bbMFE2jlheeCtOiKktTFEGx8rRsUVA6uLs76w4arU
 IbKZMHojhEhttY2DJeJxtdQN5ytdegvyqOgkNT0dofSRpyIpAOMee5SD+68amzu+kaaU
 Y31fT9y5n4bOz7G0WwFXaVolbAKr88tc+pTHp4XLPSCB5e+K2g5QvUf0qX7J/f/AiJIR
 vTig==
X-Gm-Message-State: AOAM533jg0kgRCg407xttLrCgrpXL6yCKXs0NR47/HzEkxzcRLBqRPYB
 YcOi0uc69HWqcalDT9OZoOY0SBqs0ir63KyDGCuQqQ==
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr2578993ejz.407.1611054804458; 
 Tue, 19 Jan 2021 03:13:24 -0800 (PST)
MIME-Version: 1.0
References: <12681824.uLZWGnKmhe@basile.remlab.net>
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 11:13:13 +0000
Message-ID: <CAFEAcA-S2-rvrKnH7Ew5OC7XHUmAX=VU5HKfFibaL_yCkj1Ejw@mail.gmail.com>
Subject: Re: [PATCHv5 00/19] ARMv8.4-A Secure EL2
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cc9PfyS+dxBb

On Tue, 12 Jan 2021 at 10:59, R=C3=A9mi Denis-Courmont
<remi.denis.courmont@huawei.com> wrote:
>
>         Hi,
>
> This adds Secure  EL2.
>
> Changes since version 4:
> - Fix NS unitialised in secure state stage 2 translation.
> - Remove EEL2 translation block flag in 32-bit mode.
> - Clarify comments on arm_is_el2_enabled().

Looking through this patchset, it's practically ready and only
needs a couple of very tiny tweaks, so rather than asking you to
roll a v6, I'm just going to apply it to target-arm.next and
make the tweaks in the process:

 * patch 6 needed adjustment on rebase as commit 00a92832f4532
   has already added definitions of the ID_AA64PFR0 fields;
   I dropped the now-duplicate part of the patch and adjusted
   the commit message to match

 * patch 17: added the change requested by RTH:
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2837,7 +2837,8 @@ static bool
msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
              */
             TCGv_i32 tcg_el;

-            if (dc_isar_feature(aa64_sel2, s)) {
+            if (arm_dc_feature(s, ARM_FEATURE_AARCH64) &&
+                dc_isar_feature(aa64_sel2, s)) {
                 /* Target EL is EL<3 minus SCR_EL3.EEL2> */
                 tcg_el =3D load_cpu_field(cp15.scr_el3);
                 tcg_gen_sextract_i32(tcg_el, tcg_el, ctz32(SCR_EEL2), 1);

    and corrected the patch subject line to
    "target/arm: Implement SCR_EL2.EEL2"

thanks
-- PMM
