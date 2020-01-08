Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp926690lff;
        Wed, 8 Jan 2020 08:07:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqwMcvyiLQWqpMAuCHZgmMIXkFDP/edjKpp25vawIRkyhn9jbdwWJv7uRleOxG+cJPOqaEUh
X-Received: by 2002:a0c:c389:: with SMTP id o9mr4896887qvi.232.1578499668148;
        Wed, 08 Jan 2020 08:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578499668; cv=none;
        d=google.com; s=arc-20160816;
        b=Ycyam6uT6I4uYRFEjV8iDlsMySszEyZwQruEinr+AKS1hlMuwr6T41lpKVrQjz527I
         Jl/aq9j5ixv6sYDqyqS7K1gwdxDDzRx+l1fdi6znUjz4XZS2hda6G27EwOjyTXi2eCKt
         N9g2Qhrc0qR1lPhuojIbKOCVkuCQ8cLaTtjjq/z0gG2iGaH8N0P/+cyScXAQluZ66Se5
         sNJxrq+8oJ67FAA0YZODwMx6ZfWd9WRRxW7+pe07PNiYAJ0E86NQZlkzDvKfE1xQegLf
         30vSW6/9OkK44T/QUUy+15XpH/Up96Pw8F53nVqlA9njNB+2mTrtjCA4/us5q0xap/Km
         0MQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=jvf4w+RBHX/yncJ0YVWeWbaonF4xhW1Q8Hxr9wLkm/k=;
        b=r0WYurDTEjroe5RKAYiN3rwflgzRHhlQUx0bXmq/IgLEWLlkQz1KpXVnLOEiqLafKC
         Sdk7tB6g558M8l7QllQfq93Eo3EBeWEnhwFd0pJIup30CCJVb19htBVRVQcJocTr8csn
         hdtcq3OgnNccDy9OkX6LMJ4tcUNSCkllp99dWwceFSvp/o+7M0nOOw4Fbntccru6FLxZ
         Bkn816eJKrUsu7w34ZtjAdlCK7vNTOZ6L/2YOneW1ZW1rTD4ax6P4uKHNsx+tCgWp100
         I6R0MqYoEiCkYiOSGfvSAGcefI5gMRdlQgLcv6qFTdMwZX8GHDdiADYpBNwJ34v6be1g
         OPKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i144si1793414qke.199.2020.01.08.08.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 08:07:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipDs3-0003i4-7m
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 11:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36445)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ipDnL-0005hq-9r
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 11:02:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ipDnK-0001u2-01
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 11:02:55 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:58733)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ipDnJ-0001sQ-MV; Wed, 08 Jan 2020 11:02:53 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTzve-1jG4Kg3vVK-00R2Wv; Wed, 08 Jan 2020 17:02:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] vl: fix memory leak in configure_accelerators
Date: Wed,  8 Jan 2020 17:02:33 +0100
Message-Id: <20200108160233.991134-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108160233.991134-1-laurent@vivier.eu>
References: <20200108160233.991134-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dBVTSiGT6cFvz6yTeBe4zQ3GS80X+iAEX9u3kOCQRLeS3Yx6qyC
 Z7Jc8NEZzFMS9OZL2SVwwtgcFeUk1liIDSGHcUEgQYhV+cPkoiVAfYZuc9QT+fvRL1rBuZM
 Pc1y4aBeBiCG3rJ1DBPL0A3OQBgnoZ/dZ7eFHwcpEPBXGEYEN5jT0YrXlAkTrxmsqtMhuYX
 3w7AyKz6hhJFi5zT4A6Ww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RrWxFiTocSE=:WugAK7Vv6c9O8V7GZ+xfjJ
 vz140dfW2NBp/RynMhp1c1FrKrHWMWw3JCge/tdA4qRmRD0RKekaDP5Be1ghGzIUtYmfXz7nq
 lUclvc31IZGoOLviiXBJKTFxCd11D+8dkkFWWya1LQljBAy/i2nsenzc2GaW5FJiIkeode2Nc
 Y01FwKTtHXHIHbD1EubX7aQx/A+l3d+S/Xsk1CrTr2nmSBJYL/rCIKK7sMoM+q7Va9fTMmP2O
 UFpTCxgXqFINQlKuGsQyMlv95RFAvPRaNTjRTlbRrBNFV3uPZBA3rcFm7E5E1YLdOVf5f0RbR
 DDHjdVLvYOwnetDHdvMscEOkdAKd7do6XPT993MMO8bghGxHBVNi1nrcu02JrmIv2BiJiUE97
 D5rwH+ouQf72B5w2WfiGizGCgxBGTX/b4g9tt0d3fdWrVVwOyUYyvTNjTiP9d3+DR2aywIYPF
 DnypHqEkApWtmxcVNzhTa1EhPTxVtKDH33XcyK0ebtoqEcBAPDEcuL1LPtg4TTMaPLJ2DWISA
 6kiguTSS/zkDkujZWL9p7Hw/LQHlxelqzHA+lYefLxW5jExC2y0DHpVMPSFQLinwjkq8MIxYT
 PXmgOHb2VM3/cOdkyLWk7PqDgp3N+s0vDTT3v8Cv3KN5nK0sEc4vzFesB5SlpwqMWuv/E1vTt
 ZeFr4pgjsYbZhg6bFjBrjvyfwgemmvGbFhRvgCF9u4w+w8qKpR8/GgkLj/inX9zFJMTLPxZ/S
 2glPheRbEVZokjWzerT87Qs38RP+JezwIOQvMLWSUzCCujIACkgBv0J5eI2IM4I7url9+amBx
 WqOEhXscm6Sem5yjs4Hfyw+EFAHUQ+rLfqCuol9Gozr+3CMqWIxJBOIU13UW/g8mvueeN773O
 +dIcVd3TwuNSFAaJcta742DtrErp9BBV4Vhtzp8Ag=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.133
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Euler Robot <euler.robot@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Chen Qun <kuhn.chenqun@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FNH9NvrFKE6y

