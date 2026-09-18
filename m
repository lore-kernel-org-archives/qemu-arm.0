Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F2DC982DA
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 11:41:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7WxH-0000YY-Ed; Fri, 18 Sep 2026 07:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1x7WxE-0000XB-4W
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 07:40:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1x7WxC-0001tb-KC
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 07:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789731630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJvHfKiX7PEwhtXR3zEFacUgadXzigtW25CODwRwitc=;
 b=IOi4NS5mlVUCBzMj/Hj+rTpks65EqIj5yTRnLGGD05ricDfO7CZvGJUYC8MBt2eNVV/vPI
 PdM9hRXY+d8IIsvtf3/7SHW2tlkn0EQsbu+2HMUm7wEnVwq35Z4QpPSsrcVDvKqwuZHbLQ
 T5MHUv8vSPyvbcVjv+xaOpULsXXW354=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-fwyRM8pWMO6qSerSrqgxXQ-1; Fri, 18 Sep 2026 07:40:28 -0400
X-MC-Unique: fwyRM8pWMO6qSerSrqgxXQ-1
X-Mimecast-MFC-AGG-ID: fwyRM8pWMO6qSerSrqgxXQ_1789731628
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93909014c85so119513185a.0
 for <qemu-arm@nongnu.org>; Fri, 18 Sep 2026 04:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789731628; x=1790336428;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yJvHfKiX7PEwhtXR3zEFacUgadXzigtW25CODwRwitc=;
 b=R0u/6aS/M93HO4HuiD1fWroFudFLhcG6U2S5FckembPrMYX70SMiEmrmKnp+lTDv9h
 LFHguqjxKODa8RN1fJ24qb6/wPifUx+x6UOls90wf+iIHLk7qEuHvht/7rSEjCE+Ap5v
 +A3s2KlqAMu9VwEOJM7M9q7JUXHsWlGfbZafyh7QFBXfEzpq/PVk6dHG6vm/3EPFcQa4
 GuwWOdZtTq0//qyanqUM1uh1Q8IgobXz2E7uPMEsrSlnqq0GUW9OuMOjH9i7IRdakA5l
 3d/reZ67ny3209XUmSoyajuNMHjU4MuoNJO++OMPDKTI9evxBomCR1d9VPrZE4OIEPX1
 n8ww==
X-Forwarded-Encrypted: i=1;
 AKwUvBzwxFvhozf8JCg09K6V/s4s4YweewUdzQBgF/tJR+fOmEz8RUxysuTf2UL6gGrPfTtnLBl+aKFSnw==@nongnu.org
X-Gm-Message-State: AFuF++kfMhwhgFapo4kPmaMLM6gZJ6DQY3BuL8MYUN90ZZsibO3vBFl4
 nSvzLpSXydb2bl1eXPpuLE/icOlrHVYNdi+x5MKU/0fxHSV25HkTT5DeMcwGK5c5/1lJUNxy5wk
 dZtQ5zF0fyKjZWT/pMIOqTYYKPIIds7+MNrRFDjaf/5BHwefpbJAMg2/d5napivKo
X-Gm-Gg: AYBFou09pPiDpX+hYY61wQEHZ785TjpjTP6xYCekmYxlBVBIaMpCxWovy3QYam7JHjI
 Pte/to4xvNpd6/MrCAlbb+uJj9XvSoLuh6feRDPUaRDFTl+vp5mbmtMJoQuhs+0RQYLqr9oW1OQ
 66wMnDwoXnYl7NTawjUaLyI+KRm6tNKSFSbySOtu4LMo7KLK66GGTLbZhmlTqHmGM64zXr1yvBl
 8YpM+nz56inKtt3X7vLJx9zk88Ah/pw8eVVZWameEeHCX/aI0hfUCQYjI1oCx/hPO6IAp39JmCI
 a0ejGtFmuHHeO99be+CgA6cc+rsc1EySGQXIZtD3bj/q8Rph+rmH620i3Y0818kesoKwXPz3Uzn
 fQq2u23hkBmPD3TkQrMyVMiBi+aoFuE1a6Enp0wtxoA6UdmiIyp3H0YgE6LM=
X-Received: by 2002:a05:620a:4591:b0:93a:129b:5368 with SMTP id
 af79cd13be357-93bdc6d5ac4mr277007485a.36.1789731628043; 
 Fri, 18 Sep 2026 04:40:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4591:b0:93a:129b:5368 with SMTP id
 af79cd13be357-93bdc6d5ac4mr277002585a.36.1789731627421; 
 Fri, 18 Sep 2026 04:40:27 -0700 (PDT)
Received: from localhost
 (bras-vprn-aurron9134w-lp130-03-174-91-117-74.dsl.bell.ca. [174.91.117.74])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91257f2d2fdsm10904636d6.5.2026.09.18.04.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 04:40:25 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 qemu-arm@nongnu.org
Subject: [PULL 08/11] hw/arm/raspi4b: Drop board_rev for 32bit hosts
Date: Fri, 18 Sep 2026 07:39:23 -0400
Message-ID: <20260918113926.831204-9-peterx@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918113926.831204-1-peterx@redhat.com>
References: <20260918113926.831204-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G-cBTIhZ7qD0wTCRIKBhLdFJgo5Eqdvf4NYE9SEFqoA_1789731628
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

QEMU has switched to 64bit-only hosts for all system/user emulations.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260818172012.3052821-9-peterx@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Philippe Mathieu-Daudé" <philmd@mailo.com>
Cc: qemu-arm@nongnu.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/arm/raspi4b.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 7d3eed9630..566d64572d 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -110,11 +110,7 @@ static void raspi4b_machine_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
 
-#if HOST_LONG_BITS == 32
-    rmc->board_rev = 0xa03111; /* Revision 1.1, 1 Gb RAM */
-#else
     rmc->board_rev = 0xb03115; /* Revision 1.5, 2 Gb RAM */
-#endif
     raspi_machine_class_common_init(mc, rmc->board_rev);
     mc->auto_create_sdcard = true;
     mc->init = raspi4b_machine_init;
-- 
2.55.0


