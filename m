Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp281309ejb;
        Thu, 30 Mar 2023 17:09:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350bmIrpHiRGmfi8YvRB5Eq00e91ZszNppAxdZUuXWzRagTjdmbVBK+0mJ8Iufrv4xu/uXjOD
X-Received: by 2002:a05:6214:2a8b:b0:5b4:ccc0:4f60 with SMTP id jr11-20020a0562142a8b00b005b4ccc04f60mr37486542qvb.37.1680221343746;
        Thu, 30 Mar 2023 17:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680221343; cv=none;
        d=google.com; s=arc-20160816;
        b=LY4k7OODDDLMsBUjuS+yPecPPHl9Yf8ZAsQVCRsTccQ60JtswRsIHixEfXG0D2NwrA
         xOMPPvaOCxtc3q4I3FL6xWGO9Unb8bq92W7J9m0a0RXNeW55sruILp71VoeBV2JrxjXB
         NyqY4ptN7TsDT8Qo2N6o+TE8Ebt3iCyvkzmX3z8tik81/WeJNwJMI8S8cjB2GwcsjVFG
         RWT+BSa35S++fJfHviaNkeStlHBhO4vW3MPlhu1Ud4X9yvAZxEdHoGtUYp/EwvuGWGlM
         4a3e8O8rCnYKGeLTTBpG/0Ceb5mSEYnXqDX91cSHlthRRW7m2LvnIeRFK2kXvCUMTIqD
         VFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=+ILT+2IeSU2UbhLxu0CymYG/RGkoIWPbuh+F+r8ojP8=;
        b=coDo53WgPQ3JMkbl8KUrXy0ifSyc3ubkvQrtvz1ll3z0U0QEEE8QOCzXSeQabWfuZ5
         kn3PBfi0l0iwnSXdjF9pgjcmoKI3kq/pDi1gn/oqos6Aef8qMCp+cD5mpZVJhg6LcjuY
         kAfW+gfAmaSl9UbJ1Vx4m0wBi6/QbdiStXTNnc0qcWrPWnbvHPU8rkMTSmRQfCTN1YFW
         N/g9uUYeMGeeSxFsMYGlBUQAciPH0IUG4D8FnvXGeN2/4thAswNKF5yNifQxoILecoaE
         md/28PZe2jUC06AN5GJsklDChbkQE28a1HQAYfeWiEqLefhwv2oymInYaor2f1FRZ8th
         xTLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=j1rQolhd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq12-20020ad45fcc000000b0056ec0893eb8si506778qvb.320.2023.03.30.17.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 17:09:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=j1rQolhd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi2Jo-00075A-OW; Thu, 30 Mar 2023 20:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3fyQmZAYKCog5u5643s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--titusr.bounces.google.com>)
 id 1pi2Jm-00074h-D6
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:34 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3fyQmZAYKCog5u5643s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--titusr.bounces.google.com>)
 id 1pi2Jk-0005kJ-S7
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:34 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 f66-20020a255145000000b00b714602d43fso20660251ybb.10
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 17:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680221311;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+ILT+2IeSU2UbhLxu0CymYG/RGkoIWPbuh+F+r8ojP8=;
 b=j1rQolhdQKb1uB8GRa0PGhsWKdNcB1OA4j0KfD93SsnH8ADqG0rh2MO9T3RfHXrVHh
 OkLBzJge8fhwbEdkZGbHruBSI22qLv79bWG9m4vMzo91JVoQs2DVpnwzMuEs90bzzHNU
 sNqOkes1N9VptpVt9VrUVLRJdjjGo8zwjXePdj1cDnixm9x+/+yWAk/dFvUx2oDO0h7M
 YfXd9pUeU+95xN8eX1KlMmLmcFgfUKmGe57HgiVTXksInSPqU0KMIQpYB6pxx7fssIC9
 wzCBtXpQNLdJ65GNRlQro6OBD3HPySIrINJvCnCLEv11zCwoXK6uZC0JbK9OdEtiXerL
 L6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221311;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ILT+2IeSU2UbhLxu0CymYG/RGkoIWPbuh+F+r8ojP8=;
 b=pD1Q4NGzBHtqWbqr89h3OoAd/meVHy+/v0bheZuV8biBq+/1VvM0CxfCHX1C9bZQAm
 mL7mF8SxL8XNRVUF+xuzuOTvMQIH20fMM5YQCmYDxV6VI9ezbSXvbB1eZ3yZJv5Z/IB6
 qMVqVvGJ50d/A4v7+RvV6+/zmUgckjX6PRZlNISA8cMJGEb1zteoKiSSonhkzO9U4usV
 ZYQTBP67znpeWRv3Uyg06men08pRW4qJgWox9kYw8iXAsRxETLrDNyDcSFZXBGkcmJhi
 ewQjuexk28d+eJh/pddZvK4sQyl1uL4n56Hojyuf7riXP7ouf5DvEdzeeYV/JxYiR5dl
 rRxw==
X-Gm-Message-State: AAQBX9eQlgx6ChlJWOKrXJjmXj+eZU0aL6JyLx5OnV2NK68B+DDaimoA
 oVSbnyxLi9nydtKmol8G74RNzxGVLcA=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:cf81:0:b0:b76:ceb2:661d with SMTP id
 f123-20020a25cf81000000b00b76ceb2661dmr13144022ybg.7.1680221311144; Thu, 30
 Mar 2023 17:08:31 -0700 (PDT)
Date: Fri, 31 Mar 2023 00:07:49 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.423.gd6c402a77b-goog
Message-ID: <20230331000756.1712787-1-titusr@google.com>
Subject: [PATCH 0/7] PMBus fixes and new functions
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3fyQmZAYKCog5u5643s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tdqoLZCrwRnH

This patch series contains fixes and improvements to PMBus support in QEMU.

The following has been added:
   - Support for block receive
   - Support for devices with fans
   - Support for the VCAP register for devices with onboard energy storage
   - A bitfield struct for the vout mode register, whose bits determine the formatting of several read commands in PMBus
Fixes:
   - String read now handles now logs an error when passed an empty string

This series is in preparation for some additional sensors that exercise
this functionality that will be incoming shortly.

Thanks

Changes in v2:
   - Expanded commit descriptions
   - Added the ADM1266 device model that uses new functions

Titus Rwantare (7):
  hw/i2c: pmbus add support for block receive
  hw/i2c: pmbus: add vout mode bitfields
  hw/i2c: pmbus: add fan support
  hw/i2c: pmbus: block uninitialised string reads
  hw/i2c: pmbus: add VCAP register
  hw/sensor: add ADM1266 device model
  tests/qtest: add tests for ADM1266

 hw/arm/Kconfig                |   1 +
 hw/i2c/pmbus_device.c         | 221 ++++++++++++++++++++++++++++-
 hw/sensor/Kconfig             |   5 +
 hw/sensor/adm1266.c           | 255 ++++++++++++++++++++++++++++++++++
 hw/sensor/meson.build         |   1 +
 include/hw/i2c/pmbus_device.h |  17 +++
 tests/qtest/adm1266-test.c    | 123 ++++++++++++++++
 tests/qtest/meson.build       |   1 +
 8 files changed, 623 insertions(+), 1 deletion(-)
 create mode 100644 hw/sensor/adm1266.c
 create mode 100644 tests/qtest/adm1266-test.c

-- 
2.40.0.423.gd6c402a77b-goog

