Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3720741ejm;
        Tue, 25 Apr 2023 12:43:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zh+UCuZrOZ+nqzYeQk6ND2krhFOvHPj0CYZ1vXmQReDFVr0QePK7MCGW4oq3iWzKriERM5
X-Received: by 2002:a05:6214:20a3:b0:5ee:4503:24f5 with SMTP id 3-20020a05621420a300b005ee450324f5mr35577773qvd.21.1682451786675;
        Tue, 25 Apr 2023 12:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451786; cv=none;
        d=google.com; s=arc-20160816;
        b=Nz3DR170YCZncMIS1wdHWtS260ZeGl3Gf21A2BZD1JGgZR4DT9Q1iqphJfqAm//ZLa
         VwwHB/xa56FeS6AJ3pu61Vqd1gpRgk39drHKMnpdxu84vhjlVJv7bTwAsmW7MjL9cG78
         HGtTiUPWBsrDQUQBUa4hE7rZ14fnx/YWT3Yf6kPwDvziEFJXCxhMcHJvGTOXxSEIns2B
         gw0PxF8+nOILCl+Zpkk6IcRzispQVxLBD7NUUO8KVbPZE7khGKLnsTH0AXtzMqK2ycDe
         vlHU3d9SOM99ag3k6eGkG374290821844yi0IaXMjPw5hbp0ykj3v4lPo47EjPsJrq/C
         G7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DW/b1bKpoxKOxPcUmgpPPo3BGGNeSPggRjC6qLXL/Xo=;
        b=PaSSUs0sq3zKehyWvpzAMXcOhIGxpxKeXjzl8PxJGnpH+XvuXHIxSQjFlGyL2AiK7B
         7DDRTv9gW35b1teQOSXgbquZM1a0FXBTK3nwUI4g/6sxE2RVzDqSVmOUX8LnlcI6njMR
         tqkFb7Lp8jLPpXZBFGK5CkTngUR8zrZlMabcP+rjyauOMcN0VpbGV/Y/lyMq8T0gJgue
         1KQwuLyylKbayYgA975vpF8TTBJ29F8n9jSc4qkB12OTqL2u+0UCeygX+rUby6fVJMEd
         j6B/nKAHh6IkKzA/DoF4M/IiXe4cDAyppXwAOy59zIM9qCv4E3uiGj56x3vHtmjkaqoy
         xSsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zJTK/fDU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u28-20020a37ab1c000000b0074873e00decsi8901149qke.387.2023.04.25.12.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:43:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zJTK/fDU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOX2-0001gm-TQ; Tue, 25 Apr 2023 15:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOX0-0001cs-AK
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:40:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOWw-000789-GQ
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:40:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so127462835e9.1
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451649; x=1685043649;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DW/b1bKpoxKOxPcUmgpPPo3BGGNeSPggRjC6qLXL/Xo=;
 b=zJTK/fDUQW38JbdmCNk7ZqnB9X26zJoro5dlBmwZxpmwXH+Jaga/SanbpBimJCq9VA
 tkyC98UaJN1VElJRv13Ph1/xsKzKHiGbwO8jshsJm+t5BOqh4/QAfU3cORumCzs6kwVz
 J3kE5OF5Gv2gUPy3SjHOb6XjI+s6p06SBYTe81bD2qMPGpmuF7nc4N2BLokQAibSp/i4
 NcNnDDGyPVWI7bD2ZdgPmXjBzlTL28hFbU4jTRVGHXS3+ldIUsWazNc5/3cmGeQod90u
 fTXScTk3kgYIq1hFKCWro1TbRH6DS7C/V2Y4pvx1uO7H3sxhf62HoMzRRU2kuBDzJNJE
 dnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451649; x=1685043649;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DW/b1bKpoxKOxPcUmgpPPo3BGGNeSPggRjC6qLXL/Xo=;
 b=WnjOuEVkTCjvQxKIS/6wfWK6sPiTGOTOzcDonwyaDkS2wu0lLaGmjsOkcLzIKzj3Iv
 WPU4IGb7CHsWEsxOfvAhjaXjIwrEc8RIy1jq2RbzG9YZ5IxLhDuHz9IeonItSWusEiEw
 7IXOMc0cgiN4mIyLVv+8u/UJDil3ImI41E+oxttf5rqCm1lcEqKgkK7XjdTkK2B1u7J3
 JIaw9sOHAZS1v8rRhnACxc+KiMfLZA4Cp1fqYRJNkqNaHjduBGNGwFpzk7emeD4XYYZr
 hBo9V31q/T5hkAHXQX1XhI8bNK4was7ks+GciC8lKddEstOAbuFzopE58pB2IR3tuqx5
 L0LQ==
X-Gm-Message-State: AC+VfDzhzRJmZCIfpudV4Vs1evzr0f0tIKZcg4kz3sl3Ot1lNOVZncFD
 cST9PFQ3TuMfcVU2zbc8iUD/qw==
X-Received: by 2002:a05:600c:2214:b0:3f1:6880:3308 with SMTP id
 z20-20020a05600c221400b003f168803308mr43787wml.1.1682451649022; 
 Tue, 25 Apr 2023 12:40:49 -0700 (PDT)
Received: from [192.168.180.175] (153.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.153]) by smtp.gmail.com with ESMTPSA id
 n12-20020a7bc5cc000000b003f17329f7f2sm15791193wmk.38.2023.04.25.12.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 12:40:48 -0700 (PDT)
Message-ID: <a4c07ff2-68d0-da68-015d-445531a3706f@linaro.org>
Date: Tue, 25 Apr 2023 20:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 01/57] tcg/loongarch64: Conditionalize
 tcg_out_exts_i32_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1T+NLi8VD2co

On 24/4/23 07:40, Richard Henderson wrote:
> Since TCG_TYPE_I32 values are kept sign-extended in registers,
> via ".w" instructions, we need not extend if the register matches.
> This is already relied upon by comparisons.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

