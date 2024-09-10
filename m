Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1321851njb;
        Tue, 10 Sep 2024 08:30:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlSDWd53m8tSAyFS4vduFQyshGON7pb4XXPRrfCFfA3F+pKQxPQdd6GmanwaXfilChB5nnZxzfMkRJMA==@linaro.org
X-Google-Smtp-Source: AGHT+IHV8LHniG7IVJZdHKUwxz4OQrTeXfvvCKTJq3UqvXnMBozoTL7owAPceP6piw2oka//+v/f
X-Received: by 2002:a05:620a:198e:b0:7a9:a6a7:dc46 with SMTP id af79cd13be357-7a9a6a7dea3mr1458603785a.24.1725982247284;
        Tue, 10 Sep 2024 08:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725982247; cv=none;
        d=google.com; s=arc-20240605;
        b=bPolNpnPEx1u3Js6zgRxiIUIlenuX2lKBm1Oy6Jy6T3zh9QK7xs2hjjW09BvYl48Ow
         Z6GfzAFYfgkj+rOoQu8HVHQWcYJIbNnY32QjbCxK7zzLxPbrPzd7sFHOfW2lZM6yw4jK
         1QPvpw/yVChEiMTIrJHz4ld9/lvPRijcY/maJhRVZydLCHyGWGSxQM7VVMzd8oJ88OQG
         GMZyMGYL0uBK4l8D+ItjKKJ8u1EMu8IRnLo6zfp4YXT7aFr3cQJjb4A0nAfef7KgdhJ0
         E4s32DPvX7o3hzzPor6kv9yr8WAvDXBLRxf+vSaC7lN+NfgiXbsswnJ6Xp9WbkGVx+58
         +pgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eZiT5sRB8qcuaI0eEbpZYCV2Z4lBgbiprzx0pudePSs=;
        fh=p/ilO+hay99bqJ+jcWld6JzCjOcE7PGCio6nrAR5jP8=;
        b=Bg9niWTf1kW4OqW1GTmt/bW4FkiIlxcPxnI1BhJHy/SC1yLaUzZBMHGufukbOv5+dF
         3pjbs/t+GzmlzF3ft+VxB1GLeK12hgnSAneWpfsKx+0eAyhQeuPhV2Jt2f5Lp2vNeIM7
         r6Wuh8xE9KC6rsW/yMUn819D7xEzNaq4dVpwQfvGSRaYaOuZwWgB8ofz7b+B0n6J8B8a
         cZ0vGCpMbC4Y9bPbCJza/e/fhmpgvBFs8E/pdNUjf/lUeL825FXb4j2LpQINXhx+WHE7
         r2FIwNKLzMCNExWGZfs2jgxDgrtX7FsJVmDe2q+Mantje/lX42lXzIUoFwniU6QLe7cB
         OzgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MohHJ5rI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a79c50d4si834861985a.18.2024.09.10.08.30.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2024 08:30:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MohHJ5rI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1so2pB-0003Dn-VS; Tue, 10 Sep 2024 11:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1so2p8-0003CH-Sm
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 11:30:35 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1so2p6-0007UK-9s
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 11:30:34 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c3cdbe4728so5797156a12.2
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2024 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725982230; x=1726587030; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eZiT5sRB8qcuaI0eEbpZYCV2Z4lBgbiprzx0pudePSs=;
 b=MohHJ5rIPTVZNKYf35BGoGyrcR2C1P9VCAhpb807GKut1EO2kwGOVH+XPnSxiBg9Pb
 TszSFmMprziIqKQa0ZWtH1eFzYlt6rfeN89olaydUyrdpA+D6Y1nABcEGwEAP1/5H/et
 EWkMwI3hx9jGkwIluA4dAgx/DEs07TJ+xCs3zcb1kO/XspqyFYvCLQwfsmpWkmRhyV2O
 igC3nR/15H7gWSAYxmV54HZWYDSh1hN99zzeevYLbu4pokENHl9YePwK0GkXvFN69KT7
 pDb+6ywdq7K4V2GTz9eMhpYITD4+4f5+Ts7J0PyTvi41Ney6HkBHXSTlVPVVhgz5jj9k
 i9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725982230; x=1726587030;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eZiT5sRB8qcuaI0eEbpZYCV2Z4lBgbiprzx0pudePSs=;
 b=YlxhO8K59JN1rrxNQQJp5ZjREAzANjk56NYJvphYR0Li4JQiMaSJcrvH3UenVCi9Hu
 gKiFjgFtR3+WroQjw0yg8e7LDwSETdd27UTlJvnRrkGvxz+ku3ngQPa22bbP3yQYuaIL
 vaxQiRSRH/yFkJqMKmPklRDQePUAMGKDHjPAIrGtzcDG5VU6+8N1mk5U5ne1LPzU+4Vn
 Z42zKJFQB9RocN4ft/nwm4hLy6y2qV6Xk21dsVc8izo7uZdnzjyKk5urLGV8FKKI+lDT
 vkMLHcrRdQyfbH6SnXXL2MNV2AIIBGZK35B3sH/4+vnYEvcshVh3y0X4opzmd2hjkkLu
 f1KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyxdylUW/K3O/5Fj9DcBmomMtFgWmW5mmAZiRAPeFNHUj+/zeihUk3+kaAMLgB3SifqvKm50mK3w==@nongnu.org
