Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4191579ejn;
        Tue, 25 Oct 2022 08:18:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4hDVP6ts3KOHLbq8tSd5gg+xkynFIikIleSsM70oDrJkTyDQurxpf0/1DSKyD4P2lG/zZW
X-Received: by 2002:a05:620a:254f:b0:6bc:5763:de4b with SMTP id s15-20020a05620a254f00b006bc5763de4bmr26242975qko.207.1666711088198;
        Tue, 25 Oct 2022 08:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666711088; cv=none;
        d=google.com; s=arc-20160816;
        b=mf+JnNHaihqCoTsE0EkONC7VjCII/TJCT/9ULqf44aiejPaUKjuhAYgYlXBzXNHylg
         dLYhlGmhzSmzZBhNbs4ns/G8Gt4HYHjoz3DQF7Ariup6NFCAONbbt3PAnRt+Q8lE64yY
         btWelJQixGpj2TzOPdVmCgKVflb3zRoRwUVIgAwVDM9khZ8Jr59SFrJoOe31ZFhbs913
         b1DvJIEqj1QuyltQrZmDsJP6qTswjcyzBBL1GCQFUq65WyvZAdHR/aJ2uF4d4v9BtkNK
         iVVjLYUPYRUfvMHsLg0RFcSUHkErPUSF4U8+YmKViRlsyBSwAJfJpDzUx5CSvQUHjFl6
         L9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=X54gy/PkOpuQgtaG67Z7k5J+ldYKLWmcBLX8O4IPaQE=;
        b=nFIblhp9LZnym38xywqFnWTcXnh20NyvrlNn9cEh+wQUaOvjeY53aNCfhGO0SeDKro
         jDL8HjxgmUOT99iVQTqumTJWzEH0DPHB/r7Yv5gpqEQQF5+NDBh+AFSWYw1vDqv5a81U
         AnXYm/wTLHwAhnmKOtthWtPaIjClsjEVO8C42/LdzYmN3JvakTTjOnyM5rxi5WIkAaqP
         wLEqChWYXJyPNisB7hqAc28hebA++1TUigDnjiQn6QZggN0EHtqXNWUCKTXP9557nnfb
         g55/xnvs6nbmgHF1R0ZJx8MSOF6/KLueSdausRSpAOmoDRKgo5DLOQ/tcLdNX320Aal1
         1uGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eoYQD4Gp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fg17-20020a05622a581100b00392199b9e20si1994470qtb.206.2022.10.25.08.18.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 08:18:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eoYQD4Gp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onLfH-0003UE-Mf; Tue, 25 Oct 2022 11:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onLfC-00032o-3J
 for qemu-arm@nongnu.org; Tue, 25 Oct 2022 11:16:24 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onLf9-00045B-SQ
 for qemu-arm@nongnu.org; Tue, 25 Oct 2022 11:16:21 -0400
Received: by mail-pg1-x529.google.com with SMTP id f193so11803133pgc.0
 for <qemu-arm@nongnu.org>; Tue, 25 Oct 2022 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X54gy/PkOpuQgtaG67Z7k5J+ldYKLWmcBLX8O4IPaQE=;
 b=eoYQD4Gpei3C/2uJoz12AGeIfCGqUGH1GMW8+psalr0x9DgBjBuCVzJc+57T1btzrY
 qTGnZFjOnaUwvpE5js6bbP+y99vEz5D14nuVzlVCsA2DGqBIkOVWP4mt3K5A67f4aBZT
 w9kxVnAaaJgyybPoVFbtfHUoxjUxwHFgDaIFfZIMJNzvCX4dh4rq8W1AVli4tXRFT4lL
 N9T6zahn1cJ11fjY5R5IB3Wq7ql0gggijEBYgpTJQNDN7lkfdBqrQq4c8yM6+NSmJAzs
 KM6GZltrYUaFFx3t50xeBLoUYBgLU7taAEyxN2ju7rDhkMQ7UgqbYT02hEzRXSve3fUw
 CQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X54gy/PkOpuQgtaG67Z7k5J+ldYKLWmcBLX8O4IPaQE=;
 b=xj7k2wmEGkKjdtSpv/aKERtXxVlDRrZlm4IXNb48gx1zRyZ/JWNr58uuCvcOK2tS/I
 8EfYuRLcIzqw8KtWZcnVt6vRWnirsPNUFL72kRpYrKewrmwluA5M6kgzpUJ6Dj3Htie5
 q4kOsnv80UvJyWoNwgkhw/ln1QGvZNdPrjsNrx/DhHvVZRvToIjuFSBY17zLyZde+279
 zAxB4oOzvUd5TVKvt3X/3xTcjQz8ORo39jGXBVJ8eZ22m53Gs7EAhztGpGG+eTJ2n3I8
 2KBqX7L+larBPTP8lCD8KYTWUj9t8TlI/oKIY6HrbWxBE0bS0gAYhj+thvO9gwLDJlYl
 cvwg==
X-Gm-Message-State: ACrzQf1ViZgoy2bp+P2mhAeWSLOUnpQebXtX7+qbpqG0WYVcSrAc/g7g
 Ya339zlvlNQT4dbb+AxUNezrc7rd8Y6BCe0E/lt6jA==
X-Received: by 2002:a05:6a00:b54:b0:566:917:e57e with SMTP id
 p20-20020a056a000b5400b005660917e57emr39096479pfo.26.1666710978077; Tue, 25
 Oct 2022 08:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 16:16:06 +0100
Message-ID: <CAFEAcA9LmEovmfZwt-KMPm4w3BmDLEiz7-VqcNMH_4rxPg18Rg@mail.gmail.com>
Subject: Re: [PATCH v6 00/14] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U7MiRa6RIZaA

On Mon, 24 Oct 2022 at 06:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v6:
>   * Fix rebase error wrt xn bit extract.
>
> Changes for v5:
>   * Rebase, including 12 patches.
>   * Add regime_is_stage2, which I should have done ages ago.
>   * Reorg attribute extraction/merging vs descriptor modifications.
>
> Patches lacking review:
>   02-target-arm-Add-ptw_idx-to-S1Translate.patch
>   11-target-arm-Tidy-merging-of-attributes-from-descri.patch
>   13-target-arm-Implement-FEAT_HAFDBS-dirty-bit-portio.patch

Applied to target-arm.next, thanks.

(I know Alex asked for a comment on one of the patches; I think
we can do that as a follow-up patch.)

-- PMM
