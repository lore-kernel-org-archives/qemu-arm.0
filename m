Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2511490lfb;
        Sat, 24 Apr 2021 15:22:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFFl11kGVtfC+XM94zVfCByXOjLRCB/Sxw2+c28VZwFK3SmQkl505s0zzpeDoNy3HPSSxa
X-Received: by 2002:a05:6e02:1aa9:: with SMTP id l9mr8078315ilv.24.1619302934323;
        Sat, 24 Apr 2021 15:22:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619302934; cv=none;
        d=google.com; s=arc-20160816;
        b=ywnggPtjKqb3fTc7tpnF2stQ4QFHcjfUirCr0LmyXxhI093kouAiY8t88CqQaqPiD6
         RrB+dXT4an4MqqwttNGPpULwBySWRNJ877U4LwoYEnsji9xc/mttaJq5uTNFR5B5SkOx
         zUdNSPrsBxUrXRE4hZXO4tMTI3oftE1JmnOcbn4l48eBFclpMqMY8OvLqY1+l5jykgdi
         8knvPBMY3+huxxbywBcCFRPOswOKkWr/3+otXE93wmWzwE2io0xr99b2FLYVn0hUbKNp
         ee7ohdTqXEThdethFx7qy6Rj3a5aChyK9iU6O3Ej/elpXIwbldfzBqFNyanSK+nRulZx
         cQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zCT/SHnefV0/WewoQZfYQ3rl24KSltJDmq9hxULcAdA=;
        b=cKD+PG2qp2FDTFBnhwcw3lGvdmOduCw2u1RvhLa2Cy/loecNOYPtpvvZlk02YfHhkx
         QI6xpdmfNR8ELZKqbPRqBYzlyWIqlYRLYZQfSdXtMX/3JW+ZtrSJv7XuQk9qTMb+ikaL
         lejwIiQR2jif0luP3tBCmRy1yKAkn6JKz3SQ45peoVvi9MoqKSPKoL2pkawkUm9q9HSu
         iu7dZuOectcx7C/b0tTJ31LzZrUFKADB27ImrTAcoLY3R5ry+VrH3f9rEwaAz5oCxk+T
         XuQUoqTwqZruYRrcjukTx8RVge4xADhDRPqid1w6g9mBt4DKTwss8R5v8QPuTMd7ISCI
         qNew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OcmagiUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si12963791jat.7.2021.04.24.15.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Apr 2021 15:22:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OcmagiUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1laQfF-0001rZ-GL
	for alex.bennee@linaro.org; Sat, 24 Apr 2021 18:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQeD-00016F-FR; Sat, 24 Apr 2021 18:21:10 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQeC-0005gU-0R; Sat, 24 Apr 2021 18:21:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id c4so13058422wrt.8;
 Sat, 24 Apr 2021 15:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zCT/SHnefV0/WewoQZfYQ3rl24KSltJDmq9hxULcAdA=;
 b=OcmagiUk4rf7IxKwQk9YEl9+o5cbpsz9aBuEdVIMeIHT54DLkRvxnuNyCcrnE+I3n4
 rfn0yXhiasbJ8bHgTHGDvFMOpKtZesPXV7+iwuAx75ZGsNggqqnq4qW8iV2iYZzNS4oU
 Cyv3h4Y1MKJp159B/0oSj6m3oD6F3XWTiowtivvVaNSMsu0S1emkRHt0JKJzXAlaHD1j
 +g7ylSJk1qk06HdG52AuZtaXe/ftZr/1vKpbjTL6WAhM9rVhBu6UPRU2TkGqxZaxVT+i
 TDCFe/X9ye3oKWVC2yOJEcWwTFeFiaI9sgWcBqpG2zONmAV0ctGvEzKTzHNA1TLdShb4
 uamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zCT/SHnefV0/WewoQZfYQ3rl24KSltJDmq9hxULcAdA=;
 b=fh1z2vQNlhc0Keo4mpoEcoS2tPMAwF8JQ2yI0jn8DFiBcg6lTmdwS5OvM4wyka1AFC
 CQe2pO1sWe8a+sLbG0yFIAt7O/RP5uxybXZLhYPqTpOTieHLgO6ldAyXAGUTA+t4mMhF
 jGGD6nFC/tFhwyfkpK1ItxIaFCFxN2OCOHc2LwHsW1wUXW8p07tSxuA7wG5LOTL/zCiv
 OyvdKkvqgBZK/2Abe+XYz4m/LRShKydsTYMEGMH5T/yNPBb+2liSO7U8w4Xa3YRxcmRJ
 61RwlW0FQB4wseI50FcdK3VRX3Y0kYzkHzPdJGYFv/63mANjCd4ZJfBduQYs+g39hUOw
 rRsw==
X-Gm-Message-State: AOAM530MSlAWCcf9MVAugS83pWhrJ7yjdL7l7a58STtri3Mlo5S6IgYD
 MT5CEvktkSD/Ewr4V+ZhMDiopAMftmbnGA==
X-Received: by 2002:a5d:564b:: with SMTP id j11mr13395325wrw.307.1619302865407; 
 Sat, 24 Apr 2021 15:21:05 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a142sm15116876wmd.7.2021.04.24.15.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 15:21:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/arm/pxa2xx: Declare PCMCIA bus with Kconfig
Date: Sun, 25 Apr 2021 00:20:55 +0200
Message-Id: <20210424222057.3434459-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424222057.3434459-1-f4bug@amsat.org>
References: <20210424222057.3434459-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Miroslav Rezanina <mrezanin@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iFwvp08xf0NE

The Intel XScale PXA chipsets provide a PCMCIA controller,
which expose a PCMCIA (IDE) bus. Express this dependency using
the Kconfig 'select' expression.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8c37cf00da7..b887f6a5b17 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -142,6 +142,7 @@ config PXA2XX
     select SD
     select SSI
     select USB_OHCI
+    select PCMCIA
 
 config GUMSTIX
     bool
-- 
2.26.3

