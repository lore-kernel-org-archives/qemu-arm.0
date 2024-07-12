Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp778625nji;
        Fri, 12 Jul 2024 06:01:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3nH2IoaRCgdIdhiGpTAeZjbwyx14NU8ZQUy2Mgua+KSORklSFzXS2hw/PExjCt0Cja0+MNSw786taE1vOM9fBozjYe/VG
X-Google-Smtp-Source: AGHT+IH9ibIKs+6jqTt33m4l6Ep2qCvUNXl8ceJZZ+yfVxY1XNedLCuqMCdst25u3wtjIBVsjn2P
X-Received: by 2002:a05:6512:3b82:b0:52c:dc0b:42cf with SMTP id 2adb3069b0e04-52eb998fcdcmr7345129e87.9.1720789284679;
        Fri, 12 Jul 2024 06:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720789284; cv=none;
        d=google.com; s=arc-20160816;
        b=Ifh5qAZx1unMdR3xH8TjrfwkGAqD2ciEaHFb81PaPNTUbft/c6F0hymuBn8FOXQ0ZR
         QPWhiSjfMbRX7Mz+ur+pIupxw/IOnyIFVL2IxP/uy8KI8gG8Z2k71wg3xtxgR/QNBOfW
         n9z+TBGe3cc38AQTVs6K+dWIcc5XgdwfaZBxJjed2eY5ioVQxXY5rghk+MKjJVzlLAtA
         qbac5UzsR6iaaKVlyJvETOQN45kCuhYHw4Uv5dYS8M5e0LypAxF1WulYk3V/PWJqZo3x
         YVKMiYdsKC3+TWe8ltn9LMYxgqGK3tNsM04IXutOtenv4woy5VhKMuGyj1U7uFYyr0TY
         eOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XTGrjiuBE8ZAPhvRWlQ8HaI2d2Kh/eTTboY51XDwLU0=;
        fh=7vYQjv0BFqKVjIadaN0BTEOvj7yGxkVjCIf0+hDfJBQ=;
        b=RIwj5o8GpdDaUrWyt9PiXZDla8q/RAUBb7Z4RLl7N30WuFAdArY9e9EHYV9tzd1wb3
         LKn/QEs3ZXwc3ezeEf7NOd2o5otrPa/WJaEvrIYWm0m6waJ80V6QS+E4lp1JQSCdVh9b
         /M7/qu9XzR6FBOn1nk0WJkU9GOa+2eEfD8s9ntyQu09nvDgqcXcwIbm1eQWrLNcolgnh
         0sfvbn8CAd++3xULSIsFWByFTkb1f7/d7uNvzQdab2HE6WlIN2dMTr6qLwrQ58wmFpHX
         DtHX8ENCXuRKzOO0ckbku0qiOv0gkrC0yvp5I5aq0ws+3HgZeoH0NJTkqggXgs0Iclnn
         o7+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LEgBFNrB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-367cdfb0630si5393959f8f.704.2024.07.12.06.01.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2024 06:01:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LEgBFNrB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sSFtg-0005oC-TY; Fri, 12 Jul 2024 09:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFtY-0005K4-US
 for qemu-arm@nongnu.org; Fri, 12 Jul 2024 09:01:05 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFtL-00059t-Iw
 for qemu-arm@nongnu.org; Fri, 12 Jul 2024 09:01:03 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-58b447c519eso2696350a12.3
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2024 06:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720789250; x=1721394050; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XTGrjiuBE8ZAPhvRWlQ8HaI2d2Kh/eTTboY51XDwLU0=;
 b=LEgBFNrB6GBqyRbTJ5Nb6atFXMTQgGAZl+c9YZFMcxFgijWD8CoyKJXS8W3DLr4fTE
 rzuWZ+CqOHNLNylku+wcvdWMV2LrWITEr+bCulo13ZIEjLo4Bbp3N2dvdfvy376mJm00
 nyEnIi/2k0HxtBgtmjFWxpa2v58z36ZNT1zgY6Ko6kz0TFcRXxBpbqYcfqriXmK6s28P
 CG5Qf6FW/AJN7hCHJb7hB1akrLHZKm0pwEaSOOii0Bzq7UfJFZuccDPYORpshDBfteUT
 apZdJvmin8mwQgsTVjx4vKPgZ/bFGaGXSzd2W8HhW+Nyq/CyRS+LgTZ9UvAtyRhAzZn6
 v9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720789250; x=1721394050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XTGrjiuBE8ZAPhvRWlQ8HaI2d2Kh/eTTboY51XDwLU0=;
 b=hGEGE3d+vE5H/ozqPV50SuAyDl+5QJ6/RatQPU5Mug9g/+GNZRJAF8bjRhyBmUkudI
 3v+bURcPn6a7/HgGcBMZoQPZP1BFuzwpeBrWM8YMCneZt0CaYbwR2/Uf8eXpl2IP0G7/
 w4t8yQeCjXUO9oUhOyWfSoOStDxpQLJouPQwj5Y7dfcmSQ6FlRbs/MCLzKzTqZ48vQYq
 PcR2AGCcvcQDk6K2ip2sK7FVeIpXfzXseEQrCOuFbrDmdQ8lI3K4c3dbk74nEfiIHbMs
 g6MFMMlql3JhmySgDCupMXTbTEI/hb3UxM5U4zi9SmO0aYzloJ/sMbreKpmjtC3QrJ12
 edow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy67JY7XAvcqtcWjxACKqCPFK00qDquenk9sCYZTQs0LMFOvXlMSffJrUXnk+TqRd8/z3kqs+uU5NiSAGjFf+OrL8t
