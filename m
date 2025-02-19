Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1482769njb;
        Wed, 19 Feb 2025 08:55:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWva3DS6ux/ru9jElI07u5gGH6TKu/V2v5BbtRSr4mmPEyeV+CMZYhR+zNFZPheE+jxoRP4K8au4ifXpw==@linaro.org
X-Google-Smtp-Source: AGHT+IHWoL5fuojPKFJMWYbHr41dIe9x0Fp+e0VtYhV5DIFTKQoAJ0N+2EDb1DAnjwyBjtgRtQZ/
X-Received: by 2002:a05:620a:44c2:b0:7b6:6701:7a4d with SMTP id af79cd13be357-7c08aa94183mr2659602785a.56.1739984152241;
        Wed, 19 Feb 2025 08:55:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739984152; cv=none;
        d=google.com; s=arc-20240605;
        b=B9BmQ9aT1iy/NCpGnljrknaO3BdUowYM59Nulytw8K1RIQSTfKZQOkiIahxptkrM98
         6g6YGg18fXlG5gWrdvPK5h9AWnR349A0c4DlK/E/vRoulKToFGmRbwKUS7afDWy99RZm
         B4Yr9YAQ8lZaNrqAmWWPJXvGFV7H0PHxvYL7zbQG0gozb28Nf0wX3EUEbugNQ1/WvoIx
         j90B4PCRT7NErbBsdv35HzH6gF7MXR/TD8lSAZjaLBvw6ofxQpewZON/sCRcJNlWU3l0
         6bFqtp3jTzfbeRHXEpdW/61u+JUY+Myvncr6f4IB4KeFG68+Ms3AyKf8BNff7H6zX10D
         TUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=tSS/crWLI1n46EnaE/CdO35FER4SHdPfAC1ZYsNG/S4=;
        fh=J5rK49AvbqWd6GqL5OV0utShe4OiV3iZ48PVDD3WoNg=;
        b=gRyo6LLXQXAu4l0X143hxb1zgdAZF/7Ua97LN0IlpeI4E+5FHVWMrQl1tgHW7PUJM+
         NpcFt6/U61H8+u8hljim1w/+7o7KxjhAdHjSS4suR7AczZSkUvjoKzD2Sbu3V8+WFThV
         LdwqGMy4pMlmMFUZWbLzdRLRjZ2WrH0pwTDS+XYOX3U+ZJqbmhOnX1yUODxejOERWbcU
         OYOxlCAKYIEk8nf/Urmtx5rlGZWBuxvxXhquWzH22zjX/TO7RExfS5LRSPDmKcMyiVFp
         TJZEI/Xu7cS/9L5gERE+MbyoTdOE9MFl0dPtVxM6bvmk/mQNYLFoHgyPT2R2JPvMTrWO
         q81Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2GfOhoNj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9c1728si132150216d6.321.2025.02.19.08.55.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 08:55:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2GfOhoNj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tknMN-0004U1-9t; Wed, 19 Feb 2025 11:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CA22ZwoKCD8tmpohgjfmehpphmf.dpnrfnv-bsnopohov.psh@flex--slongfield.bounces.google.com>)
 id 1tknMM-0004Td-6i
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 11:55:42 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CA22ZwoKCD8tmpohgjfmehpphmf.dpnrfnv-bsnopohov.psh@flex--slongfield.bounces.google.com>)
 id 1tknMK-0003ve-39
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 11:55:41 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc45101191so7113a91.1
 for <qemu-arm@nongnu.org>; Wed, 19 Feb 2025 08:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1739984137; x=1740588937; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tSS/crWLI1n46EnaE/CdO35FER4SHdPfAC1ZYsNG/S4=;
 b=2GfOhoNj0ay6GDdt22Fxghb45GN/mhIqHQGFbBJA3LFesw458f63Pv5XS5Zr9b3g61
 faWFKA7VhWzKNpcnBQsyu6vMzIy+78nZe5dKkhY7G9jNxzIuEV1vGXFM7Q9pW9mIoym6
 C+QWW5FP0zwGLJ8ieUH0DXrXgCfEbX9bY3MzxKl5OESfteYt3dE0T8kBWUMhTuOzZdEw
 lKei+Fnra+xHzhfaea+v47AiM9+JG673J/i1hlfxgKPcDiPOh0wN3lxnGiJI8LdzUiQu
 p5qO1wtCd5lYHBgRxoxtURPoCIeyB2WK2oGitDSEQjdxG9io3+iJATnMGTzTd1NGWOVE
 OuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739984137; x=1740588937;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tSS/crWLI1n46EnaE/CdO35FER4SHdPfAC1ZYsNG/S4=;
 b=McWvVQ0LmP7h+hH8p0raO8DF7bSCF1sNXNbL9IY4L78796JOk2DVwCD5ObkPF3W99t
 /eEjrAebpF53nfBRKpL7siGadfqCXSrz0THIiR5HnGK7Y/sXEYnnb9ypmgosfhVycPjr
 pYhy5BQDpnp4LM2vmEkuehh9lHkHFPX84ZaUVd7PdT9WNoIx497XSBqfTDy0mxLJdH8G
 9jZxu4DVySDVSJhYAbQvJYqLZxvdug6O5S+6y1/XvUxFYd77SNXeOnxAwNTRFV/VNcOH
 wOElmV7L7yfB7kxVpfe5LB7wo7zqb/jyZVjEsaE1oLgZqKr/7BFVP2Rf8x4aDt1CS1NZ
 3RDA==
