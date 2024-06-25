Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp661325njc;
        Tue, 25 Jun 2024 05:43:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcDLuMgkk5ZIUbAHyS1jlBZuhbixtk6Q/oMlP07b3E6CIX2OM7MzJzVkAPob0o2TfXbdUq04aNDXBaULYBhJwSv2s4UrFQ
X-Google-Smtp-Source: AGHT+IF4Po0D6wAXstIzgRbF1EL4TlyMTBUkaeG48nxc7AuuDDaYGGU+dgFCxZiYzGPb0LQhOWmQ
X-Received: by 2002:ac8:5f4e:0:b0:440:6042:96c0 with SMTP id d75a77b69052e-444d656fa40mr93658431cf.54.1719319402091;
        Tue, 25 Jun 2024 05:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719319402; cv=none;
        d=google.com; s=arc-20160816;
        b=vFboZ18krPosr81znKQJm6h0z9a8czzMIl7iKcJG15QtdPI2hCClsd5Jsl0ISewFGi
         Pgm0AmqOdyFEleeTblKoemCai5vb5GZnwlGjpUQlTWzMymV15frb9a1ueHU/RobgK+Hh
         MOSruHE3F2ozEabl1e6Qhtm5sR/iMf3nuR8+Kz2JiW3uUadfnP7HVXMY91STKzJefYmm
         jc7g9lPs3/+epuhXStbaXYNrBjJ8R/XqD+Q3CKojISyMNnovHbsLi37Ax+RsZWyPHobC
         gvAvydA6S7671GFZ7O02kOa2YsLuXdu+jMNKEbK4PBg0lsuV0YGwjRVT/X7vjV+5jx3U
         FBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=O3cpO3qXhbMQm7k/PhVcN62CjCTZxGPYGZ1giKfA2vQ=;
        fh=pOiuyhKhMiBOLKlWr89BWvbm18npvAfQTRSk94u3t2o=;
        b=AoyImRhk+LW4DSQqaGk/qa2u1niAe/IB8fAbE1lF/FUMNSLbjn6TliN7VFiiE/wtJr
         aFUDtHZzpYx89Ie5XL/DnuaGlu/QS4GKNDNVZO4c/o7+op60KusxlPI6INRpO2OaxjnQ
         jjCFaGv+wGA7JHs4DMaaRYEWVkW/fHYaxIAEwQSzWlzlPfYT4pMDlsrOitdrevlpzwMC
         UBqZztZ8rYky+08ILxlxuGmDmPQcTTz6F+fHWsxUfIIKCjhTkJSpFegMqfK93+ZGRD/U
         onTICYT6rvxnQnMjisXuf9+pRmV/Hd8IyiAa+fin/oxuYizhlEplYrT6faGMbLY5zmGg
         wfyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NvpCT7O5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2b49aeesi105173161cf.108.2024.06.25.05.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 05:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NvpCT7O5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM5Vg-00089T-NB; Tue, 25 Jun 2024 08:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5Vf-00088S-91
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:42:55 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5Vc-0002kh-M5
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:42:54 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57d203d4682so6751117a12.0
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719319371; x=1719924171; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O3cpO3qXhbMQm7k/PhVcN62CjCTZxGPYGZ1giKfA2vQ=;
 b=NvpCT7O579q96Jri3zYsNhriFUfvb0g1LMr6MSD2Ln6dxJz+t+lyX9FTtEGRFksaR7
 G4EC0TTldo5lGzMHZiQNQRF2iWrTZWfevV7YRNIgOgwHAwHiBHkUKcdaDphdyZewNvCb
 s0dzkyix1u4kQXaoLGaiQPNakTZWUcdz8TRj1x1fy+ZARdQbQh5PzZeHJH0P7WoRCD3C
 H/Ajt+yPW5jZ9FiZmtzMXkXSCyltshR2ooMmeXASpbtljJBZiE/HrNk1YadHIihTKJ6F
 yompIA3O/Gux0WRT5iTdvCIOK6QDFbUjojTahRSw0WOIJYLOVYtGQNLmfOPYCna4es1W
 7O5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719319371; x=1719924171;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O3cpO3qXhbMQm7k/PhVcN62CjCTZxGPYGZ1giKfA2vQ=;
 b=DE4uVn+UjZqT9/KT3jGvGLgQttVEBa1HSdlH/6BPohJN4AxqoCAZkDaINUO2Zdgt3T
 ki8yMnPSAyblj+f/K9jc/cHpzIJDgrnDPf5GCWvSZBcp73bAZuh+ydqxr+Dw5n7F4MHq
 vbNsbmzzrvhzdr53bhyujjBJgo0a6XsB/BFq9YpQuxa3vvP8D5U3Fd0V6vVnqdzeyFRJ
 AkT5aRGKjT3zwNwrlhdJE7X7UphqrKWlHl1PrugvxkFLIjTcqgDWA4kH1LPjv66JCcWn
 LnRcvchmVnPHokZMaCLtpjkaIa3n89Gx4BWL1fjA/c5NknHyIneQjJoW6qVxAnSlExFZ
 VS5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIApwu9b3wTL5fJ8BeSe8xL4773XU9xfJi78K9kvSvydDdxSe761OUT1B5qtKNlOUfijcfGmWqDaa/fj49jvvJQdUj
X-Gm-Message-State: AOJu0Yxb6vWrCFaqf2LdKwKnVgsP8rYK3McYed3HaVamSvxNIrcEXjaE
 fcYrmFonlhjybINEBk46okZ3v5StJ8Dl8pDHrE2ejK+A3/7bFkVDNDQeE0XeQ4X54y6kPTi6kQx
 cDbdKffBzyvU6snZewpTau1BvxhO4QrDXZeIy5wLfzrTR7hYS
X-Received: by 2002:a50:d7d4:0:b0:57c:7599:2c67 with SMTP id
 4fb4d7f45d1cf-57d4580ac7dmr5703583a12.37.1719319370780; Tue, 25 Jun 2024
 05:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-10-richard.henderson@linaro.org>
In-Reply-To: <20240625050810.1475643-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 13:42:39 +0100
Message-ID: <CAFEAcA_ZRTK4fbG82qyDHBZizAqrW1-uWO1QMpqftoC5vTfjhg@mail.gmail.com>
Subject: Re: [PATCH 09/13] target/arm: Convert BFMMLA, SMMLA, UMMLA,
 USMMLA to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 168j5DpRYJYp

On Tue, 25 Jun 2024 at 06:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  4 ++++
>  target/arm/tcg/translate-a64.c | 36 ++++++++--------------------------
>  2 files changed, 12 insertions(+), 28 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
