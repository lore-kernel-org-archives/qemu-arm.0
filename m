Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp343467ejy;
        Thu, 22 Sep 2022 07:56:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6OFhUtNm8bh638LkWERNFGKKcDzruFsjPbK/IH83cbQYEhtRYYXzYE6efB8yMXoAQrc/Kw
X-Received: by 2002:a05:620a:2702:b0:6ce:40d8:dd3c with SMTP id b2-20020a05620a270200b006ce40d8dd3cmr2375739qkp.277.1663858573037;
        Thu, 22 Sep 2022 07:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663858573; cv=none;
        d=google.com; s=arc-20160816;
        b=ijNVDB5Kg3MAu+D0SB+rgT8lxj+5i16G65Ce+AcBe0f/Mdh7k02vqAM1pXffp3OzSp
         Z1HxTyiFTFqJEIordkTkcWJO9H/4o+EbOH+CzsFFXQF3n7tJsakTS5KRUd4l6czzxKHR
         1W5plP/bfkRoQRXDfp3XCNuufL8x3R1SVgy/U7WRK2DcYqMXEAoV7dQQshvaCjNVs30n
         MeETtSTlZGTZ3A+Rx1PtdUUoKTyxL74LoV9OTplOnHNEBXaW50tgYTUaBfAU9we3jlC0
         9XkWheqjJPv6vZAMiZD3N/68Fv8/orvqo8oRedBrhH6G/U6zLrvbQbQofnGDYmzyDZf/
         AOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZhvFjHz/+hATgwn6t9ulwtztyb1uIglXxu13conz6zI=;
        b=FgWvcC6pAC8CCcLc01OyDa5ryBYInHneq04aNJ28w08HRI1NF712XBPGTwbrkaHIf+
         2R8pYAZUv3tsbnaz6NmRs7BW6A6Ts+BWmc3VGR+yqbkX0DfyDjVpuAr5ZKk6sHqWUmnO
         OCnuD5btmFYWG99vDc8xXuVvf+7v0/XQkXcQv2EV3uLDV1dvcZDDIlUIYgk6Wvg+CfgU
         OPg0XUy5if9WExjBHQq466XaVmhYZFA0Fvs/uGKYyvULWSr0JgdfmbiZxcrTcpGmTkPi
         wfOOhtKlqNPDP3TOU1uMUzOKg1qUdzqMS0WtDoI/LiIeRAwN+S5H7PdA8vObzQDHCok2
         7lVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bHCKSJyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21-20020ac81115000000b0035cdd756233si3006098qtj.39.2022.09.22.07.56.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Sep 2022 07:56:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bHCKSJyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obNca-0006bG-HS
	for alex.bennee@linaro.org; Thu, 22 Sep 2022 10:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMoZ-0001yE-Gg
 for qemu-arm@nongnu.org; Thu, 22 Sep 2022 10:04:31 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMoW-0005fB-T6
 for qemu-arm@nongnu.org; Thu, 22 Sep 2022 10:04:31 -0400
Received: by mail-ej1-x632.google.com with SMTP id a26so21335279ejc.4
 for <qemu-arm@nongnu.org>; Thu, 22 Sep 2022 07:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZhvFjHz/+hATgwn6t9ulwtztyb1uIglXxu13conz6zI=;
 b=bHCKSJyxC5iHYVZOKvIux22U11TYGFKP3yZst3xiAv3dPkYwNvQ0Y1FBrT+Fbt4Ez9
 uhW/9iQeW4u6PGdYhW5/zjYELDT9SNetZE4NXY95nK2Gkbn+aT5RDqkofM8r0+NJz6XV
 RynjqHr1WxC6++zZV9Xm7W4i1yncfKZM0nZCifm+DEOGOAd8pp5psXMAHNav05bW1YvD
 QxAAB+Q5sf/u02VDJkY1SmjJmsMwC/zu6yGocjmVDS8HVlFlTKCctkZ2mGZzVoKEzzl7
 JwB1EurcP19EKoAeE5wybUZXSdwjTVXf7aXwKACD0pHMysPPTEdYH+zAF+qtxrtTrWan
 p2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZhvFjHz/+hATgwn6t9ulwtztyb1uIglXxu13conz6zI=;
 b=Afv2cbpEX7RKlo9w8276FtSZCA9ohNZAQW8lfzqyE/oEPvkC+6CQJUTQDZ7QpfjXT+
 TX/lZkq7cLUkLDL8+/a03iG2E1LkYNN0u6XKi4Va+h1gGm+HET/4oCnET72N+nOksQFR
 yVqGDwoXc8xXGHpAyNXxJY77HmKgqkRlL+TIylrULD4MjC2TxqxKMvAkBmU/11OPF7yg
 X8X8KAh7ZXwiq+Cs9o/mu5dAyhE6Yqin73Do7FqVUPBOaTlq/1ZOGCFjR2qkwMRNmg5q
 gC4LqV9RjMCgHw+j/W1VdSUcTqZhpfn4YsM6k9c02YC5GFHHlvhV2FMCYv0kIPqnLaVZ
 HzTQ==
X-Gm-Message-State: ACrzQf3/TpSaRSfb7v8zohO1MovHbwuEKNYpjna9dIrg0R2WjBafouTS
 CBKPNgiG0kwoBrdo5E44OZc4j6Ba6nNGWCii5K1ebg==
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr2894855ejc.365.1663855465112; Thu, 22
 Sep 2022 07:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-4-richard.henderson@linaro.org>
In-Reply-To: <20220906100528.343244-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 15:04:14 +0100
Message-ID: <CAFEAcA_6+jsQfCvTxxUdmdcisMBSsvzKy_g5pdLq0DZ54VtFSg@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] target/arm: Change gen_*set_pc_im to gen_*update_pc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IjQUWnDTtvgj

On Tue, 6 Sept 2022 at 11:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for TARGET_TB_PCREL, reduce reliance on
> absolute values by passing in pc difference.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



> @@ -263,14 +263,14 @@ static inline int curr_insn_len(DisasContext *s)
>
>  #ifdef TARGET_AARCH64
>  void a64_translate_init(void);
> -void gen_a64_set_pc_im(uint64_t val);
> +void gen_a64_update_pc(DisasContext *s, int diff);

AArch64 addresses are 64-bit, so there's no guarantee the diff
between two of them will fit in an int... We pass pc values around
as uint64_t, so I think we should pass diffs around in int64_t.


thanks
-- PMM
