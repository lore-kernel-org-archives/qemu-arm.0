Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E919BEEF303
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 06:19:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vy238-0002aL-He; Thu, 05 Mar 2026 01:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vy22j-0001sS-FQ
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 01:18:43 -0500
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vy22e-0002ah-DZ
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 01:18:38 -0500
Received: by mail-dy1-x1334.google.com with SMTP id
 5a478bee46e88-2be19f05d7dso7413118eec.1
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2026 22:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772691515; x=1773296315; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D6x0h6jTA9+cR8/hZSGFcA5EYH/717k6FSSs+LV2fmw=;
 b=GE7TYQK/1KQz70UhyCfm10GEIe7b2DOQhVy3ASFgHw0sZ7/x66u6qTOwhKeditS32P
 X+sNB0n8Ei3mRpPJnIJitHt04jRnQiep/xhrPVdGaHNX3pf3dERq2DdovA0QXiejBYec
 Qg764lGTvVhJXO70PARvZEjv9FOzSgkLNryc93ja7wW+L6fexClalPwjZiJPxonn2nu6
 km8ukO7ii2Fck4BvDIXmB9hhMabsrfCC3+W4IxPMlv+u/mhPxEZjq8LzdcuPOJiwAool
 JKvazahA7877K1vQraKWSq/uA9egrDubMZPBdbCYL/rNMjYg9kyPCYKJ6pnnpgzqKEqB
 H0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772691515; x=1773296315;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D6x0h6jTA9+cR8/hZSGFcA5EYH/717k6FSSs+LV2fmw=;
 b=uJPOfz1D9Al9BuSwYKXcMM5JMPHOzNuV4o8+5CYCsBrBY7I7F7n8JO0zUM1Q3VgETx
 E9HA3/+2VrRuGOowcJEYXy6PuaiNOzBPRw9dpLY7dCEvhd7WzW7YdsZlvi0IX8ZgpV7K
 E52HtGFmEB5qX82cYwACjSrzOwfR5eaSmvAS9PzG+YSSO4RfRNDj9dX9TwimikK51SkG
 mdz8DxQWz/cF35g9fAUa5HCRJvSrW8gX8TlZvO7x/2iuyk+Kv70jWxh17xNCfD+6SXmY
 bGgq8H504eVK4vtUZk3fYS54ImUtZDwYBuymAkQ2oCuvNCHpRslRvTbirO4dQki2z/WU
 5WPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXby+i85SVrt/9SLxXFyOgGz9nCf1WLKpbkP3rO8Xwsuu7l+AVEDxZHUNBCgqz/kf/32ZEO201zPw==@nongnu.org
X-Gm-Message-State: AOJu0Yx5S+8jUzt7wafPfDrF+llXUdlxbxp2qv4O1QsadYPmX8zqIdOi
 T2jtRmutmpSlu4rSCORZtgbVc+tX4UYg9jN5UYmiLUpFRkVhZDoijzIO1aqfrHgHAYs=
X-Gm-Gg: ATEYQzx24RzQZ2JPkf+C9SICdqJiVuM1lQm9nwB4oD0fepMJeF3wgXOrqKmwyhf2uEd
 Oy6HjAoqwel36Rddl8i8mDb/gPyLpkOhZJQhn7mi7paEdurg+MaBYza+9QHAjHFfmFwMSaVkP3I
 BoB4x2diezHTKFmnEBJ4X18Gox9xaFzhFwtv1owACrUhoYTJE6ogSezLojEXrbM4GD7RXhw8nrj
 35mN8REK4EdMm9My/Z3/U2maKaOSDy94EsVfV/bN3DTBlveygwMWjKeF8qODWyN6RdhPSnDJpIl
 MTcPXgSAWFg0q4XhIDyKJNrO9GoBt5hTW5BqJMnk6+YTN9OTGoXGYPHpNDmTDpnB7II6okSF/UH
 1t1eX1O4WudQDVvsNYg9Tvv8KVxtKg14CeNTxMb+cJcavpO4bWWtKFLww0ow4pu5Kja02pZUJHB
 xWmRJuk+KFSjytFRgo1GO8c2/JKAVUPEmN
X-Received: by 2002:a05:7301:678f:b0:2be:2e4c:209c with SMTP id
 5a478bee46e88-2be3109b1afmr1739518eec.20.1772691514704; 
 Wed, 04 Mar 2026 22:18:34 -0800 (PST)
Received: from [192.168.0.103] ([191.8.216.93])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bdfb3f898asm11241488eec.29.2026.03.04.22.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 22:18:34 -0800 (PST)
Message-ID: <2cdd5204-49fa-4aed-be93-d175af4a9e2a@linaro.org>
Date: Thu, 5 Mar 2026 03:18:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 7/8] tests/qtest/bios-table-test: testing new ARM ACPI
 PPTT topology
To: Alireza Sanaee <alireza.sanaee@huawei.com>, mst@redhat.com,
 qemu-devel@nongnu.org
Cc: anisinha@redhat.com, armbru@redhat.com, berrange@redhat.com,
 dapeng1.mi@linux.intel.com, eric.auger@redhat.com, farman@linux.ibm.com,
 imammedo@redhat.com, jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, maobibo@loongson.cn, mtosatti@redhat.com,
 peter.maydell@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, shannon.zhaosl@gmail.com, zhao1.liu@intel.com
References: <20260220141128.789-1-alireza.sanaee@huawei.com>
 <20260220141128.789-8-alireza.sanaee@huawei.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20260220141128.789-8-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1334;
 envelope-from=gustavo.romero@linaro.org; helo=mail-dy1-x1334.google.com
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

Hi Alireza,

On 2/20/26 11:11, Alireza Sanaee wrote:
> Test new PPTT topolopy with cache representation.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   tests/qtest/bios-tables-test.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index a5a5b8807b..510751799e 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2229,6 +2229,10 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>       };
>   
>       test_acpi_one("-cpu cortex-a57 "
> +                  "-M virt,smp-cache.0.cache=l1i,smp-cache.0.topology=cluster,"
> +                  "smp-cache.1.cache=l1d,smp-cache.1.topology=cluster,"
> +                  "smp-cache.2.cache=l2,smp-cache.2.topology=cluster,"
> +                  "smp-cache.3.cache=l3,smp-cache.3.topology=cluster "
>                     "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>       free_test_data(&data);
>   }

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

