Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp991132wrt;
        Mon, 11 Mar 2019 12:16:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwo6krzZsr7qbLnw7ZemBNx8AsEXnK7vida7FjORtT0uxpPIhCMgXSudrhMQPOreEgmSMr/
X-Received: by 2002:a25:710a:: with SMTP id m10mr29077784ybc.126.1552331763192;
        Mon, 11 Mar 2019 12:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552331763; cv=none;
        d=google.com; s=arc-20160816;
        b=TGcOOHk5cBDkP2ZFbrrR8B+EhlS77KnNCzutU3SIVLV+nuVZEnp03k74OOF2js/gFn
         CnaNiM85rfCRBML8q8ROkzsuI+lPX+kGvYcbPyQ7Tzfu6SzEt8QJTGZn1gwZQ300SELM
         qWgmwSNACxH0rcR0e2J+xwb7feIjrfCfHsuJmN1z3UbM84wPZmRzZAYw6GtiVSJL1bDR
         pqFV8r5Wbe+lh5oX7ohg4hbmO+ipCHcbSm9mFLnTitPa+wMvdfMsMUCDBwH0tn9QAqkO
         28mq8QXaO3OiwqPCIQQFlj9T3LOAEZvdwd3uWMyNZYsj7x0faX7rCEKvI3A05c9EM9mz
         THCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zZ3GIBYO9RJjt+1WuzO6lKmCxxTcy2VSyZUym+bo3qQ=;
        b=FX2x2LieZ2HxnteDPzpjImZq0o3kXMSIxnyKZnz6HvUJD+DZTgnuqp9FTJkc2dbfrT
         xnOzOp2e3LKcYRuyj2c/R69R+3St2YpvarQR50/TkCL/cKa6UBiue884AtmQFYGVfMI5
         86JJvy48IMb97BXixiIAFL+I6GRZVHannXP85TmE6EG4uAOcuSEzTHGOtgROz3W77HVk
         nCAsKGd6K/mFc0TrMqjFm6dT6Vda25kdVRSosv1U580fnjBgZ05e0ljKqnfChbUKVPrW
         wAtzf7dYv3aogqT5yvp5HIFbENqfBMaOZ/JE0I4LyLEKs8n2NH8nFLsYLMe1YwIq7/rH
         WCsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si2833353ybk.376.2019.03.11.12.16.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 12:16:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3QP4-0000Jj-Iy
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 15:16:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL5-0005Nw-RX
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 15:11:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL5-0003We-3l
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 15:11:55 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:35411)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h3QL4-0003VY-PP; Mon, 11 Mar 2019 15:11:55 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1Mk0FS-1gf3rg2hGi-00kRiS; Mon, 11 Mar 2019 20:11:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Mon, 11 Mar 2019 20:11:28 +0100
Message-Id: <20190311191128.30562-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311191128.30562-1-laurent@vivier.eu>
References: <20190311191128.30562-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:O3d1O9PL+YJpFY83VOHpBzFgNXCjBqdqt5u3eRlfFznZeVE4Mlj
	oDJK6z3/pDMNuDsD+XYt2iCmUtD74mO5x3QW1vnY2aE8QZgDVPMcbHIqpUYYXWnjz7Sro3j
	6ZVm7Jq75cNNMdVY4dQwmSRUolGai6eeMg44TUhUDyvgOZVDxkysynOH9iXWtyA2Tf9pYjU
	dz4Re0AjxR7R4lR3m0XFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5O++kXf8Qqo=:y2vymZd5uMYCXpFpD4lpnS
	DVp24k4XUpqgwNrfiUl8aX72EIKjvsVTDe84jVPp1Ks2V7ffOXwDi7S/6Zs5ooNseQ54pqwfQ
	eyKV/yyHnVsahhdo6FWvpqw1bMNq4BWha/5wEnC8bfOG0ZHu5jn+91vMOJTKtOMaXemY21AxH
	CtnOiuz+H8amg2BgN18BpdpANFzmu39Q+l5XVSP7WYjPcq/1rWGa0LdJGEDQ+HMoI+lomxfzV
	673qH4C5ANUzx/b64hNtXJsewOxPJ1V7ELUKrWTP/niCnNKjl/9/yy61zd/u9FbRgm4qqtw7o
	vwFALaxaYtiPXsyGK5VbM338xRnZ97rtKhapRDCGiirYQrbM+MBCAduQB8BDkIB2TMiVo8GHb
	PCSEcydy9NBSiGqP+Bkf698d6ZRHQwy7ZJpl7JVU3d4HE0rMAMjHThsFECkM4N/9xifbdYhmx
	gAp6itDjtdsHodXiF9MMK91+Xmjorx3GXFBzSF/k8ZLEpcUZKepbz0Q8Oaqk+2LuLQdEV5XZ2
	Hs+rzMJD+4QhwiCeKd+uQNJSmE364CRITKATAC066+B7opTHtINr3ZSztCxwz8fcB4yjPirL5
	9fI8afEJXrHYYLZIFu75IbWVpMr5HRC7ep9KyDJgtlBck+MoM/G2ysnQKrrIX83xl+tDn6yBK
	F1sQDUC47hloQRcnOJZhQQeQpkq9qkIxHYDNMGHz1+O9qTiimaTr0eGek70V2+GPGXAWT5z0y
	V6/bxdwQPRaXJB00Vsw0ZxAwu4Fc9BzHeOxS/zgNvasbx2Lka1xGTLeuDvY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-arm] [PULL 5/5] hw/nvram/fw_cfg: Use the ldst API
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dq8wk2fhcfvT

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The load/store API eases code review.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190309181920.30553-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nvram/fw_cfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 13aab122889d..5c3a46ce6f2a 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -85,7 +85,7 @@ static char *read_splashfile(char *filename, gsize *file_sizep,
     }
 
     /* check magic ID */
-    filehead = ((content[0] & 0xff) + (content[1] << 8)) & 0xffff;
+    filehead = lduw_le_p(content);
     if (filehead == 0xd8ff) {
         file_type = JPG_FILE;
     } else if (filehead == 0x4d42) {
@@ -96,7 +96,7 @@ static char *read_splashfile(char *filename, gsize *file_sizep,
 
     /* check BMP bpp */
     if (file_type == BMP_FILE) {
-        bmp_bpp = (content[28] + (content[29] << 8)) & 0xffff;
+        bmp_bpp = lduw_le_p(&content[28]);
         if (bmp_bpp != 24) {
             goto error;
         }
-- 
2.20.1

