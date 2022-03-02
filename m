Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp339866lfo;
        Tue, 1 Mar 2022 17:59:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPQSkAxKnGF/C4LW/eH2jrxg3c5LY2F9J89BYvTqKqJVTc2RM+SHOKn2TFMmArk67QxGrM
X-Received: by 2002:a81:b89:0:b0:2db:c3d0:ae32 with SMTP id 131-20020a810b89000000b002dbc3d0ae32mr8703157ywl.436.1646186386907;
        Tue, 01 Mar 2022 17:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646186386; cv=none;
        d=google.com; s=arc-20160816;
        b=WATiRVbR3I0+is19C7PSSaW3+ikNnB1pTg8wwO4BFZTQ1lDVz+g4VVlNI5MclJ1Nrg
         lV3+uNR0/899IB1ZxgNUV9ZJZ3iuuFBQcggkHHvw3+zykyyGFD9QVVaWrTcdyP687o+g
         TWZwXLy9rgOXPMY0zf3Ksx6WovCywSC767xJgsw3sgv7G3jUUQqYyI7h04v7LEidJHQS
         gCE+nphzihPoN9LxTji9Sg4KFdqS68Bd179AFiPe6LQ8mfRbVU8/U7QkTJW/5qkMFQ5z
         SVyiVz4ohyO+aZDYP+Ok/T7GaM7tYo1siRLAQDy6kjPtHL0lqzbjOVqjgjv6ZNMzBo2w
         E9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=SsuwZhWo+ed7nVZvOpG/H3KPAbRwMjbTiNEUiQeQcno=;
        b=mbNLw6kk178RqDqmKrFqvb+I2aQiUgbelDdqF2iPyotNGIy7fI4B5Fqvp8BfsE+kyk
         D/0+mAO31bhzZGvuvjR0G8mv7xrOFjaETgeutNUJL3+3kleF39NWH876GBGmLd0RmcHK
         mzYueCQjxL3CyJ+luQ6GCgFAjy/xuaCEh8HsFtTtpX7vMgOwXuiTMaWIevdZgtmEmYJj
         R77yW6BoGiYJa1Mw3NIYPmPgxzzGkv0vDSLR/AncIvycffK4HYolkWxo0JHfkvkBJNir
         /9+p0CwklC++7E9AWogoGMhUmltzaLFiAymyrYVf+ujV0xLofuaiLcfmuRDdcFaWov9p
         +Vag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=je6Ogwc0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d192-20020a8136c9000000b002d7dbcdd480si12709648ywa.41.2022.03.01.17.59.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 17:59:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=je6Ogwc0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPEHK-000228-9I
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 20:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3kM0eYgYKCL0wlwxvujrrjoh.frpthpx-dupqrqjqx.ruj@flex--titusr.bounces.google.com>)
 id 1nPEGt-0001jd-71
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 20:59:20 -0500
Received: from [2607:f8b0:4864:20::b49] (port=38512
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3kM0eYgYKCL0wlwxvujrrjoh.frpthpx-dupqrqjqx.ruj@flex--titusr.bounces.google.com>)
 id 1nPEGq-0008Jy-UC
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 20:59:18 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 i6-20020a255406000000b006241e97e420so209632ybb.5
 for <qemu-arm@nongnu.org>; Tue, 01 Mar 2022 17:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=SsuwZhWo+ed7nVZvOpG/H3KPAbRwMjbTiNEUiQeQcno=;
 b=je6Ogwc0aUtFCzQUa/h4EBtoFJY8KIyyIqElzA2HgJz0x4u4zcwNzny3T3AOlWTdej
 6r8MfwGys6lFwgIai8dEVIHzAdUoCbo9UFT7TI6r+6aV3z+SA29978Mo2CqMyd9RyE6f
 fPUF42Kxii4ITceibIJqGvZ0sW+z5y8mQT91uFhEZSUqwyVc6KW1rDhgobpOBcvK/S+F
 iafBSHVTnZYAmt5tF0Pa9QunASYubO++T6ees55xcI2XvXPylC2ZRcRVkl7AgsLnVRXU
 mCqhXD5MqKClBW0wf8gG32JtqPieknznf3U7TKpkmk8IaaehZ85CKPnzSKWn4dNWVuAb
 oklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=SsuwZhWo+ed7nVZvOpG/H3KPAbRwMjbTiNEUiQeQcno=;
 b=7KjZVb/0LqroWLQyVzSwaRAEUUlgFdrSrHJa3IHyk4S5TbY/eoMMMUtQ0/wtx8RTBl
 V0Pxt2L3vSyki0bJ8+kkJSlvzUb2OuA8WQ9XyLUKVD4seuTpQuiLYZ2HPRxmWP/jI7G6
 zTxS8q5fZ2nH6i4Wi60dWmnxRPRhjsAc3n5A0d1vkktqHWA9HiDi16H0h1ZSSpsPOW0t
 LwV0PJNo/Sy/o7T9vOeiqLO6l5IWCxGx3BN6dddTyaqVN4naZ9A9euSJ5O4gdGb5d2Zh
 a5HJ3Pey2Dtgk2H5vb8QvVw/+bXPiGdCgQD1gWZ/3PalFVaxy+QgPu7PRFbJlY2PnYfr
 ChBg==
X-Gm-Message-State: AOAM532wluh0QspNjsOL5vPne8Bd12dbovDZOn3tn302mbX/IJr0kY02
 kthvYn2IKXrF54JOzJkASEwjrJ8cqec=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:2087:0:b0:623:249a:73b6 with SMTP id
 g129-20020a252087000000b00623249a73b6mr26619843ybg.139.1646185872616; Tue, 01
 Mar 2022 17:51:12 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:49 -0800
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
Message-Id: <20220302015053.1984165-6-titusr@google.com>
Mime-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 5/9] hw/i2c: pmbus: update MAINTAINERS
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3kM0eYgYKCL0wlwxvujrrjoh.frpthpx-dupqrqjqx.ruj@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G7wDzZRHKpEC

add self to MAINTAINERS for the PMBus subsystem and related sensors,
and set PMBus as maintained.

Signed-off-by: Titus Rwantare <titusr@google.com>
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

