Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2725173ejc;
        Wed, 13 Mar 2024 14:09:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCoLsk+gtBXquRqsrlPOT+rfD1ebvy2ppxYvju3qjBz8UegcBEz22mNrgjSZcbQegVz0tNcx4Xo1lHZ2h9nqDwbTj8HQyZ
X-Google-Smtp-Source: AGHT+IHyacKCgqFHEiEXxf1o4FllEYWh7/kf4Ts1f59BI8NZLEhEI3U0z5BVgTf4d2ZLhgvqfoAp
X-Received: by 2002:a05:6000:100b:b0:33e:8a43:3258 with SMTP id a11-20020a056000100b00b0033e8a433258mr2790985wrx.69.1710364157827;
        Wed, 13 Mar 2024 14:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710364157; cv=none;
        d=google.com; s=arc-20160816;
        b=ZZTrUg/wsNqDQa23uhgeyWWVr9MdkNR+2VKWAHnpUk4TGA59I7awahOha66PP4JbxS
         0Y1Y835nbZYqVKcJNi2D6hUACM3pRJPb7ENvEzvZQVJZndKhUc7QAx9CwHRQtbpsiYvc
         MR3mVXjDiOnMj7WuO1C3uwqdCSdrLN3c0dYKOtPNYro+C8+Js5r4ymFcXsAVOGQD801/
         2GkPqwFXXA7AK6Ej8myU44f0m4yOnpHcGZregyY0u4/VQP/bs93cbzAeVaET4AUXbZjw
         p2GhZ9v7uYvPYAjxoFCfgl135LlXuvE+7iYMKgongLCOu58A0VopiNdkFOblxR7B+nqR
         xu/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kZO2F579L73KdcFyYgfeqSFrDYkw93kuImSXcRMRU40=;
        fh=8V58DoJKHjuBakH6sjqtwlrR1XuMsCEJxJ1d26MYhPw=;
        b=0Xkze/g8FcLOu1smBKnxuKpGCBV2C94D06qNdbgAjdwR2bDW4OmpdYXPh7rUfESO/B
         6GkBqxZgVKcTYzuunUZllWMiIEMSn2rZZHNaAksF1epZ6gCAB3TRZUT3sXjHiHmdAlt1
         epeFm1y6pyKBK4f9IyNwJHvtylcVQPF66FdsiHFJ7vDF95M/aJy5WHtVT8R0o8SlWsQ+
         XtyvzXbExGI1ldY0kwRB/OydF6b4fw51ojp2wHchXINjMNUvGYl+JQFX8DBjlnF0eqAp
         RAuzLl/aQo1xeMHGqjMTP6vKg6eTPoh2/UiSvehV335bskgwfZJdDZORV+M21n956GHz
         1ivQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i8VerVd3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26-20020adf9bda000000b0033df6e25d7esi25170wrc.27.2024.03.13.14.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 14:09:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i8VerVd3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkVqb-0000RF-Jb; Wed, 13 Mar 2024 17:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rkVqa-0000Lz-Hb
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 17:09:12 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rkVqW-0003Ii-PP
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 17:09:11 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-29c71c6e20cso283242a91.2
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 14:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710364146; x=1710968946; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kZO2F579L73KdcFyYgfeqSFrDYkw93kuImSXcRMRU40=;
 b=i8VerVd3utqe+upL3paKifaT6+BUJKRiLpFJs97QEiu5nZFs6S/dlYbEG530dgd+4m
 S6JzButbQE2pIQDzIqR6EuQ1hxHaNYFZ9THhKos5lAx0yY/VOBp0ixWDa0VG1K1mjCzA
 a68YFUBxLmd9uL5anLbajHKAudw8arqPthNTUWC+KtAEI4KkUgyZs+REoMQBEtWqZcnW
 K7xqHS29JKQmGyjauOjgXrowIzE806hVGhbNxSSJ4gjKBweQyoF1KE9BPbzNtZx0bBtt
 klUpXIQx3Q49xof466oMfClhhnHYu2L03fX7Vph2uQd4jIftJLpV8Fi2rk91QOXqbmnE
 6l2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710364146; x=1710968946;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kZO2F579L73KdcFyYgfeqSFrDYkw93kuImSXcRMRU40=;
 b=XHff89WMz7FfAw/rNZe//cdaNafvzNdOPD+MOm8X6h6lWw3LbspwpFaexFV49QawvD
 PxS9eL8vAr/+B+DXDEUqwx/qGEaov9fOIqjMNdU1WCCXaho5kURGi+F6y8nlsT8zTJEp
 Ko8+OBIr4utZ7RpY3v0uN49oV1SPZlIjTVz/xiHbCTUzmDFefYV/lWG4YhKxWyLj29U8
 urJ7hisMg04Fhk5BTxXDx/ybVcweeGWM8zKgUb2/VTitrZadRpAQWKEJE0DLB06aj4Df
 yRZaYne5oIbROrJsDhQR14YPPPP7DHSqCalWm1sS20o9SyRVl+nEA+Zj2pS79wV0oesE
 YB8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVInqbHvx/+ci3/1HCsDQ/aDiV1+QLlFCyJgGg7QZjjDEsU9ytxAU30+kK+W0OoSeXsfBwcCibhQW7Gfv06+aCinMje
X-Gm-Message-State: AOJu0YxhguObEKfrlMAzTALKmbBmBdl+dTyKT7FqZOOxbfB/HIG9d1cy
 /xjQKGeBFRZwqsdZ5kf1XmSAlu/7hsbxbSDQ4PF9rv44+vZgJ9ljTsg3sFAXseo=
X-Received: by 2002:a17:90a:f417:b0:299:a69:1f8b with SMTP id
 ch23-20020a17090af41700b002990a691f8bmr12032165pjb.23.1710364146529; 
 Wed, 13 Mar 2024 14:09:06 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 qc12-20020a17090b288c00b0029bad32fe5csm81470pjb.16.2024.03.13.14.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 14:09:06 -0700 (PDT)
Message-ID: <ed68d95d-7eee-40ab-b5f4-0030b0650108@linaro.org>
Date: Wed, 13 Mar 2024 11:09:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 4/4] meson: Enable -Wstatic-in-inline
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 John Snow <jsnow@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Eric Auger <eric.auger@redhat.com>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240313184954.42513-1-philmd@linaro.org>
 <20240313184954.42513-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240313184954.42513-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 58dbDPVlNVyg

On 3/13/24 08:49, Philippe Mathieu-Daudé wrote:
> Compilers are clever enough to inline code when necessary.
> 
> The only case we accept an inline function is static in
> header (we use C, not C++).
> 
> Add the -Wstatic-in-inline CPPFLAG to prevent public and
> inline function to be added in the code base.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   meson.build | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
