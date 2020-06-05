Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2471672lfc;
        Fri, 5 Jun 2020 06:52:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGBgLGA3M3qOHP5OnZlRN2nlj/H0KqQiQdwRa9ozT4nBEKtZa9OKkttmP2fAH1l04FHbSz
X-Received: by 2002:a25:80d0:: with SMTP id c16mr15990041ybm.98.1591365151589;
        Fri, 05 Jun 2020 06:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591365151; cv=none;
        d=google.com; s=arc-20160816;
        b=nFoBtRDB7zbSpPK1dfEtx6/2MzKBjlqC6DLqeLwydGTcFA+zSN81eSUduSlAZ+t5ye
         81nDjAXbvmfpExPgttZPP7ysLZU+nmyv7MLhtyUh52+G1Ou7Q/NP/JjhSyeu/WijE4dt
         28spU8iK12XXxYCUBABlXAR9y9rHHRJHCmSy89I3AnYS5f4sbyIw9iqgDZoW1Pk1oiyz
         Yu4SiMs64KBKLYzv+ES7fiHzflVYfjhvLcXdzqA64Qgj6ycRuqui3wg672p7fegsUKFG
         38iH7SWEPR/ytNal9OMeuUYMPcSg2QOe/qpENfGNvMeCZ1UeLM+WcM5ZplW5wJcG0Nl0
         bSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hR8nvLRCuQUSXDiJTXdBxgIkQGPniExl3jMjL9eAfrY=;
        b=UJg/+eejs4ju8Ifc9iiu7GJ34jxhy2eQ7dmTr9NwT13Gj/Z35N/+V1gf/iFVp8MmLp
         1fpcbwI0OfhRk7I1/+bHHi1zgKJEU6KzD7iOj7Oj8xZyw3uEa5dJHDX09ReeUbglELof
         FgQUiIeB6JvZ87oGwMMQtM7HaQUofzGjJlV+B9CNosWNa/r0Qg6wSET15skL9OrJBi1x
         UfZOjoJAe1fl9vMgSzYWb7QUnT+7UmxV46LMUOjRiOFPu8Y5LOxvBxZLbpGOCSbqmciX
         SjDVA2E02Vd9Hh/fPzHdu6w6vQpyHocKlHx/ghyPpeFSW/bm6m2tfEms5ijzTlBjdawf
         Yeew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XBtQ4FfU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n205si6798697ybf.246.2020.06.05.06.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 06:52:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XBtQ4FfU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhClr-0001lw-1A
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 09:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhCko-0000Y6-UM
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 09:51:26 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhCko-0001fb-15
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 09:51:26 -0400
Received: by mail-oi1-x244.google.com with SMTP id x202so8240284oix.11
 for <qemu-arm@nongnu.org>; Fri, 05 Jun 2020 06:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hR8nvLRCuQUSXDiJTXdBxgIkQGPniExl3jMjL9eAfrY=;
 b=XBtQ4FfUFvxwu1DdSe3uePCUMKnl0NkZ1UxMyi9vctx4A0ALsfZ8Y7V/Bh9Q2x5kRy
 D96PQAg2f1O5EssSWyyiIYzAUY/0L5yqP5ZjgRadXrIL1A6XCv7w5cAO9urM/8EjaMHE
 Zrlm97K6xCHVDBjijmEUV/4inYGftgnoC1NLnDhwaDdqbHDvoO4bjv+7NNBDNHTneDI7
 ymbzdya0XkHWXywV8Zppx5R9dlPfOSLtJGGHq9fTX7AA9lJYfXfHehxuR6L3pbVQpa2u
 z9QmB+kOTbhwT36LSlFT9g+qFldqSwEpRrOVzmRRVqwCd8xstzdZQcUNd335U2ruJVLc
 FauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hR8nvLRCuQUSXDiJTXdBxgIkQGPniExl3jMjL9eAfrY=;
 b=EAowDIUomnOp9fFJiZzjoaRb8+bh95NTr+VAE5Ios+gzriw/c4gRSh9RxKA4xooU/d
 goWTJ4eVPAUlpdxKlKtwyySWdx6jaGqUpsr456ehwPKrKESVyPLNN958f227AqV5GsiP
 oXB5xx72AGTaHqX00bwvrH2y0qpR/+skfS+0zlFTxDbn+cQKouELboBQehyURhintUeo
 dFETyq77E6po1RLsMDdHRyiWCci4Bh786lwttjMFfTIvkFSudhgzBveKr+OlD2xXd04Q
 oT340f0xlGLu/b2Mz0XeA3X1JrNT0E+bvCCwW/aYUK3IwFEeeBvTXjQ7dcu+gkpbm8XN
 dn+w==
X-Gm-Message-State: AOAM5335O0R8OjJl5I1r7jpwCYB8RI3Ma9LjATemaHKYH1x5/CmdNVzo
 JbZlGvEwqG3q/ozK2TCWDgGxeKGEJbpsBjx0sQehhH7jo5I=
X-Received: by 2002:aca:5152:: with SMTP id f79mr1895783oib.146.1591365084666; 
 Fri, 05 Jun 2020 06:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200602135050.593692-1-clg@kaod.org>
In-Reply-To: <20200602135050.593692-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jun 2020 14:51:12 +0100
Message-ID: <CAFEAcA9DLYnnpvkJzTW28_Rzv52gC5uECxhow9GVc1fDDeOtQg@mail.gmail.com>
Subject: Re: [PATCH] docs/system: Document Aspeed boards
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bWQeCX1PbQY5

On Tue, 2 Jun 2020 at 14:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  docs/system/arm/aspeed.rst | 85 ++++++++++++++++++++++++++++++++++++++
>  docs/system/target-arm.rst |  1 +
>  2 files changed, 86 insertions(+)
>  create mode 100644 docs/system/arm/aspeed.rst



Applied to target-arm.next, thanks.

-- PMM
