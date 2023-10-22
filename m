Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp891552ejb;
        Sun, 22 Oct 2023 09:54:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYNfq5+GYfHjWHssvOABQGHACU3xYBJ9M637g9oLLMTY0wXryzGXobIh3wADDS+ky5peJ7
X-Received: by 2002:a05:6870:6c05:b0:1e9:af81:54c2 with SMTP id na5-20020a0568706c0500b001e9af8154c2mr7825188oab.45.1697993672055;
        Sun, 22 Oct 2023 09:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697993672; cv=none;
        d=google.com; s=arc-20160816;
        b=NlDPWezQ6nmYD8uK/Rj1SgA0IgI6NHflc6SMwPbyrRilIZxWcDAx63upvW1QCuWTPQ
         JOcy8Uyg9rYDxhMExTlWf7U4CBKGbTJPaXMmOrrsuequ2eKH/ux7iLx5RWoS/ZQGlKgq
         gPk8qRRTZxmebWoQCa76DXDcqRSkh8x9yJVho4txbpTikLDhECDMOaq3xUzfOboonoOG
         liFNSLUji5r5QWhHs0M528yrqPMiCsa6E+daD/IgGzeC18zxnK/NP0qi98TJNqVT53JL
         IZAcyfAYaRwoASkY9RVEng0gAC2SqVgDaF77z1EaxexwLPgcCK6SN2JDRWPZo0TJAzCg
         fXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=x/1hi5CChFIx2el9gS9cT/lXx2jCfOOkVO1kn47N7NM=;
        fh=k4iButtuj8hEc/Hzb102WV+ymnTGT+2i4lFe9Di6uCY=;
        b=dmvlucqg2/M41M6Z01mXmRa819p9IpqV+MfdtOSEcDnc82yUQ8nQkpErSGOeJhja5z
         LFk265PQ3Cgr2+TkQm0HNjEICMby2eNk/L/XrjpBnzqzXasoqH2Vj2G7WJkGaVyyslwO
         T6wcjfgO0CuRd1MEyIgyNN++gv0IICHvrNqQpMaSWKxrKkrWrylyoFKsMmVGT5W5tEpX
         /SPTEF0/lNeqQseul/I02cU1Z55Eh7uGm+vzTml3JFyqB94ddwFLeYSDXW8Gh+jR1l45
         AKT49JTWeSkunzs9mh2t6AexdVzMPeCyBjbCpkCjXiFnZwnTHqOCiVVeZBek+gEvpIoM
         LvjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JhT/WmRy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp40-20020a05620a45a800b007756a7b3dfasi4303055qkb.503.2023.10.22.09.54.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 09:54:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JhT/WmRy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qubhu-0000i2-SS; Sun, 22 Oct 2023 12:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qubhs-0000hg-Ht
 for qemu-arm@nongnu.org; Sun, 22 Oct 2023 12:53:40 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qubhr-00030f-55
 for qemu-arm@nongnu.org; Sun, 22 Oct 2023 12:53:40 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5859a7d6556so1968325a12.0
 for <qemu-arm@nongnu.org>; Sun, 22 Oct 2023 09:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697993617; x=1698598417; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x/1hi5CChFIx2el9gS9cT/lXx2jCfOOkVO1kn47N7NM=;
 b=JhT/WmRy0PX09vt0f6aInt0zD9OZBpFtB1E5/ZBLIRNk8vXe+jYY0rINgYk4Jqbd7z
 rqEblTUE4nv1nHO24b8/dm0FzivXTvdGN+g62qRnAJCy9+cr1mS38gRZ65Rthu8SOT9E
 F3pce3O/8nDbcoXEQKUu5ockyEccwTDNIV7c2hQybhIGnATiwBzYq6/FUqRGHVpaYqYp
 kVyG9HHj0LfkDB32YXWdm413E2/gP11UlZ2jpZUikSKQisWaA13/N4M50axLsZbOmYg6
 wZJ/eUg0kmtOymcTfWoPPenBoVcG65SCaOs31qLQMdF6/gFF9XlBxShBml+i7t6hssSF
 PMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697993617; x=1698598417;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x/1hi5CChFIx2el9gS9cT/lXx2jCfOOkVO1kn47N7NM=;
 b=HaRaNsPf9RO85/mZSfPmpxsqlGi0rNCbwjR4fkI2lwruptmjM1z+xwF8J8kgxfrwg5
 7FWdoFUtNY5MIWwXu6CgxKoNgPe+N21oinoW8S4KfPhC1kzjtxkczRqsAVWyvlN6es1Z
 deGOwVfzW96SMxjICI1jVTnfrrEX88EiKbU+wvRj1QwV2IO+KDhT05QNGGpeJzUY02Fs
 fDK95Mp6ys2XuXuAvfVNvS+DOUvZDpqXMWAiABlR5teR7QYTiEoqrMvyAHnhMrLUhw/j
 yKkhGYglMTRazIoP3sUN8tAwkocqi9xCwOTF3LRVbAByaEDHcHvtfr0ODgwoosJ2reOq
 txZA==
X-Gm-Message-State: AOJu0YzTHo4mmbGIhuPhZz7434Gvm2EBIE/MLUHy5Gzb8l23ifh/dhCV
 PXPJDg/6OOriF+VLtyc2yvRr6A==
X-Received: by 2002:a17:90a:d443:b0:27c:f309:f381 with SMTP id
 cz3-20020a17090ad44300b0027cf309f381mr6807045pjb.6.1697993617359; 
 Sun, 22 Oct 2023 09:53:37 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a17090a2a4a00b002790ded9c6dsm4934130pjg.31.2023.10.22.09.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Oct 2023 09:53:36 -0700 (PDT)
Message-ID: <c9ff4b6f-2ac8-43f2-9be7-7bf92ef69496@linaro.org>
Date: Sun, 22 Oct 2023 09:53:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] hw/char/stm32f2xx_usart: Extract common IRQ update
 code to update_irq()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20231020170009.86870-1-philmd@linaro.org>
 <20231020170009.86870-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231020170009.86870-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-TUID: Q8/6yC3JuBEp

On 10/20/23 10:00, Philippe Mathieu-Daudé wrote:
> From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> 
> Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/char/stm32f2xx_usart.c | 28 ++++++++++++++++------------
>   1 file changed, 16 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
