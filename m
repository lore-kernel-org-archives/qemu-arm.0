Received: by 10.28.173.206 with SMTP id w197csp3161501wme;
        Mon, 8 Jan 2018 18:05:28 -0800 (PST)
X-Google-Smtp-Source: ACJfBouXsGUIw95AxvsBPUvLPEF4SWewBzwwAe10pRzqE8OGvS7ShnvHElwBxPlGmlxV1BQHEwdY
X-Received: by 10.13.239.197 with SMTP id y188mr12300694ywe.168.1515463528695;
        Mon, 08 Jan 2018 18:05:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515463528; cv=none;
        d=google.com; s=arc-20160816;
        b=COKH1RSCL+eN5Go5qYs7PpsmoHu0QYVStwNz5rwd5i0ZkBXsKjWP19eGsvJULv/q1f
         dFif/O7K59rzE9Lp+XOpUr3W3/7MGdq8Kak1X1f68zhUs9VwXgdv1ttvhQfV46EEStyX
         PlGOXa/Gcvo+qYHWL4inxvvz9RdUdhmuRHBRdusTYvMWadG4o0MlephcTl/wppuoDE/1
         Pyx0nhi4+CDEbbS6I4CFBgJN6EBLt6WrbelOzgLwVWNyfsfj5F7Lq6n9iWlpAuly1qoY
         6ETT4p5n/PGtDh4E2XXe6C9sKyFn3H+9TM4aEbhiq4GcBwFMHbXgpKP/X3ILT7XpJSAx
         Hfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=L/WUSTJxRdu3Z4Q/TH3MYCenhoef2gx1i+Q3dl8tQg8=;
        b=FxExhAPq23kzChdXb5PBo9fRBO8RRNuB6/N+R5aiFpgSnDS7x5ufDWa7VqsPgL8kuZ
         Cwhqy6n27ONp+sb+0MXcmzaAnwuLNAXZG9ugx5Qmzvut7kcmGSwcJfncI3x6coHjQ9w+
         /sVxEngNfc/SP6IgShGV5aVxf3CO5IZ0JRUavrtq4/qoblHbVIsZrE4ZAgkfO5Q6E6+o
         tw81N8YVXFzyfTklvY8mffaYhENhrlvX23qWm2fPSOUNmX+uJ5R3ZyTPjN8REg3g+qI7
         VNj9jtPVqMrpwUqq5p4W8fDk57dI85mfqdqovnjJwsRDI4K80D4rSXKtCSAxG6+krgWU
         Eomw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JwVxd8pV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g68si593920ybf.469.2018.01.08.18.05.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 18:05:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JwVxd8pV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYjI8-00050F-4I
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 21:05:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEY-00029c-Km
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 21:01:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEX-0002VA-TV
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 21:01:46 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:44791)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEV-0002UP-UF; Mon, 08 Jan 2018 21:01:43 -0500
Received: by mail-qk0-x244.google.com with SMTP id v188so16707105qkh.11;
	Mon, 08 Jan 2018 18:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=L/WUSTJxRdu3Z4Q/TH3MYCenhoef2gx1i+Q3dl8tQg8=;
	b=JwVxd8pVk+92JpSfiWf4HGZehnvqdTZwBtZFSHXtIJnVLZASpOJrBPqrl6pbt735Sw
	IAGe5wC9fzFFLqk18iOlL32igdZvfQGfDwaEAEzxMhTgOcZYTQIy2IpHVQjxyKMNw92S
	8Mq84fd4kAtch75EjIuK7nJCtYMdHVBp3HIozTRkdnhLdHNqz5paLiHcHddi8/GW05Hg
	1t2j37LnV5UzwqoXUqAd57JZ738Pyb8AGGFLHg4uaVD5ZT54+fqwgIrQJniU3hslmv9q
	yQymq5I4lF3NZvt+tpX1WU2bDalw02U0Sg+iqZsgYlosrhSBauCyUspUgKlL0hvl2FVw
	IBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=L/WUSTJxRdu3Z4Q/TH3MYCenhoef2gx1i+Q3dl8tQg8=;
	b=fUhwOQroLV7HjVzHAZySZwgF/DqJDQvpTncy++dfS2xKOErM6SnzOH1Ad1+FkB2tju
	I4vHZfvMU1Ce/oqmEi0nnedszh0eDrkd6SH9pJKblppJQ1HrjQqX4uNEEMW7MkvA9RvR
	aYBv8DVtpjfg2CbI6+T+zRUp2nENi/EpIjdq47LgUxtDlE0vPZKvub8L1DjpPQPQ1niO
	bCaPHkR056xwd9wekZJdnb8r8qMHWWZx2/T2lBiwlD/vi1c/MbbkfrQjTuVX/WOc/uZI
	OyZqKX8Lboc6qTZs68YfIiet42nyF3HH+C5UZ7Z70XtfQvD/7JTuszgQtHaMk2Ouur06
	qlXQ==
X-Gm-Message-State: AKwxytfgk5jzP5acgxhC4GgCypQujV/x8GFVgXiX+lTo3QIadBUbLvlT
	vjG+6ZmwsKfK5lO38itBN6k=
X-Received: by 10.55.169.74 with SMTP id s71mr7004006qke.165.1515463303339;
	Mon, 08 Jan 2018 18:01:43 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	r22sm8605027qtc.71.2018.01.08.18.01.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 18:01:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Mon,  8 Jan 2018 23:00:53 -0300
Message-Id: <20180109020054.32553-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180109020054.32553-1-f4bug@amsat.org>
References: <20180109020054.32553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [RFC PATCH v2 8/9] hw/dma/xlnx_dpdma: add 'xlnx,
 axi-dpdma-1.0' FDT alias
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ELr992tRbGB

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/dma/xlnx_dpdma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index 8ceb21ddb3..d1b508cfe3 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "hw/sysbus-fdt.h"
 #include "hw/dma/xlnx_dpdma.h"
 
 #ifndef DEBUG_DPDMA
@@ -607,6 +608,7 @@ static const TypeInfo xlnx_dpdma_info = {
 
 static void xlnx_dpdma_register_types(void)
 {
+    type_register_fdt_alias(TYPE_XLNX_DPDMA, "xlnx,axi-dpdma-1.0"); /* ZynqMP */
     type_register_static(&xlnx_dpdma_info);
 }
 
-- 
2.15.1

