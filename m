Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp507864lfy;
        Fri, 24 Jul 2020 09:45:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTi0GB8cZ9qrfW8lLmK/3M6q4kM1PyUbMiP8UBV4HbbVvPwXHMa0qzwmzTrtpzGwE9uMwU
X-Received: by 2002:a25:4c45:: with SMTP id z66mr16685360yba.175.1595609146397;
        Fri, 24 Jul 2020 09:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595609146; cv=none;
        d=google.com; s=arc-20160816;
        b=t3x3lZGo2GUsDMDWsFUJ76CoPxQVJrlO0L9uHlmZtgw80WpDk4JJ0ZmJVHqJvswnli
         XwPLWxUtmL194e1WlpHK+aCA7xlsChaoAyPCXw//4Q8dELQH5RvjVYyKD9y28VsMURLh
         497iLfJ2hfIODQIOsSaRtIGv9jy5VPabcK2OMOBXSq6lNSVQixkJcA1vzkrvzgocoLpM
         EZZecVfylSrE6jLqog5wqZ7uVOxhyazDXAuy+9PNtfiZlrAyvi4rz0LIJiuAqgMhL2pS
         5+gtsq+XbKMZLe1Br3Xck6kmjROAl1d68HwCceUJR/H0aF3PrYcsTqqfKLFegZJix8QA
         s0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=j4Avp+evuy3lGWRW/wF3VnbX9D8jtxzLrMUE3Wyr84E=;
        b=OHpnJKdhoxaWKexR2YWMb4PEhQExl5N4EJ4EdN7/zyDtIKFK2Gzfx55rsv5+wN7W+x
         XcqtNKkIRl0OZP+sPd05iO3qGlaF8PkGpej+wiOtdCWsESkxvHA/5RvKxJDt1MUWsOkk
         ZFcT+jplw4GFcVxkntBFcHPzkHG7osEfEkm4Y48WOgwVrnLHNegCes16jFCbPb1K0juA
         b9pKuFIsyjqrWhPVD2EHLjiHxERF0e7gnTyDGxZvFpjIJ2ZW5r0qoCsJneHn4OUIq9az
         fprnRXjRGGkpAsvK1LQSWLT4LwrSLox90nA8mIspqrbJS5BBbRx+5v2O4fD18GVpiQmG
         dJ1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YwUOeLzA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si1216678ybr.208.2020.07.24.09.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 09:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YwUOeLzA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jz0pN-00006V-P1
	for alex.bennee@linaro.org; Fri, 24 Jul 2020 12:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jz0mw-0005N1-W9
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 12:43:15 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60675
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jz0mu-0002aD-Jn
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 12:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595608991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j4Avp+evuy3lGWRW/wF3VnbX9D8jtxzLrMUE3Wyr84E=;
 b=YwUOeLzASmzkREdS/ADJxt7LIxwqepqBBX/7mwqhOTo3B6K+dudXf7MePG2V95u66uR1wx
 J2K0rNfZtL8wJASJf02Gess+R0OK75LBWZubA9MD9lo2sVNWhHi+QXygSESNrsXhsWtrtD
 HM8rZB2Qw2UC7s6zS8J84+95F7Vys2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-2HiQOSZ4O6WJsdxQ5qdAQA-1; Fri, 24 Jul 2020 12:43:07 -0400
X-MC-Unique: 2HiQOSZ4O6WJsdxQ5qdAQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 312D680046A;
 Fri, 24 Jul 2020 16:43:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDFE637DD;
 Fri, 24 Jul 2020 16:42:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 974AA17444; Fri, 24 Jul 2020 18:42:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Fixes 20200724 patches
Date: Fri, 24 Jul 2020 18:42:55 +0200
Message-Id: <20200724164258.24886-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 06:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SWfn851ERd3h

The following changes since commit 09e0cd773723219d21655587954da2769f64ba01:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20200722-1' into staging (2020-07-23 19:00:42 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/fixes-20200724-pull-request

for you to fetch changes up to 9b52b17ba5e96cec182537715e87308108b47117:

  configure: Allow to build tools without pixman (2020-07-24 17:36:03 +0200)

----------------------------------------------------------------
bugfixes: virtio-input, usb-dwc2, pixman.

----------------------------------------------------------------

Peter Maydell (1):
  hw/input/virtio-input-hid.c: Don't undef CONFIG_CURSES

Thomas Huth (2):
  hw: Only compile the usb-dwc2 controller if it is really needed
  configure: Allow to build tools without pixman

 configure                   | 2 +-
 hw/input/virtio-input-hid.c | 1 -
 hw/arm/Kconfig              | 1 +
 hw/usb/Kconfig              | 1 -
 4 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.18.4

