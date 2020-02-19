Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp319544lfp;
        Wed, 19 Feb 2020 02:20:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqxLtqsAyLJ0zVZgwYWFj/nknG7Y5lBrNFAZDlvDSXBc7nmzKbP8TMupb4fIxKsW28ezs5Gw
X-Received: by 2002:ac8:7644:: with SMTP id i4mr21390546qtr.150.1582107650530;
        Wed, 19 Feb 2020 02:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582107650; cv=none;
        d=google.com; s=arc-20160816;
        b=q3KJCDtCsu6ZadFkznAUhVRlcijA01fFaVlb5/XoaDwdi9fX4FcsXINzmWScr529tb
         fI9G3XTSAaLMfAsNqxlwRNsMSIMVyzPEpklFNvdIUXvokqAPaj5gp3nFkxEc/wAhi4if
         6dBbumcViJq9cqM6We9JvGDoMl/g6vWrkj/2zIg/LsqEs08+9aVKBFyDpkB7T7xZQBha
         kqXB+VrL94xVsnm5sIKqvXmhHlpouLvmFKqLC84/IIb+ebrprJEosQQNSMgkW6k+hQWD
         1ZccQsQJGQIK1l6QzlAIymTfnSpQf622yAH9YjC1G4dle2AtYabnAwa8/KF3RQ/0kdC+
         Uk/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=w2bO66IiqzBuT2V1Pew7OdwVdfoDy519IuOcYl7Hwks=;
        b=H5DYcNkLqn09bxu6PO1JSFM91PIARtgD171JmI+RLhiiJcHBLiZDJCXjYtLWD+Lxa+
         HK8GHpjlKpIVKu5M4HYepbCGKZPao/8nytLiz+Uqh0QnHkEEhMAEJJSJxyqBIYa3QGBK
         E2vZoxRJUnSHb4W2Br3O/2w2HVBlLKXpChulx7EIIwy0LqiVmNnwWoP1QVijxB7ps8WY
         ryX1DG1NL1AvrV9GEYqhZq3Rj3m1l/HoCcdTpdEXxnAcqTg5GsYmNkEl5fH+nZsxKI0U
         9AIoHRmPS7m1ULMwLE1qsq3qod1T9k7qO86971TQAo2277G1Qbzh6SXBXkBUaSK06TDd
         wwAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si750801qtb.204.2020.02.19.02.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 02:20:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4MTJ-0000Xh-TJ
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 05:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPn-0003dw-7E
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:17:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPk-0005Fg-EO
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:17:09 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:40357)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPX-0004s3-Lj; Wed, 19 Feb 2020 05:16:55 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mjjzx-1jkar72j4F-00lBPA; Wed, 19 Feb 2020 11:16:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/17] target/i386/whpx: Remove superfluous semicolon
Date: Wed, 19 Feb 2020 11:16:05 +0100
Message-Id: <20200219101612.1033925-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fkHa02snvuJQT1kC46g80W+yqWWgilAKPwOIMaZZ0rfIXJl3zFW
 BRJvL0sHaJrlWTI636tFdxcZk5MTKE89WpJPgkNQxOo6QmkNuaepT2apNVG15I+aeSNIcKf
 LjjKWDkYdoau+4cpLTeelCwYHvIb9K5rYa34X9tBOxd2+bn556wXIajXdo+idIXme71V8lU
 ZUjWu+EP17IbBWUUsyovw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6lzzjanm2QQ=:GUiRVkqhwiQKhZZmYv4lUz
 U3WJdTbu7Sm1xzFslXtWrl2dGKXZjuJI/gfSKA3lWa4Djwbn6c1gLkvn4NjLry0/TgoZE5uus
 T+Dkq+9LdXJrZKXyDQ89NSe9e6B1IAK/XfYlZZa4svjg8tlOoU94rJXRO+2IuvDs+c0c8M7yU
 DMGiMjdsvuOknedGzkdVUh3ZkK6l8z+7ESIfizC4efHlnAAT6q8ICGEXbdlFK/j7fUyUp3Z1j
 UKYK2lzZCwtFZVRG6YTIzGq2V/wnOlexUhaoMYAcs9Az/GcC9p8LwdXLjsUPJDfDSZ9JF8Kou
 O2VOGDydoEKmrv9NbqkbxgElieYDApDsS0VnR5GlpR5OgPu0mWg7w/nO4mI/mOTZ9lSYPnGxX
 zV5rREj1/OBGQi6gzN2kUtk1dkWjrOZGrCTbtTgCIoWktELxRRx/f7qCi/bWwYA59e9sPGrbl
 r56Sgj2gxf512cWEXP59/lywJpIyO5IV/ksWtjYIejW9+qtPZtnuldnrAu0LbFVcy1W/FQfrz
 e9NjEj++O60GnQhzzSIYo6111ZYgUwXJtFj7M7ODXM+2h+qYa8kx0ywWJ9NhLpnIr1yWI2HFe
 JBRUjFcqazlogaHqUo5sOTreud4/PxK/2lP44riO3hnsf2HUyGkpel1rfFydlvVb14hnciFeC
 qQ6jBqPgBhpeyVuXNOMNXIqv5GHF1kxguLX4kUy+VP8wTrKHTgoidL1kX/mMBkpVQ6TFioj5k
 BjcdOi7RBDOTJkfh42BuYyUmHz2LCaz/jnptSMV4H3ebAvcW6qEvJcGfO5xJU+F08ocpnECy6
 +Oo47RPX0K+S00CYoNmcaw3I3rVYgdDFvCOlBdCV13c2PqYLFxEy5uXrQNvs5+LA63MBAoK
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
X-TUID: sLwpEZjLLr4/

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: 812d49f2a3e
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20200218094402.26625-12-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/i386/whpx-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/whpx-all.c b/target/i386/whpx-all.c
index 3ed2aa1892a1..35601b81766f 100644
--- a/target/i386/whpx-all.c
+++ b/target/i386/whpx-all.c
@@ -511,7 +511,7 @@ static void whpx_get_registers(CPUState *cpu)
     /* WHvX64RegisterPat - Skipped */
 
     assert(whpx_register_names[idx] == WHvX64RegisterSysenterCs);
-    env->sysenter_cs = vcxt.values[idx++].Reg64;;
+    env->sysenter_cs = vcxt.values[idx++].Reg64;
     assert(whpx_register_names[idx] == WHvX64RegisterSysenterEip);
     env->sysenter_eip = vcxt.values[idx++].Reg64;
     assert(whpx_register_names[idx] == WHvX64RegisterSysenterEsp);
-- 
2.24.1

