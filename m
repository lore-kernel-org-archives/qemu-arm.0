Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2791040ejb;
        Wed, 31 May 2023 04:48:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6xSBcP+0ebbMv1j/W6ESu1Uu4EbdsbQmfL2PDQVIwO3SyIugbCOakJrlOcVzE78v+/Qd6x
X-Received: by 2002:ac8:5e11:0:b0:3f7:f640:1c5b with SMTP id h17-20020ac85e11000000b003f7f6401c5bmr5547401qtx.40.1685533700330;
        Wed, 31 May 2023 04:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685533700; cv=none;
        d=google.com; s=arc-20160816;
        b=STEq/Kr2hSvO0BKoThZhy4P+mgo0p7BQ2ExgDXMYfSfZfJqhMx2ZwciG8BkO0O9yd/
         1tfPJ7qJvtpg8T5EWZiCScoobH0vVsgA1LClRhfG19p/5ecJGAiDb8RYiQ0abK+SmXPD
         EYYd20SE5mcU9a+Hw9DvYUN82gRYI+YXEGv/xtsB3FopPiTORxiUFBoQcdMqJZ8aVAD1
         E/przkp6K3rV1/HUK9ljyzY3llMtBGALy0THv4NI4fBRMClsd1kebt/KvpO2ua+Z0xoz
         CoB7NkIjG4yXUQVPLo2ZCHaJ5jGE/IL0k2T6lZ7BIvvYqAZeHDulTbNVtJs5rbyUS+DK
         yEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=B5aci4+yBXbfq0wJyiG3K56i97CjR+cOI8HB2UPjaIQ=;
        b=uhpLQM/QunXCu/Cct3z6jwPZuyB4zj+FQ2/c6awtZt5OfVWqpplgN8sTgDT196eXMS
         598ghmradfANrjDvGkhmeTZRadWExT6MzOin4IHgSMNGDf2WjvEzV5qZXELPyCzf9JE5
         X+j/ioS0ekKNB4f8XEzHZG/oHgYZNEMMdJ7knLSm6wapAJfLvkRenUxYLUSyo5NrLRQM
         seFEyxQMMaHJ9CZinGaaAvXEslbzuoRsE4d03BTk8r+h0GuRUSLCDtu76J0e5GYnZQFu
         mY2WiJqkcum2N+MyYG8GJAvawFw70yr+hzFwoO94kwMLdndLo4vB6McAxiAC3wdPSFTM
         MMUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=OYWRpU2C;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=eDQMqUvJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21-20020ac85c55000000b003f691f73ad6si8035247qtj.506.2023.05.31.04.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 04:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=OYWRpU2C;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=eDQMqUvJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4KJB-0001PJ-NR; Wed, 31 May 2023 07:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1q4KJ3-0001OB-76; Wed, 31 May 2023 07:47:57 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1q4KJ0-0002y6-R2; Wed, 31 May 2023 07:47:56 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 221925C019C;
 Wed, 31 May 2023 07:47:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 31 May 2023 07:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1685533672; x=
 1685620072; bh=B5aci4+yBXbfq0wJyiG3K56i97CjR+cOI8HB2UPjaIQ=; b=O
 YWRpU2CFb9RBwuCSOHA95Ea9uLB4ic+VwcAvyzEzYSj+aQxXNtEAxaRnTwcSNsdP
 QqrI0WeCqvz2mQCYvb2/aXWRePq2retznQf6T7Owk/9QxP0ljM6zg0U4onMxO2rB
 73P56OXVDNVCa7V4TdgDKJCJfrhT4b5CspVBEBiI5iTvgT+UsztSfokhAKT9gCm6
 um1lbVIihsy3AtM7wG04MKkNjomPKRgzCWjjyh+V4pnIg+PwbGyngIJ/6Y1xQX7+
 SSNSauvS79DJW1Y5etw0sHF9paEuSF3GVBulzaXSRah8XZPcMNR5yQE66iLIi0i3
 vMtfXNS3T6x1lez7sk75A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685533672; x=
 1685620072; bh=B5aci4+yBXbfq0wJyiG3K56i97CjR+cOI8HB2UPjaIQ=; b=e
 DQMqUvJSXTUJ/yneI2cUWvGiDGLsoM2Kb/dkUUMt1ugo38xneV5jYFCiAMJCWL0x
 WA1crAlAJtZTZxLiUlriGQkjWSm37e0dcOTdLdcctcucp5Ionfyq87zPseEQ0kdz
 /je0LgSU3wxMdtddVGnT5rIMSbjFSKCFKpDMG7x329UtenEb2tkr7q/qDhDxiHZy
 rxWXsaH7RmwNT77HdfdkQ8yFIJ3dbO6ToiZcGiIOPLKo+fqPflgoXq0R2OVgiAoJ
 Y/R20SVgqelv+9Pexx+ziu7vK6akXlWx+iP22DUcH8YAYbxCTiwxezN2muh9w6mb
 hI2CMRUZaMRNihzqB8EYQ==
X-ME-Sender: <xms:5zN3ZHrGXl0y7fBcmHEtssqlaRS5gy31WH9slzib-cNRid226QhBJA>
 <xme:5zN3ZBo6GvRNA6y-195-YQ7GSQ-s0U4sc1p-73H9xg-E0Z-blMSqW0A6NLVbcK8ka
 0-k6flDY_LHewPbXwU>
