Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp989331wrt;
        Mon, 11 Mar 2019 12:14:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUdBV5ZDARuJu+p+oaGIxMPLYKinFsldQvea0ik+IUxUtWH4lbAniQ++JqreefRn/brX2V
X-Received: by 2002:a81:1d10:: with SMTP id d16mr25960833ywd.449.1552331641216;
        Mon, 11 Mar 2019 12:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552331641; cv=none;
        d=google.com; s=arc-20160816;
        b=Vl9133aZ5//rck2shelKaJxm10hA15BBH2zJvV0YKILffQUktXXcBP+r+fsNwmi1Yg
         k9OZhJESq3DKdNHUyYjh2x7f94ZAx+/dKI3YqhTlky9qWFFmsQcDHVpKaS7P3TfxdndM
         8gRS5a1TbeUfaeiM8deeydk1eK9B0bRtVWkxmZoJXf0KGR1xTNha2g1OikIjrlZaoFOL
         PEinGaHgk7+eCyzTimOuU3DcYru7y8UZt6NQ/0dmoy/WRdoZUEhxK36UgBPtDjAiScUx
         ttpc1YL7x5AniW8rYMmeQs3Tq/3Hj5yhQnpab4dyWS0dRx6y4+KvMAXFwPVmT7i2D84+
         +EUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=VL6Tl0/bCa/1k/4EFLaMeZPASJx4+fQpIpNxJo6e6W4=;
        b=zrRF1Ons+oyCWzzro3s+yQfyGbaHc2LxkPU3sETuBVlHJMKmJfVmFgQHAf0aLafGY8
         rjsuzbLOw3RLOjLvpOhkXs0dg3r73+1CFQm9ODhE1edw/7A5GsCQwv+X+fPQU5/DB//m
         z0vAT7vaMSjPGWOVxl/GXmnlu0ho0d3zIcz8UND+0DX+Oe8yemDEaKnbfd78nsc5ZdaC
         /tZnkhTYQk3Ve/HagIRLeFiKffGmWDCLIZZb1C6RUcKAkivmhxCtl/LsRK3K2cD9kPVy
         uZ1efUxkgug+AfG7BImcNJZHsDRN4xcGkSGxoJOAd3NkyV2NQeiSECUs9UGdkqN+SmlY
         2bZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si3486118ybp.100.2019.03.11.12.14.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 12:14:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3QN6-0006X4-JR
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 15:14:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL0-0005Ht-HB
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 15:11:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QKz-0003R3-Pj
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 15:11:50 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:35901)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h3QKz-0003PA-Eh; Mon, 11 Mar 2019 15:11:49 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MV6G0-1hSCyc0iqU-00S5WQ; Mon, 11 Mar 2019 20:11:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Mon, 11 Mar 2019 20:11:24 +0100
Message-Id: <20190311191128.30562-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311191128.30562-1-laurent@vivier.eu>
References: <20190311191128.30562-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V3rV00znpLrw2EPDqF8QZ1krrSFLot7j6A2eDzXgF0rILoCbU+U
	XZ7i9XUUoLPB8A64OD4YwS2bllQxHDP/gom8khwhau+FDP+eXbbnIgFD2OJdn9k7Qm/WoI+
	+v/LK0pmToMzEbs74NYHQmRV48DN9GN9ftu5m5Xz5omHtthS1U+8k0zZe7QmqUu3kTDgxr0
	OlF2lK5fsyS1nn+Zv5hIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:keO88pR/iVE=:HKErR4ObzhAp0fky+vXTD/
	e+Ob1NGKRRpEYDweZvzmr4341GRfTXb9KWeK8j259ae92cVrvPW9tGSbHjcrvqfK+FhQB5sND
	QN7pEvZDXTj3mDvvYiL+7Xn6fnBrimwBJMQFPGZpAfV7gzpUWvYAjI2qIyUJyZR99+PFk02G4
	B99K/bK34XH0qnoL7G3Ubo+xy45CSR+lmurO5Sz+wGqE6mMYDK11iTrTUCGfQJCMsh7vunUjD
	3D2JEKJZGAnbnvkDsqtyrbkQfGkTcTdFXXJYVDXWtiiAguKMNLwu9z677+lPithZKsN786VNG
	ZuE6ZcH/7IL6f6N05zpCz2xr/jsJQUzTtv8QsRz4bSKl3mC0//TIFAAsBNeSdA4Bd4PFhXatE
	3vxT+Up5mT/eheFc53Qm+x9R+dMsCRlsThP0kLcH46CWVbrdldgb5r6BrXpVM7GGqk4lzMd7T
	iWg7iKoj9wn3V67UGrmvAVYZr/wllU3kJz2sYm2mrlSzeynIH9K0sP2xYlUg/oG1iO8n/Cz+M
	ZligjUQ/UusyoLHOpWAFicyEwEhlg/8n3sOouerifnqknV6cL9/VVoFPO4th1fukCspFhs/Ow
	H6HC+FQMVeTwCM+QNLzlIdgmh6A+wns4pw/epyUOVZXrdCwyUNx2UsA+S3y3ReLx+HOEhYO0i
	e+t3TAghcLfvCKoQ3HClg+GI51hLxIMcU7lE1OwVrstEJIWHCkPe2m2VZToeXMV4kqOj41D16
	Na+VyLWth8eAGiE2GSyCC7PUuQe60/1mmnykHQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-devel] [PULL 1/5] thunk: improve readability of allocation
 loop
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZyRYGffnY686

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <a09acf9e093c09a70896bb9886370cf7f049f941.camel@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 thunk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/thunk.c b/thunk.c
index 17f3d320bb8e..7f31cffe0968 100644
--- a/thunk.c
+++ b/thunk.c
@@ -86,7 +86,7 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
 #endif
     /* now we can alloc the data */
 
-    for(i = 0;i < 2; i++) {
+    for (i = 0; i < ARRAY_SIZE(se->field_offsets); i++) {
         offset = 0;
         max_align = 1;
         se->field_offsets[i] = g_new(int, nb_fields);
-- 
2.20.1

