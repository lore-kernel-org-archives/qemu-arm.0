Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1960537njb;
        Sun, 2 Mar 2025 00:23:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXaW7ZdoJcpHNrMq99l8ka/OJ7+B+NSAV/3Z4FsK3KV5i8RC2mZlyKlkDXwhvcF3YoUJwEV8iJcPczFiw==@linaro.org
X-Google-Smtp-Source: AGHT+IHXW3XZhAT5O7FiC/S5Sd4VpUmkNb9ZWVwxxOo01F03TqQc2a0+1zyxSrzgCJUWYQvsNU4W
X-Received: by 2002:a05:620a:1710:b0:7c0:a667:6c19 with SMTP id af79cd13be357-7c39c4a246bmr1446120185a.9.1740903793249;
        Sun, 02 Mar 2025 00:23:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740903793; cv=none;
        d=google.com; s=arc-20240605;
        b=d0fZDNtWVr65Va2jdpBadv+GXxYsrvqG+gTpt0FksZYBYYoeTwAzkK34EyHJ8YXCbU
         0Dh/vlCV515F9gZ1DL6NqKUwoI8D1R+Er1dEWbpCEk/OUb4eit6DgdtxFvFi+7ly+Y8L
         1M0yvqNH/Di9pe4UhQsJKXW/UoBzCfdbGj2YwvdQq7vd3y+LLVHd2IBjXm2W3H5VtlYP
         YedStk/KgSz89VK7SeqGTIJNOUFGwZ2IRaiFYo17tu1KIIJmyFJgGVyvYYn7dD5D8/Tv
         4VJFdihAuIvS5lBVc4pfMNDOZvnabGlzRJcrb+HrUmFix6cANuj0mJrsY4brkXNkipKN
         s7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Zex/InjMrVAnBUbETJRbgy1Kg/J1EmMC/hRlRjwUdTw=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=H/G0Xhc/75lqn3L0VBIlkWrSsq2EvGesehe/qKX7vkJNBCXWcCeQqem/maiMOuDTwO
         19DGjtZmMS6Rn/MpSEHeyGlh/RFD9tm5f7LoxW3CUExQ+lJR5dgD+rZZ5hMO2PGx2l13
         oa+6Ae4Wq4SXCDJ4VbW1gk447UmZuWYjqsN1W8v7/i8B4tzbwyFoN5ICKPoT2Zy166iT
         LfUWlj76kWTwSasAJbb4fyFtxTXEtdnY/QK1OtKS7XXUDTe1bNBaPgzSz8WIOyoy5NXT
         DxVKCea3kbBxhZeL9/I9EoPO9+6o7NS4t1qozrgaQ+R7NSwzoPsowi28JA8KXcSkFpit
         gvLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=O8QyEXIN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3749e0359si664787585a.436.2025.03.02.00.23.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Mar 2025 00:23:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=O8QyEXIN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1toeat-0005sj-It; Sun, 02 Mar 2025 03:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1toeal-0005YA-Ru; Sun, 02 Mar 2025 03:22:32 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1toeaj-0005gz-Tz; Sun, 02 Mar 2025 03:22:31 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E303E5C5427;
 Sun,  2 Mar 2025 08:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9B3C4CEF0;
 Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740903737;
 bh=Czz8Tt4JQ7OG2qz83DhQ/rDSfMDYdFVFtyoa2IaQ3O0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O8QyEXINFTWzApmNC0FNcBLEdM321xwzt4+SgjHBTqFMKPv4bvTEOmzz1Hs6ZNC7z
 NEDGxuGxE8a4bnEoiYeAS8OtElrI784f5uEALtTrJQSAYkq8sF7Jk5EIPTagrdi0ce
 Tr6q58rXmwcjGAUXhRjUlSTHDYYBIcM7TLLFFk9WG9j2Fss5L/qYISd8kBfj5dps2V
 SVu7j/24y3qvZHZr/xKLMKF39/YCWlkk4vWS7PZGDWhq+E/tB0TKjiw3TMJ/sRSf3Y
 lyTDM4rN6lDfsCJrjcJaosRoZXgzczVG3l7od3bLLbZf2y4nPatwtivyua6YyLYYnh
 Ig8+gOQaNXTug==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1toeaU-000000043SW-3mMR; Sun, 02 Mar 2025 09:22:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 16/19] acpi/generic_event_device.c: enable use_hest_addr
 for QEMU 10.x
Date: Sun,  2 Mar 2025 09:22:03 +0100
Message-ID: <c0f383320944d8d4bac199b25370842753e2c296.1740903110.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740903110.git.mchehab+huawei@kernel.org>
References: <cover.1740903110.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qeNc5cEsQm0a

Now that we have everything in place, enable using HEST GPA
instead of etc/hardware_errors GPA.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index f029753ab709..9fe70b74bd42 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -332,7 +332,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
     DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState,
-                     ghes_state.use_hest_addr, false),
+                     ghes_state.use_hest_addr, true),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
-- 
2.48.1

