Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1088804njb;
        Fri, 6 Dec 2024 11:23:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYLCCd5OV+j/SSbrKoaPptOONEQe4QWEiHdyR63dyCSjGTaMHKvd3Iotl/pjF+n6KfM8XNcpXlKieq9A==@linaro.org
X-Received: by 2002:a17:902:d508:b0:215:681d:7a52 with SMTP id d9443c01a7336-21614dc76efmr43831695ad.55.1733512983644;
        Fri, 06 Dec 2024 11:23:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733512983; cv=none;
        d=google.com; s=arc-20240605;
        b=QVQtMEufHHdrcTS2dekHrBQLuUHVOX53cIpTIU0xrWCNp1ppydpq3NcVlPQk7bC9ZO
         Y564UIf0JOC4wI4Jv67JRH5aE45D0TjrS3Bz+ndXefAt1MTElQzhlUPN9Qy7KwYvWxtf
         8+K6vY4u/agONlJTexHq8AmoGsFizq7YXP6o7k/0tvlxUKzzAVf44OUUINzBIG+C60m6
         C67EorJwtExm6z7DRGyVqCUkQ+dD7Z0Cr+gUBLbbe43XP5/ALclmDtJ+UM5dx0gF/N9l
         PMrtkiFegst8wby7Wr97qAbdf4PrrgcspKOzy/QGFrrrz9GpKiWOxbLmY0RzYZP7+Plr
         I0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UqKHYpUulGdIWayEODwJfBo1zUyakQeh+AqqbYk0b0Y=;
        fh=DxUO3RLHPncqa9UV8cNvcf+oGNivuLVprHDmNZjDaoM=;
        b=BqmoKi1fvuFAPQEqZhMc1jM3IEsSepz5UVX62JnhuzcLgL/pzccyOlor/rAEkDfG7q
         bjFy+zvrpcXtNzpZQdTU6tNieFBluZx5zXNsPAFKmkOJcKyf56ZfJWcHw3+DWJkbWkYh
         kvJpJJ8vaq0gT+h7e631T6xH0i6BWYLTMSCjANTzMbFTpmGgnDRbmQHNnMIRPXlzZTgE
         qqLGur8QjaOFzXnDb5PbtvRKypFyzEevn/+ZpAkn2eqjGAT1p8nIF4f32YhVew8HFpwj
         cr+cczNhzUpOca5vksVUgPh6WcGZ3EVk4C1QIJzdoP/0MgGrlyXFsk6gmqTQYgdeAPU2
         ubBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SxrRN5bm;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f90859d0sor28701845ad.12.2024.12.06.11.23.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2024 11:23:03 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SxrRN5bm;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733512983; x=1734117783; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqKHYpUulGdIWayEODwJfBo1zUyakQeh+AqqbYk0b0Y=;
        b=SxrRN5bmijkQMBwo51nxQY8c9IpVZWJKVoA2Zit9cAAZcThjb6kn3vqthcalK7ljX8
         VKAJBd0HS3GYAb0P2asRClfgG/v/BMA+ulOE6AEnQj8jeTKx9+8kmRoWvxnfKLx+vpiu
         KD6/uPe9oBLQhWa0WZMIEnWuVs22JrMSQClBU3EYGS3QyJ11WiHAt5vn/p7OpDE6GJYJ
         oLn5WfqvVMv0SMpBqziYIKZM6w3PVii5xc2ARSgTb0EFPA4btsRqmwmY3R5aI+JMQzI1
         EahG/fVLlCfx5rxBLK+Cp86I4INN+g9gLPTm2fcdl1NyJY2Vs6U/5C8WHGvX8ZDU6CyK
         LnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733512983; x=1734117783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqKHYpUulGdIWayEODwJfBo1zUyakQeh+AqqbYk0b0Y=;
        b=qfz0d9BMznfrdovrp8U7fYm7WhL7ogmRxy4qw55wmCVskmWGycXhMwCOto2vPdvo/I
         Aw31VDo2gBAymteJGxFYgxIWMW0zhUU0PWL3SFh6Y2Tt6W0F2BNH+GXSucZctB+rC587
         Q53CSZ0gvowjpovR4PU6GbkfvP90yhZy7z4bh9xd3JMZ5UjimgaDZP6/19dq++MuQXpg
         +QwQgwo2DgyDXNoUurPKPIB0UjNU+yTsDXReMn6eTjsGrs494Q33YqJLeknnZ2ibAVA4
         lT9LzYTl/I6+ad/h4hUhqxwpOw5vKs+WpKxDtRvzE3MOr7yH523LaYQEHiC8FORS+zpE
         Z4/A==
X-Forwarded-Encrypted: i=1; AJvYcCUdHZf3jtCix0eBGVYrx/eCp+c9ft6HvO8X/zzWGD7bsM/WB0uABOO+r662HuNpkBnHFGDcmOtaN+rL3w==@linaro.org
X-Gm-Message-State: AOJu0Yynr9p40Xjg8SxPC03BlP1deAAfa2LgQ37/kBLoSgmN8m5v03xw
	ZFI8tq/hbhEGo1RdVpaan3FPAaaX62iuxzcPU+YSabDH8KwIslQGj9vD4I0uWaTyQg==
X-Gm-Gg: ASbGncvlj99zg2C8dnKCZfI2xTQ1OtrSWsrN6BdQUGQDSU0iNxj04wEPx8DYbW505Y9
	JsJduWr+fINPXKJJIms97AqSG/85Yhxo5tZD9Jfe8PTSqMRzXSJBbxFFrSF8dOI4NX5xzVQC7Ss
	kZF/tgNXpa9PFWi86xe5ZJMISDUA4TwNuht35Q2yOu3U6e6Lg+mZecugDli6iE8kONyTtO5jXQr
	TuOWY0buX6NOfHKN5Ul/RTv5atmgKiNmL/VeD0y/0NRud7mFf8DYfn3fyF/AGfHdGTDxiszJv0j
	fjwjTD/z
X-Google-Smtp-Source: AGHT+IE3hWhbmAqmAFRiFIlqMJOhPZ5Gd5Wz3hnKcz1qwEXSS3c1bzMvZHawdGbUvNW1T3ct+LNiiQ==
X-Received: by 2002:a17:902:f644:b0:215:75ad:63c5 with SMTP id d9443c01a7336-21614d497aamr73931625ad.22.1733512983238;
        Fri, 06 Dec 2024 11:23:03 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2161e5a6f23sm11720395ad.266.2024.12.06.11.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:23:02 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Troy Lee <leetroy@gmail.com>,
	qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 1/4] docs/system/arm/orangepi: update links
Date: Fri,  6 Dec 2024 11:22:51 -0800
Message-Id: <20241206192254.3889131-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241206192254.3889131-1-pierrick.bouvier@linaro.org>
References: <20241206192254.3889131-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: K4SMuC7TTObT

www.orangepi.org does not support https, it's expected to stick to http.

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
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
