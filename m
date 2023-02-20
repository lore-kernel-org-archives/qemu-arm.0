Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2425126ejb;
        Mon, 20 Feb 2023 08:25:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9NLVWmh7aMmVIBM4pB39LK7RLmmYoduTLxdxKHmBaPqzhREXprRVkWp7LQhh6p3GMGoPMb
X-Received: by 2002:a05:6214:f2a:b0:56e:8a00:f3a with SMTP id iw10-20020a0562140f2a00b0056e8a000f3amr2056237qvb.32.1676910300887;
        Mon, 20 Feb 2023 08:25:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676910300; cv=none;
        d=google.com; s=arc-20160816;
        b=fvFDkZEeLC8WnbDHZnW2epq6yypKtTft6deIqqNbetUSeczK3A0/xHZORbHXlObp6l
         gW8vboRKMF3u26Tmvhpp8KZCNyCvAe1a3GTwFVC9WsvCermyInmPh0g+MCRmx9zX8ahw
         RGcX08jFwID1DhuRAronxnWewOCwpCRf//m6mNGx81QBPJ1ndkCzIkwFNEaDjJPIaaz1
         +3rfyOLOGGF7osdcKfvrVGj7+gIcaRFHKIW/z55E3Sh1KttGD0qDLNF5AYHEaR/ieTfq
         K9MOuORGXND1w9+JHZ9Lt7yDzUmK9x9cvMeHNJ4PkmCWyZXBNQmpfD2LGQXLegGZNAHv
         CmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PYh7G+D483x1tYP0+UMRghHl8TF9iW8kkbMyPbusM5E=;
        b=MEHu5tb3ASWV7vioS9rJstUSi8aBBnvAYWQRQtEQZPUBsudGArOCRaGI+iJ5x9a41p
         s9M3tJUjczWNCoPQo+mFZIJWhq65SGjbSvJ2A3OMwjxKmiMtYXc1VYaZ6c6kxRvzO1VX
         aEOMbgQ0rQ4wqwgSLVFkFxaJgMuXrxTXClSd7zH7SU9B3oaftMSE8HnaG8B3mN8BoZd8
         ZpLjq58OZXz1B7Q6UM6rhJpy1oUt8JD8RhHvVAQ2JA4HsAJGC6XQPr6VYMr9+ew3ejq/
         Olwo1koxHc+T3NLgTlbeqwJA3s6FS/Q1PHClzQb/ojTqVDmGKlvtJz7qOtFm10Z64vBy
         Wrvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n/H0wcGF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2-20020a0cf4c2000000b0056e96271feasi1020155qvm.268.2023.02.20.08.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 08:25:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n/H0wcGF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU8yI-0005jv-I1; Mon, 20 Feb 2023 11:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8yG-0005iL-0L
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:24:56 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8yE-0002gw-DJ
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:24:55 -0500
Received: by mail-pj1-x1035.google.com with SMTP id g14so1865945pjb.2
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 08:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PYh7G+D483x1tYP0+UMRghHl8TF9iW8kkbMyPbusM5E=;
 b=n/H0wcGF3rBsItilr9QrPwe/ZYxhnsMZqQFZwSMkcpeajmno8bnIg6ivWG63RCs2N4
 hCK1jmUltDnJu0LkmarkNoTvnP0tlGIgR9qxftxtG56xdonWxg9UN30/wdr3LwLlqGau
 ebsPD1zI/bH+IWDtBSdudm3VHcNKMrrLwBew74Gt/9ovtTBBqkNCrS/T0cySMavIDuPK
 jlxeaCKDssiWR8/aFParXXLXEdrsumtvhWZsYbRXu0DQ0ktp6KVWHrp/B5msP0Z/N6a8
 pflWHafGEwzLG/gfWYFbwcOCs2bkJ0k7f2x2i8lJOR8SDPsjSTMsHl9uoSYbptbmoj/t
 Ee8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PYh7G+D483x1tYP0+UMRghHl8TF9iW8kkbMyPbusM5E=;
 b=7tMWnVsr+NQqLW/d+Zafz59qfQfEIse3XgTi2nekFa1IycPhNixxRhYI0vH7FE1HpM
 qFePoqJ54f72bNBuf4C01pMQ58klQBtbLn72hvOj0tih2xzzcInBgyL/+4434DqqpPhU
 7tMFmf9YVItzTu+iR3kwZOHUidypUwWXyYAC1egWTchihIGK7EGaap2uKVMSqdAYKPG0
 tJWvIcvg8yXoz+bEdABNoWMD0JRpjjlmt3BmGG3rAgF6Ydr8LV103jGHhu+5aec+/37D
 5R8aFefm0AZbCPbdF6E0UF3yHVVnONilL6g/jnjxrzKKHEFTCAxzv9QKjqubb6/q49Bh
 tLRg==
X-Gm-Message-State: AO0yUKW9bcJwAJp7dxobNcDiJbrPKRpke/qtcwRw5r5O4rToESyfaJj4
 5qKnNtlHTHPJ8gmYBcHBO7uQOlb0BFcv2r7Wk43Lseb8wPx0LA==
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1004858pjb.92.1676910292952; Mon, 20
 Feb 2023 08:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-10-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:24:41 +0000
Message-ID: <CAFEAcA-w8-9w4WTGDeEJB_YdpvAyhOch=8P6hoEHKqEXA4-uhw@mail.gmail.com>
Subject: Re: [PATCH 09/14] target/arm: Simplify iteration over bit widths
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: v5Ssu5K6B4kN

On Tue, 14 Feb 2023 at 16:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Order suf[] by the log8 of the width.
> Use ARRAY_SIZE instead of hard-coding 128.
>
> This changes the order of the union definitions,
> but retains the order of the union-of-union members.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
