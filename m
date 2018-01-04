Received: by 10.223.134.117 with SMTP id 50csp12820507wrw;
        Thu, 4 Jan 2018 06:44:05 -0800 (PST)
X-Google-Smtp-Source: ACJfBotRHXICM1Q1Fz6I+geHEBfnpoUHsdqaBKm2Scj8RzpzyfSPbSUPdXtLTO5azMtT1fUmaCIf
X-Received: by 10.13.216.80 with SMTP id a77mr4277103ywe.196.1515077045636;
        Thu, 04 Jan 2018 06:44:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515077045; cv=none;
        d=google.com; s=arc-20160816;
        b=J1ZLPBRp2p9PW9+CHF+Wd0xJ9nkfnXsA8Zssuwlv5NHD/VU9bx+pgaHEGLTkVuWy3r
         9fZsbrvl0NLmOdnCdTV3WDI2fdxiLLYq6rar/tz4O4MwKIgBxxXwb1wK+/007BEXMv0q
         NrX8C77PDa+riimRDjbVZQ8u2E9M6OZwu4AwrYEIsXd7yaacpvBPHCvWETAuAdEZMYfk
         3ssCVTglJtCfSf9sV1zWFPvn67smqDeI+2d4OinTa4W7Bec9O4livZnxT1VmWv2p3R+3
         82VRk5lZIaFNiAXec5fncLIm1zgRgtDdH6C5CVI7GmYQraiUmG7PePzxZCF5rj2E+doJ
         8nOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=GO/cA/dWsZ+eWRJei/R5K07vX1gp6KKxn66RqRucfl0=;
        b=SQlrKxp762XuDC3+xNUQnm7eds6BtrekRTAEIU3i7bM370go6OS69lgPs2OjA6gJOE
         xsZ1/81uWMOUt2loEtFPf6DQDdpH+mLhie9uhydyr+d8fL07xet5Vju82nheXw4H5qZ3
         U7w1LuPCkKoWl78T4hJn2927twKalw55qHenjQl0M78ey7BE73O9KBptiNeEl+kaT9r+
         +FB3z/+sGxrW/hMmY7cEH+LMDLU/eeaovNemnjso75k0DxNZwCOT+ljXpitzJ1b7Hm3L
         b2FvPXNDcWupR2s/qNfJpkKECmTlRe8eGx6P7F1DIit4KfMr7/+V+FE9vfEomeNAH7DP
         AezQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fWIQNtQN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o67si725195ywf.453.2018.01.04.06.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Jan 2018 06:44:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fWIQNtQN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eX6kW-0002eV-L4
	for alex.bennee@linaro.org; Thu, 04 Jan 2018 09:44:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6ht-0000oc-5X
	for qemu-devel@nongnu.org; Thu, 04 Jan 2018 09:41:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hq-0003Hy-SR
	for qemu-devel@nongnu.org; Thu, 04 Jan 2018 09:41:21 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:44283)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hq-0003HF-Lp; Thu, 04 Jan 2018 09:41:18 -0500
Received: by mail-qt0-x242.google.com with SMTP id m59so2074963qte.11;
	Thu, 04 Jan 2018 06:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GO/cA/dWsZ+eWRJei/R5K07vX1gp6KKxn66RqRucfl0=;
	b=fWIQNtQN3PeSeHR/sx7SJIjwSzS1JiXBsmUsgtC97AhBRhzvcOW8iFbytZlCEkY+a1
	mt2ow/p+sTt8hMjK22c/EKUrt0gvRupH2aDkoPMefYtYf0ZtRYC50fQ8qE0E1aaRjliz
	60je2Vul5gpzRVu2BN88afLg6EWmkOLfkLcZ+eIUug2xnFQelGWZFja1y4MN0W7ApzcS
	BLmlf7XiMMTzgNRJsBbc8F/aV7CykzGO/pgfXBneHTR3PrPO6bx+m4DJ7mu+qan8ZFc+
	JMkuDU+kYhF76oYwc8JymDOV4WvYv1DgDzWge70MWOR0Km1GNwK703C1rJxwsTSkXW2R
	adSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=GO/cA/dWsZ+eWRJei/R5K07vX1gp6KKxn66RqRucfl0=;
	b=B81i+MQRee6OQLApNcCUSPbFsETgKhgSyDMApH8bwH4T0/j3I0Q6QDRa7y/llabzqb
	M98CZo+eUofokKwshRL+jcKg6JgjYYAHxppx8I15RSQPLa00KOLtrGw+zyrMJwSDsxnW
	P0BJg/o3v8KQXXCI6qC0cbce8t+gFhQhwfG8Gm/qlQIoA1Ar+oiZn5o3yJPKsocIXc38
	jyI2l3BKXFdAYozjXgm5Ul+17m9BDEhfMmj3fxiMD9F85A6tUJ6RIdZEF8T+U/7axMTh
	BoYn9EZwhcGxqWuwYXdEvUOiatzyB3e9ZbLeQ2NIhZIgpycmp5OUT5uF8GBUgP3VAQ3l
	2OmA==
X-Gm-Message-State: AKGB3mJDWXb1TU7WIDr+KWnOhKjjOSlv7tv1/Rk7geTa7+s3HRF7PZ65
	v8G2oveHRKT/qnzwcLZz+Ss=
X-Received: by 10.237.63.121 with SMTP id q54mr6606885qtf.337.1515076878107;
	Thu, 04 Jan 2018 06:41:18 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	l188sm2223304qkd.36.2018.01.04.06.41.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 06:41:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Thu,  4 Jan 2018 11:40:45 -0300
Message-Id: <20180104144046.30793-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180104144046.30793-1-f4bug@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [RFC PATCH 5/6] hw/net/cadence_gem: add FDT names as
 alias
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
Cc: Fam Zheng <famz@redhat.com>, Jason Wang <jasowang@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WAuxHsRiS/gn

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/cadence_gem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 3943187572..b7b4540d91 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1544,6 +1544,12 @@ static void gem_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo gem_info = {
     .name  = TYPE_CADENCE_GEM,
+    .aliases       = (const char * []) {
+                        "cdns,gem",
+                        "cdns,zynq-gem",    /* Zynq-7xxx SoC */
+                        "cdns,zynqmp-gem",  /* Zynq Ultrascale+ MPSoC */
+                        NULL
+                     },
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size  = sizeof(CadenceGEMState),
     .instance_init = gem_init,
-- 
2.15.1

