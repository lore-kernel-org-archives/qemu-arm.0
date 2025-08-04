Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5BAC87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:42:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj13e-0005w7-Gw; Mon, 04 Aug 2025 15:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj13Z-0005nc-HB
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:41:13 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj13X-00062l-4S
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:41:13 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-76bd2b11f80so3902260b3a.3
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 12:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754336469; x=1754941269; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+oCF8kZBYTaXsxLfd1s5B1BGHhSaSw2fYmcHMILt2c8=;
 b=Vr1p6QYG+bSftZsHAT6v201Vjt6HObfxNTEd9fOl5+e0jIE/vo6f+af1ejp2Hha+l0
 BdFCnV1JQ6WcZoK4rdPem56YJu/xjSJPZFbUVF5Rwgqa26Vsh6MlwPwmMg87auyH1LbA
 evm0Vzla0pdmxHr1wIChNSdmKeMMYTQUqztygiIY+Iqnkq50Hr2g8DMcP5aWSfeTstAs
 NLSBh5j+eruHj1U8W37joxAb2AaTp+JSWDTBfrQtf9iVe1w1XvdbYWaU+7aLOXsdfaFv
 f5IMS9HqmEovK7w6ijXUPEYc7CkBnr6xbiVvYNKJGvR24rOZnTLkm5a8IpDF/cz1kjSu
 cv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754336469; x=1754941269;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+oCF8kZBYTaXsxLfd1s5B1BGHhSaSw2fYmcHMILt2c8=;
 b=o2g1UIjEkSEKZiJBkvAws0RZV8mY3dlbcit2ekE8gnN79KFlpNXW/GJUM7tfS8Y9uK
 WHN47/AX7kPGsHk+t3uEkNPz0uMy8+vod/ebjYpWkXsMXnZ6enUOsYwwa4FX6MwYQeRY
 CgftGQmcsGDnkWDhJECKymzfeA2iv/0NlWFI7NukOKBc+h6ZX9qsK/J3vChyX5PcuaN6
 h+ImU1qfEwwvHdIo/BTSC7lp+er07biro7uLC2/HJ5m4b5bXRZIwATuScvIZ8sBa/4LH
 jk5p1hiirY7jJNuGb5rZtMpp8UdrmhmAMJUbRXWgXYck7/7pctZPdx2KpYOQqKtrLjhA
 fuHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWg+QJBtDhFcsG0/KpgL9igFYk0wAIp/mhZrg357qIW0GBCCzUd/k3/B4UtO1Y9MZrJoymBlhsyw==@nongnu.org
X-Gm-Message-State: AOJu0YwGb11vc1Y2KXxegUmVxNaFahdimgquEZS0o0fDYpgPMkUXKWGA
 Dg3zoSXJLSM5jfvg9cuFBpbYOx+eUf24z4p8STv8qp/KoDa2rV6LRzB57h1rRrkOfnU=
X-Gm-Gg: ASbGncuIKttoColgi4RksFpDc3q7ms1Ylgh1DtsC3y9kpb3xdItpzkh/cXLQLJLOpm4
 27XsWDSWyP+sO0YZWHTMh3OmFNVWiBc/cOo2tehK1wIrrUYMZhc77jVNCuedgJ8fhcJ6ckdU3EH
 3W+GyF6rn/LXGGHK3nFSfRvfZS+h8atGVzOPDCcsFjVW8PkxYRmudJ1yNb3rI6w/TwN6Zyp9BoZ
 inxuuMKMdY9Zb9IGivOcQFLGkBkYkUWVIbWGJZRifU67ZECj5TWoXQ4p3YFxAO6sm2vWWxr4nMt
 TfYXjhaplcEnAiyUI4TIXeKmdVIK2/Kot44UjEJV6pYl94160dQxQP+YmxKSauIlP5bScf8Si2V
 tt0X5vThyW7hWFr+TS1YcRyH0WNw9Ve4n7Uw=
X-Google-Smtp-Source: AGHT+IEhu1561rOBCPzB4HU5kuAsOdtileHG2pUBWcXeTMXNFJ7AfZ/kTb3Yhud8ZN9GCDb7l48EOg==
X-Received: by 2002:a05:6a21:3284:b0:234:c6a0:8a0f with SMTP id
 adf61e73a8af0-23df917e7c7mr15012015637.41.1754336469315; 
 Mon, 04 Aug 2025 12:41:09 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b42306f1de3sm9282299a12.62.2025.08.04.12.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 12:41:08 -0700 (PDT)
Message-ID: <eab1a2fd-3e76-4552-95c6-eb75141a15c1@linaro.org>
Date: Mon, 4 Aug 2025 12:41:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/17] whpx: reshuffle common code
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250804142326.72947-1-mohamed@unpredictable.fr>
 <20250804142326.72947-5-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250804142326.72947-5-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 8/4/25 7:23 AM, Mohamed Mediouni wrote:
> Some code can be shared between x86_64 and arm64 WHPX. Do so as much as reasonable.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   MAINTAINERS                  |   2 +
>   accel/whpx/meson.build       |   1 +
>   accel/whpx/whpx-common.c     | 564 +++++++++++++++++++++++++++++++++++
>   include/system/whpx-all.h    |  20 ++
>   include/system/whpx-common.h |  21 ++
>   target/i386/whpx/whpx-all.c  | 551 +---------------------------------
>   6 files changed, 618 insertions(+), 541 deletions(-)
>   create mode 100644 accel/whpx/whpx-common.c
>   create mode 100644 include/system/whpx-all.h
>   create mode 100644 include/system/whpx-common.h

It's just moving code around and declare common interface in 
include/system/whpx-common.h.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


