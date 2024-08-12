Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp817382njh;
        Mon, 12 Aug 2024 08:15:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMrqp5Ug7IQg0MFEPThTlVkapsTqovfBBbdC6TTf++40wcxJ8pG2Exd+Ta5TwqPVDh90syceRT5yKFL3qRgpDwtliOuDoj
X-Google-Smtp-Source: AGHT+IE9iE40NQqgv4GwLPEmgQITvLbbFRdniSF0lopZK80JjSBcyi1UV4sqVN05yD2Kdllys+E+
X-Received: by 2002:a05:6214:568c:b0:6b5:a8b9:e8ab with SMTP id 6a1803df08f44-6bf4f872ffamr5787776d6.49.1723475732461;
        Mon, 12 Aug 2024 08:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723475732; cv=none;
        d=google.com; s=arc-20160816;
        b=NIiVMP22WLC/BjjN93qP5ZlLNpwY2HDxrSYRStwtMcl64uO2puyh9nMpyKFbb25fS1
         slxYmeqJCm8Vzb5j61ADirkz9uzvCA5Zg8W829yG8TbnfcByoRPyVXR7fQtBFykyx1Pi
         jHNXK9dq4ULBsuAhBSSAtf+2abl4IAlGfUYWNpdbjDIDcaSMhZ6Jg+WenZaaPsQgmcY1
         IlJAr0e7hQlmmadzUhl3bP+me7aBkUtDNM29ItK2+Q79j+sXqzPlqZcdn462NiBbb+wi
         WWkj30uGjP9Aiz+zh+MxxzOqu0fsNcaBPBVImMed4ttfhnyJ+yNEJ1MZQmzrUJYPHUvU
         lVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Nn9J60puewudqRteyMm2kWG4TdMdGZoLctn107c2Iqg=;
        fh=Q0+8XOUuT7z9Z89uiS9UET2mAb8zpbkZiPtoq/jHMFM=;
        b=iqNo7n82vZF/H7CumoTteg7yRpwl3EthGuF9fY8N0HIQVHjNi0AcFMWZ5rT2hvmWdD
         zRLkNZjJxpaxVaQ+pXwQfdIgmZh7f/vmSITFL24gUIUqyBbHpL5jK35QsG6CNTP+DVWj
         K+IbCRWnxhojWOunKq8Mc8i+oY5t/+oAkNJ9fIDFLONqJvZZX/MpUfx+9/llBa9RtoyO
         KbTs0A10NsC2C32QRh/jeinCXSYHqGcJzhGqZUPDO73zbRqFnokdM2epzWXslQjM673/
         BH3sSlWsr3T1eIvFAKSVEzE9Xey+olPcUyi7SZQjlN1NED45ehekGFDQiUysYrN/Tvsl
         g7Tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bYtdmhqh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bd82e79cc0si62202716d6.469.2024.08.12.08.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2024 08:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bYtdmhqh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sdWkt-0006wl-4U; Mon, 12 Aug 2024 11:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdWkr-0006qp-PT
 for qemu-arm@nongnu.org; Mon, 12 Aug 2024 11:14:41 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdWkm-0006aA-QZ
 for qemu-arm@nongnu.org; Mon, 12 Aug 2024 11:14:41 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa7bso5307937a12.1
 for <qemu-arm@nongnu.org>; Mon, 12 Aug 2024 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723475673; x=1724080473; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nn9J60puewudqRteyMm2kWG4TdMdGZoLctn107c2Iqg=;
 b=bYtdmhqhxOttTuesY7+jhQYhTF8EVxc7sWRFt5OGl/OklG1PzUsZcQP9oCifTgqnwX
 zO2bP51lQ+BRs8lncBKPLiE2+fvoHhEJoNuOMCoGgQftFa1oyMjpEscZn9kpLsLq/ZuG
 zAzV7VX26ke7BVHxwz0pS0SpyJTpqGyuoeZfA7XMHnxfok8GskkCDA/sfg34VuSjCsDO
 kGYZLAVnj9uh1PFIADBGD8f+HYVNqKwR+L1qqgePve1PMPFI1Tz5kbsW+tiQapXjmwMm
 queiLiVuxQyreoi0fgKT8KVAjSlPgWwm9BZM8k4M+diw7qlKkoLFu5Bf7U+VLsRQqQO4
 QMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723475673; x=1724080473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nn9J60puewudqRteyMm2kWG4TdMdGZoLctn107c2Iqg=;
 b=CDUAxFoxOTSR0YbbzoCTq0F/8KSedqblxUgart3dOXYgXEVMBwngxu5aiXJdDlSFOn
 q6A8RNDbI9wn1TezP4ffJNeObPC1h26Vqm9hVwQoSNn59kiG4Cq6CJqixK9lJCyfKnPF
 rqnW3+YRSZLGbq7QhLgnRT44wvQiGLgwsKlXwiPo3Oqlz5pozzdUeBwl+MMmB21+HaTh
 bl2K2V4hsU8SPFH/JOiep1dOrhWmjwlwKxKuuxzeS6XVaPBOiBkK7s1ow9fuVJgzgL2L
 dIeXhOAIz+cR5KCv5ovfH2LoIzrJXvbmK1Y6HbbqQ0sVL2Utly342h8gjtQpjbUBUvOS
 kHIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtRw1DZikv8zBnWgCdbY28xUHd946lFDC3yDr3TcxB7OWIdQ7TElhsJL9lNOV935NS/Q9EHcCatE+1BqMsGvqWM7Ad
X-Gm-Message-State: AOJu0YxRcUdPGhRbXgCn7Y5+rHinw9SxUzbxTvyVwsyt/DJR8Z3fDNPs
 ryYz4XWSQO8pxIJHWulSTJAVLKQS4Phl5KbNBlC24SgRqTixUKdvO7wKayhi9LZFqzwVjNzIZBi
 +CftAyT6ReDCQKBV9p6v+uHRzfM1rFF6D+rQKUQ==
X-Received: by 2002:a05:6402:354a:b0:5a3:b866:eae0 with SMTP id
 4fb4d7f45d1cf-5bd44c7c314mr487154a12.32.1723475673220; Mon, 12 Aug 2024
 08:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240717060903.205098-1-richard.henderson@linaro.org>
In-Reply-To: <20240717060903.205098-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Aug 2024 16:14:21 +0100
Message-ID: <CAFEAcA8vJxUUHWA_nUF-810fDhYyPggtc=HGFdp0QUa5segB=A@mail.gmail.com>
Subject: Re: [PATCH 00/17] target/arm: AdvSIMD decodetree conversion, part 4
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: iUrMoTJ9xSia

On Wed, 17 Jul 2024 at 07:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Flush before the queue gets too big.
> Also, there's a bug fix in patch 14.
>
> r~
>
> Richard Henderson (17):
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
>   target/arm: Convet handle_vec_simd_shli to decodetree
>   target/arm: Clear high SVE elements in handle_vec_simd_wshli
>   target/arm: Use {,s}extract in handle_vec_simd_wshli
>   target/arm: Convert SSHLL, USHLL to decodetree
>   target/arm: Push tcg_rnd into handle_shri_with_rndacc

Other than the need-to-avoid-shift-by-negative nits in
patches 12 and 13, whole series

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
