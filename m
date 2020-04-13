Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3942015lfm;
        Mon, 13 Apr 2020 09:05:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypK1jsXKKSv+oq1DK2FwBLHPDwxXXOTM61aT5ifuLq+ftNXeTbrLPzYF7S2uz67G9mzJN6wG
X-Received: by 2002:ac8:1302:: with SMTP id e2mr11938460qtj.47.1586793905253;
        Mon, 13 Apr 2020 09:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586793905; cv=none;
        d=google.com; s=arc-20160816;
        b=yIQrQ6Y/1JmEROur8rCiZgJtW+sb6vqzTAgKPx0yiR4JOOcdayT4J3sMO+H96njseQ
         l/l2/3cpcZ8+xLqv1wsQnUJ/A3sNdZ9rT6qG7tGOhT87PiiwVz4xVKL6pNWAXwqTXqum
         bNYnKI19Cz06obZMwYk6FIX/U4PtLf+cLHYyddLR8GsnfGzldFUsXEx194T0JwTCHhru
         LC8Sk76lm1oiZgk03hp/n1xK3FlqD0U3a2gp5iuSgxERoldVf3uhB3K4UwFVENAOEFMY
         V41PjXbWMh+HImEw+dDcffyS8+jVatruYpxRX9PWJ6ipHG6FhC4AkXW0Eul4wZ6AVJBR
         s2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yONhBCSNUkWh6rwM7oTIQMVkTPHNbYZwilZ1IfCuB0g=;
        b=Uz8pPdXoqluGFSQIDc/um4nZs11QNDNjvqIN+oeK17zYKbkNSkOBf+GpPOJltyl1p+
         eflqZx8cSPtltlganrzqiag/MbVm8hkXqnqWfRrHYrKpMsAu7ZNrcifmJlO0OPv4AKVJ
         gcjl2cl2RvrbaFs/CQear/aTby/zmx+HNnG4i6m/3QOhgbECo7wMFAltj4LKkNfEusls
         vY/D3EwFkrIdwwlsOKNgE6Ao0sqyP4yjxL7hFB0vw8S5WF9DKJaH+WLti5bnh8fZ1g8D
         hVIUauKXPb/sgl+/7TajlCJtjgs8sGp58ZIQptzi7UsQ/tFdd4be+R0E+peY7udSuLuL
         +PEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ni1+dbQQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si5829082qvv.211.2020.04.13.09.05.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 09:05:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ni1+dbQQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO1a4-0000T2-Kz
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 12:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58247)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1XH-0006GR-1z
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 12:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1XF-0002h0-Rz
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 12:02:10 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:33348)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
 id 1jO1XF-0002ft-LO; Mon, 13 Apr 2020 12:02:09 -0400
Received: by mail-il1-x141.google.com with SMTP id d2so8558403ilc.0;
 Mon, 13 Apr 2020 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yONhBCSNUkWh6rwM7oTIQMVkTPHNbYZwilZ1IfCuB0g=;
 b=ni1+dbQQHLNo6IUk8JzHPS5xHhMXACkakAAV9YLF73gfgq71tETyfkFGiOdSxnMFZ5
 NG8ZDQoSNTC7qnjVr2L4In2Lq2V3qbRdpp5kVNsg36krt1gWBq4JzpFjE1Rg8GuASdgU
 PJd1KlQs49aL4PNnX/8Q/fT71hHp/48H6QXhofb90E5pAR50Ibk+yMK/nU7EQRpqlq1d
 B7pf+n8QvpO5XdtoP+yXMc7wOAEP1/Yz3xOKFHZBU5SianEbrSvMBE3kBjQSQ4w4AqTO
 PxqH5k25l2bK2usMJFilEFEnVVKhQ2XlZRptUnTlMBgx/uZW2TwFQKVFlVOCrXFn5zNk
 7M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yONhBCSNUkWh6rwM7oTIQMVkTPHNbYZwilZ1IfCuB0g=;
 b=lmk0pX5lFoUts1FV6SvpCV5qbNI4+ymHBkLk8vSEzH91h5BhWX590wNcXV6zpTGOl0
 vUk444h+6dvinZQRwx1j4+WC6hY51g+ioL5f9GRwSZpjum4ukojjaEiYc3gIQRhppGN1
 2ZpEPsT3d0tfxBovmE0AbIoo1HwtN73IFJI1Kp7EdvRXPxnxiLnBlD4XXwMgQR2dMaMz
 irHggrY1hGRQeotPsi05TcolrBQAntFDasyJld0zu+fxUQGdvslGnkWMh7jy4Z33TS5Q
 vyUpXRv8tvQjiegRqA9qGUWuwyoJz6avCK6Iwi9Zr7+hJlQ2SF10RzwxmSRKwyc86vzS
 atPQ==
