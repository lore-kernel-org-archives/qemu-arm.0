Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1267939dyc;
        Fri, 4 Jul 2025 07:53:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeb4hgIE6hPaT8gY/2vL6TIBvN+afBaw85bvYn7pFDlSiIseZdXMvlQwkiL1WW19D7ItVWyYONOYThXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH7tTy+kWT/F3edvgzeuzWZQRt/UPZ1sfeD8gbH7rz2hHE2dAYtczgDGkXMLISx6TE3a68G
X-Received: by 2002:a05:620a:4403:b0:7d4:57b7:bc12 with SMTP id af79cd13be357-7d5ddaa7cb8mr323125085a.10.1751640831167;
        Fri, 04 Jul 2025 07:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640831; cv=none;
        d=google.com; s=arc-20240605;
        b=gKRT3DCpjqeSlY/9hedmlwu7sE5YMxmTcnee77OuP31yowi6IPu8Stf3Q/zAeU3PYo
         daX1zV5sYIXXEz8TdVk40t6u5OBitIoLtIApvaUXgABN5bmKr+6c9O/25UDHLhjaPBFl
         k0WoI1ZHE+UP6ZtUNc8cOdPwHYabGBEu9yjZNF1hHewxOTImeYQgI9OmHGLchCajBdZe
         +nqHpq+cct0EEGBjqlKMXjK2fBbu1l4Nbb7sZJJd5C5vwsNjoT60QGSSv6ZHKbXmTk3l
         7Rbxc/KMifhsNsfdqoTIu4ZzN9ZFV6TQH62cd5DSlPjr/RiXsfnz1alf7WXiflSO00qX
         +iMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zWElIbslX/NnREeHmv51db2w0SDJalpLfsWpjW4/9zc=;
        fh=T0kloGLqSPsQ3OXDGSbcCoQ/QqTdzc+1P6Spq+qOCBQ=;
        b=kO9k1/3INEnXqcJuQ63ToXF8NkEf+5LsYzv3zx4XOS57EPjYE/r3rhReQiXc6o1W6s
         AMF5f9WYCHcp/yXn0ImGoD2lJ6ZHHY973uYmyyb8WlOI1dLMs9HlG+hNUHeRmnPDJHKA
         yBxSEHOOjumc60wVr7+NOvpBIdqmBoJ/eLQ7m1ZxKoV3wHq3OBlqTCS+xKXBJCP1Hib0
         x4bnMrpDBbA23p6mw8IDTfTyR8G4dhSkmNGRL17tdv/FwhbK/IbhYrllyAaJMLlOHkdt
         cvT4l2t+bP2JGFgmusvP/P+UFRAvk6CmPmbj0tnOyGDrLv3/YXFKqv63BUEDWsq0eNp0
         tE0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pgeAySqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4cd4026si21429816d6.122.2025.07.04.07.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pgeAySqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhTd-0001Dd-4p; Fri, 04 Jul 2025 10:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhNC-0007DZ-R3
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:26:45 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhNB-0000JM-AQ
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:26:42 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e8276224c65so868500276.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639199; x=1752243999; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zWElIbslX/NnREeHmv51db2w0SDJalpLfsWpjW4/9zc=;
 b=pgeAySqaa4ub/mu4k/6u9KQehU8Aan8S6zX9sNlztIkDJ/TrogUI7U7NT3hfksNkyI
 VlKtNFhHPUQa+6bL5r2PV5Uh10VCwPvEpwY6i4Mr/CrrqumXkJJERkP3yhVy43cxptQi
 8i4Jrij5PQFseTMTmqjo1Mh3vo2QBy9o9icGDCrZBWV6TSNmE6hF+4NOVsVWedOXZ1mY
 u+x7ux3l6SxYzU6sNEFdUTxD8+2mEgINPr9wkCwlwVLDApBMUIrrq1AnZdHaQOxzWhwN
 WxDP/d94uQTecQoHRhK5rIRq16XxnXQd1muHH5tSNwrtlP2MG8lCRuKtqePvxF1kTATT
 L2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639199; x=1752243999;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zWElIbslX/NnREeHmv51db2w0SDJalpLfsWpjW4/9zc=;
 b=Wqiu9ieCi+t78zDNp9/WId+54YDpBLkgi3MdSMlA0OKbs5l0Mor6b/k3ttdCFYBXhM
 cYqna+lMcevlYL3NGZkSCNB5EtTAAs3fvzhEUcD6Br3tjBcJZ0AMK1kXS/mGSNeMGUFY
 GnMKJhcWMLe9m4EztTukYlScfrigerIUsPMWugm2zevHdC4C6mLG0YSiZgQSe8DphCys
 0Apfm6Cf2GiACx7ZDZppwPA7AzpmD4QnM4oLxVm1AX/M9OcnYS5V1OPL01dZmUNszoi1
 p/YpjScPnxDSmUNmb7eEpELkIthgPlMBRxA/TgQ/MWwjjApVCuenXXxvn4G0z1EJsavR
 XZUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+3awKE8zSzyle/sGyEM9oq+QeBdn2lU0lyXfx3zE+xFQy9ClEtCnzV8tfthGOdXtZ9QEV4nvF0g==@nongnu.org
X-Gm-Message-State: AOJu0YxRtPIhBeAe+SqrXU04REHcprK8ovWK4d0h1bm0AwfXghrYP9nf
 kBDyV5kzsusUAv7ANhuPqyAVL+odjXLK/kQYmf1adj04H4fpQwe8Y7ZkbZ8Ka+RXMdYaQnlxjk8
 cnys0mYDhaxwIMVljVePcFB0Xm6DcQ1MBNn5Tpy1DXA==
X-Gm-Gg: ASbGnctzdOKN1+H52ibsXrmTuMWRTcgnMfA0/iVFmfdDYdJ8dHZ2jgWePISUA6AzaP3
 rKExb6Bz/1Tpi+AbpnZpEmsZbGFgZWwGt7TfJ1+UR5GEKW/NI0lEoNJobOOKFYTyKQJUUQ2CNe9
 rRBvGCt06wsgn5c48rzVHV8QGM4H79XgA9iwzgodZSMvwN
X-Received: by 2002:a05:690c:dc2:b0:70e:82d6:9af2 with SMTP id
 00721157ae682-71668d251b1mr36432967b3.34.1751639198700; Fri, 04 Jul 2025
 07:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
 <20250704142112.1018902-42-richard.henderson@linaro.org>
In-Reply-To: <20250704142112.1018902-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 15:26:26 +0100
X-Gm-Features: Ac12FXzGQhdSmbA6dxiyD24QGZfJo43i0S4PaoU956ieO6klfbSybtX4q1x6bxw
Message-ID: <CAFEAcA_xnN_h8v8z2yWrGdgC0wnm4X8Y_ZXTD5r3aEMSwHW+xQ@mail.gmail.com>
Subject: Re: [PATCH v4 041/108] target/arm: Implemement SME2 SDOT, UDOT,
 USDOT, SUDOT
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C7rUN5vMOyPi

On Fri, 4 Jul 2025 at 15:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper.h        |  8 ++++
>  target/arm/tcg/translate-sme.c | 85 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/vec_helper.c    | 51 ++++++++++++++++++++
>  target/arm/tcg/sme.decode      | 63 ++++++++++++++++++++++++-
>  4 files changed, 206 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
