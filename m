Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3956987lfa;
        Mon, 19 Oct 2020 08:13:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp/ND8LSqvQt2gltJE3TKY+JwgVss/4XW3J6loSYeDus495JJrG78VyRfdXtVuf0gj1Txl
X-Received: by 2002:a25:e407:: with SMTP id b7mr238147ybh.280.1603120408641;
        Mon, 19 Oct 2020 08:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603120408; cv=none;
        d=google.com; s=arc-20160816;
        b=jo1ht3JfWDk0NJei3K+/sybds+mPpTZ/7ha3WzDdyxDkTsnxWvhaRsvu1STmcy7Ka+
         wgf7ktVNy1D3+OUR9FSkMlLSAYmZaNcSfm6sIrAT6i+o2cNqRYhOMeWMfK+fXIxJnHDr
         01Mrdd5XE8uhvGC/6PDyQpA3c1DNYcrrPD5eqOkAvITwmNsKOcZpOppTHt7SABmo6zCG
         zH2boXweHOfREYr/GEfCJetr+jxTbgMxWT2gEgd4rUFY4pJLQhKg+XdSTGxoXNataKPc
         gAYPjeJ/wmwRIAMPYnB5f+5iQ7R8HLeR9bXPxhj87FiZBYFUTi6Mtkb5Vc14h5C8WsZj
         Kqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SjAOm7vNdY1fRUdfqYZeeidFWrwzSxpq+qzgfHwNtsM=;
        b=JyLcGCyFd/ZpDJmw13rddtvBfgqAhhbGwHpzrffzolcgzBxDhSXMndS7kaAy3O5+wZ
         BASdImkzOpE183z3mVDrUW3XZOVBQ7sxvrzuInJYYWHN0qUSzFICwEEvgubZWOGLspzf
         IS/uKvMblC2IWL9Hj1e/XvdQ/8cOMtNcgQXi53DFY9XrPfWKdeNhekYblF4DEayd6kOu
         Urssp6zlOuGmgroYISd4iNiHAJTScgAZIpAVKwDDMwcIruibgrfQns0WY0NmTLLihEk2
         LoIisZSUqceOK9cGlscPHD7LZ28OAND8WpClUw3DoxInbRK2izyabbScIp3zQmmZQHXF
         ySDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tALTCdei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h188si217081ybh.436.2020.10.19.08.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:13:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tALTCdei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUWqm-0006qH-1F
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUWqU-0006oT-RP
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:13:11 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUWqQ-0002jj-R0
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:13:09 -0400
Received: by mail-wm1-x334.google.com with SMTP id e23so186031wme.2
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 08:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjAOm7vNdY1fRUdfqYZeeidFWrwzSxpq+qzgfHwNtsM=;
 b=tALTCdeiFwC/7fynmi9JXz2zPwiHM/TCHffDUEDNeuvHvSJ6BghwLtZx15rlpC4vRy
 /UKegIHpU8yEcrEyr6hl7BvmGCkybV1zK9u8ZSO35GUnZXDE0xdr9+DXSQ5ZZfniwB7K
 w5ZH+9nS1NDpVap5Ma1GqcoK4JZRo6CX3Yo4GJK4vfnYnmb8v62tedyFICylQ6NMb/Wi
 u73mxIBAw2pFFsc6EkBfQzB8QWN+6ebbiZMAnk0HnKNp6Xx5WmFPIhAjfR5oXT4xYDlP
 adLGlOhJS1lKIV5vNP6BxMWWfhtX2lq4cx87NL7CVuiWDM5Dd6SeopSNfmgxZfciTmMl
 R5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjAOm7vNdY1fRUdfqYZeeidFWrwzSxpq+qzgfHwNtsM=;
 b=htEaosDwF4OwHDZ/lQe0Kl3t3N50bYM3OJVF1dKhDPSW59pVlX6yyiZCqDV6b+63t+
 s96eSk+NpsXQxFEXMrAOGIZWiLEcCjBNvuCU2TMiDbJt5Ihco0J8M7qEGeJaaSfckMby
 hppjK/PWEDwlFQkzKjrpDnIgro6twaNlO+kKMaL7I1MqVTlJk0pJq+snKLCNbxbteNxg
 zcUqAlhiZYSj56wSG7ZUxvgFOjuJhPQTR7+omXtslbJEpzOKRpvIgzsXohsR2q2XF7QE
 inXzDamd66pTsX+n0G5cBtQVFw4oIJzqZoLV0FNBrAD9CouhIjEt0Okaw3794ScA3dxq
 Eiaw==
X-Gm-Message-State: AOAM5320MzMQMAOCwZaR58NGt4L81zcNCgJM/eq7tNeck+DcloHKbHGa
 AMjsw0EoBwORtj49jQB3CMacUNAFUGkMvA==
X-Received: by 2002:a1c:ddc2:: with SMTP id u185mr18714567wmg.21.1603120384901; 
 Mon, 19 Oct 2020 08:13:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm309918wma.48.2020.10.19.08.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 08:13:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/10] decodetree: Fix codegen for non-overlapping group
 inside overlapping group
Date: Mon, 19 Oct 2020 16:12:52 +0100
Message-Id: <20201019151301.2046-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201019151301.2046-1-peter.maydell@linaro.org>
References: <20201019151301.2046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: CtEw9JZR4ilJ

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

