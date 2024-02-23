Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp686243ejf;
        Fri, 23 Feb 2024 08:57:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCcr4fI3Ck6e1GYOkKxFKL8rKPdBPMol9udGezoqXqprPIO/k9xlj1/RUv8jiJJ7ifUhXjLfjxGhrBKzN01GMeaysV2NRu
X-Google-Smtp-Source: AGHT+IELeJCd2eX9tuyPU1E0r/lM3jvrvfxl7zIlzBzvcXao3RR4GB4490Ih7Wr9nWFL6nVp4LPn
X-Received: by 2002:a1f:4ac3:0:b0:4ca:80c5:753d with SMTP id x186-20020a1f4ac3000000b004ca80c5753dmr471622vka.4.1708707466442;
        Fri, 23 Feb 2024 08:57:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708707466; cv=none;
        d=google.com; s=arc-20160816;
        b=Eys1NujygsJ23sJkVfhiHYuHojy30cyL80oOAGkNhlAiU5QiQAUD719dwR+0kZPW9n
         vMkFVW08Fvfyyd+0gJq3gu8Ilxiv4+6m+MG9E4+BQcKpUNB0GZoST8Xyh8HFGP5VQPq9
         RnDZ+YPFIGzcqVsLG5xT2JAVRarwGv2ieGXDxImUkQX48r5BP/+nPP9FyX8hUdeVSUDK
         3+VRcxSha+GSH0msjZlyC4+MvioPBNmMkpZiog1TbG42EXQQD0XPzPxtnQcNWVD6G9hZ
         vjymEgGsvaA9GaehRHruDR6bfMi+br/iIHf9JauvuXBGseDI51KZLEgIRz71P7E4q9Aw
         7DVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7rOqlIMsp9GkXrBRowxKYMz3u50Ze6PEWMK/mBreZEU=;
        fh=PfVXuCKiMmxDbxxOCnSNov8i63GGhFhs6wCoiveHjG8=;
        b=AprOOyWfyVWWah1xhmEo2XEU72jw5bJpsAwiVCbjcJoFD8akX00HC+9FPGU1pBPb/d
         dDhSuhV+Sd8BZLBkM7U986t+JyQB/zXZgSs+QRhv8OFFNmfuiQPeWP+uMFkwQHUhGHQS
         ZXZo/PWyuhP02DogDgmCf7WecAp3hUlKhYJpNO2EIdOmOsDzr3cq+gM7Ug37ElAzkxbl
         rMZJvtMgBj/Wo8SEmTEm4GVzOJ+lTPgxos5u9rf0Mj/978vVMfGgC89ZZzAK3JqrGTN0
         kcjwI3Kc0N9qbvzirobk/cIAYsqpetJEfOqDRkKdMMYeRplVggWqKn+5/YfAeixoc6nX
         aiSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d+U2JmOK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx6-20020a0562142b0600b0068fb7f623ffsi4269656qvb.499.2024.02.23.08.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 08:57:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d+U2JmOK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdYqG-0007qQ-DN; Fri, 23 Feb 2024 11:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYZC-0005EF-Ef
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 11:38:31 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYZA-0000RH-SY
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 11:38:30 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55f279dca99so1559622a12.3
 for <qemu-devel@nongnu.org>; Fri, 23 Feb 2024 08:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708706307; x=1709311107; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7rOqlIMsp9GkXrBRowxKYMz3u50Ze6PEWMK/mBreZEU=;
 b=d+U2JmOKRy+lIslKqQ4gV7st2owt2v6pgFllVrWWgIuSvYnygGIbBXJrBHeTvC4gmE
 VYcsRg54HwbOHeIsdGkVrzeVB/UTWYXV+UvNfeTJuxll8FFl5bbKsN5QYFxtOPVLi0v0
 Spgcf3aZRJcmjrm/SI8TMyZxgyfX0BjQiaqV5n1xBZoMRLbNPgajyZAesKimPGSQqDRe
 kM/aAn776x4INB8G/34wVvkrB/eCMv5xPZojAfNHMBqgn1trNZTdIXhzLGuuKJR9ZRLe
 alYOaQG2aey6uXwl6V5GDiX5zEemy+bHunfvH+zT4Lw6VBjVP0J7AAAQsrejPg96TfOM
 wwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708706307; x=1709311107;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7rOqlIMsp9GkXrBRowxKYMz3u50Ze6PEWMK/mBreZEU=;
 b=CJAgGWp16z26zJgjH5xq1fgNfNRfBcGMUe48FbLET6eb7aDAzQv/jS/lryNNfmzpSi
 nELK2y/hYhWIG8zXmbKImgiG7vAKV1zJcxkvzcT6xiAjyQqOoSUhxXOOP/fXIB3weCYB
 oji4s6ePaGrIeVSqtGjOSW3e08xFn2j+FEeEhzybQZY3VXX8W536JVbCEv3j797cx2DI
 NIWlA7yPamRRwnMNYQs4NAhWLJYI6zfEMGqhkaQNI1bMh9XXS51kFqfPbYH00SSap4l3
 KkZx7kuhTJfS6KcgzHEIWbDSwNDZP5mcqxm8tzEu3gsyLdbTCjxM6Nyt86zp2S+kqrjc
 vCDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2omEQmtbm9KEl4cb6ZMDxUQe2UhyNbmbfLli1UV33IYaQXQn4AXmB92a2jYEcEhuvNELZYRdno/d77Q0ivqha9aq//54=
X-Gm-Message-State: AOJu0YxiZoHOLrqqM9aCSSazGatJUuYetX+WSy4oaAds6B06FbU1nFwu
 jDC5Y5Z1RMx41a+yu+AuAnzWnaHUjy817DBVGojsNJ1noTeyQB36I0iVsWecppb7/iitE/x6Xua
 YN21Rw+7ENVS3SzJDIOP2t32/tt5rUnl0ZUVD9w==
X-Received: by 2002:a05:6402:40d1:b0:565:948d:36ad with SMTP id
 z17-20020a05640240d100b00565948d36admr95021edb.38.1708706307535; Fri, 23 Feb
 2024 08:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-4-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-4-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:38:16 +0000
Message-ID: <CAFEAcA-BdQxazvGJ6qRfVyMHPtgdUJBqogUDE51MOvxzvJPENA@mail.gmail.com>
Subject: Re: [PATCH v5 03/41] Split out raspi machine common part
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: bBPIPZx8tdtO

On Mon, 19 Feb 2024 at 01:23, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Pre-setup for raspberry pi 4 introduction
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
