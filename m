Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A664C87FCF
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:52:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj1EV-0004d5-2r; Mon, 04 Aug 2025 15:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj1E6-0003vP-8R
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:52:06 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj1E4-0001XP-I6
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:52:05 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-31ec651c2a1so2873757a91.0
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 12:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754337123; x=1754941923; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iT4DMn8BGNWenLClaGmsvGbocg3Ejjavv3Lj4Trv/EQ=;
 b=WGKUXgQZZcfRaCkejet8yAQi/DDJWp9DCR83kgHa371xaV9BUsxPlA1XZ1RGUSOeF+
 KZ0BU9q6MQJGrbkvvHBbJfqActdw3/nIJj7A7XsMzs+w0/muCXI/11zBXUb086ipgtis
 OzqqWcfbaGzwVuqez8L8osIj4iKMu25ROajodCERuWnJs2jOLJPZ+qgNNMSioF2f+zp7
 dAPOPu6Z7gc26kcShZRNFVEN9gHEs7KB0bclkG0JOMnxcrBYOcWWh8d74E+YfsHWIJDi
 K5j8n+8P011COGfq13KTIq6oTWo7F7jaDLjmHhqDheeSFalZUu3LoGF7o27FEXzngTGf
 gAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754337123; x=1754941923;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iT4DMn8BGNWenLClaGmsvGbocg3Ejjavv3Lj4Trv/EQ=;
 b=gxibdTbklqaar3IZnlABmNpO//TqY8/UXZfEXusHJnEGOhNL5s3/ccKOry74eXie0t
 hYynbg9nxoYoAsmz2xcsgkHbuSzXdL0KE4fPAYfWA4qHiL6O4dJtSUXh9+hJzS87Ix0+
 JHfB8YApTQYI4RL1SAhPWhEC6lkOGe2NrMhj77X31W4y8PQ8x0cVdyrHyAETgu4VLeQW
 9vGSzt9DcqPpRfKHaMseTtekGBkEfQ8LQuf7pj/QYdzxCN/ck5VNAnQcmXu0kFB4m5aR
 RHRafPBYqqfQ4LosIhu8NYe/ZPGyDvCWTYIERAy/rdRWCRqo+6lrMin9WVfS+4pVznMW
 xfQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUinSv7wz2OG9gqVYpPCCd027B3DqplvEWVxysaSoFdt4aPHBWC4Xc/DzoI20DOnKeNEDwJrSEMYg==@nongnu.org
X-Gm-Message-State: AOJu0YwHewGRF4kvMgJwNkwVZ0exJIi1fr+8IDR0cYdKFF2bXz6r+pJL
 BQr1MgRIqMqIBCxNi3WjBcrJAmW8907OzOg4HGx5oI3g2xSqoEM1fiIpYs3VqGSVV/0=
X-Gm-Gg: ASbGncuuAQm0G484zTdPmwjCzseWUuKH6QPcK4fMr20sJEzeggmNFIuvPBsL1T48yX6
 MEzTn35wRdoDiW4PLY60H/oWXE3b0sOB2z0YiHm/FlqLAG/GU+PmvGewatsqKEEdGAZSyqxarYP
 /WUtPmPfegg5LbAZfm/gtdGmyvoIu2ECZeB7ttopX2E5xFmJnObtVUmMidum4RbwNSGCNHl0bjv
 QKEZlqR+sKv7HzNwa/yIS0Lwbpj8ixtLZkc6YgwznKwKrK3iQ0OV6ShLkHVJ0dskSQ1mth+0yiY
 dlqqjQ7MtQDSU7UzFDSxs3Ux9WyAbkSKAcM8ClifUP2QDq178b0i94ctz9eZJBtIdYZnFvoISuo
 FSeIJnuthX/e+BE0WdpjufFtt0gYHn8xj0gY=
X-Google-Smtp-Source: AGHT+IHzbzCA6Urp0No1Ur7Xte9lWZp/GHdGjoi9vfPR5+D960buSQvveXwTwPEIJDDLZBogKycg1g==
X-Received: by 2002:a17:90b:1d8b:b0:31f:150:e045 with SMTP id
 98e67ed59e1d1-32116306912mr12415298a91.32.1754337122747; 
 Mon, 04 Aug 2025 12:52:02 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207ebc2f3dsm12349875a91.14.2025.08.04.12.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 12:52:02 -0700 (PDT)
Message-ID: <58c2ed66-9110-4a1a-9447-6e83d26f3b70@linaro.org>
Date: Mon, 4 Aug 2025 12:52:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/17] target/arm: whpx: instantiate GIC early
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
 <20250804142326.72947-17-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250804142326.72947-17-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102e.google.com
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

On 8/4/25 7:23 AM, Mohamed Mediouni wrote:
> While figuring out a better spot for it, put it in whpx_accel_init.
> 
> Needs to be done before WHvSetupPartition.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/whpx/whpx-all.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


