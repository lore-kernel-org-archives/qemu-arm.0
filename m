Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1346066njk;
        Thu, 18 Jul 2024 03:26:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVaNeI7s8WtwAU+XKGY5oLwleCLv7nei+NSeyVwucJzImFMD34ZRcpZdx6oWiNbumVFiYHappv0nFHsUXXt6tUBYwufFMPB
X-Google-Smtp-Source: AGHT+IH6mHLxfFsbBAv1RgF1eHj/lwcAY+WaiEDKoDs8sHt42pdITy74D0N+ga7HAarudWDjrd0M
X-Received: by 2002:a05:620a:288a:b0:79d:6d4a:a958 with SMTP id af79cd13be357-7a19396feb0mr33117185a.53.1721298380012;
        Thu, 18 Jul 2024 03:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721298380; cv=none;
        d=google.com; s=arc-20160816;
        b=PIg+45H92TjEyTFZo6iYunvUYrJjj3fdIZ5oYWhPwNjere4V4SZgHiSitMQAqzcs5R
         D3xyk+MitDAT8IUCjxASvCk5gGETN/Pfaom4tsl0jF1M6a9kcWJI+4BIMqpsiGYr7vBF
         3mWSm/E1EKN/0P/D7+2T7/DYZjUJlVeCTAVJ+hh6Vk7RaMANtj0zrqq+5pZjOjtRVIZ/
         17vzB6VkeJN3Ig16SukE46RYx/Gff4rfGgosragjffGYFx6s/7wJhgddjKEVWJG3J2T7
         V0HXrE0GEyNAzoU/OEJDO5awQPc+c6Z9OC182o1mbxaUMZ50lEq51lCy2eOcB0jWyFMw
         628Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=97Vy7Hi5cN2X5jPZhfznsQcmlKg7rZUAxFN0Y/iOUAU=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=QSpIkbB8+MHHAXqgsMirkFL5OMGRKKasQXzhFMon6ej9w/85Zyd1MsRniqvg1YNGQh
         0kMqZcndPq0z2beouSxo3FtIGHlgSrUa24iumCEvRTJSEZNKcjtVkvkphOuckq5aLF3t
         TfqLqKzJUH7EvcDVHWbA/b4Bc0lMnYx5zSdymEmebYP3OomXP7XonZBOChbsuL37LiKE
         YYgxoXPk5IjeoAwivfRGWFpZ8oW7lcmQBcJDkfibnE+6UApbdLh3r7G46HAlFk9Dil+J
         siI+CtfSNliI+qtpXjwfrPMLSXcHQ+y88BaqPJcK4Rl7nckJfU+VInJ4y6njL5vAJfuZ
         1cgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dujDoo3M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a193990b6fsi24530685a.518.2024.07.18.03.26.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 03:26:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dujDoo3M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sUOKW-0007yG-R7; Thu, 18 Jul 2024 06:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sUOKJ-0007vi-6p
 for qemu-devel@nongnu.org; Thu, 18 Jul 2024 06:25:38 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sUOKC-0002ac-KR
 for qemu-devel@nongnu.org; Thu, 18 Jul 2024 06:25:27 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-58b447c513aso570148a12.2
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2024 03:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721298312; x=1721903112; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=97Vy7Hi5cN2X5jPZhfznsQcmlKg7rZUAxFN0Y/iOUAU=;
 b=dujDoo3MS2zFx4wzUqxEYIdu3mTHlh1jsrAxGUQHOqWRKS7CzsJA4zKUFSJyI9f/eg
 ktwPuM1lw1021A3wlsaQKreRbfVM4c2yDe1mdkv8DNaELwffmf9CRgyzoiBkaOlAkC7R
 v/qA5NLa2E4a6+B51lqOQuh+1OqInlDAH1QfpVX/sfN8J9OyMorJ9nCtld7JOEqkYK1I
 Q9Lm4MBL3G4qd1aYTKalsAfdMXG/Rrz0KnyhZh8FAW4ddiqfP7QfcD+Bx2bfOdKOYGqr
 4ov7goNXHvRxP4hdJQaEhd2biB71H8hoENjQxeXcqD5770Yh1pkgdsUU0tiS97RXqpUh
 H2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721298312; x=1721903112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=97Vy7Hi5cN2X5jPZhfznsQcmlKg7rZUAxFN0Y/iOUAU=;
 b=ouFAFjw2XAT6o04hrO5DmjByeUVqxS7aT2WQpcdAjNZra5u+6ls6UsvtNDuBCevWqa
 GlNqWyRMBoFb/R9phom+5VNT722TbtFelU3qTLEkYG8xE7gxUOJIlAHRCdXKqrLc8rwK
 +pmmw2SWYDqiRhgi6MScxddCqRH0I8O3JKRIT5jmfQ45GQSBoJFUz2D20N1VTGBinKOn
 u9oS8IYTMQssieK//L0ImmfC8+K+8ex1rKr3lCmsGrhYQrMNOQf81uC3WqIKwQA3XLYA
 NbcifHAv09mBAex3ULfxvmdOSTY8R8JP6SJa3+EUv3llytkoIKKnC41WUjoefUNTXSGT
 jJpg==
X-Gm-Message-State: AOJu0YyN1JagyTkfVwwp7liPUKqXnQl4MZ5xE06+I1GKf76u1Xe8a69D
 +YQsleCXbKbZ/I1EPPzASSfBlL4tv1XlnKE+VwU/Iw70uuQWoSBU0KIo+KS3jPt8+Yo5yUoFbrW
 XXOZiathl5ebgxBPe78lbINv7NOD24fO9DkXIi0Wkq1cDN9Y9
X-Received: by 2002:a05:6402:1ed4:b0:5a1:369b:bb61 with SMTP id
 4fb4d7f45d1cf-5a1369bbc22mr2282097a12.36.1721298312290; Thu, 18 Jul 2024
 03:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240717060149.204788-1-richard.henderson@linaro.org>
In-Reply-To: <20240717060149.204788-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jul 2024 11:25:00 +0100
Message-ID: <CAFEAcA_v-BRoSuiQLx_97_jjfhVPjWEnB5ENbFz-XNsX=BUz3Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/arm: Fixes for SME FMOPA (#2373)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6vyOIfAcpD/U

On Wed, 17 Jul 2024 at 07:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v2:
>   - Apply r-b.
>   - Add license headers to two test cases.
>
> r~
>
> Daniyal Khan (2):
>   target/arm: Use float_status copy in sme_fmopa_s
>   tests/tcg/aarch64: Add test cases for SME FMOPA (widening)
>
> Richard Henderson (1):
>   target/arm: Use FPST_F16 for SME FMOPA (widening)
>



Applied to target-arm.next, thanks.

-- PMM
