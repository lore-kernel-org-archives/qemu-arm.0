Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748634njc;
        Fri, 22 Nov 2024 14:52:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAFMo1pUShsiNEINOrMdVfHqMCkFf2vp3ea/3EyogeC0/350mUmpHShP96RT0LwDvNAfeNpc4lP7Z7Ag==@linaro.org
X-Received: by 2002:a17:902:d48a:b0:20c:79bf:6793 with SMTP id d9443c01a7336-2129f66ee66mr59303695ad.3.1732315932243;
        Fri, 22 Nov 2024 14:52:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315932; cv=none;
        d=google.com; s=arc-20240605;
        b=fBwptqZ7X19KZUjHuBj4/xGrjhnpjnAoKnbBBKIEJbgOzMkb4uHlWYna8lvn6bhxQH
         NYxFdaMCx5dCF1MgSxH+8DbSHsznSf0XDi+xgQlRmUrOTBzRPju9vfmmNSZbOE2i4+UF
         NxHeY7Trew6aZtaF6mvFJkAB6hW+PkkDu8NgkWO6D/NJbPNe2l47B81DPHzT5nzW61Y5
         xDchgbhtlWR62QbnEvDRAPlEXGDBqEkG1Lw3ANrMLFRZbbiKC4bvSJL51KUT3kOcUMyw
         HSnDE98z1HEIPHh942UEc8QwiZTkKiAjpMW2WvEc2Bs5+i6yandZ8M2fBv6hXnFuuWNU
         sdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MnekImMLpmnqj2ki5QRB6e1OkoxsbRA1JDfNzoJ9KgA=;
        fh=70NueBtJF3omSdd8xEH3OFVSU8vbIMPYtSzJKN11XM8=;
        b=I9CT8djXmFZDkKjbIf44th7d1qdlGKQ90cM+sUGXZgkle2ZgIG437+vH1KJb6JEmLo
         W0x8wM5H6VgJdRIMnjn+SiBCFF9pRnbhjUPLko9cbowCyDlf37OQFf+DH8ty38sYAFEC
         n0vE0qe2jD3iKTOSvA+w5q7iIIHoy6pRcE8gixiFmWDmjNsZktu4Ls0ZOMwiSO9VspXu
         FPXnb1BSZkqZVylFuCYerhb3mQ2b0uTGxxiallIOcpRcNBIMDvVzpp57csx74RaPVAJf
         4wGW9hg/09jme5XCwbxsP3TLN0u2q1Dtc7JkwAvvyKrzGRoTAnxSeKfp1jDqvOZaC+dU
         +QTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fWBq/iDj";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129dba5b90sor20793655ad.6.2024.11.22.14.52.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:12 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fWBq/iDj";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315932; x=1732920732; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnekImMLpmnqj2ki5QRB6e1OkoxsbRA1JDfNzoJ9KgA=;
        b=fWBq/iDjGZXElMe9XW+rkZD1qe+uhbwdH8DL5n4rwFaeopmUMej6naY1L4z33UOdmE
         rb7+wtcnO/YKnOHvIX0BTkd9/XKLBjXBZWKNw83rDe0vieekNC9t9XWZUE/AMVjE7jU9
         pFJtxKLmSPW4+ozv74Q5e84L8UfXPGpqrubs3DLbW120TpvhYtdiw99r5EUrvx6DvEwN
         z5KRNQ0CuzPYlqBJUz5OKWbDiwbwi1suLaAHs66EuKXN2gO/ZuO1XQ+2CWtGflcGk0Kf
         OXePDRCh1b2f6/qsIgOrUtGQ/xcGyw8h586oVa1I/eGtjDH0i5PeNCenf5d3KjZAKOJ/
         6K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315932; x=1732920732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnekImMLpmnqj2ki5QRB6e1OkoxsbRA1JDfNzoJ9KgA=;
        b=T3DAnTqoZkDEPM2TzB+nMLbLP7sthtvnq6t39it/qmAGVCKvxQWHfbzKYo1tfGDqic
         N4+Bm6xLFMrtLXhCLcCxiytWRtdKAxlLZfURfQZhmZAczT+xg72DtFMRrm9uLhJR/HBk
         8X0n7fUGVqocepfEH8D5qNsVwbLlP+GSt9vbS7fMHJj0TkIX83W2Ep20dca7KCvwaPKh
         Hb4vjTmlxLSD1EC51AbGU+x44Q506jNCuq1502ADXFG3wpgMvprbnq0Bgd/z1VHK9t/T
         UpedgP5q8kktbKsjnCo3zGOKDSEJErfp2fmatfmQuZiE/XA9Tgr0z0SPeravitPS9pmy
         KjVA==
