Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp322570lfp;
        Wed, 19 Feb 2020 02:24:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqwcrrOHkcLauFlUSXqaKn2JeJ5Xqlyfbey6tU4a2btZM1LhJa9C+u25DMWDWb9Ui/a6KAi8
X-Received: by 2002:a37:a7d0:: with SMTP id q199mr7115344qke.488.1582107892064;
        Wed, 19 Feb 2020 02:24:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582107892; cv=none;
        d=google.com; s=arc-20160816;
        b=RTIwEPQ5ZY1riZRmI/AmpBccPobBoPKlUfoUKODhMubsLZEePRmYFgwSxIwNt7oo5d
         DRvizFPNjf26G4dWXEK+Ggw8/dvx1GC1IdTIw6JDqhc3yodrezrZCADh+GugH2Lpo69B
         fm6rrgLd0H0G0OHrR1eNiLW15FCKsnXaRH8VsC/mNnsfFPoMtQwcpOei0DNBgJoXQej+
         X/HlqtoVy9P7By5jcXqIFn1dvHpcf2HVDYxSbrXvnIEjcOyBZxwHc3dqy8TipJUC9OhY
         K5oAsMxYkqRqjCKDo44WYdSkxOWK4j5JXKBSpep7j1xCPbU6psnPuA1VJ3YnHkzgCmW6
         CyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=5O3pdI15pdliI3bU8k/pQFrLFPKmkKmddq0BxslTfFA=;
        b=CsXBOiMltOz613x177ouBHBjBuUZNoDH+40s7l3rdX4/XRhac8kQ32lD8/Ef4q9fFp
         MiaUgqQFk4K19wseE/xEWwBuYq5TW67DvRm1ti88Aw9iXO0CAULfCG1OUKw2w3yAdcYk
         67BnOAFQuk9pW7FHFq2CHz1L+RZnc+cLvfuGGp9JAID7nOU2Z08QzXMgXv2r03RzgSLu
         18sthSUP7cwcGeHBk+2Rc+qV7+06F0LIqqQpYef52SERq4yxNuHkoN05HkK3uj6hTZRH
         5AjovHykWFa3uTht1edYnxi+J8iswjH1kL92Vw02CePEQJvomncCYTcEXxWnIJ8nQCcc
         Px3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l79si633361qke.282.2020.02.19.02.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 02:24:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4MXD-0001Ub-H6
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 05:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPn-0003e2-8P
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:17:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPl-0005I5-Vj
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:17:10 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:51497)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPl-0005Db-HH; Wed, 19 Feb 2020 05:17:09 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N9d91-1jY2sr2w4b-015aL4; Wed, 19 Feb 2020 11:16:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/17] ui/input-barrier: Remove superfluous semicolon
Date: Wed, 19 Feb 2020 11:16:04 +0100
Message-Id: <20200219101612.1033925-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dCKqb1vUoCcOnVsEoFGgPBNlgZjVP79jxRfrS4mjxXL8SqMpwsI
 xWH2CzHFJQI6TATjV2J9uuYb9DdLUKoroR/PRigg65uVjxB0cJSaGRbypHneZZA/TJ2pYAf
 vZShdwYCffI27wnIZlrCx4u2+YDWgbBzfDLZMxhScfvb//RMH2Wv8HMumhCEsoEMqcn8yko
 wg5P2CAofkgcrmsCVc3Xw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KmzcAQTGE2k=:DKepF76/00oaWArlojOmNU
 2mIgrgJrQZSaCDaFoNR8PDhyXXHgDahlgFrx34k5tt//WHFQYkHbbqiU2j+MQpPWMD4QSNwDx
 LPXFm3f2h4FTzIX2O8bKNyhQG1y+2eIleY/qocx7SYN4uctXAQXPRXLBBjJHQzLadpK5z5imd
 REarmrPP3SFwbCrwL0YNO/MloEY7K7fuvEBispu4Nm+CuieGu/p4Y/gVnjWnjP+zA4PxD23ba
 M2T0dJMOutyfunu7ZqCyPfTUHhdhgZSh6ZuXO5gE73xyyRCPLoy9duyv0L17m2IUL+Z65uLo6
 kEgeuwiyfSu3tJGx3HGrQ49pofLhK7ktgDQPBYpLowY9v3LPpq345dB8pz3twxTF8/iFr3Bfg
 XVC2LDRnsx2Sa3B+MBIyxJXmZHEJFPf4llGBB4xoP88N0pG8Zt4F/1RqnBO81YABFxXdtXfTt
 0nJlzgrxKaMAzQZQbHvcsziPfZHyNVnamkKgzXvrEFUzfuuDcz2PobfY1owaatVwmTjWj7kKP
 V/pm+Qmoc5K3OZiYdrqZPS2TSItfCemdgA8L9i/5czkUQxA78aneLTZr5QsrihVYYQ55IfyVH
 fX35Sb831XqPYgRZA6z/10q627ILrs4Aikai2IDnj4395v8r2lwMY/Op+bWKHNBYQ5qdNZ7it
 Wb19erUBBquQNHfphDU9Zbz5AQUM6zaQTARtMpfO78gd4D2/HHTxV1xnn/+grn0GIfPxxl7mr
 +kLUvGMfYayQYmNS0Ku2c++5T7XhnbEZ75WlqvB+7nR41szzCE3uG2H2fArDxJow+8PY2yqdz
 afDc+1mp3BNAQ4h9RfjFF6H9YqMT30PTZ+LdoKgjWQ7daMTmBIjnsZZAOwbBVskDY2IvWTm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
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
X-TUID: JO+H6a3dtRwn

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: 6105683da35
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20200218094402.26625-11-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 ui/input-barrier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/input-barrier.c b/ui/input-barrier.c
index fe35049b83a2..527c75e130ee 100644
--- a/ui/input-barrier.c
+++ b/ui/input-barrier.c
@@ -455,7 +455,7 @@ static gboolean writecmd(InputBarrier *ib, struct barrierMsg *msg)
         break;
     default:
         write_cmd(p, barrierCmdEUnknown, avail);
-        break;;
+        break;
     }
 
     len = MAX_HELLO_LENGTH - avail - sizeof(int);
-- 
2.24.1

