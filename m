Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4204598lfr;
        Mon, 12 Apr 2021 12:45:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaPGWPa4LZhgH+zgxXEDGnPz7sFmnwjffKUqwPVlEeDRK++ZgI0LCDX9PNq6v4Kzj3B2xL
X-Received: by 2002:a92:6f11:: with SMTP id k17mr25018937ilc.207.1618256751213;
        Mon, 12 Apr 2021 12:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618256751; cv=none;
        d=google.com; s=arc-20160816;
        b=fNG5SWuYCnHpNUC6lxtgLFzb1RO/TegdGr/HRFb19RaO+g213UIXCVf3tt4JyMSlAM
         ueRaBlLcRG7EogSSQHDAEg/4kDH0+0IqHJ2nlK8/LbwjoHY1piJm7b58v+dbhtmUNWE9
         D1CmPHB0r5XQLyWeoUsdjJP/fmxK+UA2LO744WVNyh+U4AhkE6jvl6qJrnTaTx401BgV
         ZH93Ck2eVhs4+Od7o5e0wuA8sNwhhM19oLsME+9+VjmCCTADXDDr/cAVsWCGftRVGmjm
         zpyTq6plDGrH/FbjB7zJjdL5jqDk6UToJ2GcKJULOBA93owIxuKj9N0Ebgrrt+jNLDXh
         vbjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=Wdpm+J2ptFjnLpc4pKG/VlefI/v5cVrerIv9rQO16Ng=;
        b=IeRV/cBZmLCVJZOXkfDCn7jD+7FqJvdanKCPjs4chBbPRIazO/xm9Ig/QiMrYLKgdo
         WEBVVVkUfdcrsN9DFqXN5WGi9+tvnNLwFo0ACoBgIlTzPkdpBxJsxbgUrOVRAw2kfHMs
         NDd9tIthxfGR39CCASwZJWhabNZwAo5EKdhKlYsxDJWA/6VMIit6zXZv9D9FinAK8u2a
         mseIxd142aBdj15o3mqgPWfWFlAzQHXLZmGm/BrMS4DhFbsXJ8vpgwcIr270kbwC1FUb
         Z4Wr3QxdtOciKBP6pXjhA+cCPtYYkozpWFV27xim3Q//fZAAPRtp6aQtcCFCalVNlS77
         CElg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=dXzqakmR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15si15642596ill.95.2021.04.12.12.45.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 12:45:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=dXzqakmR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:35614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lW2VK-0007Lh-DT
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 15:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3XKN0YAcKCH8yhqwxuhjrrjoh.frpthpx-dupqrqjqx.ruj@flex--venture.bounces.google.com>)
 id 1lW2VA-0007LS-2R
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 15:45:40 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3XKN0YAcKCH8yhqwxuhjrrjoh.frpthpx-dupqrqjqx.ruj@flex--venture.bounces.google.com>)
 id 1lW2V5-0006TY-Mq
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 15:45:39 -0400
Received: by mail-yb1-xb49.google.com with SMTP id f7so475295ybp.3
 for <qemu-arm@nongnu.org>; Mon, 12 Apr 2021 12:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Wdpm+J2ptFjnLpc4pKG/VlefI/v5cVrerIv9rQO16Ng=;
 b=dXzqakmRH4nvngQ/1LjDMtDSTUrmw73L71WbCb+Hu8ZgI507k1qrsJWW6P3PaGtMWN
 FBOoJ1feu7eunmMxSq8yOAKRjuvFqUfTGTJa+Qkk+Uo3GvSbKoV359DkgyIfquBKb2Ue
 rK/liKUvtJsgpayUVRYnNGWfhxM9VxYgpsLGL50wLitje8ySqy5MoCO419O36q+MbqLL
 aUJK5avXJ9DKWqt7FbyivKKgU1WoX3pFZwoQ+5kK0lis3excbJM2OJeU3/V8al/IVyQ2
 TDd08UkGINHs843eOkmnti9wmczos7QnEYyekZipCuee0Hs1l7QPmLbhn+ALzSSfPryG
 CyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Wdpm+J2ptFjnLpc4pKG/VlefI/v5cVrerIv9rQO16Ng=;
 b=R4f1ZttzyqJHellZLQx79N5dqp0EYpzTRMY75Y8BTrOI3QN9zvK3UVfIMJZJNqqtXA
 yZTgnhaawWS3qRNeQhWvZLb8rOfZiShGSIZ5Q+MCSugjYU732f+pdtehbrGKV/LSMzR3
 3WNBRq/jaLHATat9DFvFvCix3CmQg8gTepM+LiVHQbvk1fkZQhrBGuDcUjVzjBVyMGHU
 /2pb7zWFUtQO2/kRs9kK7pwdIgkJh6CKctU/nSZu8UyV0k1C9CC0PZTLk39hNgzRxGxp
 Mtg5pTqSx1AN9YJrZwuaKeSU+RN/vYf6M+L0rVaG/SZmyZS40C6kh2f7m6usqgcD97dt
 iGUg==
X-Gm-Message-State: AOAM5319AkdmXtzNbiyaAwCWAyrVbq35Wt89RYiS4u6ybbEBMY8zudW6
 EL1k58C3LZZXJyamEDkHdQDdCZ5plIpm
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:7285:fb47:eb76:b9a4])
 (user=venture job=sendgmr) by 2002:a5b:446:: with SMTP id
 s6mr40590358ybp.317.1618256732318; 
 Mon, 12 Apr 2021 12:45:32 -0700 (PDT)
Date: Mon, 12 Apr 2021 12:45:18 -0700
Message-Id: <20210412194522.664594-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v4 0/4] hw/i2c: Adds pca954x i2c mux switch device
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3XKN0YAcKCH8yhqwxuhjrrjoh.frpthpx-dupqrqjqx.ruj@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: H9BGbe8JVJmQ

The i2c mux device pca954x implements two devices:
 - the pca9546 and pca9548.

v4:
 - Fixed up bug where the i2c_scan_bus wasn't parameterizing the
 current_devs list.
 - Minor consistency changes in the i2c mux pca954x.

v3:
 - fixup comment with missing end parenthesis.
 - removed superfluous object cast.

v2:
 - the core i2c bus now calls a match method on each i2c child, which
 by default will only check for a match against itself.
 - the pca954x device overrides the i2c device match method to search
 the children for each of its buses that are active.
 - the pca954x device now owns an i2c bus for each channel, allowing
 the normal device model to attach devices to the channels.

Patrick Venture (4):
  hw/i2c: name I2CNode list in I2CBus
  hw/i2c: add match method for device search
  hw/i2c: move search to i2c_scan_bus method
  hw/i2c: add pca954x i2c-mux switch

 MAINTAINERS                      |   6 +
 hw/i2c/Kconfig                   |   4 +
 hw/i2c/core.c                    |  55 ++++--
 hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
 hw/i2c/meson.build               |   1 +
 hw/i2c/trace-events              |   5 +
 include/hw/i2c/i2c.h             |  17 +-
 include/hw/i2c/i2c_mux_pca954x.h |  19 ++
 8 files changed, 383 insertions(+), 14 deletions(-)
 create mode 100644 hw/i2c/i2c_mux_pca954x.c
 create mode 100644 include/hw/i2c/i2c_mux_pca954x.h

-- 
2.31.1.295.g9ea45b61b8-goog

