Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp324942njb;
        Thu, 27 Feb 2025 08:03:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVeJWHv6fcTLLkF/M/ubqUm9OlrlIuAFEcKlUakG2yUpYpfDJebHd5yABtOgfQfaMWj4FnjXwkZVBHlaQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEZuDzE0LTtmiNYkcZTK1V30EfncIeIy2MT/GKh/m2GiEkTa0HAD8j45i8Zdas6Ywl2zWmb
X-Received: by 2002:a05:622a:353:b0:472:54d:295a with SMTP id d75a77b69052e-47377228aacmr180303371cf.30.1740672219438;
        Thu, 27 Feb 2025 08:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740672219; cv=none;
        d=google.com; s=arc-20240605;
        b=Jr4xA81gWU/kbV//Gsy6thypKVFjLfbCl7oWmvIqbh/dROTWnBUB1SunEJTU0MlK1h
         vdh5EsEP6dMLI1f7EO5gFspc67Xl+xpX5Pg7qwb7Xacxu8xPWmTShLwsr4SbAKcJf7R7
         /kHjXC01vXejFhon1gln4RUdvbt/fH7tmD6GQj1KHqeSVb77goroh2bZVMq65tD0tBWT
         K1a7rbGmjCmvPQGcuMlrTKOWz6366gEl3lzGnLStCOP7+W95aYmkr7+CLFrzyzP3VcUH
         CEdJBywNnxaKbriUBogrRzwd4AmFnj36Vjc8odkUQTUoQS6JUXn8OawuGqwvWZ1g6x8H
         Ed1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kCnIiK+M7hUl/q8IskCjHcT7B5zQLPl/H7ypJx07smk=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=Nf2PS0ry09YZ1cRs5OEpuVKLTU3BN6SA7AkUYg+GjGtamNAY69fReSs41D65ufLETb
         IWo6R9/BwhN1pN+nfriUf8aP4gAr9ProVH1RMcfc8fIbQ5c+SP++Tx0MqRks2nvUD+sk
         BTHx/c65nYfZ7yCg+kiao/BJw+6WQZ5Jmd8NvmD6dY4uYP6l2VmZT2InMIDy5XPW9Lg3
         ImVEofwXO2UGCv75Vm+xxPdwdXF5prPDWZcxSEgk07KfvEsJpBlJKqpxt5EXi5f0x4q3
         uU26iFfJ20dgBtOpjn2/kkRqlG6ChdfhiwWZRYihNZtPW3rsDpgWzm8GNktj4WqCFmL8
         3rhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=bYKcLnKM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4747244ebcfsi14398291cf.613.2025.02.27.08.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 08:03:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=bYKcLnKM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tngJz-00070h-VS; Thu, 27 Feb 2025 11:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJw-0006yI-5U; Thu, 27 Feb 2025 11:01:08 -0500
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJs-0007Ft-QS; Thu, 27 Feb 2025 11:01:07 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 676FD61159;
 Thu, 27 Feb 2025 16:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824A2C4CEDD;
 Thu, 27 Feb 2025 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740672062;
 bh=MSQW5xDS0P3/8o9sLNqQf0SlrA9+pAo9/1dnEczuABQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bYKcLnKMvqJVtpScjQtuyrDmMzQnDFVfjrjp4xWVVZlP0BW+owjpqnLj5+44RVs8a
 tYK7lMvoJwhGes+Pu+chqC13Oo3BbGUBR1UIeRPteQ3PJU8VycPk6hMwNRVZYHtHsb
 bWtt1o2c9BpfdYVGgzJhulGqu3M8HfL1lrki2348LWFjonGhU9e9n0ZirKObL2FmDe
 Bv9Ex9ar+TNJtNbFRE9im/jKNjG0hjrWiBa3dKJ9qVnB3VbS2eQWt02+qrYI/xPSeo
 x/0ebwGYh+AyfErf8azRmSjHV2nEqWeycDw0Qyv/f2n+9RHprvHzoq2TmMpKLp8Yc2
 QFf3zgFTuOOOQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJo-000000023ap-3DRt; Thu, 27 Feb 2025 17:01:00 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/19] tests/qtest/bios-tables-test: extend to also check
 HEST table
Date: Thu, 27 Feb 2025 17:00:40 +0100
Message-ID: <b7d89527bb3efc48fa1035beca28ee7f414d95ac.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2600:3c04::f03c:95ff:fe5e:7468;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VXFmC3LSAPUW

Currently, aarch64 can generate a HEST table when loaded with
-machine ras=on. Add support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a333ec43536..8d41601cc9e9 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2122,7 +2122,7 @@ static void test_acpi_aarch64_virt_tcg(void)
 
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
-    test_acpi_one("-cpu cortex-a57 "
+    test_acpi_one("-cpu cortex-a57 -machine ras=on "
                   "-smbios type=4,max-speed=2900,current-speed=2700", &data);
     free_test_data(&data);
 }
-- 
2.48.1

