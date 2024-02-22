Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp218841eja;
        Thu, 22 Feb 2024 04:56:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVaV9pG7gYlH+UGoO4kPpARIhKU2Id0IWvt63iELQxW6L+cbPHXcKgXE7E4DVsd8+2G3U4lrK8+FH6fz9CUhovoDET+ZZ97
X-Google-Smtp-Source: AGHT+IE3obXzPgWfckVD7TvIQU31BBUE+yDg+efMy9ndnSvxZ1tQ86kEz/xJekuFOsYkBk0WXR3q
X-Received: by 2002:a0c:e34b:0:b0:68f:301b:5483 with SMTP id a11-20020a0ce34b000000b0068f301b5483mr10602587qvm.6.1708606574635;
        Thu, 22 Feb 2024 04:56:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708606574; cv=none;
        d=google.com; s=arc-20160816;
        b=Yx8kle1WxqNTz2hCTWuuC+0BXj2LzkSRUHmA87F5Flg2KED0goYXOwhOaI6YsJp2dF
         iokoUt5PCjZVVaRvGbKNiVkUbNeztp20To0Kmq5KUiC1JCBTta/TW4kzSbKaPLai+1p9
         Eyhse5n1qsiSVRaiSBWOeQwU58ALexQ2nFzREZOmcGIrEKERm8XURA3uUp0O62ZNw7xM
         Sx4lr3nsk2KVq5E258RNyxC6QIs2yKZO/oCn1N42489rzDlFXBhTa0c2okJybXmQHqli
         ftTVwjCCXtaP29qCsBeAEAtGryrzOoQXj8dyEx5OW82EDYVeOuqva/g1G1EQ1QHPknRq
         B5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=haz8xWPEOIi2z03nhQKaHcW8uQbVkLIuqEbGOCYseVA=;
        fh=rwE/3c8FrVs6d2PUrqFaxBQJP/12gSZFBtjL8cgYC48=;
        b=kCE9TTDqHXo/UegvEOMaH6jSxmz8c88GGDPTLyZldjecml/mFUgkgGAGJdq8nse6su
         Zxsh2NETnQqWiRM+bskCIw2SNWnzfmMPI3zVjdW2Uzqrr85FEkz/nAYaBgpmkFapq0Ic
         Vc2C53DgwEfvLJ0JG4gESVdaoqbesKdwOYLvFf8HC5kMRK18tIQKud0LJGgPavvuSclh
         UEoExOe9HsThUn46hEdETMxxiEyHcRim0Y7wOZn6UQysyJirhlXTOOaue/y+R6OGXyYH
         Vn4oQt0yvBp04Zl0T3k0WUTXI3p+jG93ETh1YalKtIZAvxK2BYWG0q/XPXA7V95SExC5
         /JVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JPxg0jzh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf12-20020a056214250c00b0068cb9532d74si12574102qvb.330.2024.02.22.04.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 04:56:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JPxg0jzh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd8cN-0006Dx-1z; Thu, 22 Feb 2024 07:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8cC-00066h-TF
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 07:55:54 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8cB-00053D-9a
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 07:55:52 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41274cada64so14117115e9.1
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 04:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708606550; x=1709211350; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=haz8xWPEOIi2z03nhQKaHcW8uQbVkLIuqEbGOCYseVA=;
 b=JPxg0jzhI9/K6/rPTOvkP0+Ah1sEWIgSt2xOIm3ww73x8I7SsEDR7cOz22aqS073HV
 h28IaWaRSRHJW5iaw8PLKC+yJG9FIMSZMfVonPZ7dmHhT//GYkWobl2oCjdOIDJBt69A
 lTt30vrxUgGAE43JMQnP3E5o8LnwY4KR3fQSkzNWPkyIoJ3pS11gSTrOCP5ZioY5yowm
 ir063k0+5gC8bjfNdgLHPnA1lO2oujLw97GwOI3YLAlgUopB56mRXFIEN06UbZhkrw8W
 QHJHhhJqiy6WWMJA+bBsqhsRZM3Oz3rg2WKZAJVpsjRtSv3oYPnzdXj8mr80FSeN0LHv
 5NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708606550; x=1709211350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=haz8xWPEOIi2z03nhQKaHcW8uQbVkLIuqEbGOCYseVA=;
 b=mE9i4WbLlXWnf6VoDoSC6e0VyrLPdYPMI+DiFC/I44891qSgkUvpHBRIfR7YAKxg3l
 ssAuf0OX14t1ayUGDbnnKpUUSmQTRYqK5CIN9NIDBqxx1kUObDXhhrXUonehqettj6SP
 Lgu74HU5J+b0BFXi7vSNUsDtxV0RmUqJp6FIbXfgI0W32qXb+MS4IsXtfkQ5UmLSvJof
 B//kj6lpqDJZ3u+w3IxkmDJjpkaP+S8mf2yY6F2dd0KItWBf1Dy80fDM6LHEZTCWKOY9
 jqtIdLuq4Wk7YKqrvkqRWsPGHHROxIDc0/vvNA4y+n+DcpxKabN0vAStbPMPVZsHO9d2
 YoIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuru26EssKtaQ2HCujpfFyUER+/vgFcR4y2KIMTFth6AwqaxinUwpqIggtXG+LV1R8Oy3LlA5A2DWC9DLoCRcqf8Vr
