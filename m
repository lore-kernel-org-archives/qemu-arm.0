Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4879839lfa;
        Tue, 8 Jun 2021 16:18:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5TdR2trXzEW9sEgGpZAZXTayVwnGuRbMwmDHSThg8o9ieMXztNADY8KVnvl7RHTRHJPWl
X-Received: by 2002:a67:eb85:: with SMTP id e5mr2779692vso.16.1623194282843;
        Tue, 08 Jun 2021 16:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623194282; cv=none;
        d=google.com; s=arc-20160816;
        b=nZYBJRCkRyER46B+C7ADJxNxUbLRSPYNwz/ZDKuHspUdIIGi5yfw4ZWBBDGhrU11+a
         4GkxOhhXPYo165w4++1RAuSDTpX8cjDCh71oau26Yzy60Mr1HGmJn5uXRuKwtaLNXEU7
         SZPCI/7F3Qjtb5AC0lXvbOl4NTVfiKgfulR9pi4SkOqf+mdVVCFbx29TSlxDHldAgnmG
         clV+YGEAY2iDoGtoFgTBOkVn/lWWyMv1RB1o0KKWzdXxTghRcup4IwIBtiwM7CaSHm7P
         DlZAbHOWOlDC8BQy48vK3XEzkt8MM0dpK5/aiExNm/gTHd2aiTQYqVMwr5w8W6pCp6Fq
         kGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FnYJ60sf+0xJfBB1ibGaMnKtWPvCeO3YlVmOb3AOEXs=;
        b=cPKlDI1VoL9cP/QielsSjU+JPnp8ZMMlacZM5XbYzJ3291ZQamToNQzbj89zOYru7f
         vpT14d4wondKg1ox28q3umcyJMzbTPBMVK687fglfStQ4ZO7U60RDmx5Xntiahphpzhx
         w4oP58otXopQwgmdFedOviOce154TPZT8QIm05+5KYEY8HWLcLKuxM6NWVFO5mn/MKn0
         sLrD1nurq5uEkTy4hcJlon8I9PnjT1A9YTIFFO1fjAQyzvanVNSoO83f5QVlgv61+3+7
         O+UpG2GF/cw7Z/arG9v4GtRZ71c6seB+A2eToZ50bNJskNXgOF193013TVBJslNbVpvG
         7SJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ADPEuyG+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si7288035vsh.41.2021.06.08.16.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 16:18:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ADPEuyG+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqkyw-0003lI-6W
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 19:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkyn-0003ki-RU
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:17:53 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkym-0002aT-AB
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:17:53 -0400
Received: by mail-pf1-x42f.google.com with SMTP id h12so14082705pfe.2
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 16:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FnYJ60sf+0xJfBB1ibGaMnKtWPvCeO3YlVmOb3AOEXs=;
 b=ADPEuyG+MTY54YbCIyU3Vf6kMBzIz/MrdgrdYGxNtv0NZwUiM8QCvBfMB0ee1k86ad
 CBqs5Cqmlb1UBrEPY1FOB+1d8B3+dFCdvm14RAuzfc473GlfnBVYGukUAmC1KhOsI+P3
 egNFP3HwC5lUKjSTqc6HkARxaOJVIFH2MKHGOT89Jh1CTydEjJHmCq+v9AwEc0yaCG00
 rBdDyx3oHhfeGrXT1zivvT0Y8ZDUYuT4Z4s6fwW4k13JfvdTnL2KAuIuusPNIH7lhSH4
 rnvJaGZfYjOs/gNzki9yhirjeM1q0Y6xk16eo3pdvHIbtYx3olOXLT9c19KJify+dAND
 UqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FnYJ60sf+0xJfBB1ibGaMnKtWPvCeO3YlVmOb3AOEXs=;
 b=R9ceFZLD8whXeLvw5IBUaqHdLUWri7rvxvt/no29Qz/sL+lQyyDZeFsPCPQtaFpTV5
 MbFJCIU1lq1xesybryTfoHFPfWKLPmGU2YACWAD2ZwhwnSx4BXdEleJ/1MHRYVbHD2EZ
 Z5+Mb40VKAv3E/D2BJTC8ncpVRS+z+rFeUggOiVfMMlrmgu0nAIRGaU/mbIFqoEGGpow
 CU2XjZUOMkMkhx52FaacPZE4dnj4NFgpQgFMlYWk8yuYQvCRkaRSpbay2M/lMBNipYUR
 uYNwjseq3wK2up/VIel5/QiDRweSkZuKxhqLHwJxG4zG5aglFcU0q1CgRV64/xgRWdzG
 9N5g==
X-Gm-Message-State: AOAM531NCF755AVa9aS72gG8C5u2jznqp5LhAwuItxXsVi9syN12/wdS
 AK+uBXDoqXAwISOxCZKrvbhelw==
X-Received: by 2002:a63:1210:: with SMTP id h16mr648673pgl.189.1623194270572; 
 Tue, 08 Jun 2021 16:17:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o7sm12912688pgs.45.2021.06.08.16.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:17:50 -0700 (PDT)
Subject: Re: [PATCH 20/55] target/arm: Implement MVE VDUP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31d446dd-d17e-e036-7e66-fd7291827d9e@linaro.org>
Date: Tue, 8 Jun 2021 16:17:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MhJBAawIMUsE

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +#define DO_VDUP(OP, ESIZE, TYPE, H)                                     \
> +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t val)     \
> +    {                                                                   \
> +        TYPE *d = vd;                                                   \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned e;                                                     \
> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
> +            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
> +            d[H(e)] &= ~bytemask;                                       \
> +            d[H(e)] |= (val & bytemask);                                \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +    }
> +
> +DO_VDUP(vdupb, 1, uint8_t, H1)
> +DO_VDUP(vduph, 2, uint16_t, H2)
> +DO_VDUP(vdupw, 4, uint32_t, H4)

Hmm.  I think the masking should be done at either uint32_t or uint64_t.  Doing 
it byte-by-byte is wasteful.

Whether you want to do the replication in tcg (I can export gen_dup_i32 from 
tcg-op-gvec.c) and have one helper, or do the replication here e.g.

static void do_vdup(CPUARMState *env, void *vd, uint64_t val);
void helper(mve_vdupb)(CPUARMState *env, void *vd, uint32_t val)
{
     do_vdup(env, vd, dup_const(MO_8, val));
}


r~
