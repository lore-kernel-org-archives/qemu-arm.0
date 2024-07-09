Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1559888dlb;
        Tue, 9 Jul 2024 08:27:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTyMSYQReqAhhORwJY9YsaIZSMdyYX0ORV8Glaw2XEgn3EPdYHJAMwZsRulJ7UEaQrEg2Qhf01auaQ9+ldsxoFzpClSXxV
X-Google-Smtp-Source: AGHT+IE+eZr0Hgo5CCngVNfHfNy3Fhk3Tue2KpgN8DL0Ru0cjQ12L/JT3hvjGzXW+EFi+ybCVHZq
X-Received: by 2002:a05:6102:419e:b0:48f:df86:da4 with SMTP id ada2fe7eead31-4903213d8d1mr3201668137.20.1720538851814;
        Tue, 09 Jul 2024 08:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720538851; cv=none;
        d=google.com; s=arc-20160816;
        b=KCenbdy4e3bGMbD1vEjLmzPXv57wTSQyHxFmKLs/cdZeYMKi6fgjhZkElIgwlpjGFP
         AUm5fpUAIhXFhSvFBL968qK1RbS0Rfx3NXHUD86HbSW8XTFJ2jOj9MkMAtVzys9+cHl8
         v9e4y8LcWA7RlZo6C9VljsMwcy9d6Fz1UQpfePxn2G2c9PFMV3U5z82AK6Q54N0Jm+zr
         WE1pUYL9vtHgoPXB9fKoe37Co1CBHgq2V05IY7lY/Hyb+cXPDMWU5/95lX9giu/IS5H7
         C27rVJflghA+FGwBsANitc+4B2mfriafo1T/j71CTpPg9sUsgRBD8Fo+Nh5r5W3M4W0i
         +e+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=60ugG7sbucLNOSaT9RRMMhTNzSMzLQ61ZmEDNwXQ9Yk=;
        fh=Txzf7K5YV+qryaChbcvqA4D4sw+KVK3yVi4ERabJCxo=;
        b=ZNdyu2XxPyM61z8jiFT56TsKYPTQRmyz8NxZ88affEQexesfUWBS4zpoeCscaIe9mC
         srD1zpII2ix0qUt//UdNLsWa6+y2+IULFFsdIsoPIVo3WNZ1nu8Kd2hbx3et+k/0Qr+z
         nS9e1MlatU/EP/iAU2kUSnbFdk1nWnxhVEv68wNEwatdzxGUn0G32quY5FNwm62FlC0E
         EMCW0pG75hosXPQEQoO6TmB4aXHcDWymYcE5Gk5l7RY4J7BeqELLbNfaB27hjyQkMCW5
         lklnwtg6sN63NnKAsg3u36fHQ3d7N5AV1Yz3uaQdvLIi+J56rYdwTUztTdPjq0P2VrJH
         U4Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J9jg8Rg9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4903176d283si348480137.604.2024.07.09.08.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J9jg8Rg9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRCjr-00048G-90; Tue, 09 Jul 2024 11:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCjd-0003ln-Mp
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:26:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCjc-0006Eg-1f
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:26:29 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so44794845e9.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 08:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720538786; x=1721143586; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60ugG7sbucLNOSaT9RRMMhTNzSMzLQ61ZmEDNwXQ9Yk=;
 b=J9jg8Rg9JWoABE0qMwy7A+vzGeCVlheESLswLIhW9km776dchOcDogVPSA65ghbV8y
 /ElUvgKR89Xb/LOlDmOS4ueACfzZmHY9d14+eBB7kdNKaHwG5UG8HbJiF4l3nohPFZsc
 EM7YqP/5aVslqGqFWmBOwUi+bDgymJTQeKumiLnkb+Jj9uY5ScFlLbPE7H6H3eB942f2
 fsiPVsCd0f4nGu9tWxwn80l5UFGsgF57EqEHctlhrIefdB/s3BLQuQd2RInSCzWg/+73
 mQPQGn02dE//YOzbnx7genwmgPYQCsRs9kkS5+24JyNAzoVF/FiCepxow6JNjWL3sDLN
 T9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538786; x=1721143586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=60ugG7sbucLNOSaT9RRMMhTNzSMzLQ61ZmEDNwXQ9Yk=;
 b=KLb01ZtfUqPZKvIHmoIhnmHB4qWdF3WF1NwbNJpTlxi2fEeFAq7bKrsTQUKG83viDy
 GqDIse+5Ip+ksC/rDH0nHfXpwtSmuk+sQ+HmBS9xTHHUmiQVJhoa3WQpkQZQhw9ti2PS
 khpZHd+0nV/flw4qRabXZgoTPO2zJYAtSxz3YjbgRQTO8hkuVTkMNW64te2K5SeDh9tp
 oNHRKqwLfT+LyVgAnDA1YSRtfwC7kNlz3fQBDWKwTP7F+bHUnJyeFnJ5Fv3VjuZczsM4
 JkMeoE19JW0XOg1fxP33fezj35/ePQFPVhaw6uEdJu/eO+d88+2cjRiaLd3UhUrTJ4CU
 2mmQ==
X-Gm-Message-State: AOJu0YxRQsfLflcth9qWjclNMSLPx95aUzBjRZo1b2tYZUICd9iRaqHE
 Id+7OVumxrS2etjawPfSijtzVNCed1+HV8Wm+m8w14BgYQau0p1ve3+eqFdOZFo=
X-Received: by 2002:a05:600c:22d4:b0:425:81bd:e5ee with SMTP id
 5b1f17b1804b1-426707d07c5mr25276565e9.16.1720538786629; 
 Tue, 09 Jul 2024 08:26:26 -0700 (PDT)
Received: from m1x-phil.lan (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427270238a6sm12770615e9.20.2024.07.09.08.26.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jul 2024 08:26:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
Subject: [PATCH v47 04/19] hw/sd/sdcard: Implement emmc_set_cid()
Date: Tue,  9 Jul 2024 17:25:41 +0200
Message-ID: <20240709152556.52896-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
References: <20240709152556.52896-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: EV9sPZPlDMj5

eMMC CID register is slightly different from SD:
- One extra PNM (5 -> 6)
- MDT is only 1 byte (2 -> 1).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 097c9cc61f..2d737a836f 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -446,6 +446,23 @@ static void sd_set_cid(SDState *sd)
     sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
 }
 
+static void emmc_set_cid(SDState *sd)
+{
+    sd->cid[0] = MID;       /* Fake card manufacturer ID (MID) */
+    sd->cid[1] = 0b01;      /* CBX: BGA */
+    sd->cid[2] = OID[0];    /* OEM/Application ID (OID) */
+    sd->cid[3] = PNM[0];    /* Fake product name (PNM) */
+    sd->cid[4] = PNM[1];
+    sd->cid[5] = PNM[2];
+    sd->cid[6] = PNM[3];
+    sd->cid[7] = PNM[4];
+    sd->cid[8] = PNM[4];
+    sd->cid[9] = PRV;       /* Fake product revision (PRV) */
+    stl_be_p(&sd->cid[10], 0xdeadbeef); /* Fake serial number (PSN) */
+    sd->cid[14] = (MDT_MON << 4) | (MDT_YR - 1997); /* Manufacture date (MDT) */
+    sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
+}
+
 /* Card-Specific Data register */
 
 #define HWBLOCK_SHIFT   9        /* 512 bytes */
@@ -2581,6 +2598,8 @@ static void emmc_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
 
     sc->proto = &sd_proto_emmc;
+
+    sc->set_cid = emmc_set_cid;
 }
 
 static const TypeInfo sd_types[] = {
-- 
2.41.0