X-Forwarded-Encrypted: i=1; AJvYcCXUrAJc5OEDsyUxZsuL47SL6tsMO9jg7SjmL3DcfJh0IuAwCokgDI2E6OUJuff49SK9il+ZM1xlQFRmWg==@linaro.org
X-Gm-Message-State: AOJu0YwpDWCGrNtPrGZqMnKaGKPrav8ZknCiQxaFE8w22RU3IDp+TbqN
	ItppBQQqzN7U9+IO+bRU9sX4uVuvtRUsNI4axd9yYkD6sUSO0J0kJv8b15ihzPrCDg==
X-Gm-Gg: ASbGncvmes/VnXgFeVwx+A2OzruPPQg6Bun8Q5OVpTZD4qjVDvpAqz6QykdcbbnEyJJ
	jiv3wS+4/rod6UPoUyj+LtNSDvPdo8wOfAX2p8/Q2gKnoscIdlcYnTAfRR4kk9DAwyVuY7mQp3f
	ETFBB6LvFdj7oAWko6w6pAhMSlqxpwzfzpqZDCoYbbT0K6UNPS5WuECw2AUBPs5ZIbjZToTEGX0
	RtwNnWsaZP5PsDFINzEUWEsDjbdoPwGnO7cSm1bO2tFOVkDowLTso+d5LoPieJgE+MVGCni8QFE
	oA+KwiiC+fg1Vg==
X-Google-Smtp-Source: AGHT+IE3corzaIp2Z8UzNSQyE2uX12n/ene/FKjh2tER+aNBiHAxc0gWDTTlK1TJ9t/l7sI+I1MsRg==
X-Received: by 2002:a17:902:d4cb:b0:20c:8331:cb6e with SMTP id d9443c01a7336-2129f53714cmr60798735ad.19.1732315931867;
        Fri, 22 Nov 2024 14:52:11 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:11 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	alex.bennee@linaro.org,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 08/12] docs/system/arm/orangepi: update links
Date: Fri, 22 Nov 2024 14:50:45 -0800
Message-Id: <20241122225049.1617774-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +iX8VsMq1P2P

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/orangepi.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
index 9afa54213b0..db87e81fec4 100644
--- a/docs/system/arm/orangepi.rst
+++ b/docs/system/arm/orangepi.rst
@@ -119,7 +119,7 @@ Orange Pi PC images
 Note that the mainline kernel does not have a root filesystem. You may provide it
 with an official Orange Pi PC image from the official website:
 
-  http://www.orangepi.org/downloadresources/
+  http://www.orangepi.org/html/serviceAndSupport/index.html
 
 Another possibility is to run an Armbian image for Orange Pi PC which
 can be downloaded from:
@@ -213,7 +213,7 @@ including the Orange Pi PC. NetBSD 9.0 is known to work best for the Orange Pi P
 board and provides a fully working system with serial console, networking and storage.
 For the Orange Pi PC machine, get the 'evbarm-earmv7hf' based image from:
 
-  https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/evbarm-earmv7hf/binary/gzimg/armv7.img.gz
+  https://archive.netbsd.org/pub/NetBSD-archive/NetBSD-9.0/evbarm-earmv7hf/binary/gzimg/armv7.img.gz
 
 The image requires manually installing U-Boot in the image. Build U-Boot with
 the orangepi_pc_defconfig configuration as described in the previous section.
-- 
2.39.5
