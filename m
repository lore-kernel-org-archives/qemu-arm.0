Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2824205ejb;
        Mon, 20 Mar 2023 06:43:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set/Rdm3G52VgFmU2+W7pgJijuz7cKqggUhfX4GypFSma/wZh5CL2/U0k/6/3/moVPRiX53Hd
X-Received: by 2002:ad4:5c6f:0:b0:56e:a791:37c6 with SMTP id i15-20020ad45c6f000000b0056ea79137c6mr59196629qvh.16.1679319780037;
        Mon, 20 Mar 2023 06:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679319780; cv=none;
        d=google.com; s=arc-20160816;
        b=MIVtPuk/RRdFO4qhjOAbGwpPvxfy5Tviw088SRB3xhzdM8ro5HIPyrS9pYoIRC16B+
         yj9lUdkUmAlfun0GaccZ+horo2ZnbNbxo45L3AVH9xzXxK7ywrJIZVmZPFOYoMnPf6Yb
         +4pgUdAREI5ycZdKajLCiKdwg8ITb44A9HiR5ZBmDJCNJrWus0Nki8N966j5b6d+Jk3S
         rlraFUKvpTdKE3mJPi5Dn5UqmmGovKPONfTpEP398JawwcBHZecr95+TfdjB71wgzif2
         G5FRPQ63bU7lma0FwNrPlntu3iWV6s8WE6SbFg2zwAIFHzUHpCwlGvO29p3GnUuBklmg
         4s2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pdlASMT4jISCzMP7osi2/4IX99eROCkVPgjLB1OApxg=;
        b=kW31UFEe5x9/UsFZBNFIqPc+aMrGy2al0qESRGC27psX2PZF2WpOOKM/DQILF+L+fV
         jL60a/384PKmyagoqZPihZ2juGfTKq8OduKtjveFQQXXAGtFK+0/rqRmjuSLz8miW3fv
         Ccw3m4yxZE8ESPgMFfnYDAawKYBgfda3dl7zfVYEcb7qpjC+RqLx/pjUlaT3TgUxXe6G
         fzAIDBQswdlm1zRlg5JDvi3ofHOwdMuKZ09jlngV3x5vLwma5YzcffDPt9qUaFayNMh1
         LhohVffq6SIdgLMjnmXXuzFL8ck28mAv3Jhgwo2mx7IzTBwt4WKfYG79vL82lBlaqsfW
         OIMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=avX1Qg+h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020ad44148000000b005994d62c127si5676362qvp.70.2023.03.20.06.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Mar 2023 06:43:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=avX1Qg+h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFmS-0006Wo-52; Mon, 20 Mar 2023 09:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmQ-0006W5-Ku
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:42:30 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmO-0001q3-5X
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:42:30 -0400
Received: by mail-wm1-x333.google.com with SMTP id o32so1146834wms.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 06:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679319746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pdlASMT4jISCzMP7osi2/4IX99eROCkVPgjLB1OApxg=;
 b=avX1Qg+h2b0RZAo1ojnrb1iql8RIL2p0UrP8OWRglchnMWQxtbGI6+ENSfRPaCxAn8
 fAcxbvUwuq5JPvE7a5T9GwanXT6u+fKnay0vDw8GbaMGJEvm1RqedetRhAtHYkUC1Tuq
 G79SHwnLtHFux/Z73+Xy4rheTmynHPh6sYSw+HRjkKwBnAkI0E5uL9ZmsRpMAM6OMQtT
 fs+EtkM316QNnbNpI7R665nVZGk94C7hbPJFHrtDk9wqveDApL97XQruhhTAocNhI/Qu
 JHPN8XuRu6YBJKbsODCCDpHrjuIMt0vNxbAI0jaz3GmPklnlQXmbncf50SJTHEVuczRP
 kHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679319746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pdlASMT4jISCzMP7osi2/4IX99eROCkVPgjLB1OApxg=;
 b=iuadR0B5AnISsng0wn0cAuVRHNZc6vK68W/umDuG5+/5fgzOgVJ7cZzMLT/t+4CH7E
 505i9ObVaPlb41oXMV4IQ5x+JmRj1CXgR5Y872JbFNB8wPCBh9kJpY8tjSiuffN1YjuN
 pEd9YDLB+mcNnxGIblFJNb2wesm2R5bfWOP64GqFX88g/oBT+D7qwXvzRuD/yHvHS2Gz
 FmGwLadvKyKgHoZ7hZHrvDgYPLlnj/6kIXWIb+g+ljKcPOl2YMYtMzDc14JeYcEPBXK3
 mF6f3A2Bcg8HyKSh2SmQKUPmvxinLbf9XfiNwdH2bGzPD8uImopJaLmX4Sa0Q+D+RHgo
 A/fw==
X-Gm-Message-State: AO0yUKXKSTeFX4ivH7GgXP+JKcXnoyVoi1vDibymUb2m+51IidpNtOMy
 PSFHQ9JuZJ+SB7Poei/G/mvFv0rjnjZfZFQxCrDpTA==
X-Received: by 2002:a7b:c7cf:0:b0:3ed:dfd8:653d with SMTP id
 z15-20020a7bc7cf000000b003eddfd8653dmr4556198wmk.28.1679319746379; 
 Mon, 20 Mar 2023 06:42:26 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 16-20020a05600c025000b003ed1ff06faasm10524429wmj.19.2023.03.20.06.42.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Mar 2023 06:42:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Simon=20W=C3=B6rner?= <contact@simon-woerner.de>
Subject: [PATCH-for-8.1 1/5] qemu/osdep.h: Do not declare function prototypes
 using extern keyword
Date: Mon, 20 Mar 2023 14:42:15 +0100
Message-Id: <20230320134219.22489-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230320134219.22489-1-philmd@linaro.org>
References: <20230320134219.22489-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: TSBu1ebibn5D

By default, C function prototypes declared in headers are visible,
so there is no need to declare them as 'extern' functions. Remove
this redundancy. This also fixes when building under MSYS2:

  C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: error: standard attributes in middle of decl-specifiers
  1075 | # define G_NORETURN [[noreturn]]
        |                     ^
  C:/msys64/code/qemu/src/include/qemu/osdep.h:240:8: note: in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
        |        ^~~~~~~~~~

Reported-by: Simon Wörner <contact@simon-woerner.de>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1541
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f68b5d8708..79c26c748a 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -237,7 +237,7 @@ extern "C" {
  * supports QEMU_ERROR, this will be reported at compile time; otherwise
  * this will be reported at link time due to the missing symbol.
  */
-extern G_NORETURN
+G_NORETURN
 void QEMU_ERROR("code path is reachable")
     qemu_build_not_reached_always(void);
 #if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
-- 
2.38.1

