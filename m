Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0904ECAC5B1
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 14:38:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1n6p-0000Ww-OY; Thu, 25 Sep 2025 10:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1n6o-0000Wj-8o
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 10:38:10 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1n6h-0001T9-Py
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 10:38:09 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-71d603b674aso9311117b3.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758811079; x=1759415879; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OMWJMGXVc9HHDwP3xiyZIeNdiFlZVGvXOMNmaZr3GAQ=;
 b=Ms4ZIK5cJCT3pGFknilLg87nO8bvYCBd5zlEcfSyJ0ULdcPeWNB5L8QApJ/lw2QdFV
 JAY8i4TMu6BIjG3PgD3sgHgm4w5YzGTalrozyhX6IBCVrtbGmHTRiYX8LzJJc945hOQ0
 zxGK3wMnbvVyMGBB37mjHCugSC+0iuLmMLGFd4hYJoyDsqoKBayjCaNvYY2kuJM9Vyfa
 NXDI+dxEhKH/0xr/doCzleBKFVMrX2iCYCWmE+UyDAZ/BWV5EV6BcuPQF1dSA9ZfbCnJ
 Pv1RIWf7+7WzmKA/pC23dS8OBoWXCIQZccGJPz77nhh7t9Rao+BXn1PKeKhYdYo6/zeq
 CFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758811079; x=1759415879;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OMWJMGXVc9HHDwP3xiyZIeNdiFlZVGvXOMNmaZr3GAQ=;
 b=SXGrTHzWjl/6wI/plvLKgJ+QTL1l5OEaQF0aZsXXkOPZjWGa4dTav+sBIe9/ZxbmUt
 B7Z2F9DPWm42JPsZ/hFm3lQYSpDIflk1DWYKDEXzBDwbmrl6Bu4rAO/AEu5LM3Azf+iJ
 fZM1OOUuD95hSeum7NagR1zhTuYt7rpj8gqmbLhvlvJAgDVsXpZr40FOvgQoLkPgDcsT
 aVVGqbbQ0eEsX1+ubfQ9beKQfW7/JgkPJgOnrPbdHeJHoUZoh8UixM/ndEnt9WUih39w
 CpNMyYrqqfq1Tai6axYcPmser1Ezm+QvAAfFfQDTut/hSQLY2trobIfVtojYyf60+Qk0
 2tMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3Y8zfm0cS4wj1ELoSjoQCICtd0qVlt33+cnbBAZ9Oq1+wp5XWmj5WSDWaQ6Q8iRBIwBIdEBz4uQ==@nongnu.org
X-Gm-Message-State: AOJu0YwOWUp8guGC+0w1xjkrIpi2IEXuvh/Smry5IFeHtnZY6qTwNjVF
 Eyu7wtKNwgWXRbzRgXH2zT91EqkN+PZgbu1x/RxjWz9T3gtI4NVicapjnVRjsPorzJ3tK/bfxAr
 cCsGWPE6iDsjqG6nxl56sGdkWWS4Ip7dnxZHsbroo9Q==
X-Gm-Gg: ASbGncta5vxIFShjjZ3uA41KkRWYQ+Tf7vrsVB2RS6R2T6aSQETARjQJx7J7AoclpDH
 zT4ife5z0SLEcaFB48y7s87qgFQNfwBQKgAX+jnvQoc1/u48LoYOE4tyoUgiUsXfIAqzfM96eEO
 eExypkIqbodl37hT9qgl8eWICdJYACZa3lV2nrzSDcJQhWicZ0kDm1yoPptprLUNYFPl4vltOaw
 kRi9g2J
X-Google-Smtp-Source: AGHT+IFuPX+SMediBR/46eOuhGmX97/hwoqB5YUbPA4uO32+OWDo0h6scJijOxa/mw4s3F2AJUXcX1bdqYQnLwlehkI=
X-Received: by 2002:a05:6902:2b09:b0:eb3:7973:374b with SMTP id
 3f1490d57ef6-eb37fa000a6mr3708584276.0.1758811078491; Thu, 25 Sep 2025
 07:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-37-richard.henderson@linaro.org>
In-Reply-To: <20250916142238.664316-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 15:37:46 +0100
X-Gm-Features: AS18NWBpi0-mbcAdBTAISbZ6QhjWhXzzUOMSI1rW20FTdDDe1-mfLbYB5c_PLzI
Message-ID: <CAFEAcA_b-g9YJN_-phznj7xiXYTrwL=3=_1VfwEW4hYuPBZ9uQ@mail.gmail.com>
Subject: Re: [PATCH v2 36/36] target/arm: Remove
 define_arm_vh_e2h_redirects_aliases
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 16 Sept 2025 at 15:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Populate vhe_redir_to_{el2,el01} on each ARMCPRegInfo.
> Clear the fields within add_cpreg_to_hashtable_aa32.
> Create the FOO_EL12 cpreg within add_cpreg_to_hashtable_aa64;
> add ARM_CP_NO_RAW.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

