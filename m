Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195AFC43602
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 22:44:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whEWG-0001cY-9M; Tue, 07 Jul 2026 18:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEWF-0001bC-6K
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:59 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEWD-0004H0-Kp
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:58 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2cc7ef7ec27so1336825ad.1
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 15:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783464236; x=1784069036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CEMAHfk6jaAbYfFhNuqQUXCY3WLt4ZsLh5ZzvB9z/oI=;
 b=WcgMQrFBo4q+nUzA6ZCjRcsWbPGLcUilCEV3oMk14Vv6pNAhL7p8A95vTUTMsizMs0
 WQXNQ3DBEgHoAzUoEAJ1EV22Ae92qkd7XRLJJbwSXMZJpp7yAyawLuWxHKrkN8ub+mX7
 /C/AnBmMfiDa9TzlJZAi2bZvJIegaZCIRbzt+6t0kmGaCcyGiNbw/IHrA9+TEk8bfmNQ
 SWgWDcol8NRZ9i3OB/6+JcUrTPXXkPkQTbMaePllkP0hDxFO/A8I2UNIeqUbdrHElU40
 9VsQVL7j+TRb7Q1E/Rn0iNHgqq5bQ16WmYrydEY1Nwv0qXYrun0eHCctClZ+oEMpIkOr
 yakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783464236; x=1784069036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CEMAHfk6jaAbYfFhNuqQUXCY3WLt4ZsLh5ZzvB9z/oI=;
 b=VnCNEi7KmAUT9yjJoRjsCFTcpauRI00oNtSiCvUkDjSrY3nkfY13ZN+4Hg6ORbY+Kl
 L5ZhqoW2woZMu2jggzFezG5rQpxOJm/wGFq/ftBJl14IfMB1l/zzqG0+7yULlt7SGeh6
 xYjjhRMR23BEwnJlJfM6IiIQDS5EICgA3WgmVyOz1yeXyI4j0j+94n8B+NeXJ79vZk+L
 oOPEubBYjpAb9NVvDlfpvQ2KPEU2Cr8iahcR1pN5OhUMwoMojjhsakn3zwx64JSgHw9B
 y5C5Sut8CavjAit7mcftSu1RmBKw/Wde1dPbLS0l9Hp+qXCW1wdi9INcbn2Cu847XpHb
 zfjA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqQOTE/o7rWm7hyc5j6q6pHImdHemk+7NCkO8uegvu/ayqiqCm7k/C4BsDm0VTacRo2YvFe0tVSKA==@nongnu.org
X-Gm-Message-State: AOJu0YxgH7fGyw75CISqbT8cVMCs6xv1zQ/+tRTzWo7ewjsqSJJ/yBkv
 F40+D2YXsY1fkW8cQ6PqFx9kEiO66A4gS2xMcS0hR9JDVJJ+e+1u0/qf9N07eCxO/Vo=
X-Gm-Gg: AfdE7ckUATiVTlYy/tTnNsqrQfraNpekhe/OqwkauSnNQ/Xp8ns0WdEcBqSC5XHaGCb
 cCK4whqGQcOVUw9mBJkO0aj0PluMRtSnotRjKJLcX+Lsi7eZupp2Awy1EgqZjaldC9OwK1gwAw6
 7Fkp15vIeovtEVoXujEAmfwwZpHKfbD6FB9rPcWW2B7Sde77k3A6y5H6sYGi1WW1I/VooELrlGD
 HcciPKEm1IAE+MLW+eaO8XVP9cimPiQdUjUkavq5fMoGcA6LUyvAHgZvNtI5dpKaCrTgvIkEl3k
 tQk4LgVlmp2stRf/DhJBOsApkvTy+bcSKtCVL4+UY4+C5u02aG6ZvPPCysDzGEgBtR+xaDJfEHb
 Gl0cBafV7K/eP1YIx4TDSVMQlzYInfxE1y7QSZA7ID+UIO5MNc5s1IabbF8cFqxBWLDqKfUX531
 cSp5WOvYMWOIOm2XG2emzGz98cg9qpdgGNMjJ8Fng=
X-Received: by 2002:a17:902:ea03:b0:2cc:76fd:6537 with SMTP id
 d9443c01a7336-2ccbe50cf7dmr65254525ad.2.1783464236344; 
 Tue, 07 Jul 2026 15:43:56 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:46c8:dda7:40fa:8958])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bbaesm18183805ad.57.2026.07.07.15.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 15:43:55 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v1 24/25] hw/arm/boot: Load DTB as is for confidential VMs
Date: Tue,  7 Jul 2026 16:43:05 -0600
Message-ID: <20260707224306.1202330-25-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x62a.google.com
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Load DTB without modifications when provided.  That way it is possible
for a verification entity to reconstruct the Realm's initial measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/boot.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index aea044fbed9a..aae77870a5c4 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -478,7 +478,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     g_autoptr(MemoryDeviceInfoList) md_list = NULL;
     Error *err = NULL;
 
-    if (binfo->dtb_filename) {
+    if (binfo->dtb_filename && binfo->confidential) {
+        /*
+         * If the user is providing a DTB for a confidential VM, it is already
+         * tailored to this configuration and measured. Load it as is, without
+         * any modification.
+         */
+        return rom_add_file_fixed_as(binfo->dtb_filename, addr, -1, as);
+    } else if (binfo->dtb_filename) {
         char *filename;
         filename = qemu_find_file(QEMU_FILE_TYPE_DTB, binfo->dtb_filename);
         if (!filename) {
-- 
2.43.0


