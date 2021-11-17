Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp262375lfk;
        Tue, 16 Nov 2021 22:59:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCcekJJyJsHY6kLFgV7iFyI9On80KkCNeKpWNjoG0Rf23efRYaHkNepQdkc2IPVgVgDR9k
X-Received: by 2002:a67:1ac1:: with SMTP id a184mr61665848vsa.22.1637132370160;
        Tue, 16 Nov 2021 22:59:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637132370; cv=none;
        d=google.com; s=arc-20160816;
        b=lc8d1RO+0KhN9Jk9gjHRGwmgK0on122AF3gYmhUhQpptmnKU3SH7VHtWbstwbvaV8C
         O0KJkl1DHd7mVodKtb9D2uFnbIavaAkoqyajViZHScd+KDZZdy37E56USc6+4pSbYhRp
         9PgKyXnpnIUDXSVUxkNyd1A+rFIfebpzGX9WpTKkjBB/D7tZj2Jb0L/3TTa3FnvuLSya
         AIUpygSCV9C1TQVU9SF7FCfOgag/0acYP4UPvt+0tXLK6pb2I1uBQlcaYpJZt3HTwLdo
         GI7yPc4G3u4i0lLEXERI9kJ2Koi21orNDLXoeCDn0uz7mjBZSrmY41BZJAjmxuGqXcQd
         gSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Rm42Lk94YomucCdJ+zK88nEj8TVK864syUAadVvPAHg=;
        b=VhEV91zi5xRhya32BfiUC7Nqpw6od1EHPRGNtMYScQkNaIHpY/jjt2Wu0IXFUX/bZS
         xws1XE95dSksGDhPzfOfyYCaHm6m3z1dyqaZzz0Sj7n7kbx/NR3KeFHgA7JQuQtaUV/m
         z9/Uu8ufUnXG67cU26v+N7tC+iyKpZjzYi7HS4YFCG+tD/MJkj+Jn5B9bt7/+iO6LUQl
         vXrFZ1oanxYw4d3J93/DyvJDoWat04i5NJz4lmln0n5ir/CyUOKEi0HalxYt02bzn77L
         jNjnwV54DOSlP5tC+IZs2qXDMEM5m4Tm4/4CIf3nihnJdfvOsjLINY+63+xHsVV5cf0x
         o+Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=OGWVeIT5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z30si30352913vsk.429.2021.11.16.22.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Nov 2021 22:59:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=OGWVeIT5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnEuj-0005gx-Rv
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 01:59:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtT-0004pA-4W; Wed, 17 Nov 2021 01:58:07 -0500
Received: from [2607:f8b0:4864:20::434] (port=35507
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtQ-0005aP-U9; Wed, 17 Nov 2021 01:58:06 -0500
Received: by mail-pf1-x434.google.com with SMTP id c4so1779548pfj.2;
 Tue, 16 Nov 2021 22:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rm42Lk94YomucCdJ+zK88nEj8TVK864syUAadVvPAHg=;
 b=OGWVeIT5FrMCKQSOE3hASEvw8yee3NPdXGIcyOwBzVdTnaGE5epV1iTPgDRr/TcjoT
 y1kkMxrnp4qJs9FeowDudtvFWSrzLvKUI1fnM8XT6pheKsXDB9y9fSHzRE1PcfKaHPI7
 VXR+U4Egyl0AH/nbURVDwCwpdYOHj0gHw3XrqSDZosV8W9XTtqBGaaJdMfVin09R96FM
 iyDECxTcPkvr8k9UUtAj/RAVshX0wLt0c/G1Q1vrp3Ic2pDXLNim6xtKj82dwKfgjPQU
 VrBOIhxKmPBKbrjxkqjS4NFE45cNs9CciJXpdpuPlphDWXfYXr7kNWi3qJk/Mulf22IW
 H8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Rm42Lk94YomucCdJ+zK88nEj8TVK864syUAadVvPAHg=;
 b=AJVS1TIiQ+q8+RxIX8MSzNQhjAwCWEgzbgwtL4BemCiOMBA58PwQ8/eGNFwv+BMkea
 /sEm1MLrXao56nDqN5XVz3qux+fKq+bsCRI2A2G4liw05Kn3tjRpuCa5poEJTA/hWHd+
 4Eemk3fvRmQIYbCLqL0AybEFV/OvYP3KXT5u4SuQy1mUx4gtZOBkxH1GfZU8dRZyiEaT
 EAw2JyDFjdAElCFkbOnqQMc3ow0hsbRfavRnsjmYDLAitqvrbt75wFLZiw94PeKbY6wB
 xHxWx7dZZCjTnBT2An8Pv9nZjxbw+V9kOecv2MvES1baFSA8XZLl5tbnGI4R2IkYwluV
 ujuA==
X-Gm-Message-State: AOAM531im33ucUUrp9RPssFeo0GfqmtYL/MXWws2tqdBLKZACKpb302v
 K+KnuZQuvS1AQGNI2973OS3GQYZJad4fRw2P
X-Received: by 2002:a65:40c2:: with SMTP id u2mr3595892pgp.309.1637132283392; 
 Tue, 16 Nov 2021 22:58:03 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id d13sm21914618pfu.196.2021.11.16.22.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 22:58:02 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/4] docs: aspeed: Add new boards
Date: Wed, 17 Nov 2021 14:57:49 +0800
Message-Id: <20211117065752.330632-2-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117065752.330632-1-joel@jms.id.au>
References: <20211117065752.330632-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +IPqnlntoT9B

Add X11, FP5280G2, G220A, Rainier and Fuji. Mention that Swift will be
removed in v7.0.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Add POWER10 to Rainier description
 - Include Fuji
 - Mention Swift to be removed
---
 docs/system/arm/aspeed.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index cec87e3743d0..41a9bd5608e8 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -14,6 +14,7 @@ AST2400 SoC based machines :
 
 - ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
 - ``quanta-q71l-bmc``      OpenBMC Quanta BMC
+- ``supermicrox11-bmc``    Supermicro X11 BMC
 
 AST2500 SoC based machines :
 
@@ -21,12 +22,16 @@ AST2500 SoC based machines :
 - ``romulus-bmc``          OpenPOWER Romulus POWER9 BMC
 - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
 - ``sonorapass-bmc``       OCP SonoraPass BMC
-- ``swift-bmc``            OpenPOWER Swift BMC POWER9
+- ``swift-bmc``            OpenPOWER Swift BMC POWER9 (to be removed in v7.0)
+- ``fp5280g2-bmc``         Inspur FP5280G2 BMC
+- ``g220a-bmc``            Bytedance G220A BMC
 
 AST2600 SoC based machines :
 
 - ``ast2600-evb``          Aspeed AST2600 Evaluation board (Cortex-A7)
 - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
+- ``rainier-bmc``          IBM Rainier POWER10 BMC
+- ``fuji-bmc``             Facebook Fuji BMC
 
 Supported devices
 -----------------
-- 
2.33.0

