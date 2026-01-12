Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08426CF45A4
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 17:06:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfLKb-0006ib-PL; Mon, 12 Jan 2026 12:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfLIs-0006Cy-6y
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 12:02:13 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfLIq-0006Ao-QD
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 12:02:05 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-78d6a3c3b77so60196177b3.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 09:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768237323; x=1768842123; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5U+EmH1NHUyJCyVLYQH3bGY+ISVEX/Nc+x144y3zxMM=;
 b=n2DtXxa143RhJJ2icEwBA1j7R2VasobonGkE3sVFndQlXXnx0CMMnEAk+loRSVBNuP
 UGpR+8kEzm7Celrw1Kf5GKRFo4370bxqLeR4AmzX5gwnzDYWI2HD75oRXsiYzYGQ8MNj
 9k/rvGJbQymQuecgnBxxGYgor+fb9LgpUppLDEHJMTzRDvZ1s9y7HZqggcY0fKxq0AEl
 G3TV/G7KMWXUovfS5pk2JHcMKGN/sV0PEUCTcpUkrabq8BIvbGYi88V/lAHgqwrfDvsN
 y+0DerSpy8+yfoq/aHPd3gbzwr2R32h92ODFBuPmlzec3G1pwehdDQcDmUOxZ/WuuRZR
 EgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768237323; x=1768842123;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5U+EmH1NHUyJCyVLYQH3bGY+ISVEX/Nc+x144y3zxMM=;
 b=GMnDuXFsE9HHE2GTMGsMh5zRel74Re6503a7m/4IkWNIOth7+fVyMVyJnStmKDp5AI
 FYH4GJW/uXyyNFV0APo1BIgqABVDHJlysghHBHWroWXdsW2qpQwbHFr89+fkWzOmnF2K
 Fn5RczFHd14kNGfA8xUR7aYW+hKiEiPdyiSMvmN732H/W4vbNsa7eNZa16pmcnKB4CjU
 qWNsifT/4xF36V/h5PaLVVhgTxT0C9A5/n/LRr9dseOmS7yZ0kW/Dkc6/bz724Ysqgj4
 IR4F657H+Rm9t31bAt75ZIH0KPNdfqn+3n+mFCouAZXBdrsWdMnxjQgEOk6JzEq+k6bM
 jETQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcodAWNt7i7LleIIsLvoDd+DvwL8FEugojSU3OwzB/7aZ+UZojtFeQ2iR2ZIigsYGHboDs+h0J7g==@nongnu.org
X-Gm-Message-State: AOJu0YyGzjGQTw98V8MzSekdODoIjRWpAxtt2JFRGs0Y6y0L0nnOKy2I
 HMWDHXgfEVGEdoPJ1rPgze2z2nQ3ed37ftNVSw2xdm76Mctdw+9V/fZnYr+0rPw5zagCOFMWM1z
 b6bo2zHjZXd938wB96lZUdTkWUunGa+kR7z6JvHcpbQ==
X-Gm-Gg: AY/fxX6RUhaeSZ59ACw9b2EFHJIMvlH5JqB6wm5Z0uzWZkLm/IJui6q/A+SiCIXnVWv
 CWyxSIe4L+jG2m1JluMrm+525QmFHl0QVm8oveecEOZTByJUhr8qFP2d6lvkIZiI6CAB1Z7SVMk
 kcFX25Kys76yc+74/ZFeY9C9L7iT88e6lE8bXDWjFdyh1Cp0TI1/cjW1ank19F+zKO87FYM1dtZ
 QCMWRt/rXU972sJSg22dHVxq43RmCacIBVGath9nYrL71bzZlvp6YWFjDKBiOo92FyEoL5/940x
 hrejfgRsE6ldP4ZucUswd9k=
X-Google-Smtp-Source: AGHT+IHo95rgvdbUh+BH4AS6xEmnr3edzqzOvJ1ZbWYebkXySFPY7L7qX0DhE0d1WA38j9vGTL9voEUd27P1/0IMxb8=
X-Received: by 2002:a05:690e:4004:b0:648:187d:83e with SMTP id
 956f58d0204a3-648f62e04b8mr42313d50.37.1768237322905; Mon, 12 Jan 2026
 09:02:02 -0800 (PST)
MIME-Version: 1.0
References: <20251216000122.763264-1-pierrick.bouvier@linaro.org>
 <c8e80923-d837-4874-a072-d5ae579576a4@linaro.org>
In-Reply-To: <c8e80923-d837-4874-a072-d5ae579576a4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jan 2026 17:01:51 +0000
X-Gm-Features: AZwV_QhRDv73PJ_orOaeMCzp7vAQRNiAOrxIUWNa-XrXwGx7bFmVuILttmqIoGY
Message-ID: <CAFEAcA_iXHEFTJ0mS+kRC=rNxxhyCHyw5R=nQNMXYE03qkBTZA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] target/arm: make granule_protection_check usable
 from SMMU
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Tao Tang <tangtao1634@phytium.com.cn>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 12 Jan 2026 at 16:29, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 12/15/25 4:01 PM, Pierrick Bouvier wrote:
> > This series prepare granule_protection_check to be usable from SMMU, for
> > implementing RME feature.
> > It's based on Tao's commit [1] extracting ARMSecuritySpace from cpu.h header for
> > convenience.


> Another gentle ping.
> This series has been reviewed and should be ready to be pulled.

Applied to target-arm.next, thanks. I folded in this minor change
which avoids the "local variables not declared at beginning of block"
style issue:

--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3785,9 +3785,7 @@ static bool get_phys_addr_gpc(CPUARMState *env,
S1Translate *ptw,
         return true;
     }

-    const uint64_t gpccr = env->cp15.gpccr_el3;
-    const bool gpc_enabled = FIELD_EX64(gpccr, GPCCR, GPC);
-    if (gpc_enabled) {
+    if (FIELD_EX64(env->cp15.gpccr_el3, GPCCR, GPC)) {
         ARMCPU *cpu = env_archcpu(env);
         MemTxAttrs attrs = {
             .secure = true,

-- PMM

