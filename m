Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3522941lfq;
        Mon, 28 Sep 2020 03:51:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz36ucXlPblF8AHuTY9q9EsG+mH+qbxaJyWXWIG4kRIwQ9cSSKl7tuEpBDhr74btAEwPRlb
X-Received: by 2002:a25:e046:: with SMTP id x67mr1060061ybg.342.1601290269850;
        Mon, 28 Sep 2020 03:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601290269; cv=none;
        d=google.com; s=arc-20160816;
        b=SUZQFIpWYW60rmoUlvEqA5AT4W+FB7SM1nAQIgD2J41BKBZhjaSL/ELifm2mZxRRkP
         8EhtmEvZpc6gki/D9R91nx6c1lNwlia9fVb+J6KOJWKyOuTOmeby3qkUOBnAT5PLk7HD
         otP8R89+0bSIuDROR9T29eLnJErXXV84ZQsmvSV+6iaJrQPw7bnUZnzATX8CM313jzsp
         W7QMPCFM0qSR69l/Bc/MeE3wTnVpN42hqJsAc+AfeU5YD1WLW0BuVRngE/ifSQiNKHkU
         M7v2do9hcVxuzLjp8PVJZYcVDD5Bz3vpp6+2YjcUu+hjeRfqTzafGjRWfu9AkZ/2eb92
         A9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+WSygC6kySUPz9u+rwH4GRNfyUq92oz4OUXHFwamiQI=;
        b=NfF5iYtcf/41lwNulplTc/F7fHg4zEbVlYVIDxQES7Hxseem8c0S8OxuHBkohKip6x
         i7fl7rTE3CNCBVdsBxJ/LMII4842ZXWe4lYHd19zg1+a67GgOmteOC20zNQO9b/SNSWn
         dQh70Zc61/bUqqOAcMmi/km4Ri6dEtWESgY45F2zMBiID0bCr7DCHx8yCyydDVmcYqTr
         5VI93saNL5SmEU+grJuxG5JF1nB8+AsUj3nO7Nqlz6WTVzJSBliWYZ7y8/4V4JrQ0nhS
         yLt5dWPuty7Iz6SPnaYDdj3DXJghu6Idfe4ImiYbmiBcaJss9805c/+boxzLau9e2o7t
         b4Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GvsUuYIX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l31si453711ybe.354.2020.09.28.03.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 03:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GvsUuYIX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMqkP-00089o-8j
	for alex.bennee@linaro.org; Mon, 28 Sep 2020 06:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMqct-00080a-Lp
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 06:43:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMqcq-0006JP-1T
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 06:43:23 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601289799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WSygC6kySUPz9u+rwH4GRNfyUq92oz4OUXHFwamiQI=;
 b=GvsUuYIXKmNLkb1FZZOW3MCTCkIHeI+3ZVcDBkm5eZKlOVkbjn/8HOx2/K/BSs2Idy0i3t
 s4/nh3TTvC4UoYiviI8M1pMhd071fiEkVvTISzfV/ZXrBqhxdozn21h9dDcncXM6LlCM2x
 PaqMBg5SKTpPabhCH4DyLZCnAIHHcS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-jSq0nZUSM0-mQthePMZ5Lg-1; Mon, 28 Sep 2020 06:43:17 -0400
X-MC-Unique: jSq0nZUSM0-mQthePMZ5Lg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDD68802B61;
 Mon, 28 Sep 2020 10:43:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82C1760C84;
 Mon, 28 Sep 2020 10:43:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A4ED840846; Mon, 28 Sep 2020 12:42:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/12] tests/acpi: add empty
 tests/data/acpi/microvm/DSDT.pcie file
Date: Mon, 28 Sep 2020 12:42:52 +0200
Message-Id: <20200928104256.9241-9-kraxel@redhat.com>
In-Reply-To: <20200928104256.9241-1-kraxel@redhat.com>
References: <20200928104256.9241-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.576,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3izL0KxnDIhp

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/data/acpi/microvm/DSDT.pcie | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 tests/data/acpi/microvm/DSDT.pcie

diff --git a/tests/data/acpi/microvm/DSDT.pcie b/tests/data/acpi/microvm/DSDT.pcie
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.27.0

