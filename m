Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21D9606A33E
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ChIxXjPR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXu9-0005OH-BW; Mon, 09 Nov 2026 17:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtv-0005GY-OT
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:48 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtt-0003vZ-GS
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:43 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-8b29b83fdf1so586340b3a.2
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263500; x=1794868300; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=i9nhvaLoCHlCTOlMzemv0u9BHztHblZnwWmHlsR6Hmc=;
 b=ChIxXjPRfKBcn69HvVdL150NKm3BUU4pQWnACbKEHnpqaaLvo97wzsFEo6XmayKIv/
 0FcHLIbC++Ndjvp91lMCpXnnkuCapj7gDfBiQSYuZhlEzeQRCuLYsOuRokv63Ui47p16
 XXZAIRHNjsVnCDPBlx5rnz3BnvkxuF2PCtMySzRDa/F39vpHsLAJz/07u3dJop2oYqCR
 nRgLiZZQ41djwrDp0EPK1nFIpSDW1dlcjcFKvzryIEZU35jDHnD4sAuobzOvk6dDWmtX
 tfDq7Hatk4m60O1awexa2gHg9iuPz6PCTL2/k91r+zrisH9fal7XJZKPi38+7dTPxD6Q
 ++5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263500; x=1794868300;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=i9nhvaLoCHlCTOlMzemv0u9BHztHblZnwWmHlsR6Hmc=;
 b=JBblxx7RQeVEFpJE7pTzCobppxp6imTMJ9HlG/PAJqVsAvNgrysd2tBDY/IdNgHTU2
 Y7j/99S7tp2hOkSYkedXvIc3WgxSn4EH12kSa1f7xP9s2P5JMEz18KgOv+HVrVDZv4dc
 0mSjnUka2eK4JtFGnDowkSkWOwb19M6s57xKQmHI3s2Mb7nmMR4W+m8tnhQaY9e0Ptl4
 7l8ddMls5HG+3HRJTpoaPwED5gzNCNga6uTQ1VAaHi7wF8ouOdReeZYgFvTer7VPnnJo
 mt1+4XI5LxBMk1IQ2MKwy0EDS6//aLUlH80UXo+DDr6gotfd9Doa2nQocnuMW6xFsY81
 BUQA==
X-Forwarded-Encrypted: i=1;
 AL+hErFCgZCBSzGC8LoWyY0W4FiYvZ7uPjSzJGZq4UKak3R7yih7ZcRproM+m2VeZO9Jr+CtcYEptNO0Xg==@nongnu.org
X-Gm-Message-State: APuU4Z/9c8dnsI1sSzYypY1eOncQWGdN/7NwvjkFAhY1+VK8zslZrPBA
 unzLGGWt9EkJvuBYwikR+ZF7UGaj5WAxQZuD4mOFypQamdkvVIljE+f2useHI+jWayU=
X-Gm-Gg: AYBFou0j6U4NoHHAw8BX4w9GDScR6VR6qevM/Xh8Zsn3z2ugYrIKhXRw7n7er5tbb/5
 60QbsZFSyUFTUQ6fC+9pZUzsXbyNtTfoXxkPqekBmogRJfMWJhQ3gRaNQR9lWB9v4IsoQ1vNP0Y
 McMDqiRRWIufzjYyoyOU6I97X5q9zLvlVHruKRHvlwd4XxsyUNvwBU7w4iXghDFOeY5AWgO4KJ0
 l1Usfk+1CN9BZyPdUlcJyrI6U2KzaSyt55NkPfqnUL0kDgF+dMO2qSjXGdqjo8FIeqZXA2+AEI7
 5e9XXhPe16DHNWr41MPCuvVf8aAiBYCs5y4YrILVKCjjO6VXkgu+5QGif2Q6tRxKYQ9jJPaSp8I
 dBZgVG1gSfRbO8KHaBc1k1qXwzaJ6G/8ModvhghHFHMfaNuEwIcueH4TIErPF8rEosf7TPElkWU
 /yQh5dUUyfibSJRJYzMr/gstUqZxpwlFc5d7xODkWV65z4MqhWuLleBCkxcpZZ/iQjTixbRWvq/
 9vJwcrqNVUAmv9CJGou43T/Ma5WcGQ7UKJ4Q5Y7gunz6KJSFxyQF5MlxsquqaYaws/fCWDIjgXc
 Fxr5n2XtIJyMMF+fYOPwIUMwUBEDbRJu+VdtWBbK//zR8Ke+peGsOQA=
X-Received: by 2002:a05:6a21:a43:b0:3e1:c58d:aaf5 with SMTP id
 adf61e73a8af0-3f190f972e2mr456442637.88.1794263499500; 
 Mon, 09 Nov 2026 14:31:39 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:39 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 14/23] hw/arm/virt: Set proper conduit method for Realms
Date: Mon,  9 Nov 2026 16:31:01 -0600
Message-ID: <20261109223110.1619504-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x434.google.com
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 0b11f7e328cd..0ed6df4b9b9e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -273,6 +273,11 @@ static const int a15irqmap[] = {
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
@@ -2963,10 +2968,11 @@ static void machvirt_init(MachineState *machine)
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
2.53.0