From: Chen Qun <kuhn.chenqun@huawei.com>

The accel_list forgot to free, the asan output:

Direct leak of 16 byte(s) in 1 object(s) allocated from:
    #0 0xffff919331cb in __interceptor_malloc (/lib64/libasan.so.4+0xd31cb)
    #1 0xffff913f7163 in g_malloc (/lib64/libglib-2.0.so.0+0x57163)
    #2 0xffff91413d9b in g_strsplit (/lib64/libglib-2.0.so.0+0x73d9b)
    #3 0xaaab42fb58e7 in configure_accelerators /qemu/vl.c:2777
    #4 0xaaab42fb58e7 in main /qemu/vl.c:4121
    #5 0xffff8f9b0b9f in __libc_start_main (/lib64/libc.so.6+0x20b9f)
    #6 0xaaab42fc1dab  (/qemu/build/aarch64-softmmu/qemu-system-aarch64+0x8b1dab)

Indirect leak of 4 byte(s) in 1 object(s) allocated from:
    #0 0xffff919331cb in __interceptor_malloc (/lib64/libasan.so.4+0xd31cb)
    #1 0xffff913f7163 in g_malloc (/lib64/libglib-2.0.so.0+0x57163)
    #2 0xffff9141243b in g_strdup (/lib64/libglib-2.0.so.0+0x7243b)
    #3 0xffff91413e6f in g_strsplit (/lib64/libglib-2.0.so.0+0x73e6f)
    #4 0xaaab42fb58e7 in configure_accelerators /qemu/vl.c:2777
    #5 0xaaab42fb58e7 in main /qemu/vl.c:4121
    #6 0xffff8f9b0b9f in __libc_start_main (/lib64/libc.so.6+0x20b9f)
    #7 0xaaab42fc1dab  (/qemu/build/aarch64-softmmu/qemu-system-aarch64+0x8b1dab)

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200108114207.58084-1-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/vl.c b/vl.c
index 86474a55c9ef..035a24e52b24 100644
--- a/vl.c
+++ b/vl.c
@@ -2788,6 +2788,7 @@ static void configure_accelerators(const char *progname)
                 error_report("invalid accelerator %s", *tmp);
             }
         }
+        g_strfreev(accel_list);
     } else {
         if (accel != NULL) {
             error_report("The -accel and \"-machine accel=\" options are incompatible");
-- 
2.24.1

