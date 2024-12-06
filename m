Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1088828njb;
        Fri, 6 Dec 2024 11:23:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVE6REddetl1WOMHP4GhjdbE3faaiDu0aq27EBCX0W/f0j+J/tm3yQWOXh8OgApliLd97wTFFUhtcAD7w==@linaro.org
X-Received: by 2002:a17:902:e5c3:b0:215:b01a:6288 with SMTP id d9443c01a7336-21611afcaa8mr78428915ad.21.1733512985649;
        Fri, 06 Dec 2024 11:23:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733512985; cv=none;
        d=google.com; s=arc-20240605;
        b=iBFgghDcwpBVhKM3+XFmg3GgruRlBnOWOuI8tbVQmBa84xvs+4JI/bVqVz/PxIcu7K
         655XrCpRtGIwL8Xj8WfrIawurrNG8/mvZeb+S7ndW36e3O3W3Q6GXLimyq7JQpFIouCL
         W/TRE0q0xsTcICmQjgJ7TmYHaEbaK6v351UHa7eNafSGDzbl680b+ycHdtWtogvha5C0
         Ci1Nb+x2qFfhlVKSqoS2tEF4Vqp/K8HGqHNIIW7Bye/OqkvFui6HqZeBIWiRdHqm2Kq3
         xQxYpUKpS/BzRAx3H7atq/6VJk6AFQgzFkxGJQ37C3P3LNrK0TLdQt8RkznKxf7jt+iI
         TyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i4FdoiVujAHlSAX1GNeXZCXDPP5ciq+pm5Du23bE3KQ=;
        fh=Govs43h2tS042M+GaFSJfKdaTcvrnWk1ckjxvSgsxeA=;
        b=g5GEMusxZKLwOzWntIAOXcH8Uo7pKc+arhWX6rwHA9c2lysfdO6KA8z2Of8Wj8/OUo
         ljCjfibhkQc0t4YwlnNS3uJ9Z7Qj4jKxnYvn+XoY3IhbnPP5UtUEY+u4zGAw60jPcQFP
         /9IfpGDUkIvDpCWnvVbJKhSS9epL2MH8+Q+RExJK80jRTgp6hhsaoCKcARbda02emFeB
         ZfZJmLx05O09G3AdSITPQC/C50m2bUgxbYp4nF2tl0v/11rkZZWDKP8RmQjfV7AsxAGl
         Lzc7LJNF405SQTiwI+BYat+Tk81zqwlvjKggglOHDxx6msjxm68u4zqZzL65kWJah4lE
         6kLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QMTrkmww;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f8ce7094sor26746435ad.0.2024.12.06.11.23.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2024 11:23:05 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QMTrkmww;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733512985; x=1734117785; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4FdoiVujAHlSAX1GNeXZCXDPP5ciq+pm5Du23bE3KQ=;
        b=QMTrkmwwJndf66Jkv53aGBPTuiWG4nEgzir2qVk/LsBtQcHgPN6MgLPAA2oCA6Yda7
         9CtlI3jbChvN2E1hTQ/6HC2/RRf2jRbByyyAGYLl3T/lXcpYDps9iDEYC5Nli9TZ6hE8
         DeOOJV5Mjaq8B4GHwyBxCz32zGhLpSJLpLueb5RlSBa2BCvdiwMNibX0Y+mzNDFjTrfG
         MlNia703ebq2uqUfjOgRfSYJhfQQMYITvEIF8+cqgb1l1bWLj/xcoozJpQGz4xhwDvCm
         ZrOgX/yv4rkUlInK3JYRJMt5SxPDUs3lRVsfyZXHN/4cK0YgvpVDE+DlDrK47MtzCniB
         kM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733512985; x=1734117785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4FdoiVujAHlSAX1GNeXZCXDPP5ciq+pm5Du23bE3KQ=;
        b=UeIg+su2elbPNvC6OFUOv+2eo8E8AEdH0tpl61JFZCFzzIfXH/+c2PKz1v0Co+nqZr
         a3GEP29nEJpIybJPYDvHgtjYt+Y+emEdfGtInwG/mCto3OxjZkHeK+OxxSES5koYNZ0P
         C14NP04GXGMRplHTCKQaNmuOsP651cr5P1oAXWB0Z+zGBcVKFqwigyp7GSXsqRUZhJPn
         3k1ciLR5wcg5MABeFquOSqMh/svYGQYgESkAvUAJocoEYwMs8rGfTS2JgGqdaYDHaSD3
         pOvLAu2VfXnxqOSUBJ7dO+ThRmtxLfUSdCVChzG4lvh0dZuQ8nsohL/JmVDmwtSqBUr0
         uHWg==
X-Forwarded-Encrypted: i=1; AJvYcCUskuYNcQTfFQDvuSXTtYdZPBXWF6io9fktM59no41yuBsniMA6mboHuov4I9LOySqwvtZUBUcHAiL4FQ==@linaro.org
X-Gm-Message-State: AOJu0Yw99qQpn0B7rWHrsK5W6P8PAqxDs+YD5V47dwAlb25usBJgdpAJ
	wIKve3IEGwmX/QpV2BfbxGTp0EtldlucRF4TjIIqYmaS7B0Bm+z8vxIi9okMq70eT8TvmlpSy6F
	U3PmO5g==
X-Gm-Gg: ASbGncvsdsXvgmY2eC1HhFLbbdX1kJegLvV4b+yHqmvazzqcZJfsNAvGUccB9I0CjN1
	8MSxgn3oiFdNb9Ml3PrAelIr1/j+MSJ2+P0fAJwhd1a4GHZFbKZvDZhkNC7Sjp2wZP5GEA24frB
	KPlffgoC/XpaF4vTZUE04VWiOg9xpO4bYnE17izi3QS4q5yV0t2NQfu1Jig4+RENMhBjaGzvd9W
	qVzMQ6hQ7CW+PTl2BBUQOdLp4wAoQbqzRRP1UWb1viH5AEkub0r6ASu7kdkcQMqSQRhhvWP2fsx
	ARSb+DLE
X-Google-Smtp-Source: AGHT+IHWE/vj2WKDN2oXtn8sN4DKGt1jbQAa13dfknqCIdh/j9CJYJvwWqdbDroU1+spTCkjYk/EBg==
X-Received: by 2002:a17:902:dace:b0:215:65c2:f3f2 with SMTP id d9443c01a7336-215f3c56e3emr130015765ad.6.1733512985235;
        Fri, 06 Dec 2024 11:23:05 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2161e5a6f23sm11720395ad.266.2024.12.06.11.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:23:04 -0800 (PST)
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
Subject: [PATCH v3 3/4] docs/system/arm/xlnx-versal-virt: document ospi-flash property
Date: Fri,  6 Dec 2024 11:22:53 -0800
Message-Id: <20241206192254.3889131-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241206192254.3889131-1-pierrick.bouvier@linaro.org>
References: <20241206192254.3889131-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: k2Qhb3VA5Ejc

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
