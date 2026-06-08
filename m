Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E204FCD8C9D
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 17:51:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWe7q-0008TS-Vy; Mon, 08 Jun 2026 13:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWe7j-0008FD-LU
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 13:50:57 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWe7g-0007mn-V1
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 13:50:54 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-66061993121so4373606d50.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 10:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780941051; cv=none;
 d=google.com; s=arc-20240605;
 b=WyUmlG0YCk4wFaKrI6DHu00EojGgmLPqbY1of7d2ztCxxhxE8bHVc2r8x5sJKQAlWf
 mXwVarCrGwXDn9rNVLhCd3fOHS/SbnRIIGcErlpLa6fyHU5FAUF9uPNhMWWH1gjWIsDB
 7BIf+kaYbxgbRg133IDDz8yCLdvZMXpzC7ItF2LVIvyrMcjFbBklPbxoBHQ2cDB1sSB3
 jQKKg9VbCYykhcJwS1YGfU/x32i6F3dxFApkl6ydUQNaR6tmxIx389eW4KNdLDetOXhv
 eoE8wvegKOyzyDDV6D+DbqhkUunRK3uZgtmOSfjMAnRkn6rNOo2qWqI7p+A//ZXEpQen
 8n0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hQXgsogZvw12zVo08wQiXOJseRxS1FOiv1zo8+HMsNs=;
 fh=ThkvLi8a263Vsdz73/DN093Ak46PMzw/fwD8o8IzHY4=;
 b=fXAktYRykGffGtK/dwyFaOGP0n2XHpY/jhvmLl0nPSCPVj0LenUPdHzWE9/wZ01lkl
 9FIqNp+gMhdVB5ey6J3p4n7u3iBvYRFo1ogVBh/Gv437cLZVAamj2dQBVlfIMtiUhWss
 2FvThtwqEtHaENUh1PLrbTceMVsim28HP2f3ja3YVJS7nSDkqGTDvVN/o9EXmsPJIUSM
 n42YsZuYAQGPN1bsU4GnZr1ArCo5P9u3+4xv58GqU00YwkO6AEueTDgQ2/t+5aSZWN1c
 YBwbfjQGiG448YD2Z596fM/foCv4cCy9DpTrx5Uirjt5Didbuni8pICIatmc2WR+Q/P5
 NOtg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780941051; x=1781545851; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hQXgsogZvw12zVo08wQiXOJseRxS1FOiv1zo8+HMsNs=;
 b=U3FRqImxJYVxqgBdyqugtKugFncfV5ptBM2jTHbc2nARuAxHAYLyYz+AUX6oX5MmKY
 mbT9fBf3ptZF/psVo8LI/lPLOv4SAjp2/IgNhlHltWcApKh3zP0adhCQGz9mFc2Q7mRY
 hX8mTKr2yfn5BJXdx0aeQQYljH2OGhK1/3USSlMVrMbLejtnTRz73teBTUdt3ZiyAWBn
 ZMkYVro/0ozoQweXco4sh3TwrjS6aJf4/1DMS0mgL9EwT+xLAIUeHAuvukuIQ6QQeJbY
 Mu/Q/9j+dvlN0rCK5haT6TC7RhVNx6w+K1E1aSeeca/NiixkebGLEm3i78CAmn2/Qpq7
 SNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780941051; x=1781545851;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hQXgsogZvw12zVo08wQiXOJseRxS1FOiv1zo8+HMsNs=;
 b=hRKl4k2MSswlY3A5JwqkON0PRNLoV8AjXZEmWNI0h4vIWTnkAqCGbK/WCsN/cjO7kA
 kgywp+XBRzsk5ysse2/AUQ2pORBQ8YZ97Na/UTtDIabQ9nkg+Ea59fkwr2Y9MB6VHQ9r
 WbQ+EbaO0hvNwtRBTPd7VQVcbFzlKZIuexp8AGNctFWW8cEF9UJv0aev4e/Lq5RohAMp
 sZYFPr0JdMZbZmIj1jLP/r8BPqX6yIT661gKkt3LZF+Nea6dLvGZhJoOCpomghAdFh9Q
 7+sueAw7Pb82yKq/zAq9hBO955CA3BW/pIAMH1ykrvTBSXXo1ZEmdnC4XkRx5f940Gx7
 4+dg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8td13ctGvmsp5AzvH1UgwwuSCSEMLf20kDTMWPnPp6aqRhisQHldUDiKq2fW8xu1FbJQEgUijAQA==@nongnu.org
X-Gm-Message-State: AOJu0YzkOiMFtYa8+jXjCfckIWV5Jnb3wkgWR17RQWwGWDKB8Zf8HcEj
 ZCqYVvXY1o8DcGKd/O5HkW4WITIED3/Qk1UIBRAOwrpybKGOrER+dmLJ2fD5nYyHD/keX7faeAF
 0zkW/NuPj9raXOyueyf7puCvyJRXesKknxxka0NwZgw==
X-Gm-Gg: Acq92OHYQsDrWXNV2M8SLyzrEaOF1Z+9T5uX3Yuc/vCUk62ozkg2TBLpJvU1vimpYOr
 +TfAu0I2JiLwmfBJjqBpxX6nDRPDQ9mljsyukMqyaCghJvCvHV/rSHGKolO7PbNrSyBrkO265UX
 Q+p/hItOP3YAce+mVB825biQDFalMUxU5NkEbPJnkVe9Exp1h3w9/YBRxZaUTPN9TyEPrzVDvWO
 7ymCBGlPJ4+8JEKITrHm2hZYtEtunJIA8rdR1/AGLq04dUHzBBm2HPUr2xloN7QRuspTA3c/7IH
 LUhmsbsuQbbEoa5qV0Qcj+f7N9tbiYF3dIAvhCT+3lTDwKx79x/E1hmwZPNtG/pOi7oWK523FCX
 8RQ==
X-Received: by 2002:a05:690e:4191:b0:660:4886:9230 with SMTP id
 956f58d0204a3-66106e42b96mr13751274d50.23.1780941051391; Mon, 08 Jun 2026
 10:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-11-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 18:50:39 +0100
X-Gm-Features: AVVi8CeV-NNbO_bFeuWlNi6LD8oUaT9YjM-RZxQuelRQKZhDFo-N_F72Z3FFzSY
Message-ID: <CAFEAcA-C50aE3=Y9YVxfgDd0kkx72xVjU2aAhND+uB=rQD6s7w@mail.gmail.com>
Subject: Re: [PATCH v9 10/45] target/arm: Implement BF1CVT, BF1CVTL, BF2CVT,
 BF2CVTL for SME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Wed, 3 Jun 2026 at 04:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-fp8-defs.h |  2 ++
>  target/arm/tcg/fp8_helper.c      | 47 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c   | 19 +++++++++++++
>  target/arm/tcg/sme.decode        |  5 ++++
>  4 files changed, 73 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

