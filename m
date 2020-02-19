Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp323211lfp;
        Wed, 19 Feb 2020 02:25:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqyXL2OkLsxXUwwZAw3q6M+ZmdQjNS7CjyKnPqWLFf99ni8PO2SthKSwncIkU5p0BIu7JtnA
X-Received: by 2002:ac8:4616:: with SMTP id p22mr21561222qtn.368.1582107945488;
        Wed, 19 Feb 2020 02:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582107945; cv=none;
        d=google.com; s=arc-20160816;
        b=pQL/+kxhbCa7nyzxS5r97xY5nH0kHr0kSgBvryvGiN9GE14ItNZsDFy976UT0T+Qpr
         TSB1iBO2H7xCImcKkizkUG1/Pd3JKDWxjOLfO7JfQg4jd+G77RBc5xmmynLCCKrrqqmY
         6qkPqHsNJB5tZMligrUgQ0HsMZmnNXr4S9DfjocfmkXpfVB0EHPe5/SY/QvYyi26X/Ki
         3rallN7LPtEXObRSDrROgMEp0/zlZgd6LowT4ZUzkdoRKhyu3tyhCY29WpKXo8R6CSPq
         UhXulHYG681TtnXFu0tZK9jxEFmRKlXaMOthr6ib0m53+e+J3Op2gNnrfzAsV9hO5ebF
         uUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=mPHsDzp5Z+g5XjrwrUXoaB1eBlfTo5py0XyunPr7R7w=;
        b=gg17lkRxsxU3USNJVyEbygBp2Ns9kOWebyLjqVGP0zlHbEL037zp/C4fkxGvMOi4so
         bIMAc3j+uPkcAR8M5vMHRrL5/OX6RXA3TYiuWBhxkhV5n+n7QD1s+sreKlvDD/M9GE+R
         89OV7GATG2RNbsE241wTDbZLAeQUnY5m++oYJOucrWx7Bd6pX4I1gjQG2o0+1j1Iz5d1
         PTesZfxtLkVRC5KXpkMOFNrG4hm/RCeLEf8nnKfni2972lp5PtBOxNoBs4/bO9YQeGZ/
         lTMDDGN15fTdC9y2G/Dhn2S/fn19+XoVGRbdJd1PNjIq0A7/6CksqH0fTeU24Ai5c7Yn
         DoHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18si683883qka.261.2020.02.19.02.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 02:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4MY4-0003Si-Ui
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 05:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPu-0003hz-KV
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:17:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPt-0005Uw-Aa
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:17:18 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:42177)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPl-0005E5-Hi; Wed, 19 Feb 2020 05:17:09 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mg6qO-1jfMBg2Api-00hce9; Wed, 19 Feb 2020 11:16:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/17] contrib/rdmacm-mux: Remove superfluous semicolon
Date: Wed, 19 Feb 2020 11:16:07 +0100
Message-Id: <20200219101612.1033925-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tJgVAAVMMn3+c37OfdxkHmZOyXt9X6EcTglyXr1fuQBoEdhAVfv
 sSAEFbkmOLKx1MnWQuebAB/3B/0J1g0b3XB+l8Hky2y8nK91SwawqTEPLuaCK+KSF7YPdmP
 A23tOegJ5ZIBBgxNy15tTrCt2Ajt7w3rlgj3AB6RcfFNWVsLeZFZx68tuWElhhwQH5PPgCY
 V1RLYHRHd6aCYzkxo2LTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+QcXR4QTgtk=:U6b93kl51Kv7yde5H/nmOK
 LI3W02JsmyYCzCE5C/Wv6oSfKt+ph00XatFeyBNZ9azvK1z1qgQtyMAPj6Mz8hlDB0UBLRtz2
 YpygeQWm/mvyaL5YCLSE4dQMPphlgJCTo8jQ3EXqghKbn4lX6p+HSjyMT78PxgXXTAmZmQsGE
 RZz1ai2Ge0cm+clsaC5Qk1Q3nN3r3kLHaHxhXEXDSl9IcIvJyG0m6wASsTAsAAQrFhDR50cr6
 lQ7Zmvv2KeUApCX23RoAePtD0xXZEdtrC6+VasDNKio7yWW0zMLygYhvHsA796Tncf+r9svtm
 oPBg4Z0DwJD5Rn7lhCDmByHzvjUI7JaOncoaeUMDg5Rhg7x+8w0bPV2dGXH9yf21xJVMt8tfC
 XMuZh/t+IsRrQ8B9bZzluPKGrqlVaMQtOM9vb+qm/lg+b1gPbFMlRgPdVk4W75fEAG2hiQaLj
 A2zeSAtyk1FBZ2QhAxiyC+e5h0vKJhxbAuu6XP1mU6usilBl27BdIrl9vEmg6yL0S78nzEvT/
 XMwfWNzwHpIIWTHXb+/4QJFiqW3H0gd4sY96DPslyCp+l7ehy/4q7vk1X3OgknRT0SET8zll9
 JOK/eW8knT6dmSVY2PLtXBehJGTGp5YXSXbFRuhekrXrGuOYNYzj1Cv+syUv0s0v8kKDxQufH
 2QcARE2HXtwKFn2pJBf2ekjWTdAyyP+3Ip4zH0LeoPSXxl6DudW9BAA6vxfLp1hVmNYZFpb3d
 hTmMkJC7F0Get90/vxWIa/SFpJllSfo1x0EKxtz8rMBXjG0edb/vY1bH9sAmmF4xgdMMpAVwK
 STqjqGmInJXjII8NbF31OvxjnxE+ADJxCaQKNUP3u5QFJYn3dkoXK2kxPlp6BWwWRm2ejLm
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
X-TUID: 1JYcVitPGorU

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: a5d2f6f8773
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20200218094402.26625-14-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 contrib/rdmacm-mux/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
index de53048f0619..bd82abbad35e 100644
--- a/contrib/rdmacm-mux/main.c
+++ b/contrib/rdmacm-mux/main.c
@@ -490,7 +490,7 @@ static int read_and_process(int fd)
 
 static int accept_all(void)
 {
-    int fd, rc = 0;;
+    int fd, rc = 0;
 
     pthread_rwlock_wrlock(&server.lock);
 
-- 
2.24.1

