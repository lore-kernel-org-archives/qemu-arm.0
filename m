Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2160244ejf;
        Mon, 26 Feb 2024 08:24:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWxCf6l3MpmA6xkShJmgRzkRdUcoBTrYQtg1cKHr5aXajWICEThF07xHIpq7viH7EctKk/PSAbECJjc5lu9Pelf3xPPlb4N
X-Google-Smtp-Source: AGHT+IFex2cx7XHKFhJnY6Few3OAPcCmcZC59eV44BaS6M9k+NvD05eyzWlvSdtfRzoWYxsVwTJV
X-Received: by 2002:a05:622a:14d:b0:42e:7e4d:9b68 with SMTP id v13-20020a05622a014d00b0042e7e4d9b68mr8062253qtw.18.1708964640286;
        Mon, 26 Feb 2024 08:24:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708964640; cv=none;
        d=google.com; s=arc-20160816;
        b=PbtvCFAxn77il6vU1PCxWLky3jL4eErQdkan30Uxch72jUUlpJStM73zGue395tozg
         eQ8hjRGBDj76Uf7RSRQ+EACB7g64B/mJx24nP0VKoQNU9uUEUhb40iXpSwNprGHHDRle
         XLWgd+xeNH6TFHFyA34s9xNiNbdvxFodYh8ZUzGQLjihR2HLD1uaTlzwlkQ4E1M7wZfJ
         s6nlLQmAbaL6QHcIiAxpXZEfmzMWpXtwNFbxiwHzrOI7VepZGeOgsKsSczxCTQeDq5Hj
         56oSJKuWSfrTfGghKW56rMJIZjcmrrcMGg9M+aex/mHzhUYFOwPTbv/UOPgYxNGGyly3
         72LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=iil6CiX/VdEUbfCHLnk2baxKXUCjytmlEEHy60pWFao=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=DZ4bA13v9zbaPzXZhcGCXaYn8+gU4mQr1/5GQNnsW5jnior8UeSKbAHUTs3We9Koke
         cezEPD1K5ju23uarT4wMzkImso5sVFqkt3KaPHIY08aEJdf55NKYH4KVE5wiJaQaKXkV
         yXjwznJ3qp2++g54cD1D4NXa0iaC4PGzt1C2u4o7pd/rHCqvr0CsE9HBVWQK8GBwY03j
         OS1LEy+ZYHHIjIULp0Duv5mdySM0+LqIb5t5W5/SljCslkR1AJv0tWCW1tCtkC3hHYRM
         rBJYlE6nEqOzvRvOW6bDCnMbpkZInwaMGUk+gaXPzwoI41W3fnJkomVXzPSXSArz+1l5
         Sthw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AgIf7x3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020ac86643000000b0042e46349f5bsi5209329qtp.214.2024.02.26.08.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:24:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AgIf7x3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redlc-0001I1-RH; Mon, 26 Feb 2024 11:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redlb-0001HW-Rl
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:23:47 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redlY-0001Bz-Iw
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:23:45 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3e75e30d36so628999166b.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708964623; x=1709569423; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iil6CiX/VdEUbfCHLnk2baxKXUCjytmlEEHy60pWFao=;
 b=AgIf7x3NavIzW9YFNW2bi53sEFB4ZKVg3rnib94iRgraW1MQkICMuCR2ju686L1E23
 nHkjtp5csxV3WSXItV65tZC0vy6a+qReImQPv7AaUN3N+1ncltbD/VuYD1Z/55IIiSNO
 RKNiXYlgKXBkvmsrWaaUTKkCu3WgrxZWz9nyoCKtSywWksX+aqVpAP2G+xnU6sR0OpYS
 DUw3CwAdWWoVfS+1LV/ZuWTQzC4bY5Eg3nMhd/d2PEAmTiYhwNv67yLtMn53bq/rcHXc
 EYYLIcaaaAcQdlejloB50yXjpXQsD5kq18IwuQJA+IQZ+HxdwqTeVlj6Gy3SmpRt2cZa
 Q0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964623; x=1709569423;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iil6CiX/VdEUbfCHLnk2baxKXUCjytmlEEHy60pWFao=;
 b=NnGbOD1tB1ndRemXszkwSacEyrjDsO9hcDNbuk3Vra+uH9Xyxm8BX8KilzxAmYmbmN
 3J/qYGUNJ9FyuFoysOPRF/+BBBCdlWUmmRYlSbsR2WGGCXqAwjGB7ASEnLkGXcP0MBFf
 rEgI6UR/WFme/ZQnGKasrFL3Tu3DJ2f7x/PnRG3YmWae68Hp2HXuZN/sXU7veKvyl2IZ
 NwhLnJyqQk63bXa8HF0p8YKiekNO2bj+JWhavGBdl1nsa9CVnTCk3TPn+o2VE1HCPIaL
 sJVgxPUJ6l4HnKMdj+Dcd5+eQbneikkjWD0hfLmsuAFHE0LRml+kstufdLG44NkAtwsC
 L4+w==
X-Gm-Message-State: AOJu0YyWniMAEZcz9eyTBYFOG6YLqRqxjhPU38BbxayNV/inz1h2zAsf
 NqiLN/JDtXQMC43z/Aq7eDXLuxLWpsVleIXDuP0Ukc/XiJAcZg8ta9MxuoBubU5o0GAlSuHMPLj
 FJIPKViuwLPGqhDbyFcgJ2f4fAOiJpxRdMHwIYw==
X-Received: by 2002:a17:906:d922:b0:a43:aff:8490 with SMTP id
 rn2-20020a170906d92200b00a430aff8490mr4517613ejb.25.1708964622904; Mon, 26
 Feb 2024 08:23:42 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-34-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-34-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:23:32 +0000
Message-ID: <CAFEAcA9MpH8MaDkmBzsepYtrJ_jJ4igSN1Q+F4tu1Svn7Er5uw@mail.gmail.com>
Subject: Re: [PATCH v6 33/41] Add mailbox tests tags. Part 1
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
X-TUID: OZbpUwUQeBnJ

On Mon, 26 Feb 2024 at 00:08, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mailbox.h | 177 ++++++++++++++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
