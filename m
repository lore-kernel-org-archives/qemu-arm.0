Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp219450eja;
        Thu, 22 Feb 2024 04:57:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOP7N9ty2J0EUxvm8ZboOxUjzJmOmEoU6TyUwOdfqNUWvD/Qm4wFzyI5t0g5vykt4Bp9/FB+romVf14zZ3n5TlvO9EEnhU
X-Google-Smtp-Source: AGHT+IEYQFkwqUcteHiTkeU1VYJGIlZ78Xxh73t3vg94m0mEp4cfkVNDPfSrprsWoZY6qvBm61zB
X-Received: by 2002:a05:620a:1478:b0:787:69c9:7f1d with SMTP id j24-20020a05620a147800b0078769c97f1dmr12056526qkl.14.1708606653968;
        Thu, 22 Feb 2024 04:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708606653; cv=none;
        d=google.com; s=arc-20160816;
        b=wrCyc9evDGqiQW1U/6xptMVCs+Yo1GYFPl/B29QSzVcoJJF+nNCytfwl1ZO+uDvO7D
         bmhd8DINLSPqaSsBoJOykVoeT1gyAUV5fPtWZ0igvu8hNIuaHae2iCjWZCbCXY9rx1RM
         Ljjkr0hwcA6oyto+oTJUDQdpn8tvMQ7lgey+TsQV7JKS/fSy22Alz7x0yeFxzsftf2yE
         krsEipxQipTYrpbrClZRuaY8uVaiCMy7TM9W0QuxNR7GgWvyfTem41fOWuGGbdcigIc9
         4Kl7WvvcU287jKojN+xPSUS3qG31el3ScI+mJAQKwuLGmBc0jlu66uslVXno4kaCcsqL
         YcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VVZ+VNqHmOLRPOXAqtL522gDrsWtXXCXM5mqlJag8Eg=;
        fh=0sXh7zgUe8H1x2ValA5oEIxqYST28M02AKtySXUjzW8=;
        b=xk+sNPcI+qO0xAWeg+9RLCV5RZSNeCM7jttxf1d+g1/zHlkGHffeKjuRHaNZSGCPQo
         1cXP65/eAjXB9l2caDoTW7GhwszHC9M+LtcR6GcA514GkXSemkLVm0/zlSov/n/Ohx1q
         DVMEba3ccFQkOmNqfO2YAluv2NoFTqGSWyIIToPFZXc97MWnwhyuSAoSAt2wHZHkPXPT
         RuEYRPOaOjo47+Pm2qc+7LfwfcVvvXcPIMcNCupxLE23J/0BXUCU9VCO8KDVqG9wa8TG
         mMNqyXwMGRLAOO7mIOUCqvNAQQC6xAEleonibHHtGkb9sqtv8lUevwIk14KKSZVa3ykD
         JpjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="up/ubXLt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020a05620a20c600b007879864d9d5si1490705qka.573.2024.02.22.04.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 04:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="up/ubXLt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd8cW-0006Tl-Ai; Thu, 22 Feb 2024 07:56:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8cJ-00069R-GN
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 07:56:00 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8cH-00055K-Bh
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 07:55:58 -0500
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d180d6bd32so90478771fa.1
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 04:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708606555; x=1709211355; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VVZ+VNqHmOLRPOXAqtL522gDrsWtXXCXM5mqlJag8Eg=;
 b=up/ubXLt10k3QO9vkwX6g75lvOJJffifWJ5o6q5dZPkORoguw2VqOmVLaLTnWlNqkE
 4uUWlo+g4s/Vg2caSShVMalvoBJmXK83nR0IFZw8foBAc44AY1wk/Mty1Fys/bxntVbQ
 EAFTBtPLwDXFP5DHZwNQOHU1UmjW/QFQltW+hcscqWwvhwuKLaMwYIlAtfkMKLL7VIrN
 CZoFL5ScPKiaZhiikT0j3z8ASq9Wb0P0JVoKNZchehWSb2ovDd58NAXvWFZXG5p70GGF
 iq/WSW+uK1LxDPiT1IUmqtSStlS81xfge9PUz52CVQwEyd+wRsCI059/WVARkjJuW5nQ
 8giA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708606555; x=1709211355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VVZ+VNqHmOLRPOXAqtL522gDrsWtXXCXM5mqlJag8Eg=;
 b=kEkhv+x58N6RxT0NgD3LiuSfDw4M3dAle5SC2XKTsLX3wwKobWiXMAVn7NjFQXeK0f
 dGfLjq5yTv2koYwMIStm9abFs9XPg+aNKvrWCFOv/5CLepfp6gnGHdsVWw17tKtElLTP
 xQjQyA5IKK+73gXdlZ98nrbGYK62PhgvqCHDY++H9fDoH7zWdONaoD7EBA0b7Z9BNnBt
 ksmsgYFAw1LwcxQHA58SxctxfuaCGeCUZyet7no6K/G50AQ2AtbdY/Gi2DFYGdAWC5rr
 QT32OS88hBSpIefbAdqNyFNRa99LLbH+gdEl+/eXTRzLaKBlbPIZFJB7PinH+6o7yRWo
 B5Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVN7eWFnMd7Dvbvw465TCL0vIt5Jb0e9/u3q9axGVPfHqfW93kK4/yUCPPLszBKh6rEk8z0r2VXqr7B4JHu7q0QQ0N
X-Gm-Message-State: AOJu0YwQxCRb3+T/r0cQxkb9g36rZbKpjSRuD4ZVfpMFR1jtPUv/mp8N
 zajI59Od4ELs3RBmdDsx2BKkL3cWuawnEv1ar9kg4qERN5xzOGhuZ4iPEKMKiyk=
X-Received: by 2002:a2e:9807:0:b0:2d2:43ef:e4c with SMTP id
 a7-20020a2e9807000000b002d243ef0e4cmr5926953ljj.45.1708606555634; 
 Thu, 22 Feb 2024 04:55:55 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 fs14-20020a05600c3f8e00b00411a595d56bsm21418920wmb.14.2024.02.22.04.55.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Feb 2024 04:55:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>
Subject: [PULL 23/32] hw/acpi/cpu: Use CPUState typedef
Date: Thu, 22 Feb 2024 13:55:14 +0100
Message-ID: <20240222125517.67131-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222125517.67131-1-philmd@linaro.org>
References: <20240222125517.67131-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22a.google.com
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
X-TUID: MbRtXv0fKCNe

QEMU coding style recommend using structure typedefs:
https://www.qemu.org/docs/master/devel/style.html#typedefs

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20240126220407.95022-2-philmd@linaro.org>
---
 include/hw/acpi/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index e011d01adf..e6e1a9ef59 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -20,7 +20,7 @@
 #include "hw/hotplug.h"
 
 typedef struct AcpiCpuStatus {
-    struct CPUState *cpu;
+    CPUState *cpu;
     uint64_t arch_id;
     bool is_inserting;
     bool is_removing;
-- 
2.41.0

