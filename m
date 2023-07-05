Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3579845ejy;
        Wed, 5 Jul 2023 06:33:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGl4dv+8Z5/KoZg0QgEO0As5Sf0H1P9g3soWRDJsXY5VxKH4Wh4cOitimTLJwJWiooxe/Gk
X-Received: by 2002:a0c:aa0f:0:b0:637:7671:588d with SMTP id d15-20020a0caa0f000000b006377671588dmr295426qvb.28.1688564000785;
        Wed, 05 Jul 2023 06:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688564000; cv=none;
        d=google.com; s=arc-20160816;
        b=D2AiLBjErfWa6a8xETaHPbDACprSFL0uFR7KKFDxkxOqRgsbN5bvO1uKoqYetEL7Kn
         M9X+ZYr+sahObaPNVyYX+hkREnSvpvvIVMkdVty/h5HVXqw/vcN1xmsGHNJrZ0jr2YKm
         zviI9z+PBgvBMW3zIYKhrFBjPtnf9PpudsfEWZgjfBVX+DVFeJcfbXThrzWOriNqVJ0N
         0IYD/TUUWtW5htkgv4KRQthgmpEMF7Q4cYyKRAZpI+opgC4uSEPlSeAGibuwLb1vuOV2
         6aobu+hIFRxlHEwM0b8q2isX98hNiLN6quYczdWXVRrsqHooC0PFL0blzK/fsYoCh8/o
         9jXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BC1jdW44jTbjaqw2f+cHkqvuGEwANPMIK+BI/ks2IFM=;
        fh=QXqlxiHoBliGFMptr7ZMhDvY0ya7oCRNrlYjmpX9sZY=;
        b=iMEPHl8SB/MPXx5kxdkOpHWaP5U7V4voedDcDk3RVHud0DBgDgO+xsyIFulxhIFN4A
         HaIenzo1bmPJzjW/hMRY+Rbr3q7eiLC4pqekwPmlf0SBRXtPgy4VIYaNXE70ySwWZ28Z
         8uz9HMAOdA+njuf9/uFhgaqNZQUJGBLY2mjYZbDWN2tCptMOMKMw7JbqeFjSVudkQxJT
         66LSeG2NYRlmsY4wi24H3Op5xosYH/wfOHdi27WNSEGa532IVIGNc0UsLOwwtA1QkBk+
         EkSozefYpkhW563/qGbd94NVX3r6kdpS07wnKi2YvtXfQUD9qWkBIvkBsUQbZCanNsNk
         6RQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XDbDSozq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qd10-20020a05620a658a00b007671efb6208si10576159qkn.585.2023.07.05.06.33.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 06:33:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XDbDSozq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH2cc-0006PD-8n; Wed, 05 Jul 2023 09:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2c3-0006Ju-OA
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 09:32:07 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2c1-0001zM-0R
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 09:32:06 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51d91e9b533so7542945a12.3
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688563923; x=1691155923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BC1jdW44jTbjaqw2f+cHkqvuGEwANPMIK+BI/ks2IFM=;
 b=XDbDSozq35ZG0pXCbsCpOfO7iANG2I1G6CfJEwXUGwroSkox9wFFNPyOFGZlyR0ZN1
 gwSR6q5IJz+JTmQ2+HbnA+FsJfFx//Cx7MDyGP6xqQj5pS8ePITVfiOwS4HaDpfwKMz2
 qrjCJtX5x+LUmHqvD54lu8bxs6nUpC92QkmxBjeGksl1doJjDZznu3Vzzeblx66OHvKH
 5xcZVJGN5LKzY4XzxMaV8KQpZU4unp00GP8BjzBvnfUcBFb+hViKs/Q8iXZ2UCqhgA2/
 Ofv+d+6bfYkIhIr9u0Al34GR1epXqVgc+DLTVzoODWhDq0+huYQP16zih5ysaio9/66H
 pfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688563923; x=1691155923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BC1jdW44jTbjaqw2f+cHkqvuGEwANPMIK+BI/ks2IFM=;
 b=l/drk7Vz+0BoVH5O18X3Wv53xywVix1tf7o6T7PTQYUAbhGnnIztWkNO9VjAh40RjM
 2rrOq7Mqx2acOfvWQrj6RtWHAjlLJkyAR1wF1g+SSQ28e8kK94JqWFoIdO8gQBXNiXhk
 Dlwl176SbDDGs5e8SBWsbaZrJQymCO8vHRiL4WDJrKAge2gFZdkIfEYAj91xV/IdhHAv
 pqFqx76CrqvUvoSXPTwR5Im9rzLLP0uherl2PMGyONWnFXMY+fjd0RjUyNJv1EjfTw4+
 N5wb8pHv6M2B7/p7PMNUTSQIp4p13XcTrixSPsDresZm/7R0o6jQTzzRUIf+4hJfjFP0
 fo+Q==
X-Gm-Message-State: ABy/qLYOn/QHiKSqgZiutmaWov8uj2dcETVSrgi6PnyAofaIdMZv/pOJ
 PUDKaOVTKnqkm6BC17EUB7QVWw==
X-Received: by 2002:aa7:c158:0:b0:51d:9ddf:f0f6 with SMTP id
 r24-20020aa7c158000000b0051d9ddff0f6mr11671088edp.36.1688563923308; 
 Wed, 05 Jul 2023 06:32:03 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.142.96])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a056402148b00b0051e1a4454b2sm2701296edv.67.2023.07.05.06.32.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Jul 2023 06:32:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/4] io/channel: Explicit QIOChannel doc is based on GLib's
 IOChannel
Date: Wed,  5 Jul 2023 15:31:36 +0200
Message-Id: <20230705133139.54419-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230705133139.54419-1-philmd@linaro.org>
References: <20230705133139.54419-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Lc7/pQgy9eMM

One can get lost looking for "public API docs". Explicit
we are referring to GLib IOChannel documentation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/io/channel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 229bf36910..998718b470 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -97,7 +97,7 @@ struct QIOChannel {
  * The first five callbacks are mandatory to support, others
  * provide additional optional features.
  *
- * Consult the corresponding public API docs for a description
+ * Consult the corresponding GLib IOChannel public API docs for a description
  * of the semantics of each callback. io_shutdown in particular
  * must be thread-safe, terminate quickly and must not block.
  */
-- 
2.38.1

