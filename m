Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2763437ejb;
        Wed, 24 May 2023 12:07:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6oUZ9N3dKdYDHYdzJDaIPXkhlTZNoNZml3o/bRxM47DF8GVzsUzYeS0VesXEgVwPa4ZlHc
X-Received: by 2002:a05:620a:2232:b0:75b:23a1:8337 with SMTP id n18-20020a05620a223200b0075b23a18337mr7952857qkh.50.1684955233663;
        Wed, 24 May 2023 12:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684955233; cv=none;
        d=google.com; s=arc-20160816;
        b=qG6YT+mkVYzwlK8IfnlXKCb9Ca5fPpAW15W+30nSS/HNAd1Tc7waBZfUKd5EzSkjvW
         MoT8P4pdSg68k1mbJDaHcpD4AQVMsi1hhim2axP0Kx2P5tNLyJSaHZLur6ZrQvHAFZKi
         EeFXwTqOZHr4ZONSq/SpiClntxvkIy4qX/dNH+LHAUP304rJspRsbjfeL6B0ZP7ewXuK
         h6KBHXVzPRoh//d9fGiTVg/S37fGnqmgN4aFC59w67gHgRvPMQXyBW9AosbY1ffr4yOR
         aVY6EtoStqtJQeu/qVdz+wI/TPnQgKLs+WwQqy3YbG98CV9fYdmiISKHrKtltHJxP0CW
         4wNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VOg6/cTcOlkhAUDL2bKYFa0iA+vjS1w47HRS5P7exQI=;
        b=JLgoQIAIetSpbrQiZuX+LYvebxQTrzknfSSyozfALfcSJ60uIvXZr15J+KpPnt/DSd
         0zWrzHt/+vA6R4ulaGaWoGSozI2EMROqYybkYWLcCFnlSJrNjSN8TPLL2+/s6sZFnzrM
         QfbA1JZKgNZx2MYn7YBvPoZFIfpI2sf1tTSzz3S5MjsYonp7nNGlwp3BWg/igwORwUbe
         MdNFn55P5qKjkua6zb3FFoOgwlukIiH6SRj32hrcXj1PfWu8NxjcF8mHrWcBJiBDVsVp
         Cj7WL6W/gdkfwLd38QAh5Oh32LedOjVkOdPb9ImjYg8rflMAKK/A6eGIrWLzOZ4115Gv
         7UqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HtCPiHn5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z25-20020a05620a101900b0074fc1cfb2c9si6531485qkj.685.2023.05.24.12.07.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 12:07:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HtCPiHn5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1tpC-0003VJ-Pn; Wed, 24 May 2023 15:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tpB-0003Ud-7P
 for qemu-devel@nongnu.org; Wed, 24 May 2023 15:07:05 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tp9-0007TA-Ox
 for qemu-devel@nongnu.org; Wed, 24 May 2023 15:07:04 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5304d0d1eddso430402a12.2
 for <qemu-devel@nongnu.org>; Wed, 24 May 2023 12:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684955222; x=1687547222;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VOg6/cTcOlkhAUDL2bKYFa0iA+vjS1w47HRS5P7exQI=;
 b=HtCPiHn5skm7sri21zxihji9SO7LIw2CqCXivcqYUUQK+rk1jvOJp7PdlKZtWwBggF
 brcXMHJuKI+dJQJXi7ueFDhKS6TttwLK74ChInSlrahTC/HuGkMYz8APi0upQ75qebPx
 sKbwtZAzIltHBIEMDViCrvLQm3N60Ee+Qn67mtVNrmdtjDmUm8abCyF6dvz5GEJCO0Jk
 aPT9M8EQOLtM/DePBRGg1S3XHuFape00xGXsNu6C9OFx1dZH+qOnC+W6X63JfL7ElgEJ
 b5cW/vjCuOJw75vXscXLvACbDRLLs9+RI9bid3LZ6UrVztfB0xwA/eKN87UMMaa+O2Kz
 e4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684955222; x=1687547222;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VOg6/cTcOlkhAUDL2bKYFa0iA+vjS1w47HRS5P7exQI=;
 b=iGMoskh2WPiQXy0pJY5FX9IwX2WRafaJyDS1B8Y/IQaDjOuCKpYuLn6y4lGS4MZlqH
 31vaesXijn6JLlV3+38+ZjX/wJtDeBp3/g8jfb1vELUlWgki2HjzuI8QPi/bUYDKXS+a
 I/xv31hZvuHqSCxmMkomnwvEU0d5J1ZSqS16r0Lil0dwEMXqRUgxn3HKZaGHiO1OL+9M
 Z+WFLtPXu5zGXoK9uzll1Yvgk/qXCClBXG/+gQv7OHjTfvqQN4dbAgR/Odq+boZy2OY3
 FB+c5hAhZuMgYjkag/LjT+qhH1qcESd8Yps43qH+Rkj6pEMmLHR4wRRg9ywWjtaxbImq
 bVsg==
X-Gm-Message-State: AC+VfDwRGpnluaeRMDe0p3jIXr2al3ajRQ1pJwILlyE5BXfwITkkSRrn
 NBFgQ7kZ2JNDyOOmejldCW3YLQ==
X-Received: by 2002:a17:902:e84b:b0:1ae:501:e230 with SMTP id
 t11-20020a170902e84b00b001ae0501e230mr22122953plg.11.1684955222215; 
 Wed, 24 May 2023 12:07:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a1709026bc200b001a687c505e6sm9086926plt.232.2023.05.24.12.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 12:07:01 -0700 (PDT)
Message-ID: <1fe883db-ae0d-c645-c1c8-2f3849123841@linaro.org>
Date: Wed, 24 May 2023 12:06:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/10] hw/arm/realview: Move 'is_pb' to
 RealviewMachineClass
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20230524145906.33156-1-philmd@linaro.org>
 <20230524145906.33156-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524145906.33156-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: z5wT6JDEk2+6

On 5/24/23 07:59, Philippe Mathieu-Daudé wrote:
> Instead of having each machine instance set whether EP/PB,
> set it once in their class_init() handler.
> 
> Arguably this could be extracted from the board_id field.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/realview.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
