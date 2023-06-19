Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2809574ejt;
        Mon, 19 Jun 2023 06:26:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4B6B0c2k08/ucz9c31Rah/+qPmFc4lmQ4cDAlKyxQZHsmjEHTRk3ZIWUXK1E1nFP7GF4pL
X-Received: by 2002:a05:620a:3913:b0:75e:b9c1:ef91 with SMTP id qr19-20020a05620a391300b0075eb9c1ef91mr9691377qkn.70.1687181162885;
        Mon, 19 Jun 2023 06:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687181162; cv=none;
        d=google.com; s=arc-20160816;
        b=jKVna33Op+EU3RW8EIz5hDon/X6pYJncy2Ow13dd++Q51eyVDEU9ghaJcMuQwgG1hp
         SRlWv4K6Ddn5NIVQTOX2/OjU/1Opa0ulK9RP2GZ9oE9Tk/oMgeQsOntl1pv+3LYKoxb5
         FPM9TGFaqBGIr20qk9gHJDuzqadaDoA9yDaUBKAACKDCTW1qQ2ohlF4nQvnUM5wqOmLe
         GF9OSQ1JeKrNZ0u3wR6VECJOp3GFCxcy3fjw0yUYKJouTCiFc8ZVU3OOSzyJCuCvsZD2
         g4FcbWxHsoeXN3YLhKQ6w6mMrmh2W62eXl4SrxmF4E9pxdySww5/Pwv8taF2tcupmpM7
         p1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=EzMr6N2DSG+x4yjs5VDDLx4neEvdpghxE9jkpPNpTyo=;
        b=jN0bGYF+YwJIlG1hU7blxsFddVORRvFrJ0ePo2H4p7bgEFpM83rSreT/cdH7GWRBvO
         /nPMaPyP5Jt3zYaKf25S2elfEbnN9p5lcgL8LAmIANZESFkWWt6Wfvb8WCenOSys6Mw5
         UIse1K9ot7kx95qo3peFDQtv4WkPkc7Mze05mQlcezIy0r7/Begp2VVjZJnPVeGLvEAv
         a1Ln/Kl1RcezIpdIBoUM9aH+2YPpyX6/9+OkbGflhArkvEXnEkIfcLIPTn8Ch6gbOqvQ
         qIklZ/aaCftqzEKlisbtETO7Qq+anxectRJxuO6im7XBg1z0SEabe4zTDBJf4b1A2vqv
         EiOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHToEPu2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i24-20020a05620a075800b0075b18d24e9esi2705034qki.428.2023.06.19.06.26.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHToEPu2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBEtK-0000S5-1V; Mon, 19 Jun 2023 09:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBEtF-0000RT-Uq
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:25:54 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBEtE-0007nB-DC
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:25:53 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9786fc23505so418734466b.2
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 06:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687181150; x=1689773150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EzMr6N2DSG+x4yjs5VDDLx4neEvdpghxE9jkpPNpTyo=;
 b=gHToEPu2Z/siSiboNWwDUvVGiDszlXZcz0qTSpL72zggDnDOeY5e58OQxXWBsgs3ha
 V2DtSng+VDJ7N7IMiFS6p2Ae7PkdoEHJdLBq8EB5w/X/y7oeJ9oeygjlFoLnfaqEQu1l
 ZfJSeUoqzRCFyKQM6IO8GJ+m5h0mY0ABuApvUoxtDzfqm6kFVWq3T1UwM8It/Rvr88cv
 5wZ+yVX436eI3rV8LKHus6tGnV6fiWZAmqkEFIyN0w3EJ645y/xxHE9XfjovVx7Ero3+
 5lC/EoNUcN6AR+zVixuUeGSiY3BH4dD+Yoy5p2mv9XIvIKL59wJMIhg85yOqtYxUg6HJ
 2qoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687181150; x=1689773150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EzMr6N2DSG+x4yjs5VDDLx4neEvdpghxE9jkpPNpTyo=;
 b=aigyUi+iXOojkbh7MH3p9iJ2TUWvX95PRktenZw3sPAVIDcntkw4wEqNCAwSn7VL3E
 OQxR2SQNVmO3TNSlBKRj1Bgcz2f1sRBmFytm6pUb5oT6NPNNjiW5vjfWJQkEvefp5dS/
 VPUBrCQfykPYBDjPTtKbbsPGJbgIYhqgznahY3GVhJDBFsXs6AyLnokU0QobsvzyqQxz
 RP7IiaAj1hlbzrQ2KkDysjAz5KHBsbT4LUWNdZh6be4+7JVZcmcOPhZBKxpjuih0onM1
 EnuIPPEHvOKq92yz/gdcubo5H97ABYsXki5UdVI51LS9aLrxrSqIlrpnAGt/U1T6j7Q4
 WMwg==
X-Gm-Message-State: AC+VfDx+R6QJlmz5wdlwDLF8j+mB4RSmhcQg7LfTn/KIkpF80W70wO2d
 ooHJoi9qK6nIkmq+/AbYaULbqA==
X-Received: by 2002:a17:906:ef06:b0:961:be96:b0e7 with SMTP id
 f6-20020a170906ef0600b00961be96b0e7mr7160504ejs.48.1687181150554; 
 Mon, 19 Jun 2023 06:25:50 -0700 (PDT)
Received: from stoup.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 f25-20020a1709062c5900b0098866a94f14sm2495315ejh.125.2023.06.19.06.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 06:25:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH] accel/tcg: Handle MO_ATOM_WITHIN16 in do_st16_leN
Date: Mon, 19 Jun 2023 15:25:48 +0200
Message-Id: <20230619132548.400875-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: TU0GtPpbC3+B

Otherwise we hit the default assert not reached.
Handle it as MO_ATOM_NONE, because of size and misalignment.
We already handle this correctly in do_ld16_beN.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Fixes an abort booting debian11 with -cpu max.

r~

---
 accel/tcg/cputlb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 5e2ca47243..14ce97c33b 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2727,6 +2727,7 @@ static uint64_t do_st16_leN(CPUArchState *env, MMULookupPageData *p,
          * and so neither is atomic.
          */
     case MO_ATOM_IFALIGN:
+    case MO_ATOM_WITHIN16:
     case MO_ATOM_NONE:
         stq_le_p(p->haddr, int128_getlo(val_le));
         return store_bytes_leN(p->haddr + 8, p->size - 8,
-- 
2.34.1