X-ME-Received: <xmr:5zN3ZENxtpKPbYCc6qStGnzTmpFNVSEmUMAUDMEoj3e9kBOQdBxfb1FY96A7pvYyb9VtkOGAVwuHn-Yse4li5yUcGHJ-QrK2yv2Y3no>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekledggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:6DN3ZK7XFypkHnlxpvvvA-xqB8IJ-PIDzl_xuEr8YVXx2miS8fd9XQ>
 <xmx:6DN3ZG7tmEwV-zFxq3znwFLdx3P4okFKH8w-CtZ6TkqZ5ZPjwrSa7A>
 <xmx:6DN3ZCiIvMiBVljW_fNtn_gq8fS7AxzBz-HLdrKqlQRJp9PlJgKKNg>
 <xmx:6DN3ZJpPseZxuElRqfuiPi8k-JojwlBlC_ZE7ztdp2D7YcOdEqm-jw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 May 2023 07:47:49 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Corey Minyard <cminyard@mvista.com>, Keith Busch <kbusch@kernel.org>,
 Jason Wang <jasowang@redhat.com>, Lior Weintraub <liorw@pliops.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 qemu-arm@nongnu.org, Matt Johnston <matt@codeconstruct.com.au>,
 Peter Delevoryas <peter@pjd.dev>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 Peter Maydell <peter.maydell@linaro.org>, Klaus Jensen <its@irrelevant.dk>,
 gost.dev@samsung.com
Subject: [PATCH v3 1/3] hw/i2c: add smbus pec utility function
Date: Wed, 31 May 2023 13:47:42 +0200
Message-Id: <20230531114744.9946-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230531114744.9946-1-its@irrelevant.dk>
References: <20230531114744.9946-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586; i=k.jensen@samsung.com;
 h=from:subject; bh=CeFdXPQMBT9EavcD0MJNtTkCvwHlMl+MGuP80ekpUak=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGR3M90FcmmlFPdppPMrH5CZmMlKA6Hk3zDkG
 rL6PWcDafZRs4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkdzPdAAoJEE3hrzFt
 Tw3p7G0IAKL73L4/F5vDtIyX38wZCM1J5zNTC0cyOqBOBErPedfEsoairak5i3ZhPYMiq2QJ0jo
 WoTNd//Gdj7KfUSntELY3Z1ayIG6LvmUyaR2up6ldU15kPmemWFV5EoGowz6BIxhFThUQfztMh9
 OR7TnfSyXJKGxl10jpCK5t9vgHas2/DmeULjP0X+yFbu5ZESVbDdZwCfMJdMbttOp4K5q/2BU80
 4lGIW6x5bg41RrhQ7yyZfqEfEqFk7VzWEyU4BcmNf7q6LFCGrfoRVWLxmyBfGXgTFD1OsMtj4K3
 Q6gh5oHDlK6gQOiQ6ULjB9xm9rQS8bPQUnV9lu37Xh88xJIPYr8lfqmX
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AfCCJgVs5wsd

From: Klaus Jensen <k.jensen@samsung.com>

Add i2c_smbus_pec() to calculate the SMBus Packet Error Code for a
message.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/i2c/smbus_master.c         | 28 ++++++++++++++++++++++++++++
 include/hw/i2c/smbus_master.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/hw/i2c/smbus_master.c b/hw/i2c/smbus_master.c
index 6a53c34e70b7..47f9eb24e033 100644
--- a/hw/i2c/smbus_master.c
+++ b/hw/i2c/smbus_master.c
@@ -15,6 +15,34 @@
 #include "hw/i2c/i2c.h"
 #include "hw/i2c/smbus_master.h"
 
+static uint8_t crc8(uint16_t data)
+{
+#define POLY (0x1070U << 3)
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        if (data & 0x8000) {
+            data = data ^ POLY;
+        }
+
+        data = data << 1;
+    }
+
+    return (uint8_t)(data >> 8);
+#undef POLY
+}
+
+uint8_t i2c_smbus_pec(uint8_t crc, uint8_t *buf, size_t len)
+{
+    int i;
+
+    for (i = 0; i < len; i++) {
+        crc = crc8((crc ^ buf[i]) << 8);
+    }
+
+    return crc;
+}
+
 /* Master device commands.  */
 int smbus_quick_command(I2CBus *bus, uint8_t addr, int read)
 {
diff --git a/include/hw/i2c/smbus_master.h b/include/hw/i2c/smbus_master.h
index bb13bc423c22..d90f81767d86 100644
--- a/include/hw/i2c/smbus_master.h
+++ b/include/hw/i2c/smbus_master.h
@@ -27,6 +27,8 @@
 
 #include "hw/i2c/i2c.h"
 
+uint8_t i2c_smbus_pec(uint8_t crc, uint8_t *buf, size_t len);
+
 /* Master device commands.  */
 int smbus_quick_command(I2CBus *bus, uint8_t addr, int read);
 int smbus_receive_byte(I2CBus *bus, uint8_t addr);
-- 
2.40.0

