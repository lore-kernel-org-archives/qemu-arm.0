Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91427CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:56:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v413E-000204-H6; Wed, 01 Oct 2025 13:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v413D-0001z4-Ip
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:55:39 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v412v-00010R-K5
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:55:39 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so849515e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759341313; x=1759946113; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n9ekZYHpJDRZOlVJcikM1vyUhcFtsxbY7lhISL3cLWE=;
 b=dJJML1PW3Y3ZTdRusXP/F+uyUiR42C0GyHxkaHT337X5oWcokPJ5YhIAMiJonTDu1X
 d/HyyaUGIU6NWSN+k2bEm9Bekor1/ThpiASORMoby5LbcJz0IrIISXkBdezrvMqMboNc
 BhdM7+hcp4gHFl16GwDbzUfw0a2h/Fhd5d4VKLDTHgnrDNAccioLztnPwzZnEkKDUzVq
 Q2cudp5hw3QA+UWxhjhlzx3Thypt9WPM9cbSVjdrOKUVpP+vKtHC+VGDUtW5h0TOfG3u
 GETutvvieI408XS7xiIuLzftQfBNu+xB5SV3VmHey+Ja8n4gbrvJkqa6G0GgIekjJVYY
 2WEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759341313; x=1759946113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n9ekZYHpJDRZOlVJcikM1vyUhcFtsxbY7lhISL3cLWE=;
 b=htnHT0/HiGlv42Vw1tsQDhRsXlsWUUR0lEUFTk5xPpMmHle9lcPgJcjfg81qdyYbJZ
 5aKvKH5l4HftM6wVtG4WHN9jlkAP4QdPOgZ1NmdC8yhvLlJjQ6530qwOOQRTFwo4/EqX
 +9/P+KHf7/uUaLKxf3lbrkskKn11bQA70SySylsEZGpdNMcLH3X7Q9HPNMV+NO6CYem5
 ER6aR/gmgJWCSzaMuJ9dWLhsWTNPjtlsMLdFo7Lb7dqpx+C3Do5ePz9B5+MRY+llOD1X
 zWcmmPDsCdFUpHv3rbq73je7ABmkqykgMzfz2rR7yiLNYHqQMlE7FsC2SNsNYlcPWRCx
 obBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ9mCdPOOuf5XD+mPZ+j81YGQTxjd9q9lo4Ho0uUizekSFt6Ys93uoR5fMb3DMdvzQkz72pRHwvA==@nongnu.org
X-Gm-Message-State: AOJu0YxPp/9eRLkC8LC386wrd0leq8l/77UKC5/mKNM1OsZDYkRwuodw
 R7MT0AVK99GINAPNMRCBUmsqAWTfCALOqruXYUUGFUgt7Z8p7vI2pE4iz30mnAqZ6yE=
X-Gm-Gg: ASbGncss9ZYCA82cmdQpwh22KazIW0p/qdkcM3IWiVnfP0gn25KyOqcXM9EjuEZvDso
 6ssHNdaex4rlyQJfKhG9ORPkWhHW94bFqBvxxAyLOyu+0/vs4pOop0ExsCXr3PN5VvXnjJxuID2
 NAxfybwS/TVYz1xLGloIl8uiWYtcw4ayaQ/Kx+uIigcgarVc3SKuRVfXYsVO+qfZK8ZMPtmIh9Y
 NkqY54mkhBqvjprXW8OpCb9l1uVnBmDCqQpNI3A6k1PI/joEzjtxTrdGgp1LmIoJ3IxrDABlwdx
 VU7JUGalF71FMqC2K9eZ6dZuoEtajPCeb32EPUdFjmvhnc6deJHkuytTuu+2w/mdkSFt0vfaLZ2
 YKUA46OzU622ndhFey7IACgW+4RRtPUIvJYx4CiLUK0qs59Vn6cgQLFfeqBVVTvXI4Ivx46B89+
 hhSh95S5lwh9rOvvl8cxdShjHyAA==
X-Google-Smtp-Source: AGHT+IHjfz50VbN77vl51yEZuShG9ZWJl90dZfPlk6WYnylKSeRTX299MkK2JbX1c9tALFa9dVMZ4A==
X-Received: by 2002:a05:6000:2204:b0:3e7:ff32:1ab with SMTP id
 ffacd0b85a97d-42557819209mr2844287f8f.50.1759341312780; 
 Wed, 01 Oct 2025 10:55:12 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e97f0sm97984f8f.27.2025.10.01.10.55.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 10:55:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Jason Herne <jjherne@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 kvm@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Eric Farman <farman@linux.ibm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 04/18] hw/vfio/listener: Include missing
 'exec/target_page.h' header
Date: Wed,  1 Oct 2025 19:54:33 +0200
Message-ID: <20251001175448.18933-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001175448.18933-1-philmd@linaro.org>
References: <20251001175448.18933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

The "exec/target_page.h" header is indirectly pulled from
"system/ram_addr.h". Include it explicitly, in order to
avoid unrelated issues when refactoring "system/ram_addr.h":

  hw/vfio/listener.c: In function ‘vfio_ram_discard_register_listener’:
  hw/vfio/listener.c:258:28: error: implicit declaration of function ‘qemu_target_page_size’; did you mean ‘qemu_ram_pagesize’?
    258 |     int target_page_size = qemu_target_page_size();
        |                            ^~~~~~~~~~~~~~~~~~~~~
        |                            qemu_ram_pagesize

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/vfio/listener.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/listener.c b/hw/vfio/listener.c
index a2c19a3cec1..b5cefc9395c 100644
--- a/hw/vfio/listener.c
+++ b/hw/vfio/listener.c
@@ -25,6 +25,7 @@
 #endif
 #include <linux/vfio.h>
 
+#include "exec/target_page.h"
 #include "hw/vfio/vfio-device.h"
 #include "hw/vfio/pci.h"
 #include "system/address-spaces.h"
-- 
2.51.0


