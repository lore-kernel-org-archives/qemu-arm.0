Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65178E776EA
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 17:06:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYSJM-0007zM-8F; Wed, 24 Dec 2025 12:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vYSJL-0007z2-69
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 12:06:07 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vYSJH-0007fJ-Gq
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 12:06:06 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7b89c1ce9easo6946312b3a.2
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766595960; x=1767200760; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hRfUgC286zP4KC4X48668Y7WkN+9DMmlhFc/d5D2AxM=;
 b=s9Et5pA760yVf2o74yLg7aOTeioJ/scvJrT9pF8JwKXy5sU72HYPsGGjIDm35Dee21
 lckJ0JiEjfrMXs7uVEQ3KGzNRe4nRTxr8N8KlwqTs02zDbRJOENSuV43cpcN2GHVf4n/
 OVCYPDkjMN5iQIwOPkmhPJYxv6QsYPYDXFl+9NV3OI5N8f94PPEV99Mrgiy6jVz74BX+
 LOpctdLk6FbGKb3/kAA+lsMNOOJIkRroUH5JJPOe3401mONDE0G1Q9vK13jk7f64FigA
 t+IcRLd1teoIt3ObHJTge9pX9sUVmGtq8zn5mnSTbYrcpgohpvXWF0LhX/0uDjvKsKPX
 UNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766595960; x=1767200760;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hRfUgC286zP4KC4X48668Y7WkN+9DMmlhFc/d5D2AxM=;
 b=wlr8K7BvufFhJyzIWA5aRmb5+9eYVBLHqr4di0q+xnMuCjOwI1v6amaAELAvrLwqDJ
 N4MZ2QsfmwUMCDryQDakZK2XQ+iBXXZChWgiVb9yZIJkZttMK0T8lnmqVYMzvMIFHsC6
 xOkPPWsDWbuV9S7eeAaiItipA2aJquhkpbnapeMP2xRKMU7t5tR9lqb7fPUIAR9Rktg9
 IDIEybtNEqkaQ1KEC38GIT6DLPa2BGbbfYtO0G5RmxethwHYBmfNe/Jcti4IkZ0krMK5
 2s04ypFCB0gbROq60GpAkup4TZvSMQWMAB+AoSt0uUnOKbCMAzulMpPXjMtE9cA9CT2X
 svwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUibqnylPRT9+KpQrP3qTYuEFpVICnY9n00NBv+LH4sW/wk2up7Q6cj6hceIKaud2ixD0lKqEEsXg==@nongnu.org
X-Gm-Message-State: AOJu0YycFAENBxDbaeT3KM4ip1xO7hdeS/IOZKo5dZqnd7unPLTY5uj+
 4O21Iuv82W4vbPVwDIR9Y1V4reJN4JiMdYGa/8IpDNvEA4Tx9+tnqnoC9nSo9k7ZViA=
X-Gm-Gg: AY/fxX4JYWRytX35x4Sq6bn+prsFnzwmu1uJqhzLPmHUpJNPN4sLTpXuDBXI7fhFiS1
 /30YLOTPrUmzsMhMkpkacoURCob5B2F72SgVzE6kl+ZFHuTrHbhMQobR+PYcEbvWmU/UtN03cJd
 JkIGW935q3dlTCMOW6QkTXIlndADCnvLOiGxLZOi4VnDS0TcgumnUA8eK/Sqc8reM6kRH15+IEh
 ARKiWcYeQRmaHfvHIWovRXZxKPCk/zJ1SesYwvf0JOvbRSnHfiF2Ww0WuLRS0ar8OeBFgkmD79d
 rPU90167ncdInCCZDJr6DfWUYEVMhD1gHZRUsVUonaAuDKG/R/0XfCatps/iROv++6q+dj0ebOL
 ifA+vnmqSvd1VsnfenehfPaicB9kJRXQXzOZ2jpGFfyRKWJwMFgclti8wpCABn4Et43cpeIFUMb
 kvOPkVImNOarOoU3OuWtvN58m4Qb386uGHsmFnziOOEzIFW1z4Gt6wCHI=
X-Google-Smtp-Source: AGHT+IEedNVivCQ8TmVkNXSCz29IJvFWoLh9QzZqQer40LaOzyX2k4/UuauK8h8ocKMm1xhDnnCF7g==
X-Received: by 2002:a05:6a20:3ca6:b0:33e:eb7a:4465 with SMTP id
 adf61e73a8af0-376a8eb7155mr15568344637.22.1766595959436; 
 Wed, 24 Dec 2025 09:05:59 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm15836548a12.16.2025.12.24.09.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Dec 2025 09:05:58 -0800 (PST)
Message-ID: <473feae0-81a3-48b4-8f1b-cc51c94e41ea@linaro.org>
Date: Wed, 24 Dec 2025 09:05:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 2/7] hw/arm/smmuv3-common: Define STE/CD fields via
 registerfields
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251224034647.2596434-1-tangtao1634@phytium.com.cn>
 <20251224034647.2596434-3-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251224034647.2596434-3-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42f.google.com
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

On 12/23/25 7:46 PM, Tao Tang wrote:
> Switch STE/CD bitfield definitions and accessors to the
> 'hw/registerfields.h' REG/FIELD API.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   include/hw/arm/smmuv3-common.h | 169 +++++++++++++++++++++++----------
>   1 file changed, 120 insertions(+), 49 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


