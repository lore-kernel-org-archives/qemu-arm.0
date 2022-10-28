Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1203608ejn;
        Fri, 28 Oct 2022 05:31:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4fDTrqDTNrj01BpgYdI1ZBsSOiPGCMekJ3tCNbFmH+jiYnOOmn5qvSdlHG0pGlvdaoIKOI
X-Received: by 2002:a05:622a:100f:b0:39c:f1b9:6104 with SMTP id d15-20020a05622a100f00b0039cf1b96104mr44880150qte.500.1666960319138;
        Fri, 28 Oct 2022 05:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666960319; cv=none;
        d=google.com; s=arc-20160816;
        b=WllsE7ZrH2msxK3v1CaAw+Z0tr5SSKzTW0KPboDAA1gAfCzAO6C/tbG/aq+4pSKJjK
         Yc5hsNkEZdmGWrd7TuIRs0NRV2YNSZ6AOF7yBWiqsGiTsIaC1j4csQMkwSB8aBVUsmvb
         UfQgXr6n2dTjqMlnTiWE6xnmg4DFqRk7R75GCgCiYTXNJTL7Q2HrGUea7IQGosdPtEYu
         rnN1ejpQukOlfzbyKdHB1L3SlSKuqfT9WC1OO1Usm+JY73oF9d2S/R6AmbBoPLx/OurU
         s6nXgNCb21/xWTc+Z5mFF70MKn7rc1ahIvg6ckWvlbQUW1cUjZDofED9DaY5rOO0nCGe
         Qfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
        b=oLSGRF8YuUT5Pt7mwLsvRti9/Q/W+rR0w/CkJ34SQfgTKzyhrZpMeujD5EolEK9vo4
         E8l7WLeJSvCycFr88Sg214EyPC1WHUY6wMjmFy3teRZu5E4fyvfXJ5+P6Q4pbH+YEJe+
         ZGB2XoxyMFRAjoXc/Q1xLybn4SWRB9WpHhdUAsV4oQ8jzq8AHucxoAv/eeJ9rNyKhxjf
         hIaSXEf/oaWs2usfEXTV6xww9lebw5w35UB4RPOwVsmVf5nHhWA0NgIcM5ZZlJTXo6nS
         3+XPHS98xyI21wYwmPNk4ow/Ifh9Ymfp4+JNV1uk4yEf9n07A2pO+NrMBRTnoCaPo2tl
         +kGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=wbgF0dmc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq38-20020a05620a46a600b006ed88c5e84asi2708838qkb.228.2022.10.28.05.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 05:31:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=wbgF0dmc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooOWY-000253-Kr; Fri, 28 Oct 2022 08:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSm-00038c-GI
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:27:52 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSk-0003Rt-LD
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:27:52 -0400
Received: by mail-pg1-x530.google.com with SMTP id 128so4716748pga.1
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
 b=wbgF0dmc393eJto0URkoH20VZkFnL4Ph5S1Ffvst9hklWvMb9PXhw9+Dpy1bvc8lvP
 9PrMZ+gqD/ZE0qrGUWCeolfLgDiaO8fKIYv6LeN0kQeZgz8sDBSCwMXtWEQfQuFmRl4G
 Zce40hioO/0d0x4+p/2lXSDVOfjRgonIaRqYM34INI54qkXzoEou4NvEXlyKwLAindRU
 K4S7kjf1i5Jh0S0K3gcKGAQU4Xtt+Q5gLMLQ/jonYQFxfhmE1BNf6FzylLRppj1Q8qGa
 7n/UCCr93S6x2Z3fewE15wAKV4gUVO9jcgoyFUZITYuKKygeeKIJofky7+oylGj4yIU1
 mrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
 b=GBKjs5Vo4sI0DENqL9oGFfU5WvdVZCk5fssD5kCEVmYi9EEm7hH/T92/0crxfiVWwR
 1rM3aQyVzWwCkOM8BuP3rMHq+5WEIaA6/+6CysiJn0L+IlsT/xQbOCmcAUC+FS3561V1
 RVBU2jCfOrRlxPS6ElonaIHx4kTFZK1/TW1k4mZL/4qY/p05zLgfaAFkZcWRfyQgzFws
 dhvcPMLb6uA06ddJYtTD97J5q0p6Y+UL9cfYnRJrhWlXTqJtVXnnVMdnnURU7536TYnt
 gL1VfSoh7BuCtcRKOKRsfkRcbg85s++aiWvE2bBMTMHgXneyVvzAy2M6P2jhD+ntFSUU
 LQFg==
X-Gm-Message-State: ACrzQf3mywmWpMATYudA07v22/PWFVosGAu+nM/csjcT171I7kBb1/tF
 NhVc0JYM6eZl0iMZFBjdEsKaag==
X-Received: by 2002:a05:6a00:1306:b0:555:6d3f:11ed with SMTP id
 j6-20020a056a00130600b005556d3f11edmr54379732pfu.55.1666960069480; 
 Fri, 28 Oct 2022 05:27:49 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:27:49 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 13/17] pci/slotid: Omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:25 +0900
Message-Id: <20221028122629.3269-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2XUpbJ6VJ08V

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. A caller of slotid_cap_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/slotid_cap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/pci/slotid_cap.c b/hw/pci/slotid_cap.c
index 36d021b4a6..5da8c82133 100644
--- a/hw/pci/slotid_cap.c
+++ b/hw/pci/slotid_cap.c
@@ -12,7 +12,7 @@ int slotid_cap_init(PCIDevice *d, int nslots,
                     unsigned offset,
                     Error **errp)
 {
-    int cap;
+    uint8_t cap;
 
     if (!chassis) {
         error_setg(errp, "Bridge chassis not specified. Each bridge is required"
@@ -24,11 +24,7 @@ int slotid_cap_init(PCIDevice *d, int nslots,
         return -EINVAL;
     }
 
-    cap = pci_add_capability(d, PCI_CAP_ID_SLOTID, offset,
-                             SLOTID_CAP_LENGTH, errp);
-    if (cap < 0) {
-        return cap;
-    }
+    cap = pci_add_capability(d, PCI_CAP_ID_SLOTID, offset, SLOTID_CAP_LENGTH);
     /* We make each chassis unique, this way each bridge is First in Chassis */
     d->config[cap + PCI_SID_ESR] = PCI_SID_ESR_FIC |
         (nslots << SLOTID_NSLOTS_SHIFT);
-- 
2.37.3

