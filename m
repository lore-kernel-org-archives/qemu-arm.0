Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5962BCD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:33:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPleq-0001M0-DO; Wed, 20 May 2026 14:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcw-00053B-Gg
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:43 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcv-0002Yh-1L
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:42 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-c8025500cc7so4018343a12.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301599; x=1779906399; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gSZG5X9CZUwXqYG/i2Xu10x6ZkVLOm19dRBYdvWghoc=;
 b=YDkJ5lPDy62IUszINqN0yacM1zYwdEWT9Lus2ueSlm1NXZA0oqGNe3U8eo0dpfITLG
 BBE78M8jU38icck5HR+OtbL6FVvWVN/6baeAXNOEo4q074qpdZTbQKn+L9PMP6IQ/z/1
 iGpN89yboWjO9Uxx8pldAcUx4/Evm/GBbB4A2Dv+7ATIPn8T/Egj2rMIxWcH7mLrOgQ6
 CIG6JXdr3OHcDauD4O64IRnScrPtuGk67aaCsTUACCzlafXWgrA/IoTKYBQhSBS+V5i9
 qtmfZmeDA9YJLz2BU1vCOFcK5qVjxoRD83E92NYQLgaY6GKJWOE5qYRq+jcjtqAar1Jq
 8upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301599; x=1779906399;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gSZG5X9CZUwXqYG/i2Xu10x6ZkVLOm19dRBYdvWghoc=;
 b=cbh6T0HXSx+aqSefHaPzlqxNA78ea7U9eYlhnhTWyeKNdnj+FTtmtYt0sA3eB7WZBI
 P6nBW8LIn7TkUw3er2RkI9lrzTWuC4B5VCo8z7uoOiceVW2WbBUyAiuJ2XIfgrxHYFUr
 XM++gycun/8wx7y32C/XbFBxMxo/X3kYAFrhGTDLn1jJfy+KX47SEza/RMEZa/PpRDK5
 QsCBYfZr5qsYMO09MAYKRf8mmZ9KUKMN/fTqr36BwsJX3jHtNz9D2KuARSPok+52BnZC
 jrBrnnyX3i/DR9xHQRGcvNPHZE3ZXxCgIWH1D4amQCmcJcWVL2+JHSpfgU4eBuYB8nja
 tUqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9dQ+PeM+PPR66y7501x3rXj9tZviB+b32F18uQiDuO/5zurZR2RxbMtf3z4BaC9qomVesFmAeYuw==@nongnu.org
X-Gm-Message-State: AOJu0Yx2tnDPWbDudF9KNtapsIspbMXr/L6P3L5w4cdwCglmltq98s6p
 FBVjDfiEJ0rL/FewC1T04SwNqr1KWzN6UF4dyGntwQJBoMjGexOJ6JXXx1CBSYDje8w=
X-Gm-Gg: Acq92OGZRJflS3dxIxj+uXg10w8qxO5tF5tWLf+uHe80/mrmxKplAzHPxXaL43+4IHE
 SmN+ZI+0IRiV3gSMyWP5b1/DkW4KRsBpy77cXEVXtJoeFNrWMMsF8jq+fOR54Vtq62v3Zv7KbhJ
 T+abBqVR0WiezFGVVbdatTcaCFkHnAU2Y45P0LV9mg2lxNDpfqrCBmIvDf6BSEOc53V7t4G6KaO
 39EQqsQKO4g5kLwyAaiWPni07qKVoCvvj8g+y2QiMtDQjzFe5Ag+DtrpF5cU/Jt5Y+s7L6cxF1o
 cwDyuhTyuIJHsN0TJHLr+fUgHrUn73Iotdd/35uTkUAhpYv9rs/MvJbgKfoIU82/7k3OGFYZXWf
 AOJnP92xZjj+/F/JjJgZv4EajRQ9gRKuZhxNsF1JFOsnywaUhPSR+dqtsxx1BB1hFRWomK98yNV
 H2xx8BHXXIrI4iwvaOpUzXsoUFFstoJuzOjzC1
X-Received: by 2002:a05:6a20:3d1d:b0:3a1:90ef:7e37 with SMTP id
 adf61e73a8af0-3b22ebe1b1amr29589763637.33.1779301599503; 
 Wed, 20 May 2026 11:26:39 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82bb114c08sm21385068a12.23.2026.05.20.11.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 11:26:39 -0700 (PDT)
Message-ID: <498188db-167b-479f-abec-1e7967f0b967@linaro.org>
Date: Wed, 20 May 2026 11:26:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 29/30] fpu: Fix NaN encoding for E4M3 in parts64_uncanon
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260520171820.848839-1-richard.henderson@linaro.org>
 <20260520171820.848839-30-richard.henderson@linaro.org>
 <CAFEAcA9tXNossXoMC=LSa7Aw0CZzsmtkppKqEGqcdSgy-X_GOw@mail.gmail.com>
 <CAFEAcA9X-2+_LgGaT3Jf3tC7p3RSH0qRQ0CK_3BhySzS_cxqWg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA9X-2+_LgGaT3Jf3tC7p3RSH0qRQ0CK_3BhySzS_cxqWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/20/26 11:21, Peter Maydell wrote:
>>> +                break;
>>> +            }
>>> +            g_assert_not_reached();
> 
> ...ah, I misread it. I think it would be clearer to
> have the float_expmax_normal case be "g_assert_not_reached()"
> rather than "break, and rely on the thing immediately next
> after the switch to be g_assert_not_reached()", because
> it more obviously says "this case can't occur".

Mm.  I wrote the switch to let -Wall diagnose a missing enumerator, rather than

     case float_expmax_normal:
     default:
         g_assert_not_reached();


r~

