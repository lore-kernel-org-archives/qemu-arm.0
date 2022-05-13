Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp280052lfj;
        Fri, 13 May 2022 06:14:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsq+eMQF/NdSFo0+p0vL+Db3KXN4qBouTVZAg9eHc1+Wkp8bSaCOJDC4yX7FlUWWPj/wZ3
X-Received: by 2002:a05:620a:90d:b0:6a0:fab:dde8 with SMTP id v13-20020a05620a090d00b006a00fabdde8mr3628337qkv.330.1652447644501;
        Fri, 13 May 2022 06:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652447644; cv=none;
        d=google.com; s=arc-20160816;
        b=RVf5XFi0T4CYLvz975Z1vCqKIYQGUFE08YhQaV9hk42E4URfYl5TqOd4aTrh3ujcjK
         r2uQx+UfjQkvhUCY/KkVx/xOrBm5d0ZoLWsnIwEzDR3nZKEWjeGaWu5kdr74cWsPC5d5
         KKKOGrPWscyUo7MkDXxLTkgbDwL1vJkqb2d57N6+wznZepIpLv1XMgTIDCEhjNUoi9pE
         L4zWaOE7M7rL7743guwxjwD2Sf+afeJQTpxz4Fyi/WM8NhmBPaMcp9pNWMJ9oBsDu4H8
         2dGsQVV7LTFD3p/T+mEb9XMeYc/8qTqnQ46vjTwiszE+Rvj4JsW7fQjAXqk2rMmQbEhz
         J3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZOTl4ibDRdtOyEL212041ezVq+53TlvBxM0zJ1ux+kM=;
        b=E1wC6Dfdj8cLt6wORTvpPqtnWHYDIIqQOouOB+zmSKW9BhaUeRsYRJnUkdmRZAjPAb
         owScTW/qhoRfHzu7WKjwGqAP6HRtLkecvHCTe9KuwG5TE21k2JjMVkrCom1Uv/rL+Wlu
         oLGWgtJyVR8tPK8hH2lDZ076Yxy6Gzeif6+M3oC9ZS1JTl5TiBgTypk5hKqjRWiFjNm/
         xeCsiJehILP9c9u4rGMGdB3sGu5RTHL6mQE5XcAqstS7WTQ07q89ue/GhnB9YbJYS4Fd
         ZJEtEF9ZfO9sOoEYizmx6sClALvy2DeyOpQUBdf0L2wU5s328JYDAzOE9/M23vHE9Ail
         Rmgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zbOJocrG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020a05622a121200b002f3802ed853si1700415qtx.774.2022.05.13.06.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 May 2022 06:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zbOJocrG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npV7L-0005jS-Tm
	for alex.bennee@linaro.org; Fri, 13 May 2022 09:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npV6l-0005hy-6D
 for qemu-arm@nongnu.org; Fri, 13 May 2022 09:13:28 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npV6g-0007dA-Rm
 for qemu-arm@nongnu.org; Fri, 13 May 2022 09:13:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so4744202wmn.1
 for <qemu-arm@nongnu.org>; Fri, 13 May 2022 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZOTl4ibDRdtOyEL212041ezVq+53TlvBxM0zJ1ux+kM=;
 b=zbOJocrG6BoZUx45clliWjLnWHF+QpDqgDWPeUQI4+JaPxD9eW8YbXBq3dikraLoh1
 TzoXvXSZPndFQDO85hKRu4HRhXV0FRVnwfXR545FU26S1xz5Ta97urawbiDMKt7AihJo
 OjcVe7xKeXsDQVAsc9H7KXCuK9OLy8dKdl7ELSnSBwPN7hiW+ing2JdKUSSSy3T3msxh
 tmGgvfVHVnbIRu6DDy8W9JkkWKoaNYid8QhpDzQ5SxfhXyd8NSGGLGfoGO2L7NTDslrd
 d4nk1aJPnmJju8CaDDWTyj1z6Pe0xbxQCLPArcDLg2sdXkW8YlTje7ultWCvZ0DIsr26
 u7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOTl4ibDRdtOyEL212041ezVq+53TlvBxM0zJ1ux+kM=;
 b=d2+S6PR8GUIb2ssqOxVxNfZbO7MYyVvYpygudOfvcOxSTVQcYPKK8V+vRY4t9OlLhB
 SEiLYiXHXNNk0curdn7qyTcHu0ZD2BThjrus6wD/WVCZU9uSjiDDtviietnHYfIziVVq
 gcPoq9kIdQBtrgHxwWxxUVEHZgxmnXleFYAn7rUcSwmMR8qhX6KyCp9C5HCGDbdcCPtu
 irgzvbmUnpgqSNYP78V47Muvk8l/lKloNRItE2nDypyACLKrLlBfQHGebyTNcbJozGG1
 Zg0GkmgvTj1nmWBjrDe00vJGu7Y2vH1alqCHy+vaRNX9ujleh+yzRSmXdgZyps5Xw5aZ
 AozQ==
X-Gm-Message-State: AOAM533Anu9/RoEnCEBcjg4jRGT4ZOR5GBz9V+T8GVd3wMp0mHo8yR8F
 e1HD5hgqn/p5O+gg0sEFTyeYmX8Um9U9Rg==
X-Received: by 2002:a05:600c:1986:b0:394:867f:984c with SMTP id
 t6-20020a05600c198600b00394867f984cmr15019881wmq.20.1652447599770; 
 Fri, 13 May 2022 06:13:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b0039456fb80b3sm5214887wmf.43.2022.05.13.06.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 06:13:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/arm/virt: Fix incorrect non-secure flash dtb node name
Date: Fri, 13 May 2022 14:13:15 +0100
Message-Id: <20220513131316.4081539-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513131316.4081539-1-peter.maydell@linaro.org>
References: <20220513131316.4081539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NdzVEvCICRvp

In the virt board with secure=on we put two nodes in the dtb
for flash devices: one for the secure-only flash, and one
for the non-secure flash. We get the reg properties for these
correct, but in the DT node name, which by convention includes
the base address of devices, we used the wrong address. Fix it.

Spotted by dtc, which will complain
Warning (unique_unit_address): /flash@0: duplicate unit-address (also used in node /secflash@0)
if you dump the dtb from QEMU with -machine dumpdtb=file.dtb
and then decompile it with dtc.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1a45f44435e..587e885a98c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1195,7 +1195,7 @@ static void virt_flash_fdt(VirtMachineState *vms,
         qemu_fdt_setprop_string(ms->fdt, nodename, "secure-status", "okay");
         g_free(nodename);
 
-        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
+        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase + flashsize);
         qemu_fdt_add_subnode(ms->fdt, nodename);
         qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "cfi-flash");
         qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
-- 
2.25.1

