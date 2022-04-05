Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp289792lfu;
        Tue, 5 Apr 2022 15:48:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwh4x0M86ZzKyDHoXhLE8mYh02WFHkR7XnPgNo05t6H+4E7pJ14NSaYCUfNf+clKfngkWm
X-Received: by 2002:a25:ce84:0:b0:63d:cece:fc6c with SMTP id x126-20020a25ce84000000b0063dcecefc6cmr4442989ybe.286.1649198896829;
        Tue, 05 Apr 2022 15:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649198896; cv=none;
        d=google.com; s=arc-20160816;
        b=kSlSKPVW1rwtnhVVhIcl+2aXzDHT7V0CkmL7npIm8rOt7UnqoFdPPAIVwPnVE2Ylyq
         6nCczU/jZJ/GZgAlSNcNHnM3IfPkHkS8WiSOBtbh31L0NWEJIVXc+VgyWI2nzT1uxG/6
         FX970/TlKopIMl8dcr4W6i385LrY87H5ZjNDlwlJ9y9FIcpIKc9ZJGfPfUkd2zp/akzQ
         T7lkfdE02qNhB1VEUg28IR/FAVOjz/5VaA+INm3SWUPfYczoYNWJwhBtHJX/oHk188+x
         mY4FESSYZ6TxTv/pcVc+BZzh6pIB7cHauGFwYj7z5iJksXP4s++TTVP6Ttx/LxjkTNiC
         O2cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=cQAtXLk+vnJziUx/LaxkPrSrO8UZcGwhEX8GD52xKdk=;
        b=rf+p0+x6YBSwLAmo31NgTTx0WTFwlV91jBsQPKGIQYb5pRJlsP7wS2duO5Ym473mkB
         MSejwX2dR/P72HJ1WcBr4hOzRwB/acRVZ7hm+GlbZi9DxgtNpRULixA400ZVDrMd5kHp
         aL2pzIugMe32Hk/jGXTO42Jx+MtkgXXyvmi7VptnirelogGlX/QT4hXGMAu8m8Cb4sWt
         Y77n2wVxoyIYsUZEMGoY6lZLJTsmaqZ28LTKsbaLgU6SBINnEOazkIVgxifekVse4nGJ
         CskgnIbCP5aQNOpLUos+8h6ad1+j2Pza1oyPNdX81UDei4RQgua3LPJxihK/31z7yPdx
         HyIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=HBl5dllV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d133-20020a81688b000000b002eb6461e4aasi5182695ywc.389.2022.04.05.15.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Apr 2022 15:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=HBl5dllV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:48122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbryC-0003bP-8F
	for alex.bennee@linaro.org; Tue, 05 Apr 2022 18:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <308RMYggKCKgecPIWbaPOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--wuhaotsh.bounces.google.com>)
 id 1nbroY-0004Im-71
 for qemu-arm@nongnu.org; Tue, 05 Apr 2022 18:38:18 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:60210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <308RMYggKCKgecPIWbaPOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--wuhaotsh.bounces.google.com>)
 id 1nbroS-000334-T9
 for qemu-arm@nongnu.org; Tue, 05 Apr 2022 18:38:17 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 d11-20020a17090a628b00b001ca8fc92b9eso376275pjj.9
 for <qemu-arm@nongnu.org>; Tue, 05 Apr 2022 15:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=cQAtXLk+vnJziUx/LaxkPrSrO8UZcGwhEX8GD52xKdk=;
 b=HBl5dllVLdVJWA3Y9bbBVwzHXK/iIGltDFW1Cg+nZEjjqgrfiJfb9EAjHXbROuSdJn
 zJVjR5CGn5GnIHAnpbN6XBlaEqF0oB7zJhqZOG9OE4olRX7Jqh/eEOB+Nq6D6S0pOO9s
 UPlZHQHGKIfped3sauTgCNkj6oLvUG6swZzJtck+tJVpauFDIOFC1vhHpl19ZFxgp47l
 0wO+TmY85sM8JF3fMibIOFAGwr3UXgJwE3Ma17WY/2vAjKoIqMvQv2sBnRgpD4UEMAmN
 5GFxJDFC1rQCk2pSY3tao5dOjIqCic/ET5EGY/sI0ADD9Jxo3ZMtOqsE1zhjEe7+i0CN
 Y8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=cQAtXLk+vnJziUx/LaxkPrSrO8UZcGwhEX8GD52xKdk=;
 b=twCc8uu94OhLXw3Em8EIhJUm2yWeUlVslG5aUr4Am0qslHftj6L4I0kvKAeOps/IYr
 8+kCX/IiIUWkt+jyrM3+pqZRHmSOV35AHMzw5izIHBMy+vY4iW1ufP0o60ihlEpKrG5w
 MYh7pJgkz9ZVs1JsEDv9RihIswBN4HD/GPLcGR2uKfMBQbDwiCJjbKRIGeU6N+cvPfWz
 jizae84O6+u9ptgGfubmnf7H2/aHai/bGbRjHMcVnbtErkL1dr0lmFyp7o8YUa/UF7ct
 +wKppsqfiVYLAso/ewtfjOx/4Ue5Wk/VLe/K2vRKdbgd8Bvwhcozu8f+HqqGOZyhrBG1
 QljA==
