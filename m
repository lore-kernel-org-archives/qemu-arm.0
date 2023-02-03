Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1298233ejb;
        Fri, 3 Feb 2023 03:38:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/KYPSmzQiUPVkTqgdYNAxwqVmox1Kq/W5yNLji8ZKpqbCEAEG5d9D8P8baaLNd8hjJO4N4
X-Received: by 2002:a05:6214:5292:b0:568:ff6b:f5bd with SMTP id kj18-20020a056214529200b00568ff6bf5bdmr2114796qvb.45.1675424311086;
        Fri, 03 Feb 2023 03:38:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675424311; cv=none;
        d=google.com; s=arc-20160816;
        b=If7U7hDf0JFcXP70/GGcXd87cdD72DlNQq+pQgT51ryogOh3RJZ4Gv4hLIJW7HJYXR
         hTyyflrfZnydLOoAmXlN5w+y3IJLLDCAvHIDtk9J2TM1JfpVIF5DWZ7sdduNHxH+Nyi6
         GsG4jbBS0jQ5TGru6CaxaoaUygU0HrBg4yI+vxWSLGWonxeSsSk1cbt0g1jjHWT1iG6B
         3gmIYMB3eMV8JrGq7eWZpIrW+BlqQcxnCyv19q8NWqJ35DQwJ3mZcdcD3VTr0bMp+LnX
         91BD1RsP2vZARFlA122BS+2xvWjjr1oiTmcZBnJakVW0xOgJrBtKxELLWELKHwv7+kh9
         y6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xiDeXbO3Wi4lEH6eghooUNVxGrmUdWjhAaUA++lBEzM=;
        b=CeKwkz0xyj9wddupwB/F2MSrFPL/ul6ZLaE3f8c9h5N8jsPvC8rPu0ZEttK9eufN3Y
         zgsbamSQXOIE6hTurvA4zFMiV6f7YzAJXSghYt3PBKCT3nfLuDsfrRXkTZJx1giuggZz
         oeiD1LauJwLmoGTEWBubjLZJl6/4xKnnqR+aAOb0X73IrJWPVm+JPlJARxaTU1c5wmSk
         qriqqCJObjWlxipvYmm2XdiQtCOej+PQLG8wMsSbBs8ea09C5tgXV99zl9tKPSjqHfEM
         5pgaT3+/NUjLKxpiyjsONuKnZXt99/N/JxS0xw0vYlyZuB6i4gyUdDrCcH9dm+UPy6yB
         cinA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ff+VGQZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5-20020a056214194500b004c6afe7a970si1816529qvk.477.2023.02.03.03.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 03:38:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ff+VGQZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNuNc-00088X-Np; Fri, 03 Feb 2023 06:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNb-00088L-Ho
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 06:37:19 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNa-0001EF-25
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 06:37:19 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so5808110wmb.2
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 03:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xiDeXbO3Wi4lEH6eghooUNVxGrmUdWjhAaUA++lBEzM=;
 b=ff+VGQZQ13YwSMQ+FoXRoribBtneMRHw6VroiUCYdcwqAwNSnbwWhZV6Lmx+WDWmTy
 KXsqFBuN8RMKNffCIbIlYtmzAqp0DSDJ73+YZSTlnlNTzTc47a074mnEasMqqc8Uh2u7
 xQHxcP49kGASgBAfeKyrKxM5WJGYC7gmy6eOXenBSWPDBui2Mq372LHf7w1wbxogwIHL
 8yIRWGG3QwPeUFlmeMCFoltogKKdhFPlOUBEsxHj7a3pCk3JlQTnK16NSrwpEjT+gAQv
 QQtviELZxF0kI8mtv5C4Vex+kIj/WWknpn9vKF/zKLmAYcDWv1DrTeDXkkpEe3sZdZIV
 kKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xiDeXbO3Wi4lEH6eghooUNVxGrmUdWjhAaUA++lBEzM=;
 b=Qhln3eByO1voMZokKq987uMKU/e8EsYaOzR2ourYyUzkFjxUfzQp4RejKilY8snoty
 ZnTyHt4+zXtC9C98c6VI0WoMNClUrXzIyI+duLK1lkdLy/ST5XwfI+DoCmTyQ0V/k2tT
 sJ83MrcrNcRGeiVbb3aHvwlEgFZAORmm/VPg1v16N+szR+RYQu5ww8m+wFE+6cLmfDuo
 3mosynnyPlt6NruU1dZBd+iJNjMh94CotO+X/pClxVrbSP7I2GI6N6FFWWL+/dq+vFhS
 KM/PvrpdfCPpqDy07mScJHnuorpPZ4a/W1mBkfd2EW1+rssYc3VL1LfVRFh1VLAOBih+
 1Nag==
X-Gm-Message-State: AO0yUKXC0ePvZCbgxx4+NljMQaWjq7Q1/uYd/qIVVBFP+aOmM/hd65HA
 cpP8Qmxy3WQ+5gQ3eOklJamr3w==
X-Received: by 2002:a05:600c:4f46:b0:3dc:557f:6124 with SMTP id
 m6-20020a05600c4f4600b003dc557f6124mr9772875wmq.5.1675424237412; 
 Fri, 03 Feb 2023 03:37:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003dd1bd66e0dsm2772651wmo.3.2023.02.03.03.37.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 03:37:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 5/9] hw/usb/hcd-ohci: Include missing 'sysbus.h' header
Date: Fri,  3 Feb 2023 12:36:46 +0100
Message-Id: <20230203113650.78146-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203113650.78146-1-philmd@linaro.org>
References: <20230203113650.78146-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: GA9iGti0Di7K

Avoid when including "hw/usb/hcd-ohci.h":

  hw/usb/hcd-ohci.h:100:5: error: unknown type name 'SysBusDevice'
      SysBusDevice parent_obj;
      ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
index 11ac57058d..e5e6b434fd 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -21,6 +21,7 @@
 #ifndef HCD_OHCI_H
 #define HCD_OHCI_H
 
+#include "hw/sysbus.h"
 #include "sysemu/dma.h"
 #include "hw/usb.h"
 #include "qom/object.h"
-- 
2.38.1