X-Gm-Message-State: AOJu0YwflS+q81hWV3pNfL1wfXX2ctTeSSmED88GSVh3v8/Hp7FI5r95
 q4t2NIJCUqgdi0UKWqkWUXiBDAwQK3ZdCxSymV0emJsJw8/DRB6uBlbvWBbooO4=
X-Received: by 2002:a05:600c:1384:b0:410:c128:2bed with SMTP id
 u4-20020a05600c138400b00410c1282bedmr16176314wmf.20.1708606549802; 
 Thu, 22 Feb 2024 04:55:49 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a05600c21ce00b00412704a0e4asm5983207wmj.2.2024.02.22.04.55.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Feb 2024 04:55:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>
Subject: [PULL 22/32] hw/acpi: Include missing 'qapi/qapi-types-acpi.h'
 generated header
Date: Thu, 22 Feb 2024 13:55:13 +0100
Message-ID: <20240222125517.67131-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222125517.67131-1-philmd@linaro.org>
References: <20240222125517.67131-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: 5VdI/MeNVBrL

ACPIOSTInfo is a QAPI generated structure:

  $ git grep -w ACPIOSTInfo
  qapi/acpi.json:81:# @ACPIOSTInfo:
  qapi/acpi.json:99:{ 'struct': 'ACPIOSTInfo',
  qapi/acpi.json:109:# Return a list of ACPIOSTInfo for devices that support status

Include the "qapi/qapi-types-acpi.h" header to avoid the following
errors when including "hw/acpi/cpu.h" or "hw/acpi/memory_hotplug.h"
elsewhere:

  include/hw/acpi/cpu.h:67:52: error: unknown type name 'ACPIOSTInfoList'
  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list);
                                                     ^
  include/hw/acpi/memory_hotplug.h:51:55: error: unknown type name 'ACPIOSTInfoList'
  void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***list);
                                                        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20240219141412.71418-2-philmd@linaro.org>
---
 include/hw/acpi/cpu.h            | 1 +
 include/hw/acpi/memory_hotplug.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index bc901660fb..e011d01adf 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -12,6 +12,7 @@
 #ifndef ACPI_CPU_H
 #define ACPI_CPU_H
 
+#include "qapi/qapi-types-acpi.h"
 #include "hw/qdev-core.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
diff --git a/include/hw/acpi/memory_hotplug.h b/include/hw/acpi/memory_hotplug.h
index dfe9cf3fde..38841d7b06 100644
--- a/include/hw/acpi/memory_hotplug.h
+++ b/include/hw/acpi/memory_hotplug.h
@@ -1,6 +1,7 @@
 #ifndef QEMU_HW_ACPI_MEMORY_HOTPLUG_H
 #define QEMU_HW_ACPI_MEMORY_HOTPLUG_H
 
+#include "qapi/qapi-types-acpi.h"
 #include "hw/qdev-core.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
-- 
2.41.0

