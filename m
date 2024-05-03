Received: by 2002:a17:907:a184:b0:a52:4db9:938b with SMTP id om4csp1411845ejc;
        Thu, 9 May 2024 10:31:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU92ymjr9d8/hgbK0YhJcvBvEVAHWyNA+IUOH3l5q+8ReEpPQUAZGuzYBJFClzrj9kDmAheu6rt8hCh/0MFKquggXdPWCvC
X-Google-Smtp-Source: AGHT+IEeAiZwRT86uwRL6yl5nyjtfO+WEg6WTxoYOXnf7UXqMaCJfeZBPMjkobN/YRnBjR2i50aA
X-Received: by 2002:aca:1314:0:b0:3c9:6894:bcfa with SMTP id 5614622812f47-3c9970cf757mr266506b6e.53.1715275876916;
        Thu, 09 May 2024 10:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715275876; cv=none;
        d=google.com; s=arc-20160816;
        b=wnVPu5jEZFE8rsmnur3xrthgsI/HF/7ZsEvE4vk5tuiOzYfwgZmEhE+Bv8HAT2nJjv
         M3SdlIm589I87jaQ9UuXz/fjMYKRD5wrbR+L3URfuHOBRwC98HE3ugWrlwO7q4glxbtO
         TsOjy17mbCcvRHNo1V17jOqjqIN0EoEMq/BNUQ2xDs5DE/JB4zLvnIiHX1OmJ/Hm8ZvR
         L8LbiE9AEFaF1Zt0sUiXQrZyVHZi08z9+OKBB444eUGJgshSMifac6mA+ByKnfTH0PQN
         v2p0LixSDJsnqccM+XRTJW1BTESUbvsDKC/tFlfBfnF0zO6Gw1b7tNAGzljNEivdVO49
         c5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GCUy9HbKYqkB8J3c8ehjTn+z8ZMWUL+bdITYZiFkB6s=;
        fh=pmBddo4pQ2859qH8iCoB8jWCZH/rqsUTp8wv2qdM7U0=;
        b=iYNe+ahO0El2SwZu8J/e7qxj4c9KTCYQVs1/tBN0ThHbGbvjKpgvT4c9jbzJJ9QGxo
         qHgI9qcksTnVSPNGb5mMSZWOTCUP+spCYgucwIBn6z1LmF3EJ0HzDHSVai4hu6rOtpIR
         Sp5aM9ws+ur/zBpLe36TLAtoMP79XH+hSu+XUkiJqcBwpAMG2WeWOt34+8vyqrt4yl7E
         qVHjH0Lc5DAdEQxwFkQwF2qJHkgrfX5IcwseorFqoNm1ybJF6sfWYjqypawO7+w/eGZT
         UZGj7uA7viy0WShMnC8Vr3FNOd3HhWzLCG+j5vAM5aeQ2Gs9Zi/fn0aNT9ewlENhIApJ
         lrHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="Fhl+/+Qo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f1d734asi18504316d6.37.2024.05.09.10.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2024 10:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="Fhl+/+Qo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s57ao-0001lW-Lg; Thu, 09 May 2024 13:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1s57am-0001js-NI; Thu, 09 May 2024 13:30:04 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1s57aj-0003h8-PR; Thu, 09 May 2024 13:30:03 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-51f0602bc58so2101790e87.0; 
 Thu, 09 May 2024 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715275798; x=1715880598; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GCUy9HbKYqkB8J3c8ehjTn+z8ZMWUL+bdITYZiFkB6s=;
 b=Fhl+/+QoPrwjJ5KE3A7eJORofZo6WgaEpTEIyO9/V7iIBm3L1gdaDHidPUX/lPMqII
 R/BOKjpCU3TfagI/faYyfkDbnXZjkA1c8EHpcS7Lmv+q/hsdypSHgGVUfmQHAUSWayeW
 8+xpCGnFk/pakjI02FwpRhdR+vLsEvqIqX+hQF2jh71Z1oZgRrSOnPw4hRCk3mGllN/M
 nhX8qRChFoFDNRW7SxNXqj5sYbasCMD+EYstMp4Ex3cZNXDcIaDhWbvC+GD/UuRo+FdT
 AJumhVhFNw62gtZLnaNT5udqTX1UGQ1a5tMPqPVz0Ury+aE+rO+/HUqdixO7vm+ZmbmX
 Vj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715275798; x=1715880598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GCUy9HbKYqkB8J3c8ehjTn+z8ZMWUL+bdITYZiFkB6s=;
 b=jhmphQKPy6vhUUFVVSykST6RBCtIYGD3KLcvoaOzX5BFkzMScbmu4rCs+FdFfpqOaq
 ecd+0WlrPwnQqYElbw/qU9MFX0hKmHPe35dD9cFOq8XVDkCXM4pFAKsCvjSI131p1SKh
 SF8dC5gdnHDo4ut9fdYa3ORWVvuCqfu9eGUmS5XZoSUFhlYCD3/pSAgYJRfLFQItyDFj
 Iy7pl6/OhaWfECFcslePrJSs0bvCyGtVNzTBiVcm8vNhySWjee9wQVkVge0xmAsXXSBn
 SXtYk8Ye4REvEAWEDx5KM9Mi8LwOlkQZ48GQ9g9giBbM65jd+Es/w/EfvIbNW9QMyrPg
 oCEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUir7rYbuwD58ezy+63MRPBECoE7so3mESvoJ77RbQ0XB0i5+B7c/2GfnIYbUZykBY32iGY+XqfVeDyx8U9joN+Ivr6
X-Gm-Message-State: AOJu0Yz0LQyiPuzYI7kDXBmZ64vHcQ0M3U8hThmtjYRH1BhEX1vEMJt0
 7YDBO1DN7GyJoJtjcc5rNFaUuI+1QMKMmuJ8UXY5R05zlTBFkC7UCsJJkWw1
X-Received: by 2002:a05:6512:138b:b0:51f:4134:b277 with SMTP id
 2adb3069b0e04-5220e68c1a1mr107788e87.28.1715275798464; 
 Thu, 09 May 2024 10:29:58 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d3321sm371586e87.301.2024.05.09.10.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 10:29:58 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com, sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v5 8/8] hw/arm: xen: Enable use of grant mappings
Date: Fri,  3 May 2024 03:44:49 +0200
Message-Id: <20240503014449.1046238-9-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503014449.1046238-1-edgar.iglesias@gmail.com>
References: <20240503014449.1046238-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: wC5amylQ2A4y

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/xen_arm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 15fa7dfa84..6fad829ede 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -125,6 +125,11 @@ static void xen_init_ram(MachineState *machine)
                                  GUEST_RAM1_BASE, ram_size[1]);
         memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
     }
+
+    /* Setup support for grants.  */
+    memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
+                           &error_fatal);
+    memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
 }
 
 void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
-- 
2.40.1

