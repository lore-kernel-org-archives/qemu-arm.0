Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp320906njj;
        Tue, 29 Oct 2024 08:14:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAPi5hRUdWhtzHXc6Lt/0vMCsuEDqOYC1XgYxBI8UEcEON8NJo4aAYod6dxBCBjcwktYFPoIrQxMYNlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGVToyFQFrMnfcOz0Zd+pHNk1yZjslY2v4Q1VODTcf+CttpLESuQdPNeLcMCpDUa4cMg3SA
X-Received: by 2002:a05:622a:ca:b0:460:8f81:8c9a with SMTP id d75a77b69052e-4613c1e3fb0mr179784501cf.60.1730214889276;
        Tue, 29 Oct 2024 08:14:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730214889; cv=none;
        d=google.com; s=arc-20240605;
        b=YUhJuvpHlcUehpdERfHBvMIltVPve8IYgEUM9rvf4pGJIAnuiOdsbxmsDVkwOT6yks
         7o+aJl4H6qNUy5el6OwbEbkC6mEp0xZBuerx/gyPoLhFGM11QP6HwmRF1OzYAbzH1+Cc
         p1557tcCIWFodItwkP3IJ0u0Ky/eOMfcqx7HO5abg3rklv/vbTiKiwdQ2hO1+pdb1eEL
         aazyh9JoEAEL1e2gYJuCOROrzPZXstvKF8xJ1Fy8J2G1pngkZabep++BOW4g/WzRRtiV
         6pMn/thWGmI2zsZgn3XZxXEyzffDN79Nj63PM7H6OiAo3JhAxUmuLTwKVD3hHkliX672
         gjtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hIn8TWQshR4xk0eH6ep1S0A+hm2DkFGROZexRTXqVg4=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=jiBfNsIBAptXeEKqMx5bo7JQO17FtW/UdFTuEvaU6WS4MDvfsGPOua+JhC3XIvzAbA
         toKl5FRT+wnUO2C3VUMMRAFU0TP+FfAVAUrnw+Wh0wDRvOKB2jt3yb/zA1AVSbVR3wW0
         WJhOUD9jaPjbfVlrOQLJQ9DGhzXFrpQGcTbMhsz0he9hlAtp1gRmjs4ipEKTOgvSaRXD
         8oIk8E9mRbjbfB+NDq2dTG7bqo4mLJZEuWG3dDUXk39sIvT/yXiCnTbg2tg9cWwB/vAb
         EviOk9tSrYZuFp8gEdTVCVJ9O3y7c+AbOlmpLjc+jcDL5Rmmlnpxrl2hRfw9+jEP4mni
         R3VA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H4lExa5A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-461323591e5si109949731cf.289.2024.10.29.08.14.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:14:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H4lExa5A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5nu1-00037m-Ip; Tue, 29 Oct 2024 11:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5nsD-0000qG-DI
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5ns6-0007k6-Ui
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-37d41894a32so4196182f8f.1
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214659; x=1730819459; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hIn8TWQshR4xk0eH6ep1S0A+hm2DkFGROZexRTXqVg4=;
 b=H4lExa5A0RsdnzyMzJtjzhKvjyt73g1ZtZtZE9dJEO2+nS4oXL3G30TxHfgFHyk/Yy
 MQn6nK9Hw8ckctr4a0IttIupiyJNav0I2WtjWhN/dW4ypSoAJyjlwseQb37rGfie66Op
 AO+3LSAHL3/HvSOAiaKxRfHENqzEJPvtuB1T68OaamUKPTpTZsqxVO7zewmu4BFfgjA+
 U4AFo1OXpznfL2ikYa/Deads5gkepMJDcP2d59v3P328pmgfihN7878qjHp1360el7C3
 Axqn5M+RZ12151pxwBsE0xNUjkYO/NPCSz8JJ3FOCkEnyhyfFEA+i2TLSbO06lu8lenc
 7Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214659; x=1730819459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hIn8TWQshR4xk0eH6ep1S0A+hm2DkFGROZexRTXqVg4=;
 b=ZBJER4o2K6kLRXud+v6A1mYHLmSxlAsoBWmzr9CnhqPW+CKnbLsVdkL2QTItbhGxoR
 3dJWHh/SnjN92tW4dMq3R+OA9+l5mpXIQxXTX53IpGzofXIstBO/wbMSiUF/zr8tVohm
 mbgIOJxrwvsXQzvczoQ52Rltb503bAErFkwlfcRHnyeXFg937YGbDp6q6jBYp9SOPdmj
 DR2QXYUm5C710riJgeYyTRGmRTlSJ9GSp9KZ/sYW2wiGKBUymUbkvB5NTDI1RchJ2R/j
 2w7o1rT4jusiqBpd61jP6MorNhg/A1eFgb3zS3cjQG2Yyb2x3HQ98TWAsjPLLiMae0KY
 NJcw==
X-Gm-Message-State: AOJu0Yz5iCH9yX1LCZcUxm7GsUMVMjhYQEsbDDy8YblcCaaieL6OwBOY
 9e+wJ0ID/3IjxaySGUyNiC45vhsHX8w2J9WhvsZGvyV19taM6R9uABJsJjIZ7PbksYvllZJYL4o
 X
X-Received: by 2002:adf:ea52:0:b0:374:b6e4:16a7 with SMTP id
 ffacd0b85a97d-38159d6e341mr2167784f8f.8.1730214658615; 
 Tue, 29 Oct 2024 08:10:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360cc2esm146835865e9.44.2024.10.29.08.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 08:10:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PULL 17/18] docs/devel/reset: Fix minor grammatical error
Date: Tue, 29 Oct 2024 15:10:47 +0000
Message-Id: <20241029151048.1047247-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029151048.1047247-1-peter.maydell@linaro.org>
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Sy8Znnt0GeDx

Fix a minor grammatical error in the reset documentation:
a couple of missing words and a singular/plural swap.

Signed-off-by: Axel Heider <axel.heider@codasip.com>
Message-id: 173006362760.28451.11319467059840843945-1@git.sr.ht
[PMM: squashed two patches into one, tweaked commit message]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/reset.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/reset.rst b/docs/devel/reset.rst
index 74c7c0171ad..adefd59ef97 100644
--- a/docs/devel/reset.rst
+++ b/docs/devel/reset.rst
@@ -286,8 +286,8 @@ every reset child of the given resettable object. All children must be
 resettable too. Additional parameters (a reset type and an opaque pointer) must
 be passed to the callback too.
 
-In ``DeviceClass`` and ``BusClass`` the ``ResettableState`` is located
-``DeviceState`` and ``BusState`` structure. ``child_foreach()`` is implemented
+In ``DeviceClass`` and ``BusClass`` the ``ResettableState`` is located in the
+``DeviceState`` and ``BusState`` structures. ``child_foreach()`` is implemented
 to follow the bus hierarchy; for a bus, it calls the function on every child
 device; for a device, it calls the function on every bus child. When we reset
 the main system bus, we reset the whole machine bus tree.
-- 
2.34.1

