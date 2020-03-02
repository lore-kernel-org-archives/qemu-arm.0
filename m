Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2659392lfg;
        Mon, 2 Mar 2020 09:02:47 -0800 (PST)
X-Google-Smtp-Source: ADFU+vucMROFuC7/eX3mVJm4BtX9aFJQQiFRtApDoYqv+9DkJOXiJ7QuVvwMEuzWezJXqDWsOyEN
X-Received: by 2002:a05:620a:a1d:: with SMTP id i29mr180645qka.343.1583168567108;
        Mon, 02 Mar 2020 09:02:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583168567; cv=none;
        d=google.com; s=arc-20160816;
        b=hPvd+7mp4TUTfzF6SSkt/SggkQ59OWrFsukfoCswpBnYQpMZeZZQ3bNb0Nd6o+Rn6D
         XwfOAfdTLH01HGPOhOnhxHRl05Njoi4BWaMQbzHALPM6/G5WL/Sipxo9/yh3dr+KbCUL
         TRYo8yKeBcIIX/6G//aYPX2yqcIa9IqqqNRkIjCOAsAGnd+uEEvuYnpBChtI7m1elftr
         VX4LvVpm+D0NEKFDkz1ZUJ/n2XZJoQkSk66S0IvQ1OSkv3jrIWrL9cw2jqBNrkUk/qOf
         Sj3ub1/HFEGYA4M/hflyiSQ1H9CRCLSzHSJmBQbe0+eoRYrfpUOHBrjbL7Sv4M++61Xo
         Vjtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3vVT2JT1q6CZ5+QQmZemp+xWla5xDqktDRGl38dcfPo=;
        b=JIQOFZAJ5Mf6+wqekY3mbMY8fXBo/hzQpsyVKpbTWioWygMctm+HZOhiroi5xcBgKF
         tcB0QsipKPoPOdXZzf8ZfdKggOD566v2dH6ij2LY3Ogfv0c+Td5p+xk1t54/YD1Y2Y+2
         77ygTUfkNWBxca939DWme36EeqB9ZL+c7nHkXlD8ZrIkM7raVYQS63NP1eLX3h7qEis4
         O2HgopMzhSz+X8sjQOMNRlgvbgOo6E+l4n9adT3Jg03emlwZHcM2+tNzi2+ezgWrgkit
         Mv+p1iXg1SJODCKLxke4LT4Rc1PEVueKJD1CHUbo5LHFxM8BhbwPOjpersZhrd4QCvMZ
         wvZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FP85tpGy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si865823qtp.231.2020.03.02.09.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 09:02:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FP85tpGy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8oSr-0001vH-Fc
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 12:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8oQq-0007Tt-8c
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:00:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8oQp-0003GA-4h
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:00:40 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33419)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8oQo-0003Fp-T5
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:00:39 -0500
Received: by mail-pf1-x443.google.com with SMTP id n7so28220pfn.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 09:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3vVT2JT1q6CZ5+QQmZemp+xWla5xDqktDRGl38dcfPo=;
 b=FP85tpGyQeIA1E0wB/KzwnKscUnAEqkcwQtz6JC8p3YkIjhazdfTM7ZxnQK539iZ2o
 S7sLdqGqrzzDFcfZm0CnTL9Sx1QvQDcjQhqV3AjQp4IWahuEYbWYL4xcvSMZyISWoe30
 VcRMR/E85FRjj9DAtM3Nisry+1uOBK/PyIDGa587BxtRUgzjilLT5RfxiHXzi6pRj+3E
 XDL7YucFNrVyDfeERsiksIBtXfQrW3Fud/niqvmo1UN4pLLOgTtBgPy6gi0ixB0c5bw/
 GM2VkWmmJ2dwp+UtGHbbqh4GbDAtF5n5JoNJACYgntTnaeP/L3TjH2tWmvIrWbuvSJdL
 jYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3vVT2JT1q6CZ5+QQmZemp+xWla5xDqktDRGl38dcfPo=;
 b=pz5PyIpHjeKtcKjhk26tbmsr7o26XneIWo1uCAELs+o3DZJs0nNERQXijGxBByg5aq
 MAUWeWEEAFFBGZ4k7cyRAAB8nr69toO3lfFwl+F8mrfOigt53cqMMpyxCdNl8mvGKCrm
 5DqHtVc3OIcYftEA57iuZOoCkEWRjTLAykWPZAkv0wo7Bas9quIYQoVrDlYco1piuuET
 GBgSejgmu2VjsBhq6B5ZAlwr/JbOJF0iaq++HZQl7AWNR7llfrDcTPNYVb+aBG6pPcH+
 2Kuk7HOlGZ0b04HFA+tKM6/bGlsj7kSZ9skD6meaK8ikt2aDTaD5u/DSSpdyrJBBTAlh
 cCnQ==
X-Gm-Message-State: APjAAAW+vPmC8Hl0UtwQI2vgpggzznC6zoRuh7U9sx2PEDjkjm6mSWPe
 dzR3h/njviihn8aJEWYwt69nOA==
X-Received: by 2002:a63:120f:: with SMTP id h15mr20964581pgl.235.1583168437896; 
 Mon, 02 Mar 2020 09:00:37 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d1sm13446842pfc.3.2020.03.02.09.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 09:00:37 -0800 (PST)
Subject: Re: [PATCH v3 2/6] hw/arm/virt: Introduce VirtGICType enum type
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200302105516.5972-1-eric.auger@redhat.com>
 <20200302105516.5972-3-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3b8d9c2-d5c3-e266-caad-1050ae843024@linaro.org>
Date: Mon, 2 Mar 2020 09:00:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302105516.5972-3-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dNvhtaMAMcaq

On 3/2/20 2:55 AM, Eric Auger wrote:
> We plan to introduce yet another value for the gic version (nosel).
> As we already use exotic values such as 0 and -1, let's introduce
> a dedicated enum type and let vms->gic_version take this
> type.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - replaced defines by enum VirtGICType
> - use that new type for vms->gic_version
> ---
>  hw/arm/virt.c         | 30 +++++++++++++++---------------
>  include/hw/arm/virt.h | 11 +++++++++--
>  2 files changed, 24 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
