Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp167324lfq;
        Tue, 12 Jan 2021 22:27:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze3a6nXi0SAxqcP9D3jYyGGYpEHfLd3lXzClJvYg5TgRDtRIpE64vqfWhys5rgEHMBK+k8
X-Received: by 2002:a25:5583:: with SMTP id j125mr1037077ybb.307.1610519229558;
        Tue, 12 Jan 2021 22:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610519229; cv=none;
        d=google.com; s=arc-20160816;
        b=qRuMTCbGa+uD49Oxb3/bqM7ETpvt7mTAr14dxkOq5dPs+DfnMkBxf7MoQsLd54vb8t
         TeCTxQObBDHSNqUf5pxnFhKdrbOgzslIvPmlOWiqJZyA4dBo+UO2IRu6A4vN7B+YdOZD
         j97QcfqigodkvZ+Vb4RxN697A5uRUbuqmAmaWmgNQxNRFjQfCWYc5npqraFiNtyrmIYK
         ogFT2xm+7gQIKQuBbvTouNSCNZMaT0BD8Ia/rDkO/4P617nkm5UcTOIVAN6ji3geq2Yp
         SBy731rqY0Unr/k8PV8PpoIcM0OQvw1kY+qRItr5m8auvDBufgfUj+4hZTfQjKk0KX1c
         Qydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4MeLUJUM2UA6sEPX7Pauw8rYZ0ucS7Q7ySOaRCO+5jQ=;
        b=ct+vihXBKXS6rkkoyBUVvK+gMR2f0FrQp02t/XdfH05LLIQFFfZkvHfUSsq+x5jRV5
         FFofSuYBujAiu4E06/82cUu+6WVwY55mAAqXfpxuh/xsihHoaS+60WUe//UteQhHxhKX
         93ymwzNgwKSxUJt3WHyQYPNFsUBxtr90RvQOnbJ0vg/RtviMGiV78zkBBIG6/YiKIcm3
         PXIuqgfUGgVcv5M0y+1ndfsf4wMpKCB5RIMSQBZ/DLcXVhkNoCHh4xLPenPSS/ill2gC
         IDtRAxN9Y22SVUVTJcZXYtiRl3DIq97maPxMTTS5sxRRur0o61dKPE4hwksvhf+IjCEF
         OUrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hGvfQEII;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si1062736ybq.10.2021.01.12.22.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 22:27:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hGvfQEII;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzZca-0003vA-TB
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 01:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcQ-0003ut-8i
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 01:26:58 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcN-0007DG-Vg
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 01:26:57 -0500
Received: by mail-pj1-x1036.google.com with SMTP id y12so498391pji.1
 for <qemu-arm@nongnu.org>; Tue, 12 Jan 2021 22:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4MeLUJUM2UA6sEPX7Pauw8rYZ0ucS7Q7ySOaRCO+5jQ=;
 b=hGvfQEIIX7j8N49gvAruZWVahtHEnNu304TCy/1BaEFzVRtugthX8ITjCCCmnFl0fU
 79i4QvPOzvEo9N2D84J6GFH6OcQOeyRN1LimAAtQAeFrowzCrbP1rc1lzQ9wy+pF1YT4
 ogYccXR0FJHQ/tR8DyfXBnAGVvpP0OTAq+AAna80CIb4yXkZCoFgVygcsymrMMLPfaJI
 6FNS9fXFYvHjXNHR6s7u2kJraMHpQ7AOdqLzSk+IEpdVB+tAW4R2R/8bZFtKOgwC6CA2
 LnQGgrzbgiQBa+oLC3e8xiGT5bWTIASDNnpTfzq1jO3uLcYTrirgO2fUHIb0f08dltMT
 5lWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4MeLUJUM2UA6sEPX7Pauw8rYZ0ucS7Q7ySOaRCO+5jQ=;
 b=SQm5AVJcijyQX8+X0MBlo+1icFu2c6wecmAJrvRsuyLXWhR34qcaJoCre23y2bt1gh
 aT1RD0Xr8Q0WRukwM1Ryzw2BtwRSKYQcFosj8qeRBnbys8OfzCLPpPnzaVpbw5uGZ1ds
 vGqSnGgyIxlMw8Z32WdsqjEPnUgQvA+Gv4BrHu4uiUhBekloct6EdwnEqz00Gg6y0Y8U
 7TYqhxiX/Gfh90rzEsDs8Ohe/UGROmV8qh+NoSV0mQ0133xOdEcDDck2h8oG0IvOM4Zt
 /DlE7aqMaY85XuYEe8GFqHBA+32j91LDnrayuCFy57Ng8g8xIVCUcg4l5VdmeCjSPiFd
 ++eg==
X-Gm-Message-State: AOAM530WaKnDDGjC+P7iP6bMbj66B18aw8ZDXcYTcj0e2fkkkpB52gE5
 25j+mkw6nZBEwApG5IO54NLSew==
X-Received: by 2002:a17:90b:368b:: with SMTP id
 mj11mr601183pjb.79.1610519214310; 
 Tue, 12 Jan 2021 22:26:54 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k25sm1138241pfi.10.2021.01.12.22.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:26:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] target/arm: Fix sve pred_desc decoding
Date: Tue, 12 Jan 2021 20:26:46 -1000
Message-Id: <20210113062650.593824-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CtJJBXiimhI4

There was an inconsistency between encoding, which uses
SIMD_DATA_SHIFT, and decoding which used SIMD_OPRSZ_BITS.
This happened to be ok, until e2e7168a214, which reduced
the size of SIMD_OPRSZ_BITS, which lead to truncating all
predicate vector lengths.

Changes in v2:
  * Introduce and use PREDDESC field definitions, rather
    than abusing a different SIMD_* macro.


r~


Richard Henderson (4):
  target/arm: Introduce PREDDESC field definitions
  target/arm: Update PFIRST, PNEXT for pred_desc
  target/arm: Update ZIP, UZP, TRN for pred_desc
  target/arm: Update REV, PUNPK for pred_desc

 target/arm/internals.h     |  9 +++++++++
 target/arm/sve_helper.c    | 33 +++++++++++++++++----------------
 target/arm/translate-sve.c | 31 +++++++++++--------------------
 3 files changed, 37 insertions(+), 36 deletions(-)

-- 
2.25.1