X-Gm-Message-State: AOJu0Yx3gRSEDS9MrxRph1ntQswsaPxFkYiH6dluQ1kqEBd9RzFlY3M4
 lpkNic4WRuINsAjKbxyVXN4sb4Hgx7AqojjrEOvH8KgbMvxivooBaxIHD8bjo9TnxP6USFffUcr
 GEMCMmnVO7tx7uew5HA==
X-Received: from pjbsy7.prod.google.com ([2002:a17:90b:2d07:b0:2ea:4a74:ac2])
 (user=slongfield job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c4e:b0:2ee:6d08:7936 with SMTP id
 98e67ed59e1d1-2fc40f233bamr27990118a91.20.1739984136776; 
 Wed, 19 Feb 2025 08:55:36 -0800 (PST)
Date: Wed, 19 Feb 2025 16:55:34 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250219165534.3387376-1-slongfield@google.com>
Subject: [PATCH v2] target/arm: Fix signed integer overflow undefined behavior.
From: Stephen Longfield <slongfield@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, slongfield@google.com, 
 roqueh@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3CA22ZwoKCD8tmpohgjfmehpphmf.dpnrfnv-bsnopohov.psh@flex--slongfield.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o9GKU3h9eThJ

The problem is internal to t32_expandimm_imm, the imm intermediate
immediate value.

It's extracted via: int imm = extract32(x, 0, 8);, so the value will be
between 0-255

It is then multiplied by one of 1, 0x00010001, 0x01000100, 0x01010101,
or 0x80.

Values between 128-255 multiplied by 0x01000100 or 0x01010101 will cause
the upper bit to get set, which is a signed integer overflow. From
Chapter 6.5, paragraph 5 of the C11 spec:
https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf this is
undefined behavior.

Though this is a minor undefined behavior, I'd like to see this fixed,
since the error is showing up when I enable clang's sanitizers while
looking for other issues.

Changes from v1: From peter.maydell@linaro.org's review, only changing
the internal representation from int to uint32_t, and leaving the API
types the same.

Signed-off-by: Stephen Longfield <slongfield@google.com>
Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
---
 target/arm/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 68ac393415..d8225b77c8 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -3510,7 +3510,7 @@ static int t32_expandimm_rot(DisasContext *s, int x)
 /* Return the unrotated immediate from T32ExpandImm.  */
 static int t32_expandimm_imm(DisasContext *s, int x)
 {
-    int imm = extract32(x, 0, 8);
+    uint32_t imm = extract32(x, 0, 8);

     switch (extract32(x, 8, 4)) {
     case 0: /* XY */
--
2.48.1.601.g30ceb7b040-goog

