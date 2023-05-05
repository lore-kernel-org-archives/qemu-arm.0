Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp365979ejq;
        Fri, 5 May 2023 05:07:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4wXRHYmrv5gEecZxWRbuQgozBGVNSOhkfluzegJruevVq1AeXkrbOsWFgYEDdE3NwFBALi
X-Received: by 2002:a05:622a:548:b0:3ef:2fbd:90ba with SMTP id m8-20020a05622a054800b003ef2fbd90bamr2055751qtx.43.1683288461585;
        Fri, 05 May 2023 05:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683288461; cv=none;
        d=google.com; s=arc-20160816;
        b=T6y7vmhg8XW1eFB81qGtwnNfNi0HOUatslHEGx3ttUxdthIdeUejyKbOD9gGBGQG8F
         z0h5RfMroqkEb2E0P1Tpo9agzW0F41S63p+9jj/l4sZhewwXT0j6LaGNEaCROksNiz81
         +crMf82ej+aqa9YJ3SM5zOXXfOzJqGdEI7VrBfdxX90LR65Zi91gXpby3oguRzi443CZ
         3qgttgUs9YhSIHVmBosiVlkvWMWYXoizfzFm18CdNjkx4hPdUz8e42nO9FAzh7IxF7YK
         jxs95T30P7nptChmPZyYzJbCQg/gnX2Ia2Orhz/RU51ynnRBXMfKoVQ6Yl8Phq39v/Ra
         iwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=w0IaBi6Jr8BoxklZXBMID60jI0oj2n7Ge9iH5OB+DzY=;
        b=uJhgxlyd6oW37J7uFu4dTiTdNTh1BEwBDb7SLN6UwrpH+JuSdzS1YoVTlch/i5rNpV
         EmhAQF7UaZziATcqF+VZCMyxI/x3hdqTKDi9xNS7jnoqyo5Ps/OJ5WprQ70psjJ9Uvzb
         X75kqtBpri1rqrpjFm3txnSURRaizSAfWd9/7Gizrh+sahXPwGu3IEJTJLgmr4RFpSyk
         S6ka39cCeHhxvc+AqkVIq6+LthknELAHZ4EeBIKczQKqf7jEblaPk2V/b4/3Hau5unYF
         jwES5tlW1w2IroK8YNfu+2oyxfSKk493OiKGGufgl+qqQNxJ/b3y6y3XQqKjGgM2WKmu
         wYVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rQvMIOcF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a05622a014500b003f0a5af0763si492304qtw.635.2023.05.05.05.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rQvMIOcF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuDf-0001LD-Px; Fri, 05 May 2023 08:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDY-0001IZ-Mn
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:07:21 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDV-0003oD-Lc
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:07:19 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc1612940so3260651a12.2
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288436; x=1685880436;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w0IaBi6Jr8BoxklZXBMID60jI0oj2n7Ge9iH5OB+DzY=;
 b=rQvMIOcFBrOBuJx6oP+SZJaCsQyggA25KsA0qCqPq5AP5CnZoiiE/zbgvm1WYrtl56
 oQQvVp2TLFIsU0rH6Knd23hDc9+PNWwH8GX4kqAuqUeKW6F+FcMLF8AQFiYDo/Kj/vkC
 h2zoz/xnKDAFJZCRubUnEs5cyyZSRgcYcNfgZjJzR1y5btwyU93YFw1tUxvHUavwvNqW
 EZjEwWjqSDbbdmLGRw1iuFVCMyqYf9Vj89KkMJWtJN7QldR7VwLlAbLCIkYnb5ZXqLj+
 kl8xKkipSUA/v9xoPUR9UnZJKn52kWdjc1JtciiVa6L+3J74RQxJc4n5ALtBbR6iZWtz
 wyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288436; x=1685880436;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w0IaBi6Jr8BoxklZXBMID60jI0oj2n7Ge9iH5OB+DzY=;
 b=P3r6M4n/Le+fnLBea344V9fYZxtqNhBKTxS/3AKaY5RoaErTrAheQQ17a3GO1gfLYe
 NPuuO3TtdiPCg0O94bPOJr+eBCWToX2KVxtCv/Qdd8nHNvd7ZNcJmqB6yTNlZ1Kjk8i9
 wxiwfbef61mrcYZWXW/kr6iu9+mFiGSgC4Fb55G0xnSMzs4zbs/7DwiXwyyrq1zOYbG9
 88idbc0oGTGv4pOMQkJiJejjmMMp+iSxxOMoxrHNUSkbnQCZHDC9d/9g9N42CF2fEiNE
 j/akewsm40E/bc8NgptV6V4M6DfisER3M65MItQ5HMJsKY05Qo5RB+FdSaE1othTUek8
 Ikqw==
X-Gm-Message-State: AC+VfDw/PlvxJaFDOBzGUlHfvc/OCbU3fUukXGBiI4vY2ziLvuTV/qUP
 AUC7AOl9aLbOQtLprRsudrgIgL6KKYkKZW+IomVnSA==
X-Received: by 2002:a50:ed99:0:b0:50b:d30c:c595 with SMTP id
 h25-20020a50ed99000000b0050bd30cc595mr1213814edr.7.1683288436152; Fri, 05 May
 2023 05:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-24-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:07:04 +0100
Message-ID: <CAFEAcA-Dnct2C_DnYDOT6mTAYXpnY=jN99SWZvMTc3+_0iNDuA@mail.gmail.com>
Subject: Re: [PATCH v4 23/57] tcg/ppc: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: GMvJ3FyBgeYR

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 44 ----------------------------------------
>  1 file changed, 44 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
