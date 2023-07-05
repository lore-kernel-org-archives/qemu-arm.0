Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3579284ejy;
        Wed, 5 Jul 2023 06:32:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5AKO0TR2KSSLBSDReai2bk1rZtGTNj2B+XAUDQ6RiGGvolP9eaAbIQPlcXEPnbN2nDBg02
X-Received: by 2002:a05:622a:50e:b0:3f6:f839:15ec with SMTP id l14-20020a05622a050e00b003f6f83915ecmr20179266qtx.56.1688563957300;
        Wed, 05 Jul 2023 06:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688563957; cv=none;
        d=google.com; s=arc-20160816;
        b=u/1Mst5YbyuZttJ6tVcz5GylIcU1JRWekbRsveDd2Wzd9U9gyn4QFKzjX37hM2e0Oc
         /64k5WvqTQbMA09ZChXC+BXxH22xyAysapp8fkjta2TP/A7WcX2RS6F5/nJYBTMsZE4b
         AsyYL8+4nVBlD0lAQdDobDtF8uMQCuEA2w9PHqSzl0/4iV5df4dUKAJ8OarquVeEXNLL
         Micqc0oK/1PcojMADVb83GK5cRwznQTC9rrvg7FjdVzK4jLVcmvLmBa4A5gT5OZlsbAR
         elV53D2i/qtpYMZo66NkSF98RUvDglCLVhZVJSgYP4Nu9F4ItxofRyrGIGljg1W2aCqA
         e99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8csFKMjZVuRSRwCfVd0lvLcd2iu1cnTH6S6ysLgFoCk=;
        fh=QXqlxiHoBliGFMptr7ZMhDvY0ya7oCRNrlYjmpX9sZY=;
        b=EGF29RntJyDz3rZej/NPWoSzeizXmXQubkyGjspzYqTmtJEeDfRMJ47Yih/W1NiDB6
         QDhbxG8xFdWf99M8nsJRujROfNRufAWtFBFeB4LDxbNQ4vgpiUXQk3uc/VpII6LhAQga
         eWmaqQys+bpvbPj/yV4DKS+BKbsFvgB1MusQVrP0i7xnWkk3Y1xMiwpHzUxeanv3JcGr
         1+2poo+Hze/Oh7nlXrk5FLOhNSYbJR44L4otekGoJqr6blAg+zrwQ03Z5kSWpeP5tfrs
         vLp+529Bryyl2FNZXQnifMklNopbuTm+8QNESicb2ce4+iDu511jPyv2CQwUSvVpqzEk
         5Hzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZXp2zRjM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020a05622a144a00b0040348b08cc6si7231705qtx.300.2023.07.05.06.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 06:32:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZXp2zRjM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH2cR-0006NZ-OL; Wed, 05 Jul 2023 09:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2bw-0006HE-I6
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 09:32:01 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2bu-0001y9-2H
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 09:32:00 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51e278e344bso773780a12.0
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688563916; x=1691155916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8csFKMjZVuRSRwCfVd0lvLcd2iu1cnTH6S6ysLgFoCk=;
 b=ZXp2zRjMqjof1A1zhHwk12O8UlT/rgkwakAG5D17jnA3VGSTNHp77qajrPAWOGSG67
 BBHlTwv1PBu2s7/g0k+SD3Phu4uyKuFkn8JobnQOMGvem2tV1KMLGfblFoD93vnl6TkK
 z4+JdiFXENKoxdXcFl/WterrOKiA0SECPqlFAyJ33SuiugbE/QE6M55ENQx5zxcVMpBc
 ZhTyxtxCtlHEj1HxdfXV1EI6Va3nj1AmIQcEc+sqHrkjwdO0zllbpqtvS9zZppXlho0+
 fxFx5+j44EQvuBhDsHCngtw0CRFmi8mQpQ+PknpMb4dkLUyq/sZP2MlKIe4AGHDjgKbT
 IhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688563916; x=1691155916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8csFKMjZVuRSRwCfVd0lvLcd2iu1cnTH6S6ysLgFoCk=;
 b=Y0rydGK5+KTMJM+NOWOZhDJir5WEeNBG2AtAVKDu6fKfhtNgmSqww/ZItxmMkHyll4
 csScC2KPztTZq1Yp19eWCI0fSsH1dMwyG9Ia11DxIP/K8zWbh5fwJteykAgZU1XDQ1eB
 YIlkvdWfZqY5FlCpi4XywX8qXe82iEjgSKSCt4jTJ+LNHNpAE545KFt+eSQRCg43IkWC
 xQ4doMgMJ1/6FlkeTqWr7TsEOxdsKlgAUfCtrub8VEbFVgQqDtSZlIk2uhhxgkCk2srM
 pKNH1LBBk2V/qJB/vFRxyPXTqEszUMmY3xjya07pGzWW3FOnPsXN4ME0iNTnkSoiXeAF
 jhIA==
X-Gm-Message-State: ABy/qLZBQyUKYn03SZLflzMzHgO97zqSSZkDo9P6nVHNN4ufKDhYAtVO
 ZNJnQD5+uEcKX66xA4Im9YDUAA==
X-Received: by 2002:aa7:d68f:0:b0:516:af22:bcc6 with SMTP id
 d15-20020aa7d68f000000b00516af22bcc6mr9477842edr.21.1688563916383; 
 Wed, 05 Jul 2023 06:31:56 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.142.96])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a056402028b00b0051e0272ad00sm5794845edv.75.2023.07.05.06.31.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Jul 2023 06:31:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/4] chardev/char-fe: Document FEWatchFunc and use
 G_SOURCE_CONTINUE/REMOVE
Date: Wed,  5 Jul 2023 15:31:35 +0200
Message-Id: <20230705133139.54419-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: GEQYMQtbzcF4

Improve qio and chardev frontend documentation,
have FEWatchFunc handlers return G_SOURCE_CONTINUE/REMOVE.

Philippe Mathieu-Daudé (4):
  io/channel: Explicit QIOChannel doc is based on GLib's IOChannel
  chardev/char-fe: Clarify qemu_chr_fe_add_watch 'condition' arg is a
    mask
  chardev/char-fe: Document FEWatchFunc typedef
  hw/char: Have FEWatchFunc handlers return G_SOURCE_CONTINUE/REMOVE

 include/chardev/char-fe.h | 18 ++++++++++++++++--
 include/io/channel.h      |  2 +-
 hw/char/cadence_uart.c    |  8 ++++----
 hw/char/cmsdk-apb-uart.c  |  6 +++---
 hw/char/ibex_uart.c       |  8 ++++----
 hw/char/nrf51_uart.c      |  4 ++--
 hw/char/serial.c          |  2 +-
 hw/char/virtio-console.c  |  2 +-
 hw/usb/redirect.c         |  2 +-
 monitor/monitor.c         |  2 +-
 net/vhost-user.c          |  2 +-
 11 files changed, 35 insertions(+), 21 deletions(-)

-- 
2.38.1

