Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp247490ejb;
        Fri, 23 Dec 2022 00:51:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuzRvITJOtdRROFDlGugMNjL9f9fihbEY3L1FdeqcjwgWi6LgFq/eb6Wjdn8aRH+7WtW+K1
X-Received: by 2002:ac8:7248:0:b0:3a8:43:3bb1 with SMTP id l8-20020ac87248000000b003a800433bb1mr10480040qtp.30.1671785499776;
        Fri, 23 Dec 2022 00:51:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671785499; cv=none;
        d=google.com; s=arc-20160816;
        b=R77BtDYQcRcPio38B3GQdpN3sIhHVmuX8Hd5NLeMRImSqpbHmDrNaGrzVkBVqy6oIk
         grRizzKlF88scW9G70WwIcpbQHb6I9QLv5t6pvMS3m9/cF4mRc+16mB1vebBJmq5xpeH
         NuZWtGaD14eodglufVAza7MvCJRyGcmSsRsSczobH7fI5SNeTj3YdYgAJFSPq4wISPD3
         5mjGDTl/UYTWYUzh4ybzaq0mGvM9wQPVdel84S924yCUn95us8gK3yqxeLoz8Xmk9XUr
         401HVfnC9VJiU/Rmi64yLnvutNhgREXdyOZ8fV1CrmaIC1qYgDrx1VvyCEsogOmDdh46
         Uf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=nA0yTRjE4B/GGRqovGH7gp0Xo/3x73aidjMjJgTqaPc=;
        b=jHohe0Af9HUkJMPqsE1f+z+pdc3DgX8B9n1+JSbI4eBb7TN/SoBYXhbsgPAblQq+S3
         dSfVePIPQweLXULzbVcoLIOVe3O2gladO0IFPj5YbzivDLGUOhvo9xmTUdr7NL5uksG9
         RAonOaiJyzj7pmxGQcLG8sBO518qZCjDbj8aAUU7J4yZNLNAEngLighbjFF6M/IWYjFo
         RnwJS6VeP9doOouLBaFEkUMXbIJC75O8XNukh/oYcfbKtT2xQT+lNP6327ab+dD4Xquq
         yumTVWRY04zlNBs6C/xUrgxptLLQBVfjje9aBXlUdne75Gnfve3cOvZFuvMJ2wy8ZOYl
         2DVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv13-20020a05622a4a0d00b00390d451b552si1042935qtb.344.2022.12.23.00.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Dec 2022 00:51:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8dli-0007MG-Ea; Fri, 23 Dec 2022 03:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p8dlb-0007K1-MM; Fri, 23 Dec 2022 03:51:00 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p8dlZ-00046s-NN; Fri, 23 Dec 2022 03:50:59 -0500
Received: from localhost.localdomain
 (dynamic-095-118-065-151.95.118.pool.telefonica.de [95.118.65.151])
 by csgraf.de (Postfix) with ESMTPSA id 84912608042C;
 Fri, 23 Dec 2022 09:50:48 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] hw/intc/arm_gicv3: Bump ITT entry size to 16
Date: Fri, 23 Dec 2022 09:50:45 +0100
Message-Id: <20221223085047.94832-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: 49fNMI6IE8ea

While trying to make Windows work with GICv3 emulation, I stumbled over
the fact that it only supports ITT entry sizes that are power of 2 sized.

While the spec allows arbitrary sizes, in practice hardware will always
expose power of 2 sizes and so this limitation is not really a problem
in real world scenarios. However, we only expose a 12 byte ITT entry size
which makes Windows blue screen on boot.

The easy way to get around that problem is to bump the size to 16. That
is a power of 2, basically is what hardware would expose given the amount
of bits we need per entry and doesn't break any existing scenarios. To
play it safe, this patch set only bumps them on newer machine types.

Alexander Graf (2):
  hw/intc/arm_gicv3: Make ITT entry size configurable
  hw/intc/arm_gicv3: Bump ITT entry size to 16

 hw/core/machine.c                      |  4 +++-
 hw/intc/arm_gicv3_its.c                | 13 ++++++++++---
 hw/intc/gicv3_internal.h               |  2 +-
 include/hw/intc/arm_gicv3_its_common.h |  1 +
 4 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

