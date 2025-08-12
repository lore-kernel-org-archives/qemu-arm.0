Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15635C87FCB
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 17:30:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulsns-00041R-7w; Tue, 12 Aug 2025 13:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsnp-0003yU-Ra
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:28:49 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsnk-0003TV-PN
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:28:49 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b914a9c77dso588794f8f.2
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 10:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755019721; x=1755624521; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYt3XWa5JdTgcAHas+NCLzX0AYSjTul5kKCxbeujNLY=;
 b=Z2ihcJ1EAyCjFwgMy7IQlVLclK4UJiVtHBoNowFPUybzb45APK9Lbn0il0CFCf+aQM
 zKewH2inznIKjaGnFd8ZzwTBnp4SqfyEFJz26loE3Nz+vPqPto/z3nMSv7fyO2Gqi4V6
 SGVToK9XBGk7QEQKeHNQH2wqSuY9pdxx4FJY5pHv9Gn0JdxTezY6eBEK1dwlYsc+BKQR
 KSZ38jsVUGmcnkpKbyLEn5vqSId/gquPHzinj42EurcdX05dbzETUWdwK8Njl9SvGX3y
 bL2StaI7Rp4nTodnh4AkOArvL81RvjFS2eJkYwgnH7GxZOQbTBZJM+TQ953evT1KaDsZ
 ligg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755019721; x=1755624521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EYt3XWa5JdTgcAHas+NCLzX0AYSjTul5kKCxbeujNLY=;
 b=jO7vFj00krOljCs1r+MS4Ktls/AO+KzJqdMKj5MR+krBMNQzSSBrgB104MSe9NcAbK
 WzncsZWRaFEYA61sk44tnC0UeviEugmx8GZfUFaG7tzDWZu4pR0qzE+rRyUS70abDI7u
 5YWspNEIPMk7POTlFi3QNGJalJl1QIbLeGERI8o9MxhUa3q1rVKrJaG5M1R4yPAPjeBc
 UZtYhW6EpF9K1+ZUY6wLLVENSrv5YaixSK1+GN34pp7vHl/QWLA0Uo4FcIpNLfcPenIP
 gIjkMpVX3h/OjWN+zCY2VNT+nVI4uV8CzLB5w36i7bKb5NcUlavxEOR+cvCJhOXVV+rW
 DKPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4KUUuUXXXe2qaYjYhSw2A4pskiCc1AClMcQpEUwRQujltkbBEFowb+/iDJNT3+fQmy5G27H+qlQ==@nongnu.org
X-Gm-Message-State: AOJu0YwnLncB4CWWNa5OLxEixZJ9LAqfXJ282Avfmvsji2fZJ7GCzq/m
 CsxRNABPMqEAnw2IVOJnzTW8KhFffmiRD/FtGv/cPyAsBXUUFwEOEW1o3v/RXJzLkmg=
X-Gm-Gg: ASbGncu3r4iIuOebSD0SieGOEvUymn3J4CFc2qLv0X3xuD+ksPScn3sS8yVDVw0Yddx
 9+5SrAaSRYB5W/jz4cQJufoQyoEl3o7DJ2bTCBCLPqA8cGuYWhjEt4pXbIsmaRM1aezcpctMBry
 ZLPkAWA4RorFkan7+B0irwcR24ant4TxpDKg12xi5PEDCmCoL4caEcKPQ3bFj5zFbEZSOXdIJPl
 KcDmpIIOtMLCsKfuhvWQRzdBTTM8lXVROQwoStAN85VJJ+VCS59Th7Y9VOozrOsoYKuvTEUDINb
 HVAPQoW82PvDlCK2w5M+QUDGUXuQqfMZk8TDE6f+qfaVTiFyrSwUyO5EtByoglN2rmhXw1VN0WL
 5zSkkpYx1IGNC+AlHd6yKDAYA3TrQQSMHc1ChlnWWKkJiNnQdI+CBR1T80ILd5aiFSGvxnfPo
X-Google-Smtp-Source: AGHT+IFKDzIxMpZiGj7vZDL7rXt0avmWUA3RyLwDmE7PF+XxnCDfzncjSb/8L6jk6S1QcyKG6JKIiw==
X-Received: by 2002:a05:6000:178d:b0:3b4:9721:2b32 with SMTP id
 ffacd0b85a97d-3b91724ec5fmr221527f8f.10.1755019720839; 
 Tue, 12 Aug 2025 10:28:40 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac036sm44716290f8f.15.2025.08.12.10.28.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Aug 2025 10:28:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 03/10] target/arm: Restrict PMU to system mode
Date: Tue, 12 Aug 2025 19:28:15 +0200
Message-ID: <20250812172823.86329-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250812172823.86329-1-philmd@linaro.org>
References: <20250812172823.86329-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d9a8f62934d..1dc2a8330d8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1551,7 +1551,6 @@ static const Property arm_cpu_pmsav7_dregion_property =
             DEFINE_PROP_UNSIGNED_NODEFAULT("pmsav7-dregion", ARMCPU,
                                            pmsav7_dregion,
                                            qdev_prop_uint32, uint32_t);
-#endif
 
 static bool arm_get_pmu(Object *obj, Error **errp)
 {
@@ -1576,6 +1575,8 @@ static void arm_set_pmu(Object *obj, bool value, Error **errp)
     cpu->has_pmu = value;
 }
 
+#endif
+
 static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1771,12 +1772,12 @@ static void arm_cpu_post_init(Object *obj)
     if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el2_property);
     }
-#endif
 
     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
         cpu->has_pmu = true;
         object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
     }
+#endif
 
     /*
      * Allow user to turn off VFP and Neon support, but only for TCG --
-- 
2.49.0


