Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp495651njb;
        Wed, 4 Dec 2024 12:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU8PGIVCFuWtGkr8UFXvuR7dCN8iJEDpKC/K4A1PEevpzXolqi6I6se4mmvokZm8ug+raPJIU7W6Hc6DA==@linaro.org
X-Received: by 2002:a05:6a20:728c:b0:1d9:3acf:8bdd with SMTP id adf61e73a8af0-1e17d420882mr1166853637.22.1733344784129;
        Wed, 04 Dec 2024 12:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344784; cv=none;
        d=google.com; s=arc-20240605;
        b=BdM14UmSRZcwLaKSZt7iEIbdenBkW5EeTjtC5ZqA5zNi8JSAC8gWSVN8nYkW6RPLkN
         RR2Iyij6RJqz2J+ws5q1U0QtIWl2pXQYj/LmXJKw1sG9fRVHopmzZLdOoGwMOoza8tMx
         zUkG/esnrZ4NENssyNP+cEKy3aAIoA4uqEVBFH7PyCy1esDx1t4H+7pCe4SFse54iRk4
         fM4brmqc/qo/zr0WkHpJAbDVe4qJOd4c123TubbF3vLILka+ZrOGCS6G8nyXzbLPFKzS
         7c2VMPGLa1utF1TWY0TkEZbRZ/D9VdkjpBuKkUWYE6O4by8rQfjcr84xNKd45wjdJMJG
         OHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i4FdoiVujAHlSAX1GNeXZCXDPP5ciq+pm5Du23bE3KQ=;
        fh=y91UjvYpPMEuZPi9hwE3IE2xgs6jozstGYmPmkiSCt0=;
        b=J3nfQKrlwQSm5KGniQdJ6SljgTBLOgVL/ozQ+7mMWrC+Rt40GjXcwPPXvo0VVzsNyH
         vcJSCQZvvo/1BALLamveLBoDJV1NVDqabrbzAB3rVNepJE/vkTtwoSIbtEQ8pmwuWovd
         A29Nbh1ODi+TIRUUKL9E7F8AqBZlOyYwqM6kQrvmoZeylMdB6QjS+qGj7qmMe7ysT/Jw
         DsnGDLCmEMAY2N+7CYZ2cErnzqi04RMzaxaKdlLzzAltdwasJc+JfMvLgnWm1yt06HCF
         t4wKAHa9qo2BQmYxH8ol9Gy7CXAJhON0lXKzpdUPsaPIQSN+Io1h6PEHst92Ti3M6iaW
         FTAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hEw5/0xu";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7fcfe5d02aasor1347795a12.1.2024.12.04.12.39.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 12:39:44 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hEw5/0xu";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733344784; x=1733949584; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4FdoiVujAHlSAX1GNeXZCXDPP5ciq+pm5Du23bE3KQ=;
        b=hEw5/0xuRY66dFbXoTZxgdbevjeAUGwQkMCQSsqznd6S/eux1Z9Kyeax29NjX4D79c
         k45PNGnGELsJSVNcP+ZpSnceOZBU1A26GeVNzWB0hDTGB7308vUTAVZDuhtPj+PjFErB
         FkcbmbFHuxH5h76kbcq720zLBq+Uds54jotk+xLGIcHz4cYyNBoFhu/qN0pTriX/0hSA
         /hdEUWD+2BTP7xQBe4KONTWCsFsHeekO97yEnBbm9+fTCzp6m9Oz9Kts8UFawku8bnkB
         bRMzhG4b3MTwn5dKSPE31KuzdrHr0/P3/RTBooednhBgsNa/4qcRtjItXB4R98wPeC3P
         OTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344784; x=1733949584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4FdoiVujAHlSAX1GNeXZCXDPP5ciq+pm5Du23bE3KQ=;
        b=qfW1KVKwpjGDyQ5Uj7e41Ir0dHIjiq8AoUnF7WkXZJv8EvxjYBjGI5aAwNkl/cEHOS
         EGqkMPvBDibLTWB0lfk/GUdZAIcLi0nlbbnbVimiwt9uesu4tviO338+14Ib3Zzi2tD+
         nd6BADh51GiBW0kI9GhyIqSguBV6KaUbIFZFukNgDT3Hckgfd0GjYM9hnxp/p5W/xJX/
         lHISrvfgqjJpGgAlGP4WVaTIWiBAcUa4aLJYvzh3i2yRjPXyTKBNDOnQoalbiNzX0kAJ
         KTW8Y4hreYUpVm+1TLImafdGVwb4S9nQ9zpJ67rCEPuE5Shsbt3wJtyEvXIjIsMGcPfY
         hKDw==
X-Forwarded-Encrypted: i=1; AJvYcCWzI+7v9QjHq8WXGEgqgHr2jpJl6KWfNobKHOBXS+Kc8vxlarTG02e6pRGn5DS1x0sCakiOy9xUEEUyUw==@linaro.org
X-Gm-Message-State: AOJu0Yzzq1tLiGZwh0eVKmcdJsh35CJxTmZd2gRo0TDO1okipWoD3cAh
	CUuxR5a80MQNEXedvWw1OOYmWi/fmPZ0SrPPqYcyzWy8cQCwcWKYD8YNMiMoldEI0A==
X-Gm-Gg: ASbGnctfO7UsMmYMQ7xSmlAc7jeyrqncUvLFKdBGZMzXLEAqmD5EMefykoWf7csw8G6
	8HM9DlxvUTD6P6qpk4+zMIiiiTbrrz4U8BuzUgevV41lUCVuh0yVc/NMuY7AK+rDA9QsUMtW9Gs
	lQZDxe8fu575mowJttx0yxK7YTxJp8n0ar4UyMYsQg4cCQmVMC5gng8muVF4x2UjTc6cJ/Q/77D
	PbT6Dwi+imoJxogFklWDJcyRbidxWKJdSv6mdRMsVG/LPuaYE42CpV8UzA/B/r5it2qo2gGawhK
	9WTnQ7Ry
X-Google-Smtp-Source: AGHT+IH9pCxj4AEDU0wMLJPPfq4gzzkJtOOHYXI5zOsWZVxemOMxcTG5LuoGT96IjzpM+DPZ4Fwy8A==
X-Received: by 2002:a17:90b:180b:b0:2ea:5fed:4a32 with SMTP id 98e67ed59e1d1-2ef41c1892amr1126286a91.11.1733344783717;
        Wed, 04 Dec 2024 12:39:43 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2700cc6esm1873117a91.21.2024.12.04.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:39:43 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	qemu-arm@nongnu.org,
	Troy Lee <leetroy@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	alex.bennee@linaro.org,
	Alistair Francis <alistair@alistair23.me>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 3/4] docs/system/arm/xlnx-versal-virt: document ospi-flash property
Date: Wed,  4 Dec 2024 12:39:11 -0800
Message-Id: <20241204203912.3037515-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
References: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WFd960tKqZlI

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/xlnx-versal-virt.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
index 0bafc76469d..c5f35f28e4f 100644
--- a/docs/system/arm/xlnx-versal-virt.rst
+++ b/docs/system/arm/xlnx-versal-virt.rst
@@ -178,6 +178,9 @@ Run the following at the U-Boot prompt:
   fdt set /chosen/dom0 reg <0x00000000 0x40000000 0x0 0x03100000>
   booti 30000000 - 20000000
 
+It's possible to change the OSPI flash model emulated by using the machine model
+option ``ospi-flash``.
+
 BBRAM File Backend
 """"""""""""""""""
 BBRAM can have an optional file backend, which must be a seekable
-- 
2.39.5
