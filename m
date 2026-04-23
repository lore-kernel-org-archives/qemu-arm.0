Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F964FAD3EC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 02:15:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFjar-0008QE-62; Wed, 22 Apr 2026 22:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFjan-0008Oj-EK
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:15:01 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFjal-00060I-TE
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:15:01 -0400
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-50fbd79350dso19707611cf.3
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 19:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776910499; x=1777515299; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UVNsxBXMNh53Gc88sSJAHX3ztS+XpBkjeAO2PVoie+8=;
 b=vxc5zlZulB5QIBg2273oGMGpWILE9kBXxASYeSf6WbRnKrGE8MQKZYh1/AwPJwFGok
 ThuRaq5SbgvQhJpIkYyFiY0sr0KdcPWFR1ELFw998l5UyvgU08uk3yKhWXL/VLJV4XFB
 Ig4xTOrP6VifqoliZ3vuZEphZUw20mF7f4RxoY/oA0K5GxMc3qTrAue11UQjweu/YdnI
 UJimP0RjukfVBYKDkDVnLLEMcdy2XvU3DX4Pc7svOuMi+LW7sG6I3+2t9aTwxEoVfPAL
 QS9SkR1GyWSrqlIz08EvflPzCDdpfJzQBK8A0pg60dWM1B0NfLbJu0XyfjGtw+yqNl0r
 nWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776910499; x=1777515299;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UVNsxBXMNh53Gc88sSJAHX3ztS+XpBkjeAO2PVoie+8=;
 b=Ed9j+bZ3J1HDSy0h6KzSuxOUnsjLLxy7D++CrijyZl5FVBxFL6ARuR9krNtE9K+qwr
 MyEYrhDQD1cjabVjurSij4Qsuazrs0oInjyljcm4AmDSc/toiciqcgTIwfcV0ObiQKbg
 QIuzP0M7BpOmmFzI1VBHsYkdp+Ti+kAdXTn/6CqVyFJYvm8zApoILOPDzrSUAwj2xrKV
 SzaOxqkYI59GiW8javV82oNrb3k3JeFj4C6pInjyAYkxA88RgIVXsOt5NSaCzetHgd69
 ihoeh19RgNAKGbGhKwmmF4I9XtW5vG7LPoLvIpKZpe9mc5SwK8EoHZMAVlhmODQmS2uT
 RhBQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ95KnFehmsYHf5dkov14rpK+IVksVMwh7nQa3lMiunOwUNN7k40Ox1FVg5d2ANJI9Lbz5URGZYyCQ==@nongnu.org
X-Gm-Message-State: AOJu0YyRd7WtgqpTfcMoL/4J8bg07ELGsXoKGpyxCZNkmazdUzHH+ZVE
 z2xr7nJA5bCVHbzzR0xOh7OAINqi5vE8Cz021HeTC/ZLx2M9GOb6Ig1Bbkd200rqQHo=
X-Gm-Gg: AeBDieutSzamjuU/mVMPj8m7Pj2tdXiidtuV6V8LN1V1nXifIKiJCh6ccoa2GCQXShT
 AxlPx81bvzmdafXArmwdZXlmZKHJ7vBvJ4tf7nWcKfZ7MvEgBEM+8R/573PngKE01WPYmrPfFaq
 c+HO3TO4Tc+MallwaTXjNj5VWvvNTxOq2PA0NTRYS5gJVWpDNfR52V/RyIfS2+/jEvft+25ymIg
 6GKuNa0DKuhgDuF2kXjf8xj0PCJ++/ZU0dVKWDzS8YuomhJb/SJ0pXS4SroJnxvvSOXpyTArszg
 GjnjBp3n0lHREaTEThaAi4rubnAwe/ebopvCO/ua2EQJF5jzjkDHN+tiZ12lNpLeYo80X7DDhP7
 3eR5TY7jGK9cbA0k+ENzkCXeKXicE/B8Lo/7Ujo5nKhaO1yfL8veVpSS2Uo5xKtiq69L90e1uy3
 TSPJf/rZzykhpoO4ABFIDdDLVqS3ICTnc83Hi2N29s86otMHjkbNxJ/So5uLnxHv+NjLS7HDF8x
 fKJBVFLvHN8OahZdtM1aD9nI15x
X-Received: by 2002:a05:622a:22aa:b0:50f:b7f6:d626 with SMTP id
 d75a77b69052e-50fb7f6d943mr131425061cf.47.1776910498759; 
 Wed, 22 Apr 2026 19:14:58 -0700 (PDT)
Received: from [10.72.56.227] ([172.59.184.224])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50fb80a5636sm50730851cf.6.2026.04.22.19.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 19:14:58 -0700 (PDT)
Message-ID: <002fbc44-3b74-49b3-8add-a8b1d95316b2@linaro.org>
Date: Thu, 23 Apr 2026 12:14:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] target/alpha: Make get_phys_page_debug handle
 non-page-aligned addrs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417173105.1648172-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/18/26 03:30, Peter Maydell wrote:
> Currently our implementations ofSysemuCPUOps::get_phys_page_debug
> andSysemuCPUOps::get_phys_page_attrs_debug are a mix of "accepts a
> non-page-aligned virtual address and returns the corresponding
> non-page-aligned physical address" and "only returns a page-aligned
> physical address".  This is awkward for callsites, which in practice
> all want the physical address for an arbitrary virtual address and
> have to work around the possibility of getting a page-aligned
> address, and it doesn't account for protection being possibly on a
> sub-page-sized granularity.  We want to standardize on the
> implementation having to handle non-page-aligned addresses.
> 
> For alpha, the get_physical_address() function accepts arbitrary
> input addresses but may return an output rounded down to a page
> boundary, so in alpha_cpu_get_phys_page_debug() we OR the within-page
> offset into it before returning it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/alpha/helper.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

