Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1769101njb;
        Mon, 14 Oct 2024 03:51:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXP8cAZaFMDC7j9a2m0thIi3nRQGSA+uQ9R2G/xAAVUZQ9unISVLIxI72sWiTq9UDxZtNhT7lxp7yOZBA==@linaro.org
X-Google-Smtp-Source: AGHT+IEWM+WxjyGDqpfgtsF9Wqe5kWup3ueyJcbk6ACWY6LVBZ1UFvoa7yzHionW7xX9nk/rA2hJ
X-Received: by 2002:a05:622a:59c4:b0:45d:8bd7:2af9 with SMTP id d75a77b69052e-460584b4cc7mr141692601cf.40.1728903084162;
        Mon, 14 Oct 2024 03:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728903084; cv=none;
        d=google.com; s=arc-20240605;
        b=DS4MWfuExb6CNZjU9aMLtQDO0wgnrwAT1GAjVQZujl4HuokDxHSHIqqujOl14+YCTO
         7m3nkm36ye4D4qw3jN0DiNV0WZozExZpRyjGZhbULfrvdc/eTpVtSeozajn8TPYQw7Fj
         mLr4yQDkJoQfypHER5+owna3vQ1JZnz2cc8OFHGUCFnB+twGuXivbQWnN1XAJTiPSu5v
         3KOvUVXdlozqvlxJjw6qr4V9Abh7FKb1qxPuPRC5UiXp2ekWtp6Eq09yB3pPBmqkk+qC
         qzAV/Oes45O81zmezuBvVPTYISX1y3bjUUj2V2e0B0yWk4XpZXT4FM23x7imJHE2FRYN
         zNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from
         :dkim-signature;
        bh=16r80Tpf2UqmGEMZziwBekWDVj8Uzy9i8lU22uqLVds=;
        fh=AWv4rNXUJEjODRdFtdKxNMv1EzrY+1cjeu3nE9ReVfY=;
        b=keeNZfDofp+NFjCPOp8tlk1wRshnBnu8yqUlBJyVMqetRzlolHsOdo0hVnifyAFHL9
         dzZB7PZ7KsVf2YrfkVQYF3gKia0mfnBwSkvad11fXXtuoCRgO2cmc38k/IoyeLm08FHt
         Hf2aoLAcymzPeel8qLO6PPTzg/vAScqT4+ghYZZNXVi/cVVk1HKXJBuqrWOx957fllsY
         xBsZ8eUgo9NmxPnbRlpWDc2mSZfFkYg6CvrJkm97zTP7R5B2ISdWdnaOQ6kSZ1pNIVod
         EtoXua+GtJOTmuqJvMhizs3+8y0IwtUHs4oSZO6BNS8hiV4I0cCHJouwJ2a7aBAGZy4E
         +8Gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rim9k7mp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460428ca72asi97937251cf.602.2024.10.14.03.51.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2024 03:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rim9k7mp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0If1-00040p-LG; Mon, 14 Oct 2024 06:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1t0Ieq-0003z0-91
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 06:50:37 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1t0Ieo-0006US-Rd
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 06:50:36 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a999521d0c3so685712666b.1
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2024 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728903032; x=1729507832; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=16r80Tpf2UqmGEMZziwBekWDVj8Uzy9i8lU22uqLVds=;
 b=Rim9k7mpflH6getRgfy3Cf5coJVusyQ5boDlTvhwyKkWtTUNuSeuCd49qMDn6XAr9F
 Br2HfSwvCLdL58RbRFJU5ujyg6iGB6RyT3pcKerb2RsdzlqL4nZm2tieA2eY44R59oLV
 3vDAuW6u8E1nwr7oQ0KAVph+IvOK1YZ/Jxq4yYlBg0FKEOhMCm+CaCqAA0h2QUhvW4l0
 I0S6CNTDXVW4RQKlCVH5EcTsedPke7YRYPhmBXi4rHBWsHoUKlIdXzzOrcyAGOLaOHmI
 BLdz2AbP96GFNKCDSghztZ6RiBA6tJqCHuyO7bwzLAdY5vxs7Xz4bgTvBsW5Va31TLGy
 VUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728903032; x=1729507832;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=16r80Tpf2UqmGEMZziwBekWDVj8Uzy9i8lU22uqLVds=;
 b=WKBfVZkVsgCcTZxntAjnEPCpROc71/bOrHd5C/xLhSMNbRikQ6rV4hKx1jJYGurkrq
 sHexZXVNjvZKjPB6fgDEWFrR9SpC2ME+mDO4Wx4G/PP3Yn00Bz4VObYFVkPgyHqpsGyZ
 jA9FAIxVeIUpkluTmqDw7yThteDKptMA9z1w/BOfy6hvt0dFkfSGGEwkJn850hBPPSdZ
 iZRVz1L0B95Mw6X3bvf0CDNdO1hIULJc+rHYsMkzB0V2fY/4PyCsQTSBvhHmwqN/RlU3
 7z59p26aVdcOG073QS3AWx8m8DxQGR4HPTc/9nyGQ13txMqBzPXlwGHbJdSMlloaCo0p
 G31g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM1RZuetna0XJRYbDkjapkl5rphf1/+iqUrxXWqdQvrVxejL8Z9W/iKef3PwubRHnvpn7fnYSadA==@nongnu.org
