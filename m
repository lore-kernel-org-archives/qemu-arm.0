Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp309974njb;
        Thu, 27 Jun 2024 09:24:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVPfrvNdstRLnfMeRd1UADt5XmUbXxZwPZP3NHQXbED+ZxZV67sHHzpPN2SDf6ZB0aDy7vw2izLauzuJucHqoVZLBFNY9+
X-Google-Smtp-Source: AGHT+IHDNvcCM5KI6/7hiz7Jrsc4ddAbtlbMarjmQePnDXPPtLuUvCASVVU5DG/fuvnfkb3LHt5D
X-Received: by 2002:a9d:6c9a:0:b0:701:f124:1b2b with SMTP id 46e09a7af769-701f1241fdamr2374027a34.6.1719505496051;
        Thu, 27 Jun 2024 09:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719505496; cv=none;
        d=google.com; s=arc-20160816;
        b=vELrqQGzS2I2JPvnAYjZ8eSZHRKpNVgvb439118d22kkyevpIr105KBfs2hqIb3oUK
         e8VWSVPQ2YaqA2MhmMh2fy2XHnnSEqu0WRKy5igeNGMnKay8f+1n4Y9CJjErQroBDUET
         NpnJpMhV0z6zGoeA6CEuROi6Gw3pfJuo7FiTSw3+UyhfLCzsVfUXI/GRXefORKagJp+G
         JGnvOoqbY8TbrfJQKBSa+OlHn+a3sPPUkgwlZqVp1d6EZLiCdaoAu30XCTcMc877QS1A
         nbkypX28kXKCiwzX4ZI4llzKj/9+AoKdRBpLgr+LBzsdQHgJxIrH7S0WxzZx+/JA395U
         0jWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yFkcsEXV8tTNgx1V48/Rdkr/iwnE0vz/gcdrAU/mSc4=;
        fh=BIaodWZfyvsp1uxi5AE8ovWnsZpPfF0OwVV8Raj9wuw=;
        b=oGG+cnjCOkR5Im/J6HNrS9nz87l/W069PUxEWW21VWIJmYMyEQZdBpzWLXFlV3hESQ
         /csPeOKKp/SjQfR4F1W7eSjDwlM9VG0/QXuMDBleJT1EyGYJ4PhYYLQxqZkqF2HYFddG
         fqrVQOjdlffALcqAL61tfEdxQLqqj5f+v9t3FtIkOrfvdwZUiFEXeVutN+fJQstNHgxg
         IvhPoorUCSkgRfOXlQ2o7w0cLcWTvsqEdCw2A5RsvhvYy1svbx8nvxXjrmBJjSiw9Lf3
         YK3kBs9K2dXUjns7eFYUG6tOO6eV0QPJUdTKvlqtwDQfTjnusRdnOWY+4mnYhEd2Y6ES
         sLCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OhwhO4zl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b5926f6b69si15608516d6.480.2024.06.27.09.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 09:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OhwhO4zl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMrva-0008Bc-Kr; Thu, 27 Jun 2024 12:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrvN-0007Xm-Dq
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:24:41 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrvL-00017l-SC
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:24:41 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42566fb8302so5581695e9.0
 for <qemu-arm@nongnu.org>; Thu, 27 Jun 2024 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719505478; x=1720110278; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yFkcsEXV8tTNgx1V48/Rdkr/iwnE0vz/gcdrAU/mSc4=;
 b=OhwhO4zlpzZZp/ZCBaTx288a81ZKtKh4ZP1voyhAPw1+8amQ/bvNh0bp7LbqvHYeQv
 nqwJL1BoSaY32BbIV9yh7DBxSDY9uqBrnCSgRfCF+BtjJnO7pOmujPHIKjCvWyTGzSI4
 dn4txEMXhHvcWTmhP0y/zRf0/xkJhAeYLJe39C09pNHkG7eSIjePDcZdyn+qWt+LofDs
 1jk/Mfpfmpe5pb7Z+qmZUAIRv1mzCh1wMYf7wJAlcQ+cRJDCXjRBUFOwFOE4sQBKCf5g
 2ZxPDlcHhV7CPwnSV6Ofn4P1/Y+og2V0PC+AWEhPtwUD0veYUiOfJdhNDILXfpt0lSZc
 eugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719505478; x=1720110278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yFkcsEXV8tTNgx1V48/Rdkr/iwnE0vz/gcdrAU/mSc4=;
 b=Y2JaCVK8MPMO+wEZbBi4PAKTmXTvQLVgu9r6zzASiXozEeIzO35C1YoUFuQdw18i54
 Si7XakUUNU7LtNCLdtWG3qAeWAN3sOwQS5R78/ckFyaUni4Tagp2O7+URakXw9PYYrsQ
 zhree7rOI/77ZbKUW1DAzJ/jKvYl8zqoam68j83ITlu0QLZ4imEWGT5DriPu/6IRGYs3
 i6cCOUP4lLhajWFha3mJpR7NXj0QWu6EkP4YKp342j2bQSTrS0L4XKYXYaknvHaGKBgA
 YzRyHIFrlc54POzzwQ0aGH3E/LlmnWPFI4ob6HWWdqrpZ507Cv8x3x2SevigffW24zb/
 yAjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH7ag6zB6cFAqwwB/i5+uE0D3mPHhc49n3SJ8rKwgCsHOipPtfFL5oY1eu9r6yYTc0yKYPKECPOcemczX9Fu/avSLy
X-Gm-Message-State: AOJu0Yx7kAU3olib2drBLJULi81KNkU3hr2aYjRkSyrdnTLJbz7XrRP1
 yQHGlbM0DFlTJ365SVIOj1fklt8XtABNna1LMlrJ/M4mJ355wW/VgItBW8mDBFUussmmtXTIrbn
 IpdQ=
X-Received: by 2002:a05:600c:55c6:b0:422:4fcd:d4b3 with SMTP id
 5b1f17b1804b1-4248b9ecfddmr94205215e9.37.1719505478323; 
 Thu, 27 Jun 2024 09:24:38 -0700 (PDT)
Received: from localhost.localdomain (33.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.33]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4249b133b44sm71480295e9.0.2024.06.27.09.24.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Jun 2024 09:24:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 devel@lists.libvirt.org, Luc Michel <luc.michel@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 09/17] hw/sd/sdcard: Use READY_FOR_DATA definition instead
 of magic value
Date: Thu, 27 Jun 2024 18:22:24 +0200
Message-ID: <20240627162232.80428-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240627162232.80428-1-philmd@linaro.org>
References: <20240627162232.80428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: 1Bk+9EDkNkzF

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 1f37d9c93a..135b7d2e23 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -561,7 +561,7 @@ FIELD(CSR, OUT_OF_RANGE,               31,  1)
 
 static void sd_set_cardstatus(SDState *sd)
 {
-    sd->card_status = 0x00000100;
+    sd->card_status = READY_FOR_DATA;
 }
 
 static void sd_set_sdstatus(SDState *sd)
-- 
2.41.0

