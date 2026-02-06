Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997E9E9129D
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 04:23:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voDMD-0004PC-9Z; Thu, 05 Feb 2026 23:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDMB-0004Na-U0
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:11 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDM9-0003UW-KJ
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:11 -0500
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-81f47610542so1197915b3a.0
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 20:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770351728; x=1770956528; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2HC49N+r3FDo4kaSsrqfKOmxBBKt7bfTNmIl3FbGEg=;
 b=c15VwPBAhXc3rlCBggHjwBMtOFapJ/E6RKFuuTOMxfWplVOC6gq+KU3p0YlAcaEHej
 +dOu+Z3Lg1Q1xruAa0iM9rO8F/GGq+bmhAbDmH9oSLQSLiz8inxWCj9acBq+ykWrmJMB
 drziGgARByp3wwExYq/1d3FBePzPNHq/nMt8RUMYBrcmQ2YHJNT2q+6jDQNSe57huwgs
 LUKt6e2EVuhA9PppjlmhuI4yiYVI9eEP0Btj89kRAfP209IBRwmM+Z9+tv+DXHIb2oL5
 Vzy5dbZ6uIKuvwVx5RSoWHLgwbZiIal9JKFCAqlxMa3qa9damkF6dWvYejNk9LYphBBi
 mZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770351728; x=1770956528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q2HC49N+r3FDo4kaSsrqfKOmxBBKt7bfTNmIl3FbGEg=;
 b=h8pT6cssF2ZK+tx3jKPz/6DxmA6gzDuFaDU+epH52vi3r9q/mhegJDRnDt57q+dsW3
 xv2PmZucE7eh9RHoqKLWMcybX4GD0OiBOflDDr7osmM0tS2Jm69V27fAW3zxinVxuyPZ
 RlAKk6nMnoNM7ToytaQeumhGBCs3RGy7ENU2q4CH/HKcIx1r+yjD7sPZYdNZh8kwtV9I
 pVg0A926gfrMv2paX63zNf6J/l1FRnHfP7pHo2aaUyz/EV7DXNUBL7qpMp3ch5apAOOn
 9c8jIKT5xD9KdJ4ixBp9m/Gl8X0Seer4/zVUlhxwflAKN1X1KpvXODNam8kMUawsV+f+
 SCrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhH+5CxDfPvudTO6zmDvbj3Gi5QzTjUxHtc/Rt4FScwlPJnwMfzH/LWX/dT4ALOLuTZU4errfkBQ==@nongnu.org
X-Gm-Message-State: AOJu0YzWGnG5kt1HSPbaU9PMKhjR0WIKl6ejEnqn2dtcoms7H49/cvHi
 47nhC+Ip1AlTlWRubS51/hCEkVHPHepLDY467Ni1uMlPlMdGDK8zekOAYUhJAzD19d8=
X-Gm-Gg: AZuq6aI6EsqI2EZeGCESDtDJiTnFKddGYkfvGlq5bk14apiB03S3yV6di+XVkJQ5HI8
 EZIqEUM3uGVllZbARl5SqeDBK5rsnJGa3QzavBR1orJleeKC3cLX+lo+sMDwTPesC2tDpXMjSKR
 qhX7M+BQWj4e7wuBURCAqCXHfieZFgK1p+4f2QJ2fTQokCNugcxg9VJd52piTmXQ//mUwOmg4Ge
 vp8JgI4sOsLRPX6556XysETNFMxWkWIpg4pD3MsF8TdknxhrhAxRmKYPINR6EU4rdxvCdinoy3L
 cfl5E7OsWiD++pnpSkH7yVpFRz+kcPltzf0+qLAV61ohHWlV+tIgX1tKsBxfYDB/S8BIrSEHfN7
 HV28HXEzx2XHbWwADLXwSjh6/KuFkKUDG+2ObmPLRqvEYy0X5O+0i8H62Sjh7XEeNvjL/XD7Tn0
 uemrxlzTRmy0hbP3QIaz821vhdlEHKCrCDBswBeeZmzQmegflp87TReOpb5FJL5gKi
X-Received: by 2002:a05:6a00:4acb:b0:823:167a:4790 with SMTP id
 d2e1a72fcca58-824416244a9mr1289097b3a.26.1770351727946; 
 Thu, 05 Feb 2026 20:22:07 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8244168fdf5sm926914b3a.17.2026.02.05.20.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 20:22:07 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Richard Henderson <richard.henderson@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 09/12] target/arm/tcg/cpu-v7m.c: make compilation unit
 common
Date: Thu,  5 Feb 2026 20:21:47 -0800
Message-ID: <20260206042150.912578-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 12f126c02cd..092ea218c92 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -49,7 +49,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sve_helper.c',
 ))
 
-arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
+arm_common_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
 arm_common_ss.add(zlib)
-- 
2.47.3