X-Gm-Message-State: AOJu0YzOkS2ABeuU6Lf/yNU0+9mAdmjlU2lpDRWPWGQUHuPLo0yPAd+2
 d7eGMVHcZVGm5fLlzlkzVO/0/EB3p9Xo7jVKs3vM78TFrK8WHeBsIfS0eQx744nXfWh/8ABTv2+
 rxL8=
X-Received: by 2002:a17:907:7d92:b0:a8d:3338:a48c with SMTP id
 a640c23a62f3a-a99e3b20e9bmr794150266b.7.1728903032141; 
 Mon, 14 Oct 2024 03:50:32 -0700 (PDT)
Received: from [127.0.1.1] (adsl-161.109.242.225.tellas.gr. [109.242.225.161])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a0b25226esm165504466b.59.2024.10.14.03.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 03:50:31 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 14 Oct 2024 13:48:56 +0300
Subject: [RFC PATCH 2/4] arm/tcg: add decodetree entry for DSB nXS variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-arm-feat-xs-v1-2-42bb714d6b11@linaro.org>
References: <20241014-arm-feat-xs-v1-0-42bb714d6b11@linaro.org>
In-Reply-To: <20241014-arm-feat-xs-v1-0-42bb714d6b11@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-12fc5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=pf0H/LuxIUzJj3moViZHCxuJnlPyFIH1W6tdHF0Oiug=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm5EUGQxUVAwUFVyNmF3U3JkREwxb1RBSTVtZk9VCjN6R1I1dXQ1YnVSdzM3YTRY
 MmVKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnd6M2RRQUt
 DUkIzS2Nkd2YzNEowTjJoRC85Ymo0NFhzWlFPa1M1WkExVmI5ZFFBRUNjUWR4OWk2OFEvSGZJSg
 pEMFhQTTlYWXAwQ2J3OW51dzlpNm03OHFTZ0R4ZmIyK0R6djNvL1Zhazl5TFdtNEF0VW1nc2ZVc
 jgzdnJDV2FkClgzMTVCN0dMWDQwL1luVGF3bHl6MTlFaFhRNENTYnB0Z2ZlWGowU0xtdC95TVhD
 TjZXbjU3SnF5bXNGdlBReGYKSmM2RGJqcFU0MWl3aWt0Y244ZERSbllEb2tyU3Nkcm9NSFVjMFB
 GV0xrSkxVWWpQTnZTNWFnMHFPSWpOdlc1MgpoY3o1RTdBUCt5dlR2SFB4NWxOYTFHUDIxZlpYam
 tpVHV3aHh6dHMzem4zTTZQU3FubldybE54RnUrNnA0eFRpCjRWRExsSTh2Q2ZSV21rWlp2dHVwU
 lF4L0hlZVhzc285OGRaQ1V0V1ErRENyYUlHTzZhcm1RYnhBcDE0QUVvUnkKSVI3dHVJaWYwRy8z
 ckY2OXZ5dE0zcWhmdEVTRUJRbUtEdnBJU1cwZXBQem8rcnhrUDkvKzlxZDRPM0VSL1JMQwpJV1o
 rdytLRGI0b0ExdFVwK2s5Ky9rQ3QrdkJLNytLZnp5RVBQbnV6VFJSS2tMOS92d3g0SU5IQTZTdk
 hCV2pYCjZxYWR5ZHA4T1dLRGhueEhnNWJnNFRrS3JIWXdiajdRNE9SNkNCVTM1V0xvNlMzb2lwT
 nREbitXZXFBaWpYaUYKTHZpa1Q2cHFYaEJvajM0UXFJOTNNS0lMN3dIenpQVlE5alRGREVuTlVo
 Y1VmZElhMkRHWHlnZWFrV25PcHVodgp1cFhhVGpVZ3BMdnd1SGY4ZnhSK3M0U2J6RDVscG91SWl
 BTUdKZDFtM3Z6TWg5TStHK2N0TGVjL25WNWdRb0F4CldYY0Mvdz09Cj1VWjR3Ci0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: zN9M53FLuKZr

The DSB nXS variant is always both a reads and writes request type.
Ignore the domain field like we do in plain DSB and perform a full
system barrier operation.

The DSB nXS variant is part of FEAT_XS made mandatory from Armv8.7.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/arm/tcg/a64.decode      | 3 +++
 target/arm/tcg/translate-a64.c | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 331a8e180c0b14e2abe3ec641a867235574316f7..c4f516abc18224932082cdf3e7530edc7a304bc1 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -245,6 +245,9 @@ WFIT            1101 0101 0000 0011 0001 0000 001 rd:5
 
 CLREX           1101 0101 0000 0011 0011 ---- 010 11111
 DSB_DMB         1101 0101 0000 0011 0011 domain:2 types:2 10- 11111
+# For the DSB nXS variant, types always equals MBReqTypes_All and we ignore the
+# domain bits.
+DSB_nXS         1101 0101 0000 0011 0011 -- 10 001 11111
 ISB             1101 0101 0000 0011 0011 ---- 110 11111
 SB              1101 0101 0000 0011 0011 0000 111 11111
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 071b6349fc38802a62f4b4056e369c4d8b1ecf94..85e71599203eee62b4d22a0b10ed676cc815dab6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1959,6 +1959,12 @@ static bool trans_DSB_DMB(DisasContext *s, arg_DSB_DMB *a)
     return true;
 }
 
+static bool trans_DSB_nXS(DisasContext *ctx, arg_DSB_nXS *a)
+{
+    tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
+    return true;
+}
+
 static bool trans_ISB(DisasContext *s, arg_ISB *a)
 {
     /*

-- 
2.45.2

