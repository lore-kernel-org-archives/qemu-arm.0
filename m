Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5938876lfy;
        Mon, 3 Aug 2020 03:59:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw33w7USJtYE1O5W1N1+hKiyMbWWpmc01TleU7bhBpuUHNePG6B+79JuI8rw+R09lP74fMl
X-Received: by 2002:a5b:3c9:: with SMTP id t9mr26079247ybp.55.1596452388510;
        Mon, 03 Aug 2020 03:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596452388; cv=none;
        d=google.com; s=arc-20160816;
        b=fgqbALaet6NYEXIk12tq5sAsq5II6WpmiMtY5zrwYeEMW46kcliBVR9pvahbh40Ygv
         e267r0OKbhjf1a195LGCJc3V2VXF09aK6j2CVIAnG03egRZg8ufUzkeqFdSUUh7GbVEM
         pFGCvC03NpD5hTNoq6dqNNtd3LFTieCdp1Sc5tErrYYelDCA2jzBNvTFaE6wsiwPkfR7
         T24SMHrLrELQWGOUmTGOGB994UzIQUv0hFUy3nOhLVnPBfc8palmr+44cx2NbOlmeXed
         +rn6f7hq3DSocjGugNWAqn0lRDG5bPtmQep37IAXW2zsUCOQMg2nTKLDEiVFpnlwySHg
         Kw7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XHiU5GmBcdXr23pohS4D4pPIDt+/4V6rIKN0OFbqJDw=;
        b=YDswCjp9B2863pRsGB4B8l6Aebp5iO1YCo+a7ifa44OEds5JPdZK8PSBmrvMVfH7G3
         UWMQR2FsDA7Jm5sHailZ1mTgaYEKCWSmehsYuBJFqk0mFLQssSHia8IJfjIjLt1Nt5FR
         Tje81SMoO38o41jLmpQh+DQqDTBT5bqxGRwvxTTQWCCW15+ew/1nxMh+yBvwAA2+HOJ4
         xcpjradbqmHZg5a0WnkZ8aOEEQKnLaipoAzh9Xe3SDrzMFCGkdIaSrzqMWXR2p13YF8V
         YTCjj6bhdXOOEuJjItGnnSXIhnHA25tG9GQi819SXUoIbcuOPDwxzsKNhHpAXHfJrOja
         vkZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KkFjxpKU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e67si14749508yba.462.2020.08.03.03.59.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 03:59:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KkFjxpKU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2YC3-00076f-MB
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 06:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k2Y9K-0002Wk-SP; Mon, 03 Aug 2020 06:56:59 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k2Y9J-00027R-ES; Mon, 03 Aug 2020 06:56:58 -0400
Received: by mail-wm1-x335.google.com with SMTP id c80so13926411wme.0;
 Mon, 03 Aug 2020 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XHiU5GmBcdXr23pohS4D4pPIDt+/4V6rIKN0OFbqJDw=;
 b=KkFjxpKUK0u3KIKvxKYk6uVXB55kQ0Q5bBCKz25HyoB/Wzw/Lv23RsHRiFe/pbVgDT
 zDNfHU1sCeMKtKmSwixabV4h2vdHRUTW7CbS7THkVN2UI5sJp/r2POpLhwH14K2JDHNC
 Hpzfc0AMJHjuNvWH2UiX+CjcExK0fSbpKmxRb2rudsM2oAe2i0W8WayXtg4Ik0+EDycf
 X3uSSMqtzSPtQzoVDT1PrMezuYmSLW7VM/BKnWGCoiBx+wZvxSm1f3UYv9PYRO06Vzgv
 hgYgijh0Ki/wbopCdwLwAUNuersh5bfoGMnksROGSd9pQ5YtAbqYcCbqaDwD6xAJqoQ8
 MAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XHiU5GmBcdXr23pohS4D4pPIDt+/4V6rIKN0OFbqJDw=;
 b=evk1VG7ghFbmVB6gRZr9VhQgqpkIYJnb0BuMiWmAxK78hcWW7U75MaIM2fjof197kf
 dCxm88YlsX/mNhmObQGTlnK5gffjYGRb1P6ZtJRsrgXKHGhI+VKKhsbHgg8HL9xMg/HM
 yS7Rb5NknlsC3XNVSnMSYj16Kmk7cV6iyrkb5KeOhbPY8SsIpX8JhRDXsI0/WUTidgh8
 EUKd9ZaFtpgg1OgMQFGaAInhbk8tjj8ModWDRXMrAQQalyEm1TsMlDM2JH2oMiQdFUuE
 /ou8fkxcS52vg3/nXlhYXHqmUUKA3DzI6w/FW2PJI6gYViuATbokuFjcBW1uoRZ264VI
 S6Jw==
X-Gm-Message-State: AOAM530j5wV+tMuMpwcy/82iJ/MQyQezWrgbpir+KKGbbX9DUUV2xrF3
 FJ9Xe95Fue9gimn41ui7JHDgfeNw
X-Received: by 2002:a1c:770c:: with SMTP id t12mr16440255wmi.65.1596452215388; 
 Mon, 03 Aug 2020 03:56:55 -0700 (PDT)
Received: from localhost.localdomain (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id z11sm23103477wrw.93.2020.08.03.03.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 03:56:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1? 4/4] hw/qdev-clock: Avoid calling
 qdev_connect_clock_in after DeviceRealize
Date: Mon,  3 Aug 2020 12:56:47 +0200
Message-Id: <20200803105647.22223-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200803105647.22223-1-f4bug@amsat.org>
References: <20200803105647.22223-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jue+6e6XIu9F

Clock canonical name is set in device_set_realized (see the block
added to hw/core/qdev.c in commit 0e6934f264).
If we connect a clock after the device is realized, this code is
not executed. This is currently not a problem as this name is only
used for trace events, however this disrupt tracing.

Add a comment to document qdev_connect_clock_in() must be called
before the device is realized, and assert this condition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/qdev-clock.h | 2 ++
 hw/core/qdev-clock.c    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
index a897f7c9d0..64ca4d266f 100644
--- a/include/hw/qdev-clock.h
+++ b/include/hw/qdev-clock.h
@@ -70,6 +70,8 @@ Clock *qdev_get_clock_out(DeviceState *dev, const char *name);
  *
  * Set the source clock of input clock @name of device @dev to @source.
  * @source period update will be propagated to @name clock.
+ *
+ * Must be called before @dev is realized.
  */
 void qdev_connect_clock_in(DeviceState *dev, const char *name, Clock *source);
 
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
index f139b68b88..47ecb5b4fa 100644
--- a/hw/core/qdev-clock.c
+++ b/hw/core/qdev-clock.c
@@ -186,5 +186,6 @@ Clock *qdev_alias_clock(DeviceState *dev, const char *name,
 
 void qdev_connect_clock_in(DeviceState *dev, const char *name, Clock *source)
 {
+    assert(!dev->realized);
     clock_set_source(qdev_get_clock_in(dev, name), source);
 }
-- 
2.21.3

