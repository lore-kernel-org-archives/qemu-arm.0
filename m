Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp262094lfk;
        Tue, 8 Feb 2022 09:09:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylu6Qw47z2IbKZrM3oF4EzOW4RArwvieiXojWfxqccs8zgMcMueFxF76EGoMLVu2ALPwtF
X-Received: by 2002:a25:4b07:: with SMTP id y7mr5376273yba.315.1644340176420;
        Tue, 08 Feb 2022 09:09:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644340176; cv=none;
        d=google.com; s=arc-20160816;
        b=QY1TI4ae79Trw7kRc/SReRPqx48w4YRwmHYOkxsvont3y9/1Hk+I4XMQOqB5kuwc+4
         a9EL4kCNGKqGg5amFTdyQESXvNyqWwsNkl4hrbTTKZxvwYOu0fInPb7s8Ryfc6o60afs
         tek8JZKTcsrJdoEoXOyNA2ciC/N0k2tOR/fT1Q1kPrGNWC6+b+/xghMUqdqejFA+FKXM
         L7PzmhUz+/+jIu1xJGdsj8Kki4AU1cG/ph1Fot3z/RYbo+/x1AD6t04Bx+C6gZ6n/z/H
         kkXkXdxP2PUHP+td2HHQBBnYiHoctoINRT1sH04Zh+nIT5LsaWgsDrtF9tgMBRdOP4WX
         LH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=e1F3cyiPfCm2qK9gtGdMvd6m3L6XeAhMZslq6HsdFCI=;
        b=UjJUgoK7P63OtDQsplwZBCL2rtH2qE3VjcXKvbjD7YrKcs85dYrOv+lJ+s8o2TdrTI
         9y0SNGmZ0gcteMKD2qZWXJLByr1FPnvMgPugdsXO+FnIoLXlIr4G1c6QBmpI0ah8gtVA
         2BXzOjWxqXEtKaqDv6ozCR0JsHClYhKMvWYbdj+liZnbajWLy+CjeRPnljANB4QtCP3i
         7OUQag6S0IfiSrjHg3pB4YBjw8w00ay2MIGoMHkl84ssVaBP8k0RF+JeN+bIjaVfgEda
         3jzfwzwyRZNHTRpqiEk9I9k/9d6vBwNwiqFEGbvvayU43nDR26wcmNo32ziPr3XMk6jH
         tV4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbJdx77z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 187si9791344ybk.749.2022.02.08.09.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Feb 2022 09:09:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbJdx77z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHTzj-0002CS-RE
	for alex.bennee@linaro.org; Tue, 08 Feb 2022 12:09:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHStr-0008MP-Ox
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:59:27 -0500
Received: from [2a00:1450:4864:20::42e] (port=46723
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSto-0006Cv-9R
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:59:27 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q7so3425413wrc.13
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1F3cyiPfCm2qK9gtGdMvd6m3L6XeAhMZslq6HsdFCI=;
 b=kbJdx77zrg5OTfkhsZOWHlrxyxfWnozCkf3Br1fkSVC/lQwu6FSxUSHtD30BBDcq/2
 XXWPqPmqGfJfvnVkIyqgwSiGN7sAAOZvh19oGy2uXc8cnXjw7nzutwKXQpywoED2+5Bn
 ltW6vTfiRDvGeMdq6CWiVmG1lJDmX+BpweJqQ4kzqXp40+EQE5AEN0A57CjTvyWBjD+V
 wPaBDeABxt68+tc5nB7I45+nG5MZiBfcL3IBCbbYLx1UKC+mShlaY9Y75Dnup8R5yzil
 KVkWPDgwahWsVi+ZtL697SRMOfK2IWH+G5k9n3Wjv5vvFRQxLFTuTfxekz3lXTZlgZNY
 1V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1F3cyiPfCm2qK9gtGdMvd6m3L6XeAhMZslq6HsdFCI=;
 b=xmSkH88jKJ4N85o2UKP1wnCdWMgnS/+zvrKX7wx+Fu0ynt/0sjEWHlgvnuWOXrc6tN
 IhS+1sNaL7ER3+kXfBYxqPY3p0ukMiZRA/kWm3WrLDp/2g6ZsJ9omyh5yYkb7RS2BsJ/
 MAKDjwlizrMAHqYIHBwgydo8TC7U4N9I+JgZRdoWYd2VewMjlqcXAXF4PEJesD2dRatg
 VH82YTlhzP3atCWNA8tOhFg2CuToY47ToYK3Rw7pMnP70+spTbahVyUukB0CRErXEo3e
 mNHovvKWbNhq1RdCq2oZXp2rH6WYo+o+UgNKwSz+2rYrHfFpG+kvtuUt6oA7srZuPdDj
 goRg==
X-Gm-Message-State: AOAM531zaJHtEbMteq6J8Ud7Tx8GWNTQE3FyEX7UqGGsOhG6fUS/6BKT
 WsuMt6al+5R3QExH5ASqUpqEUA==
X-Received: by 2002:adf:d183:: with SMTP id v3mr4112237wrc.538.1644335953474; 
 Tue, 08 Feb 2022 07:59:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f5sm14805125wry.64.2022.02.08.07.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 07:59:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Kconfig: Add an I2C_DEVICES device group
Date: Tue,  8 Feb 2022 15:59:09 +0000
Message-Id: <20220208155911.3408455-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bc2Hkvk4SegL

This patchset adds a new Kconfig "device group" for I2C devices which
a user might reasonably want to plug in to an arbitrary i2c bus via
the command line.  This follows the approach we use for PCI devices:
generally-usable i2c devices have
       default y if I2C_DEVICES
and board models with user-accessible i2c buses have
       imply I2C_DEVICES

This means that when building a board model that pulls in the device
group, the devices are all compiled in and available for use. 
(Previously they would happen to be present and usable only if some
other board that explicitly pulled that device in happened to also be
built into the same QEMU binary.)

I have been fairly conservative in marking devices as being in the
group and in marking board models as pulling in the group; feel free
to suggest changes.

In particular I've only added 'imply I2C_DEVICES' to arm boards. 
Grepping through Kconfig files I only found the PPC boards e500 and
ppc44x that enable some kind of i2c controller anyway.

The immediate motivation here is that the recently added lsm303dlhc
magnetometer isn't currently built unless the user manually adds it
to their config, because as it happens no boards have it as a
hard-wired device.

thanks
-- PMM

Peter Maydell (2):
  Kconfig: Add I2C_DEVICES device group
  Kconfig: Add 'imply I2C_DEVICES' on boards with available i2c bus

 docs/devel/kconfig.rst |  8 ++++++--
 hw/arm/Kconfig         | 10 ++++++++++
 hw/i2c/Kconfig         |  5 +++++
 hw/rtc/Kconfig         |  2 ++
 hw/sensor/Kconfig      |  5 +++++
 5 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.25.1

