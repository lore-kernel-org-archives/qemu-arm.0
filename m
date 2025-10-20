Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9589BCCD193
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 14:15:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAqfl-0007Wr-8H; Mon, 20 Oct 2025 10:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vAqfN-0007M8-0G
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:15:22 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vAqfJ-0007rK-Gv
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:15:16 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-783fa3aa582so32997417b3.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760969706; x=1761574506; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2mWS9k5ZzDXSeaA6vdVT8QfX80JDGX6PHd4tnvVM/84=;
 b=ZRVD2wsGTUlxE4AVYHnfy77wl2+D/ru3owdfrmGZdreSGY+bpymSWn6iAp17SGOTtd
 Omi21kCouMfxuOZ9haZXN/6zo7gzXgw7NUqKLEsyTW+Dll27GyO40hdy63C2E5LEwjBR
 84Oqpn4t56/+z+9edhHss1eF+DvcmBlCRk/OcImp/cYw2F4GyNsx6a+SSAooMxTXHoTo
 vC09I8tJZ3rLZvy1c0IAMYs27rVgXtftsme2Kg05HFPYfNIUIIeIONo6dpTB1o8bNyjl
 iyPvIER3SVUKQRHcS9y38L5iyr1n/jRHlNnE3afc/HhKgkxWmZQcPJonVbnI7ufP3nJB
 KPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760969706; x=1761574506;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2mWS9k5ZzDXSeaA6vdVT8QfX80JDGX6PHd4tnvVM/84=;
 b=UnWLCU5R1rk8sWyfdcnZkrjcwBF+3+YVQYCCoLS4/s9BKYe+tKETQ8ytgp95yBM83H
 Q0W4ygcLVFZUBX9kohoan7THuFyWXrCH1dySq4jQ4iDYbXxeC2r85d/famYEAdGtnmsj
 SfS1KyflIVly68I3xh1zaRPayhRDLSssvGo2/a7b52EK7vh6VYxLlfuJWsds97w3eJS1
 VdZNRqT6TkN9s+KOOQL6tZd9qUWiBbIHa15TXuq6HUOeB7J1mqY9v+dlSrExyntYCsgj
 rWOQJ53jglbWC1qGFswyPdCHHXEKq1ViaBMkh36KjBPeTiDq6bzuJOiJlIGLd1hfw+xO
 v+Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTU+FJpE4elx/jcwFsxpVUCU+/M+9INT76jZaGUNkPAgu1Nn0DyjUiVNOYCNfUbwmGbxlAYejIFg==@nongnu.org
X-Gm-Message-State: AOJu0YwIubJ4pIEipYEXBZbbQAjLLbxC+YdQFj/lzcRaLnprPDCjjnRB
 TIDYqmQcTd4ZOrj9P/sbY99kYYdMh5jOIrAn1ubtPiUlXbCs0OWkxIBX/4JH5zObgmeAQjAZi5F
 7BBHsT2MIyNzrnBknyNl5M5UbpuKULG/OJpqBX0P0Zw==
X-Gm-Gg: ASbGncssJlvtmIUS5Mm8gONHWDVLs36isq+WG+mN+loXBAwKME345/hLydvEKmTeQGX
 JZFrNIaHBpQNXbYVcGpLWywZRmYpKAprEQJ0ZT3xLQ73haF8wDUTX1Rm7Di0vhTc+FrJtv4mTqM
 JEO7X/3eDhQi0If7lSw/bkWsIiQFFVDvOmJHiXLgAXxCzVJwkA8DIhdZchJLIu63aUgUpytuFXY
 Tnltmu+jgrzPyXCFGrARiFOUFPyvpxTHRXLMlzNfwooABpkcCO/K3sePQMPmA==
X-Google-Smtp-Source: AGHT+IGYqixOJRzSn0Do6k6cpOxol9SZ+SrOneIJSAiXXAxA5he80qD4xhN8EjvKr4td36HhfoezuStrzGzfErVRpe0=
X-Received: by 2002:a05:690e:1209:b0:636:1a8d:9d43 with SMTP id
 956f58d0204a3-63e161c65f4mr9087918d50.40.1760969705726; Mon, 20 Oct 2025
 07:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-26-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 15:14:53 +0100
X-Gm-Features: AS18NWBg0vW-Drd44P4O3CVZHAFPREI7HJsC4-iKjXZDQouJF9OhnH2H-rWnz_Q
Message-ID: <CAFEAcA_FXddPSD_rHaW1zgB0MKpsJxcUoUe-jBE5ZZmwbg1j4Q@mail.gmail.com>
Subject: Re: [PATCH v2 25/37] target/arm: Extend TTBR system registers to
 128-bit
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Tue, 14 Oct 2025 at 21:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> So far, just extend the data type and check access; do not yet
> consume the 128-bit table format.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



> @@ -6196,9 +6244,12 @@ static const ARMCPRegInfo contextidr_el2 = {
>  static const ARMCPRegInfo vhe_reginfo[] = {
>      { .name = "TTBR1_EL2", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
> -      .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
> -      .raw_writefn = raw_write,
> -      .fieldoffset = offsetof(CPUARMState, cp15.ttbr1_el[2]) },
> +      .type = ARM_CP_128BIT,
> +      .access = PL2_RW, .access128fn = access_d128,
> +      .writefn = vmsa_tcr_ttbr_el2_write, .raw_writefn = raw_write,
> +      .write128fn = vmsa_tcr_ttbr_el2_write128, .raw_write128fn = raw_write128,
> +      .fieldoffset = offsetof(CPUARMState, cp15.ttbr1_el[2]),
> +      .fieldoffset = offsetof(CPUARMState, cp15.ttbr1_el_hi[2]) },

We set .fieldoffset twice -- one of these should be .fieldoffsethi.

>  #ifndef CONFIG_USER_ONLY
>      { .name = "CNTHV_CVAL_EL2", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 3, .opc2 = 2,
> --

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

