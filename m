Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D6BE69162
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Dec 2025 19:50:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vXluP-0000ZY-M1; Mon, 22 Dec 2025 14:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXluL-0000Vo-Bo
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 14:49:29 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXluJ-0004v7-U3
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 14:49:29 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7a9c64dfa8aso3305027b3a.3
 for <qemu-arm@nongnu.org>; Mon, 22 Dec 2025 11:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766432966; x=1767037766; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OUByJqppgHmu8mlgHK3WFtMhphoa+2LsZHl9xNgNfPM=;
 b=XE7G7+/fftJVULnRfFBnJXu3v6ewDYL/q1WO4E1bW/bsSVybrTISBAf+yp0VKdL/PN
 hfahOmPkew/hPTpbiX/WKhSPKgnOzeHjFcXb7XsIdlCPHGdZ9nPZ1z/9EFPNDOI1+p25
 aLWPTsh9uyn1nDVy+TWh9h2lWdsgkUNYg+Nk2rgTN8NrM+D9ZpILbL5GWhGddl72YLjz
 vFpEA03EjTJPCfA+K0i/fhCNOO6Pqp45NLpYGw9VvMkOyq8AhOYxqxlk7+ARU7DHJjyx
 sn8rIjKPKJhRBrczYyQfJcWT/UVktO+ohECX5sPBSxj8F5te+P8gNaJQ53jKE5fJSAtR
 bxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766432966; x=1767037766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OUByJqppgHmu8mlgHK3WFtMhphoa+2LsZHl9xNgNfPM=;
 b=X7uT3ZrRiXRCt5kvzeKccG4kStv5oAARQuFpoS/rLAGxxlmXIWe6NIpXezyhl7hdzY
 RtJ/QVNhYklSfw4JzQUD0WZ+hVAyUjVHHJtxKWcN8mekFTeMC39X5/+EU1g/2G89h4jX
 5t5bokFp64TNQkbzH+OAv0PaNffL7ndAdSxv2oGGzjYFmMrqJboGrQyULQ63RxNr6BAB
 sw2YGKawcbE4K/mVzh+RZARUKO0WLY/adB0QAo7/K6LY9AdoSnXn0ih1Ep2dt5DvGj6p
 c21T6d5I6JLigyVkyomaOTCceyYSnl0+xp93mAkCNW8wGJIF+AYQTjot/bhzhO4516nY
 /akw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXCxg4g9+x2qDrjE0o0sIhka1FII9UtaeokbNn4kxTVDZ5Usz+PeyiO14v+/92AUqicnvicUq61w==@nongnu.org
X-Gm-Message-State: AOJu0YxRlM6MSiCMn+5IEj4Hs+16AwPUYELxqv4YGK2f63QXiFhHy4f1
 lLyBIZHXFbc/8HnG+Aja7MaNRzci11LP5fZD631j6hjscdH1KBIb2uu0hz3yRvnoKLs=
X-Gm-Gg: AY/fxX5etdAHsHXQ7Ad5kcJ4PA6YZeugSuxWgGxxdVK8x0hlQL2s/z3YfMceCovLi/x
 XCu9c06bA8ZCKdj6D6OM+YPA2XA2ehdi+J71iwDNavxUNKrAdZsjtrnNqrdKVIX5gf5JECxYev9
 ad5h4FUXSJlkTEV3QgA6DcvXB/5auk0HjBP+IRyb3HLtv3D0sL+qFWoirB/rZdWJAliLjHBVG/o
 TlXIbVxhDoG6ngOLSmTXELemxpB+jjTqnel2u8zYC3Ng/A5ksTIOi02zcNP80bI1YHDid1cst6m
 c00CdS62VSq1/rT8L2038L313sy2NXd4byzol7jdbXAmv38qBGEuq/lKU9Nmw+YBe/2Yd/KcMUj
 wWSJzouWJruG59SY6tR2PPvAPKB6uaI0ISnGzX73h+EZky96Md7mqYmNeh+DE2vpzGlGE5Jjidv
 PXUXi3A9QwToK848I0UO9nHhRk9//q2sK/EFRecHWLXyxRgqGOjM0kKso=
X-Google-Smtp-Source: AGHT+IHWFaCz1KZu5HFruL5RmR9v9Ex37XIzjVV8H6ceK5eaVIL5OKCl/z2d9reLLUVr8cjgkUMoYA==
X-Received: by 2002:a05:6a00:4192:b0:7e8:43f5:bd40 with SMTP id
 d2e1a72fcca58-7ff66d5ff50mr10547360b3a.44.1766432966307; 
 Mon, 22 Dec 2025 11:49:26 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e197f9asm11085974b3a.43.2025.12.22.11.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 11:49:25 -0800 (PST)
Message-ID: <31960503-659e-4e40-b30c-9d74d4fd77d2@linaro.org>
Date: Mon, 22 Dec 2025 11:49:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/12] contrib/plugins: add systrace plugin for
 tracking exceptions and irqs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alwalid Salama <asalama@qti.qualcomm.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mark Burton
 <mburton@qti.qualcomm.com>, Laurent Vivier <laurent@vivier.eu>,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20251219190849.238323-1-alex.bennee@linaro.org>
 <20251219190849.238323-12-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251219190849.238323-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x436.google.com
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

On 12/19/25 11:08 AM, Alex Bennée wrote:
> I'm hunting for lost IRQs and want to trace what various registers are
> being set to when IRQs happen. This combines the discontinuity
> tracking API with register value tracking to do so.
> 
> It supports:
> 
>    tracksw - to keep track of the last thing that wrote to a register
>    show_frompc - show the line executing before the discontinuity
> 
> As we might not have disassembly for the nominal last pc for an async
> IRQ we also track the pc of the last executed instruction in a block
> and use that as a fallback.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   contrib/plugins/systrace.c  | 572 ++++++++++++++++++++++++++++++++++++
>   contrib/plugins/meson.build |   2 +-
>   2 files changed, 573 insertions(+), 1 deletion(-)
>   create mode 100644 contrib/plugins/systrace.c
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


