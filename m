Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1446641ejm;
        Fri, 21 Apr 2023 15:27:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350bCY26VEjd4iOKCUJfItaHCD+1MFFC/k9FXSm+qb+N3vUql4TOGaal5FyMnG2uw5KuiRwu7
X-Received: by 2002:ac8:5b93:0:b0:3ef:57f8:843a with SMTP id a19-20020ac85b93000000b003ef57f8843amr12542320qta.4.1682116076581;
        Fri, 21 Apr 2023 15:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682116076; cv=none;
        d=google.com; s=arc-20160816;
        b=FQ+mikxXd3Ce5TvW3UVee0q4IW64kDh5niebSee2IijNzle6sWlpW4JREcD0D3gSwK
         692CKXuKLgzhH/q+WOWSr0gdbYiHuktxKn83UDDydZqK24wZ00LlWMnv5moV2yR3bK/P
         RvPUs9Ne1jQN1/JyNYOrq1PKvM32TT6kdoWVDu0rga9DlezQqSaln8bkHSo+p2HhEVIN
         CIW8OGPQSGIdHbecTamPEl/HUBsUVpAvZpE50xRgZUuq2qQe/sGi6UU499A9XrD8h3UW
         n0TPKPiBt/RS1vGMpT795lCEL624ypiTBjfrEQcgYb1xEd3oVcaGQI+xVFtncL5om6ql
         s0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Vr5k4WBppnj/g5sjUeWylK3sZwLJaOU2u5rkcMVfzfI=;
        b=cUh9TzMfo3KLtr7MD60knEqq+9LN7SeTEaUMegnxFVGua9SGtbw6R5CNtAyH5f03nm
         AFoPzZUvEbTG9iFhTudQKyLZpV4KkBvQGKfhwI75emwovzlTn8QqhdBbEKU/jv+aCH/B
         3b7buSIBhMhYHKJnfCi16d2RZqmXVsjE1LAHsvenJrnqhavcCYiRCKcQQbTtpZ7xy/CX
         QdwgUIdo9/rmlFdFjYSI0wlAF/PVXdKXw3iwOIQ2k7z3j+8vA66YyKns4O6kylTlGtV2
         IPfdUwVHJMzlN8iDPOqXT382IpCaHifSZDn3gW4HwxjoQZ9S5dC2HEpdeXUwAHseO+72
         7JXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dvvRDve0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020ac87dc9000000b003e6f2e0001asi3757912qte.119.2023.04.21.15.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dvvRDve0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppzE7-0001UW-ML; Fri, 21 Apr 2023 18:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzE6-0001Tg-2z
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:27:34 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzE3-0005sU-72
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:27:33 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f182d745deso22777585e9.0
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 15:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116046; x=1684708046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vr5k4WBppnj/g5sjUeWylK3sZwLJaOU2u5rkcMVfzfI=;
 b=dvvRDve06C7cAoEKJDQCkoCX2/Dnh2RiJB+V/U1kjrW36xYWBlR81/VKHKnKubU70A
 bbuH/wMCcnabVSrQzwMEfXg4Y15FVws5Bm24KuTsVakiXa7hHGv1NkevEjQfMsEfJYlH
 +FwiUmhQR22p6NAsUtg/2jGmdHdoW1obwNaqIo6BBl9vM6HabM1NZ9XuSKqBdnX9tM4U
 FVm9uo6ZhVc3FI/2SkZw967S8F7XsfiKDJiXJsLB9kdr4iCtp9P44ILO08Be9Z30Inoz
 Op1uoVkmqwDKdN/q01NJBMrD9XlvihIdxkkQbrHdD40N0WLCEWvh1qCfa/tXNLEp/RYp
 VT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116046; x=1684708046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vr5k4WBppnj/g5sjUeWylK3sZwLJaOU2u5rkcMVfzfI=;
 b=JWyP+eFQFFJQDPS7shtw+CG6P7/Fnu31du4BA3m1ahW3xDSM2D4BXgSmXmYiJE6NCH
 j12+1qvgLk+GUcHhpbGY3qV4XIpPTZAol8boXdGdmj5WTHYeElZmPw3cfzOcL5Bo45Rz
 rBvtL4TdceKlpy0CRJhHx2GXf/UTdcNkm5AFK0q/SeKD+2fp/pmS7Zq8BFiYn5y68Qdj
 UQZggPj971BcK4PkXPeOum0+24PAFJ41bYDTF6p72rW7n7WWvLINxyV9vtbuBai0BH1i
 oYWxFygYS9CIdeL2KZuF5r3edceQ6lXXOKYEPyHvgjeQ0/lXVBVGlgQxh+tYWgQhMbVe
 J9XA==
X-Gm-Message-State: AAQBX9dalWckshOg8d2Mwrs8iLySGJmbwCVm8w6+PcL54nB+ILScPS5f
 Fxl+zi/XYIf02cuI9yroNOJNMg==
X-Received: by 2002:a1c:7716:0:b0:3ef:622c:26d3 with SMTP id
 t22-20020a1c7716000000b003ef622c26d3mr2978568wmi.35.1682116046417; 
 Fri, 21 Apr 2023 15:27:26 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c365500b003f182a10106sm5980830wmq.8.2023.04.21.15.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:27:25 -0700 (PDT)
Message-ID: <55fd7446-6cc6-61bf-e0ab-4b2498e78398@linaro.org>
Date: Sat, 22 Apr 2023 00:27:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 29/54] tcg/sparc64: Drop is_64 test from
 tcg_out_qemu_ld data return
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-TUID: kozQe2/GxoMY

On 11/4/23 03:04, Richard Henderson wrote:
> In tcg_canonicalize_memop, we remove MO_SIGN from MO_32 operations
> with TCG_TYPE_I32.  Thus this is never set.  We already have an
> identical test just above which does not include is_64
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/sparc64/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

