Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp322940lfb;
        Fri, 7 Jan 2022 10:57:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyD7+j7EgrgtdaZivNtW68chsKJIKQ1Xum8NlQd/anh25cnWmXwv8yoSsveRCBT2F468/hx
X-Received: by 2002:a25:8c4:: with SMTP id 187mr32145627ybi.245.1641581849644;
        Fri, 07 Jan 2022 10:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641581849; cv=none;
        d=google.com; s=arc-20160816;
        b=hFe28imBM3QDFckPzHZsoEeMx+OdNdB/8ufmxczkeKTJPJyFX7cnq04QLWeDmYEhz4
         fC1x84GprlZ0V650k6+g1j+LqqTvgmBBRZGGmFqgLiC0DK/+l5iNZ7h0ULCvM0ltTRAc
         VDM94eUdmULbqiPyOXjSSjPJWP0ifs7xP1ba23/x25BUu3L5vuEm486kA2KblTHWm+uY
         tYqM/cW9lQx8wTB5Cyxmr4/+LTxL1pkvmbVmFISdWztF2Db8q+C9cteJoyrBpdJtni1p
         ZVi6kX1fpw8ozwGX2x+obezxl762C3wcfwJt+YRBn+VHPAUf6cv6L4rX7CpKdHyQMmSX
         wu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NPnPA9g/AWJ0+WUMg3ngrXHqBt6v4p6Ae8wOIVjeVbs=;
        b=F5keVM/tlj0iF0Xiqq9pdk+kXm/PrwZGr2v6LHCRVPkwD0nD+wZeUSEfKDQKUHAkH4
         rWSUKvZSOsQ3EDH1t1pS3GeFxCY48mhid6hleBP5RuErQWl+o0QtcbqDKwZHFm0rMmch
         K+ZgB8A9SjP8d0kQ3HairnsLWvvHRgmpogXARYbEQBjMhzlE2CQZ/FhtItj18/tOXjyW
         DsCcVBl76aCncfInPgKFdV8TDt8rY8M8wnN+Mq4nz8Z6l67GwA6ijiIiPTJ1vcthmypg
         uEgcL908xRND0BrQLqDdYp1WPcEXsqFjdQtEuOdLILU/MQxhH6m9dbCuKBHHIEYBdRKG
         +KDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=RYZpE8UV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si4589430ybg.291.2022.01.07.10.57.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 10:57:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=RYZpE8UV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5uQb-0005uL-2I
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 13:57:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5uET-0005RB-BW; Fri, 07 Jan 2022 13:44:57 -0500
Received: from [2a00:1450:4864:20::32c] (port=39739
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5uEH-0004nE-0y; Fri, 07 Jan 2022 13:44:50 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 x18-20020a7bc212000000b00347cc83ec07so1138690wmi.4; 
 Fri, 07 Jan 2022 10:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPnPA9g/AWJ0+WUMg3ngrXHqBt6v4p6Ae8wOIVjeVbs=;
 b=RYZpE8UV5jzUInuFvtdYEh3PRChb5KFgX6Kwq1YdHylcj8NE+kancsqCvQUGrlGjhC
 4TmZCbH22vn9091tYMHLORp2MJ9mHYmU+XPuY8312gRYRbocQ976QJfAJ8J2WPOL/rxV
 vucUmj4HHHDuIMT8C55ckZIAZKGGZpaA9KZVsEygYt9gIrN7GlmWlWnDemNCfTGNdv9D
 +D49k1EHLrXjuKJ1wHkERKuYuQMiVWK/CbEk02UcpS+zg1yFjdQ8OZCmn5md1JRvfonk
 HO1/r8yJli8OhNWB2Fmsze3fxP4FpFOJf24lWJ72+ha4XE6QsO7PCnHGDwC3CDWwwpyn
 zLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NPnPA9g/AWJ0+WUMg3ngrXHqBt6v4p6Ae8wOIVjeVbs=;
 b=KPgDAtZtNpe9grUkWtvP4q3OhiFwg0i/DgmjIkIOpIj7gCkgBcdF862wH/emySQQhY
 chxHuBrSVOz3Tx0cdA14GN4UuLjsDJ0mhL3pXAgGYRbqkxSyqpSAkc0gFpELwU4ZJp2/
 j8NOpCc+hZ3Ce/NIPEN4z70RRBsOGfo4a0f00pAaUxcdsxrLuebnjNohiIHnPrGxyhgc
 N08Aqe/YNd3ffv6i91QRr14mVLJ3bTA7PASLm79GEywtEuObNqCXFPSF9u7Pubvh8lZF
 /koSSWvcMzf1w+jc8BJPfveVl5wWs3r5WluHisEqnT1rfx+BWUx5bDSfHQIBxhLjYX29
 T08A==
X-Gm-Message-State: AOAM532+5lqJZSY8pZyhiBR6FAgCxQAWnUMDl+9VN7flLqPn3x0ekAHW
 Z6icYKGT/sUnadRE+Gytwcl5XtbqyaO6gA==
X-Received: by 2002:a05:600c:1f19:: with SMTP id
 bd25mr12130573wmb.42.1641581081071; 
 Fri, 07 Jan 2022 10:44:41 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id c16sm3142522wrp.109.2022.01.07.10.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:44:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] hw/arm/musicpal: Fix coding style of code related to
 MV88W8618 device
Date: Fri,  7 Jan 2022 19:44:28 +0100
Message-Id: <20220107184429.423572-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107184429.423572-1-f4bug@amsat.org>
References: <20220107184429.423572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DXBivuzU2ddk

We are going to move this code, so fix its style first to avoid:

  ERROR: spaces required around that '/' (ctx:VxV)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/musicpal.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 2680ec55b5a..1291eb98aba 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -310,13 +310,13 @@ static uint64_t mv88w8618_eth_read(void *opaque, hwaddr offset,
         return s->imr;
 
     case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
-        return s->frx_queue[(offset - MP_ETH_FRDP0)/4];
+        return s->frx_queue[(offset - MP_ETH_FRDP0) / 4];
 
     case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
-        return s->rx_queue[(offset - MP_ETH_CRDP0)/4];
+        return s->rx_queue[(offset - MP_ETH_CRDP0) / 4];
 
     case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
-        return s->tx_queue[(offset - MP_ETH_CTDP0)/4];
+        return s->tx_queue[(offset - MP_ETH_CTDP0) / 4];
 
     default:
         return 0;
@@ -361,16 +361,16 @@ static void mv88w8618_eth_write(void *opaque, hwaddr offset,
         break;
 
     case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
-        s->frx_queue[(offset - MP_ETH_FRDP0)/4] = value;
+        s->frx_queue[(offset - MP_ETH_FRDP0) / 4] = value;
         break;
 
     case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
-        s->rx_queue[(offset - MP_ETH_CRDP0)/4] =
-            s->cur_rx[(offset - MP_ETH_CRDP0)/4] = value;
+        s->rx_queue[(offset - MP_ETH_CRDP0) / 4] =
+            s->cur_rx[(offset - MP_ETH_CRDP0) / 4] = value;
         break;
 
     case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
-        s->tx_queue[(offset - MP_ETH_CTDP0)/4] = value;
+        s->tx_queue[(offset - MP_ETH_CTDP0) / 4] = value;
         break;
     }
 }
-- 
2.33.1

