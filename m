Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6069559wrt;
        Wed, 6 Feb 2019 07:28:23 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibl1ITO+wB86r4sQ/vsNqX8A2cIp1UsreVsYQNFi8eBoIn8Giz70pz1RSusfJX6YdQfg2GS
X-Received: by 2002:a05:6000:104b:: with SMTP id c11mr8504552wrx.303.1549466903067;
        Wed, 06 Feb 2019 07:28:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549466903; cv=none;
        d=google.com; s=arc-20160816;
        b=SLMAsaRqFOT8pmCFQAq1U/h4Xdt5m09TtJBbodxu4GkWSk8I2OAXZLdGelNU6R0rg1
         4RyY45HEHShWbh24jhVXHqUlfreQSWDWJ0D9ENKdL7UDdv3i0vRJELecUEfn+6fqkG3W
         dOiue2tL2Uk+A/CFRp2odjbmcgCD31UaxtedGMuMPFV5MaUuTZGgcKvL0doL/6PXVJpR
         e/AZaGCFQO5/9K2XhCOD5Eb1Hcp5oYaEw6zezyqfBw+z/vhD2Cl+nhIZY5z39B44niZS
         +yqowLxWXRVSqKeSem1uoZ6DkrjjD7DbpHh9xrWP4Ox1KbedNm04yPR1EzPHs3kgEcLh
         OF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=dc6ELhCeVUThgGLdHk4jYTOuPhcXJ4nM9dtjJ7OUTRU=;
        b=QW5QmzC/rWctGNjs+dEdO/1C1OYE1BJszcM4eBjV8hdZ6YFx0J2KKwxj0W8a2mnWum
         nEqh9hKctwSQdUbAe7XKtMvzZYVDN9IPv0a5DqRgLyTTdht2mxBGEMNvY4mLLqpM4M8L
         wgidQpO1omLIrpiiocmaMUAheSUfSEHVKu1/UBzmLlP8qlnz/jVxZlnpptZUoGkKLtWL
         w4d3IYOm62w8FbMesYNCJRotVnB8p8q/qL0AIH5lZ62aQcF4+SYFMhQOMtEQRWggMiFR
         IFXDG9PLyAt0Io2eRGH3ArIFlocMClaXRmbSimdoN5Ad8RYZwJwbqNQS50xjodEGIQY7
         4Mqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.133])
        by mx.google.com with ESMTPS id y68si12005357wmc.147.2019.02.06.07.28.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Feb 2019 07:28:23 -0800 (PST)
Received-SPF: neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.133;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MKsaz-1gYtjh21YT-00LDQP; Wed, 06 Feb 2019 16:28:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-trivial@nongnu.org,
	Anthony Green <green@moxielogic.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Maydell <peter.maydell@linaro.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eric Blake <eblake@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 1/7] qemu-common.h: Update copyright string for 2019
Date: Wed,  6 Feb 2019 16:28:01 +0100
Message-Id: <20190206152807.31896-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FxcW8Sbtvzn7pG9lhKTO7bT45vhL3DRvt26w18Fw9BB+hhujV4d
 4YEout9mI8xg6+/zoKBmhkvhD/XPdNDcO2B7djPEe7YM3acTIaHwF53qdSiCYwymEMfI3tC
 +W2MwbJLhQ012RfqK9TbXQM20XRWqIXbmY28xe9XkKczdgzn6jijXRqiWzMSx83lu9euZmc
 UMCSTvVY6cloBBDgDYbzw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gXltWkK9geg=:Ro4Ih6JrW9jLPYEFHmFtWJ
 BX0Z6E8mpQs2NwRda3C3eEDnYu1zH2MJZ1rbhuSm6jQbA9Tufd18zDwMiHD6jUorQob2wjG65
 CQq/MRTHTTpeot/lqVZguhhhD/Sbr6TCwz88LGx7eCRfpYsLWsaAJ3hTnfFP2YKeqqWveg63k
 kCy/I0Rs6dgV6hQpnfGC5gEiyx5854/DZwigh+Af8NkbTUlt4TwPKpddle2L30g8xjTsGhBf7
 srTx244hD5GC9tF0ho3KkBQKyGaUArM37PgyjYjUTyYQ7X+9PFEM7TAaGh1PVc9M1vpJm3vZY
 fWLm198BKAHgd6dBNkz/Hy9AscAT6z4RS+MM5jysETWcEl3r9geg6GfT8X+ElKBcBsEufrM1c
 PrECp28Cdz6nSwi0f6Yv8Uzi89mq9UkmKqieLG/PmV8ISNTMiFDkCCcyoTNwEW2AkrXYny0fo
 oggDhPHjX9G+0so03lE48A8wrbAvjK2ApBKb+b7KxWQNyVvCRVwXW+uci6Ec9Uk49PDiMgg7u
 9oCjoAH57424PfdbtwQF96rBh5ecdP1cc5GiiVvWbUVvHL4kGVwdnf9Jl3uGcoCPJAH3US5c+
 tA2W/QUo9iA03L8NUlOspbX8f/lt/FJ4JyyI2Kvxik3uwMF3PlLrU29wYppgazUZfWLslmq3O
 JFStrbLAR8htN0NFjGTFxisOcDIH/RdalPGwrQ+M8/PLn7G1YiuraYbefAEYOTsKUCdOHCobY
 vHPKaUZUN72V4wRg4GDl0f7OACiEFh7HLdPCXC4002up/0Ew2K3FN9EedN4=
X-TUID: HY2/tHICkQnO

From: Peter Maydell <peter.maydell@linaro.org>

Update the copyright string we use in version/help output,
since we're well into the new year now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20190201173655.4567-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qemu-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index ed60ba251d..a102245519 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -17,7 +17,7 @@
 #define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
 
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2018 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2019 " \
     "Fabrice Bellard and the QEMU Project developers"
 
 /* Bug reporting information for --help arguments, About dialogs, etc */
-- 
2.20.1
