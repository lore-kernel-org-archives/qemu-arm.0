Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp318183lfp;
        Wed, 19 Feb 2020 02:19:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyArZMXtf3pNJpYGRDweaUCDjGs0QaeB18bUFcqVAXbIxbq/ZgUTr6grXwmxMtj2u+DyN6R
X-Received: by 2002:a37:a12:: with SMTP id 18mr23488207qkk.249.1582107547073;
        Wed, 19 Feb 2020 02:19:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582107547; cv=none;
        d=google.com; s=arc-20160816;
        b=S/JaycjW569K8itFMONSvpuvRxXoBH4T3j8wDlsWadNzl2C9/Cx0fqeZHHUqb6fx7f
         qydTQG55dHIzHYLX47we8m1Jx+1udW1RjPufCVTk//UeURa25DQ1Ey6aoMBwk0iAhRdu
         TnKAJo5mbXmyG6AcuSjhgar1syigDaO/NoDe3tJ7SMgsQE/MexIXv+qeWXcPgJslJWa8
         +MlSjWS4r1MzL1STJXVfAbzlymiCTC7noOCJRIfBsNRgHyMrBtTUDQ5Qf72Ty4hMszlF
         tyVS/zcUlqJf6DaKpMa79ydUxl7P854hMZqR5Rv36SSI47UE+0IJLQEu6er9EhTHEZiJ
         uYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=OQnzFpUJrVwgza/m/LVmNRA0sS1qwvCJcmV6pKyj4p4=;
        b=H1AQe+lvwPO+RFybDV8h9a15Oyq1cmWjnFP9R+uiAGiLF49mOfj2MeNfSmIaF+aT7k
         AtaN0thh6wlLglOGoeHh+TKhtkvqBGXlO6Xqfowhq5Q1AmIjpbiLAmNva7j3NIu/nwDn
         a0B2SbVOt+QLs6ynr2jeBy1kCdWvGGQ4emX74fA76UejqsipJ6w2t53Lp6QEtG7MOWLj
         Tsmd7xgVlEvb8OpguykpcrhOLz22QZ07UdlSgoTZ6Zo2hzfCT0yDvQr6ntVjZE0pBepz
         qyuiQEP3Qcoc7Cz3MkQPX30pOspGsc1s57fr7wmf5q18/B2611KUIO7v7no6KjZwLOOY
         iyVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y28si205901qky.139.2020.02.19.02.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 02:19:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4MRe-0005R0-BD
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 05:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53415)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPn-0003e4-8Q
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:17:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPl-0005IH-WE
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:17:11 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:57205)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPl-0005Cn-Hs; Wed, 19 Feb 2020 05:17:09 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N8G6I-1jZPnm3yCm-014DQd; Wed, 19 Feb 2020 11:16:27 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/17] audio/alsaaudio: Remove superfluous semicolons
Date: Wed, 19 Feb 2020 11:15:59 +0100
Message-Id: <20200219101612.1033925-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YLibFIpZuSQgUlfjKxWHzCGGzkzdZqeA+J1NPtaqKX3dof7T9YQ
 atnabY9tD6WWwlISncER7PKliwcQz8ZEfu31p7eb3muO7uiSkG/MiFtWKBwDzARgQtkyQqq
 iLNbN85O5fe4CzRYOMUiEQ/1Ka2p1ZpgOzHtCYLs/o7hW9mAajgu2vTnn+bJx0lbgt6uvVF
 C76EO0Z4ERETqoIp868nw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3I0iL+lMVTY=:VCzKQXR5Xg/eAVWb074EU1
 PyX03r8ReNRQpHWI+8HEZbOMe5aNlySG1/kHRsHSpo2T7ZAurz7dUkCs4QvtDW5pAEP+1wrxs
 2uh3+A7sl4nS483hdhPapjgHDqv091x9Y5cMufdRE9dm6KEHC6Xjt7Kk0NKylXGgRJbbj3rq1
 ouckDsNL9nHl0rL69ip+TXPSTHQeqpm0LDiS7LBQvCSgqo6Ty1lyAKAz2h33H8Cz870EC7aFw
 egISIpgTy7TMpVY6tPmNP18V9KTkqIJcP7tkh2V6fzG3zxInJiQQqrNd7BDTz+GfKk8kzgl9B
 1DUTbfuYjhZwDJ+OOJSSa1DlaCS+MW9DqTBLMSN6bN4jv6AXkFEkqMzjJiqR3DU2IpgN3X412
 lHarYtfXAi50yNZvHWiLf+Oez6Pmh0kzJaksVUPdrP5wQwrfVZUqoZaoVD31g27ZFLRkxCInQ
 Jg/6Be2vFkmCTHhY+JgmzqwkwnLqy7jTmHoNbGfN+Tn1WSSgcpd2eqiT7MchSBQyCIAKZnhAP
 3iDCMoRVpv+aXI0+0uRjQrNpDQGzNkEviSj2OyAtsAQ5rJ7okkxJYuAjGQPgsoeNRVuFoIYcx
 qIIvLzw1UR9Q1GqLSSk3ejPTt8o8y3dD9PcRYZXIMwL0KVnOgeBNgwNqIghYC2xiE0NyvXgUk
 g2kQd2+6RAthmnhSrEEl3jDecnmbndB2ygzxxbMyOyHIN9iG5XlHAMB/X3SbFugilHPMHlc91
 wo5iw9aId9jzu5ab1bVDBbhEFHtZNcLBg+db1zQXW9Rwube8n0KgvX5AzTpBwVYRwfADTncPS
 rATP9/fLxGHY2OseOtVLnnUrgwN9ROMfZx6kVDWYJ+UEwwAPPyqL2RRsElaO5JhjWk9jbvw
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LZlIF/yschRq

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: 286a5d201e4
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20200218094402.26625-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 audio/alsaaudio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index a23a5a0b60a1..a8e62542f97e 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -819,7 +819,7 @@ static size_t alsa_read(HWVoiceIn *hw, void *buf, size_t len)
             switch (nread) {
             case 0:
                 trace_alsa_read_zero(len);
-                return pos;;
+                return pos;
 
             case -EPIPE:
                 if (alsa_recover(alsa->handle)) {
@@ -835,7 +835,7 @@ static size_t alsa_read(HWVoiceIn *hw, void *buf, size_t len)
             default:
                 alsa_logerr(nread, "Failed to read %zu frames to %p\n",
                             len, dst);
-                return pos;;
+                return pos;
             }
         }
 
-- 
2.24.1

