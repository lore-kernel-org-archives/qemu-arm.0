Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1764349lfo;
        Mon, 7 Mar 2022 12:07:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrRWhqA0ZBd+DAXfbPcdOQgyAtYbwsvnuF9eWKsQIsu2ONUhKPESm54hWEQg9g0M7yVvSq
X-Received: by 2002:a81:8ac6:0:b0:2dc:582d:2ea8 with SMTP id a189-20020a818ac6000000b002dc582d2ea8mr9894927ywg.306.1646683626478;
        Mon, 07 Mar 2022 12:07:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646683626; cv=none;
        d=google.com; s=arc-20160816;
        b=lmNCBej1nYmNAv1smtDJHbFYjIIZ7A3YEEadHm30fkJKRfropDOr046GT/3eNVEv0F
         W1KUQBJI4KFMExi9ZfKawq4uaHk1U2ro5ZzROTjRwSgzrpi1LAFP9n+bmukZXpebJ0ev
         hXLLeOauqMS6kdvnRsGAkS79zahRomCQ8HARVFwAAddID8mSuqBl0Bt2qf2vmksvHKnB
         n8y+Xk6NTIt9qeEXKqheaqb1HPkqz1+jhI53LaL+IkgGZQ0J68yThBgPzgqQwapYV6o7
         uli9VJcNUERVrVS9PAzcisCOOLefZxI0ruvk1gWl0MaYlLBmQq9c6qhFqPc5RfuOlwWF
         MIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=JsKPwMSyGLOeZlI0OVi24cIs10LXwJUAC2eklVBZYPQ=;
        b=Yj1JBiql12cpVUpBaivA/9RDnIvBDOi0TOHrfAn0cjqjEklNutfDl42vh1eBS3f/rP
         PtfLJHY8nc4allXDESRv/P6ZuPJ/v6B8+3f5tfwSnrVA14rCVkLImW9LKdFhA69GpdU9
         9YxkaI0egg1/kQBGwwIzMayTA7Zn69pQUkqmEsncwNwrYCCwiWdeLRkBzlFzJMCkY+Nl
         7xZdnyrFOH7bqnjMqeAf/nhVT/dv4ybrjf6SuMLDFM/FN3yYSBA845qOpat2gLzrEKwV
         cxp3yuvGBWk08CQht4nyYKnQTCyekL+5ZgAmjhoaCW8rN1C5Q4EwS2ESAsyltpkOafbo
         hxSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=iTLYP80r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x143-20020a81a095000000b002dbd8b27c69si9044541ywg.23.2022.03.07.12.07.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 12:07:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=iTLYP80r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRJdJ-0007D3-Se
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 15:07:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34WUmYgYKCl4PEPQONCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--titusr.bounces.google.com>)
 id 1nRJdE-00078r-SY
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:07:00 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=45036
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34WUmYgYKCl4PEPQONCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--titusr.bounces.google.com>)
 id 1nRJdD-0006BP-DQ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:07:00 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 u103-20020a25ab70000000b00628c6c05d83so11333625ybi.11
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 12:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=JsKPwMSyGLOeZlI0OVi24cIs10LXwJUAC2eklVBZYPQ=;
 b=iTLYP80r6xBQ+rfZ+Nq/6i8neJ0QbPn06IpwJ7x4daR9Mmy6n6KuG2N9jp2cNhYsFc
 vrHu9+BNT8g4DFYxfctYh/U8F+kcUBBnyK28P4cqj2roar3ppkdyX7pFHr6+anC/OKrU
 mCIR7LAbfZadz/mIjlwJPjPIicKHHxEhu4HvNuY5/L0GWVZbs/JYtfgQAuCyvcsY0Qp4
 cxUUdvEOmujSSA7HLK3A3vy9tBK62yg3xNanoxDq+czogb4O/P1RH+KM/oS7J0YT0jDE
 R+TXIvOfNjtbtN1JA7Da3b50HMbuegzFmAshVShNGkoGderIi3Z7aDlSffq/wVKkEOeM
 C60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=JsKPwMSyGLOeZlI0OVi24cIs10LXwJUAC2eklVBZYPQ=;
 b=gdM1GKAoQLfh8W69h4Ekzp4i8IjIS4FNj2bMWXTe+6ozMA1xmDs3YHiOy/+cxOcOMz
 D4D26Lne0aB8y/iPzTGhhiusb+/6y/W25eZQr1SvtuUO0dZMl9sxw4Uhar0ewuSGCrhN
 asTAQt36yipjmZ4w9MchY/5fXH9ZupCmKPIqPSy4fPtPpl/3tntP58HhxBLLlI342uOL
 hfVWFdKAuRFmEg1/K4337C8VweyTjlfa/ulHkhDxD3zK4ohwHF9pLvsocNWJMcK1m0Hv
 wR0z48B8mgptnr1+nUzTgHJ6z9lTl874d+rcbClGp015+UxE+gXXh2t0/t4MDR+uAD1K
 fp9Q==
X-Gm-Message-State: AOAM5319HTLl2VcCU9mhi7LXhwCoStps0xxPm+pH3GkMrVJ2gkREG6xE
 04Z0+NnIc/o5x9FR+ZWMce7BP8kYNj0=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a05:6902:107:b0:622:942e:3959 with SMTP id
 o7-20020a056902010700b00622942e3959mr9319875ybh.280.1646683617584; Mon, 07
 Mar 2022 12:06:57 -0800 (PST)
Date: Mon,  7 Mar 2022 12:06:01 -0800
In-Reply-To: <20220307200605.4001451-1-titusr@google.com>
Message-Id: <20220307200605.4001451-6-titusr@google.com>
Mime-Version: 1.0
References: <20220307200605.4001451-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 5/9] hw/i2c: pmbus: update MAINTAINERS
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=34WUmYgYKCl4PEPQONCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IbXQdbBZ8ZBu

add self to MAINTAINERS for the PMBus subsystem and related sensors,
and set PMBus as maintained.

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa8adc2618..3601984b5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3135,6 +3135,16 @@ F: include/hw/i2c/smbus_master.h
 F: include/hw/i2c/smbus_slave.h
 F: include/hw/i2c/smbus_eeprom.h
=20
+PMBus
+M: Titus Rwantare <titusr@google.com>
+S: Maintained
+F: hw/i2c/pmbus_device.c
+F: hw/sensor/adm1272.c
+F: hw/sensor/max34451.c
+F: include/hw/i2c/pmbus_device.h
+F: tests/qtest/adm1272-test.c
+F: tests/qtest/max34451-test.c
+
 Firmware schema specifications
 M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 R: Daniel P. Berrange <berrange@redhat.com>
--=20
2.35.1.616.g0bdcbb4464-goog

