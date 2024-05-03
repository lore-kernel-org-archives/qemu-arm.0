Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp2042226ejy;
        Fri, 3 May 2024 09:43:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJTkQj1jtoFxKVHhGfLFCDCEMexQfRYJ7AwnNvDi7jT3iNLj9O35eWz29433yyMRXlSJiLQxN/tQjModyLPqsBnaLmYIM8
X-Google-Smtp-Source: AGHT+IEwVNjmJ2Rlx3Cv/eoDL2sUZ4WQP8ruwVZ3CRKQSLDBycy7lIioVL+aymcYbwyhtbMXvko3
X-Received: by 2002:a05:6214:b6c:b0:6a0:6649:c7f3 with SMTP id ey12-20020a0562140b6c00b006a06649c7f3mr3993609qvb.41.1714754625675;
        Fri, 03 May 2024 09:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714754625; cv=none;
        d=google.com; s=arc-20160816;
        b=XbVeDsvejhvCkQHYLqFvgK32FuWXbniwM1Q7NOFmBeptHhRf0dHloc8DDAwC/ymQ6q
         RlSKBZjh5X/U9TcCLWYJHPyVAlEwvQwPlzymoLruCiiEjIJptPZ3p7l+5cQsn0ayHJaq
         C4PEMoG6IN+NINvL3vo15+Op37+ryh3p4AkZ5N3L+MFHmM2ZJr9EXz9K1GnRFratP5sR
         LKUf6ffHOJRYrbx5tvV8Ryb7k2I7jrbrqj+yQ8caNb0Cxvc+7KV1VxQkJxq4gAIcIuI1
         FnfIWo++adcRDfTYOHAvqophxyM8SFPU8Khn898g/qVDhwKXRN/8nUPlbihAZoICsixa
         ecTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3WWLttr9pnULFJtUH4DU4U1k2k3jxKRdOUSZYqWhRAc=;
        fh=c4YPpVtoS0quFP0qikrSPKgQ/BetmpTT4fwgkN7Tqwo=;
        b=e7/t00GMkp6kjBfOWImwXen0If3HPi4qlEK4QnsLv2QTkuYpz2gZwsN0K8UelVUjXs
         XoQk7opIWfDJQcGJK/3IRUlx7GuFmQoAgJzQQUlQuDwVePxHPMkJPwLgEHK8wRKqYoaY
         FI2fQsAi3EqnhxtdzDe+o5gQbNoMayNJ9qMprbuvNpeWMHOIH4HdX5B+UQGXcvIJUYX6
         2WfnzJvnBxq8uIgc76RBuHR39Cm5drvbPZjPEnQ+c3jN2pG9bIPJZHF2M1nxpxdT4X5W
         YIr9pnBO0+V0I7vpzoYtugr9HX9TpNBXG+q8d89yAb5CUopXfVdd87k8Ri65Sc6PGqzO
         9K/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kVspxob7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk12-20020ad45d4c000000b006a0d631e3a6si3790720qvb.424.2024.05.03.09.43.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2024 09:43:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kVspxob7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2w0Y-0001FX-Qx; Fri, 03 May 2024 12:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s2w0X-0001Ev-NM
 for qemu-arm@nongnu.org; Fri, 03 May 2024 12:43:37 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s2w0W-0007t4-0Q
 for qemu-arm@nongnu.org; Fri, 03 May 2024 12:43:37 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a599eedc8eeso76026666b.1
 for <qemu-arm@nongnu.org>; Fri, 03 May 2024 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714754613; x=1715359413; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3WWLttr9pnULFJtUH4DU4U1k2k3jxKRdOUSZYqWhRAc=;
 b=kVspxob70rO0YEGf4P8lDMFhmSQT5VHO2oxgT/rC6IokwTLVMEiaP1Xv5jlZ6yTm1J
 s1mKMq6okMWgS/AfyCa6Q7P66bxJk1E4/cVFzDKK4WOAqbbAyrL+/02MMZb/VT+daKTP
 HXrdlY8yR+bbygQHeuXpgUv1j8wM6nIrSJw4yjBxgRdDxJUkcI4O4dY2ygiVsho3YFpG
 RmlcttJDl/Z0ShK15Bc5HRV4gOph7ZCF9COXEDiO8dIiSIoRjy4N4nUsnPPWyli11ZXr
 E5xn4Z4DsGazBMPJea8tQLlBN1jHM9fWDfdlGjIu0DUkOH0rAX/gp0Th1yOrHXZtI5lF
 wSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714754613; x=1715359413;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3WWLttr9pnULFJtUH4DU4U1k2k3jxKRdOUSZYqWhRAc=;
 b=HG+BvJVC+IyxdzDL+k8UZthqgv7Nc3rPBFgr0M5MLBV+IhU41M2SJMHpR/ORjYc18A
 PSv7X0pIzGQi5y9DbEQeOtwqSwBNxYAMm7+2CmfvxeauPEnGY2+M62MOSfpvRYsv6nsf
 lif6Phrpr1TAAhV3sivGWiiDA7iLRnR5+m6knAbk5PDdUQ8Ewn7FP+yADZpgPnI99rcm
 XYx2YAj50fsPdP/xtyDjwjYJZxf66xdHNorJL4NL6trIQMkiP6v7MPYdH0JIMh3mKIHi
 JYepJbTHjHshVbak1NQ1Mmze+sJqGlQ7HTCuDs/U2OSWKHBKbZt93sc9NSofrqDtb2UM
 KN6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUihatpTJePFHJyY7+oVKp/mBmmqUUobC+DKnYkSvpYIKtiMSjunpvQ7HyhBK0q1CHKy6FJAGd/0zHh0s/YHMRZUjF8
