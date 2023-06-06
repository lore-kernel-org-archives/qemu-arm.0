Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3358968ejb;
        Tue, 6 Jun 2023 02:26:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6jIPUbhD2oetykW7l7MjDj7BfIUpGo1KMtfNcd9dp0MMV9H1NM021fiaJW0eK9z1Yz5FC2
X-Received: by 2002:ac8:5756:0:b0:3f7:fac6:e3e4 with SMTP id 22-20020ac85756000000b003f7fac6e3e4mr1684499qtx.66.1686043598938;
        Tue, 06 Jun 2023 02:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686043598; cv=none;
        d=google.com; s=arc-20160816;
        b=aLZs7XaOK2N8FUwB58AATEDZ3z73j5RmDM//TQZbP1WiDWg7RZT2YXVEJkXsVlb59l
         v0QcG0ourlZt7FjYxuFTmgi1DZ7l/iROTBQgvsJwnJ/kxhRfpbY8qRp9yG0EtPXwpOXl
         V3PRmVOumOpuAIviGu20ZUqIoWohdrwlaACTjs/LUrSVVh0ceYaAlhQWijNvdvpZHYqH
         2dZaftGqp7RisC2pSq8UTLyJgjId6SCAcTDHTNu2pqJFT6ChQVN7xUE0RCNlkYag3IKp
         mZN7Oaoz4jP8NJHjtxwLcMLQLoOC6aJyJyQ1N8b8tsLJWPQ968olEBfBHbouATxMkQTz
         yzgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kxB5MWsESAGVXQB5n7JaHZw0k5JNdaLUjhEPZw9gTng=;
        b=E1qybzXA5hi/h7uCL6c/TSOXp9Xxn7ttmR5+w9gZU340/ivq4qskmIld9c5N58LD/G
         TZJMztt2tZWtefGs7onIEQqS4ncuqX0TBvZWdyXekNkzaJrr4D5Yi5w1Xo8WJ6NCUciC
         8zgO6D9n2gL0ixfaaQ5RkILy44vVhEu04Rt0N0paIJQs1FGdfaAjwo9Rku9ZB66KPyE9
         Q8egvJ3ZG9p/tHkb6oMZ/0FCQ0bGaaP0sccPweLIx1RCc72emKRjmdTrKXpQQz8igu02
         Py9AfeXewccWjO1dcBn5lAqio7gREpaJvobzM3m/aq1y9/h+ex/1KmmIBjiQ9Z1GT64B
         RDCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MpOLv9qZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020a05622a014800b003f51f102508si6094405qtw.32.2023.06.06.02.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 02:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MpOLv9qZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6SxO-0003ps-5p; Tue, 06 Jun 2023 05:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6SxL-0003nt-IY
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 05:26:23 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6SxJ-0005qe-Uq
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 05:26:23 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-514953b3aa6so7819314a12.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 02:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686043580; x=1688635580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxB5MWsESAGVXQB5n7JaHZw0k5JNdaLUjhEPZw9gTng=;
 b=MpOLv9qZ39rY5UHyXsCJoFPkLbSe4Iv5a7wv0q5EX6O5kS3qev/kg1gXiDJRsGN1xF
 Kl1RjGjQKnWO2Zbf2cfdVClpwWm0R6E5WJocI1esnP49qOApNEbQTn4WpAWsivfbNDYT
 ThvY0vCY2Km3UvFTPDAHGfNIJKkTb9HpUT/c9u0Wc00UWrdbLPdNOGd/dFqJzg0KbA7I
 JeVV7kEnNn0PKXhVknhLLuE9c2wFw2GWP5aQwdnBuNzzbRV3tUBdhIcHFl1UflNgQB47
 edA4tCdkQTP1OxkUi7KHcHYD0O4H5i1kTbRMLmn8v1uKnDdUhD1slXjGeeduOmPisYkY
 atAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686043580; x=1688635580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kxB5MWsESAGVXQB5n7JaHZw0k5JNdaLUjhEPZw9gTng=;
 b=RRh+7PlNc2rFSq6erCH4XzJWBkB/edP0fyVPDi86pw9E2vWqhOfIb8f0N8evmntRgc
 hZ8u4rngaYQz4mbo+O0nYl/uw+JxYsZ4WexZ3pdpUav4PiHLKTlKuYWzqKlaYjTkduzy
 7jrYKPaVT9di6hUHwqV/1OrmZQjvqPKBOaQSYm+WEmEzQIINKWhAvRTpcYlBF1Fcz2mH
 F3kdaJ7XOYzurJd/Pd0Qqt96TJ0KHVhyuspUdW2+BAkwztsfLK+Cf/CypCuskqec+HV1
 +Gf3IPOyBmmm6H+mbbcBl/jd5YKrw6Rl79EqVLq0S5r+Rea6RW5KGVJO89XHYNQZn6F9
 CgKg==
X-Gm-Message-State: AC+VfDyKVDBmMV6lGTDo3ImusMwr2IdXjSCA0qivo/DprxlSFCXQoSqK
 fATaNE5W+29rD1+coMYmOcw6H5yMlMbw8y171TLv9A==
X-Received: by 2002:aa7:d4d3:0:b0:514:9422:37db with SMTP id
 t19-20020aa7d4d3000000b00514942237dbmr1314993edr.39.1686043580062; Tue, 06
 Jun 2023 02:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230605175647.88395-1-philmd@linaro.org>
 <20230605175647.88395-5-philmd@linaro.org>
In-Reply-To: <20230605175647.88395-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jun 2023 10:25:46 +0100
Message-ID: <CAFEAcA8SSjrwF+9K7XSN62GBYL5tktYGB3YLMp_Bvh5HrPeMqQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] bulk: Do not declare function prototypes using
 'extern' keyword
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-arm@nongnu.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pqrzCOrqKGzW

On Mon, 5 Jun 2023 at 18:58, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> By default, C function prototypes declared in headers are visible,
> so there is no need to declare them as 'extern' functions.
> Remove this redundancy in a single bulk commit; do not modify:
>
>   - meson.build (used to check function availability at runtime)
>   - pc-bios/
>   - libdecnumber/
>   - tests/
>   - *.c
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
