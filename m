Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3956446lfm;
        Mon, 13 Apr 2020 09:19:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypKYaL9QI/A9T3+sNvA78NrJKV576vtl8Km4tPnfRlLTKnVuiswjDAwQytV20YoMiI6RRCM6
X-Received: by 2002:ac8:f23:: with SMTP id e32mr12134052qtk.368.1586794748144;
        Mon, 13 Apr 2020 09:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586794748; cv=none;
        d=google.com; s=arc-20160816;
        b=vA1Ec/bG39Y6ahn/ZVGDdjT2pV15+4HT4lh2BO8cALr4YSTjQ36CtVwuIfuh1oqEhf
         jmBc//1V4qZ1tq6UsX3hF5WnGbf7c2rqSDk1F/Lipg9ZjtmHkUQj7PeTIwnJ4YEgQfoR
         Emzc6tURWBnJegCqdmEQ2tPFIwkZkrqXZOMMa8av2+BcUPAvwr36ja3E8QaTAAG67YWk
         g7gv9MUkqNSDheqTTTjuNt10n0ZT+pG6p4RofAAat3j/xFdV3YBdwiJudcP7bcIvR/gH
         Ys/M7y3Y6RXcaCe0L35PDtgdzqKENcgDsqx5CxTOF5VP1z/eaAE6H+OVHrraQDFxT1Az
         Siww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mzPHCw6k3Pu8SILTY74WR97yZG/8zldYlE/UmI9Oxfw=;
        b=coVsgxiM5r7F1CPO+Nq1otidVEH+TichQmydeRX2KoTxcoXIEzYlbJ6a/F4PixswIF
         O4GLjZr61eZdFAa+eKvpLgTH1vE3Mrj6nLfF0V8g7e/ubozWu2a912S632zpu7dMQXbS
         y+XMS0YrGhlR6+UVMJQX6srluHnvfL7L31rb844hnjm/FC0lyxSKpQBM4VLPcV5wB9Zk
         2bs9wMOMZ/QHLBr6VLPB1lYOWY/ofOX5iP9p6Z4hWVl7+0JkW4sb66BLb2goN/groous
         BK9aezC+EW1aOOEsh2kYDcICGSrAlGb2fs8NBMopyACle9T2N7uYXlHomAiaEaaZjdSf
         qfBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BxSh0R4y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17si5964974qvh.27.2020.04.13.09.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 09:19:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BxSh0R4y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO1nf-0002YK-Km
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 12:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60565)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1nG-0002X7-Is
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 12:18:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1n2-0000jG-8Z
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 12:18:33 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:40278)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
 id 1jO1n2-0000ia-0i; Mon, 13 Apr 2020 12:18:28 -0400
Received: by mail-io1-xd44.google.com with SMTP id w1so9885768iot.7;
 Mon, 13 Apr 2020 09:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mzPHCw6k3Pu8SILTY74WR97yZG/8zldYlE/UmI9Oxfw=;
 b=BxSh0R4ypxaasNyCRZSHTvLhTLpjwkOWU6zR2afdxlsp9H8sATX2DEFIHIphpjPVJd
 1isTPCAYW9/N46CnT7bQovV4W/Z9DzViiJQRPwUQ1Lx7Wd4vANHuHxcZYM6EMHj3842T
 D3CpLNcsFvDb9E5M90AAKy9/Q1BrHIF6w+UZOmGgyiOKbmgbnAOqv8+Cw9MNVAR5Kgb5
 lr8T3SQK/D5YOEYjFHyRab5N9I0tMt+sjcT4KbfMlbEZbOlwY8xSyM4FlMTjpHPyZN5t
 zT0WL8iY/St82s0/QfabhbAt2qUuih3UjCenFdtoGkf9+7i00oRBnpc0fH/zg9KwYIXp
 ZXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mzPHCw6k3Pu8SILTY74WR97yZG/8zldYlE/UmI9Oxfw=;
 b=P5FMGnUmFe7luvJ2S0rdG6U53uoqKmRrBGpHdi//34Uje0N+yuo2HNwUJh2D3cKUSK
 R4JHPt6dWGYydM4ftQuwbgVkmD7TPI1G+DHHP9xBw3PZZxKCx/R3B3pjoCH+C/BFgeao
 +6JPKwsdTbUYHCUCaPTXy6HNIAqutwiL5Uu8XpGGAa4sXJK1FKmcSfyq5oRrjYTQGSET
 rWKcyeG7PYwu8UUVBuCjwcRzzqzOqYoQDYG2mRyqMpHX+LRqyoY8ujKzqU0BTjxao7EP
 k1M7yAY0jMqhLN0731g+8CU11UMSwAPUtjwCuBA7epAcxWygV0h3kLlUC+Od26GgPwI+
 k3hA==
X-Gm-Message-State: AGi0PuZKxnm116HaycR5aD2apmJrnMpewaLRqkoy51rmFv5Qe1MKgfCR
 NdBOqogdSxiS2wMD2mtltTtUv+ZTv3arqpM7tUgb1fN1IHE=
X-Received: by 2002:a6b:148:: with SMTP id 69mr16744386iob.189.1586794707213; 
 Mon, 13 Apr 2020 09:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200326230838.31112-1-richard.henderson@linaro.org>
 <20200326230838.31112-23-richard.henderson@linaro.org>
In-Reply-To: <20200326230838.31112-23-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 13 Apr 2020 18:18:23 +0200
Message-ID: <CABoDooN62TE-g69wZSz8ky9NOdEgRJS7FiH9q+Q5auwL-464MA@mail.gmail.com>
Subject: Re: [PATCH 22/31] target/arm: Implement SVE2 integer add/subtract
 long with carry
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: rajav@quicinc.com, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, apazos@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mjMSufk80sKl

On Fri, Mar 27, 2020 at 12:17 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
[...]
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index a0995d95c7..aa330f75c3 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
[...]
> +void HELPER(sve2_adcl_d)(void *vd, void *va, void *vn, void *vm, uint32_t desc)
> +{
> +    intptr_t i, opr_sz = simd_oprsz(desc);
> +    int sel = extract32(desc, SIMD_DATA_SHIFT, 1) * 32;
> +    uint64_t inv = -(uint64_t)extract32(desc, SIMD_DATA_SHIFT + 1, 1);
> +    uint64_t *d = vd, *a = va, *n = vn, *m = vm;
> +
> +    for (i = 0; i < opr_sz / 8; i += 2) {
> +        Int128 e1 = int128_make64(a[i]);
> +        Int128 e2 = int128_make64(n[i + sel] ^ inv);
> +        Int128 c = int128_make64(m[i + 1] & 1);
> +        Int128 r = int128_add(int128_add(e1, e2), c);
> +        d[i + 0] = int128_getlo(r);
> +        d[i + 1] = int128_gethi(r);
> +    }
> +}

sel should not be multiplied by 32.

Laurent
