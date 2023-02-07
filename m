Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5710948ejb;
        Tue, 7 Feb 2023 11:47:01 -0800 (PST)
X-Google-Smtp-Source: AK7set/JE/9j34GWiFbjsdJInphhVd02Z78qLxpH4QUDjJxTDoY6gsHBj+qcGejOlL9yXPEM22IW
X-Received: by 2002:a05:6214:20e9:b0:56b:f307:4e3f with SMTP id 9-20020a05621420e900b0056bf3074e3fmr6096140qvk.32.1675799221317;
        Tue, 07 Feb 2023 11:47:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675799221; cv=none;
        d=google.com; s=arc-20160816;
        b=ivaGSSw3lCIt63uJYXr5+hVMOATE+c5KzonYXHZiryIepoCVsjq6yqPSZ3R/+HNGW9
         8kNfHA1Hdbq3tNDIk6xuDQHzkFlhGE53pyzeEklZEU0UzexaRlFbkW4LxhQLyIiMhtnv
         h4ai4rCXNHhpMUpRk9W8qCIzN+6okWeQIIw3GKuHqR71q3Gt93SSG4/g14XgPthloPFc
         sWCSN/+jsBcn19kymyxVaPbZTKGtMv1HCm4WmCaOjRS5NSv1XiOAVUGq/dRKKt4i9Qwv
         +9mU05cRu/drVqkS0sWH6faxs6M2gwyfKmM4nlxvdjlniuRXdLZMoVtEzu7xIlSjIycB
         Rvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=5lujPvSpTi2PfKTZsVlKspXBvMBw+dXQqLUrSOycVlw=;
        b=rg+linFzrif38O2dZI4p8dJXQhoLhRJUhdUMI4hYBMTUSD5GENixMFLhsaAaY3vKGH
         zwlEvBHWAZiN9N4P92s5g43eEn6w//Xl0mV3m/YuImDIWckVoD6pQbMDXhZ1drq6HdKK
         8BKVgJshlY2wmUNTpBlPCHr5C9uHv837Y/sgWRs/L2E+gV2vksNPS3WvciC73LHAsjeX
         udjTQxGVcSA1c8JdK/DsrE4vMTfzySRx2ZdgtMBn++STi+yGIZzjwnfyyX2Zh5VzT889
         Ramvu43kRS7Wt2e2NetmiB2fe1Kcn6pOzdD71QWSupWDrQoo6kkUIXhI2palMNeiTbBT
         ONew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kuPWesE+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5-20020a378805000000b007069ffd02acsi10283242qkd.760.2023.02.07.11.47.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 11:47:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kuPWesE+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTvB-0002YF-Qb; Tue, 07 Feb 2023 14:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3d6riYwgKCnw1zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1pPTv7-0002SZ-Po
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:46:26 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3d6riYwgKCnw1zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1pPTv0-0002f7-RB
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:46:21 -0500
Received: by mail-pl1-x64a.google.com with SMTP id
 l1-20020a17090270c100b00198be135a14so8500200plt.9
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 11:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1675799160;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5lujPvSpTi2PfKTZsVlKspXBvMBw+dXQqLUrSOycVlw=;
 b=kuPWesE+Ce9gZyxLkU1BJHa/mJCeN9sRYeRisOMboEMmLqYQLWoJ0PnDobrDRRWhW9
 ptZitMOh7Ljz3DhuP9nUu5BP7BQ5im/hQVg8nQSY82xiRrle8Q2tBJrv9M1OIVBD0rWl
 a5HzsSAH+D0vdNUIdGYx1bLaYF2eCKSyB7CU5VlmKHjw5wNfAZ2vdCq+CUJDcqKeetR3
 78+SZOQURE+Zrtu7kqNgkOmMbVOeaeTQ5iY+BS9zhIqkvExgtp53+z5GVtW51syesM8f
 5+5SPF/ljHoSUXHHWjPijrwWPVCS6lmMBlm/GEprrDqMQ7PWjsEihFYs5GCtSEo1KRXr
 ykEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1675799160;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5lujPvSpTi2PfKTZsVlKspXBvMBw+dXQqLUrSOycVlw=;
 b=HM+MwbSqMJltlR9+H+0x/FZqH9vkKHJQ63z673RsmUstmuPSRZxk+B5SpTzaq8qdp9
 7HPbaB8oTBe6jEJ4php5k52a4OPV7AgVuQXdaNI231rvnl286kqbYkWBP5rpCrP6aPAi
 rLOw/qXa5qIrLYOOsig/diG2OFJj0HivgSqRjd4iHTgt10ohWMlEWqNPvdiVOshBY7yy
 xT4gUMRD2CBlv/1MTwWWU8X16xW1Qf4mJdhPJYlPM6Uw2a2gnMuSJPT/airDkMvBCevW
 oMWOGUAUlw9rS3z+nW8aeAtGB5GBMqQC9zAf/4msQGXITndYhERAkke2PRZOeCQ5+Tnr
 26Fg==
X-Gm-Message-State: AO0yUKUELCkln+eCqrwWV29feefNcHDotivNivxK5oQhemtKx8x+C8/F
 3sQk/QvuPfiC35GBYbCscQ4HJoci+1aspg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:b7c9:b0:196:7127:2240 with SMTP
 id v9-20020a170902b7c900b0019671272240mr1109333plz.11.1675799159986; Tue, 07
 Feb 2023 11:45:59 -0800 (PST)
Date: Tue,  7 Feb 2023 11:45:53 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230207194556.3262708-1-wuhaotsh@google.com>
Subject: [PATCH v2 0/3] Nuvoton Peripheral SPI (PSPI) Module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3d6riYwgKCnw1zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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
X-TUID: GZnaUSTgsF0H

This patch set adds peripheral SPI (PSPI) modules
to NPCM7XX SoCs. These modules can be used to
connect any SPI peripheral devices to the SoC.

This module will also be used in the next generation
NPCM8XX SoCs which haven't been merged yet.

-- Changes from v1 --
A few minor updates for npcm-pspi.c according to
Phillipe Mathieu-Daude's review.

Thanks!

Hao Wu (3):
  MAINTAINERS: Add myself to maintainers and remove Havard
  hw/ssi: Add Nuvoton PSPI Module
  hw/arm: Attach PSPI module to NPCM7XX SoC

 MAINTAINERS                 |   8 +-
 docs/system/arm/nuvoton.rst |   2 +-
 hw/arm/npcm7xx.c            |  25 +++-
 hw/ssi/meson.build          |   2 +-
 hw/ssi/npcm_pspi.c          | 221 ++++++++++++++++++++++++++++++++++++
 hw/ssi/trace-events         |   5 +
 include/hw/arm/npcm7xx.h    |   2 +
 include/hw/ssi/npcm_pspi.h  |  53 +++++++++
 8 files changed, 310 insertions(+), 8 deletions(-)
 create mode 100644 hw/ssi/npcm_pspi.c
 create mode 100644 include/hw/ssi/npcm_pspi.h

-- 
2.39.1.519.gcb327c4b5f-goog

