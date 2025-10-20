Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAEDCCD199
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 12:42:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vApCv-0004tp-Sm; Mon, 20 Oct 2025 08:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vApCp-0004t4-SV
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 08:41:45 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vApCm-0001Mc-E7
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 08:41:43 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-63e393c49f1so912246d50.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 05:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760964098; x=1761568898; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PW65LhS1X6Ec177D/Y4bYc12+jOSUfnDfv/L8UlPQuo=;
 b=seB5eaMv/bl2+vMbpT6wBsUlYzQaZhltL/KGYarExRpjXswAOSOnqAyteXylsofdyX
 vx2TTfm6kvITyFeskuZrF9KBffaaW+d1kIboCUov6No405cbP37DtmvYdnIVbc8M119E
 zvC0SPd7Eh2qSyXvo68maFsH9OORW8FBLnMrQDgQdEOZgtL9O6+BY87NgNgPZHTnxxPm
 yANKPYR5tz7e2xidG9w9u6H5uhH+NaS0s65HIA+aODO3akS8pGN77s3x+0WtUvNr3/Hn
 XlCME6KsaAMozN+o+wxoVYovR7FsLbPouMcOuYdvx2PxuVz5PSK4x9g9nyikV+v35A34
 Tkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760964098; x=1761568898;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PW65LhS1X6Ec177D/Y4bYc12+jOSUfnDfv/L8UlPQuo=;
 b=RWlyyEvl1SiosM/5SSsE4gH1/PXFEwOodldfTHwj8lkJR0ynT63g/DWN19G/R7nHiT
 zjHfxxLZw6C7H6/wzLEXPcYA/U0wAPiqCoeq4A1MoaWAbIbfb8ZvdUytiuveyCjjMq7v
 UeEL5Rqb6rMcQH+RSihOF46ggc/Blya41Nvle9TdShaHODhxN46VQjaqWw4msKYeicTp
 Xg5fAqkaoSJ+Gc15BikDp1FA0Ks/YCVavkL1BTVlNfzg7SRHRYMNxYRGH0t1ire/v9WM
 lIrOG2sr9o3I+fV/OyjMTBZNX8tH3OdLb1n2S/XzJavXFeb3eWRRSs3at5QgJKOKGpp9
 TSPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPIXBOOYGBKaLIBM9IEolyqxWCzwS84KWmbkTpnGDUxiJXKbYuBL00NG8uMm2SIRVpSrFHtjv2Wg==@nongnu.org
X-Gm-Message-State: AOJu0YwvCTVtadH57rWPwxqNZ41CacIzApa/0iv8Y28RvBYgvm+H89l9
 n83VfcdCcg/ah6sEyzo6VJPNwBE+GSNzdSPhnZrTHrfkF9xlcb8orsAjiFWVusOr3k1fvobHCnT
 2ZovKe012Pv7Og8McN0G/gY3gOhbtZ6po+4B9XDduw5v5eMtyLaDv
X-Gm-Gg: ASbGnctHiamq7/qMoA041B8Uf7pTEtRpTEPMHfWTMaomp0VHN6oG4PQj3+UcGxCA3ZD
 WuqX+awxdZ/x0gvEVNnpqKsKXeSTMBGYyHZ8gC7koc9l2arK+qaY7ELweOrKy2hDFX/211BUB/d
 F0xWuxGOEPQGIVpBw3oMFQ6fiFzzHz4fmv+xBqCQJ1pb7YgA5I3KFWRTpRnSQ5xY3tI7OOGLI0e
 tw91c3X1XnLrHzQkgfkBfdDEq14Gzg9q8zpVxmT1wVxJ6JVkUcajRNqy7v8Bg==
X-Google-Smtp-Source: AGHT+IGjb2wT4a9okBYL7Ycm/UGOZ4cT5cqiTpOitPQJ2SEAPOijQYiz9sUV8cTHYaOAfZ0AscQ57USyY/lVIqvIpRQ=
X-Received: by 2002:a05:690e:1483:b0:63e:2906:e7f7 with SMTP id
 956f58d0204a3-63e2906ef1fmr6269550d50.8.1760964098088; Mon, 20 Oct 2025
 05:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-16-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 13:41:26 +0100
X-Gm-Features: AS18NWDKNyW8_yAq6MvaNA8dVB5NJnzJfY17NelQWIMp1erE5nUpPb9mQU-jfvo
Message-ID: <CAFEAcA_c7xk51H5cwvYJa2vUKBT9NJMg2_qVSz3nAGXVYK1+3Q@mail.gmail.com>
Subject: Re: [PATCH v2 15/37] migration: Add vmstate_info_int128
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 14 Oct 2025 at 21:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/migration/vmstate.h |  1 +
>  migration/vmstate-types.c   | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

