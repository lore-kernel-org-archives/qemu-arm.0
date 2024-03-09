Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp367833ejc;
        Sat, 9 Mar 2024 11:23:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWeAhod4QvkpiXoli/H17IwsEknKyNaccxuryi0ktij76jvhwPXZvhLASBYXZjCI9ad8Ko22Hf8ht+tg54kgJjeoC9IaBjB
X-Google-Smtp-Source: AGHT+IFWRMGRR0cbf3cn5pzYTGIt08BF0b4olWDumFRP1QMJMQbLn5YjQNtlipqJqQWHZxxtjc1p
X-Received: by 2002:a05:6214:1082:b0:690:c4a2:e4ae with SMTP id o2-20020a056214108200b00690c4a2e4aemr1796469qvr.36.1710012203393;
        Sat, 09 Mar 2024 11:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012203; cv=none;
        d=google.com; s=arc-20160816;
        b=xP9ZbkpdpbBMeRG43DRC7IVcOmh24UB3NgtkeojyI3zKVuiEOlwLCsE6SKt2myeKot
         72yszQt1eKSSmwUZlJwsOgG2k9F6nHxVUJ9gYn+Y5pC3Sno/TtAExiug46GOjeFrN4My
         f2ZBLTCgj4no3N0Km2zEQWT3fgRsp2mmaariLzyMlSBk2dE6tfPlG66N7ruxvdJ3CAnS
         cu7upO1AMBD3elReetKPF8/zSjB+6w6ZnaOuzp9XQnCzsyiXIjzxWgIHfSRVRe4NRUk3
         FvHfWNMZn9Ni/e4+fYV0fXjwSr5RIVdGG4Hml7kCZhkH1FYfy94dKnIYs3ek/aApw5/h
         jbxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dvPLYlBQAWmf1NvUY3LgRzjhJOxAzzfQLYDmKAk6+Eg=;
        fh=GHxwhM/E1iHLCnHYuxYD8cc5lsiX6dIKwfF5XX++GZs=;
        b=OpNtnRSi/48GAtL2ZNoQ9rLO9U8tohViX0pvDQQwFIeWhE6XtW5TiURrKy+9yoZEb5
         vC9c6wLGbG948a63Xc2jBUcSfYsSK5O6SWcpXZFyR+SsSh9glI07gG+s2e6w65TEz8fc
         NlwTCvwwyLkd6oHPZg2lw0puJOs3hsZGwcAwSXJR/MQOyem524FEwEVVazJGMn76RAcZ
         Ak+28uEAMAttB8+VueWJC0cba09oYhzrGiQmkeVxiHxAxct7To4kKfotsL88qdv0DBty
         0IgygZcoHHS26RHyKasxc97VO9NOKOklNeilyv96W/mVQElEXwyDF0HXCv/Nd76Ri46j
         nkgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDPoWynI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a0562140d0300b00690ab4beb40si2059313qvh.287.2024.03.09.11.23.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:23:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDPoWynI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2HS-0000IR-33; Sat, 09 Mar 2024 14:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2HQ-0000Hr-5t
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:22:48 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2HO-0002UK-Al
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:22:47 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a45b6fcd5e8so397189466b.1
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012165; x=1710616965; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dvPLYlBQAWmf1NvUY3LgRzjhJOxAzzfQLYDmKAk6+Eg=;
 b=uDPoWynIu2dvzNt3Ckd9UUX7TWwWMjKS5raMiqoWEz+PbBQJhFDo7WwtXUI6CdYlt8
 gZ39MX/Yvedvd8FgIbGYtlt7KxB8Z0uV7I1pph3F4mv1Tx3lNwZmgO7NLSG0L5l9y6dj
 6x+VMRCRdD3Ew7kx9Zll3o3qS2qtalPXpu5kD8e10HuGg/tgdPpYLIyTdDEKdEi4DBIg
 nB50eprbzaaIQp5tpddjTOpJxveydBA0zsJqstwSbfMq2SONQ0HZN+/7c6FyWNlWy50P
 mNqfmIFp+hOzPSEuqdPPPUy/qZ8aqmZ/B2WUhEmO65Z+vZxduzgjS9NWoKhLxSTgaYoy
 WONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012165; x=1710616965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dvPLYlBQAWmf1NvUY3LgRzjhJOxAzzfQLYDmKAk6+Eg=;
 b=Yp0PCiKgX2aZT5Kwyjn5S1xlXnTapslWbjQXbyuju23EmX93+I1KOHwHOGGM0pWMHu
 E+lBx9eVO5uM5TfMsjynUaIWTvLjaEHIjJu7kbBzx2v7xqkB+89jA11adtsJCnH6b30P
 fjbgjzHvUyas9Ta1s8mWWY0YO2gD+DP5yXFbhAHyylzLF6F/zvaV2/TUkk5FYYk3O8il
 zUxFvYyeAIMT3cXoKIHIST/oUDD3VPnB0gO/kAqBrspeQAayM1OQ7CxdvUCdCb1e5ecJ
 184b4LlEK0Uqp0ro55edK0wpZpiZU8tb8Z3nlTnIXSOpLPoJoMFRTH4fRDpi7f+Xo8S9
 GJXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDslwBCKiUNHvQUftDgc1J/r9usglK8+WnvIpU8EGejPbg4fmkIynxgNA6dYbxeGcFKABmI5HdZptk/yXY+FsyAhAC
X-Gm-Message-State: AOJu0Ywx6f8B6scAXw0I6bwRXgRGkB+XuB6KzMlm6y/OytX2SMl/7i1s
 P2p2mgykeG2i+oIm2S8C9q4E7kTtIJ90Ez3+6WZPPl49GJXvamXRdv3Zakbz1QejKhu85q4L5Fb
 y
X-Received: by 2002:a17:906:c2d2:b0:a43:f22e:57a6 with SMTP id
 ch18-20020a170906c2d200b00a43f22e57a6mr1137454ejb.67.1710012164856; 
 Sat, 09 Mar 2024 11:22:44 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a1709062e9700b00a44cf710cc3sm1170300eji.182.2024.03.09.11.22.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:22:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 05/43] hw/pci/msi: Restrict xen_is_pirq_msi() call to Xen
Date: Sat,  9 Mar 2024 20:21:32 +0100
Message-ID: <20240309192213.23420-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: ibf5V7VZ53Kb

Similarly to the restriction in hw/pci/msix.c (see commit
e1e4bf2252 "msix: fix msix_vector_masked"), restrict the
xen_is_pirq_msi() call in msi_is_masked() to Xen.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20231114143816.71079-7-philmd@linaro.org>
---
 hw/pci/msi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 041b0bdbec..8104ac1d91 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -23,6 +23,7 @@
 #include "hw/xen/xen.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
+#include "sysemu/xen.h"
 
 #include "hw/i386/kvm/xen_evtchn.h"
 
@@ -308,7 +309,7 @@ bool msi_is_masked(const PCIDevice *dev, unsigned int vector)
     }
 
     data = pci_get_word(dev->config + msi_data_off(dev, msi64bit));
-    if (xen_is_pirq_msi(data)) {
+    if (xen_enabled() && xen_is_pirq_msi(data)) {
         return false;
     }
 
-- 
2.41.0

