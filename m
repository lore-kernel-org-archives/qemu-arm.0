Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4447048ejc;
        Mon, 27 Feb 2023 01:31:57 -0800 (PST)
X-Google-Smtp-Source: AK7set92hkGMbdy1oz9Vf4LHb90xIrx+guhQnGMZAwmkeGxJG80eek2GLrKLe/m2Donm44671/1n
X-Received: by 2002:ac8:4e88:0:b0:3bb:855a:9ed7 with SMTP id 8-20020ac84e88000000b003bb855a9ed7mr40934165qtp.42.1677490317360;
        Mon, 27 Feb 2023 01:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677490317; cv=none;
        d=google.com; s=arc-20160816;
        b=zrpCnX5yot7+ojYhYffbu5m9h4yjNYPYU5+eZCx4lohtoUfL6b2t5W080zkTm5VRsJ
         rj8FR9c7jQIbHQBTOZweWoTD/lNTVlAekHySl9G8bEevPeZT6rB3AQrzynNcTnYZXTa7
         Q7eoutKsBg3W129ylY0Dmw4fPjd1nKoPndSPqczhc26IK8X+3Pi79OodOXIbalHkzPRH
         zoGB/1MkV4hvU5GwUANTXmCSSdj8j/psgxEpba+ke0PaZz4XK5UneTW3Ymc52JRGpaSM
         cmgxvkEf4aH7/K6/qCqnVgmzANYPvwHzwxYmVVDhUjYYEFJricwg1MtGPgbRYDCFuZJj
         ccKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Bce9C9gEHX2JUTnxtKPC+KT8yDkI1qx/UzxiapyYd3c=;
        b=iEfIhlJgj8+B2+yeNy6B4TwiM18nkX6wiGawcgNqKBtXnBEya/9RPjdz42j3QI8nNW
         CFkBoJJmqVOlCD5IQ6NM6k2/cCriW3spxz2qXZSlR3W14KLf+G8DnIjxZKbFPS+eRp43
         hLzS4qJhNgxwG/l52jsQtFE8E6K68m8rZ7Z3hferBMwPo+tS9K8Pbc5+ZNkuxgYAjzZ/
         x9hykVbXVor5B7TUFS2q6eCmGUvDbEab33+5r+lIEwnklVps3SkgTlSl4RJlBdBh5L/0
         z2c9aYlpqQZz0HyzVHwYkB5gXSYUaAu4P41uR9qImC2ymInr+2xa6DPwkJN3xoHqo5XX
         ehMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=d3EbPLbN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w28-20020a05620a0e9c00b0073bad3ab5fcsi5707117qkm.150.2023.02.27.01.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 01:31:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=d3EbPLbN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWZrG-00042H-BR; Mon, 27 Feb 2023 04:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZrE-00040R-LL; Mon, 27 Feb 2023 04:31:44 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZrC-0006uo-Im; Mon, 27 Feb 2023 04:31:44 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so4937447pjg.4; 
 Mon, 27 Feb 2023 01:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bce9C9gEHX2JUTnxtKPC+KT8yDkI1qx/UzxiapyYd3c=;
 b=d3EbPLbNlaBWe3KZ/Gg6wEE88o+58cSHXIFrRRDNhalOGavIsCsIbrZpUAWftRZfbC
 k8jyvcIiyNz3xYGWUegygB2nA2f0/3rZ+W1Lu5l2a5NKD3ONjgBwUBXLIXfvh0QSmSlu
 dzYExyzhbyMFJT39Pvs3EgJPsgPGytdyVYJpxiSBrGwkmRKlLLCtV9O5umnG7LEDl9Un
 aS1s8zTzXEo3QB4apN7AIACnkRS/AZP5fD5Klxtg1PAX1Vcylzoj2dNCimsm/GGFnX+O
 XZYlXPKJk/bxgZxwP2LcSBGCQcFHNaFtFTX2QXNwe2gmq0Ax+s1qsyTKM2/qnkqNBL4G
 0sxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bce9C9gEHX2JUTnxtKPC+KT8yDkI1qx/UzxiapyYd3c=;
 b=0l4ULPPTU199K8n0l9n4MNyaVqOWLIXZ0p35EyRcw9sHBMf4UEAqFcoUYmisf7A9Sd
 1Nb/UwZ9ln68kLkK57tLIi8AtQ3RFSNl8DFUc2DGsI5D/zS30T0O0uKpJkFpIWJmhldu
 /dUJpy5yaCiHEqkqIsd0JBYD+5MrmRHTP0ZDd+ytleZmBUTKYCKQkNOZUMqeYIS7+fFs
 nycTnGbvxIAepeFz2raHYpP3M6rkLKmkspZR70/yCp7Jzcr7TVT7JTjdV1ecbqVi+p/r
 glII2sayGnKz5s4oEc44wuLNGTL66vmfeBv/hHoEETDxCSBZ6dyv1NsTgvtZIrx54z+r
 UJCw==
X-Gm-Message-State: AO0yUKXVH90nxI1Pc9+yQ0JNmoZBVDOPhfxExqpNdV22n8s9s0gloCdx
 9c7/iGdmWCUmmLcmMNAnXIxqQKOdspk60k9LPSQ=
X-Received: by 2002:a17:903:2651:b0:19b:8cbb:30fe with SMTP id
 je17-20020a170903265100b0019b8cbb30femr5923497plb.13.1677490299535; Mon, 27
 Feb 2023 01:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-68-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-68-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Feb 2023 01:31:28 -0800
Message-ID: <CAMo8Bf+AJ-uBs2san=Kva7vZ7W8iN=4dfXGWrm_rqYojGXv1UQ@mail.gmail.com>
Subject: Re: [PATCH 67/70] target/xtensa: Avoid tcg_const_i32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 1l5N3ruWgG4a

On Sun, Feb 26, 2023 at 9:48=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All remaining uses are strictly read-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
