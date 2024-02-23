Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp608709ejf;
        Fri, 23 Feb 2024 06:55:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJj9AYSs34h/W+vMRMo9kgZAGnT95zzugZ8kbih9UY1wrFgqwAn2sZ38GChynNpygjygziQ+F1zUK1vG1hAku8ah7Hh07v
X-Google-Smtp-Source: AGHT+IFhE+HZYM1i/F2Db2RqnqTHYDte3fA8uwjm5e6WUEZeD5tPxxEjz/T+H/CG3N/+CKQRGEOc
X-Received: by 2002:ac8:7fce:0:b0:42e:5efd:fe6e with SMTP id b14-20020ac87fce000000b0042e5efdfe6emr8781qtk.33.1708700134249;
        Fri, 23 Feb 2024 06:55:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708700134; cv=none;
        d=google.com; s=arc-20160816;
        b=Xu44GfgZR8/TuPt6aupmlowgii5tgvsfL7KsH7jtvYRiYOHBhrR4hiX9WKJ4s62IJF
         3UplBIuMjEf90TeVga1LDSH1YUKM06i/yyKmVLKrAuDC32AdkMKwXOs1dPGpeGb7OJ3q
         wIVewyCG7ALLp396H/gfp5OCIJoHRNbogtAnHjvDgoCXZIHOiMEN7qMMnGQ2eMuJfOab
         ZP6mJ/1chz40tuvVyH++MVIP2jMr/sJl4oqEXN6ZfL88UxVk62MmbkorXvcc42ZpGiMV
         ohGUdL/8EcEfcSH8io5N1a18l3FU+MRmyxgiXrw4Fxh0TBO25S6rpNrpDSQ2p1GdW8gU
         2mIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MtMECOTgbIYKJrB18i1RsCPckJqPd1NJ+cu4GtcN1dU=;
        fh=kxOGx/h/c8fDOvluhaLfnUelA/WOVO72bOgGWwsKLdM=;
        b=KZYBK1N+lh84IxD9jaoy7pWRg8bQRQVyocHynxrlqLWTNAQbA6jl4uNnkEPmBtMIpU
         oKNVaA+FeQUBhb7qAbNG2m5Z8yqHWuhqGFYNDCn3g7zy+v9b3Y0vF0q7wJ8tROO3rrR7
         G0/BizjONveLWV2F9k8R98fTaWAk5COCbk19grxz+lCM7KtaQ1FAOjpKOMmDbgc1bfnU
         pJdMQXapeug5PgXZk9/fr9JdsqVdjZK5cH+WA48x1yGIcKUUgIwSVP9pUmLO3efylKma
         EG4LXHgGy5L7dFXq2J6yV2a1+QpK1YnoMkdLjwDXTeowmXAT7n5uS0jlz2ODJIPMvgsh
         iuKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Du0WK3U9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o26-20020ac8699a000000b0042d918da42dsi14667596qtq.37.2024.02.23.06.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 06:55:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Du0WK3U9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdWx6-0000l4-UT; Fri, 23 Feb 2024 09:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdWq8-0007SM-0n
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 09:47:52 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdWpq-0004d5-7e
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 09:47:51 -0500
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-512b700c8ebso1183844e87.0
 for <qemu-devel@nongnu.org>; Fri, 23 Feb 2024 06:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708699650; x=1709304450; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MtMECOTgbIYKJrB18i1RsCPckJqPd1NJ+cu4GtcN1dU=;
 b=Du0WK3U9kqVZFfTsikIq+AeYacVAhhi/34D/gEDdmAJOblfOzpnfzDkeIxcL2ETQ1D
 0yh966JA1gNepfHf5Xx5cSz5/+jlDI4H2R9hlYTiSk+95lqLQMEypXKn76Jxh9ow97/i
 U0wCHjCCJAUY/VZdt1N/C1zc3Eh7ABVQf14p9h9ST8PDBFHSEt7Ta47ofo5kd8hHJ8LF
 hy1oXxotDvTlvq92huTC6z4XYursdae4m8ginZmJ7YbUMMLZedtlDdpAVAfDg5WXaXKh
 PEp24vLCIORWrHcwfHIg4ZmzPbRUHYxRWbiJMuMvq4UKW0NnnBGSykKXN75Q9Ihwd/J2
 q1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708699650; x=1709304450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MtMECOTgbIYKJrB18i1RsCPckJqPd1NJ+cu4GtcN1dU=;
 b=A51pE8faewgdfcnURrJ+MNSbpLmKGEiDnbfPFA2Qjbt7YGdgJE4NetiE8BuZ+q47mP
 Ei8uMlVbl0Ma7lfFwDOA/BUfSgK2Ie2t6u9dJ3RgaUK6BDRjRMWQXLIiJWdMW1/hvEOy
 IE+VBED1KsdqgalSyZ2xUHM0q/WJxZfk+k4L3oIoy59e13uUr+0ytq75YsNH0fTy33YS
 8Z1TAa7EDuB+FCn8nYWMMbJOKuzAUpdZH2NkZhCrkYBozvLANb/i61pYxmRKy5xl7RYB
 0fLUWvUYRgbgLiyRxGrdpnq2dSf3T/XyyfSwv1HgKP9pqD0XRGoB1yvk32fSj+ie5feC
 HhOw==
X-Gm-Message-State: AOJu0YwQjfOw1tX1rz3rJhbhdQO/k4NLwMcTYik1bToDzjjyeCX9dMLV
 CAXERG2kUasfMjxCpWLmJUjUQIHbSt4UuLSViodMk3G57nsOJey8dWKeFSp+E4jGFqg1h32I2FU
 Pnbnacckwl9g60K3Xey9RCboaiPVguywbDxhadQ==
X-Received: by 2002:a05:6512:1103:b0:512:ec79:3bd1 with SMTP id
 l3-20020a056512110300b00512ec793bd1mr40252lfg.0.1708699650426; Fri, 23 Feb
 2024 06:47:30 -0800 (PST)
MIME-Version: 1.0
References: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
 <20240219200908.49551-8-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240219200908.49551-8-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 14:47:19 +0000
Message-ID: <CAFEAcA_GO_mD7mQ69X-k=-NqH-WV4euCqZnBh2POh+M1dVi8kA@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] STM32L4x5: Use the RCC Sysclk
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 2x1Xrkwurz8d

On Mon, 19 Feb 2024 at 20:17, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> Now that we can generate reliable clock frequencies from the RCC, remove
> the hacky definition of the sysclk in the b_l475e_iot01a initialisation
> code and use the correct RCC clock.
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
