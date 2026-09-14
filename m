Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A935C88E72
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 14:21:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x67YT-0005GE-8B; Mon, 14 Sep 2026 10:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x67YK-0005FO-Kg
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 10:21:00 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x67YJ-0000ZO-0i
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 10:21:00 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-66c9995ca60so2328893d50.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 07:20:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789395657; cv=none;
 d=google.com; s=arc-20260327;
 b=dMUNoTJz/C3zI/SAt+xliWZNjwsoG9VeAwFcYG0t6ZpiKq97B4NLICRVgOYjFh22cw
 mYeQidaEQB1fe14mEwEZo/B6UkSFdm/v8KmuqdC/ZImNMShWNmiO36aBAy5qLltkklmA
 Skq45K0bG+1pw49/V2ltoQgaWi8vW71vt124nJGthpG2Yk1yRNbs9s/7Mw+rm0F6NN9C
 0ocxRR600MlEDOQ5vQwGjz0jq86jhIwNYTyuVta6wNzhMLgexgql4Scwo7LbpZBJz0cI
 1IUh3zg9objVFfkcPOd+jH9RWEs6ZF3vGUcF77LAOIMo4wSz4QGmdkbOzKW1wvKRmYj9
 r6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=r396Lzczg0syui8baH6Ko5amzTIaAAgFy4E2en2/tHw=;
 fh=J9MmFt4ZfBfe/doylDQmHiJUyUfxjmuIhqyphnUbJdU=;
 b=KwMGVNc+HEzXikARamNGqKUtDU2KeRxg1/driUy9Jj66O/xQWluyTU1HxGXTsk9/aM
 elxnFRJ0TZYUEimvoVYYkhExDtclcGKPMqc316r636VuEwhEtiCnlbIOfYIDq03zZCwE
 4MYvVjG1fQ0yftsYNVNz/E6pTzorx7K7PB9/Bvf+eMCaDTNfJDy8NgzhMzl+Znk+PnK7
 DTCWmCepjUgk8id6jW7GwcBiMrliaUjh6qul/TqAa0S/4SoPJ1wtPXkI7ECXM334i2Y+
 aoqDs0IJpWqxBS1YnncFMIldrYdqY7QufYBar4cJVFLWxhRiDfAMBDQEUVFZa+xF1Un1
 6fmg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789395657; x=1790000457; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=r396Lzczg0syui8baH6Ko5amzTIaAAgFy4E2en2/tHw=;
 b=WmJyQNX8nE90HPhZOwm4RovMrryqeaql7qkxiicsstmKPchubOG8ROyt9oYv9GH1Kg
 mnB4Q+vF6Q2Ob8mac30wTcrodmmElced06818iPkCXFc2fgDis8T6ruUtnsc1txvGJu3
 SVDbPxjiYWpk/od1YMWOscF2btlgms0Ntq2l2wqcS9heKhGWyjLrZUwjcRZcIGzt/9jI
 gMGPS/jwlF7CCKTTqWZzHhKde93cMY6eAVFWcy5/8l2jZz1Gbg6JTTfZVseRnryW3D3d
 ZZ5o2So7g+Zby5mu3wa14QE4Znq1ISOU+/CaG+hFBZAOyqsb5t1xIYlFp/SHvDed3PKi
 lIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789395657; x=1790000457;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=r396Lzczg0syui8baH6Ko5amzTIaAAgFy4E2en2/tHw=;
 b=K7BBUXY9FZcn+yO8C4eaIU/pObC2ceYKY36eAhI2Wio8p6f7w8pznxMxRmoLuZWJ+e
 vVcbFAHi4nuLh/Eqt/5hHPSda3FxFhKBiTTl4exaxID1mUYVB3nqXERqM7dWPDd4waHC
 rRKOWwptflZLFHYiJg/wP6kWt9p2MhtBl/SvJwfWd4ax0TY5+NIJW9ekQybr41DsvVh1
 CuVAN8R3xaeTtYBDO1abUXdJIw+DIuQSjrb+OSMdRnqdceFOMAfz26EF0Uw2I53v7We6
 KOtALjhsw88Y+Clao3+6mCNN0Q7E1g8nNXrjPsVagl6qyXMlOCM7XQ6FLdHnDAjWJvMo
 2+gQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwrWIxo/HaLK1Nv8oyk9VULIymiMutm7SRO1oFVC6IlRkKMEKMXkGgVjHxV7D5YCdrvqMlYh4kGEw==@nongnu.org
