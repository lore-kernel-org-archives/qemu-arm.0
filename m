Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83FDC61DC6
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:03:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzDY-0004Y6-EM; Tue, 25 Aug 2026 18:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDA-0003ny-3U
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:43 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzD8-0001o4-DN
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:39 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-cbe6295f05bso1042082a12.1
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695297; x=1788300097; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OQr0iH6TQlLlru7OkuZsYY/GXznu3bXNhzmozCgXXt4=;
 b=TCgYHEFuheHiqFkQaTtLJOXf3kFhQcKXEp/sfDkb/dYjWpUZfuVsOKSL6aosHajXza
 R2Msk0KByzbbgtUx1DAWAMZE2p6jgIYhIvF4cc7v/yhaI084NDCffBxVlqMHc1WHWioc
 0mGIMHNYiobMnkjqHWOdQ2qpWFJumqpMR1aHSGalVPz3++EWZjwKdEzt7txfuqHsbOiM
 6CuoOtODyFYZgoi0RNUSHJLN1l529DOUJse3oCINzNX3Mpmjh6EtOsLYDXTkbazZJXxk
 fQiC8iLU4X3nlcXwlSu+HmziW3xrCgsfPSm5T/BvTiLx7n0/W5mO9qFE/OTJnU6DucjM
 jCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695297; x=1788300097;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OQr0iH6TQlLlru7OkuZsYY/GXznu3bXNhzmozCgXXt4=;
 b=YVGdK2AN35HnNxazaJtQRTR9FXl26+lvxeZ3e+hRSNPaCpHJ4PNTNr70Lk8mOxWK0y
 hlgsn9cKtHUyg+7TXO+K5hsTkZkUf9OG+eUuDDfPUP0MsZPFpRvNDOdLDCqBq2GYXtva
 pK3MfOEcOK4Pie4NF8X8NASysQbS1+pKBMKiIv4VgcclOOdVcCvOO69EmaWHUrkmTJuI
 83LpopcUMH3mTO165xTEcJHaMox0HKr9kWratZ2gTFTavTLzqX5rEW9wmHREnPv+IXsI
 dGMVTeSPIA1GWlFvOI3VCGGdi19cGtiy8yEfZbMWMF6xfzo/9U2CmRKj2xPRNthMEimB
 kn1A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqYBhevaFD2FcDxfaQqNODQufbPDFa4Ta5dYD4IkQChSRTNP2zUr2ICEJ/00HX2BvS7hxjTkgspHQ==@nongnu.org
X-Gm-Message-State: AFuF++mPRvgHqZZaWgB2mz2piXsp5W4xWEu9IJL+O6eswba09wtGh/qd
 tIH7V85NMbtHlVZEl07xqvU8oWs5dtmTCjT8fr/mTvggGsJ2M9IosPCkhmDlig0s7HE=
X-Gm-Gg: AR+sD12H8fDy5sze5xtwsflHrezFTFmKtqf0aMr4OOviRA1RUA4DgHUh96HszJnscjb
 45HRL/SU7pllH8V2lMcbH5Avpfh0wzUSx4jd4yl6K7+E0h2jrXzS5Sxck6w4cGG/fR9CVMuH/ST
 9q0Q0tWcFBjF/hYiHqCkc4/FB0jkzmgHXDuMt6B9GdL/c1QQPnaEJJqmqwAVRBTzTKtac3C+S9s
 YDqUhhqFtl50sGZ++e9DVmIYoXrqtPIRjdGt3CMt+V+6pvgkTW6Gc1kDP3mPVRyrUUAPB9VSLyc
 TVkvxVjZk1CZgQrPTi8vngZqM1yG2fVMtzrA5hIxK9vhIPjtvkmj6RKChtYvyoP3W800uMw6Drl
 NBk8erL0hOoVCCkBpBIqTdfikH08g9qZGwMUQmVf6glxhQspUei7M1fuuodu87Ub6fiVi9gjEcE
 JtFJhs1URYkqO73WZ1KmcJt46Nf5bPzEhD1Msb7Zv+NoJkLBk2FLEjLjrT+Xi7qhNONKOI692at
 3Y3aL4DeBECigg=
X-Received: by 2002:a17:90b:4d81:b0:38e:7297:a92e with SMTP id
 98e67ed59e1d1-3966d8e8063mr2162748a91.9.1787695296731; 
 Tue, 25 Aug 2026 15:01:36 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:36 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 15/24] hw/arm/virt: Set proper conduit method for Realms
Date: Tue, 25 Aug 2026 16:00:52 -0600
Message-ID: <20260825220101.3443954-16-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pg1-x535.google.com
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

The HVC conduit for PSCI is not supported for Realms, so default
to SMC.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/virt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b090233893c5..3418d75eccc4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -267,6 +267,11 @@ static const int a15irqmap[] = {
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
+static bool virt_machine_is_confidential(VirtMachineState *vms)
+{
+    return MACHINE(vms)->cgs;
+}
+
 static void create_randomness(MachineState *ms, const char *node)
 {
     struct {
@@ -2902,10 +2907,11 @@ static void machvirt_init(MachineState *machine)
      * if the guest has EL2 then we will use SMC as the conduit,
      * and otherwise we will use HVC (for backwards compatibility and
      * because if we're using KVM then we must use HVC).
+     * Realm guests must also use SMC.
      */
     if (vms->secure && firmware_loaded) {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
-    } else if (vms->virt) {
+    } else if (vms->virt || virt_machine_is_confidential(vms)) {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     } else {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
-- 
2.43.0


