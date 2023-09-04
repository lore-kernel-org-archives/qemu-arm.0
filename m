Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1446099ejb;
        Mon, 4 Sep 2023 09:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4nJ4NCdw9Cz3zsE+pVTGbyXdlMHlkYTP/OMP1NcX3fjTnykX5QowuKLPe1JTrm4slNAeH
X-Received: by 2002:a0c:f290:0:b0:649:1f7b:5bd6 with SMTP id k16-20020a0cf290000000b006491f7b5bd6mr9963400qvl.54.1693844228254;
        Mon, 04 Sep 2023 09:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844228; cv=none;
        d=google.com; s=arc-20160816;
        b=YLIdsUv0icvkF1kpD8YiYXRUXPimRGoImkNlH/DOAD5PgefsfBR9kRHzqR2CM4T5HE
         fY924XkBiVxBWCXuv+VhuORJFah6Dpk30iCqXkc+CA70w5BCVbU9rtHiWndgkArmI0KP
         IZfe9dPUqemz/bxIL/uPbveHNYEkb6AZzHch4hddVFkNtEohgiyIimlBxIP7CPNZDqQt
         v61jIeSqUpQvPWPBkVEZTIAu2ZtwhRQPpGxC9ydNWQnka6Es573GHXN+x/uWq8MJ8jxe
         Ff+/PsGxkX67D7kabDitHkiIWZ+soKEPAI3iW6IL7lnulmVjRqDr/PTzHhAPmUKIPZpA
         0lYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fhyPLNQFlPI2Qtv/db+V50enbSRfShGobOGuQ5IYsJA=;
        fh=HvdrSrphu1ODNkbTjx5P6GZ6fTRKOIOyTadJ3yf+IkA=;
        b=v/ApdROrWc1IntA53xe7QylfYModeqaXYfMTEw+/rcQ3IEK3SH/HUF4Hd0CtciII6K
         qBhG1ZsrMuWzh3pUofFuYr5Gfyakfe+/G0Qjx7iG7VYA9x4sWcWa8ixwmxnnzWQtGLx8
         QfhJdnFl7iy8z+9DAw2rC/hKoopn6R9Kds37BDwmtvwFe1jzU2jj7QN/Y+L0vs5nO8Kq
         GV/ZNcSuCpMTXYlRVfCpnhue9r6OxsJkykkv9/pv4AXOA7MyC90Ag5T1mjtm8MDQtnDw
         eEcbcvZl+KY/NN1tE/TXQAWZdTQKy8K9QQcY+GADFTOvdEK7KJrU9hVbUzQnSxW34Pb9
         oXfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YEduuSP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12-20020a0ccd0c000000b0064b9d02081bsi6661716qvm.26.2023.09.04.09.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:17:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YEduuSP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCDK-00048q-PT; Mon, 04 Sep 2023 12:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCD7-0003QX-UV
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:13:59 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCD3-0007eO-Lo
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:13:57 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bd0a5a5abbso24518301fa.0
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693844032; x=1694448832; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhyPLNQFlPI2Qtv/db+V50enbSRfShGobOGuQ5IYsJA=;
 b=YEduuSP7RaM0UT8hPIo5Qv3fdE6GbYpZ356KTPYd3fR2O8eBcQHSGmCyGZhEI6Izlm
 L0ZZHqxjfVu4aCsdTBT+s85zDXIeRb+9UXDXrMhOk4l7BaA7E+5hTo3QTc37Kj9j32dR
 J6WJEG/LSKUqRMnoO8b9Xx1LKZc/kMsTAhFn5UCQNGNMNPJ4jykXVfBnrqPZKER+fWN1
 E1oEqW+SlodUJaE2VDa6eRpmEwf2TBIZqEZxPPl6MlJFip0+whrbq79M9beXDgbFld25
 zGagy2RT7Uik5Q0TzeEaW4C6aj2GqMoLil4s0RWDz7CHycA1sRH/7EgI12htSc1H73w7
 AT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844032; x=1694448832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fhyPLNQFlPI2Qtv/db+V50enbSRfShGobOGuQ5IYsJA=;
 b=jY8Rmvopexnap4lChkdgL5bIs9m6nn+lhnzOmWcMUKgXGzpR+Lg9JjaGrtDujmC02d
 9KXjTA4OQORQ0a+6EGZi9Q4q+Sklj9UjkdCFcj1XYXx4hbz25+NTILaXoHPLFgz9ec23
 jcc+hjoY6jDTLNXH49xogd/oySy4kcgHuiQZdfPmMc9Wrb+JzF1RNfTl26jEGw6wbg8W
 rfmQtW8Vu09Gz0iJboiMN7oxCsdeTdq9xb3vw5y1amyPWN++houBdkRDvQIuBf46Ohb1
 wj4mYRznL83ObFIen+lFb/chUrd0sHrMa1TMo/5qioTE+OW9F9cJPDjVq5j5ew06mcnF
 Du4Q==
X-Gm-Message-State: AOJu0YxDbMbEc76+EeqD2DSC41MGg2ScCD0qUt45Tgxd6ciUh4AK5/qA
 Xr1HOj8gNCEJLHcc9esxFhaIuA==
X-Received: by 2002:a2e:864a:0:b0:2bc:c846:aa17 with SMTP id
 i10-20020a2e864a000000b002bcc846aa17mr7888614ljj.41.1693844031798; 
 Mon, 04 Sep 2023 09:13:51 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a170906c28a00b0099297782aa9sm6318128ejz.49.2023.09.04.09.13.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:13:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v2 13/22] hw/microblaze: Clean up local variable shadowing
Date: Mon,  4 Sep 2023 18:12:25 +0200
Message-ID: <20230904161235.84651-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: oRPMOyxrYWPm

Fix:

  hw/microblaze/petalogix_ml605_mmu.c: In function ‘petalogix_ml605_init’:
  hw/microblaze/petalogix_ml605_mmu.c:186:24: warning: declaration of ‘dinfo’ shadows a previous local [-Wshadow=compatible-local]
    186 |             DriveInfo *dinfo = drive_get(IF_MTD, 0, i);
        |                        ^~~~~
  hw/microblaze/petalogix_ml605_mmu.c:78:16: note: shadowed declaration is here
     78 |     DriveInfo *dinfo;
        |                ^~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_ml605_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index babb053035..445509f699 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -183,7 +183,7 @@ petalogix_ml605_init(MachineState *machine)
         spi = (SSIBus *)qdev_get_child_bus(dev, "spi");
 
         for (i = 0; i < NUM_SPI_FLASHES; i++) {
-            DriveInfo *dinfo = drive_get(IF_MTD, 0, i);
+            dinfo = drive_get(IF_MTD, 0, i);
             qemu_irq cs_line;
 
             dev = qdev_new("n25q128");
-- 
2.41.0

