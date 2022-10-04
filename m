Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp308676ocb;
        Tue, 4 Oct 2022 09:40:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6U2bMjVKY2VtvoviZCEwk5wy+8PLf5n4rthkwgdFSGXKolC/tITDcfrYQzm44P5KYrhgdr
X-Received: by 2002:a05:6214:226e:b0:4b1:9e85:86d6 with SMTP id gs14-20020a056214226e00b004b19e8586d6mr5651229qvb.58.1664901643009;
        Tue, 04 Oct 2022 09:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664901643; cv=none;
        d=google.com; s=arc-20160816;
        b=CbqvBrCncjHwwqYPHYCnBpH0hjEss7FOuui8Z2Kq6GLeMZhaz4Nhz0TLSkbOXjowaP
         g77AoUBczvemqjfK34dOnomHoTTNrf4pJNXJIslhPqT138RRm2e4gfIShOm0nzMYMrRp
         Y9tH5wWJNgDoua3NPZmjYK9eTkFphkcdAhrovRmF2QslpQpz2s/6P0v1Q/FqBTSGi8U3
         96KTIXSeeru8UobcFKXFne/2GcPsSbIx2tLDF2K8X04I2wvPZldQIS75B+WQ93musnkK
         Ntb6bSpDTTsZfEVbPo8hk3vCgHd7CRIC+Mi9+vPs4+CvR4QQX18IPZbLKVq7h0AgyXWB
         70CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=P5WaOfNd+tEH2ygQiCJO5JuwshmbaSv7axdCYlmBF8U=;
        b=WhcGzfEbfudcNqa6FSurPhLJ6ahYbVW1jidz+Uf6J8DDnBza1wrKhzmsly16UQkerY
         i4uGGiLeapMy1P20PAAUzYuLdDgvmul97jk+gzGa3eg3Qe1edraq2Tshej/OUkm6EA1M
         dTnkhaijrChCmZidLns6owzt9e9mwdyTt+pQiAYNZKe1QXqAl6eXkN6sy9akHO2sIBpE
         sRYIz6mVbiJKiVpFmjzjV5Y+ahj1Z8dBOzqdQ+Fa7PZcs8g7Q2wknZj6hpHdtFlQl3sw
         89qYGiAcIr0qIkvOZUz8V632sTIN/0+wgeNN3efVXmVmqzC3riDpgflt2UjR3Yh+f/UQ
         mT6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=imZvoDWh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gy6-20020a056214242600b004acacc327e6si1204711qvb.338.2022.10.04.09.40.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 09:40:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=imZvoDWh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofkyI-0003A2-B5
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 12:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofkJD-00039y-Gk
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:58:15 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofkJB-0002VB-5h
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:58:14 -0400
Received: by mail-ej1-x62d.google.com with SMTP id qx23so11760288ejb.11
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 08:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=P5WaOfNd+tEH2ygQiCJO5JuwshmbaSv7axdCYlmBF8U=;
 b=imZvoDWhAm5gMf4UVw/yY+/hScwCbmt/seuGnB0Go9Y9268IhHk5ydgU5BMiHT+8ap
 Oe/9iwhICGeI6K1YP5muzn426wLAcRGNjOgxfwHs1Qwu0iJyEXK7nMhIhPXp6h2cNX86
 XormDOLKKxXsn8zBSKc75NYTRZm9FK+4sSddFC7aCE4X05RmBVcg5KZy+CHJA1UmFCTy
 H5mPDZWH+J/gR6s0fosgqIELQz2PKp9Hah9krHIcBWYfSeZDNVje09UxQSxCwhxp8GzN
 lJ6AHunTOsOV9IO0/Iy70K1F8pIuANSgyaIXnzFju14njgb2tP05wPhxoU+uMI3GdP/b
 zjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=P5WaOfNd+tEH2ygQiCJO5JuwshmbaSv7axdCYlmBF8U=;
 b=dOMdKgPfMFET0tjXlKFhwYfjYMFRGfFsn4nI4iZXPAkxejsrug7xHbEMsrki3UpnGO
 wytEsN75l6ECRFv+t854pSXk5iqK4nQ9Sq+fIhnJGcFHAKENTtKjgVcgolYgb/PFBX7d
 VJM8Icyw/V09vyG8Vz2Cgwc8s3o/XRhjMevkiYvWeiFbey5RROXv4Hbiu0i8Tok3Jg9V
 UYe3r7Fv56KpXEGbFDA42u0LGoXcsdLnFBcoXBJ89OUXAd5sbUWcz8PDyh3dyrkamMLh
 hLDb5kA59Rv/oGEM0OZpWacYpsTgoWNBtqqI2vhtXSzR6MX5aS9lWOwahVQdr1daTf+S
 e9iQ==
X-Gm-Message-State: ACrzQf1P3ca/UsNRZjsKTsGUirgOpTSOwL6uaqkAqpjH1LduJWEyLJIb
 otO/kMcraxRNxBAHLdP9+gntIoYWR3Q6OwDGZjqqdg==
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr19227093ejc.619.1664899091195; Tue, 04
 Oct 2022 08:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-7-richard.henderson@linaro.org>
In-Reply-To: <20220930220312.135327-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 16:58:00 +0100
Message-ID: <CAFEAcA-hH=kqGfPQ3d6wJfo-ti_UvdMAs6pZx6A79QO5Mi-Q=w@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] target/arm: Change gen_jmp* to work on
 displacements
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SZe5k/gm3Gwo

On Fri, 30 Sept 2022 at 23:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)

> @@ -8368,7 +8372,8 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
>      }
>      tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
>      store_cpu_field_constant(!s->thumb, thumb);
> -    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
> +    /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
> +    gen_jmp(s, (read_pc(s) & ~3) - s->pc_curr + a->imm);

Could we just calculate the offset of the jump target instead?
read_pc() returns s->pc_curr + a constant, so the s->pc_curr cancels
out anyway:

  (read_pc(s) & ~3) - s->pc_curr + a->imm
==
    (pc_curr + (s->thumb ? 4 : 8) & ~3) - pc_curr + imm
==  pc_curr - pc_curr_low_bits - pc_curr + 4-or-8 + imm
==  imm + 4-or-8 - low_bits_of_pc

That's then more obviously not dependent on the absolute value
of the PC.

-- PMM