X-Gm-Message-State: AOJu0Yzn3swExAY5mS/QoOE/cTVtgbbWZfv6G1g9j5R1ESbGqsA5vPAc
 Fhy0EPkeTQHFkJm4TpcJ6katHYL1uPRCy/DigygsjA/7YElZkw26C/tJ3VqKOB6VcjgP9uszdLy
 fBXzdLkF+UeboGKDiN6cwMEum3eEkd83zj3/15w==
X-Received: by 2002:a50:9b53:0:b0:572:a711:3daf with SMTP id
 a19-20020a509b53000000b00572a7113dafmr1914763edj.40.1714754613517; Fri, 03
 May 2024 09:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <87y18u3hjf.fsf@draig.linaro.org>
 <20240502141628.28103-1-adiupina@astralinux.ru>
In-Reply-To: <20240502141628.28103-1-adiupina@astralinux.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2024 17:43:22 +0100
Message-ID: <CAFEAcA-jce+fdPeMM4r5148ywxZE-SO1kcub8QaL42WcbafJdA@mail.gmail.com>
Subject: Re: [PATCH v5] xlnx_dpdma: fix descriptor endianness bug
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Alistair Francis <alistair@alistair23.me>, "Konrad,
 Frederic" <Frederic.Konrad@amd.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: IF++rOWBtMVm

On Thu, 2 May 2024 at 15:16, Alexandra Diupina <adiupina@astralinux.ru> wrote:
>
> Add xlnx_dpdma_read_descriptor() and
> xlnx_dpdma_write_descriptor() functions.
> xlnx_dpdma_read_descriptor() combines reading a
> descriptor from desc_addr by calling dma_memory_read()
> and swapping the desc fields from guest memory order
> to host memory order. xlnx_dpdma_write_descriptor()
> performs similar actions when writing a descriptor.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: d3c6369a96 ("introduce xlnx-dpdma")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>

> @@ -755,8 +811,10 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
>              /* The descriptor need to be updated when it's completed. */
>              DPRINTF("update the descriptor with the done flag set.\n");
>              xlnx_dpdma_desc_set_done(&desc);
> -            dma_memory_write(&address_space_memory, desc_addr, &desc,
> -                             sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED);
> +            if (xlnx_dpdma_write_descriptor(desc_addr, &desc)) {
> +                DPRINTF("Can't write the descriptor.\n");
> +                break;
> +            }

This "break" introduces a behaviour change, so if we want it
it should not be in this patch, which is supposed to just
be fixing the endianness bug. (If we want to try to do the
right thing on write errors here we need to check the device
datasheet to see what it says about the hardware behaviour in
that situation.)

I dropped the "break" line and have queued this to target-arm.next.

thanks
-- PMM