X-Gm-Message-State: AFuF++mP6K3D8cFilZYLxp9BWP78fv70xPq++2aQSslDuliIcm+Ts1WL
 rboG8gteLI94YGryKw64iX78i7EFj7/nm2311je9cuKS3sjxrPDWhAMrrM2Mze/hQ7XwmRmjegc
 eT1PNj2xzVTFkdLpbyK2p154e4eF3HwvWZnEyFAb3Hw==
X-Gm-Gg: AYBFou2CW8RLCTUf28rRMeNIADNqTUTB8SwOSijfkHbupP7mnyvdSqPs9EbJaBed1yS
 ljvVUhNoo6TrHvIY8ccNGgbRXXcodJM1QII8WyDByd3+sHDVGV11keccf9+5NCdOobA8STcWxss
 p8gmm25sb36EiZDFxLos03RtCzHAf221VfM80Jl6mGANbNkREOamjdjsS9ZqvgPEL5KJb77hM49
 fdecOiJ6GpTs2UTr5bYlqidsAhecnGf5/2Oi+bDW/CHZ67mTnx39aFlaIFnCPaZ/80nZgzePtIt
 qA/i5XFA/uFfX6+QAO32KkWwtDutYl+AHvw5clJicRPt/R9ZJrh9KkEWn5iR40Ldzny2YdVIa+T
 VcIv4gfxcOgbAnNMQ1ZQx3GNFisSkPS4lkfsbgvA=
X-Received: by 2002:a53:ac96:0:b0:664:bf1c:2922 with SMTP id
 956f58d0204a3-67142c97195mr1196017d50.27.1789395657320; Mon, 14 Sep 2026
 07:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260909144151.26803-1-sebott@redhat.com>
 <20260909144151.26803-2-sebott@redhat.com>
In-Reply-To: <20260909144151.26803-2-sebott@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 15:20:44 +0100
X-Gm-Features: AcwNN1Ub5nw9wtChzL2tYWe9mGDu0DkyVmpXYzrIP_mFtm9Uf1F0iYjcv7lA0uQ
Message-ID: <CAFEAcA9HBVnBcSchvBrt-z9UgYBeJ2EZAJrdbeoL_CoKgvU6rw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] arm: handle demuxed ID registers
To: Sebastian Ott <sebott@redhat.com>
Cc: Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alireza Sanaee <alireza.sanaee@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 khushit.shah@nutanix.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Wed, 9 Sept 2026 at 15:42, Sebastian Ott <sebott@redhat.com> wrote:
>
> From: Cornelia Huck <cohuck@redhat.com>
>
> For some registers, we do not have a single ID register, but actually
> an array of values (e.g. CCSIDR_EL1, where the actual value is
> determined by whatever CSSELR_EL1 points to.) If we want to avoid
> using a different way to handle registers like that for every
> instance, we should provide some kind of infrastructure. Therefore,
> add accessors {GET,SET}_IDREG_DEMUX that are similar to the accessors
> we already use for regular ID registers.
>
> Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Sebastian Ott <sebott@redhat.com>

> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e3f931dba2..9652f8b0bf 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -919,6 +919,18 @@ typedef struct {
>          i_->idregs[REG ## _EL1_IDX];                                    \
>      })
>
> +#define SET_IDREG_DEMUX(ISAR, REG, INDEX, VALUE)                        \
> +    ({                                                                  \
> +        ARMISARegisters *i_ = (ISAR);                                   \
> +        i_->idregs[REG ## _IDX + INDEX] = VALUE;                        \
> +    })
> +
> +#define GET_IDREG_DEMUX(ISAR, REG, INDEX)                               \
> +    ({                                                                  \
> +        ARMISARegisters *i_ = (ISAR);                                   \
> +        i_->idregs[REG ## _IDX + INDEX];                                \
> +    })

Would it be reasonable to assert() in these that the INDEX is within
the range we expect it to be (i.e. >=0 and <= REG ##_IDX_LAST) ?
That would compensate for the loss of the compile-time checks
in patch 2 and the fact that static checkers won't be able to
see the intended bounds now this is just a slice of idregs[]
rather than a standalone array.

thanks
- PMM

