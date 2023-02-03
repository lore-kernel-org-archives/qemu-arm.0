Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1641872ejb;
        Fri, 3 Feb 2023 10:09:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+/Xfw3DQ1aDks5yVtBWb4tl50Qa7wuJta/vwpJCIVK2+y5gwzgAUDimmJdGrwrVNg/sOEq
X-Received: by 2002:a67:8c5:0:b0:3eb:f196:2e37 with SMTP id 188-20020a6708c5000000b003ebf1962e37mr5160429vsi.19.1675447774253;
        Fri, 03 Feb 2023 10:09:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675447774; cv=none;
        d=google.com; s=arc-20160816;
        b=lHXboA7MtBfzbh10JKqQAPXsUR09SgFH60sTf1aQcOMsPRVHcUu7fnt1w+98s2Hlm3
         r3uXaybfFkvpN2s4dIgquzhGP/7Ja4ThyIZXaEROMSxGsOLlm1NS6xKu2kthLvncMWxX
         vRGL6ys/bpuHYiR4RWYbV7uzpl2qv9aAeWzDBkAn+k4Ldi8kio7O4FSuTFdXaNTOU8jR
         F0qdNtNlccr6+JwifsiS/CZE73tlyebc8YUHWW3p4UweR4D17mmmO1MIvJqHBznU7GGA
         zzO/nhvplUnrL1ts71pXe8D08fEeMlL7HWwBlb2BDpuKOJHlgUF6/cT46DjtOo/S+D6P
         K7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LAfKidwXqMyl+hQg1D5zpybmHVz62NdxFnrC9ga08Jw=;
        b=X3EW6x4liT2lXoOqtlzd6CQULQGjY+wj7n0hkGu9tf1o/o+HcdfQp9BS9yk8Fjdvdc
         7cs1TUcT9R6sDZsb2WeEsoIxb5fRFF1XGGlOhwGO9Em4hryufSN9h6ySK3uN2NgD5Ywh
         69aoNv3b147Sss63pazqJwI/EIUAeulyHwVumjFrfb+WG55to9vfW9z/LpjdWX7IDtxo
         06w++qBgrQjJhmqend8wDzEpTA5D2girmjSwyVjMTzeVmZnCGCPvbo0iynEZfL2zwmj1
         +oFbFYeBmrMKkv5T4LHjoWG4LSlno4GQo/oXSy0uf2KztgP1f1HzWGG3VY0VyPq5LZF7
         k5DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fCrQpY/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14-20020a67f6ce000000b003fcd235899fsi842562vso.718.2023.02.03.10.09.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 10:09:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fCrQpY/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pO0V9-00073a-Iq; Fri, 03 Feb 2023 13:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0V7-00072N-12
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:09:29 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0V5-0008Aa-Fg
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:09:28 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bk16so5372655wrb.11
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 10:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LAfKidwXqMyl+hQg1D5zpybmHVz62NdxFnrC9ga08Jw=;
 b=fCrQpY/B0WPvykR/ypTqqefxBK8DwNly0OXMnU2qMfqW5gm4/NtKE1gcc2kOGS4G+R
 K0K98fG/kenQ8SY4vt9EQKVU8myl/Ab48UmBjG1uu+m6hNrnsZ3vput7UHGf0EAcVMcK
 ZrcqGBUr6r24pN6eaPDMmy32xkEljZXdb2MpbWO/axaZrpYFGo0TrB+ALPAlLHmffVwh
 DvLJg0xdWHJOktZltFeByL2u7BYs1idlLzJjzWWdU3nHSXMOYyg97O6uEQuDL8juZWGO
 CVYtXvMXm89e7Z3onE50xKaZIToE9DDReA4m+Zaw6uC94zBpngm2DlSV9KM2J84TN4Yd
 rGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LAfKidwXqMyl+hQg1D5zpybmHVz62NdxFnrC9ga08Jw=;
 b=4YSOyrCOC8BcwTyssgy8ep7dLcH7bAeRmlrsHhXHhuGoJUEaPKMZLiodNVhWew405V
 KlwFKsUQnu3A6IyllZOCGd+SH9Ky7o0CVvI+qaRCrVxkPDKsBj/4TNvZqdUOSJvH42Ab
 l3dVoJgG8lzE5b7vPiCWrtZB5A0sE+teIAaKSCGD1xknwuXyYEv3T2GtDB7FwJmAd5gi
 D7Fne1KODmiMXJA2mZqc/zps40gA5iaHyTbwSPc900ZqSxdRtEzEfMkZznfyFTXNm5Ja
 X0aS8dAqmM0MwePtK77HNcz5CeyokKjr20tljxE8EBOnt1s/W1MQffaPde8feUkDIQjo
 mieA==
X-Gm-Message-State: AO0yUKWYE3wJ8SF/964a3i87HumfV/cAK9JX/K97k/qehSFf7jcs5VQY
 cxoJKmleDfxU7AnDnJCnmaSOyQ==
X-Received: by 2002:a05:6000:144f:b0:2c3:be89:7c22 with SMTP id
 v15-20020a056000144f00b002c3be897c22mr5197083wrx.5.1675447766299; 
 Fri, 03 Feb 2023 10:09:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm2474545wrs.40.2023.02.03.10.09.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 02/19] hw/qdev: Introduce qdev_prop_set_link()
Date: Fri,  3 Feb 2023 19:08:57 +0100
Message-Id: <20230203180914.49112-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rqMb37cSJouD

Introduce qdev_prop_set_link(), equivalent of
object_property_set_link() for QDev objects.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev-properties.c    | 5 +++++
 include/hw/qdev-properties.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 9789a2f5de..46236b1542 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -694,6 +694,11 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
     }
 }
 
+void qdev_prop_set_link(DeviceState *dev, const char *name, Object *value)
+{
+    object_property_set_link(OBJECT(dev), name, value, &error_abort);
+}
+
 void qdev_prop_set_bit(DeviceState *dev, const char *name, bool value)
 {
     object_property_set_bool(OBJECT(dev), name, value, &error_abort);
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 21f399e9a3..c16dbefb2f 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -191,6 +191,7 @@ bool qdev_prop_set_drive_err(DeviceState *dev, const char *name,
  * Set properties between creation and realization.
  * @value must be valid.  Each property may be set at most once.
  */
+void qdev_prop_set_link(DeviceState *dev, const char *name, Object *value);
 void qdev_prop_set_bit(DeviceState *dev, const char *name, bool value);
 void qdev_prop_set_uint8(DeviceState *dev, const char *name, uint8_t value);
 void qdev_prop_set_uint16(DeviceState *dev, const char *name, uint16_t value);
-- 
2.38.1

