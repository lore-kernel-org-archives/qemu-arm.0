Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2676171eja;
        Mon, 6 Nov 2023 03:04:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBhZd6JeGpoRk50E1E2JLKmeeCt30b/svdxC3kVx18siboSGEYYDe+/DRqTrNIgY5JTDRr
X-Received: by 2002:a05:6870:1191:b0:1ef:b0df:1347 with SMTP id 17-20020a056870119100b001efb0df1347mr27082356oau.29.1699268660214;
        Mon, 06 Nov 2023 03:04:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268660; cv=none;
        d=google.com; s=arc-20160816;
        b=OMwRfyv/KQfhAZldaatR27ZeIbVZQ1O6jspr4uhf2aBh2dDmPliFbymNP8fWNC4NSC
         X0TiBmRaQ0erLBoAs7l1A5tzTTm3QYmCZ5gAltLJNK60nt4w8u0WMxUqGyVpGWZxhbx6
         KAmj5DR+4tw6a652h44J1VM8Bz+QmIBCsJGVXVKKaI9VyuVA3WuiQlZItM3cV13ETknw
         rb8PwU4PopNCQr3xsvusO6TgEnizkcH70NGvgQRt07r5CzTQfwaWrWtQFY7B3/YYnCJZ
         xonYX59wWhoMram4VF1bbSvs9RVhbaTfPT+V9Cp9zraBNvAcSWtej99ZIysviLETR/vq
         0T9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=th3yfEu9dsqZLmfk3I95d9IkQeEp24N2k4ODPshVYkY=;
        fh=MxQbjwEdFwlPHdTHbnth+HR++MIzjIZTbqQwuZPTx7c=;
        b=xOFvlTcuRCelzb2O9euB98fm03AmauZcQ5J1GyYFweSLL/beayfJoXJIuObBoU9A5X
         +Lt2ZEaJbgstWujJFD+hstHZ4Jw8v5MDHiqJdv+9lVcw5ntOU7LUaHIUyqqk3iyR0awM
         7IKoCsSwR/+Gqsz5DktJH0xAVDaNrj6P6OatNghIXdtDyUVLCiwGy0w/aAeD8jINNUmI
         XdGMYWBD1mh5le+0BQkuTvBzTAyUmV4bMAjhQ1PIk24o60v1p+/Z5pOoFUDJT0YyMHhA
         W1imIl6UA392Qv8Xnprz1RApvkLCM2YPIedoQTz1IFqHxDPE4k6gtksjF9MDFlZmxNW8
         Iu+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cn8b2mI8;
       spf=pass (google.com: domain of kvm+bounces-673-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-673-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-673-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d125-20020a633683000000b005b57aa8517bsi7738444pga.91.2023.11.06.03.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:04:20 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-673-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cn8b2mI8;
       spf=pass (google.com: domain of kvm+bounces-673-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-673-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C4F42814BB
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4C51EB2E;
	Mon,  6 Nov 2023 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cn8b2mI8"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8FE1EB2B
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:04:11 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A8A13E
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:04:08 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32d9d8284abso2666733f8f.3
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268647; x=1699873447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th3yfEu9dsqZLmfk3I95d9IkQeEp24N2k4ODPshVYkY=;
        b=Cn8b2mI8ZK8KYRGfl3CS1+RrcpbMtbnOFd0Kl3tJg34L/FeFUvwxHces4SHN2P6IBl
         JQ4cvciqCHsChvDNjuEWiGwyLWrdDNcnmDorSbkmxKU+Fyd1AnhBjy2cVLXBIAAVoWhe
         XYOvYwipmiWrt7diPNV2x0vatmLnulI+2jyhrM6ncHleKrMg8uOgSSGBCdZlAzrIhutS
         MR0P+STI2i26VAvid72BYqdm7rvLzfaGOs0iVykpHvSAAm69V4XEWcIooVa2ujE0cAA3
         XQj9MlQhFXgkKHeFL+41y4Sho8AUd10I5eCcxMs+MjwJQ3dNB/ZWLM65Q09psr/8I8kb
         UPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268647; x=1699873447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=th3yfEu9dsqZLmfk3I95d9IkQeEp24N2k4ODPshVYkY=;
        b=g2puD+NJEeY4REsuQn4ce7DGhvs4BvIgU+ZEuDhVQstyvh7aDA44HagyrUnwuMC65U
         vRPN5PPLiWqOJs7rVwDfkhAvZw6VA45F1KBAfSZrEMAM5Oj6eVipB6vre87v+UeE1V8S
         aCqz+KZjZM6NjIaxiUFH77sHgyj7V6o0WNnYCCiTe+uCKFLJYoof1lGZ2LW8huFAA8Pr
         3BRbVEh94GBVSbAvyQYkQz6LWZus0Vahq0lrei7klB0MqZcCzUnpme/sAbDW1fCUx0UM
         SpMeI7ViWURLul+7pjVvhlqSl9QzgE24R6pucmXUfsGjH2WzlFN10oB1ylQ9gZtBAx8p
         HYcQ==
X-Gm-Message-State: AOJu0YxhsMeUH8imQTQagDtC2GPF2jj8CNyIWakl0Htiuzj6mAoq8g7W
	hqRny2d9ptSjbrQkC3SMzOqk7g==
X-Received: by 2002:adf:fd82:0:b0:32d:9a87:b7a with SMTP id d2-20020adffd82000000b0032d9a870b7amr17402964wrr.50.1699268646998;
        Mon, 06 Nov 2023 03:04:06 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id k13-20020a5d6e8d000000b003196b1bb528sm9094731wrz.64.2023.11.06.03.04.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:04:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 04/60] tests/unit/test-seccomp: Remove mentions of softmmu in test names
Date: Mon,  6 Nov 2023 12:02:36 +0100
Message-ID: <20231106110336.358-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YWBTIt4OYpV6

Wether we are using a software MMU or not is irrelevant for the
seccomp facility. The facility is restricted to system emulation,
but such detail isn't really helpful, so directly drop the
'softmmu' mention from the test names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231002145104.52193-3-philmd@linaro.org>
---
 tests/unit/test-seccomp.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/unit/test-seccomp.c b/tests/unit/test-seccomp.c
index f02c79cafd..bab93fd6da 100644
--- a/tests/unit/test-seccomp.c
+++ b/tests/unit/test-seccomp.c
@@ -229,26 +229,26 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     if (can_play_with_seccomp()) {
 #ifdef SYS_fork
-        g_test_add_func("/softmmu/seccomp/sys-fork/on",
+        g_test_add_func("/seccomp/sys-fork/on",
                         test_seccomp_sys_fork_on);
-        g_test_add_func("/softmmu/seccomp/sys-fork/on-nospawn",
+        g_test_add_func("/seccomp/sys-fork/on-nospawn",
                         test_seccomp_sys_fork_on_nospawn);
-        g_test_add_func("/softmmu/seccomp/sys-fork/off",
+        g_test_add_func("/seccomp/sys-fork/off",
                         test_seccomp_sys_fork_off);
 #endif
 
-        g_test_add_func("/softmmu/seccomp/fork/on",
+        g_test_add_func("/seccomp/fork/on",
                         test_seccomp_fork_on);
-        g_test_add_func("/softmmu/seccomp/fork/on-nospawn",
+        g_test_add_func("/seccomp/fork/on-nospawn",
                         test_seccomp_fork_on_nospawn);
-        g_test_add_func("/softmmu/seccomp/fork/off",
+        g_test_add_func("/seccomp/fork/off",
                         test_seccomp_fork_off);
 
-        g_test_add_func("/softmmu/seccomp/thread/on",
+        g_test_add_func("/seccomp/thread/on",
                         test_seccomp_thread_on);
-        g_test_add_func("/softmmu/seccomp/thread/on-nospawn",
+        g_test_add_func("/seccomp/thread/on-nospawn",
                         test_seccomp_thread_on_nospawn);
-        g_test_add_func("/softmmu/seccomp/thread/off",
+        g_test_add_func("/seccomp/thread/off",
                         test_seccomp_thread_off);
 
         if (doit_sched() == 0) {
@@ -256,11 +256,11 @@ int main(int argc, char **argv)
              * musl doesn't impl sched_setscheduler, hence
              * we check above if it works first
              */
-            g_test_add_func("/softmmu/seccomp/sched/on",
+            g_test_add_func("/seccomp/sched/on",
                             test_seccomp_sched_on);
-            g_test_add_func("/softmmu/seccomp/sched/on-nores",
+            g_test_add_func("/seccomp/sched/on-nores",
                             test_seccomp_sched_on_nores);
-            g_test_add_func("/softmmu/seccomp/sched/off",
+            g_test_add_func("/seccomp/sched/off",
                             test_seccomp_sched_off);
         }
     }
-- 
2.41.0

