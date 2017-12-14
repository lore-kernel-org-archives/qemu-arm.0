Received: by 10.223.159.74 with SMTP id f10csp6416353wrg;
        Thu, 14 Dec 2017 07:02:31 -0800 (PST)
X-Google-Smtp-Source: ACJfBosBAhvv/enulGjLqy4O2BqcUFSnwBsJMG4cMR0cXGQiQYXaXNShNKGl6hZHO14VQtVz3ELm
X-Received: by 10.129.229.9 with SMTP id s9mr4380126ywl.102.1513263751078;
        Thu, 14 Dec 2017 07:02:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263751; cv=none;
        d=google.com; s=arc-20160816;
        b=ytGRfwQyV9HgVWifnFQM86i8Nn7sCzH0I00YbJHQ+ftCjAmK8wQE3cj0M33b9x5Th4
         CZvb67Ze0M38v1bJrnAK/i3pdge1d3R20NixvWmoLWyGKof0dZ9Th24TnC+CBfxF2i6C
         N3vYxxOjT2nekcRAKMRftj1CPYlMlo55ZfTAeifb1LsPBxdNREEHxCeIY7kTJdhijghW
         qz9V4nL8TShfJA96n3bF0HOJ1I7nrVYKk58sMYE+EhS7IztiAtJRYAcchVDONZr3ublM
         QVcEaZTshSoE3ZOEw1hJpVMqpKuJj9MPvklmWbVFNkrxuUsRT2SrPRgsAQt6C6QiGJbG
         islQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uZAjdu/ViWnu/aZpzw5alaZY2904L6KQcjj4bJJYMJ0=;
        b=cCqZ7KagE+uFnRN8VJjyrTfPNrZOxe9jmf/8loCROGO9BYzJnQs00aqzDfwF08FI+4
         uIRoGSU8V4492NMjFtQqrioaBqgB4ONiTpDFjn96sjUNJLqp2F019TqL9U5RmWMIN+mR
         IrP25KxDhiV7sTgBKIBZWpNr5p1C+262u4VttGNMDdwFpKV84fiLMKGpegGPhordM8Wq
         C+BBIEKvZY/hgCaNOsZDiY5sTlhTVhgV2zXPwyhcH5bVfPvfiXCqAFLJeHDIFE27h4rh
         hdhQ4c8hmGdD05m78uLG4GCA9pOiceWbGb165n9w6u6Igwp6OSTGx39O/IiIiLbVPOSo
         djug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E1JGzDxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si831587ywq.8.2017.12.14.07.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 07:02:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E1JGzDxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePV1q-0000QC-Bv
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 10:02:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt7-0001PU-F2
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt6-0000RM-PI
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:29 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:34052)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUt6-0000Pz-Jr; Thu, 14 Dec 2017 09:53:28 -0500
Received: by mail-pg0-x242.google.com with SMTP id j4so3563776pgp.1;
	Thu, 14 Dec 2017 06:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uZAjdu/ViWnu/aZpzw5alaZY2904L6KQcjj4bJJYMJ0=;
	b=E1JGzDxX1bhbaP6jeO8zp455Vr4BK0VaXqqZYyoq2/45CAQWOzmdQTeVnd+3M2zif9
	LN/zAjILSiodVwZbF2q3wy9uYFap5RAXrVoFOyrppL91U+dIW+Xwfugl4OMjzNyU21ke
	wQZttBlEPRn47Pxdd3z1iRaGrRxsWDOV3e3gGhNVfP9o3NnX8B24d7uaGM2c2XTXjwIK
	4w0yuTrfBa7Db6ZzXaWqzN+kmPyYVjcZjGwHu4i+iT/ps+P+V6xc7U7uMlZykpnO15Xv
	GKG/exUOUFpoN15vc+sjjXgMaUdtdFYMK5nsJplfw228/zwoW5FFB0OEafkcMIaDMf00
	bTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uZAjdu/ViWnu/aZpzw5alaZY2904L6KQcjj4bJJYMJ0=;
	b=JdSSvC3q4TCpa1Bo4sIh9jTVhxqlGNpZbJCs0nWqQfoMMGkqyL2XHzLav7oQWNVr62
	dmWaYLJ0QL5OSRGk2gNJjPcOgli8P+ej+14odKXYS1B6aiO4Xj1eP7ev4071Ow1pU8pQ
	cw6tj103DdSIM+0p2PD3kF8mjmgOUG/MH5dvRQz6hlGY2bOVOtpA8qblHgCswaEC0HtU
	zWBn4kEVM/iQexU+IzXOgUOKjTJHztJ5NITsU/+m9WecC3oY4cTQqNzZZaTtBYN2ZGSH
	zyeQbm/o2ZQAhTVxJJejNKCnVKjyIIy0q+fe0wBRPkZkWvqNxhq6p9UX1EyfO01Z9wt1
	uTFA==
X-Gm-Message-State: AKGB3mKXQz/91n5Cfjqk5kjIP8IRq8Ada7R+ywnFqWMq2y4EIl933cmH
	nSNna/iho5LTxRD7y7vKXBcRAJ5y
X-Received: by 10.84.174.129 with SMTP id r1mr9933657plb.337.1513263207250;
	Thu, 14 Dec 2017 06:53:27 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:26 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:46 -0800
Message-Id: <20171214145255.31545-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v2 06/15] imx_fec: Use MIN instead of explicit
 ternary operator
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
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yTde+VfUSBAo

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 50da91bf9e..6feda18742 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1076,7 +1076,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
                           TYPE_IMX_FEC, __func__);
             break;
         }
-        buf_len = (size <= s->regs[ENET_MRBR]) ? size : s->regs[ENET_MRBR];
+        buf_len = MIN(size, s->regs[ENET_MRBR]);
         bd.length = buf_len;
         size -= buf_len;
 
-- 
2.14.3

