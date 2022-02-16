Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp1216391lfl;
        Wed, 16 Feb 2022 09:41:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxr+UzUNDdhSwnFcjkyTbe5jkw/PaPLbm1bBGZpdm4l+Yg487fpsKj2+Bx4AsViuXr6dsyQ
X-Received: by 2002:a81:5f8a:0:b0:2d0:ccb1:9c9c with SMTP id t132-20020a815f8a000000b002d0ccb19c9cmr3483607ywb.265.1645033272291;
        Wed, 16 Feb 2022 09:41:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645033272; cv=none;
        d=google.com; s=arc-20160816;
        b=acuO/xrUXeVv0B0lxfnDYNFTSMd98fAFXWZ8QiBGONAs3txHfkYvqJmRbXtd03YWZe
         /tuBd/uDEW/QGaCEDStPam6pSf+mus5T9g1T7Lqz6X7jrPGIk0Oe7Bq9Cgw4CUX96vOO
         Qlj3QVDD7RtcPU1nyC2zoJEKerDRKfMa6AKnO+lvNUkUIkBgpBIN3Wq5bUCOAK4QKYnp
         rm2Ds/rxha1D9+6jygAP1FYvZNcriCuRRLjn+nVqNZkgvWGdSr+wTDu6gWpYFAYupY02
         negZnZnF/R8S7kIXrtxyeSVcNl+oNKbVirkIjNAkfOQoF6Dd2LRdNKkf+bkkx28sEtfv
         t+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pI1YGB8wSu84azkZnSco+b6TcQHovQVc5iORs2mQnKo=;
        b=VhWDULWBj+SjreeMQ6cORTHxogTg4LOogM3cTMXlxKK8Cru9u83aF4nxKURmqP+ySH
         98bf+HnsBo8uYWyKkCHsrQcRVDayiokmS1pWogBbeIBJ4j+433cNV58cX7AGvEXCyDpw
         YQfNBOANvfqHKvUNr7Pabo/D4JrQUn4im9ax7Wp9iv7IdqUIewnVvVwbfvh9QK5NolNa
         GtMbs4aUYOH5cj5j44tWAdAAraFbeYOTexYsb5GLwjn7mM/yjJ9Rz9M0QzCxBqab2+Sg
         jZdLT6azz8ftcrnebOPheHoEnuL4xQS+otj7AyQj836BaYhpDc6RXBNT8320wbr7aiyt
         TQJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cSHXoIwq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h185si379735ybg.120.2022.02.16.09.41.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Feb 2022 09:41:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cSHXoIwq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKOIh-0003F3-Nl
	for alex.bennee@linaro.org; Wed, 16 Feb 2022 12:41:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKODe-0005qj-Mz
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:35:58 -0500
Received: from [2a00:1450:4864:20::32e] (port=44787
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKODc-0007bJ-NO
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:35:58 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so2165282wmq.3
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pI1YGB8wSu84azkZnSco+b6TcQHovQVc5iORs2mQnKo=;
 b=cSHXoIwqwcFkK50h2KGcIRRZ3TrYwy7JMG/1v9gRRYsVp/AeiK2TEIDjuHGEDPMvxp
 U2NssQ5g7gCYTKyyio1nCyGOdA8K6E3SjjbB3Um9YUMP3UBxQ0c1PsbM/QhISG88CvEf
 fYOfJtai4P0I7dvOciNFF8bDkOiGysmqN0YCH7PTAb4Iwep7cnh3SrB3L8SqV4AgkerD
 YPUyj6b+y3dNFQ/m28umGj5Ijs8yTz+h4E4dAZo4HgwErRfUkpBXZZim9PNOrqg9SSYT
 GzDrhTNrq3jOn3BhLgc+icChOsoP0v3jPAgfOUZXAPmDlfhZ94O45ah99iZGvETLr2RB
 gcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pI1YGB8wSu84azkZnSco+b6TcQHovQVc5iORs2mQnKo=;
 b=pQR8mFpI+KkQA5wUgZQC4jjYvfh7V45ao0l1igaG1DHDAb3DIqHE116J3usJFKHPn0
 hQCsSKtsWTxf9ePyOcq7zeavneZuwwLyo26MDliH7l0WQRht3m4Npnmt2cj3ablEzp5r
 mQxNKtu/e1FVlmChqDbwQgxohfLoiypJROliKE1c8i7RDMmG/XCbHF/QkbANVUwDkIi6
 hVB7QmGlowFynPb4gqwyiGQJdFKNeEAyXIGosF0Elf2EvCFNEeqIXAFcEP98YQ3zv16K
 mBZLOwVlQpImdAUuTAfJATi+pNK5LIAxQDXC1fmSs7p4Cs1QQ9JlrTAUetiB8n3lOfdn
 UeAQ==
X-Gm-Message-State: AOAM530Kj2IiFTScQtY7PeiLJ1Wxn3nWCIU6FpdJx/AjnXnhbjRXesKr
 ZQtQH3D4x/xJwVw4DBnjLF/yomHhBiyNfbS99yjQpg==
X-Received: by 2002:a1c:a514:0:b0:37b:b7c8:6091 with SMTP id
 o20-20020a1ca514000000b0037bb7c86091mr2597537wme.133.1645032955331; Wed, 16
 Feb 2022 09:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20220209124135.69183-1-agraf@csgraf.de>
In-Reply-To: <20220209124135.69183-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 17:35:44 +0000
Message-ID: <CAFEAcA8qM=4mmMw1yTNnmhtGM=GbcNQ6874Z8CkErA1=jJOiLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hvf: arm: Use macros for sysreg shift/masking
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Ivan Babrou <ivan@cloudflare.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UUveMBjHJJ2m

On Wed, 9 Feb 2022 at 12:41, Alexander Graf <agraf@csgraf.de> wrote:
>
> We are parsing the syndrome field for sysregs in multiple places across
> the hvf code, but repeat shift/mask operations with hard coded constants
> every time. This is an error prone approach and makes it harder to reason
> about the correctness of these operations.
>
> Let's introduce macros that allow us to unify the constants used as well
> as create new helpers to extract fields from the sysreg value.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Applied this and patch 2/2 to target-arm.next, thanks.

(If you can send multi-patch sets with a cover letter that helps the
automated tools, by the way.)

-- PMM
