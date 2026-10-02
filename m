Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868D6CA5FE5
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:24:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjki-0007aJ-AS; Fri, 02 Oct 2026 16:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkZ-0007O9-RX
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:00 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkX-0005og-EV
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:59 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2e2e0f3dd40so6440675ad.3
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972456; x=1791577256; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZF8fC0jHy96GLAa6nYvC5U705z1kSHOy/j/N3xBALMk=;
 b=UIjgzjLhU5tq0fZp1qG+nYOGnxewgPhAKOrAd409SvUBJgI56jV7Yc4odxc97AEL1v
 pknqOfDmUWyj3W0O+rsHO0ZWiN8/vkMmywE+a0loavSqn7bTXq3q/AmowZTZ+N4EQXCQ
 3O3kzATzLpAoDjsVC0TrVoXlpxE0GKGPPY0bd2kH7zEiABfj6fe8D/b59lCLqBJn61NA
 wzZqp3yai2nlaUVUiozo9KEeQUOp3vpVVXnWQwYsTOnlRgKbYHVXE4GdGk/ZBbDneyqT
 M44GeR2CEYc/gr7AaZN4QyyNZ6+YfsLFxH2BwxLJyizjQOvpdGduz0IDVEkDT6OJybxm
 Q98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972456; x=1791577256;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZF8fC0jHy96GLAa6nYvC5U705z1kSHOy/j/N3xBALMk=;
 b=W/xnjkiP6lwmmpvCmdBA2J4dmdBqh4CaaZ9rCdF/kQvg1EP2V7EzRixuQx1+BkEb54
 9DZuudc/IvCgk/QkQy8U6sLgZ63xv+ZXlaqUoKjdamk7YnnC/zXLua584S3598pCDFQW
 YKU8akYFDTWiocP/CHVsJ5rUydsigq4bCarLKhHYUAGQK7qjvnJhNcekXL8pYYl7cHn8
 4ji50esx8id9nQyzq+1M9C6HNEKZfOoQSj2ZFsgP3/c4/lqf8q0WSEGlPExphfPmarPp
 UKOPkx1Drq2MIVTFaYMfPUq5ahowD692cBbVbhcNMzd7WYxBDvxA6GCalmgaqgCrTD5s
 MnJQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwvynKzrvJlz8LiRb09K15HydmI37gU4jJ6iN6KEPa+V0o36WIu+J/0rEEAX+3cNiFsOm9cmisYtw==@nongnu.org
X-Gm-Message-State: AFq9FYJeMv7SQoagd4wjkvYfFkiDnlIYHtNC/rP+QVvRyqv6907xoTZV
 uavYfDC2gUZ9EYfJ8V58BGwa2KMobyxzVFB5/Ef5JhUzlwBUJ2iQA0zX7lu0wybzoh8=
X-Gm-Gg: AYBFou3jeluQl6OEl9oPYrCuf2akDAsuRiNSPgB4IPzvuJOGCC0s8O/8lr+truiXgcq
 WgZS0KJOhOHG0EV79/GA1neAK6SAmP18eG57/fkInnw76KbqmUUipcCkuSxsIFTMBYusL1VsNtQ
 DpsNciokDX+re4D88mBMeSRYRQwqUTZCRbJVQoUH/xrASI3KCHd1H1u7ThkmrK6MYT+tkj6X+jb
 peTXq1XZMbtnyLawFd+Dr6eDiWxUpqgegJF6l6vafOYhtwJkPGMFfKL9cxpfQzlhA9zMdPgdx2L
 7YPs0EHdH/cGNnmLqWFk1ht9Id1fvlRZnVpldiiiivUPFYcuqyUJDupoizX/DDDBFsFr3LvGmI1
 KDYMogXKkHYgN32ov9jbo5T+Sb4JAndBMYnufSuEzhgS0+ySS3V6rJfDXmnQsTW//ZvXwMqikHC
 EeNtSN7cVuX5B0IyRHYETtIDvaiFeR7AqFOzafTMww+EZ2cSYJXX0XfJtT404EdNlrzelliDcG5
 jQe91uD/31c3MTJigPTSiqchNM+qJNgpZc=
X-Received: by 2002:a17:902:c947:b0:2dd:c053:e0f8 with SMTP id
 d9443c01a7336-2e5106142d1mr5307805ad.39.1790972452627; 
 Fri, 02 Oct 2026 13:20:52 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:20:52 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 13/22] hw/arm/virt: Set proper conduit method for Realms
Date: Fri,  2 Oct 2026 14:20:17 -0600
Message-ID: <20261002202026.1204110-14-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x62b.google.com
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
index bdac33a1de86..5ab4bb23ef2d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -272,6 +272,11 @@ static const int a15irqmap[] = {
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
@@ -2945,10 +2950,11 @@ static void machvirt_init(MachineState *machine)
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