X-Gm-Message-State: AGi0PuYPvXhkYVX+N3d8Xy4ydmD6fsRyg41FyXaBNWuMpVNlD2Qt9iBG
 CKF4TiI4Yn3V+R5WXeOoT1mMgmdAQfVHleO/+f4=
X-Received: by 2002:a05:6e02:68b:: with SMTP id
 o11mr2399410ils.245.1586793728491; 
 Mon, 13 Apr 2020 09:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200326230838.31112-1-richard.henderson@linaro.org>
 <20200326230838.31112-10-richard.henderson@linaro.org>
In-Reply-To: <20200326230838.31112-10-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 13 Apr 2020 18:02:04 +0200
Message-ID: <CABoDooMa1g-x7KhEyrZX9u7vFh3+BLz5T+t8xhB1BZYku3bR_A@mail.gmail.com>
Subject: Re: [PATCH 09/31] target/arm: Implement SVE2 integer pairwise
 arithmetic
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::141
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
X-TUID: u1uMEI7/KUIh

On Fri, Mar 27, 2020 at 12:16 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
[...]
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 5d75aed7b7..d7c181ddb8 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -681,6 +681,73 @@ DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
>  #undef DO_ZPZZ
>  #undef DO_ZPZZ_D
>
> +/*
> + * Three operand expander, operating on element pairs.
> + * If the slot I is even, the elements from from VN {I, I+1}.
> + * If the slot I is odd, the elements from from VM {I-1, I}.
> + */
> +#define DO_ZPZZ_PAIR(NAME, TYPE, H, OP)                                 \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
> +{                                                                       \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                              \
> +    for (i = 0; i < opr_sz; ) {                                         \
> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
> +        do {                                                            \
> +            if (pg & 1) {                                               \
> +                void *p = (i & 1 ? vm : vn);                            \
> +                TYPE nn = *(TYPE *)(p + H(i & ~1));                     \
> +                TYPE mm = *(TYPE *)(p + H(i | 1));                      \
> +                *(TYPE *)(vd + H(i)) = OP(nn, mm);                      \
> +            }                                                           \
> +            i += sizeof(TYPE), pg >>= sizeof(TYPE);                     \
> +        } while (i & 15);                                               \
> +    }                                                                   \
> +}

You should not use 1 as mask but sizeof(TYPE).
A temporary should be used because vd also is a source.

> +/* Similarly, specialized for 64-bit operands.  */
> +#define DO_ZPZZ_PAIR_D(NAME, TYPE, OP)                                  \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
> +{                                                               \
> +    intptr_t i, opr_sz = simd_oprsz(desc) / 8;                  \
> +    TYPE *d = vd, *n = vn, *m = vm;                             \
> +    uint8_t *pg = vg;                                           \
> +    for (i = 0; i < opr_sz; i += 1) {                           \
> +        if (pg[H1(i)] & 1) {                                    \
> +            TYPE *p = (i & 1 ? m : n) + (i & ~1);               \
> +            TYPE nn = p[0], mm = p[1];                          \
> +            d[i] = OP(nn, mm);                                  \
> +        }                                                       \
> +    }                                                           \
> +}

A temporary should be used because vd also is a source.

Laurent
