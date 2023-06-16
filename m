Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp1409601ejt;
        Fri, 16 Jun 2023 07:01:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Yc+D9F16+IShB6aUjGSR0IKyJNiRaMYQ3y1zMN7WZE7/hC3EO8xzF+o45+ZEsUG1H2efu
X-Received: by 2002:a05:620a:f91:b0:75d:50fa:4fb8 with SMTP id b17-20020a05620a0f9100b0075d50fa4fb8mr1752897qkn.17.1686924100616;
        Fri, 16 Jun 2023 07:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686924100; cv=none;
        d=google.com; s=arc-20160816;
        b=rc16WiA7PGNC9pzNerBqU72/qCi1Rjyj9wy407bin1ZvTqWPrIhMmGx6TGeNQey4Wd
         EbKET0VPx2Rptjk4PrkKqx9ue//lvLZsITS0ehr34UZGDVNPUwUA7L3rr4GIBT8x7NKf
         zgH2y4BR2yaBGQNHm8UyT57NV4eRf7SIkoCW2ORbbXI/WA1B68j664bf799CTvk8Kc5b
         0NuOgtDRjmshROCKAFrtazqXbk46yKA9BSmD6lFDqXWOC861iiiDjmm5iG1USja1b82a
         ICk/IB8qM1OffqjG5HDsA+SaDFsZbSbDQA0kqIqujjp1NXMyy17rgCxDS+6/pJuSj6IY
         K1hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=n8AuekZeNcC6N2BLHlhkki18GOpXN0XdSt2mq7QEgMg=;
        b=DjgIjlHNDJxSa7wZ+EUg2li+IdbkMKy86a8dI2GlaIhkhPS6ZyvwhYlpAwy9eM88wA
         TSjzM409wm6wbaD0LDF97184qjf5vnhPYUztXHTDz3HCx4AyKb63z31MG4/0kS8OGTmQ
         lojKQhfzgrq3z/z+Vjhwl23QEDFeNus8OakbiAM1h7J2E3oFTLDykUDsZUMMs79+1lQp
         rCqMZHl+T3XYqYpU6cA+K3BEAsM8JMdv+11z5sqhtPfIraxVQm/Vuhd3ZP7S5W7MmXln
         yZ6cZWMlQUGH7eEp8GbDIR48xvC2/qPwBkUw6GrMV7gfMSjf+nU241Q7IR/px8RrH+KW
         Bang==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hi1Fthb4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24-20020ae9f818000000b0075b39115540si10125204qkh.502.2023.06.16.07.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jun 2023 07:01:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hi1Fthb4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qAA0k-0006Qg-1v; Fri, 16 Jun 2023 10:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qAA0g-0006P1-VX
 for qemu-devel@nongnu.org; Fri, 16 Jun 2023 10:01:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qAA0e-0004wi-FH
 for qemu-devel@nongnu.org; Fri, 16 Jun 2023 10:01:06 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30c4c1fd511so560850f8f.1
 for <qemu-devel@nongnu.org>; Fri, 16 Jun 2023 07:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686924063; x=1689516063;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n8AuekZeNcC6N2BLHlhkki18GOpXN0XdSt2mq7QEgMg=;
 b=hi1Fthb4Y841gHS9od+cFebkadJlLHSBzr5zBiO3bAvXXOLIgzCVNYLQULW2RGajc0
 2unBkPpJRRx4uNWzT9BTxSuJJuclycB2AsErz3gQfzlcZ+UdqyCKec7zbdbv/Cvpkxxk
 mbiPVfIL8LsZeioe2GN/g1vSdUq08AcGk4y9vexeZ2TlQQp+Fn6a8C6bLDEl5WHuaCii
 O64VhA1tfBXzNWQiRGe0HVQmkXgoJrwY75tGbv0KUd2am23DaK7TmxezoljV3lqfzYVK
 NOF1CL3YM5l1FPjmnfR4vnKogcUrkFCDfWq88yDfWdgaCSazENRKFB2R4A8PvU5gdgxi
 SW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686924063; x=1689516063;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n8AuekZeNcC6N2BLHlhkki18GOpXN0XdSt2mq7QEgMg=;
 b=GGJUncbRGnkziBIbzwyDonOpq7FIvbRZ0A4jGr3MDVigJ1pPS7h5Odve4N0eBwX5YP
 +jeoHCS2WgTGj6VSBi0Cm0cNZ6NUID8TB2odleeS56zNYR8C85iG2IRzlyVjZqvZDvCZ
 TURL0C02VNIZCCJMRcG/V1tptVJ8j5DNlRia33dNxAJICQGdhCDT3KWVeL0RlttIACXk
 hm1F96EK9czj3Omp3Rmz8VhVDqiUDJ6sv3gdfnm7dpEKNM7jdmIdSxDEgUNbJzjkXTmS
 2pQn/MVCcbKCX8NP3uJ+IJUGUOhZ8P1fjYkivk2erDElXKFRr8USwTyRyLS6mhht2PHk
 RFaA==
X-Gm-Message-State: AC+VfDzavodXRV2J2em1sqpkUH/WRViEx+fg4X2aShUCDu8HzJXI6VbN
 bPlS8bS3dfxHVF6Am7eXXVJ6Wg==
X-Received: by 2002:adf:f046:0:b0:30f:c3e4:506b with SMTP id
 t6-20020adff046000000b0030fc3e4506bmr1528003wro.44.1686924062166; 
 Fri, 16 Jun 2023 07:01:02 -0700 (PDT)
Received: from [192.168.164.175] (146.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.146]) by smtp.gmail.com with ESMTPSA id
 t11-20020adfdc0b000000b0030ae3a6be5bsm23837728wri.78.2023.06.16.07.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 07:01:01 -0700 (PDT)
Message-ID: <a0604a0d-a3ed-c852-bb8c-b565d95b5a3f@linaro.org>
Date: Fri, 16 Jun 2023 12:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 04/12] hvf: arm: Ignore writes to CNTP_CTL_EL0
Content-Language: en-US
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230614224038.86148-1-graf>
 <20230614225407.96216-1-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230614225407.96216-1-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.093, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TLsfpNttbQv5

On 15/6/23 00:54, Alexander Graf wrote:
> MacOS unconditionally disables interrupts of the physical timer on boot
> and then continues to use the virtual one. We don't really want to support
> a full physical timer emulation, so let's just ignore those writes.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>   target/arm/hvf/hvf.c | 7 +++++++
>   1 file changed, 7 insertions(+)


> @@ -1551,6 +1552,12 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
>       case SYSREG_OSLAR_EL1:
>           env->cp15.oslsr_el1 = val & 1;
>           break;
> +    case SYSREG_CNTP_CTL_EL0:
> +        /*
> +         * Guests should not rely on the physical counter, but macOS emits
> +         * disable writes to it. Let it do so, but ignore the requests.
> +         */

Still it could be useful to report that calling
qemu_log_mask(LOG_UNIMP,...) here.

> +        break;
