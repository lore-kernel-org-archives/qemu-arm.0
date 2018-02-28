Received: by 10.28.91.67 with SMTP id p64csp822130wmb;
        Wed, 28 Feb 2018 08:51:23 -0800 (PST)
X-Google-Smtp-Source: AG47ELt9KmZW/Hz9VpkuN3Eowu6y/FrP8E95qBynzKMaH7RQ1SRZ27btjd/nqyfc+3rD509aN8BO
X-Received: by 2002:a25:a349:: with SMTP id d67-v6mr12552517ybi.455.1519836683637;
        Wed, 28 Feb 2018 08:51:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519836683; cv=none;
        d=google.com; s=arc-20160816;
        b=Bj0WorghAF2aiqaE8kkqXlP5/Nf8Q2hUxY8/lAJ3434Y0Xbbb05laj4JYvpA2hMo8B
         Qajwuzc/Utsntmuh9a1zatZ/Yz0T98tAVI+2+FxZR0oJNcMtTclg6EoJo6nuBs+ORj8y
         hQu+hDZB3Y3q8hePewGkvwhLCmbAdQE3q5BzVWtQ1hxXdMzHYOmk1m0XQhSm1cVvU8z6
         NpcM9/6GkUFrnQaLIYVokMVKTfV3a8APrKB0zWXrv06dKzuy1RSTVFCgMNFT5c8AdbWm
         AdbSpLEnQpGxjmZjOF7DekTHNtFKdaOrJIiKQTMXDj0h3TcT3CKAMK+6x7XzNph/DSPk
         X9uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uS6FN7df9YRJz3xW37dOumrRt/COBsILKj3U3uYlX0U=;
        b=GLXsPXdQZZ4sxJfeD9iiA9xhuGf9up4kYZn7MdYz9hswxiSvELUjajB1+ETeM5DQRj
         K7fcgFS9ZkhBqun9Biu9a+u6iLpJHeqHK5epKcKTxXO3wfxgIzV8vtEka28rtFjdTrGl
         ZgKyqqhYZ7IJyEI5LpIt3QebTAWYq0hw0SsklyvSPVR57SeeQiHEU/XjzhfNA/I6mmcL
         J4SAd8OvzsSA6Aktnvx3ZClcfbjLsBHeUOz21pE5VaCQz+9zxZKH5GM3jZFiXzWGv7EZ
         +9akKzDVHfblt1/A7PaOaxrwUyECkPXtI9rZxYqA4tyJdwDAKbClv1FBdDPCklavHzGV
         AmbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VO4WRxzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m63-v6si322746yba.711.2018.02.28.08.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 08:51:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VO4WRxzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er4wt-0002pm-2f
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 11:51:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er4u0-0000fl-AF
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 11:48:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er4tx-00071W-BW
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 11:48:24 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:39555)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er4tx-000701-5Q
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 11:48:21 -0500
Received: by mail-pf0-x241.google.com with SMTP id u5so1219209pfh.6
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 08:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uS6FN7df9YRJz3xW37dOumrRt/COBsILKj3U3uYlX0U=;
	b=VO4WRxzpw3k81wMDWSIgAMGkfrUXaM1pEZGYbeKpQdPkmFj1g1rOnwMO2CdDQpW0dp
	genr46SOc3SUYqPJQOxu2O0tw6l0MYrHzSgd7Jn7LiaklvXS/7XfDJnS5lanet9sogEQ
	ugtLKXgfV8/h+7ok1rQNzdCaw84/PjWQmW7r8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uS6FN7df9YRJz3xW37dOumrRt/COBsILKj3U3uYlX0U=;
	b=V/ocvcBwdWy4ATVtAZUH37aibro/8HEf8fIPH62hcVnGsvimGHlTIQZ69lBwJ3LKhW
	wOKDWapKQ9/GaLOF/nbStoQhUOsNkaxn4CKy7y3WGnjn9mCySwv7BMODcMcpprhoiwpX
	0xdo/pDOjk+uQ9pxnsAbZ9swlerq1gVr2NIy6o2HmnC1ysbAxYhVIUkjvFI82JH2kcpJ
	G0HiR/Q/aI4GTMhGYhtDkep/Daaza46N+4HmtY/ZgAo5aDAnclMUnHwEIhbb86byimNz
	cZnBLppBVPGjtj063vsdV7yLFjA3IiX1l+rKQYMAHFNc0bMVbBUSwarNxeSpp1tYz5lT
	hKDg==
X-Gm-Message-State: APf1xPBAiQGK1dqrNajFAu2h8DiYVpogFe4NJ46/G6kJPDRvcTtPy0Li
	8KEMSAHaCOqLOCvKmuVW98hQGQ==
X-Received: by 10.99.1.148 with SMTP id 142mr4763276pgb.24.1519836500253;
	Wed, 28 Feb 2018 08:48:20 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id p9sm4123698pgs.89.2018.02.28.08.48.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 08:48:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 08:48:13 -0800
Message-Id: <20180228164816.24110-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228164816.24110-1-richard.henderson@linaro.org>
References: <20180228164816.24110-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [RISU 1/3] Add aa64 sqrdml[as]h
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g4JzZGOcIaOG

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 aarch64.risu | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/aarch64.risu b/aarch64.risu
index 02e9183..c1a29f6 100644
--- a/aarch64.risu
+++ b/aarch64.risu
@@ -2932,6 +2932,30 @@ FCVTZUsi A64_V sf:1 0011110 type:2 1 11 001 000000 rn:5 rd:5 \
 # UnallocatedEncoding: type >= 2
 FCVTZUsi_RES A64_V sf:1 0011110 1 type:1 1 11 001 000000 rn:5 rd:5
 
+#
+# AdvSIMD v8.1 extensions
+#
+
+@v8_1_simd
+
+# SQRDMLAH (vector, scalar)
+SQRDMLAHvs  A64_V81  01111110 size:2 0 rm:5 100001 rn:5 rd:5
+# SQRDMLAH (vector, vector)
+SQRDMLAHv   A64_V81  0 q:1 101110 size:2 0 rm:5 100001 rn:5 rd:5
+# SQRDMLAH (element, scalar)
+SQRDMLAHse  A64_V81  01111111 size:2 l:1 m:1 rm:4 1101 h:1 0 rn:5 rd:5
+# SQRDMLAH (element, vector)
+SQRDMLAHve  A64_V81  0 q:1 101111 size:2 l:1 m:1 rm:4 1101 h:1 0 rn:5 rd:5
+
+# SQRDMLSH (vector, scalar)
+SQRDMLSHvs  A64_V81  01111110 size:2 0 rm:5 100011 rn:5 rd:5
+# SQRDMLSH (vector, vector)
+SQRDMLSHv   A64_V81  0 q:1 101110 size:2 0 rm:5 100011 rn:5 rd:5
+# SQRDMLSH (element, scalar)
+SQRDMLSHse  A64_V81  01111111 size:2 l:1 m:1 rm:4 1111 h:1 0 rn:5 rd:5
+# SQRDMLSH (element, vector)
+SQRDMLSHve  A64_V81  0 q:1 101111 size:2 l:1 m:1 rm:4 1111 h:1 0 rn:5 rd:5
+
 @
 # End of:
 # Data processing - SIMD and floating point
-- 
2.14.3