X-Gm-Message-State: AOJu0YyzSOhoq2wjcVO4aL5ZAcSW9BiaRQVxwPhs8w/ppQBOf/es9zc4
 WSw5oMAv+PsajUBXV7ZYk7VGuCZu7rqcVDycdcCKOEGZo6ahwjmaCU+Vy/PF+if7QTkyNSlxfcm
 fyvVlvV/gVSUgBIIwG2dOhSFM8gFJxnU1Rhh+uA==
X-Received: by 2002:a05:6402:3888:b0:5c0:b793:df4e with SMTP id
 4fb4d7f45d1cf-5c3eac09aa3mr8230358a12.22.1725982230037; Tue, 10 Sep 2024
 08:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240909162240.647173-1-richard.henderson@linaro.org>
In-Reply-To: <20240909162240.647173-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Sep 2024 16:30:18 +0100
Message-ID: <CAFEAcA8hXTAwqhq29Xoo7kkHfdO1OTk7j2uVzDGcyMCdG6HdsA@mail.gmail.com>
Subject: Re: [PATCH v2 00/29] target/arm: AdvSIMD decodetree conversion, part 4
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: zuEoP94h3ju4

On Mon, 9 Sept 2024 at 17:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> First post-9.1 queue flush.
>
> r~
>
> Richard Henderson (29):
>   target/arm: Replace tcg_gen_dupi_vec with constants in gengvec.c
>   target/arm: Replace tcg_gen_dupi_vec with constants in translate-sve.c
>   target/arm: Use cmpsel in gen_ushl_vec
>   target/arm: Use cmpsel in gen_sshl_vec
>   target/arm: Use tcg_gen_extract2_i64 for EXT
>   target/arm: Convert EXT to decodetree
>   target/arm: Convert TBL, TBX to decodetree
>   target/arm: Convert UZP, TRN, ZIP to decodetree
>   target/arm: Simplify do_reduction_op
>   target/arm: Convert ADDV, *ADDLV, *MAXV, *MINV to decodetree
>   target/arm: Convert FMAXNMV, FMINNMV, FMAXV, FMINV to decodetree
>   target/arm: Convert FMOVI (scalar, immediate) to decodetree
>   target/arm: Convert MOVI, FMOV, ORR, BIC (vector immediate) to
>     decodetree
>   target/arm: Introduce gen_gvec_sshr, gen_gvec_ushr
>   target/arm: Fix whitespace near gen_srshr64_i64
>   target/arm: Convert handle_vec_simd_shri to decodetree
>   target/arm: Convert handle_vec_simd_shli to decodetree
>   target/arm: Use {,s}extract in handle_vec_simd_wshli
>   target/arm: Convert SSHLL, USHLL to decodetree
>   target/arm: Push tcg_rnd into handle_shri_with_rndacc
>   target/arm: Split out subroutines of handle_shri_with_rndacc
>   target/arm: Convert SHRN, RSHRN to decodetree
>   target/arm: Convert handle_scalar_simd_shri to decodetree
>   target/arm: Convert handle_scalar_simd_shli to decodetree
>   target/arm: Convert VQSHL, VQSHLU to gvec
>   target/arm: Widen NeonGenNarrowEnvFn return to 64 bits
>   target/arm: Convert SQSHL, UQSHL, SQSHLU (immediate) to decodetree
>   target/arm: Convert vector [US]QSHRN, [US]QRSHRN, SQSHRUN to
>     decodetree
>   target/arm: Convert scalar [US]QSHRN, [US]QRSHRN, SQSHRUN to
>     decodetree

Other than my comments on the NeonGenNarrowEnvFn patch,
series
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
