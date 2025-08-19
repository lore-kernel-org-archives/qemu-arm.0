Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9A4CA0EE6
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 15:04:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoNsw-0002MG-Tt; Tue, 19 Aug 2025 11:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoNsv-0002KL-4i
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 11:04:25 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoNst-0003JU-0k
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 11:04:24 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e934bcb7623so2003719276.1
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 08:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755615862; x=1756220662; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IGfn9RS1Bu04ZR6L8dA94ph9BmQBYpiMXe5Y+YWdxlI=;
 b=mESmMqyVKD/1+tarjAXZNI1NeYLA7xfhFVKGVC8R8R7g2UUBRuqvw6edx7eBxGVXWa
 ayAkWwF4msiGS+DQ5f5UtX5LKZeUOg4gdHcNgGRSW7gILVbbpRjAkQLNclxTGc2uWObg
 cUoRydw9nHn26u+FAICgpvD5bmPbUSpIMFtYLNUU4aePYOgMdlhrqmGXnMEc5GY+CmR3
 /McfEoEsl6z0AMSKELBpvtdG3tmFzlbxMPx/otB/Nn75yn/oezDK9bDQDZol1hlBW4+K
 UAzfXGSiN9CZf70hO5LCE+yxhp71fqvYvyqPDfY5uo9mC9HeudnIyx0NyW4sKgihPZ3U
 xeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755615862; x=1756220662;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IGfn9RS1Bu04ZR6L8dA94ph9BmQBYpiMXe5Y+YWdxlI=;
 b=bYUPFv2fXlxQOdF7V6nf53Dw/IoEIc4b7HDtvIOohuDwl2weFNA5PUFcR/GAyAVikP
 nO7Uy4MzadGTwYkSKEZNU43fPdGvoLb69cOJvlOrO3JYqgo0GcJuvRibP+pMkeGAz8UF
 jTMdaccusRSXkMd6adV3xNm20AtTjkES0fLe2vVM0hYRl6L4cvp6MEQnO0OU3bWxNXZh
 zHamy6Q/QVj3Ib1GCqV3slAd1qXBqEaRYHupmcR67vFQyFpKOjNVEWnDW88Q3W4aVWU7
 zsAKiGa7Rc4LiTEDa57t1X40Z8ZN8UiP3F60XS1+Tz1grWYmDlPr2DeAWikLyJd7Xxj7
 Gx+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCViZZclzKdCQCwqrT6Ey4J5noBJ72369djSibPr9MBXssyfOZ+BV/pDNG0h042DO5dRzOmMV2+FQA==@nongnu.org
X-Gm-Message-State: AOJu0YyjHs1r3VmMxw5Sof/x62Erhc7zhUWT+xE/I+mcWqeqcM41z310
 l695zdQK9e3p4LUxKr5JvCMXEzgsjqIopd8Abs3M8d6+d/EEa6iltGJZzHyen435IZJtZh7AmKw
 /crdiM59CBspc2POGJ/an5ENT4Lci155fUL7hH6zs8w==
X-Gm-Gg: ASbGncvFEsDUBZiYvO/cLdlkj04qmBgMDhmlwDS2NyaqwnY/jxv5Z5oMtNfatQBnO/8
 exgN2wl7xmvDnSjdeTBRaQ+hn3L97byQcK0jq1uZ1xSHUrOXOUL0Z85DyE/unWu1DWO51DLIZNW
 +GhDrQtmU8BGnCtIzjLuD1/ycz2PIECN2FPVZ4l3MfiD89PpJRINc1zFfbjh1n7LEEvBFLyHV12
 GctvrORqgQyGr2NQ1Q=
X-Google-Smtp-Source: AGHT+IH9GLN3G7YILzmKcSzrFNCNy/Oe5I0Z0zjCrMTijTBTrUzhcs0i5wnIdGLCPRBVDpnJ+gyyiWxEXHaK7dxZskM=
X-Received: by 2002:a05:6902:154d:b0:e93:47b2:752 with SMTP id
 3f1490d57ef6-e94e62a4c16mr3666207276.34.1755615861581; Tue, 19 Aug 2025
 08:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250808065419.47415-1-mohamed@unpredictable.fr>
 <20250808065419.47415-9-mohamed@unpredictable.fr>
In-Reply-To: <20250808065419.47415-9-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Aug 2025 16:04:09 +0100
X-Gm-Features: Ac12FXzSBe1DHLCX_ytlkJ9BuV9ZQ4rc-mxnEGrgfcl1f9gTnywcpZ_XiLR_gmA
Message-ID: <CAFEAcA_ZokV90NRuWY7PGgk_Jwh-ZfZfNO+Ubss0F8AWDBTwoQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/18] whpx: interrupt controller support
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Ani Sinha <anisinha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, 
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, 
 Yanan Wang <wangyanan55@huawei.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Fri, 8 Aug 2025 at 07:54, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


> +static void whpx_gicv3_put_cpu(CPUState *cpu_state, run_on_cpu_data arg)
> +{
> +}
> +
> +static void whpx_gicv3_put(GICv3State *s)
> +{
> +    int ncpu;
> +
> +    whpx_gicv3_check(s);
> +
> +    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
> +        run_on_cpu_data data;
> +        data.host_ptr = &s->cpu[ncpu];
> +        run_on_cpu(s->cpu[ncpu].cpu, whpx_gicv3_put_cpu, data);
> +    }

Why are we calling run_on_cpu() and telling it to do nothing?

Also, run_on_cpu() implicitly drops the big kernel lock --
I'm not sure that is valid to do from the pre-save/post-load
routines or in a reset handler.

thanks
-- PMM

