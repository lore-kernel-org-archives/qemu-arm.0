Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp674145wrq;
        Wed, 4 Jul 2018 08:46:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdw7cdYvP9xCmUNwypnqNQ9vBry0dFX3CvCghZz00Jcw0/0zpXH+JkVC84LKJXL3jXSN1Wf
X-Received: by 2002:a0c:c38e:: with SMTP id o14-v6mr2081111qvi.49.1530719179964;
        Wed, 04 Jul 2018 08:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530719179; cv=none;
        d=google.com; s=arc-20160816;
        b=vBRMlZhu76J8hE5FzVoDpOQ4JnRug5EcOo8S7TRP8YMQsxWn4DX4WQITL+7bQHEB1K
         0gUpK590eSJmIC6wVi6RDg4OGmIz7cgd80qL39Pc2OU+t9VrnU+x4q/cevI9sc/cbVEf
         j9BfLKSrpiimurjiWWLi1gaLdjrquw18lrklRUROQXaqY6sWyNLtDRkFdht4Ca5QCVTl
         NbfkXbIGurQxDSvNx+N704aB8y1OyfovQQGqZxtugznj/wwXYsQ3gbU+cEkjHet7EWnj
         sRwRiSnKCeAYNfsYNQy4egrq0vPy2buaOgm0JeaK6Vs1kWMWnAznpYSE5EJ1KGLg2i3p
         8qxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=26JSOpBoM0W6GPdaJSowFjdVszTVrLCwHgqPj0tQn+s=;
        b=FgeUFTlXrv5ZA9p+cM/sy9LbxhtbTfPjSTii/ptLnqzdQaqVaG0/kOU3luFHLKjCXp
         BaWnez4x20eamKpuRTzgiXehW+pkVVzHnQxX2mjlQ2OslTzo+efVnb6hJksffRvlDgv1
         FU1vv3TyqZRU6WtKDVSfXMnhAIvZFipzUSk/DP2hZULBbbfTRGmFC4lv2HpB5bQ5r73+
         LMQQrlZ9YRkeDJfq2t2LGGAxX+rhBGaTZzr/KQ9HxjOW2HCj8APt8sOLPw6vtcSJIMWP
         mZs7a8X7Dx601b40iar8I6WGZCh8KFIW0syJcH4SJKlzbIcNwBXDA2eSN4euaNolkzC2
         kAqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l56KhyzB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33-v6si1467064qvs.163.2018.07.04.08.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jul 2018 08:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l56KhyzB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fajz1-0003bn-FJ
	for alex.bennee@linaro.org; Wed, 04 Jul 2018 11:46:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fajtA-0007E8-SG
	for qemu-devel@nongnu.org; Wed, 04 Jul 2018 11:40:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fajt9-0003hN-GN
	for qemu-devel@nongnu.org; Wed, 04 Jul 2018 11:40:16 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:44064)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fajt9-0003hB-BB; Wed, 04 Jul 2018 11:40:15 -0400
Received: by mail-qt0-x242.google.com with SMTP id b15-v6so4823272qtp.11;
	Wed, 04 Jul 2018 08:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=26JSOpBoM0W6GPdaJSowFjdVszTVrLCwHgqPj0tQn+s=;
	b=l56KhyzByu5Hg1bC1ToMuUgOQrS5O7AjNNvWsOXTCNzkKZ7eRyLt25Q49neLgahNVu
	9iMDDFgldAA6WMC8onUWdhNGtGtl6Smvw13H4TLAkQA+TX8svx0Mvb60FUafHVBGFpxU
	0Z+X+2BLdfgl2eBSHHI7WwOpasD/ZpeXh1x44h6HmVRnGdyYp8APR1YmK9VbwpO1m/kt
	95J2iTPEjlkfU7HqXckX8+KmWX4RB8EiqJ2nBrSrOPx0Nmc/7F/hUI3MaAd/94Hha2RN
	eZOj5QIfRmc9Ify5nKcllZiaLnMc/CocXZ/LX1uHqJ467D3/b+L0opRWTz2eZTKrS41o
	zkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=26JSOpBoM0W6GPdaJSowFjdVszTVrLCwHgqPj0tQn+s=;
	b=rX5fFxB3NFiQD1FqI1DfJlRGjd3jKIjsnE1pJuWntK/5SKTtX6AUqyoJiTZRHAjlr/
	3xPMJlLWDnQ2Z7TlJhkRLQcBgu5GrodsYusqnfkcTNLwt5cNxX6iHVS8cuzd/FcDM3r3
	5EjKYE8PppaL3xK+x/HOqbcIv4v/8rJ30hlRC1/v0kzOtnqyo1448lru0Qos3xfHTnHh
	Oa7r9TB1t/VaQNdrX007GVuZIgX9aYxSEpvHkXAapzbQZUHq35oZLfNnj5lLMuNZcDVo
	CrI78+BFKv/YJkLP7HzY4zEOCx9H+yL6AUBG/1cPnvpjEFSZyxjrylG5+jqk2NTlUSDl
	amoQ==
X-Gm-Message-State: APt69E2WUMKJ7rhTaBIEfsKZq6CJnkh+jTGaMCvw9N9AYxAvjeCTFL/t
	CDOgcZB9eN0+wv5LgXPkg64=
X-Received: by 2002:aed:3573:: with SMTP id
	b48-v6mr2130290qte.370.1530718814810; 
	Wed, 04 Jul 2018 08:40:14 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	a127-v6sm2383795qkd.9.2018.07.04.08.40.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jul 2018 08:40:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Wed,  4 Jul 2018 12:39:19 -0300
Message-Id: <20180704153919.12432-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180704153919.12432-1-f4bug@amsat.org>
References: <20180704153919.12432-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH 8/8] hw/intc/gicv3: Remove useless parenthesis
 around DIV_ROUND_UP macro
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
	"open list:ARM cores" <qemu-arm@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RZbD7JCbRkTS

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/intc/arm_gicv3_common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index b798486ecf..31ec9a1ae4 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -62,7 +62,7 @@
  * avoids bugs where we forget to subtract GIC_INTERNAL from an
  * interrupt number.
  */
-#define GICV3_BMP_SIZE (DIV_ROUND_UP(GICV3_MAXIRQ, 32))
+#define GICV3_BMP_SIZE DIV_ROUND_UP(GICV3_MAXIRQ, 32)
 
 #define GIC_DECLARE_BITMAP(name) \
     uint32_t name[GICV3_BMP_SIZE]
-- 
2.18.0