X-Gm-Message-State: AOAM533rUp/NGuOUQ60aqP84bGhEK642J4PMyiozV9QBQRsIYpKoCjMn
 FWE9Hpd1fhJ8Rz6EO/4+XZz/6HpYhu+Xgg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:4f88:b0:1c9:b632:9462 with SMTP
 id qe8-20020a17090b4f8800b001c9b6329462mr6442611pjb.54.1649198291416; Tue, 05
 Apr 2022 15:38:11 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:38 -0700
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
Message-Id: <20220405223640.2595730-10-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 09/11] pc-bios: Add NPCM8xx Bootrom
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=308RMYggKCKgecPIWbaPOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 2zbVMjz8SlMt

The bootrom is a minimal bootrom that can be used to bring up
an NPCM845 Linux kernel. Its source code can be found at
github.com/google/vbootrom/tree/master/npcm8xx

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviwed-by: Titus Rwantare <titusr@google.com>
---
 pc-bios/npcm8xx_bootrom.bin | Bin 0 -> 608 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 pc-bios/npcm8xx_bootrom.bin

diff --git a/pc-bios/npcm8xx_bootrom.bin b/pc-bios/npcm8xx_bootrom.bin
new file mode 100644
index 0000000000000000000000000000000000000000..6370d6475635c4d445d2b927311edcd591949c82
GIT binary patch
literal 608
zcmdUrKTE?<6vfX=0{*3B5ET?nwWA^;qEk()n=Xb9-4dxoSBrz#p|QJQL~zokn{Eyc
z?PBXUkU+aB?k?IbNQftG5ej|*FC2c{bKkr7zLy3jhNxj`gc_y5h&V=Ru)PgZC)Y`f
zTqA9Am28qL<U6@cMtA>Hlr*^&hT#;re-)dpxT0U42|O+cWOcx=B;{6xXH04vx?cjm
z+%U{oFx!aPpV3>ZKz0i$XA-yq{f}<H?{MHBq+VwIvR9WmcL(xr1vuIRGELcRC-S+P
zl3%RlR5(6+1;xg_<~xR#bPItDN1*Hp^{JyNs7o*BMq0Q9q1#>x4;|pb<NWIbQ8wb1
zTac^<ebj^E^Ig<?U?(PO-w>w;l#@9zGd|z-rs*H@V-o%PEV)D-)8n2%DyH5@w_^Y8
LH5R3RMV#gjxYTW}

literal 0
HcmV?d00001

-- 
2.35.1.1094.g7c7d902a7c-goog

