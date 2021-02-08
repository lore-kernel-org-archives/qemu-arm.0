Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1494120lfc;
        Mon, 8 Feb 2021 13:00:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0AP0Ha8z9Mq2uj7tr3WqRpLcUofrW3MssTlim0vYr5Ozx5swcpaPIV6d424kEbZNjCYVd
X-Received: by 2002:a25:e0d7:: with SMTP id x206mr4198279ybg.159.1612818016083;
        Mon, 08 Feb 2021 13:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612818016; cv=none;
        d=google.com; s=arc-20160816;
        b=zWf45YvQP/Mke4MmX/85izv4QIp5Z2T1LcKv6S4vQYz3WcM8TD1qOey1y9mYDYGoMs
         HF51LHdcF17MrlqjLhRCnazlQDOc832EBmtFeUDnsOlA65bZCjlFkymx+lHcqtN56XNm
         9wehpBjx0g4opqBENPRTOYU/fvyweBAJEDYP4vNFMtrg+n4aNskzXQkAk/TyHi4ofsVV
         1VeCv7mvG7HmcYRSf4/HfOnYjptdhZQcXzAz6K1tbhGdSdbGRUiZUN6lHx4jzrLDEXAH
         ZI+ryEVNV7nqBFy+NQWzX3w+bGgIMMl7IMzNeG9iomFT1xkM/ylDh/HuwGsL7uHipvrX
         upYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=307EYMWCnMiHhGKg1sg5IL/kzxktYh7xxIsh8ZdLGJQ=;
        b=Y3IRFJWYl8OMyUf1jHjQvevb2uEfIetKpdpmSBAxdwtd7SKJFTag4U3FMTb3dzCcDm
         0QBIXTl5a3TZTB33Af0zaXBxy2g/q/279YbLy+CBuMyZVpLT1aNM06fRapz3Qro5vun3
         Q79k4ICP4peLs93jEkNpYlZP+DRM1knnxSZMcA0F4Zx7V69dQQ7MVoawJEDSg+1iqZqa
         LCWSi2CLT6dwVd4s7sL7+v1rwHIdm6HAxaDufTk9RWG7O3EJVT5FyQzrBG8tcWyt9fOC
         OW9RNyrg97zfB5QcMb/1TOclzHgv1Wt5SSBNo5vceIbi8CUh1qFIx9/0dRcOov5h6fOY
         Qc0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iETXdS7h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si19228980ybt.363.2021.02.08.13.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 13:00:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iETXdS7h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9Ddn-00021C-9y
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 16:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9A7J-0005dp-E5
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:14:30 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99uh-0002bp-Lo
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:01:31 -0500
Received: by mail-ej1-x631.google.com with SMTP id p20so26012497ejb.6
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 09:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=307EYMWCnMiHhGKg1sg5IL/kzxktYh7xxIsh8ZdLGJQ=;
 b=iETXdS7h4yaxDd2utmmdp26NvgSs+0+Iim6yY5L7E75lPn989XS/sRqnGAb6UutOw3
 C6MYaDdoGXLq/w4f/KEV+OAkl+rpxEsoosqAgUoxgx0XAF3zG811j//8SMSLx4CGfIFR
 zQBrO2d3gSPUYe+N9CUzlHe431WKYne9w0k2MPFsMrXdpF0Nt87YfXrVYSxgqOlC3fZe
 7pxTPkAXFtMZKW6voeXBUiCFBOJykAvaW51xU64SoUcyzbIh7+/yqQotumcUAW9vgsF8
 Mh3NRSCXy40gEUQPNniAP6j0TYsmXbufIo6qgNNoCi4opQPL20beQxLmKyXEz+8+aSJq
 hNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=307EYMWCnMiHhGKg1sg5IL/kzxktYh7xxIsh8ZdLGJQ=;
 b=LU52r+2mP7SU+FRoe7/ypiugoQnWRWjY0+iQ69J+SMkgrIP5S7o6p0lHIzA/0l+kdQ
 F+/VELS6ExOA4IUUUSSqEUNHYM5Aub+zQQ3ivy7Kv0Wq9hdtm9F0YTsOxzPHLtLnn6eq
 6+p8XlKymShIr+bez36N2BuVEzmkH+eI3KqlbxAlZWtWqlzjO6aFurtTVhHd/wbCmnJ1
 FLkW5NmzZxS9ES8TcVfIWiBIERvGG6/MJrV4VcMbg3PgCUQr/z1p9bTtUX2/kQxl5QeX
 a1dpBWwR5klhCyqA4FYuo65//5aw9BIuTUv9KHBMX5fcRxQEqYo0QeZBZNeVBgB+b9uA
 O2mw==
X-Gm-Message-State: AOAM531DLU69Z65IQKKI2nJZ0nOdAOBVs2CN2KVRonBLiHpArlwtHDBW
 XBkG9pgKnpcmDmEUNIlYCenoPZMEt9ylUtfB064uBw==
X-Received: by 2002:a17:906:3a89:: with SMTP id
 y9mr17737365ejd.4.1612803685178; 
 Mon, 08 Feb 2021 09:01:25 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
In-Reply-To: <20210129005845.416272-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 17:01:14 +0000
Message-ID: <CAFEAcA-nx02EKVZLRxDYyY6uY4jyZ5ag3uk_Cak8zZqTuF32tg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hw/i2c: Add NPCM7XX SMBus Device
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ypmka+i+bLFG

On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch set implements the System manager bus (SMBus) module in NPCM7XX
> SoC. Basically, it emulates the data transactions of the module, not the
> SDA/SCL levels. We have also added a QTest which contains read and write
> operations for both single-byte and FIFO mode, and added basic I2C devices
> for npcm750-evb and quanta-gsj boards.
>
> We also cleaned up the unimplemented GPIO devices in npcm7xx.c since they
> are already implemented.
>
> Changes since v1:
> - Fix errors for i2c device addresses for temperature sensors in GSJ machine
> - Use at24c device to emulate GSJ EEPROM. It supports more than 256 bytes.
> - Fill in VMState in npcm7xx_smbus.c
> - Change commit message in patch 3 and 4
> - Fix order in npcm7xx.c IRQ list
> - Add a few extra comments to make things clearer
>
> Hao Wu (6):
>   hw/arm: Remove GPIO from unimplemented NPCM7XX
>   hw/i2c: Implement NPCM7XX SMBus Module Single Mode
>   hw/arm: Add I2C sensors for NPCM750 eval board
>   hw/arm: Add I2C sensors and EEPROM for GSJ machine
>   hw/i2c: Add a QTest for NPCM7XX SMBus Device
>   hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode

Hi; I'm going to apply patch 1 to target-arm.next because it's not
really related to the others in the series. For the rest, I left
a couple of review comments but they're pretty minor.

thanks
-- PMM
