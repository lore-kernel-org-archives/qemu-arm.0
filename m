Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2995582lfy;
        Mon, 17 Aug 2020 08:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYauI32wfxZbU3l2+DA9FecdR6O0psD5NEUCewqeu4x70VnIquJw471xMSFyEmNOHp1cED
X-Received: by 2002:a25:e83:: with SMTP id 125mr22466893ybo.376.1597679463123;
        Mon, 17 Aug 2020 08:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597679463; cv=none;
        d=google.com; s=arc-20160816;
        b=IiNd4VTPGzmnMo9jphGlt4ASZK4exiAp2ejuHr/8FHNgYkVQCG7he247qg8tOebQ8l
         DcsQtjeGGsxghFnDtIiTooab/Xs5Y05rekpMkt62XFXgP5F9eWIG1Cc01aNg09NI9oAt
         IqeReZKSae2WKRxrAKCPRIbua6ugeVztpEaoaw/50M+FM+euuKUwFOZzg2imXLKT9k1x
         fsvuyweiLTJrLBx5FR9KFZfxdzk3cJLWFUNe2IWWBYgoiFc8jDfwMwpdt5AzKrrk8GBy
         ufM7NiE6t2j5heA7VObyf32yTccMt4+p79nYcYH0Vl8yQFJ3EyTQGjYZqZv9sB/1XuYV
         NJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3Wvq81j0f9R19GcAdXH/3hOrbeHJRoRKMKC/d+bI4Ys=;
        b=hb8LDVMiKeceym/RPHaYronW/42IItS00tDaYAINfH5jELj90UrKRSCWIhCoqih0g8
         4d8qKd+yBeMYgvfDGI9rL7PWBOhJ84R+ZscPfJY3D0dvKiUmCfLWtphuDaaCvE1VSqrz
         nRsuEcrxiX8pTIPrpUOEZ69a0KWXrwthhlYydDDzeGhQHkT1vbx9WJVfWsoDUg0NNNlr
         HBgUJrWqV4zYnJePBnOrLjUw0ZgymYDngNWW1yXbU2ibcQcanT65ver14qdUEzZKcY01
         bacm1af1IC0jvUBXAg5eh0Lnp2BSsuJZ2SJRACK5BHk4oFX/5wjdrknpKiyMi/wyJgly
         SGQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ECGsQTkS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e205si17350098yba.338.2020.08.17.08.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 08:51:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ECGsQTkS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7hPa-0000XG-47
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 11:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k7hH2-0007QZ-38
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 11:42:12 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k7hGz-0007ip-4I
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 11:42:11 -0400
Received: by mail-pl1-x643.google.com with SMTP id g15so3815134plj.6
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 08:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3Wvq81j0f9R19GcAdXH/3hOrbeHJRoRKMKC/d+bI4Ys=;
 b=ECGsQTkSkC/OzShAEK0gLwA6gz61YgB1MZNfDEtIMoWkHQ+Fx0n2pnx/fQsYP3rV9/
 FIZW1ZFYx684LFWjJBL/d2ozDN7F7f5Ytxqn5JYV1W77AYhakB4yXroEpw46kWOuFF/8
 Zu5KJmOvDb50uVx8tcsa0PKl7b/xevsZ2TsnnSE6oKCqNS+Gg9F/3OVPhJ0VvUcbNjrz
 sNY2JPy3/k9G3YArZSYjms+BEWj9UyX1DB1NW/ZheYVayUmKVKQ5iZQMKPFK8VIeFibG
 mtdif35+floJZvYRrT4XCkBtZPfbp1ez/rsNdMzTF3cWk/gojxdBhJURmLQcMkCMZpFy
 Dswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Wvq81j0f9R19GcAdXH/3hOrbeHJRoRKMKC/d+bI4Ys=;
 b=PcZCCFLY8Pke0wrEJodFDnVfkzn1VYhNRO0R8z2Q5lyXk3C7/aWpo+bGxrLlpFAGpy
 /vdqXCG12FdWZX/ZK4IcfvyFL4ob1HsrlmrZfawLK+Udy2rHjR5IaC5OxMkBr7VbFpe3
 R61NnTUh1c/mvSATbUXGzHr+PRRiFrr4dEKSTzXzZlg1XstIY16zlurDN4NcPJn3mq+7
 XGE7SgnYKrhgy8LggpQj3x9/x9hGaZe0XLU+boTZUYRSwfr6NOXZf4vPSFrfVun9YpXN
 kXL9+fkwH1fvSFozpxcYAg5InMdv2w8Y6vXByk11heaOBBzSCNRhvvc4+uuy9OF7PkyX
 cLIA==
X-Gm-Message-State: AOAM533Pv81SCpt7OASnF2hkY0ZGZCaSk0dzusoYy80HvJqTa+M3YPSw
 2EPY9tGFuVFpoRSTY6N3kD7oyw==
X-Received: by 2002:a17:90a:cc6:: with SMTP id 6mr13616213pjt.2.1597678927240; 
 Mon, 17 Aug 2020 08:42:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g129sm19909805pfb.33.2020.08.17.08.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 08:42:06 -0700 (PDT)
Subject: Re: [PATCH v1 3/5] target/microblaze: mbar: Add support for
 data-access barriers
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200817140144.373403-1-edgar.iglesias@gmail.com>
 <20200817140144.373403-4-edgar.iglesias@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d4c0d54b-2575-147e-36aa-268628def55a@linaro.org>
Date: Mon, 17 Aug 2020 08:42:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817140144.373403-4-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z1HyqCyQ2jRV

On 8/17/20 7:01 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add support for data-access barriers.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target/microblaze/translate.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
> index c1be76d4c8..c58f334a0f 100644
> --- a/target/microblaze/translate.c
> +++ b/target/microblaze/translate.c
> @@ -1233,6 +1233,11 @@ static void dec_br(DisasContext *dc)
>  
>          LOG_DIS("mbar %d\n", mbar_imm);
>  
> +        /* Data access memory barrier.  */
> +        if ((mbar_imm & 2) == 0) {
> +            tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
> +        }
> +
>          /* mbar IMM & 16 decodes to sleep.  */
>          if (mbar_imm & 16) {
>              TCGv_i32 tmp_hlt = tcg_const_i32(EXCP_HLT);
> 

The patch as written is fine, so
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

However, a couple of other notes for mbar:

(1) mbar_imm & 1 is insn memory barrier.  For ARM, we do:

    /*
     * We need to break the TB after this insn to execute
     * self-modifying code correctly and also to take
     * any pending interrupts immediately.
     */
    gen_goto_tb(s, 0, s->base.pc_next);

(2) mbar_imm & 16 (sleep) should check for user-mode and generate
    an illegal instruction.


r~
