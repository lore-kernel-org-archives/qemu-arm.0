Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp562311lfm;
        Wed, 15 Jul 2020 07:07:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf3DDhLcLRtLIXmAdChmyvpyaWwb0PKjlSh+SB199QWL+xlg16glkWnV0HggmZP6ayLZBf
X-Received: by 2002:a25:1381:: with SMTP id 123mr17175725ybt.84.1594822020843;
        Wed, 15 Jul 2020 07:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594822020; cv=none;
        d=google.com; s=arc-20160816;
        b=Pl7x5V5V4mjGR8ZJXOoitbrXKLht/hPs79J81Y+z8CiDRZelz0tuXOrLGIPPUab3ip
         c6f52G978VyWYO+kJ/eMMcmGj7bAfBxoR25GRH7rhwYltTbURKmd6FheZX3AHw8KfgF0
         LPXyq4Dp4VC7QzahN3eavvJK8wie+8J1xjK+X4osbMPrmJhXwxAoNOdN1QWP7pnr1PEP
         oD321NBQ3uzCSN2IHsKNQpJY2cC19cM+4n9XIq3VP0jQrsyQanIsC37KFle3jcUjhxtf
         9Pzjf1/Rj8pUhfzkkApG3LTVj1vZETUhaAzmeCFkwXswNsZJNf8FxBL57b6bUVnw476q
         oSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=WKVwDo8gc++pP1vRtC4pwYv8NmmthcI9PuigKAgGKc0=;
        b=Jd7cDqax5hZonAtaXqhq4+dojBRZypQrR7SEcK+PiZGL+bAn+yqWzgs2EZM+/HRftf
         7eZAs6AlqZodYPUWXl01r062xUJATMqMzPbYYo6hr4d70wsqUwx7iDQ+eLNlYTDHf+vj
         IPLWb3iOJ/InSnaYiJd1Qkc0j42ktm+U+9jfDm7YZS8hJirDGuKjzoyQwg1FPfPzVuIN
         4QREWb5wgUDh+Eb89R0Tw7XE/lIBBKn3G7pJk6/OAh6+Tl8kt0SOuIGfeypcvzUUrnnJ
         f5XuhcPOEhyuSbaZjA/PSPuTzAtGf4u5PNhBzgmBvhiyjlkbsSA8726iSNDYIfwpBY6w
         7OkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ky3ZXx6X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si2671916ybl.209.2020.07.15.07.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 07:07:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ky3ZXx6X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvi3o-00024g-7B
	for alex.bennee@linaro.org; Wed, 15 Jul 2020 10:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvi1l-0007TK-I8
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 10:04:53 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27912
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvi1h-0007JN-O6
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 10:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594821889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WKVwDo8gc++pP1vRtC4pwYv8NmmthcI9PuigKAgGKc0=;
 b=Ky3ZXx6X0p7nbJsREddSkWbCnZPwMeAmtOI8Rxazx7QmTm3UlGcRscIouTYCjmBZC7NECG
 k6siAz7J+6R30vM97GjKLFaXKlCNi2wWAVkPxtpsM+XY1bnyvgvRE3zdwaOg/C1VC+37Xb
 QVKIFm31EuU1UKUep3lXYGWNDnX0bS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-vjk8lqGSPX2dD9doOgOCxg-1; Wed, 15 Jul 2020 10:04:45 -0400
X-MC-Unique: vjk8lqGSPX2dD9doOgOCxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA19718C63C5;
 Wed, 15 Jul 2020 14:04:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D3905D9C5;
 Wed, 15 Jul 2020 14:04:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A2F4E11386A6; Wed, 15 Jul 2020 16:04:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.1 0/2] Unbreak make check SPEED=slow
Date: Wed, 15 Jul 2020 16:04:38 +0200
Message-Id: <20200715140440.3540942-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 02:37:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, qemu-riscv@nongnu.org,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 alistair@alistair23.me, mark.cave-ayland@ilande.co.uk, sundeep.lkml@gmail.com,
 b.galvani@gmail.com, nieklinnenbank@gmail.com, qemu-arm@nongnu.org,
 palmer@dabbelt.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iJKlwtAmm8+y

On the one hand, getting bitten by this bug in production seems
somewhat unlikely.  On the other hand, shipping with broken "make
check" would be embarrassing.  So let's consider the fix for 5.1.

Markus Armbruster (2):
  msf2: Unbreak device-list-properties for "msf-soc"
  hw: Mark nd_table[] misuse in realize methods FIXME

 hw/arm/allwinner-h3.c | 1 +
 hw/arm/msf2-soc.c     | 9 +++++----
 hw/arm/xlnx-versal.c  | 1 +
 hw/arm/xlnx-zynqmp.c  | 1 +
 hw/dma/sparc32_dma.c  | 1 +
 hw/riscv/sifive_u.c   | 1 +
 6 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.26.2

