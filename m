Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp246854ejc;
        Thu, 31 Aug 2023 15:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELU4ZnHcRYiMPwEcMmdn3tNhqlGiuy1+E0QNQi6SBs5ulPcLOaCxkGRkfiRdOJZFf79V+C
X-Received: by 2002:a05:622a:1187:b0:412:1e0a:772a with SMTP id m7-20020a05622a118700b004121e0a772amr999424qtk.17.1693522664451;
        Thu, 31 Aug 2023 15:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693522664; cv=none;
        d=google.com; s=arc-20160816;
        b=q5bNVUC/ut/mNT9stLT54hXscEdj/L4NB1n06JKIgHMR2Eq/xbHHqrwKAAiLNnuSNL
         /i+MHBPsYmnvPtsKVtprgcXAvcKjLyUzjDtkX+sdFNP26fbyjLsklM3JI5s3j/wdVxYB
         xBnA/4J7GQhhh5EcRI0U83dTU2NlKbggUf0a7eN7NY+rqC+2sME1ryuhn1elp/7gNOMd
         jYz+b1dStqkW/a3PNn9ajKuySK59dNlJCQtGScvAJfTxFhcLzaf04pi4Ra7+KVLg/O8A
         DDR6JOeBeOObStBkRCHmndqOEvHgv6UQpN1lEvtyF7n5g8wtpSfp+fQObLYZKYxbkt6e
         kKbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x6ajozl3I8cZhElfB+2XmFUmgwvrNnndLTvZEZRsKzQ=;
        fh=eWX20Eppb/Q2rNA1nFHe9JP7BELrntjubfujrTEXet4=;
        b=DO73Hu2W6Sbd0kkfzFATULxUiHLpwpihkAIjWrKTAXxPWakW5WvicwzzB2zGf2Y65p
         Sp5iksv+r7fKYBDtZV8CxjfdOni+QUC/DQV1Pnwqqckm3PLS5lC1fVM51oU0fRkst21A
         FkDDVOza5YRgh/Sfit5P93v1bfUA1XM9yJMEZ+dgDD+9ZYo7EqK0AaqEtqgmN5du/JkU
         dl86zZ5P3cZGRjkobIuLb4IJ1XVkkt+IpdEHSuChwl+L0NOT8GsoSCcCx2q/SEzljYFs
         SvIOUn33a5pJgAwl5UKWmkLqTjHkgDkw7zvL/fkYk2+1Q+b0CECQHvv5zkcKJta90skB
         cG0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qbs72Wtg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dw27-20020a05620a601b00b00767d8e12c98si1688525qkb.282.2023.08.31.15.57.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 15:57:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qbs72Wtg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbqbS-0004fa-3t; Thu, 31 Aug 2023 18:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqbB-0004a8-AQ
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 18:57:13 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqb9-0003Au-5O
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 18:57:13 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99bcfe28909so151988866b.3
 for <qemu-devel@nongnu.org>; Thu, 31 Aug 2023 15:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693522629; x=1694127429; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6ajozl3I8cZhElfB+2XmFUmgwvrNnndLTvZEZRsKzQ=;
 b=qbs72Wtgr5wleqqxACB2kg5jrFwIOtIYweM0AmXR0vGNhP0RPJuaQ1zHjixnJlcc0y
 844xTw+Bm09WwmFFT1MarqvxiZaYwKRJkYPCjlgkjT9nZRkUiLax91TCwR0MTGAxVLPK
 GutDeGUHzxkG/JXcOov15ZeDBvFeRgHbPywwxmmFLawRKKv3Shl2teTxmW+nfl96e2F+
 fb6sfHSegvd+Ur1k1uX2YkQk/h60FhC68VLcLXjqPOBzvOxHnXvWrdOeZvkSdVRkI6RB
 4LhkdingWREmc0V0GkI5BLyhZiz+Xx0cXE9wmlyY2Ouu/XLnCmheREakmlInOABXbf4b
 UX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693522629; x=1694127429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x6ajozl3I8cZhElfB+2XmFUmgwvrNnndLTvZEZRsKzQ=;
 b=PPMRSjdh4p3NS/52RWrMSrHksJLw4Ul6XEhnA2bHq7mg0+vV1gzQsgxNe+bneJ6L+1
 1OCJzu25CKmAkxt8+cdlB/tu4ug6k3Vq0ByY+kUnNoeK3f7tCP4JROU9cVwN2MNKGr5h
 zFyVe5eMzkInjjAYrIClCu6JAC57Oscukv8yfvt5Hb/sTNVR9FhKWAvd0Jz0Y7085AND
 ye3yq/13NYd1bMQtl9ATJ1ae2kdR1gwjSXMp9hGFVPdxfJjhwfoYAQcdponmwUxmbJFB
 UWW77q+yKQkMXuu1NSpUrh058aM7NIrSXxn+XvAWsOxb9l+t2TSzEGW5LJiTfnuqJaJo
 z6RQ==
X-Gm-Message-State: AOJu0YwkFlql4pbtsCIdXHX5HKivFDpajDI/H1Ro7cFHsDtuakF7QyFb
 hcZd3He0KJ9qeNbzeYZCn0lfzmoXrR3PiMdb0yQ=
X-Received: by 2002:a17:907:7804:b0:99b:5574:7d0f with SMTP id
 la4-20020a170907780400b0099b55747d0fmr439332ejc.23.1693522629667; 
 Thu, 31 Aug 2023 15:57:09 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 dt22-20020a170906b79600b0099d959f9536sm1273599ejb.12.2023.08.31.15.57.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 15:57:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH 10/11] net/eth: Clean up local variable shadowing
Date: Fri,  1 Sep 2023 00:56:05 +0200
Message-ID: <20230831225607.30829-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831225607.30829-1-philmd@linaro.org>
References: <20230831225607.30829-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: kqIDQ6EoDBGG

Fix:

  net/eth.c:435:20: error: declaration shadows a local variable [-Werror,-Wshadow]
            size_t input_size = iov_size(pkt, pkt_frags);
                   ^
  net/eth.c:413:16: note: previous declaration is here
        size_t input_size = iov_size(pkt, pkt_frags);
               ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 net/eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/eth.c b/net/eth.c
index 649e66bb1f..cf030eed7b 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -432,7 +432,7 @@ _eth_get_rss_ex_src_addr(const struct iovec *pkt, int pkt_frags,
         }
 
         if (opthdr.type == IP6_OPT_HOME) {
-            size_t input_size = iov_size(pkt, pkt_frags);
+            input_size = iov_size(pkt, pkt_frags);
 
             if (input_size < opt_offset + sizeof(opthdr)) {
                 return false;
-- 
2.41.0

