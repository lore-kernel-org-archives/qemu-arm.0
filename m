Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFB2FF885A
	for <qemu-arm@archiver.kernel.org>; Fri,  1 May 2026 08:22:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIj8g-0000q7-LC; Fri, 01 May 2026 04:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIj8e-0000po-RZ
 for qemu-arm@nongnu.org; Fri, 01 May 2026 04:22:20 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIj8d-0006Iv-AR
 for qemu-arm@nongnu.org; Fri, 01 May 2026 04:22:20 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-651c366f7efso1848870d50.1
 for <qemu-arm@nongnu.org>; Fri, 01 May 2026 01:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777623738; cv=none;
 d=google.com; s=arc-20240605;
 b=Eq7eV/jxh161+iRm/QzRO0sTWFuDsW9eLXsS+YhBgLQ/eD0Uasx6u8XO/YP7T5tOzY
 EpjSd+7tOH4Us4xOWKjX3vTrWKCyY9G1nlbtcNVdlzFHwbY60ioRFQ2yoHZY7nU5xqLe
 qUwxXRPNj2aYXRWOuJhdGOlFVsUPanO21cqwjb9CcBhJ0lFVNOTy+JvMbAo7ec2LK5J/
 PKcKe0ZnMJDd2po8R5iYNp1O7q95tyz5DxuvOClT4v5f4YlyXiyz9wrZftNRCHjsUz8H
 afNlxG4qgBImKBmi4ACjFw9L4EDniPdnK7zOGlflghh7V7S6nCAo0ppZw7YZnvuKWOo7
 Cgxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VBNpCNuiCpFV2nOlypxmB0JL1T6t5pZBpv1vCJf9xMk=;
 fh=Pj7/QxLa8l3eL/XK9krmjELmKYwMvEVVG6U09b9Sy0g=;
 b=kEKxS/oR66+TVRSBolgC+pkiSoLe28ydLep9qd0SzV3HXjBpeLLCGcekn1M6yCNfhk
 HKlsOipfNUPd8J0NCnnZDJ72lVlKsSl/U8DFnXE/YHxjjDYzc663UW7B8clJzsX2Xxn4
 SoTLRcqHkJ6P3yDDb5dp3Of3f5w+yA4zQ57UXRTzm5bTnjmfPmb0bSAzdpdeKlN4DvrL
 w3ePOp34lrUFYJf04vF3tsjicm9+BJ4VwjDTB43PPnS6Uwd9BtqhlGFElLcyJHJKJItt
 KvNRh4WnhQIVyq3Z4CzrdQaDBS9tYlAeEfH8YAkhPmsZxgscT/bgTnFtYjQCg17Yc1U6
 X8Ew==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777623738; x=1778228538; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VBNpCNuiCpFV2nOlypxmB0JL1T6t5pZBpv1vCJf9xMk=;
 b=BcTLMR9FY47sN5cbxlC13URAUOwPR1/cGe7VxYPqqmB5j6uOfScX8ku57z1bXKkgJJ
 t6WO6C/lvUHsMLUbRNUL3JruFODOcwMytdFa8nl2NZnrU2O1gG7gyCUcHbJnOpb2UTB+
 08+1AoTP2QwtGyBPcU8oNOK3LBExnwtneFvB7fGEF4MimURf2oSo5uwl/2ISRhIcJoG8
 OIa3lE7eowF68bL02Tr57H9fAEQkzn+AQIFpeS+D+3S4U2HKAP3Xi/mSyp9zmZYyxkrP
 +oV4J+5APelD5gaCHxA/H01G7xBtR8bunZDNAqNgbYTMS3VECl6BXWbL6dunGlgd2ieu
 W66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777623738; x=1778228538;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VBNpCNuiCpFV2nOlypxmB0JL1T6t5pZBpv1vCJf9xMk=;
 b=tVOs0vL/rZ55l3AMUWyEqK/BKDleDO6ndO0bypgLbDQkumbBQQrbDeqmwLWC457vub
 ZUwed+elFEB6MSPxzDINtX+ErzaTaAW//QqwgJY9SBjn19NzNE9fh2LWEhv/jKxmK0e5
 iWz+ZinudZF+SRLNUJ+zEua+NARICEsOrPKNmpqKFtQ5+LSCLlWb1gfGJxlPM0br27wH
 XBW4G+PFb1bRP43R00w7nDz/5DYD5a4tDj1/Rim/10Pg27poOPUcYhGzgzPteQrXsSME
 xT9YomOlI/+THO5DedvF9L4PgDuAzyAKVAKEE67uc98gp/6Jtj08V2Fha1jj15rsAw/I
 q2OA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+quk1XOxUykXa4jRslACew8jsCJAgYNMvyqutZRmYQ1MbLo4R12JoZxz8O88e5y3Tqb2x89PyYbw==@nongnu.org
X-Gm-Message-State: AOJu0YwKfejK+YBtkT3Mv+vto7sDe4eO2Yo0whEjBwKV1Oi9+3chrLki
 eaE+2lCBBaAAohl+8Y6IPkPGNLhHNTLon1yEkSVs/1nqO7y5yrbxxfDqConwMIuiKqD0QmJhj6G
 nonbYvYsPmkZvNCHh0R+reRAQC/h0ONS3gQdSjLszEg==
X-Gm-Gg: AeBDiesIbQuAL13Ry+WV4Aj/B3liESsg8gJHp2rkICPhhrTLAt64OA8VCJz1feD2hlf
 2KGvPWYswcGcS0e4WhZe8pJ4CGQjy3Ua2Il6WiBGHSG8JBqXhkmG4XRP6cQmoB6zj+tFFAiWssN
 LJRZVEH8etrlLXSnaCFWE7h8qkX8qdiSDlLYvDcx42zlUJtK79DSALZnhVd0IEsLWGrpyLeZ9TQ
 ZiaAsSpaV6lja4JOjcSaq1RKLDzSOUhEr9zxDl8djG4s61yQO3DjHIXB9pEbat8m+P7shsLN51e
 3BED0hedyKUM1jjpaasr1hZz3QAmoGjlekez9BdD0cTBSRC1T3sQcktVgoocEVJ2GUK30U8q7cL
 4GnF6tPO6FV8k
X-Received: by 2002:a05:690e:191d:b0:654:1261:8b57 with SMTP id
 956f58d0204a3-65c30518267mr1806097d50.6.1777623737892; Fri, 01 May 2026
 01:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260429190532.26538-1-mohamed@unpredictable.fr>
 <20260429190532.26538-4-mohamed@unpredictable.fr>
In-Reply-To: <20260429190532.26538-4-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 May 2026 09:22:06 +0100
X-Gm-Features: AVHnY4KuyM6gYc5WFFzASu4wWdDm24T8QkofWmZBaWEjMzwcNkGwL1CsRgsKUtI
Message-ID: <CAFEAcA-H-E4ERsz2534i5qVnr+VF9uy0N66MOs3QHmwkP8i1DQ@mail.gmail.com>
Subject: Re: [PATCH v21 03/15] accel, hw/arm, include/system/hvf:
 infrastructure changes for HVF vGIC
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Alexander Graf <agraf@csgraf.de>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 29 Apr 2026 at 20:05, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Misc changes needed for HVF vGIC enablement.
>
> Note: x86_64 macOS exposes interrupt controller virtualisation since macOS 12.
> Keeping an #ifdef here in case we end up supporting that...
>
> However, given that x86_64 macOS is on its way out, it'll probably (?)
> not be supported in QEMU.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

