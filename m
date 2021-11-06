Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp3285456lfv;
        Sat, 6 Nov 2021 02:11:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsf95PDxZckm8TTx8pMcqGO95u1jkc1nDPL+81KWyOEjOD4DvbalW3zjY/LgXnQQOH2vR5
X-Received: by 2002:a54:4499:: with SMTP id v25mr25686783oiv.71.1636189885714;
        Sat, 06 Nov 2021 02:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636189885; cv=none;
        d=google.com; s=arc-20160816;
        b=SIR7AJxvti1aKMTVzaSgPXQ1PY+3HbL9X+f0SJkRzmp/HBv05X72f9fcOBrQG7zHRf
         g0g4euHayahUgxluN5EPWHe1L8W3MP1D3jEmM5pTc/A41AoDyK8wVKnkQjELTnhtWi/K
         HyRULp5VHgSt6jCd0J6nlN1DPlcu4r8PjrJ1dKSO/Yl86xNE6mCxTs7IfXkSzs9gQmGb
         zgtjry7iNOsHz0O18cdg9gRRnGlwpifM5nbSKBxnYr+pBt765+VnhsfFhTjLQZ9FvJ69
         ONi9K0D9MKbv4o+3sGFmnOxBvGsojcgGQO0+60NwZ9lSPxZxW4m5235VW4iSA3tLOFYL
         rVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=TLemfymmIdX9ccU0ak35RWWXY3RP5yiYEPKWiq9wRyQ=;
        b=QSyrilZhyhy2ssv6FGeaEnBkffc0+UxxYA2CxbvXuXhdFPeEyCIHnVhfKsk8aSqRWv
         0j2c4XW7fX1Cw+aWnrGklD2jrIX4m8KA3+cDV+FZfL8O3h8bqZd1Ir6LZvFqbsqzJtn0
         sRhtBTymtmLXbpuIAtAZYx65GKeQDJDsmRU6GsONxp8YXHdWAg4T/gyovuB1JT/HSV5y
         TZKyZOH/jdElJnHtgl3GFVySSCWbx5iiFxV4Qa7NMm53qZlZB/J8fG9YKxtIDtV2jCjG
         FNo1zZSM3gs/FvHU2d1MkoQYWaKHpCn2A6DzD5rmU1DhSZX62gbl9N0uePkUipNN3mzH
         DAzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=br6AmKDH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si7796517oiw.241.2021.11.06.02.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Nov 2021 02:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=br6AmKDH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mjHjR-0005La-13
	for alex.bennee@linaro.org; Sat, 06 Nov 2021 05:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjHjD-0005L2-Nj
 for qemu-arm@nongnu.org; Sat, 06 Nov 2021 05:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjHjA-0007uQ-Km
 for qemu-arm@nongnu.org; Sat, 06 Nov 2021 05:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636189864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TLemfymmIdX9ccU0ak35RWWXY3RP5yiYEPKWiq9wRyQ=;
 b=br6AmKDHVaqHod6/GnocFfuTWBc+JK4HsGoncjSwsDZEOjGpJP5DWEm1Jd+BX3X1Fy9W1+
 7oVYX1Mq9V0aFNIlYRckC+sRCnCdo6pyO5+FfB/+L71c6bw06RCmvehIdFSBraUmNk6Nhl
 SJCYTRsgFnCv0SOrzEFo/JiIwIUpXF0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-I9HEu4hwMbmTjxJXsD-58w-1; Sat, 06 Nov 2021 05:11:02 -0400
X-MC-Unique: I9HEu4hwMbmTjxJXsD-58w-1
Received: by mail-wm1-f69.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so4498852wmj.7
 for <qemu-arm@nongnu.org>; Sat, 06 Nov 2021 02:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TLemfymmIdX9ccU0ak35RWWXY3RP5yiYEPKWiq9wRyQ=;
 b=FV+5Aa6spUHFQocEl80jTmVznZfsKKn2GBgXsajU52sDbh8ipC62jsUTjtVWNQqrjg
 L7QEjWiBZgLQvkIFnsFxxN8jf0DNZ9C2/J3wW31ef9/4ipgLm4nYY8f+ILmxVxDxFzOp
 pgjkUa7ShKfknWdjYI5Q4oE/jl249y1s/D/SD12Wj1nwBRJ0EtLAxu9c4ufzzm56S0IK
 vuWIlRKUQFbuZ5N1wW9vzNxMy26Lfi2/+EwtxXWkPxhDQlkyizvMsivA0OUrZ33XGnox
 srNn6cDV1iYdstGpNw7B1lq8/idStb+aEnUJTQF7EKXCs2sjgEYGLWautu3eMjdaXv2T
 QVCA==
X-Gm-Message-State: AOAM532h4sK1UWNM3Pbuuo5XoOzKmoGF8f1cI6iRPl1tBpr/0AXdZ/F+
 4QuinXZK6CoZGrvMo8p7FLZWfeXP1mEhQbrFPKvJb6cYtTgsdUZHGO7lXs4dyZeM9waa+IruTqu
 gAWkyysKM4M+p
X-Received: by 2002:a05:600c:430c:: with SMTP id
 p12mr38260176wme.127.1636189861750; 
 Sat, 06 Nov 2021 02:11:01 -0700 (PDT)
X-Received: by 2002:a05:600c:430c:: with SMTP id
 p12mr38260141wme.127.1636189861446; 
 Sat, 06 Nov 2021 02:11:01 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d24sm9408308wmb.35.2021.11.06.02.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 02:11:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/avocado: Remove p7zip binary availability check
Date: Sat,  6 Nov 2021 10:10:59 +0100
Message-Id: <20211106091059.465109-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9tTPJVxbhkxm

The single use of the 7z binary has been removed in commit a30e114f3
("tests/acceptance: remove Armbian 19.11.3 test for orangepi-pc"),
we don't need to check for this binary availability anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Based-on: <20211105155354.154864-1-willianr@redhat.com>
---
 tests/avocado/boot_linux_console.py | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 4ed01ed7893..9c618d4809f 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -22,13 +22,6 @@
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
-from avocado.utils.path import find_command, CmdNotFoundError
-
-P7ZIP_AVAILABLE = True
-try:
-    find_command('7z')
-except CmdNotFoundError:
-    P7ZIP_AVAILABLE = False
 
 """
 Round up to next power of 2
-- 
2.31.1

