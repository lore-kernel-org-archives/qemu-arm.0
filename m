Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2752744ejs;
        Tue, 4 Jun 2024 00:11:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJgxnNnfsKPjd1C/AQNE6p9X6bo6s2n8XTxqETfDo2AM6+6EJNjeNj4dAVsAXkOdMggEGN1f4IL5poKoPxHaqnoE3PQMnX
X-Google-Smtp-Source: AGHT+IFd42GYl1au1ndYHQmfTQMiHLYCjfH6clAH4SAeFBC3+JND6hH5TTG0ySf15ElVKIZWR7Pj
X-Received: by 2002:a37:ef16:0:b0:794:9e80:4329 with SMTP id af79cd13be357-794f5c594damr1178289585a.2.1717485066337;
        Tue, 04 Jun 2024 00:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717485066; cv=none;
        d=google.com; s=arc-20160816;
        b=WTPR0Tux+s0ge+CSiNDtY36Lt7P1yLNwoY/qbl90IFpG7sA3Fde/LJ8Iw/v8luG+p/
         JlgWkJwonHmYsQENZXcms179/dmc0tj9zyUsZku+M66d58UhRMoqeo4Pv62mAkedmF9R
         Xalw9Yu1hX/4Pax2YiLLFLcAaHBzVKIYT2m47eC47fAm1MBbXAmygE+e32ovgaaXO4NO
         HkOWzeWo5f1rxStrOR1JLQ+rylbSzUlE1uhOW1Emr/i0aCeIhgYcUpPQ4Kz5whZZoqU5
         8bb0MvpRiXnjlwI33TpoYyhtU91C7i5ZdcH6IKbYntpL3pRLeK63on1Mv7ydIauAD3W8
         azpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=GTd7iSqY+2K6omhWKf9ip5yUDCYSOtXHjx/sKNx+FFs=;
        fh=6ZZzAeu+U1YHop853GL+rqP74GluQsMX1Nrc58E8gHk=;
        b=MoGpv0cLomu2AGklJyeRYFo7LEyWy4Pyh9+9UKg2tsvZXnFPYvsc1H+QeNOe2Zxc23
         w9oN1FzlY9tqX+w0U2Iuyvi3bESU/+HoIKv+wnInnUCGu64XO/H47BdiG7iJrxy157R+
         2A58he/UcY/b1DIWHHkdTSQLONLFNZW00CUUteNEpYO6QZ5idZJvn1nKyJZvJpR7pC9Y
         ycYx4POxNqBSvn1wL6QZAGuUklDKVV+6qaEhrSobxhNv/8Me8YLs18PVrtp0a7YoB3yQ
         iYqeP7JBUrN6e1Vft5Huy7CO84arr/Uo6QkmINSWS6e6H2waiGObQTUdiANxhrmm7Yg6
         AlXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=Dfh9tRe+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f2f057b4si1036450385a.35.2024.06.04.00.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 00:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=Dfh9tRe+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEOJT-0005Eh-VJ; Tue, 04 Jun 2024 03:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sEOJP-0005D2-Kz
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:10:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sEOJN-0000SO-Va
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:10:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2c1a9b151bcso3963636a91.3
 for <qemu-arm@nongnu.org>; Tue, 04 Jun 2024 00:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717485023; x=1718089823; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GTd7iSqY+2K6omhWKf9ip5yUDCYSOtXHjx/sKNx+FFs=;
 b=Dfh9tRe+AiAXqw57l/8jx8CXbAOnrEbA41vMkpWSFaN5OqImauc3GIiQk97EYTjSsl
 C3kveBsySxd9qVv+En2kEnpLXrKoKf2BqhK2yWSp/O3OV8BgDVJ095GQpSlYfk/Q1KOt
 mO2RWtH3NHyskgagl+lH0TGE7nb3yWUBzbtrJg17dl6GArRwUpEnQN+o0Ja66On4mWwp
 i9q/f3hudU0IE8hd60RwI7ZtNkYhjaTH2NPHdiVPf23fMzsjy8EyAYdKmlncu2e7ZyF2
 oEEnDIv2G6F7jj07e9tWsUuQqWv732So73xpeVLv4foT3fPdlcTNtzNpBOBSNkCdFcXQ
 dVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717485023; x=1718089823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GTd7iSqY+2K6omhWKf9ip5yUDCYSOtXHjx/sKNx+FFs=;
 b=eGRkASAbYvZyV5V6GnK0ol7tplwSZBDaHO6aGqbIhWEruFSR0+MfYij8F3JOS5k47G
 gdjtf07h/7a4nqO62lDhiH1pnKhUB52vgH4AvFufTqE6R++o1vf3umUVJQiiBBwKOYpE
 FNOoqD2jM47THRYLq0hf+OfZ+x5Y1uQjdqjwnNqrC7dAe2+R/ElBEzXP9Eq5rQqbiaPp
 /CtBNWvdBlPTPKv+MfUz6mcrzPPWlgULGuFJAKh47OnMwAi0x62Pr+jHCO9wWo4pY/+/
 bovOb71Ot+XOrYKco/DuT9jHjFx5Td4lbdCT3eSZSDpGn690JSqxIk4YDHPCanvO2wOb
 rWyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUm4xfmiFdPrwg+b+n8ytUamToHrXnplokj28O9S69+gPubNLhzfHGSSrpO6A7j3dz7SHm6Y0cjxf+l7danl7cSf4+
X-Gm-Message-State: AOJu0Yw/ds7p1Js8zWGvyJQGe1zy6jYy6iKX98iYf2LP/OCVhHiEmLCu
 EH9QAtCgnDIrpdM/VG377xlGEVNxA3PrSyge+gN7++PFlJlip+ghQ2B7U0Ss63M=
X-Received: by 2002:a17:90a:db42:b0:2b4:fe80:1b1b with SMTP id
 98e67ed59e1d1-2c1dc5cd183mr8783856a91.43.1717485022768; 
 Tue, 04 Jun 2024 00:10:22 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c1a775d68dsm9237943a91.6.2024.06.04.00.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 00:10:22 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH v2 0/3] hw/dma: Add error handling for loading descriptions
 failing
Date: Tue,  4 Jun 2024 15:15:37 +0800
Message-Id: <20240604071540.18138-1-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=fea.wang@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: kjDTNW9rRssu

The original code assumes that memory transmission is always successful,
but in some cases, it gets bus-error.

Add error handling for DMA reading description failures. Do some
reasonable settings, and return the corrected transmission size.
Finally, return the error status.

* Add DMASR_DECERR case
* Squash the two commits to one

base-commit: 915758c537b5fe09575291f4acd87e2d377a93de


[v1]
base-commit: 1806da76cb81088ea026ca3441551782b850e393

Fea.Wang (3):
  hw/dma: Enhance error handling in loading description
  hw/dma: Add a trace log for a description loading failure
  hw/net: Fix the transmission return size

 hw/dma/trace-events     |  3 +++
 hw/dma/xilinx_axidma.c  | 33 +++++++++++++++++++++++++++++----
 hw/net/xilinx_axienet.c |  2 +-
 3 files changed, 33 insertions(+), 5 deletions(-)

-- 
2.34.1

