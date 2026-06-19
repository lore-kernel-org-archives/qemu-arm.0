Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03696CD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:07:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waYwU-0005KN-Ju; Fri, 19 Jun 2026 09:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYwM-0004wP-7I
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:07:23 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYwJ-0004Eg-QV
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:07:21 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-6607048fa62so2152561d50.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781874438; cv=none;
 d=google.com; s=arc-20240605;
 b=MZYMw3eyKfihk87MkLdChO+F7HYtrcyb14TSLo7Qk9GywnzYvLi4/uEpwjU5GSgTVb
 jdT1ID7zIb3v5rbzJDhnIaS1BI8HA0P02XFAJ7MCLqPaVu220CNv1m4iLREyjS4kC1/Z
 3sVl2QBumrcaMzugbr12zhE+urDY2YHj38tVJg42e3MeITYDC3/9b2fQ8yy4PjgkjKkI
 OuTRUMGqfm5H2wR1XBIo9WCEdM9N6E2uaN9t/DnneNGAOOSPr7h4tMtuLh51tL4clmaR
 6AI7OTLBlDD4wfq08qYbVUTFN96UnVJ6iZ7Adqmq3vpSBMZWJ4bufO1rI13WkAkNn3Ng
 gW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rFFKDju4GkbrwpYsMKyIDto5mDULKbew1mWJuXksimI=;
 fh=KFnmTL6JrdZkfGzKpNnMDP7p8ByUTXbchr0nD0tU3vI=;
 b=UxGoTafWApLXrwK2B9NjPRMNtlaFHkUYItSGPy+nVHJ/ibWy6f+4cRfGp3uB1QhuB9
 RGhl2sU+0N4eOIU0ORMW92YzLVe6Pm1jAM2UN0cDBzsJdpR55P6up32Qspnilo3oONIV
 ToP5rxHrtX6aZQaQ8b+pqq3LbZdPdfwCDRJDBVww0tsf5A9/Xk14WgFBTGOQiF3qXYzg
 pT6ded8Zi4rjLtacYj934bL/sfp2PH1OHM3SqbDnQ87p7NXP0JAe6t/8yIopf9k5jYaZ
 9iUQB/+E95nhOpYK+WOXYvYXbnHbzE/HJkJdsaSBG3V1Xh1Cz4bx0aj5FLiR9HIXeHyr
 htrw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781874438; x=1782479238; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFFKDju4GkbrwpYsMKyIDto5mDULKbew1mWJuXksimI=;
 b=w0UfmMrSrJrQiszOyJBf7wqn3iHkIk4R2a47eqgumy3FpF5r2AnrSv+HOkzdGCTsGu
 C9i1D+4xplSQTQm1EH5aW2HoWU3MYMSa7hUy1zt4wPdqi1P5xPSnhXEAleXSRyAPTXOj
 Gr109dsikFTfnKsBjcwjidu8GoH9j4HyukThr+WfgTCibJnnf4dtlgs3pJ+xjpK9yr0b
 gIDoNtQ5Cur+CHxXFV6CYrmnjtYqcXg7ITpoIoxMliJYMRshLoDXk9CCHesa1Xc2NitD
 pntjgftJQ9CqEe0aG2DkvfjVU/ZSdLPoU/iRP8Q8GGJ4KGuLWDcDAouXBCOfKRQhyf6L
 Vwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874438; x=1782479238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rFFKDju4GkbrwpYsMKyIDto5mDULKbew1mWJuXksimI=;
 b=CygiCVuGWZqfFemVU6KeS0g5BSlHSK5Ascix1Gw+gnv0/hghhYFJ3oBeuvEmqEc1uv
 zqka6I82SQm7UpGSmq+ieSbKf6qH3Xn0rONQDvEXiSaUSyRdJhOkBa4antysTOBs/A5R
 50vWkJB6JYWZGCHfwNOsJ+JUEgPBFs6OBfIjkTXRRwoFftf60REaFXWqDQFHzWTFv+iz
 NVeJN3p9eiTrPwsoFAa6qcAQSWcSJUCcv93pYJcGemjAu8feqFHwMbx/vFd+Aw32zpX2
 y8GuCqxDPA5XaHjuI3oopOrssn+kGSaxR3GSnD/M3HafBSxDNnJ192ybUwK2tMr3p540
 9Rlw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8R2AA98AizUOiQW6UVXFp0nbMyHqFPUQYnSYLKmOJPvmY7VfAgrK6nmYNHl5xuP6T8PMA5sPIJ8w==@nongnu.org
X-Gm-Message-State: AOJu0YxGay1Z2f6IR09yD7VKKNE13Bhqbxot8p3AW7+s97389eiaKh4f
 aAQALfRuCI095dUvhTFwCGmA4gZ4QlWd3SxTe8I/DCG4f5q0NTlkKFfOp4zNVQDqqxu/OTT0Pl3
 cDavD7VYiVDOreff/i4Ii9wZ/iyi7SHoSuUPDanSjlw==
X-Gm-Gg: AfdE7ckvNFBpboz75640kEynRCj0CPJ86jsy0j9SXGNis1cRUzeM4wEACW2dq9uzAbv
 R072zQWd2vfE7l8zxr8CsJ/1sigxSRWFjVUCInsI1Ac//p8qF8MdgT5xcZzv/hrMGy2slCoERqY
 wUaFc6T295tbDi+KV6p50IVaJq7iZREQ2s2Gbl79Jw/meN8HexJ37AIoFUbsMvycKBVFZ8B7XnU
 /Gvc5v1iy0r2GAg1K2wGmq17eCxRzIEjDJPtkVijmctoMx/FAQSRAdzMgVSndQwjzpPKPw1y/fC
 2KSSiWldsFUQgYoLzfwRZ/lRrT7x55ANUNy6+f/U31NUk8hQyQUICD2O
X-Received: by 2002:a05:690e:4410:b0:660:3b18:57ea with SMTP id
 956f58d0204a3-662fc7b2f35mr2523557d50.1.1781874438190; Fri, 19 Jun 2026
 06:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260617161406.14705-1-163wangjack@gmail.com>
In-Reply-To: <20260617161406.14705-1-163wangjack@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:07:07 +0100
X-Gm-Features: AVVi8Cd19gW_Ptqpth0Sf-sYIXQ-4KXjfrcnnDk9wu7Kv-x9w7It7d8g-umcD0o
Message-ID: <CAFEAcA8RGC-1k5B_Ex_YHC+w3sV2hLtWTkimt6dSca_OpXfphQ@mail.gmail.com>
Subject: Re: [PATCH v5] hw/timer/imx_epit: Replace DPRINTF with trace events
To: jack wang <163wangjack@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org, 
 mjt@tls.msk.ru, laurent@vivier.eu, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Wed, 17 Jun 2026 at 17:14, jack wang <163wangjack@gmail.com> wrote:
>
> Clean up the codebase by removing the outdated DEBUG_IMX_EPIT
> and DPRINTF macros, replacing them with modern QEMU trace events.
>
> This also removes an empty and meaningless DPRINTF("\n") in the
> imx_epit_realize function.
>
> Signed-off-by: jack wang <163wangjack@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---

Thanks for this patch; I've applied it to target-arm.next, and
it should get into upstream git within a week or so.

-- PMM

