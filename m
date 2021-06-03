Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp483683lfa;
        Thu, 3 Jun 2021 11:52:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvKRGwB+d1PuNweWp10pB8eLpvhgcgIgnYRlLKOJNPxBllUMHKC3GTWQmYovj+sWUyWIjy
X-Received: by 2002:a9f:3664:: with SMTP id s33mr550770uad.63.1622746370002;
        Thu, 03 Jun 2021 11:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622746369; cv=none;
        d=google.com; s=arc-20160816;
        b=x9tdqfscF88hG6LIUXQ3zgbzBB3VEIUOQKoG1qwIL0jowDWMBbWIV0LX8o8OaUmAjp
         GPnFJpgjOgXurEt1ryZVdlu7+Vzl/SpyYz32bkRPyMqGVerFewdiy4kYpWyqElWWx++x
         AgUbu7AKyc70d6cBy3aO4FUulGM9CXBns/aEDXwDaBolZGCyAAqxSzXgtoeKNunm+mtr
         V6MTIcqqDIX6dG+kUWoy7wTxh1HvuWMJHgplYuJwsdRtz1YZNyzszIEKP6V52EothX1d
         d9NeKvI3OpbsRJnhyAC+bcqJQYU+xWvihounZqMIIGSvtB2ZE6yVPTXlRxHvP1JK1Ssd
         Dbkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YKNTuggFhIJ15rCHacQ0G7rAiTeTOSzA8dwJthM+jd8=;
        b=iaiUm0KrCXh31VqnPXSdqQH2TTvlQVL+f9Ca1ZKKJ65PUrmyrKQ5YRW9kbwMPUiiev
         NOtF7JFLO96Cb+ZilX486dqaHqse9z0czPND+Op1pjbYrTAyRZ41JfwzQoqrSWfSjOwY
         CPg1fKGVhcRbNG95YAXzFXo9guYpsbUJ48yEcviauIrj7t3mQC7Y6gNRKIJlABGkhE/b
         dwMvGZzJis1dCXzPENJO1SDjzOaJKNRad1U7b1nhjYJopvZar/imvhIs8fuhDuKq8l7u
         +QkeI937y57U8TvA4U43dDQhBs5MbWp72+1kCP9GrAQ3mN0Fvo42rqdEDUjQEStsyQki
         uq8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=otuUrTL1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22si2065819uaq.69.2021.06.03.11.52.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 11:52:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=otuUrTL1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1losSX-0001fY-9i
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 14:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losSO-0001dj-ST
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 14:52:40 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:53031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losSN-0004FD-3e
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 14:52:40 -0400
Received: by mail-pj1-x102b.google.com with SMTP id h16so4198725pjv.2
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 11:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YKNTuggFhIJ15rCHacQ0G7rAiTeTOSzA8dwJthM+jd8=;
 b=otuUrTL1hdKdGCbuIQWkIeKFtlr7Mwhnf3v2mOuG2QmggVsWLegDOvvaPvrUJ9F9Z8
 bklWeDZrJJaXQF/mC4p/hi7IIRTDcTYfsAhhDHMO8LkouTSq1oPDgCourkgGa0md3Ei8
 gU+4yi7yxRpO0Uh12sbDukNxydTf0khsWkvMoISrU7y8l6ZVe9hQ0FDLQjYMxhFcJZO7
 tlfLY9S4PuC/yZ2/nyYEWUiOAu4uH/b5P5MtEdH/U8B2k/ktmrWHQSUPLw7sv+Yn8YCx
 R3J2NkOm4QRaSxvT5BN6sa/fkQmzjsWzqbw0KhiydUgawaOWtNvzB6O57QLaZl61jIa/
 qY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YKNTuggFhIJ15rCHacQ0G7rAiTeTOSzA8dwJthM+jd8=;
 b=SPT5IZ7SlJZzDQu25SshKmkz8nddrbXMqLnQrU2qKBa/ptONS/A/w6+vVWNxV0E017
 5/0qu5EN2dWSQlEyhGq/jHi03Ayotpi18oX07yDHdWwrLAJqBZNpL3jMQvD41OFfx+Jy
 mmEinsO/DqC/4S27Iw7ZtDj0bCrra4BBxmpeesko1bwl+Y8eQdo81FksUeFbgyG6UUz4
 HwfCtyniSeuhCWHADywGGvBrQtJZwK7au74Pv0U5M6jQrrnf1DlCfsYfcDEeLYwJ37VL
 xa3qBz+UEVZn5oHgJSIDKYn7LN/+ep0cfUuz/jmh82PpyBfxUGczwZfrWnim5NMxZUMr
 +aEg==
X-Gm-Message-State: AOAM533qAMVN9Bz6af+vQ4KRWRggJevwh9pqCzvOmFwQ6z52vPRoxpPf
 oOsVZSA/FI+dww6NKf/VC54nog==
X-Received: by 2002:a17:902:7587:b029:109:69bd:3eae with SMTP id
 j7-20020a1709027587b029010969bd3eaemr446102pll.40.1622746357054; 
 Thu, 03 Jun 2021 11:52:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x125sm2878986pfx.201.2021.06.03.11.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 11:52:36 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/acpi: Provide stub version of
 acpi_ghes_record_errors()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210603171259.27962-1-peter.maydell@linaro.org>
 <20210603171259.27962-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <794108a2-fbaf-dfbc-ed8f-2d3d87ba2c07@linaro.org>
Date: Thu, 3 Jun 2021 11:52:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603171259.27962-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EATOM9WmBtN8

On 6/3/21 10:12 AM, Peter Maydell wrote:
> +softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
>   softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
>   softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
> -                                                  'acpi-x86-stub.c', 'ipmi-stub.c'))
> +                                                  'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c'))

Gosh that last line is confusing.  I see it's documented in build-system.rst, 
but yeesh.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

