Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp341807lfu;
        Tue, 26 Apr 2022 09:10:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE0o6Cd5/iNd3Ye+56cXI6jYaxWUTew6mYZJuzPQGPQru6Ehumn6EK5LM+FzRyYLkGsSuk
X-Received: by 2002:a25:c604:0:b0:645:d969:97a7 with SMTP id k4-20020a25c604000000b00645d96997a7mr17637073ybf.134.1650989433429;
        Tue, 26 Apr 2022 09:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650989433; cv=none;
        d=google.com; s=arc-20160816;
        b=rsUWC+G2UJKpzkokrkSLN2PUQj2rLNywFXj3oZrGJz2HYHOZ38yct8716kSzrRbuoe
         fzoZbyQxvS4BEhr6cTl/cmuS56mpFA81gLGPVtcqRMq8N/rizalyshemK7aNFEAITYEM
         ZjiucEmwmqFt8QQLbA8DlM6c6xyl7n9zMOj1uEl1BTubdDaSBbHPvSeAnXM1LWGNBai5
         27AWrOSajo4iNw0qsoshGNVnsiAEAtnWB1S3dSzb2Sm2ErEihc+2bLZ1ohNpV4oIf2zL
         uizTkn2FaJqfrmj2JIBkSRslbFEL61ll8CPgda279V0BUd15PkjFvhyVquzu+E3s+/7k
         r69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kUC9tG6igzVEJirEgnCTOHV137FjKUwSoYb77+c6ZRw=;
        b=JaH4tblwk/vm6xLeb7ZnXRAeIZbnHVE0r0ZgVpGMYglDzUKVJ4Euj1JD6qvGsU+lYP
         /EuytZMjkDjIBgGjIN+VMWWPipGQRXdvKrdbduE8Ys6vwcJ0jt41i9ewZIBEOYhJOQV0
         TLwCfWG81e8RX406I2+ir688/JUcj8vF5D19vzasgTi/L2isaeZMZvJA/SkLPePQ0XRg
         MeNhs2TGmISuV9Th6s3+bK5Q/RjGcLye+NcKJweVk1t322tnIGcNMaaMQYZVje+fZTT6
         bnNYUNKJ7DAEGGb82sKyNF2fZLqjLLiOLL461tKJS93Alx3jap/tIOcGVDOT3TFW5CQ3
         dbXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lNyrgsYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020a253813000000b00647c6395968si8219648yba.524.2022.04.26.09.10.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:10:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lNyrgsYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njNlo-0007N5-PZ
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNfw-0006QX-OS
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:04:28 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNfu-0007no-Jg
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:04:28 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e2so19859550wrh.7
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kUC9tG6igzVEJirEgnCTOHV137FjKUwSoYb77+c6ZRw=;
 b=lNyrgsYtPfOsC/NPE8Tl6zMXHkfjDIf2zluXg+X/aFcl88cWjCcZq+Y4hSDMi5aIYB
 L7EdlCgNVN9/EJPLkwLQ7jZePx8sD8aprb45HLgGt3h4AeMe2j22N2O01KL+yR3Szpiu
 XmvsXW8fI4Ul7zJ07Gu75byBBfeuzx5faytLqOHZ5BYsgDRWb1pY74i9T0Xf294KN0/u
 2KpyMSGGiO6UBEl6TiPJU3iZqDArgDS3nrdZY796CXYIAHf7k/A52gljDFs2pckIyZGG
 25BH2I5ia1VBEsEeW44UC6MAR2gJNXvEmJeib1fFYOB6nGFYbXYq+NEZTuOdlju/HuTw
 FJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kUC9tG6igzVEJirEgnCTOHV137FjKUwSoYb77+c6ZRw=;
 b=OT/7tY9r8zT0q+Hhc69bqKTWVbchf1xfY3BrpudDNZABkEZ7u7WlxTyr5EB/ee16Cq
 b3EyC1gi4bdlazqM5B71piJwtfbPmHtb5e085xQwPL9GJNRnInUFwG0FreIcQ/xUOiAa
 7/4PktIrwJ+nKpGbOtarb98LWSZQC6wfn4r0Wk63IZzf4OkkTdw+nX+ES3mmchDTQpMZ
 MKWYAhROe08bDhUKMcgIpgGwnSAsV6SObhuI6MqaeLJj37oGWVYjB/mgBmNJsWirXI/C
 pijJwlD+in/mxNBEDFDIc/Wls0UpE7nUfwe6dtjIMYXntb+B/gxCYIIBQB1sQkd/ptEi
 KG6A==
X-Gm-Message-State: AOAM5338libufc6ASjVql1Lee1+Jt+XhogN//GgbOBdYPJZg2EnkxPFC
 C4/yUmhbTG6Ek7N40hQ5luBEXE+U4Z/Ojg==
X-Received: by 2002:a5d:4303:0:b0:207:a7d8:4ce6 with SMTP id
 h3-20020a5d4303000000b00207a7d84ce6mr19164757wrq.101.1650989065217; 
 Tue, 26 Apr 2022 09:04:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p26-20020adf959a000000b0020aca418f14sm13584777wrp.54.2022.04.26.09.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:04:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Advertise support for FEAT_TTL
Date: Tue, 26 Apr 2022 17:04:20 +0100
Message-Id: <20220426160422.2353158-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426160422.2353158-1-peter.maydell@linaro.org>
References: <20220426160422.2353158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dMD3Kuyzj1GK

The Arm FEAT_TTL architectural feature allows the guest to provide an
optional hint in an AArch64 TLB invalidate operation about which
translation table level holds the leaf entry for the address being
invalidated.  QEMU's TLB implementation doesn't need that hint, and
we correctly ignore the (previously RES0) bits in TLB invalidate
operation values that are now used for the TTL field.  So we can
simply advertise support for it in our 'max' CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 520fd39071e..6ed2417f6fc 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -54,6 +54,7 @@ the following architecture extensions:
 - FEAT_TLBIOS (TLB invalidate instructions in Outer Shareable domain)
 - FEAT_TLBIRANGE (TLB invalidate range instructions)
 - FEAT_TTCNP (Translation table Common not private translations)
+- FEAT_TTL (Translation Table Level)
 - FEAT_TTST (Small translation tables)
 - FEAT_UAO (Unprivileged Access Override control)
 - FEAT_VHE (Virtualization Host Extensions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index eb44c05822c..ec2d159163f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -839,6 +839,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LVA */
+    t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1); /* FEAT_TTL */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
-- 
2.25.1

