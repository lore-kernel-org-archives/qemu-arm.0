Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp232884ejb;
        Thu, 8 Jun 2023 03:20:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4cDKsFmkrvsvVebgD+T6fhOhw/DdGSsGXKhOCFgcevLdamba9HZkLq7PZ2pVhAwIvucn5e
X-Received: by 2002:a05:620a:f04:b0:75d:4e8b:9d19 with SMTP id v4-20020a05620a0f0400b0075d4e8b9d19mr4925905qkl.26.1686219603580;
        Thu, 08 Jun 2023 03:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686219603; cv=none;
        d=google.com; s=arc-20160816;
        b=tQK3SDLBv7PFR5dISEvGLIEsCNRkA5EnYiLGysFpgNlg8Ru1qSvi3T84Ow1KC3Q/Ut
         BUA+Wvw7rQ+2aNJfZL8JjTyF7zen9TY4Frl54EoZiNOcDBqZ1Z13xST1CELfzVqMK/9k
         1mQbxguAg8nBeB0E8xvzRt4ae9y48Xs0YAhJ+s2Y6tLWjOsDJcVHYkOdcc5PhNvktNuL
         xAeVebUAQXVYduhc0/5E1jshvwvtnACJKbeJ4n683KQFGJxFXkJbscJ99myZ3Wj0qsVr
         GgwtjJwLwipp9N9sAK49IVhV+7WBOcqj4TAcbI45AfxpoZkf9bxpaaOgZ7lnPKYDzDQm
         kZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8C+/Iu7ifNpTKfQM3pmjomWh5WNEUkzReuGKZAurRj8=;
        b=A9p/ZKE2FmkmFCXs3u/BQpUWHvnkp1FhDWT2b9Kn1aEYTd4aIw3cr+UrG1LsMdRrCF
         KFxRw+N/7QEgDe+IJ3KckUsqxx98YRELPn9uZ6FEA/TxWmVyqRQjh+lTaodCSgwuRVWj
         iUeA6FMkd4dSVK8hXIJa4btsdHfjR7Q76D8UczJrYQOuvW2PlZRuTGWv0t8TXhtfYR5H
         3brMAHb6akmFFdEnwTk5UvO1CDHzpNnw1+Airk3wdKTho3qzBq8gyQE28CDwVZKsJ9Hc
         U2wRC4kgEmtpxm8DMut4oIEV666fsuT80ucI5NfHAqbviUbFUKcaD4G9vIwad35zwbi/
         a6Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQgzKsRD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17-20020ae9f711000000b0075ced05e346si380668qkg.169.2023.06.08.03.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 03:20:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQgzKsRD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7Cjy-0005zd-Cv; Thu, 08 Jun 2023 06:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Cjw-0005z8-QA
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 06:19:36 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Cjv-0001i1-Ba
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 06:19:36 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-977e83d536fso68356166b.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 03:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686219573; x=1688811573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8C+/Iu7ifNpTKfQM3pmjomWh5WNEUkzReuGKZAurRj8=;
 b=CQgzKsRD82RlRNRStdCAxTYwtYSRK1+qYtkfzEu1jlXiDaMcmxHKiGo7si3Fwgjngd
 KYVYznDAfpzaaMD/kWimW3N72xRomHmPUWr/XCtppRKf9U4t/9TMZ5uAYoPwr6uxag/h
 q89uoMzC/CnaVFnqV2YVi4jqPj6sWbaWr2D8plaXhhLRCc/QYX6kiIDvuUbvSEzTD2oN
 j9SNTv3qxphvIG6bl8biBy2uTBrZCs4Nf73aXiZKCQnyGUMIlpm5W6WZFmt0OIF2QDjs
 R0gWzcc3E90RMOkLpAhxTOzegFXQgz/TtkpBLieIF0oOTJNbDJgvvXVg0Aq+5B5CqMxa
 ptog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686219573; x=1688811573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8C+/Iu7ifNpTKfQM3pmjomWh5WNEUkzReuGKZAurRj8=;
 b=WuCYi/DxHtWroMglNO7tOCPKrUj2B33VOrdZZ+nb+j2r52CZn6u/0v4FZnJ/z6znz1
 hD4VfV8xfCD4uGTY1iEj/71vu2+/r0g8SkDpCYN9u5TQyGgOMP82qxsHYji1rm45nVDg
 OrpuwXxZtTufB/wBsT3yRLwF3TjuSpnBGM8Z3CNQaxCNK35OBYMIf9qSG6fN1lxX2I+4
 aUgh5YPVc+ROmF5Kc6hXBsnHUXe3qUNBar13yz9FPDawLVwNNrOj0r6zrKjC3Ps3kFHV
 hsDvEtF+k2RMEaYcb7vByXI5NOK87MCpPio3O5AKKK1v9rpw2dchUDo8dZ9yb2quBW9G
 ZbjA==
X-Gm-Message-State: AC+VfDyMPBTPaWqrBWy2A6cYEfFP5mfR4atgHHyGTzsd3gcb5Yke4/Fm
 7bz/K8n55OMwhE49K7QbD8zVblDq2ZGGPnH45H5f9w==
X-Received: by 2002:a17:906:974f:b0:94f:694e:b953 with SMTP id
 o15-20020a170906974f00b0094f694eb953mr9258937ejy.59.1686219573668; Thu, 08
 Jun 2023 03:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-13-clg@kaod.org>
In-Reply-To: <20230607043943.1837186-13-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 11:19:22 +0100
Message-ID: <CAFEAcA8eActaDEvRxHdcX9Egnht7skToepAahDP-Uv4=EV17sw@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] target/arm: Allow users to set the number of VFP
 registers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sTQEAyMPaknf

On Wed, 7 Jun 2023 at 05:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Cortex A7 CPUs with an FPU implementing VFPv4 without NEON support
> have 16 64-bit FPU registers and not 32 registers. Let users set the
> number of VFP registers with a CPU property.
>
> The primary use case of this property is for the Cortex A7 of the
> Aspeed AST2600 SoC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
