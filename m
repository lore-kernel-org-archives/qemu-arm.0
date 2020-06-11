Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1497187lfc;
        Thu, 11 Jun 2020 07:46:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2I4iYF/sTer38Oo42nIT8JhWoY4efe6tXcn7OndrmZhAZbmUbyNQnugu/3fpAa7FdWVxB
X-Received: by 2002:a25:9345:: with SMTP id g5mr13824334ybo.485.1591886777202;
        Thu, 11 Jun 2020 07:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591886777; cv=none;
        d=google.com; s=arc-20160816;
        b=iWODdXZco4GtH7k/gb2ZAxMsGArTIGzBSr7Dsm7D2Mr4gHZ9wu8Oj+zUY5PeS8vmFP
         iDJO/vHlprVGwmIvoyQ3Z9Snb327MwzYJuaj9nikx37Tb4lDW0LE84c5JPRSSXIm/RKA
         EWUfOLEA3esq6Z/GNTyM7IeD2rFuYyaEZbi5uYjCtxUEnenZG/6IW8srU+ZJZaTGSJYB
         NCs/sJT8tcfLC7gVcVyZXEe4SWFwvMXRR9hJ6CgV8e16QN7MgukYLBJpLAlYmVRZMPnh
         BIwvmfp3k30uxd5Wv8ueXlkteRXAosCfqUhRXUsukebdF8eaWAn1qTmS5Khogq/yB5jS
         h4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uW0Xh6q78nHA2zqmzf0Ts38Qc+I7vV86qqdu/rr8SyE=;
        b=WodAxbz9vtutYkKEb+UI6/CMlNYjDtNeTR60qHh+IWFEKjzfBEtkVxnj3JUMJK4qS+
         4nw3kAZYQHAp89iDob34C94gx3PS83xOwuXrncKFpJHy0zbkxHK5EPAsH4MUTz5i3R62
         P4yL286sdfDQe1kAfa5UMho/k6xkcaJW60oqzgPMxvdnEXn0/V7NiSvraNFr1LP3+3ME
         PEUW5SWNe1BJx/JzPrtsUZuWTqh5UHKSOKOIS5LOdo9VRXUdKQ0UOv8KW6IWeV18vXrK
         xeR/4H3l872m/S9DPGe/zyxc2xHLGZoeQPUthqb2Fgnq/Yuz+laMJOQwRw6nnS6jSzSd
         o6Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKurPBR4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si1124936ybk.475.2020.06.11.07.46.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 07:46:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKurPBR4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjOTA-0001tp-FD
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 10:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSi-0001Rx-Ft
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:45:48 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51361)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSe-0003nA-6y
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:45:47 -0400
Received: by mail-wm1-x344.google.com with SMTP id u13so5216365wml.1
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uW0Xh6q78nHA2zqmzf0Ts38Qc+I7vV86qqdu/rr8SyE=;
 b=pKurPBR40UGOpb+1bTEFRCTPXWqhiExC/+Nj7KYLdc13oxToyutDhqoOTW04mIT1+P
 NAHsG+W7n+XB0OQB9ksDdj3fTvgDoE8ni+5zDPEZ10ukylksgIezIFhTYsy9aaCjflGm
 N3bJGiOoZQ7rY4KHhfUnfeiDduEwZzDYGCAy/9zlh2oZFjFtACtGDEseTye51sWzIjd2
 PnKWddmR3V3mHTv6gm/4zlBjsfpG3oigMrP2SZwkkbVv0VD6p+zDPVdFb1sHCPsduSUw
 Tn2fB0nj76tttoiucNXbBJAKJ1iC/0gWRI7XH+sxquzoUEqUx/S7EMIaMerSlZYtg2Up
 i3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uW0Xh6q78nHA2zqmzf0Ts38Qc+I7vV86qqdu/rr8SyE=;
 b=t06wXR+KGQDIYJgEPnTdZkclx2oQwPxFyacxc7ADgDKFFnry5ks1udb9AXrpJWejbD
 6BZrXvDl2V0pV98iWuWB8TkDi4v1LdWqo6epY6WvtBPiLed7uFwUEFkljXLxRBkBlkAV
 cQyXtMczWxddgeA8RyFm8ZTTKt6jujJjUnr2fAdL4Mj29zzdzkgLTVjsSV1S+gz9Gbfr
 D+cXQzbrUYyaaUnhqfIXnxdi4rhnHHnL0OX31OVKti8AD1OC+KV7nyNu5G6Tk6ODmGru
 Cpvuzl8NC7A918z5lDGVV6PuKVf2mFpVK7YJNQiy8bX0CXY7sM2I9BczDRhjBLSPEc+N
 JSCw==
X-Gm-Message-State: AOAM533NiWIR1ssWnU1Oj9ln3r+55XzwvwPW8+C+WxhSiZlfDyScTxwh
 DEDBoo3puO/UY8qPuNHgzH4rqVFKK4C9Aw==
X-Received: by 2002:a1c:4189:: with SMTP id o131mr8155980wma.183.1591886735648; 
 Thu, 11 Jun 2020 07:45:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h18sm5271658wru.7.2020.06.11.07.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 07:45:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/10] target/arm: Add missing TCG temp free in
 do_2shift_env_64()
Date: Thu, 11 Jun 2020 15:45:21 +0100
Message-Id: <20200611144529.8873-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200611144529.8873-1-peter.maydell@linaro.org>
References: <20200611144529.8873-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8kwDrjwe3kSk

In commit 37bfce81b10450071 we accidentally introduced a leak of a TCG
temporary in do_2shift_env_64(); free it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
My test setup wasn't looking for temporary-leak warnings (they are
not as easy to get at as they used to be because they only appear
if you enable qemu_log tracing for some other purpose). This is the
only one that snuck through, though.
---
 target/arm/translate-neon.inc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 7c4888a80c9..f2c241a87e9 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1329,6 +1329,7 @@ static bool do_2shift_env_64(DisasContext *s, arg_2reg_shift *a,
         neon_load_reg64(tmp, a->vm + pass);
         fn(tmp, cpu_env, tmp, constimm);
         neon_store_reg64(tmp, a->vd + pass);
+        tcg_temp_free_i64(tmp);
     }
     tcg_temp_free_i64(constimm);
     return true;
-- 
2.20.1

