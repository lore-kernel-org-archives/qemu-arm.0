Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6D5F0182B
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 12:07:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyTxy-0002Ig-1n; Fri, 06 Mar 2026 07:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyTxp-0001vO-Mg
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 07:07:33 -0500
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyTxm-0005sh-Hh
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 07:07:29 -0500
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-64c9c8f8783so9556175d50.1
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 04:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772798844; cv=none;
 d=google.com; s=arc-20240605;
 b=fEjHyh8U2hm9/Dh/aEqlGKseFf3MH4SZ6iM3A7aNJE610c1YjMhcsM37yxbdKONNHq
 lxtLJCSwQShh59JBL5mlLKRjf9fOvM9eaNjUjRtn+VBQsMvv16uSFk0eDEcryOKyfTF5
 Z52OEk82Ub1IG1fvcx7IL26GM0C+cheYtOiD6IjFn59PFjjzmD227ATGwBQ+iCZXbobL
 zy7eD8RDkL9eebw+Gc2+dH9K3ndC8JQx/j+dP43l3EtqE+Fs5dXsHoS077xwnb2xKGxw
 PoRh5uPQBF+0XA3/9y+Vsh5gW7BpUMxdnK1jcvosRmHrVTxzsF3PamW8Hq3lHbDlO+9G
 5Dxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ZRrZAUIqukQp1PtBABZb0rugG5yL8v3lsgHnAX6YP3M=;
 fh=uGCYlCMvJqttaZHmfEI0JcrF/EEsjT9LKmMgAEW32Qk=;
 b=Q3TjflGbmfi21KJPQVOZ8eBNnIhnL5v/yvn4xEMyV8iiuVgyuw+YzXn5/9DsWE4Z3Y
 9Wwq9KlgX4NcqDPS9+C1cEWK1XTDoz/LbyPlQ/SfWt4hoDEmhRU8FMrl4l/Brc5+1Nth
 INdoe5NQEAxvUKbN6S4NgAIJ5J25ITuW/X9mXF98v6J3OuZOYA0CP1FKttQpPC6F6t4W
 SuAvXP0kkn/NJQtbAlS1E5+IeHhRuCc7iN2HF92ftYpGlyEzgsZdCH84M4fmMV3OvyGs
 /m7uV3Plr4yroNCeSL0VXSz8Fb/wFnDgFuPtIaPBfy06ZjfEKcWwRRGdrEyAqtLYkUYX
 Rpfg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772798844; x=1773403644; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRrZAUIqukQp1PtBABZb0rugG5yL8v3lsgHnAX6YP3M=;
 b=tOcptHL/u5sGoZm0fJ2IkMyoVVfio6dz3sP4BQgJqx6H0JNcU08vAkedjmfkJBqv/Y
 1PORjy0IAF/1RR/6u0/7wTe84K43hyDaF+iTLREVtfhIDKveUfrGLuZFxEA04AKA6+Dy
 OocE5fyE/eleOxy1Ypkd6fMxTHd/PgYoNvqm61pEwaKlqN3wywsVh9dVkZ/4QMzDP+Dj
 9l4AytsYSHqDooKud6860DpJKMVskwaeULw85ecYd2rjJFKBVCgRoDJ0yHCpwXy2bl63
 0MJau2Gb2ObuyY9qfoeWTzgIdyJ9fP0U4AScGnp/nKAZ+8mI5ywWZGAQAmJ8c9gLffRP
 a0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772798844; x=1773403644;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZRrZAUIqukQp1PtBABZb0rugG5yL8v3lsgHnAX6YP3M=;
 b=jzFxSG96kwzDiHztMTVkJ8UlOx5sbzLlsg93He/qF9bL+rGilnCM9f2GArHuMrgI6z
 kclNdHQM+hDF0Bd3SvYErkQQPcfEKGZVjQ+9l5q+o0XP1MtbxtE5ER8qNcoMfmnc/C6d
 3fneOt/X2aKBlpXkIGcsE5m4162Tbdc7fOns8fFs6vpnNXej2iKHDtHPhSvvvCx0PmsM
 dKZNsPTsZQwT1lTF1A9jksCqHkOnd5Xsa4AjM5mWoYn2EPyHiRjTMTdOwI/gAnV8viER
 VTK9PxnfLSkz9fRru0dqkGm1LMh1Y6bfJLp+t6YzSexwIaydOA0SbikJDXRID32R3S/h
 2slA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyu7cdieFPIhg0jPm0h8nV2L+0QJ4hWTlD0jxluyphU6tnvZW03mZMo4drqzHClVKE0U1DzFZsxQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy5vHP0h8Wpm88IO99PFF5A6LkvSj34pcgenga7GSjB/lh1NEmc
 ZA7IusDpWk1QTHPhIwW2R98RoFmuVvKXA0CYAw5k0K/z05+LbCUm7D6QiUbpjJ+golqCMtuJwlI
 +mGMjnXRV4M+etWQUGNh1HHNYKk8qCCKq6hGWWq6TNg==
