Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1152121lfa;
        Mon, 12 Oct 2020 08:40:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuUrbSkAIJICDpU7s1RbcERh5fCwfJvNQ6EZffCTZU03V7GGbpGJ8Je+rBkAOpS/PKpIbe
X-Received: by 2002:a25:d342:: with SMTP id e63mr10608111ybf.167.1602517226947;
        Mon, 12 Oct 2020 08:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517226; cv=none;
        d=google.com; s=arc-20160816;
        b=CyhMnf+vO6N6vAG1zGE8T2K5WlNcQmbVdiEGA9Zc2s5VRURU8NS9QoAMLjC97PGzoR
         Lf+Or7OVrKeUMcJq3G76NkYU90zUhiGRadNgXj8WXMfzb2O3PRjVyW+JdKXbT7lrwww5
         7yILK07khBuUIjgLWaBzBuH6I8hugxGB1Jbo3AvA5TaCAT9X7Qza20DJ9qgmxZK44cgJ
         JTKaesgkB307eYTMq/Yqud8/p3GDPe7SRCxe3TzQXx/LMRoMD1oMmOru499Mh0BtBmlH
         crR8Gglzjx+hHafu4DPaQ6Z6LO8SJX+3qkW7rCXSm9aiPh3jj9HkFJ+OLZh0ihxIjG/X
         zUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9dCI9vVIHjGOIU15u/YnihvSC4K6HLaW4rgzCu/bPQI=;
        b=ul0iDUNxicBOQVk4xCGuszIvuSyGIQ/+XAoBPuYeVwuEP7OiEIRY3BeiaAeJ7tQFg9
         8/hdRYgSY8f6Y2y6QVxx16LsbMKH2hBtXzWzk/FXhlNCYaCAGASGdgQ/TAw15z99JuW6
         NZ44Cw4bDj9WSI9mvNieSvazQXMhno5UUn2wdae2O1bS4+AYNWoUsRGk5Tx29dnABUIA
         DAp0+6/cPhxHK1kPtLjybExiNx1IfhA8UTgW09gdHQiJfpgO3lt7RjW2WFJfS9lP93pr
         K0LQuLMqzRKi5GysWXagZL8N+PjtidVjCBSyAt9jWoErySQx+yj1EESwsu30yeASV+9e
         EEFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UkSP7IvR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si15125872ybq.222.2020.10.12.08.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UkSP7IvR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzw2-0005yA-AN
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqC-0006fo-JQ
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:24 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq9-0007GQ-E3
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:24 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h7so19712745wre.4
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9dCI9vVIHjGOIU15u/YnihvSC4K6HLaW4rgzCu/bPQI=;
 b=UkSP7IvR3ZHZ0vB/gPLvDD39ym3SElSAtD6BQpwZggwMPzlDY/C4xvDMk82T8mJtCh
 w4ERaZvRFN+WqbGzhac5PynNnAb88fpGeKelbrfi5blZCuvazGR3yTPuddzujXtUjo9j
 KZoQ6qHR/D8Uv2cfFLyHH6wewMAz7IGejJDoDiK4BerSnK9waZ+50yVoVsa0C5u6wgv2
 1I0JtCeOxMPXGX3i6O/RcaPLizTNK7Nv5ZmzVDB+nbDredWeSlBVTBtf96EE/D+Ae0UE
 WtfzhYIWdqbg5oNegwG6E2uEKmKH4k9Vc4TlXD3/SRtb83/DHYVoD6uXTGlyh7rYxFmK
 aXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9dCI9vVIHjGOIU15u/YnihvSC4K6HLaW4rgzCu/bPQI=;
 b=mqPkaud+0hNE27dsP0f10NVmFNpbapVk0ngsXPLsigxD722PdD0Iwe6muWEEq+N+L3
 Ttk3Juig4wV5qxkKQootJbm0qC81pJLSBI3lZW+mpf6ByfSB90Ab8NeYyLH8Kui4TNt5
 6Hs3N+VM3LXUL0/vMcKmc9/j22SqML/ZhV8atm4ei/WfGbAMKhwbLjvNE7Kpyc3GYst/
 LoEy9C33B2Wm0DdxQrD9hzaVeAZATo69Vf6ga4pNw+AscnNIFp79RkPBJ8gwJ+GE4enz
 HNiW2bRXMs0MYia33QjkRc1QA+JvRWq0xQIdBLFtfW1liZN+TpJMiWjZz8IMgdoXa91b
 Acyg==
X-Gm-Message-State: AOAM530bLD0XeICuh57JDmPdDbrZ1hpYLKV3M73vMpfIKAdycE2o2RBm
 T3/s4iTx06xKxwGN8Y5/b5dEwmpC4voodOdQ
X-Received: by 2002:adf:e741:: with SMTP id c1mr19303102wrn.16.1602516859770; 
 Mon, 12 Oct 2020 08:34:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/10] decodetree: Fix codegen for non-overlapping group
 inside overlapping group
Date: Mon, 12 Oct 2020 16:33:31 +0100
Message-Id: <20201012153408.9747-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /zafoZ5iHBJH

For nested groups like:

  {
    [
      pattern 1
      pattern 2
    ]
    pattern 3
  }

the intended behaviour is that patterns 1 and 2 must not
overlap with each other; if the insn matches neither then
we fall through to pattern 3 as the next thing in the
outer overlapping group.

Currently we generate incorrect code for this situation,
because in the code path for a failed match inside the
inner non-overlapping group we generate a "return" statement,
which causes decode to stop entirely rather than continuing
to the next thing in the outer group.

Generate a "break" instead, so that decode flow behaves
as required for this nested group case.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 scripts/decodetree.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 60fd3b5e5f6..c1bf3cfa85f 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -548,7 +548,7 @@ class Tree:
             output(ind, '    /* ',
                    str_match_bits(innerbits, innermask), ' */\n')
             s.output_code(i + 4, extracted, innerbits, innermask)
-            output(ind, '    return false;\n')
+            output(ind, '    break;\n')
         output(ind, '}\n')
 # end Tree
 
-- 
2.20.1

