Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp668114lfg;
        Thu, 13 May 2021 09:56:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrF5DbK6DS5sivyBWBExE7+jp96eUTAEaW5slFdm1jqE3Jr4NBmDpp5zEsoYVbLoaK+Utj
X-Received: by 2002:a4a:e512:: with SMTP id r18mr32737608oot.40.1620924989871;
        Thu, 13 May 2021 09:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620924989; cv=none;
        d=google.com; s=arc-20160816;
        b=HMV9KvL/VpXEmMqbn+TG21BIB5wROZGrYuR+OS7eX+oiFCnTnfvyBkiWSavwuCZxK7
         RYPWjkqDufQM5S5NsZ9bLJEd853UECkNoLbhRp8qiSgjLDONpMDDKlbFPDXtEPd1vTcK
         vUeIFimJpqVvZsb5HxGVDnmnF8QAj25CMQQHurrDFvUeJ6/Rg0tnu1zfs+qUQMT8hF+5
         822MFM4CSakFA9fzh91Z1vHWKY51bYiQBPhM4vo72WMhkowZODl8igqUcrajt2Q+vePE
         cW2tL4IVOkBOscmLDsj46lt6fMimRkgMDNipZJSi4ltjUblARiB+hBeObmQ06iWYJtsB
         sZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=y/ktmwgutY2Wn0xDD9O8rw5tOPYKtHCv9CNEw553h8k=;
        b=xeO/ss+EluQ2tFiMogvtLxrp74HwjQrFwXej1TuFHWl0R5Ctr9o+ax6D3hV13X95Ue
         PCersdBeMtFrAF7iVrYInGtLLY3oNlZb98uNOu39hGIVO8HqEBQ6NwZFm6zccS3y/e88
         7ZH8Keo1G/ZHVZKLcmaJlyZxZZjoD3q+qtDlwfmnVChOGD2W3ABVUc5kqsXn7OHXhA8P
         IPMDt8fOA3dTSldJwCYpnL3+IoEtmmu0eWF94DS9ZuKEy75KBAM4pDF4Sadf7hTb+3lG
         S9QDtfu1yfnCSHGszGyJOgpcn/3kbVjws2kbw0UD7qVP0CbuMFWTeVgUlu/wiiUSezCO
         WMXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="d/DO9P2f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si3502696otq.75.2021.05.13.09.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 09:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="d/DO9P2f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhEdR-00025K-52
	for alex.bennee@linaro.org; Thu, 13 May 2021 12:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEN3-0002RF-65
 for qemu-arm@nongnu.org; Thu, 13 May 2021 12:39:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEMz-0000s9-6J
 for qemu-arm@nongnu.org; Thu, 13 May 2021 12:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/ktmwgutY2Wn0xDD9O8rw5tOPYKtHCv9CNEw553h8k=;
 b=d/DO9P2fmPou3lBdHbgfVpmNjLZhTVCbReUH4GJl9Au65PDtlfbpYhSR/v6VNhFGEb3dRY
 tcONINlzGfgEGAejQ2IN/QSj/yxdMXZUNhuTc84uEJggfS8zwWOXzzVQ2Zlr/HfxxPbUDS
 ykkevBxfLyxOPbDTyWpgY50lsXxkhxY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-ep975oM2M7CGoP0nPonlOQ-1; Thu, 13 May 2021 12:39:25 -0400
X-MC-Unique: ep975oM2M7CGoP0nPonlOQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 n6-20020a0564020606b029038cdc241890so1427283edv.20
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 09:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y/ktmwgutY2Wn0xDD9O8rw5tOPYKtHCv9CNEw553h8k=;
 b=L+LQT1/0H+BzKLDhuuwmaJJpt1FFabqmUogMZwKQDCkIEM+4Ki65sykmz+G56I72ym
 UN1wWxI2ew+TJHxNtwFdKUUar2+akYBOAU4nYzsJEP9clwvUHJ5YowonUVZMgRy5SEUk
 W9KHlKDc/5vJxIunEaTTj1C7CTsg+JJzYd6dzMajF1f6EwoNwuMirD/r6cXy9dT8PXyB
 FwQrGCsvoa1eA8fmIhXQthcW96Mk++bqljSty0PQKpLD4xVXHqeqANOd66JnYKgDXfYa
 txdlpOTduk3TnmQ2ExpYd005bCihoqZ/jbMhjfxekkLdoBS5Yg1NGmi595t07HmeddYp
 oZjQ==
X-Gm-Message-State: AOAM533VQvqHDahTdTpnw5HZuBqyjxTxu0Ogh9TdYCCuxV2NYOcRULpg
 Ln21+64LDL5f5Vlc4sl9wDbyYiF3Cbquh4TDwMuJdf97FsUsLkHloZC0gmNSOM/or3CFf+OJJLO
 zFP2V113z/2Go
X-Received: by 2002:aa7:c150:: with SMTP id r16mr50496721edp.82.1620923964296; 
 Thu, 13 May 2021 09:39:24 -0700 (PDT)
X-Received: by 2002:aa7:c150:: with SMTP id r16mr50496711edp.82.1620923964198; 
 Thu, 13 May 2021 09:39:24 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x13sm1511947ejs.93.2021.05.13.09.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25
Date: Thu, 13 May 2021 18:38:53 +0200
Message-Id: <20210513163858.3928976-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K1FaJJKlzxC2

Commit bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
added a dependency on the TYPE_IMX_USDHC model, but forgot to add
the Kconfig selector. Fix that to solve when built stand-alone:

  $ qemu-system-arm -M imx25-pdk
  qemu-system-arm: missing object type 'imx-usdhc'
  Aborted (core dumped)

Fixes: bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 5827c092b28..6bb34926bb5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -386,6 +386,7 @@ config FSL_IMX25
     select IMX_FEC
     select IMX_I2C
     select WDT_IMX2
+    select SDHCI
 
 config FSL_IMX31
     bool
-- 
2.26.3