X-Gm-Gg: ATEYQzxaGOGnv31Oi95IKnJaJWOcPXqB8rbAmMwBxT5Sp1pRlgT2jKkf1dVzvkuE2ib
 rGfu83qH8ehHefxkq7itT0IGcVvP5cByq5MMaa2s5GvByNrF1jAF5dquVNPB1E2i9cE/h5SHJeV
 ydlcI3X0a5E49F7/xaj4d2gHR39hrmGRNHFikalmh2S2CAZGiPT1kL++SdbDjD0Y6nknGKPRAcM
 sU0xMqGJKiRe9AC5Y2Ep/sUynwVez8eN0TdHj1ufB2wnr1ySLN5/wk1bghKErqYzMIKDiD5Dhli
 gcUvT3DB7NHaj8jUC+SQunRt6Z54Zp6RwQu4PicHM3iFoBGDQm0gwfC+wNHxFLVYybw=
X-Received: by 2002:a05:690e:1482:b0:64c:cfae:a9c4 with SMTP id
 956f58d0204a3-64d070f28f9mr4766672d50.15.1772798844429; Fri, 06 Mar 2026
 04:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20260303-sme2-hvf-v6-0-b473702d8287@linaro.org>
 <20260303-sme2-hvf-v6-1-b473702d8287@linaro.org>
 <CAFEAcA8zTkc4pyHQKoDkTMhGPLQmxBaJS3bZiGRrPgux3rDLzw@mail.gmail.com>
 <CAAjaMXbXdrW9N1xLMPxL9OmjLqti6A3rqAmYipu6OkdBY8JPNQ@mail.gmail.com>
 <CAFEAcA_MuZH8d=Z=NfrNQ78k+Kv9mSx+=DLLt8AxZeEjccN8yw@mail.gmail.com>
 <CAAjaMXbq9A1NCO4jnF4aSL0XM2pzHsPsPyWfmqSCg_+2ZQpEHA@mail.gmail.com>
 <35FDE44D-63E2-426E-912C-6EB6CDA52116@unpredictable.fr>
 <CAFEAcA-Zgq43KW9EC-pteOqxHcZg==GE=1TAURZP-DGRh3OoHQ@mail.gmail.com>
 <CAAjaMXa3h1abx=-ijZqf13ku-T=9+eV+XK9g85kGwxeRB-on1g@mail.gmail.com>
In-Reply-To: <CAAjaMXa3h1abx=-ijZqf13ku-T=9+eV+XK9g85kGwxeRB-on1g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 12:07:12 +0000
X-Gm-Features: AaiRm52cfi6ei5UfM06eU8s_-9mpRBlboYrAo3er_JHd2j4n6pvL5u63Citalyw
Message-ID: <CAFEAcA-+x=SJ5E=owff6okoteN1ytNH5LesfFjwW7+tigPU44g@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] hvf/arm: handle FEAT_SME2 migration
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Fri, 6 Mar 2026 at 11:49, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
> Patch v18 needs an adjustment, because clang prints warnings about the
> `static const struct sme_isar_regs` array.
>
>
> ../target/arm/hvf/hvf.c:1098:11: warning:
> 'HV_FEATURE_REG_ID_AA64SMFR0_EL1' is only available on macOS 15.2 or
> newer [-Wunguarded-availability-new]
>
> Peter,
>
> Maybe I should send a new revision since you haven't merged these
> patches anyway?

Yes please, if you could do that that would be really helpful.

-- PMM

