Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1034853wri;
        Tue, 5 Nov 2019 09:51:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqxxri9Rkz3jUTDvJAz7G790SeUQwhPANNmFL8Bj9ULmBIWTFojI8SyQK0buxPhUfr1abggI
X-Received: by 2002:a17:906:6094:: with SMTP id t20mr5642579ejj.316.1572976288884;
        Tue, 05 Nov 2019 09:51:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572976288; cv=none;
        d=google.com; s=arc-20160816;
        b=J3Qvb3l26S+Nar+mNAv2IxSxHYGFbrBMjX0UlSEvnDeREFSTxUJwfF94d1c1ANFgKI
         W839vU6UCV5DZR6hn6W1GfDyQtWR8iSLfXC5dlZLAnKTGdd8C72BBaAxx4kZ8pTOeRzS
         R42Z6ygDErG+Gqdi3xkmgoBS7t8NEei9xKm2VGWpXCWAwkBLMCLKNPhRlzPedztSP1g7
         d3YLPW+BlCuBFcVbGCCaY8cBVgr7Fzbd7NUFsgYbMyrOxdU7miWmH96SijEUK8P4oDQc
         qk27GWuqmHUCCOrTGo7MGBEBz/rZxIM5/oh8j2bpQ6hQK2pp7Yq+ZM2mr9cRiUGT5D2d
         sXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=tlt1dxE/lf/OU4KKafFnDt5Cv/36MHDOswtusek8LVc=;
        b=JvA3eM6aNsa4IQercg+RT6qh/fitLb04zpRFYE2DI5YKV+psdizhuUL0l7TIhdh/tb
         0aokDuHhFmZf1TwndS/v5yqGi0bifA0QhwTdqUB1CqZoTb9QOzprttcgsNh090k8hxBy
         Lel/faXUqiQO7k6vjNvGQdacVz8jMk+eiDO92P03ZVqJoPyJODbQ6s5BWO+rFbUJ00Zk
         Em2qs5Lp6jAj4tsrMviCgu4EhfulYmxk90ffLYMzPBMnCo9Xyis8NEfnDVxriq04WWMZ
         mGdO3H8KOdmz4CbVo2akhgrsCk8EnoJa0hxFT81CSReR78DkYg/iJ2JtVd2jiSK9aGZR
         Y0pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x31si11457742eda.334.2019.11.05.09.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 09:51:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iS2zH-0002tQ-9I
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 12:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iS2yf-0002QE-N9
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 12:50:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iS2ye-0004Z4-NB
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 12:50:49 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:46591)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iS2ya-0004Wq-8i; Tue, 05 Nov 2019 12:50:44 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MdeOl-1hsREj3xdx-00Zj7B; Tue, 05 Nov 2019 18:50:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/3] Trivial branch patches
Date: Tue,  5 Nov 2019 18:50:07 +0100
Message-Id: <20191105175010.2591-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bVlXh+qfacMYAJz0JYhOyV/CyLXAoaePIt05Vn/XxD8LtGnM1tr
 GXXn06EiHaloQjwhDdOWzFLEfaOUmFNry8lZMGSIvXXQY/AvH/MOpXkIPZTpoD8ZWKbZoPT
 AlrpUTkZ2yTxn/w8RnJof5KISGUZwN8ctqeco5tBWFnYqxWmaut/OixibWFpfqCzugpOgUN
 AYjerAX25MByQ9tiRIp9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FDAFY9f0SXI=:JhUvsvMKENvKfD/dRw9zBJ
 ttvXeWgWtQ0G3bGac4B0To/qcFALz5sKpcxEWnHS29A6okPGDzapmAd/IShQY40J0eMEICMdY
 Hhzf9Hv/Ar5WdBr4nPDRIaV4oXFzDj11D1kGeinxlLF8ATqRqqqj74PKDOkRlbxpWtHB/ZkT9
 h0l6BM+7TbeMhlPykRA9n7cBN85XmNhUbItIeBUQ1dBxKHb3PXojjC/5Nd52kLo3cuiDG+qwW
 i0yUuL0LyLSmCVL1Phv2oJWmDkJmYpOd30QrCrLfBegwku/pYcPkGVmvOlQoDqtCBTPuH2Vdc
 avbzYzExQuGDPlqelThcukrRhp1Lf7nRAJ5I397SctfYy90gJ/+JtN/O6rICOOJFxv4Mw0t/w
 /IYZBfO+J9luFhU349T/KwemXsHRilcrTAi4HuXIZSPY9DRifvYs5MC3XQ3HPhYW+mBNYHSz7
 b12PjhLdPJNuVEX1fvuYCi4H4YTsGEJGrMEfqrcuceKOfKtcORLa2YXltU2buGnPX1TSj2ucy
 JByAjDcbOJWiOpjuMwC4M7q6e6pOvehyJnKnkwno1Kg7d4layedaxjcKRBM7WnF12bGxHRVmW
 1dCHl+goyPjFvWKp85s5wItlIJgeQkPL54xcsKV8kS8cH9i2eZoaoFqzXiy5xgYvi7/4Mir35
 Cd0FJuQPGz6Q0Ec0lmnPkQPoR1+oJr+MMbGx9QNhuDXOzk1W1sXb8XaZrGceyWRfIktYY0mTx
 IKPhbskzE9rR0Rh/mSIF+t6LfpMcmBLSxazfbvNWxQk7F65vUHflTE5Za7e5hoaUV+g2YTSwD
 nyT5Pf5CoiVM0EwhDU/DfgpcBn2lUtSjaRXZyY/LGv71R2E2jhgL/AnOkDtII8BQd5A6X1oS2
 Nm4tEFD373kW4k8ERvB9jzTREmeslEmIZmwsqqXr0=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.73
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu-trivial@nongnu.org, Claudio Fontana <claudio.fontana@huawei.com>,
 Cleber Rosa <crosa@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q0gilbxsMqLs

The following changes since commit 36609b4fa36f0ac934874371874416f7533a5408:

  Merge remote-tracking branch 'remotes/palmer/tags/palmer-for-master-4.2-sf1' into staging (2019-11-02 17:59:03 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to e187e55ec65039ed6bd982debee632450ace3bae:

  global: Squash 'the the' (2019-11-05 18:39:14 +0100)

----------------------------------------------------------------
Trivial fixes (20191105-v2)

----------------------------------------------------------------

Dr. David Alan Gilbert (1):
  global: Squash 'the the'

Philippe Mathieu-Daudé (2):
  hw/misc/grlib_ahb_apb_pnp: Avoid crash when writing to PnP registers
  hw/misc/grlib_ahb_apb_pnp: Fix 8-bit accesses

 disas/libvixl/vixl/invalset.h       |  2 +-
 docs/interop/pr-helper.rst          |  2 +-
 docs/specs/ppc-spapr-hotplug.txt    |  2 +-
 docs/specs/ppc-xive.rst             |  2 +-
 docs/specs/tpm.txt                  |  2 +-
 hw/misc/grlib_ahb_apb_pnp.c         | 12 ++++++++++++
 include/hw/xen/interface/io/blkif.h |  2 +-
 scripts/dump-guest-memory.py        |  2 +-
 8 files changed, 19 insertions(+), 7 deletions(-)

-- 
v2: remove patch from Greg that has lines with more than 80 columns
2.21.0

