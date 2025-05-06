Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3102462njj;
        Tue, 6 May 2025 06:08:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVWYOrUteyEIk3VfR9syBcfBdyZlOySexphpZ8ODOxJKWP1P9IVXJuNLe2HAH3jz3iyOliXmO3lZoeMA==@linaro.org
X-Google-Smtp-Source: AGHT+IGHRmBsXCutXWRCp6CsKS+tpQbgwsPia7wFZ112+E+dLUxgi6d4CZI0RzYzJg7UbI5m7xr4
X-Received: by 2002:a05:620a:2892:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7caf081bdc2mr596291385a.5.1746536891366;
        Tue, 06 May 2025 06:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746536891; cv=none;
        d=google.com; s=arc-20240605;
        b=UJnUrmqAhixzk87URvooJkZyvdiOFLiPE5a/9fZeNwK6T+TFOJlSnZG1KRoXSiuO6w
         VPS5PtAmo7SP9SHLdHYANOu0roSzel2UDp3LHl9GZW9b+0EG08VTwBjWTLflUmP6S+rH
         OHkh+RsKP9Powe+w/y9oQ/+aRhME6Yz5W2bw2H9CqHaBvs7DmzKl098j3Iwbty9uxObA
         S6lMzWNwoWNDSNbL78MmV68WuZWUryWBYd0fqXb6aNRNq1YtQnGqlSln3CE4lfWHw9kH
         4Z+Th8Z3vZZGrL8KeG8zArmP6FvSK/C2TuWeiM3E7xQydkoQzKv2IaTrSZxzCX46S+4S
         eybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=k9lahmpkY2o0aOdjXCYPpJPe+QbiQQIocXSQ2WqFHww=;
        fh=ZunbYo7vBCjqSWc9622LTLPHQcfFJMelhG0lIzAt0Bo=;
        b=a9BqjrBOtc7I7ZGJ5oP+YUX25W2a3X+79RFK9B62ipUEQUB/39tJemr6X5kprao1fu
         G4z+vRaR01eOjgvOgEY+i+Vu3YkLckdr8qyxhKESQL7sZmSDqiPuzl7TKkFmWrw8f7VS
         Ep+SG4BIImuG4jVKqFMt4vSESZX8Q+VhvV32eXCxZoRe3zbbfpdpSeaoYS4wzqZ5crg4
         LqQ5Lf5WWEQdsM1/iWKebrtTI3ie6KDVKsmNRgvR6+06KXV7QL1XEudrsVutEj4QCSCQ
         Zpn4/71ajGnOGFe85eHvLUAlgxwd7uYe4KvPGkjqeV/RLBja7xyrMu6gO7+KJf1etrdT
         okVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r5zgtg8R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8783903de71si416322241.135.2025.05.06.06.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 06:08:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r5zgtg8R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uCI1m-0001VI-I6; Tue, 06 May 2025 09:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCI1b-0001IR-HS
 for qemu-devel@nongnu.org; Tue, 06 May 2025 09:08:00 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCI1Z-00057c-Ap
 for qemu-devel@nongnu.org; Tue, 06 May 2025 09:07:55 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e755cd8c333so4324211276.0
 for <qemu-devel@nongnu.org>; Tue, 06 May 2025 06:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746536872; x=1747141672; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k9lahmpkY2o0aOdjXCYPpJPe+QbiQQIocXSQ2WqFHww=;
 b=r5zgtg8RBmRS60W0w/c4INzZR29Wo6KaQ/qLWUAvYvw3AzKpeGUzXzSx1ncAOqMJM9
 w3h0YzX0JRbfyCX40f8/f2fRE6nlJZ+gVDYEHF6grNr7XhAywV4kOoFR0nzTKnBQJegh
 ELjo8KoR86L17YwUujQ+PzQZalDsIEUfUWmYUavhqsacyH8BflsvGYlaF+fiDjR1XpL1
 HPYJVe0fWGCroHLywtMwSOFkTYod8tLowK96U6xBbyxjpQt1K9QIbYzuxtFr9tMgKo8D
 nQJPGwBLEAr5+4hY9bhWQB/qPWy01ggUEk6PNRK20X4FrscRK7FIN99cpFo7/NYfO8m0
 FdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746536872; x=1747141672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k9lahmpkY2o0aOdjXCYPpJPe+QbiQQIocXSQ2WqFHww=;
 b=UgYpGd+XqiCAxTtFBeEuGOuqFjKJoPJQesIBB8eldGENZptHRsCQdj/k1dY/gjEg37
 6X5UFYlGpJCGLEjQQxOVEQ1fdl2P4sMHgTKNqHlnuKjaLcU5d81FZxQIR1K1GPqBQ7eN
 lVuBTZVz8kc/IGITWH753a1fasm0pBsiQ5EOFy7HnodRLYijnZq3ePPEfT9XnaIcT57U
 IGnfZbsbVZG4Q+YPN0di7MDX8BhZsLncbLcvCHbNwTRVLPtZ8s7miA3RMpJtzzayLCJL
 P6Um1/0s6iOQ+xALBXy4jw8zu6QUhv8K7h7uVpQG0vrFF5tUgP6zu8Ad1mvq+CSeO20P
 nCrw==
X-Gm-Message-State: AOJu0YxCDGz8FvGUgtfNKS7gSOHFg988q5EzEx9ydda/303mYEn7YBjD
 ci1eNYuhD37RRuSdhxcR1riAWglACj4nk1hYzvhkIwusFv7jj3X/kFvOs/g670mREdpo50SZd1x
 tVOEpr3Gi4oN7mQSjaIX3A7jN5tSUAhgPaVBz5KvTBq+eQJaI
X-Gm-Gg: ASbGncuM09LwLAIU3eU0qwLk8JPUJIvP2B9LvK764TPUlRzfGmgAkjVJYzP/xz5SryJ
 7WLlg/NIWY5yluQ9YynEa60zysWTP4KfI8pWFP4As+agHV6qBqnT4lHcIkjSdeTYZjFlNMjTqf3
 0q3lK2PnpVEZtuNovMZD7XyxU=
X-Received: by 2002:a05:6902:e03:b0:e6d:f6f8:69db with SMTP id
 3f1490d57ef6-e75bf7c1d43mr4105189276.32.1746536871567; Tue, 06 May 2025
 06:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250429153907.31866-1-philmd@linaro.org>
In-Reply-To: <20250429153907.31866-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 May 2025 14:07:40 +0100
X-Gm-Features: ATxdqUHnkt3NKEDwl6us9aMvgMjwV5PdtA2-DRPH5vIBSHGHSg-U2zWHKPMJbJM
Message-ID: <CAFEAcA8gaGCScMMzee-b_NabLZ9MARxcPuCF13hdKvyrDRkpHQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/arm: Remove deprecated virt-3.0 up to virt-4.0
 machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: o/CBxEl1X2kc

On Tue, 29 Apr 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The versioned 'virt' machines up to 4.0 been marked as deprecated
> two releases ago, and are older than 6 years, so according to our
> support policy we can remove them.
>
> Based-on: <20250116145944.38028-1-philmd@linaro.org>
>           "hw/arm: Remove virt-2.6 up to virt-2.12 machines"
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/arm/virt: Update comment about Multiprocessor Affinity Register
>   hw/arm/virt: Remove deprecated virt-3.0 machine
>   hw/arm/virt: Remove deprecated virt-3.1 machine
>   hw/arm/virt: Remove deprecated virt-4.0 machine
>



Applied to target-arm.next, thanks.

-- PMM
