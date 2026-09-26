Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1574CC98335
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:08:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMU6-0007bU-0P; Sat, 26 Sep 2026 03:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRf-0005GP-PE
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:03:49 -0400
Received: from mail-dy2-x14.google.com ([2607:f8b0:4864:36::14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRd-0000eY-LR
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:03:39 -0400
Received: by mail-dy2-x14.google.com with SMTP id
 5a478bee46e88-341027843a5so1049032eec.2
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406215; x=1791011015; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/KvXUSAQ15EFG7szh+0eupDvXY39FOdCzcgiBxzTtMs=;
 b=PaGqZ4XEVhhJwbToRMg02qHAktpd6QkoAb28dg20Cujr8xmrkagdemjJbMy0LH9WBc
 a3Mu8tKsAgpdq/kYWDPYs75sW7nG4VZNT6l4tI+KsG/TB1lmJduqCKaJmxqfWhP5IELz
 FpS+yo8NbvoVIoWVK5T72Z/URx224sxerpzbS2z+0reGu0RCx8uqp68EqktqHGBSvXmY
 xaHXyoHTUbRnUZGy5GTL0zEQ3H/XYKMnu23gEPEPx9tzSfCKzCu3p8QnVuHfnay3oTd+
 6S5XTC8BACecU4W4Dty69nfKjVWuWN+micYanHK94kSpQ47pK4FsJ9m23rzvcKlBSF91
 VeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406215; x=1791011015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/KvXUSAQ15EFG7szh+0eupDvXY39FOdCzcgiBxzTtMs=;
 b=rbdr8glwdsjDA5gzjJtlc8TCG8KvHeykRlWOthZpV0NMj1Z5udaXOeZM35eWUX48Bu
 pSU2/NmbRWUyRNOml5rsAfqGMyoz//94e7Hqg+wiRM3JCqdOAlSVqDp2la0zq4z/Sutm
 WOFjGRa+Qf0q1xEFF+j/LnXlRbokWu2C2+6MjWbvGwXqqZ8THiN2mDiya7Kc2KJxV+C2
 AlxeCqRfK/Oi/Ha9nyTeTrVlJrf+HLY3UvK17Vc00dO62r6Hk6fQYYQ5aKGwCtvbR6AA
 xexdiNHubNyLtHhBCBRW6zuFBPK8COcczCi0SgV5WBxR9qekTDXxwn2Z5JcgqUGcx38v
 e2MQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxJJpN3vVCWgStvf5L4zfFVE7UwiVzgFVfMp4cHNM6qTcCBq4eLS3UHI3dEH3EdXpsOAQsAk9LCnA==@nongnu.org
X-Gm-Message-State: AFuF++lFUxbGPmLsR0bpnPfmlr1863MQC8qDXzYyBvLZCeSRhFSwOS8g
 MIw9oRjptAU7lNJNnP4NTL247zizCkx0YPXYz3/USUAGx4CUTcZJLx6K
X-Gm-Gg: AYBFou181S9ap9d6CNgN+NGCEViee/6HfMSKvrdXiYfjwr3Z3js0ZTt39IHQVsT2FAQ
 cuT164LJH6rgi341iWNknPyeTTfWeAZnaPGoWmsRMiT9Muz7oMC2qBh2SXV7lWmEeaNgBwQex1f
 2/pqiIGAXSW70chqiEhnOdv9amJ0RW0pgmO08MQ4Z92yI8t4RIEhHbbPvApdZyPYy2xhUPB6kVm
 P6J0LBUjCLXJNFLfy6wkLASQELljzdZ3NE/dWS3LCvegRfmk7ndNn+DCE7WZ8cR2wfZXMd/J2wv
 zpZ4UUzwAB0/IsqdwHM2AdeS8D/wrg2aVugPT+LeRzfdxUZveQTMNeXJVvX1Bn8PtvjOwCwI3M4
 P6V91qKBHKDiz1N7bspKeFxK/QXj7HZ7PCgAbUr8aya0rF5XRW25xeiefviAWpos8xap0wC4LeP
 9fcFkleRop/1o5jp3ERBuNHw3u3dB8US1jsvHawiHjzgDOWyTOmD2eyENmM/Tvamm/0XQZFrPj7
 weFGjbt+drCrzavoIeWqHvCvOUtXPg=
X-Received: by 2002:a05:7300:f588:b0:333:f4ee:da89 with SMTP id
 5a478bee46e88-34273347be9mr2169044eec.35.1790406215338; 
 Sat, 26 Sep 2026 00:03:35 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:03:34 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 38/55] target/arm: fold arm_ss into common source sets
Date: Sat, 26 Sep 2026 15:00:37 +0800
Message-ID: <20260926070057.1234-39-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::14;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x14.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add arm_ss to arm_common_user_system_ss and arm_system_ss to
arm_common_system_ss. Drop target_arch and target_system_arch
so ARM CPU objects are not built per target.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/arm/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 0369f96b4cc..11815a0908d 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -68,11 +68,11 @@ if 'CONFIG_TCG' in config_all_accel
    subdir('tcg')
 endif
 
+arm_common_user_system_ss.add_all(arm_ss)
 arm_user_ss.add_all(arm_common_user_system_ss)
 arm_common_system_ss.add_all(arm_common_user_system_ss)
+arm_common_system_ss.add_all(arm_system_ss)
 
-target_arch += {'arm': arm_ss}
-target_system_arch += {'arm': arm_system_ss}
 target_user_arch += {'arm': arm_user_ss}
 target_common_arch += {'arm': arm_common_ss}
 target_common_system_arch += {'arm': arm_common_system_ss}
-- 
2.52.0.windows.1


