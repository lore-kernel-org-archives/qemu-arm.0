Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3068616lfy;
        Mon, 17 Aug 2020 10:31:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn+aQ4NaZJJdEO6XpXgdNoaIrbPkxgLm2K/BCv1GtYpQ9fAAeCXlWHIlUMaR/44WkkzD99
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr21703903ybc.76.1597685472777;
        Mon, 17 Aug 2020 10:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597685472; cv=none;
        d=google.com; s=arc-20160816;
        b=qrHppADuW+P+JFxm+5kv3UFqCQDihPamcSQ7vh6lwgjPcY9Ye3BIHMJwwwozzwU9iu
         tK5ECMOZw3o9yJrxfIKYGIGbH1RycXvJaNhUTGGB0uxK7IFIirn8lusBR06TI06A87Qz
         VcKEr2JnLwPtqdXfKG1a9OTeXTdp8vWgSd4xfM8SLKqbPLEKZi2aGQyLyhv1dR6zYcgF
         cK98E9gD+HCdifMCMWfidZKYHSxg5UY+C2hpGJ65topm5B8WO/bdNo7KVwSYXxhjOoO6
         SURZ9/VIiv5VdDhvjlfJsnnqzs68MWGMMaqKRwgtXHFyzxEyeVlfKDkApIPB4oeCe9k0
         w+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=8xtVXFHEYgnf6JtDTPN7WBm75COKu7o/cNjaOQO6yxY=;
        b=JPTRXQfKlorKVQyOkxssQVkQgIqj9CuH1QWKeCrTOSLDzFmJ3xd+6EKD+6cDwU9TNI
         cRqqadeGk1iJlUVGj5xU+BK6yn0t1N+m4rmcTZGoCl/eDLboxTBK8nhPDnWToyaTh6JY
         i+bCMCCLWeb/Nvgj2ZNKa45BvhO4sZffIxrVoreMG4ds8OZ0r5Kro5bRVZS+cz5iGN1J
         gdSLrBRGgrkrNzpTJ+tTtUWPhfzXBz2WmQ8qZk8UUcMZpP6jCsl0VJEA4RgZoQwKNn8L
         7qSZs+7Ryk6hdwUdQgnF7HCeQ+DJxc1+avIDdJbEl2MtRwHGLhj+mNaFkNvWeio/4W2U
         PYJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kKIFRYYJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v65si19260372ybe.103.2020.08.17.10.31.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 10:31:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kKIFRYYJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7iyW-0001zE-4O
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 13:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7iyC-0001d9-0I; Mon, 17 Aug 2020 13:30:52 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:44484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7iy9-0005vW-Gb; Mon, 17 Aug 2020 13:30:51 -0400
Received: by mail-lj1-x243.google.com with SMTP id g6so18339328ljn.11;
 Mon, 17 Aug 2020 10:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8xtVXFHEYgnf6JtDTPN7WBm75COKu7o/cNjaOQO6yxY=;
 b=kKIFRYYJL9VpsyL0Wk0FZ11WIfPIGoQPANCiwmyMqCg3ceIur2Wj0jOVcjzosAGmeZ
 XPFrBV6FUTwwAmTX/iX3B5bD7moLuPw5Oaq/WO3FZbhJLKCzqGxOpf1HYqHirS2RAtqw
 UEUaP7pFDRRT6cXkTLpC6G/ZEDGeZk2iq/TF0kpuHGSLLr8jxguowLQdzCafUKrFDO7h
 8uRHTFqF7T/L9LAATvWN8Yav3dBlFhGTQ4HAFczmY7Uf58dpP7yzaGx7rfRisc6cxJpQ
 RgHHozUaR5lJcdHzLBDk2OvEBrPg1qJFhz3hxAbh0zvorLamTxDaYj0yKF0BUpFoGp65
 ziTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8xtVXFHEYgnf6JtDTPN7WBm75COKu7o/cNjaOQO6yxY=;
 b=m6ifWxYp6Melxy0y0BVCF1y/LSHDX+3oa/8MMGD7WNBMN1yQGyCHHL6Q0aHio12/hz
 v0zswZaZ69d0cp+jxP9ME0eKyqUQaxGyFgSODkYvvxMIFRNM0MFKF6PPNKwKCo4qahB5
 4cUNEY0+8cazt1ybWnPMfXhGxwmT0JmbLr3KcqCE5DieAzItSTque+JjMbSmctLpkZVv
 IGBAjxhYKeuLRsics2hIY7IbUUvbthK9V0SlLY6NjzvfKXmIwV2jYBGUmGMflkYC6P6t
 YYBZYpCdipC8Lub2ZttGJLRtESTCUVQ9na+S6GiyvcdALxnRFCaZBPf4ruTEIr827Mye
 GU4A==
X-Gm-Message-State: AOAM530AsaV2PnqIwKIrpuchB7Px470jrIad7x/PLhE4c49QQ6a2pdeL
 PG97C0Hv4U4r3yN5cI3uPZNgQvu7iyml4Q==
X-Received: by 2002:a2e:9595:: with SMTP id w21mr8205457ljh.334.1597685446657; 
 Mon, 17 Aug 2020 10:30:46 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id f14sm5644909lfd.2.2020.08.17.10.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 10:30:45 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] target/microblaze: mbar: Trap sleeps from user-space
Date: Mon, 17 Aug 2020 19:30:44 +0200
Message-Id: <20200817173045.437534-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BwjMGKAhvYmU

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

As suggested by Richard, trap mbar/sleeps from user-space.

Cheers,
Edgar

Edgar E. Iglesias (1):
  target/microblaze: mbar: Trap sleeps from user-space

 target/microblaze/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.25.1

