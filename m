Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp133832ejb;
        Wed, 8 Feb 2023 15:55:30 -0800 (PST)
X-Google-Smtp-Source: AK7set84CuXcrMzlusl5I3Gl/e9f9I2VZ2MRmmcrQDGWlKKnTU6qkmZT8PsXDbJCG53QDIh1TnI5
X-Received: by 2002:ad4:5ae8:0:b0:56c:234d:dfd2 with SMTP id c8-20020ad45ae8000000b0056c234ddfd2mr4584784qvh.24.1675900530008;
        Wed, 08 Feb 2023 15:55:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675900529; cv=none;
        d=google.com; s=arc-20160816;
        b=eJOxJPauvWsXVlFUMaAZ547YTP4LeTGFCo/U1XFXnrkydSFQUfkLjaaWeuyaaN5RjH
         gT7RWEo+JuuUg9n76UapftYFTb+AkVDSRj0SldXQGKr7OjGObjcogt6iPs37snQVlxiF
         BU4YXukrfGX+YxbiuV66Hq4CTFRI6AQjzdMqCA2UYQH9jCXCVN+HCgDc7S/0q+dOnKYc
         MIivUuUHfg3riRcKhbe4cXtrnCJrB1J6SNRZGeiV12oBmHgtDpRYOmAlum8aKP8XZO7v
         /HyJlMXuGb396tcomHdiJ4NE1tESJfClC/t1zLfTTYN6og6X5m5Qxj4Y9kd0JClLlIB6
         xzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=nH4HQe+MV9tjbVXhRgWQajwGe2OH3uEMzVPFxvxzzdQ=;
        b=sKouA7Y2NRogzIiIMLbLSS8/dcsLY69Mk7GgJsczeUq+08FRHQrS95EOLMiNp53S3F
         8dWFbZ2kIlsV57c5qPmTxCg34X2F+zdCH1/0MHkAs511L/nkoFyQEEkLPgCXheF8s512
         4A4y2GiTTadJqaooRKB2uSKFxd+UQmA6DAXiL8QkTLo4BqHrTUer8fFZEml7VDvup+mI
         c34NO7bYY+QacaVSd3towJZownMQwUFMUzmqUjqXW/prmjsTXmXLrErJbuxADJzIxqbu
         i0wPJ7q8av6tPhlP8dmFYdwiOcF3nluv+5sIKbLPDXn4LCnH6VoIBXJWeQA2HAbvGiq7
         aoGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Prrb+UmJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020a0ce149000000b0056c23509ee1si96263qvl.222.2023.02.08.15.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 15:55:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Prrb+UmJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPuH2-0002UJ-3t; Wed, 08 Feb 2023 18:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3PjbkYwgKCGEVTG9NSRGFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--wuhaotsh.bounces.google.com>)
 id 1pPuGy-0002Rv-G1
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 18:54:45 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3PjbkYwgKCGEVTG9NSRGFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--wuhaotsh.bounces.google.com>)
 id 1pPuGw-0003UY-9K
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 18:54:43 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 o131-20020a25d789000000b00859dddecf8eso287712ybg.17
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 15:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nH4HQe+MV9tjbVXhRgWQajwGe2OH3uEMzVPFxvxzzdQ=;
 b=Prrb+UmJo0o9gbFleRCCDtP+rIh8YSy6uG2BxNvcKEoXncxY+nhpGLrK3o7E2wRuXK
 0RHMfmNcTLVOsJ+KlfoN2+bZMqBAt4TwYopKi/Jk1cqR+p3+qD+A2IQe/FuR61GHuxK+
 V9TIqjpq/F0WMzxHd3KsfGIVOYz/o5lQMAUJsz5MT99zwUEKcg0QQGs4lYiJR1vSimEu
 nRdTLpideJbs977ZUAPNevIj5bQs35wG2smAKrmwHXnY9DV726ux04Edt/8+gyiuit7u
 2Qo9DFq61dljrUYo0btpbsHW6xSOhN8zMAoa16HEj5SNEbdxm1dqYBsIEM7Q037nh6wi
 onBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nH4HQe+MV9tjbVXhRgWQajwGe2OH3uEMzVPFxvxzzdQ=;
 b=demVlF3TYSnw1LNdNhQ68kb8RUiRHo2OsD9V36k0hIpuFmSY2r9r/nzt2lPJmbGMq4
 PtrkpqRZwcma+PCLnHTl9eDF0etNNsbifot6KqYNFEgYMwuhdY+5QtTI4UwOAKjvpsJv
 mK2Mpqaygrr6/jiCRp1RbCWA5PvjnykupL24CUp9g+ie0x1GDdQRIAG32/Q1LWAR7d14
 AHeRG0MmzozFLfPV5hmjOK69gvxLP0CK5YHNSgAL5NDdn7HS/8nOk0wIOcsXebcE4Ul2
 Dy+lJZD8q+y+G2AfRava59U5pdBkn06zs1vH/rjVYD/X83PDmosT82GPJ3aia7OMUgO5
 WaMw==
X-Gm-Message-State: AO0yUKX3FBfNBXw0WtH7Y8i4Kug7/Emm7xoMWJf1YbzzJwqCY2wThKpe
 LRi1THZWieXn13/OY85qJX6kP+Xe8yz7Vw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a81:ee06:0:b0:526:859e:8b16 with SMTP id
 l6-20020a81ee06000000b00526859e8b16mr3ywm.8.1675900478836; Wed, 08 Feb 2023
 15:54:38 -0800 (PST)
Date: Wed,  8 Feb 2023 15:54:31 -0800
In-Reply-To: <20230208235433.3989937-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230208235433.3989937-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230208235433.3989937-2-wuhaotsh@google.com>
Subject: [PATCH v3 1/3] MAINTAINERS: Add myself to maintainers and remove
 Havard
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 Philippe Mathieu-Daude <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3PjbkYwgKCGEVTG9NSRGFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
X-TUID: bTH2GOXU4IQO

Havard is no longer working on the Nuvoton systems for a while
and won't be able to do any work on it in the future. So I'll
take over maintaining the Nuvoton system from him.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa10ecaeb9..347936e41c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -799,8 +799,8 @@ F: include/hw/net/mv88w8618_eth.h
 F: docs/system/arm/musicpal.rst
 
 Nuvoton NPCM7xx
-M: Havard Skinnemoen <hskinnemoen@google.com>
 M: Tyrone Ting <kfting@nuvoton.com>
+M: Hao Wu <wuhaotsh@google.com>
 L: qemu-arm@nongnu.org
 S: Supported
 F: hw/*/npcm7xx*
-- 
2.39.1.519.gcb327c4b5f-goog

