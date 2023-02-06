Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4644336ejb;
        Mon, 6 Feb 2023 14:38:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8U4Qxq4pz7Kc4Ot0uyy4uQCC+1YXo+GDHgcLespAKfGyP+bqQ2A0IgWVeHQpYBzTkl6EXJ
X-Received: by 2002:a05:6214:f6e:b0:56b:f403:571b with SMTP id iy14-20020a0562140f6e00b0056bf403571bmr1868062qvb.0.1675723127578;
        Mon, 06 Feb 2023 14:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675723127; cv=none;
        d=google.com; s=arc-20160816;
        b=Rc0qkKyyupudF16WTwLMBPvnNmGF2bG5c/MPxha78G6H6s/87o5YMRwiNkXgix8+2e
         Yp4rgAC4VQGTRHKazTwvB5T0dKtTLI5/PiVN5lZC0euO0MoEQMfUPqgkQPHHKRo+AGQQ
         pbM8jQJqVmyrGNkaVg0+w4kYm/8EujAICTIa9zHJmPw/w0GMbtSnMLArMTaEo6tr5Jkf
         nPfSXOIeRADTUJIUN7GbGblBsS6FRn+nHSllOJwPsrnLkzC6ALQuosW/pto4t5AvA2uG
         CaYrffm1ZkGAAUEuAkiiwmV3vZ6nLLcCLIG73vCK2wdW455mQ74BBQhWGluh7Bk+nhBZ
         xpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/k7Xuyi4yDhm+JEx9OBf9mhnkAiRR8pR4vzYzacLnP8=;
        b=rNKT64e+gXZKdWXMQzAu4hs5FzREijs3fXwCacptPA1oCmWul2YgCboPbP3CLFoRTQ
         5xpLcJx9jPliCJL3EqmKq8hi711k3ARP4gv1SBSwvRgmh3a5RsUgY2VYa960nBE0SaDq
         ZU79nUiOTRusBDQxa2gXJ6CbyVD8f0sv7NoHJZh7mP4jTBDtDJjQ46ONZon/EsL/P+hm
         Cg+eexTutVhL7WwARTczNDv+xhnDIFXdUFzqkFHnY7P0huqy0UYyMuZ+eL4ehCJdd9gx
         oKWVEdWcZKeaJ4yUZZaBUB3H8RUrQOeZjSlo+Yt4YOdLB84vEOWHzyJY+MCeRUJMcncz
         BsuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U3eTCcOy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf8-20020a0562140e8800b005309b6be01csi9754766qvb.489.2023.02.06.14.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 14:38:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U3eTCcOy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA5w-00023V-NE; Mon, 06 Feb 2023 17:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5c-0001wD-5t
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:56 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5a-0004Rt-ID
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id o18so11896371wrj.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/k7Xuyi4yDhm+JEx9OBf9mhnkAiRR8pR4vzYzacLnP8=;
 b=U3eTCcOy6zdmk2vKJvcQTKLuIHvtaW174JDHL80aevYN+nwHs5E+BdMrtJVPqP/EQc
 OgybLpw+f2wCkx5A+c1I14efpk6ZobychfMRbOlX/0IWex64SpRXhWxqdkA6Jk8/L2aM
 p8ibcfO/fLS8wWos/Sj/lkYb1YFMIsBy9M7Mw3lXXrnbkweq5lbNnrC/4d/RopkOz+WK
 sHE5Oe30RL8r+Z9Q30NXD6oT0/klhmR85/LXaTf+3z63Hgr1FCjkaIC5ttgi6r2HTvy6
 68xdGOgJncQ1oV8NhK6OY3ADxb88UYZ2Gx2ScGoXSjHFosTrZT1nmK3W3zGWMOZZ6wie
 3E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/k7Xuyi4yDhm+JEx9OBf9mhnkAiRR8pR4vzYzacLnP8=;
 b=XrmlnAeNLf+n09ahUry2Jy81sLe0/kPHp83IPBBu0nEKgHGGYxFdpiIrLmZ2LlhJ0c
 FgqeRVtJoUn9ziRkYBcOOCKRmZ/NZBmmopRT3ACHX4oIi1T6s6w6KPxcUitHpJfoOA8C
 0wfk74cny+JLx08Qjtc+WgcUV64caV6twlQLY6oc/LPt/bjN8wtmvayCi/lsu3h22RKU
 4nNqqwgF1daLpONaJKitXgovwAW4lwkAPAK0EkicyhVgQ0SYgsFwoFYcJr4Rqvm52480
 R/da+2OmHpJ/UdfWMEU1mJ0h23QnhgHWrRMkaYDd1dY0SDBSZwpRlWTxA8FPAUX+f3UH
 qlCA==
X-Gm-Message-State: AO0yUKVBUIbNn6IgHRCTVbfyCfE47FSI+Qi8pzunkkFRZID4X6bzmkIV
 W/30vh5zWR41OEYkBP9cerboNkcH8meK67Aj
X-Received: by 2002:adf:db88:0:b0:2bf:d776:1c9a with SMTP id
 u8-20020adfdb88000000b002bfd7761c9amr505199wri.4.1675722953688; 
 Mon, 06 Feb 2023 14:35:53 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adfef85000000b002c3e600d1a8sm4481597wro.95.2023.02.06.14.35.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/11] target/arm: Restrict CPUARMState::nvic to sysemu
Date: Mon,  6 Feb 2023 23:35:00 +0100
Message-Id: <20230206223502.25122-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yszYCLAp936a

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a574e85b76..01f9566a1b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -767,8 +767,8 @@ typedef struct CPUArchState {
         uint32_t ctrl;
     } sau;
 
-    void *nvic;
 #if !defined(CONFIG_USER_ONLY)
+    void *nvic;
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
-- 
2.38.1

