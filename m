Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD228CCF9F0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:59:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDiML-000766-6L; Tue, 28 Oct 2025 07:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDiMJ-00075s-N3
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:59:27 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDiMF-0008Eb-Jv
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:59:27 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-63bdfd73e6eso12564998a12.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761652755; x=1762257555; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XBn7RArNNfoWX8I+WWixaNZpEIEbgylvkPRW+fG+CdY=;
 b=GzoIzm0xhnWw9UbPCUN1lwZPV88LxmOShW+fBLF6+Ykf4wWJlMtr2vv9BXg3Lkl0GP
 ACHn/Y0cwmtn03Ey4sHRgKaeNWUgoWo5219NEGtz49xKc/R7jlA+9N4JBm4YOCB2MLBC
 oZAyP8r3iExVA7FbrsKhHcn4gMR+Pq8Sk+C0Vr0WfvAn+onAP7OpuzXsjooY6V/IuIhy
 d+O6xDCUJrE7XZO/yP5zuXHn8RL1av9unRXvw6aUxpfLKt76lVCd5W06jtgdfmsV3g21
 XXm513023QALb3yMGm65ykFQ619iwigqyoO4Q/Dlts3WYETNBNg1vyVDBSVKtLT4yYVg
 TzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761652755; x=1762257555;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XBn7RArNNfoWX8I+WWixaNZpEIEbgylvkPRW+fG+CdY=;
 b=Frgo9emPKDltP3GLmsYQC1hN39CIXVclKfxzX774rDWzaNVp/cWF8qwwiFTLrVzKmw
 wGc6CoKqZgzh9n38lVGW13aThAN896A1xsn/n9VkmBCJ4AborYDeh1KKJhs7ml7NAhXb
 cL0YDrgNkccoBlfZq9+VsORquJttjbZzScNugmXAU1A/nuhxBTsST5jVuzXl8KeNPu+l
 SY4ZbPNVUuFXuUCwsV/e8E9sxV9Ph9m5t11gzT6mrKupald6x72W+1VOSW9dgu7GA1Ve
 1KVI1cPQY2I+OTE7p4IX7CDVc/Ftl4rUPn2t8Yi2ugRtuHUNgj5g7Z8PwC657FXJLTwa
 HkhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMUAzPeuaOc5y8O23wNTjUWHXjIP6kEAYNtTDiIyOYsbfezWoWk/p2qKYlFr+VaahOU2/T/bOvMg==@nongnu.org
X-Gm-Message-State: AOJu0YxPhQKle37sVdcZWY0m/GMF1GrNG8m5gEmeZrp8zXxiwwqWF5a7
 WCj56fdi0sUYAs3IOYxk1fkIRB3c5gw8kAdyQwqvbnCqMiam9AnHSozZbASD6U4UGQk=
X-Gm-Gg: ASbGncuqMhrDsL1eUlyPT+ZdUNJnyRry8BnmzatvXYK7W8cWyCnz3y6AYNahzhhM9j8
 PbiA7qHePNH6LQt/+gL/oRo0uY+k/CV/BshIrvVUmt6rBZTDmAVkiKchMw5yJC6hOA0PD07//Sy
 9TgE0xXlxqpfnxORgk62vPoUlnkq6fqibAB4y30tzw7xAllDfF5gdc4Oz/BHGj69+snkux7PCDp
 N2sJENSgDVEtS217+SE92ydFR+OAr+Tk6HrJpSty2jYjWopuvYMUsSMdZYTQCub0g5MWxAgPbEa
 5DSsRoeoFAjp5t3PtV+WEIaQwpf2PqoDpGNryqi6jAtuUKOzcwpfzIuVQSSu2CR0DyLag6Mjbjo
 /w//vB/mG9GoJ8SWZWvexnQuMvPdxc97tqSpV8GMU4qcFATLeiYTNFTpDKcR9RsJFpc3ydwz3CK
 MD5+tMjfG+ThEbR0NY
X-Google-Smtp-Source: AGHT+IHG9l4+tG2g7chJis7I0T9AlWKuv1yT2fFspzQ+U2dDIasx8CZBJ8Sh0U55++nDevLZoXvICA==
X-Received: by 2002:a17:907:3d44:b0:b4c:629b:aa67 with SMTP id
 a640c23a62f3a-b6dbc094080mr293180766b.32.1761652755434; 
 Tue, 28 Oct 2025 04:59:15 -0700 (PDT)
Received: from [10.240.88.227] ([212.144.248.67])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8992aa28sm1031517466b.41.2025.10.28.04.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 04:59:14 -0700 (PDT)
Message-ID: <757efb2d-afc8-413f-9807-aacdd342d8bd@linaro.org>
Date: Tue, 28 Oct 2025 12:59:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 42/59] accel/hvf: Skip WFI if CPU has work to do
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-43-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251028054238.14949-43-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x533.google.com
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

On 10/28/25 06:42, Philippe Mathieu-Daudé wrote:
> Avoid sleeping vCPU thread for any pending work, not just IRQs.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