X-Gm-Message-State: AOJu0Yz6DJI7RhdlpR3ZLaGUV8USgCxlOG1pOhy75xY3JtxmSXlUx1dI
 7kXr6qlS05u1ADqZuM7KcOzqdDxAqyxmQEww21iY0FjwVBGcpPGfxykQ777zmBmKqGTpqkFDdlD
 NipTBj/+p4EBNU5nZaB85YUDuA3m0HCSLD7rxTA==
X-Received: by 2002:a05:6402:2689:b0:599:8471:be42 with SMTP id
 4fb4d7f45d1cf-5998471beb4mr1814061a12.29.1720789249840; Fri, 12 Jul 2024
 06:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-5-richard.henderson@linaro.org>
In-Reply-To: <20240710032814.104643-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2024 14:00:39 +0100
Message-ID: <CAFEAcA-GCKq_t24zOf_sCtQHE4svtvi67Zr0mrLpo+GV1uWeMA@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] target/arm: Use set/clear_helper_retaddr in SVE
 and SME helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu, 
 max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: 6hpyCpfufDMQ

On Wed, 10 Jul 2024 at 04:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Avoid a race condition with munmap in another thread.
> Use around blocks that exclusively use "host_fn".
> Keep the blocks as small as possible, but without setting
> and clearing for every operation on one page.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sme_helper.c | 16 ++++++++++++++++
>  target/arm/tcg/sve_helper.c | 26 ++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)


> @@ -6093,6 +6101,8 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
>      reg_last = info.reg_off_last[0];
>      host = info.page[0].host;
>
> +    set_helper_retaddr(retaddr);
> +
>      do {
>          uint64_t pg = *(uint64_t *)(vg + (reg_off >> 3));
>          do {
> @@ -6113,6 +6123,8 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
>          } while (reg_off <= reg_last && (reg_off & 63));
>      } while (reg_off <= reg_last);
>
> +    clear_helper_retaddr();
> +
>      /*
>       * MemSingleNF is allowed to fail for any reason.  We have special
>       * code above to handle the first element crossing a page boundary.

There's a "goto do_fault" inside the loop that we've bracketed here with
the set/clear_helper_retaddr() calls -- don't we need to call
clear_helper_retaddr() on that failure path too?

There's a TODO comment at the top of this file:

/*
 * Load contiguous data, first-fault and no-fault.
 *
 * For user-only, one could argue that we should hold the mmap_lock during
 * the operation so that there is no race between page_check_range and the
 * load operation.  However, unmapping pages out from under a running thread
 * is extraordinarily unlikely.  This theoretical race condition also affects
 * linux-user/ in its get_user/put_user macros.
 *
 * TODO: Construct some helpers, written in assembly, that interact with
 * host_signal_handler to produce memory ops which can properly report errors
 * without racing.
 */

Should we update it to note that we make at least some attempt to
handle the pages-unmapped-from-under-a-running-thread situation now?

thanks
-- PMM
