Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3484071wrq;
        Fri, 25 Oct 2019 01:43:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmf48dS7dPUI/wvutPeSNbHmnHKLyTomiQ0wK+fRwAN8Arf4ssWXxojItmIMyVYNp5C/yu
X-Received: by 2002:ac8:2a38:: with SMTP id k53mr1908551qtk.387.1571993035877;
        Fri, 25 Oct 2019 01:43:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571993035; cv=none;
        d=google.com; s=arc-20160816;
        b=Woq9LN6DTra1vJoyxan2KvORl7dhhMRoPbb9uKdGLgK16IYbwX2QqLfT4zsNUyvNAV
         mSjh6MhND34gQT6p6OCmx9Q5ZdumgNanYemytUm5TolXVVxOIcnNe1Jgbg/VtqD+8rpT
         s2x5czYQvv0OjbwLKeSn9kIVhQEL2ERqH7B80/A6Vjp6BIVYmWfhH0hmZfzsq2gxIuIM
         vOFoQgpLOKj4kIN0FuoRH4y93fPk1fdBvBPf87V1mKuhFYAjbw/WLMPr3hT83+r/B++c
         kGXP98kUxsHJWKsKLouDjdtXOFD4d+Kr6+YIWKY1TDTQxx5FZt0O8Nn9LMFLnTk3ThLj
         OFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=GKkw8gAKYPi6qQW88eyXvcur0eULwFDKSZik3xKAtBc=;
        b=yxLgsvRdMzhDpCd7oVbDZZqkaS2lclkxNGeWluXiUrbAe839s5pwqDZ2VCnKSBsdeD
         ydycWXM0b+NtyGf62WccZ0X5nS/BQ62WCQvqmkFXBzexvflXcRQsGmWqJccISyhpFw+Q
         FkdLk/ABS7FdQZ+nyn65ar7y+gRhBadQkwtvPhiGlkGh/UDilQiKQXfniXVhHSNh6inM
         BrzeQSqg6asE/Hj5Z7pGUr0J3TSp9O5C49vZyuNvzWjEtWaMSFVuc6wX6GQkWfMyMGDh
         XADRd1rn5Z5qmfpjMpEw1YmCYtjgESRGdHJIBtWVsRYYO0ZnTkoOd2usttXmw/NmCqyB
         u8VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si982328qkh.73.2019.10.25.01.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 01:43:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNvCM-0003pv-RW
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 04:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49732)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv4u-0000bP-M6
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv4p-0007ij-L5
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:12 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:58789)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv4h-0007bq-Rl; Fri, 25 Oct 2019 04:36:01 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M42zo-1iNv450zGi-00072i; Fri, 25 Oct 2019 10:35:21 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/19] qemu-options.hx: Update for reboot-timeout parameter
Date: Fri, 25 Oct 2019 10:34:53 +0200
Message-Id: <20191025083511.11463-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:c/zMktz+3JjDH+N71EHAEvM5mmPJFDBf9jhIDyxk7TxzV9fd6VF
 REjLhdpVtuT+qJJnkSVRY8ew+4aN3YxXoxXTeY8UycOnzgJS8DHvTvEseeCpOQFDy6OSCR8
 aOiLgpYlSLipBEF0WEqUxXkw8hfoJSbOxR8uKNmO7BMxTAyJ+SDfj7eiV7ERp40lT+h2UbQ
 nf6VK2l31V84+k9iosYqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9u9gYdmRFEM=:IHDA2tZj9/PN/GSiW8JqI9
 3ui4rUZFYZTm+TAtJxWQ+8XTasyD/3lGBWFFqzkVoBXKAJhk93dh8FpDaTE2GGLK5PbbRSEBm
 /xLbvcGjUBldmt5vtvZhNZNTqat711fn/8QhfwHpYdCsYK8nuxmuDNirNRaMTSCRX0ixofiip
 /OpNz7oVvqcWcnj1J0PlRWspCPoupOznVS6bFaZtyp+6u+mtxmB7Np15ecx2nHe1ia3O0ohX+
 2xALIeofdbNe6dv5/z8gPEjul/cv5/6Mq4D4eg0WUz4Sf1C0X8+Br9NZpQFjGwfXjDd5AD084
 eoMF1uG8aNL6ptNoHXPb6zHf6KKK7JLgv4nUzCiDLO/ULYHdNU+mYykxch67BabWWv9fjBMlg
 hCZAnZCwFm3qgsvstOlr1QZp+278O0WkiNwXvbgO3I9VnFOTFh6kY1HKbh4dcHBinQT8w/A4I
 573cTrMiUc2vfSvTH+W0M1GhqnRnEBb2azODXUZtFtu+K/PuHWReTa6EC9bS0ey5pk8aIf7gV
 u5wHEUBSCpPtCOYfM1PwXYc5XeFW+flTHHRQYsejTit+9YhWK7F0d530FrzXIOv5O70hvCB2J
 ZqUUP2PWnlVlwf6uwRq3bq8Pvk98sQ1FvxQlV4QAXurdqUFuPZecAZ0MMJ/BUpW/K3QAa5LUj
 iEkqZiwPLexcdpfEg+M2sjkEuLxQiyTOPrFvlIib/59myXyPHE8d0236VrNgGmM1qrTROuy2U
 klz1OyeMnz8wlbjPibWqWQOX3q4FnldOZF5xboT09ly4anmWhKSbp5Yim4cuWCxzyQ02jK4vd
 ta8ms9UC4T4SwDq8fcr0aF6+dQQJsEqR8nuY4sGbWXMzZIZmB2AlVaIVOClG0nsE5aFx9pU3M
 NIzwbvNDxl9ZWFn0OcbjfHgalfCFN2rBmrbw4Q55s=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Han Han <hhan@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hbPDWMlImdqJ

From: Han Han <hhan@redhat.com>

Since ee5d0f89d, -1 is not valid for the value of reboot-timeout. Update
that in qemu-options doc.

Signed-off-by: Han Han <hhan@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191015151451.727323-1-hhan@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 996b6fba7461..88b05599b1cd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -327,8 +327,8 @@ format(true color). The resolution should be supported by the SVGA mode, so
 the recommended is 320x240, 640x480, 800x640.
 
 A timeout could be passed to bios, guest will pause for @var{rb_timeout} ms
-when boot failed, then reboot. If @var{rb_timeout} is '-1', guest will not
-reboot, qemu passes '-1' to bios by default. Currently Seabios for X86
+when boot failed, then reboot. If @option{reboot-timeout} is not set,
+guest will not reboot by default. Currently Seabios for X86
 system support it.
 
 Do strict boot via @option{strict=on} as far as firmware/BIOS
-- 
2.21.0

