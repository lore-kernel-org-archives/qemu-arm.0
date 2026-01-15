Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B117ED46600
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 17:32:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgRD4-0005VS-Bh; Thu, 15 Jan 2026 12:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vgRD2-0005U1-Bp
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 12:32:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vgRD0-0004cA-Ff
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 12:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768498350;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LttDJVM+2ACjrkyMP76zqD9alqtTU48uei/jzftems8=;
 b=Nyg/39z8HoZaHALvc3FGYu5BoymmHrt0WAN+Wu11rI+8fL+aSF+FKNIuEf94KShlYrzYOJ
 ZxBrp2ThvwQTcdqe7Ff7aRzJjVqWXnUXB72Zvzg8Zf7V7svXB2BOlrEPn4rkn6hJZjjeOr
 HJY0gjgWsFJTw0120kNKBXkAsGxbieg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-D-HfRltbNgqGpipy3yBN6w-1; Thu, 15 Jan 2026 12:32:29 -0500
X-MC-Unique: D-HfRltbNgqGpipy3yBN6w-1
X-Mimecast-MFC-AGG-ID: D-HfRltbNgqGpipy3yBN6w_1768498348
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-477cf2230c8so10429265e9.0
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 09:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768498348; x=1769103148;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LttDJVM+2ACjrkyMP76zqD9alqtTU48uei/jzftems8=;
 b=goHRA7mZhknScXnggYutGEQmIw2fKJAsOxBhflnVZBEdLybHUxfdwJ4SufWHFWJNd2
 sqCKegbdomy2gNH/UGvnMlewY4+9EqTrrcK5z7XhmZ7/b19VU62U+4m74ykIqydoNu/D
 5jakzdmlp0bjeN2axsR8tteutHC27ZjMYvKqwChl+NaP9sS4Dq7pvrdN4DWskGYWc7hO
 XeRhMdL2SGK88ZiBPqFkrbh+uJ8wowsZUOVh5sssHmzgLAuZ8ClaP5/qh/hukFtTHSVo
 qbi5IDtLJUNoF1JPi4uzUNA8g0COLJ+lNRrJtQgaW0Fr8pqSr48Ihnj/+Ckv3E2D2L+0
 l57w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcCDAhKzIbTufrZNOdauaLOfypfIplHx8T1pW6fvZTzH6nPCLtWHKTaW88o2xjrgBsioixrloOzw==@nongnu.org
X-Gm-Message-State: AOJu0Yw0LRk8h+4G0F4pDBg4CRoE9Aso+pNDe9qyoGECWJOHHcMaYEXd
 lVhk3iZF9h3A8QXnEuDE9kdX9lUxRoYBtB9wXZChqg7TsU1IqJvF/M/VVMr9pSafruEyUxLcpmh
 Bh+QhzIC2SBqMpNZlbqVPNA0sFyEG9+Ni8eIqRF1zWuAymhMDfyn1LQ==
X-Gm-Gg: AY/fxX6Yi3UekiCdE54MxBS2gXLPkyFXtmIdZbV3VoShwjHGNO3wsDkGabXTFnM53fU
 NJzHw3fGDbSU8qeOv7ed69SeqwtPJB6W6TeaDBQDts6/hFsyW2QVQZa8mZcInY3iEnde/xPjvT6
 W+GECELg50ntxZSs8rJuLSxn5hv6SUN+rCBk8cOTxQrPJyzKoxRQK91lsxypH5ZSJEN3dhVyfpt
 0NhK+Wp9eyft70GahU5yLdm5dYBIkq2WDkxT8M7l3LIRzAdNmQDRPhvcy+e/8RLty0AExZFjI9G
 sB5TPtcwBXeP0XyY6n7cmYwW+mV9NH55zH6OdKEQ2Bl1QYF65K+SFnFqWWd43UcRisdZxyEZOtL
 6eOMiJtJ8Pj8UAteVWp7yVJ83CusGJvEJa2ogEFIdP/xMBFLxNpfLmqH9ZA==
X-Received: by 2002:a05:600c:1994:b0:477:9814:6882 with SMTP id
 5b1f17b1804b1-4801e2fdd2cmr6661915e9.5.1768498348273; 
 Thu, 15 Jan 2026 09:32:28 -0800 (PST)
X-Received: by 2002:a05:600c:1994:b0:477:9814:6882 with SMTP id
 5b1f17b1804b1-4801e2fdd2cmr6661585e9.5.1768498347881; 
 Thu, 15 Jan 2026 09:32:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428bb0b5sm57423555e9.8.2026.01.15.09.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 09:32:27 -0800 (PST)
Message-ID: <212e3a9e-b8e9-4252-8197-617d057a3e02@redhat.com>
Date: Thu, 15 Jan 2026 18:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 4/7] hw/arm/smmuv3-common: Add NSCFG bit definition for CD
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251224034647.2596434-1-tangtao1634@phytium.com.cn>
 <20251224034647.2596434-5-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251224034647.2596434-5-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gxh8460Mhh93i6K47ls_T22WMrNKfBdN_W0zeRkJLFg_1768498348
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 12/24/25 4:46 AM, Tao Tang wrote:
> Add NSCFG bit definition for CD structure. This allows proper
> configuration of non-secure access settings in CD.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/hw/arm/smmuv3-common.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/hw/arm/smmuv3-common.h b/include/hw/arm/smmuv3-common.h
> index b6da2fd62c..7f7dd02221 100644
> --- a/include/hw/arm/smmuv3-common.h
> +++ b/include/hw/arm/smmuv3-common.h
> @@ -123,11 +123,13 @@ REG32(CD_1, 4)
>      FIELD(CD_1, A, 14, 1)
>      FIELD(CD_1, ASID, 16, 16)
>  REG32(CD_2, 8)
> +    FIELD(CD_2, NSCFG0, 0, 1)
>      FIELD(CD_2, HAD0, 1, 1)
>      FIELD(CD_2, TTB0_LO, 4, 28)
>  REG32(CD_3, 12)
>      FIELD(CD_3, TTB0_HI, 0, 19)
>  REG32(CD_4, 16)
> +    FIELD(CD_4, NSCFG1, 0, 1)
>      FIELD(CD_4, HAD1, 1, 1)
>      FIELD(CD_4, TTB1_LO, 4, 28)
>  REG32(CD_5, 20)
> @@ -155,6 +157,9 @@ REG32(CD_5, 20)
>  #define CD_R(x)          FIELD_EX32((x)->word[1], CD_1, R)
>  #define CD_A(x)          FIELD_EX32((x)->word[1], CD_1, A)
>  #define CD_ASID(x)       FIELD_EX32((x)->word[1], CD_1, ASID)
> +#define CD_NSCFG(x, sel) ((sel) ?                                         \
> +    FIELD_EX32((x)->word[4], CD_4, NSCFG1) :                              \
> +    FIELD_EX32((x)->word[2], CD_2, NSCFG0))
>  #define CD_HAD(x, sel)   ((sel) ?                                         \
>      FIELD_EX32((x)->word[4], CD_4, HAD1) :                                \
>      FIELD_EX32((x)->word[2], CD_2, HAD0))


