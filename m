Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp590330ejb;
        Sat, 21 Oct 2023 19:26:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVitdSar4Fdl7mQpWnaOrz32C+fHLlnmYk+1yjp8VaRSnxTHwsBITTv7SRsIHhLmoQmBNm
X-Received: by 2002:a05:620a:2a07:b0:779:ceec:e29d with SMTP id o7-20020a05620a2a0700b00779ceece29dmr1376573qkp.42.1697941562146;
        Sat, 21 Oct 2023 19:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697941562; cv=none;
        d=google.com; s=arc-20160816;
        b=MzvkrBQbiWJGUu5ACbOIp90gPpSeBzlEzNZ86FKDoSgJRhh9kJ39VIpd3Ola/FOeG0
         mV5mKiCtb9JoghIsCl/avz+HgaoXTPIVqtSTiLi131IChIWrIpK7j5N5dXeHS5Uu4dkV
         o6eVRRDdMjekBQ5zsr0FRFy6uR23UTlX9BYUkBGWMbhkumffNXvk/LUKT45Girp+vR8Y
         xciCVxPRqazmV8+UK7HVJ0dGzA1QLtBOl0WU25Tfm7C+pEHJX+9BxDqDVwi1uQhLgBI3
         1LflkZUIZcNMEAT12j/RAXEFeVr5PbMyVKrGC26N/nNj/nYrEmi2D2CV1ZvVb/J/godq
         afdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7EnvQcTit6Z3SECuwhi7grFC3nAR3AHsH8AZxsNdtoI=;
        fh=327OUnfDrs+t/cu0gT/N6Vevy316GkdLIJMxeyLvFG4=;
        b=Ypv0DJ/AA2sM0zFKZR55RtvC+0HnioqkzQFrmskGi/t2HMqs1wsnkd8M5KY6q6HgRK
         X9RD2MDCIcbJ5ZiCci+pawShhTxOJ8zGYBT5+7m2ZDt0TeD8VowKjmUKOFevVHOcmw8L
         T6BNZO5F1FJb+jeIZgMrURB/52qIAdK/h5AAHpmqn/Oa/5Fww7pJvxiDyKNZlHTLE6LX
         Z4ZIYP/mTfY0pZEzf67/zELQaKRn8F7RS6w0gmdsgUv/b3+NqHpSzGC/PK1r6CyfrZVZ
         LdMywVGxAq2MY2YdNCWcSbnHV0u0EFuDWFnGri70OWI7I1hlvH0ThQg4ViDVyxqziZZ4
         qR2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fi8wS3n1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21-20020a05620a22f500b00773d18bea8fsi3379442qki.47.2023.10.21.19.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Oct 2023 19:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fi8wS3n1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quO9f-0000Pm-5n; Sat, 21 Oct 2023 22:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1quO9a-0000Oy-7u; Sat, 21 Oct 2023 22:25:22 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1quO9Y-0004Px-PG; Sat, 21 Oct 2023 22:25:21 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-578b407045bso1601388a12.0; 
 Sat, 21 Oct 2023 19:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697941517; x=1698546317; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7EnvQcTit6Z3SECuwhi7grFC3nAR3AHsH8AZxsNdtoI=;
 b=fi8wS3n1k2USHCvqxg1wQnnZWqXlGCH0mih/v8xMRNI0h6T8ouG3KI1XjXTuj21vhP
 fJORdoDf3SZFToXdXMCmLA3vERJsaut0dEa7PpZEu1tWcVZSuVy/pQtLahX4wLKClv7M
 dfMskvyqjwa/8diuCWnmmpXG394SkpvKcqq+Bh4xPYLKottg6M/ffiiZPifj5+hnrwSX
 SY7m6AiVzqvdmY30Cwa3+LtErG1xK9XW6hc+oK5pAFgyGWAQSaIxSuMeKB3tjZgbLio5
 nzzzqgNCAy5a3A4LVxA+ZtLAdwjjTEIEJw+5x+gkMXTlmQKfZSquehB8eW2TUQRyklsi
 5Pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697941517; x=1698546317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7EnvQcTit6Z3SECuwhi7grFC3nAR3AHsH8AZxsNdtoI=;
 b=Cp2VbS+6zKAJbleNK9ckZevgphuU7+AAgcCWIWTY2Zi9qI5wdgnCFLP2t8B4bp/NyL
 tQur3D9vocqx8R75dTG+2fgVNo1ER26mFqVrcHT3/Wc2+PQNqCKVunJhi6xoQXGD6521
 GubdDc17ePP1QMbopyZCqIAkHw7B2F64qiqOEZcGf2hTmCjIK85nopzadHevLdPghi8z
 pKgQpZrGDItpNwYVnOFLLDrV6MT8FUUUTmhuA/NahwwCPpwfz5oI8rrWnq4yhUM47/cb
 9OldaCnepKBcBF6lGDzYWE/PIj/nJyy2DuwT5v/uf90QT8Eg7uAm8UqhTIYGrUNYiX0K
 +idQ==
X-Gm-Message-State: AOJu0Yy7BGKvbOJ67GkkRajnseo8948wnhuIoUuTo4YnfOvMjIesoT4F
 KwTUxsPpuozaz1NVpzoDw4xpmYX9Zvyq+BS4oLQ=
X-Received: by 2002:a05:6a20:261b:b0:17a:e32d:242d with SMTP id
 i27-20020a056a20261b00b0017ae32d242dmr4798327pze.35.1697941517424; Sat, 21
 Oct 2023 19:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231019182921.1772928-1-richard.henderson@linaro.org>
 <20231019182921.1772928-8-richard.henderson@linaro.org>
In-Reply-To: <20231019182921.1772928-8-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 21 Oct 2023 19:25:06 -0700
Message-ID: <CAMo8BfKZ+dYBWuDAOY1n415VMDeNpwsGN5AymR76btT6aK7uUA@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/xtensa: Use tcg_gen_sextract_i32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, qemu-arm@nongnu.org, 
 laurent@vivier.eu, ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1,
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
X-TUID: SVArAmFExhfg

On Thu, Oct 19, 2023 at 11:29=E2=80=AFAM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
