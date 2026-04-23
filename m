Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79115FAD3E7
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 02:32:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFjrv-0005rg-Fx; Wed, 22 Apr 2026 22:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFjrl-0005pd-9H
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:32:36 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFjrj-0003O5-7H
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:32:32 -0400
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-50d87610513so68281571cf.3
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 19:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776911550; x=1777516350; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yoR8Sg0gO1GA+WNZeZ9F9igNGNy1Be3/WnfjaXZ+AZo=;
 b=fdYJGrqM5xjEcqBPMqnH2RlONuTnvthDSzav2ieILKsSxBczxxayxmhaUQut8RHdko
 n+kSI1ZhHKDNCzuP8cNjYE5RDO/M/3La++4Gf+HqeOTFtlSR4y0EBm5yvHBVo9WzgFi9
 HAVUrPYhUDK6S+dp3LARCOWnp8VpzRc9SlgrcIXPI/7fnlNvp7sdG+CPMCYgswB0nQSY
 jgvsSAV2BEZsgIbLjAnWA/L3LSRohBmO1an1yvk9AsBeM1kJm53IgWBGasvCYFtaYk7A
 cQ1Cj7md2Mahf7qA5tOFwiBDcjyJ/Tu71maA+e/nkPON6x4mo/bheFsSPjFACtrxjhi1
 VV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776911550; x=1777516350;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yoR8Sg0gO1GA+WNZeZ9F9igNGNy1Be3/WnfjaXZ+AZo=;
 b=HC21e4nlsm2IjQCppEAMZIzZaF/hB5NtScRsOZvW6nvCnoaxO+8ht7nOpXQ0Aei9/x
 k8bAEOqb1MiYJ4TX9uw2+WHJs9+E5VFg0QmZDDzOb7yLSipHAihMROVy9/+QMKkWbdd8
 xbu7cDx6T1uYD+yWQ/TlV3VcSIxmoMOrnDVHXSdNcgslUjLv3tG8YQLtvckR61SOHfL9
 lIKEsKE8iwavMBGLqjDONqLhtBONPfd3umhjxoe5SQTtQDx5FpLfRNbWRV3VrDn+3PSX
 MVAgRGOih6huOWxaJozGLbXOroE4/MQwfVf2U+mZozSqa1dq7SdYNOJA4jSb8DyJ5uKO
 QGxg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+XeH3zBcEzTadk073LSDO21/pO63DkjkE+fz/G5GAyAGzb1oRp1G7JFmveuzsOfYeqgF2aRT4X2w==@nongnu.org
X-Gm-Message-State: AOJu0YwOK7eMGH0u61w2Kkhty26GMuz/4WcrJgdiM4ZHia3h6KPxugVt
 BFhMNzA6yiVIQ7a0XD21VTvbhzy8wd1dG4bB5oyDdha/LMX9xQHnliwn0bHJGWSQEFM=
X-Gm-Gg: AeBDietF8PycBgBiDr3mBD5howlrJxFzMwcLd0Xw7+iiGG2nhqmu5csSCRh2YHhPvOz
 AAywkeDTuuD4qDppbxfN6qxuGjK84q00A4DA+bAnUIFFYbV+etYQJU7tYvlB5qrwiJjR61wrvWx
 jLbfSbhRcK11ednkLn4VPgMuT1areike79niaTarYhoumwy8wO4JCakvkdNoJWIFXgkC5junnB4
 VGir4rPGBJCIgtu+wwcmYDycXyYllAkX/Qa10yc2xSVuTFXUlpiKBQgYEdakcfn3ZjzI8HHx1Gi
 V6fRQRVBNIL/p5jIuDOoP5UULKVtlJ6M8FsaW79SW5IEOKk9RhH3loIW0u1yw7s2wV0lD+alV9R
 BBaNF0bwJjPOugy8Fwa/EyDEmoO3NP8pKBiGPQ056PtO7LjFJQ/RQbPTF95gf1W1tekxPK3S7Xk
 w3FfGi5YCu+NlBwQpxXahPDNbRw5Hcahc12t+1QpTlJYyYzlnFDyp5yRlRf7WtFhwPJ0ZV6cAzo
 KSl7PvyUuFeY1Aq1nMat65C4/jm
X-Received: by 2002:ac8:5889:0:b0:50f:135e:d5d with SMTP id
 d75a77b69052e-50f135e1247mr190131461cf.8.1776911549827; 
 Wed, 22 Apr 2026 19:32:29 -0700 (PDT)
Received: from [10.72.56.227] ([172.59.184.224])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b02ac42586sm149971606d6.8.2026.04.22.19.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 19:32:29 -0700 (PDT)
Message-ID: <71a08aec-1b1c-4646-a6f0-a24141e30305@linaro.org>
Date: Thu, 23 Apr 2026 12:32:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] target: Rename get_phys_page_debug to
 get_phys_addr_debug
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417173105.1648172-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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

On 4/18/26 03:30, Peter Maydell wrote:
> Now that we have ensured that all implementations of the get_phys_page_debug
> method handle a non-page-aligned input and return the corresponding
> non-page-aligned output, the name of the method is somewhat misleading.
> Rename it to get_phys_addr_debug.
> 
> This commit was produced with the commands
> 
>   sed -i -e 's/_cpu_get_phys_page_debug/_cpu_get_phys_addr_debug/g;s/\<get_phys_page_debug\>/get_phys_addr_debug/g' $(git grep -l get_phys_page_debug)
>   sed -i -e 's/_cpu_get_phys_page_attrs_debug/_cpu_get_phys_addr_attrs_debug/g;s/\<get_phys_page_attrs_debug\>/get_phys_addr_attrs_debug/g' $(git grep -l get_phys_page_attrs_debug)
> 
> which catches all references to the method name itself plus
> the functions which each target uses as the method implementation,
> but (deliberately) not the cpu_phys_get_page_debug() and
> cpu_phys_get_page_attrs_debug() wrapper functions or their callers.
> (We'll deal with those in the next commit.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

