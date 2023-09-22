Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1398862ejm;
        Fri, 22 Sep 2023 08:30:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpaKTsSAmdQTiZvtDTGJsxlA3iQclIxC9cBA0L/XW7eUt0LheFNL2scy3yv4epKttI6PNU
X-Received: by 2002:a05:6214:4b13:b0:651:6bcc:7781 with SMTP id pj19-20020a0562144b1300b006516bcc7781mr9028082qvb.64.1695396634356;
        Fri, 22 Sep 2023 08:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695396634; cv=none;
        d=google.com; s=arc-20160816;
        b=Si+wCZGpr8pH0kAtQESLB1iPtDW6wQC8x4kAA86LL/oIzfZj9OP/Xrgvj2VQuV4gZK
         mhBw42NEQzCXpGnr21vHqGtuC+6Z4I1hfJtKdDEv3UxJMl4WhRS7ZHjdAjWYkpLDZdK5
         i9LQAUAMdOuTUB5lv4zE7RgWpuSxGgUroHopzfGWqn/oBZ73X9ejBEuGVgSOMO+VVpaf
         tN6gNp/QmO1rLQzSlVVaRdu/Azfxa+rxDrLxBy7o7xwga1RauagO/yWd7Cv/zsWO1Ce7
         BorBRNtX12SqGgthcIeiGVPedJQVhO1+ByimMRZoJsIguMy1CA+k5Xwa1PBkk0sDYudT
         9uig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e4LAtaTxpPIY+cUiG9L3w0qrtTDg/0NhKrP1vDNuOF8=;
        fh=uVBMvYrx+X7m1lFjfWwA+UgXnF+hI4+JyNcPtFqOEwM=;
        b=PXGJ3MkAGQ3DX0TcwyN42V0/EEWQWrTgbXdb+E/9K+R4OGhAhwQW9hGTuzL5VzMgYD
         A3vmzWCBlLH4vVSBYlpCPo6H4/+ViFKwx31XMmIbbg3AOJ6EyOpBeK/ko+CtEDJxYap7
         Pimop/cRIfeLTLB0E4ddYW9Qc3bOsyqX252O0TelYC8icHPfhH5THnDrDwKRT/6MUaM5
         rhKba9i4OB4a4hflXXjO95XzDsmGUv/veZ5CLNbzPnc03CXlznVgWA2Au1TtV0U7FJJk
         sCNhjEKyn+OcLPHa58Cb2yu2j9h5sS6J2GEuKdFzJQANOuAXdv9dOxNiWnyYTDTmtJpP
         FqVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FG2juzi6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020a0cdf0b000000b006582469f16csi2331456qvl.505.2023.09.22.08.30.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 08:30:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FG2juzi6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qji6f-0005XA-Gj; Fri, 22 Sep 2023 11:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qji6X-0005PV-I1
 for qemu-devel@nongnu.org; Fri, 22 Sep 2023 11:30:06 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qji6J-00007g-1m
 for qemu-devel@nongnu.org; Fri, 22 Sep 2023 11:30:05 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4053cb57f02so10477375e9.1
 for <qemu-devel@nongnu.org>; Fri, 22 Sep 2023 08:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695396589; x=1696001389; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e4LAtaTxpPIY+cUiG9L3w0qrtTDg/0NhKrP1vDNuOF8=;
 b=FG2juzi6BuwJZSfCnY93VL+yYmcYVOVjIa8g7tw4C0VdV/LA3JIhNStcVNQNV72AIN
 rUh6cx9WmI+SpX21JTr55bxTRI5KMbNcYJX6GyBhpNpIti81JKGXwykggH9KZv3aYUz5
 y0sMhYv/2ch+UZSJSt3gfjWSQtY/KPNn05kZPOr4LuKVf4SOuvBal6sown7phtHU0d9C
 qiq9hFGJKuyGWZ4Fdo8iMS3dw6lqxnkl+uSUM0Ns2XTVlLA87Arhy1BEuhr5q5894zmJ
 Vs81rqzBTfeU9jmt2xHNwX9QvqjhG9KJUQyoNM4Ybczn3xqJfsBUkS/vwIljiY0uA3lg
 3Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695396589; x=1696001389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e4LAtaTxpPIY+cUiG9L3w0qrtTDg/0NhKrP1vDNuOF8=;
 b=EDLmVimppuQjS85LR+npX1UmdgapHDaGidrehHI80BKNcAHFTIgQOpJ/1+p4Hm2uMk
 gLg/ckSEqP05oiTUobzixVuueA8uWnq3++TG0bvYkrKyb+nk3Jkhxknm46qYCWzaW2SP
 3Qgp2dlHJpqBy4ewTX5LOm6cuN1m2lVWEv6rFMtt1JMvG8t7uF2hfcmSbyiFJDp+Esfj
 1aSrKz3BPQey/6Wn1on8vePk+szr94V8ezf5MMFWPdkb5FCxIM53EcbO7pFyKgwDF1oA
 XUHs3HbXtanabeWY0i7RJzHu1eTj5RCDaNRcnHn0nZmoJoMl7WRwcYmjrntH5NSDK7Sl
 LZOg==
X-Gm-Message-State: AOJu0Yyseyri23OWt2U8y9Y8tj8dEr2KmX50vPY2wPfG+Zx+mrjHNIQc
 QeRGKj/P1l+cn7H0/9KTjivDIbLWYzRE/SDmiyI=
X-Received: by 2002:a7b:cd9a:0:b0:3fe:5053:1a0b with SMTP id
 y26-20020a7bcd9a000000b003fe50531a0bmr7723989wmj.11.1695396589732; 
 Fri, 22 Sep 2023 08:29:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a05600c171600b00405442edc69sm777137wmn.14.2023.09.22.08.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 08:29:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 3/4] hw/arm/smmuv3.c: Avoid shadowing variable
Date: Fri, 22 Sep 2023 16:29:43 +0100
Message-Id: <20230922152944.3583438-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922152944.3583438-1-peter.maydell@linaro.org>
References: <20230922152944.3583438-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: GJqitUCEBaD7

Avoid shadowing a variable in smmuv3_notify_iova():

../../hw/arm/smmuv3.c: In function ‘smmuv3_notify_iova’:
../../hw/arm/smmuv3.c:1043:23: warning: declaration of ‘event’ shadows a previous local [-Wshadow=local]
 1043 |         SMMUEventInfo event = {.inval_ste_allowed = true};
      |                       ^~~~~
../../hw/arm/smmuv3.c:1038:19: note: shadowed declaration is here
 1038 |     IOMMUTLBEvent event;
      |                   ^~~~~

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 1e9be8e89af..6f2b2bd45f9 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1040,8 +1040,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     SMMUv3State *s = sdev->smmu;
 
     if (!tg) {
-        SMMUEventInfo event = {.inval_ste_allowed = true};
-        SMMUTransCfg *cfg = smmuv3_get_config(sdev, &event);
+        SMMUEventInfo eventinfo = {.inval_ste_allowed = true};
+        SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo);
         SMMUTransTableInfo *tt;
 
         if (!cfg) {
-- 
2.34.1

