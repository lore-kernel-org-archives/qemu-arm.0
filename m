Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp121918njm;
        Tue, 4 Mar 2025 05:32:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU5furKpCfT7nXhezb1s2InVy3op49dInsAOWCSjAxDj7LJI3eFk3Ugz2Z9Z9CKVQPAcmU/VsfUQ+gwyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFnShBnRXWqkbqwGl+TMSTpnEIzTNWWuu38UefIE58YUYPOE6WT8ygMebmYxtR/kHBHynb7
X-Received: by 2002:a05:6214:1d28:b0:6e6:6ca6:b702 with SMTP id 6a1803df08f44-6e8a0c0426bmr268854216d6.0.1741095124411;
        Tue, 04 Mar 2025 05:32:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741095124; cv=none;
        d=google.com; s=arc-20240605;
        b=j1VNL8T10glKVJR4UASlQAxhMtULg5OZ+D7HA7CGbkwwW7MCUx5hfZj3UqZaYtrZxm
         XFsoqiDur98EFQJ5HoOJCJbxOgeWAmpdFm61z0mjB7TONF+YeFTqhosxF57yxPdRjBa5
         hr/WqcAfnZ/n59hcCcE6RJG67k2Mk3tvnSCsV8nrWke4xSzzSF/QqsdaMQbNnw4Tjoth
         eK2Eo75LI1BTg0DzYGQZVLq1M/EEX6ubgGMg6KrlgsdR9j51PmGXzZpWvLcn3qMu4Fze
         YqPPU3/sPYeZmr7e08p88URUuMFykRo3Cv0Df2Jq81bqdbDTQHu9XDRrgZ5ESuuKBAK6
         nh+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=eM9Sc3t+e5TFHI4ttB81Q/79U4bsn1M95Z2oHmIgLaE=;
        fh=DXOpMIWt0xps/mARA5KN5kZurKhrbywnyV/orYGM2Eo=;
        b=gDx5pdL6v/xVYiJRmNoiwk3+YrFbIPfHZjXWnWN2D0UcHJVSA2nNNkMZMknG/j8fPb
         I6JCr9LErkaaWAsWbk3dqF+mAyQftDQzgARef7jSAS9nJkzAF1ZMMZavvGrVcClvP0zR
         T+fcmVRmkEQcQGvJX+MlBA8yvQnQ+rolSUBCjRE0U8eht4wCxDJ0FFxKSWOcMs16FdkM
         5R5ZH6hvsamBSDV4Q7actGoPvTqgKWVft2lAoA6cDFaWJgbZHOXbw/XaxBFjHymCYvr6
         AaF6kmkWof1lQDC7r93lG1H1w//PizFm1i9PtcBfAAr+D5M+/35Uul0FmoSYbzJjNhsh
         lXQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=aEqNlCMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8c28cc0d5si52893426d6.87.2025.03.04.05.32.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Mar 2025 05:32:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=aEqNlCMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpSN8-0000Ah-Gv; Tue, 04 Mar 2025 08:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tpSMs-00008V-4D; Tue, 04 Mar 2025 08:31:30 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tpSMo-0004Yg-VU; Tue, 04 Mar 2025 08:31:29 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0D088A44D7A;
 Tue,  4 Mar 2025 13:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C32C4CEE9;
 Tue,  4 Mar 2025 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741095076;
 bh=lVWHChPEXjI/bHXulgoGRI0WzVhFif47e2xu9lXivW0=;
 h=From:To:Cc:Subject:Date:From;
 b=aEqNlCMpfTebC7bzdTgNCYn9KZQa5KGWmVdaODpkZ/SYSzRb0hY9k1ZeDEBAztyKh
 P21DKubI9mCc4ypOBguOXhH0wJdO7nPamHUB5c/oPSxUitJzFoZd6yJh+gY+DEFwfI
 Kbly95uAPgpbUmjKkOXFWm+0fzMdUtErzoEyAdy8t70HK/M4uDo5rGNXypw6vnhzOz
 VYgTJ5s2IU0dY6qCUByOaPjveY5+6RJMdltwqIQybVfxrXh5mITtpZtqgqkQdW/AIb
 jQa95jl/qVn22ZLCd5zZCe77B+bDu47FOpr5b3f5caxvk5QJ6IeDD5IZcnFisty7z+
 nqBcS3PhxFqwg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tpSMc-00000005rnM-1lsf; Tue, 04 Mar 2025 14:31:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: [PATCH RFC 0/3] Attempt to add GHES for x86
Date: Tue,  4 Mar 2025 14:30:55 +0100
Message-ID: <cover.1741094512.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TBZsSkiZolOY

Hi Igor,

This patch series comes after:
   https://lore.kernel.org/qemu-devel/cover.1740903110.git.mchehab+huawei@kernel.org/

I'm basically trying to add support for error injection for x86,
without success so far.

On x86, the notification mechanism is different: it is via QMP.
Yet, from what I saw on Linux implementation, it works on
a similar way to GED. So, I ended implementing a notification
via GED.

HEST table build seems to be working OK on it, and the
error injection notification for x86 is called. Yet, OSPM is not
receiving any notifications.

Could you help me figuring out what are the missing bits?

PS.: there are some things at the code that require polishing,
plus there are some extra printf() there to help debugging.
Finally, we would need to add x86 CPU error event at the
ghes script, but I'd like to have at least something that the 
OSPM receives before improving it further.

It can be tested with:
   $ ./scripts/ghes_inject.py arm

(Ok, this would be generating an ARM processor event , but
I guess Linux would at least mark the event as read, even if
it doesn't recognize it)

Mauro Carvalho Chehab (3):
  acpi/ghes: move use_hest_addr out of acpi_build_hest()
  hw/i186: add support for HEST table with SCI
  Add a GED device for RAS notification

 hw/acpi/ghes.c           | 16 ++++-----
 hw/arm/virt-acpi-build.c | 12 ++++---
 hw/i386/Kconfig          |  1 +
 hw/i386/acpi-build.c     | 75 ++++++++++++++++++++++++++++++++++++++++
 hw/i386/pc.c             | 41 ++++++++++++++++++++++
 include/hw/acpi/ghes.h   | 25 +++++++-------
 include/hw/i386/pc.h     |  5 +++
 include/hw/i386/x86.h    |  2 ++
 8 files changed, 153 insertions(+), 24 deletions(-)

-- 
2.48.1


