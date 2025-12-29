Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FC7E9273E
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 17:54:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaHRS-0005yO-QB; Mon, 29 Dec 2025 12:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHRK-0005wG-TT
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:53:56 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHRI-0004ZR-Pr
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:53:54 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-29f30233d8aso107777165ad.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 09:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767030831; x=1767635631; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lky3eRWjNVZKS+mrPVmhhZW7nvQlMJxhyck2GcA5NUA=;
 b=TlDleG3Sx69MemQlrm3XDoXoGiqK097toDgtYOGlxY3JnBUf1B7EgEWSG+Yg5G19eh
 FKKmr6tbmbQaRZaUixs5Jxg7eAYSaSB/G6oCDT/xSWyO5gsngkn8Q9cBjZqLV12zBkYu
 cCTb5zJBqOqsTWvToQpDNV4J++59n5TueuGGunTywiBopq24MfQSXYvnb5WjLUH8oPed
 8kVG/RWh7tpaiw7gooWHqFgTmWwfhV+Vd67PsLMF2F0KKny4DSZM7sXgwRv+WjDaOa1T
 L+9RWQT6cH3t4c/eBkh3BU8HK4K9fuq815emLNC5V1I4SjpnsFjicGzm2x9yRJelQp+n
 bX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767030831; x=1767635631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lky3eRWjNVZKS+mrPVmhhZW7nvQlMJxhyck2GcA5NUA=;
 b=MmZAXbVpoLChOagcvYXWdw076nv1Bd5rG8KX2j+0fKWiwMXBKMqI1hAEvy1NRYz+zh
 mY0p/XN9JiuMZ7rNWBDjlKja480Wi2aUmYex1GbkVVXZAiaMMtnM9xjXQJqrbw9ZK2rG
 dTwte4fWnzMr+nt6Y+vk4etUuHRzVncSBqbicXH6W28MtsFoOpYt/adG33UMPjMrtNgG
 61FIWCx4fLLtQusDo51LPFlHBFTg0qZB/9fnA6O9j9zvnj+Sw/ZsRu4sifxC5ZxR/l4H
 1btK1DZWZSKQDSQsNrJJ5k+6wyXWiJaix6lDfZQ3e2tRRY4cbUIOQBDIQPko2FS8XMz2
 xojQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoPwSBxSttYKqsoje/4WGf+bZpFAtkaV53emR7m+ZKWICU0G0QvhkIdyscn2o4Jkcj5ZkJCHbujQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz33FdzGI6GkeraFWhrYso2msLaN6bOMTsAxH9hJS47ruy0E7Bq
 d4Ht4udhm2C0voy2vk5FgHZ/pX6drxQTz2MSCHx5c9cWdfRL8lGwPA0tndpsmi+tOv4=
X-Gm-Gg: AY/fxX46JpcCpmWx9lctez/QoCGX2zHYIZQzpctdmJkjCkJMAyif2nGRapOwifW6M0U
 ON/xL3ToFh2uWAZO4ZHXBcLnOm/qcs5/4lFZRh3hmuGNP+2FexZ1o8GsMrBgN1NW4oN++/zbEOt
 VMz6o0Bf0mVA4t8Tj9BXxGkv9PBo22puQqOYf8JV33wYl29J4+fXGwxi0MyWWAMAoYSMAi/1o6Y
 rPJiGpK2MsG7w6aLkqlC1sO4+24hQedN9a8/RDasFGlnBJrf7j92oIfVoy6QET26TBxBLTNHzXh
 0GHxLhO8qE3b2cW8amuaHjRGPc/VkQYUrACIkLHJXL/SpJpYD7QRHpCXHNqzTqF+kc0I9y0Kh2F
 0Zcael5LdBctKRFQQEYCNgatBBCZvS67aoiKM7x19HmFC9eMQKv34qFvxO1jtTomqA1PmSjZW8S
 Ak1bU+xZ0XTMaOvY+Ko5s/pFfqOuyXP2cCMGJu1yLCBTex80CRZ/1pOFPHuZNHT3kqohg=
X-Google-Smtp-Source: AGHT+IF3q1WBxBVC8iD6QACtpbZ43a201nZhMCGmysPIkpzipaQ8LOlenvNFJc0//WIB7MVZ2DNQXg==
X-Received: by 2002:a17:902:daca:b0:295:5dbe:f629 with SMTP id
 d9443c01a7336-2a2f21fc4c9mr274162615ad.8.1767030830730; 
 Mon, 29 Dec 2025 09:53:50 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d4d858sm282363275ad.57.2025.12.29.09.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 09:53:50 -0800 (PST)
Message-ID: <e5607e7b-3523-4d75-b0b6-d134c7c5d1cf@linaro.org>
Date: Mon, 29 Dec 2025 09:53:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/28] docs: arm: update virt machine model description
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>
References: <20251228235422.30383-1-mohamed@unpredictable.fr>
 <20251228235422.30383-10-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251228235422.30383-10-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
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

On 12/28/25 3:54 PM, Mohamed Mediouni wrote:
> Update the documentation to match current QEMU.
> 
> Remove the mention of pre-2.7 machine models as those aren't provided
> anymore.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   docs/system/arm/virt.rst | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


