Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3EAC53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:36:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojqf-00018D-JF; Tue, 28 Jul 2026 11:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojqY-00015I-Rk
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:36:00 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojqX-0002Gx-8N
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:35:58 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c1740c36c5cso567429666b.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252955; cv=none;
 d=google.com; s=arc-20260327;
 b=PZtpLakNsrDtSL+IyUBt3Y+Vh0QnftKTTBvDW8LHqhH+o+Y0Ubuoqyykir4tvTocyL
 S+aG0dMH8OqPC9qJEkcg2PK6q93hC2mmMTflTZJCaaJI2955BJnvWUYn13nrMie9UGhz
 NeOEOIA0kSAjZwMMFk33aGgcFoP8Uj2Ti3Dcm+xcfgELa8cDqLs7sBH4iN32KrH28NXV
 dqfMCx3PpQk20qmDln4+iI0vtgfxgg1TABS+Ir5yti/3cBiAx9qwe5A74jD+AIsQCGlZ
 /g8BGCeKyyLLMnBnHygV7gJ3eO+n4//LUMi7LUpbuNRMnbR1m+sjQXXaeKZAAhlfZWVu
 M7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9Az08cN4p5zTkZ9k8ldu1orMamIIQtwJyBx6lq5S8R0=;
 fh=bOI1iz4h1/8wL+tymIV3f0Yfgq/YbMs1/qZgEtdTbAE=;
 b=j2te83nuR2m2TbWyzxzcwfi0dFlg4isFuArngEC33+sro5zFIZHyKQHW8IJseVZj52
 a7Cf8jxlh2y4HSz7NX+LAdt+N5BDLaWmQ54JTSihQ7RN1lEvHfiFOKsOZY8pZl+tsBO8
 Hz67DcKkazndOquuA4uM/VEGKRQyPnuwi9KE+x6wFdzFnpdwiwtXHz0Gew0ZZUcGaVn5
 DUJuWUXT6jMXujgKSzypXMH1RXEWVjh2SpCt5BeELzXsN2pIlT6+AktP6KrSrhbsWnIG
 wkgzJIlv1HPSrTSmrs+21tBKhGko3DIVZNqFUj4GvxP+PTFIMRQahyjvax/zeJPi08s+
 TaCg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252955; x=1785857755; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9Az08cN4p5zTkZ9k8ldu1orMamIIQtwJyBx6lq5S8R0=;
 b=OJ63dj7O5K+bKqjHT19TYHsXmye5oGsJsVbRFymkSoK25fBOlGFNxfCYwMVv6PSeF8
 l3MIjJhmgEPLGmpn+1m0bX1s6j95pIv3mmpjCkX13+0Zwiwkqtg6ZO5GzKUvSq/3uaze
 BLUhwOpPsCZUefkvqojSYDhTCuDJhYUFIrer0jPhHtFaLfyptJVxbCoZF0GEv414Tvf2
 z+itbgSsDLGq4yyOLVLmy/56lETDutC3p1afWmpqyb6Qrm9RXJv5YUKtp+YmlPmsLlwW
 t4jyIRLw8AsITanr/XPDMXmNtI+tx5wnmWgOWqOR1wzn5NXb0uCYwjsWJnDTox8TdN3/
 kX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252955; x=1785857755;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=9Az08cN4p5zTkZ9k8ldu1orMamIIQtwJyBx6lq5S8R0=;
 b=dDr0Qx+u8KYRTkRNrvVa38MLxYTXg5igepD9JmfHhG63PuEfBn4aJm+TfgEAOseXdQ
 /GLprkV/vhfPtfQoNMkOScvi/VTxXffjTRni+Kzy+JUJk04EpqjzK9k7thYAEZhCLGBB
 C+cUJUmuxsZRluT/Fc99cV+CMDY0dCj5iTxDPGiqcFB4bpBxxyV31JCAoGldgEqIg3W9
 OThP10GiH/IRdnooQ3nnRy/HlewC2072GU/lyV/i/jV1dw0MwNcCOPTdclRMPbVyi07M
 FL05WnxUEh35Qwb5hiBMyksT9TWH8Xbj5W15oaIjCpFTResUA22i9XJZggd7ZFiZIO8W
 k2XA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoeKQqMt3T69u/0qX0y9Q1PuRM/0MtLYyff9MZVUamoVLXG8NJPX7MKGZvqEoh2c2dxt6lT/J7nsg==@nongnu.org
X-Gm-Message-State: AOJu0YzErMa9FrpG5gDEsIRW9Rj6NroX/K7e2xSL5OZCUNl7z+zxk7w0
 eV2HN58WCS1VXphpMZ3gUaLzF9tRYsWa+MnTcibcZq9v3SQEHBHFd5qug/uebmeTXq23v7ZxtqK
 ipZFSgefulAIHctMtdssUx3GsHdGU4+rt0hRzKUPPiJPzTqizsXj+
X-Gm-Gg: AR+sD10E4RzdcKiTXVN/exbHMk+i3g4M2A6wtBnxlRcRyWwd1lWTaOP0P28OTlTxyIH
 JXbdqPlE2bj+9Bmk+k1g6A8y/Z0xi7Mv5w914g4CtcM+KCdMI6otjirUPxUWlUdhfoeo3w8qxvI
 pq9Ky7OoW7l8Qluhao3pddEb7TCLfWJ1UM787mlzCPNIUnyIEiBH8Xk86UlWygeLqRnubLt7iVV
 lUqL7lfTzAW7NKOwJ0hk6/O2iQWySXfZth80fCQEwBLKv74I9DNy+w5zckACkWJNAuuTIhHw0RC
 ls6svrWgJ7QGXzRPf2wO1sGQ076j2qy9gBH1NyYlXD6dZA==
X-Received: by 2002:a17:907:8b87:b0:c1f:304a:9a45 with SMTP id
 a640c23a62f3a-c1f72222977mr161321466b.38.1785252955657; Tue, 28 Jul 2026
 08:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-11-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:35:32 +0100
X-Gm-Features: AUfX_mztmS6OXeHW72L5oaoYZ95WMDb4bGZ6FougjdJZCofj15NDtIyzUYq9c4U
Message-ID: <CAFEAcA98J6gMG9_2UtYq8Xc=qM_sQF5XCa+a1DRKYDqdS-9KJw@mail.gmail.com>
Subject: Re: [PATCH 10/20] target/arm: Rename isar_feature_aa64_sve_pmull128
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 21 Jul 2026 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from isar_feature_aa64_sve2_pmull128 to match
> the feature name: FEAT_SVE_PMULL128.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

