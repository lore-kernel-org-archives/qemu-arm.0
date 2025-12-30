Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9E1E95A6C
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Dec 2025 11:12:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaXdf-0003hU-Ou; Tue, 30 Dec 2025 06:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vaXdY-0003gU-6F
 for qemu-arm@nongnu.org; Tue, 30 Dec 2025 06:11:38 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vaXdV-0004PG-5i
 for qemu-arm@nongnu.org; Tue, 30 Dec 2025 06:11:35 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so56882215e9.0
 for <qemu-arm@nongnu.org>; Tue, 30 Dec 2025 03:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767093091; x=1767697891; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iboKySgS+glvER0jzQ4xSzFcejAGlCIzD8S2d+hiauU=;
 b=aKVc54+5H3vKjCMh8jt+it1/hpoVmotcEaa/49vDaUqlt2/qy1/HKZzorKfOn+s74b
 vksQRLp5ApyDg8PgU8S+rSUNH7CeuujmIeLA2w5jugfgC42FKhsjyYqHgo+cpZGuoe+s
 RY0uQpDo0wZHmGaAXDyyK2fQYYzqjyH/cw7DhQGbUgwLf8GotDEFLJ/7Jh1K/EwqjqTm
 MUXVXRr9YDmZGz36pgy11BRzO9fAyKs2QHE4c+k1G72G/tC3DY/hEn7hiIF+PG5cjpfm
 O+w3AJP8orqnaQJWrp6CyciPS+f4uCD17hivF3Elm8m3SHHQHqYPsJ4ZxGv1niRI8JYq
 +/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767093091; x=1767697891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iboKySgS+glvER0jzQ4xSzFcejAGlCIzD8S2d+hiauU=;
 b=wjNT/xYV6s/50QZBfx6GUonUF8NTDvRSvk3XhVPFljo6o3wxHuMwo/DlT4SnjMMRTw
 5UnW76Mbipp7hocLX4pFfxlkfD8jh/ZHoPFXlO7FosIracaLKOXNu44JR41O1A9OWD8M
 nX1Z+lh4qwVECKTinUp/TmHu00zDJFAIM35n3Z6QWR96+ZeQ4d873ysBPCNcQCayZWvD
 MB3a1SFyCCCiyWHo1QYBIMzJ5PuwKrk7Cb+5o2MwNm1mwII6mmnm1UzLgmSVdVGzdB+1
 pCbA2SVRjBBSLAvP0goDAYk6KhXOwdQW4aLIiuCBuabpCOZ2qEEPEDf8rTmVj/MYokRb
 l3cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX90lbDGsExLCLk5uAR86SKb6pV8EXQV0kIIedTGS708Ivm75DeYDXq1T3DZLfGKV7z9cskZcFY+Q==@nongnu.org
X-Gm-Message-State: AOJu0Yylfima5FkGTXxbaAi5JbDptICWfzZV7CZmzxW5okgCLodeudwH
 VXlEHgW4nuGIoJxzCKh0PGHg9sQgeH/S1BhthzUsJ/LLEDDivG6AoRHvhUj1E4HmGUc=
X-Gm-Gg: AY/fxX4JNpZth3W8ud7PLSI5iNIRIkzg/9efpBsvtPQp5ZBOvL5JF05JjIx6NG6BlF4
 AlL889P6n8UtMVTF55Yb7pWTqmyunuJfxpKi3N0Uej+i8/NFmfD3TAqY6aDvYpU5IhLv2y33CEl
 zwB/o3YcfCUB05fVcRz5Nf/1+HByalUrk6oFikLUplLamMt6Ppn95zU4J+dpJQP13qWToGhSA9l
 3u5tfUKWjivAwfloLdFNyQCiwnITlTVgJTuyoanLCkvpeMKW+JoVCMWTBZrD5gCbQeNUkzCNr9w
 osrQc0u8q3/nzlDcPWTH6mxoh7yszBZ3fQpLGJy/aGKgWkbh8G1tCUn1uW/ZTJ5wmsu2BuW43QM
 PZ5hWkBVku+iPz6v+LzSA7OgfOcm0QyZqkVKr8L6Svniirc8Cn8Ejk3tz00DZ5IYIYV1JXEpltI
 eYzfYo3tY0zLuxt/T59DT5/++zjK2a0zeTLdvR4s8Ew2TcEXFWFQsYn99+9jbQ3jga
X-Google-Smtp-Source: AGHT+IHr3zpDFjE6qM0YdavFHZPjBR3MboYZUYZ+cfShfNADoBH22uJcM9H9jkyy61tJ1Bvvgw1vEQ==
X-Received: by 2002:a05:600c:45d3:b0:47d:4044:4ada with SMTP id
 5b1f17b1804b1-47d40444b44mr231439335e9.13.1767093091319; 
 Tue, 30 Dec 2025 03:11:31 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm602723675e9.12.2025.12.30.03.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 03:11:30 -0800 (PST)
Message-ID: <10a72070-3a06-4933-a6e8-91220881d3ac@linaro.org>
Date: Tue, 30 Dec 2025 12:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] system/memory: Allow restricting legacy ldst_phys()
 API usage
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@codeconstruct.com.au>,
 qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Anton Johansson
 <anjo@rev.ng>, David Hildenbrand <david@kernel.org>, qemu-riscv@nongnu.org,
 Steven Lee <steven_lee@aspeedtech.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Troy Lee <leetroy@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zhao Liu <zhao1.liu@intel.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Alistair Francis <alistair.francis@wdc.com>,
 Joel Stanley <joel@jms.id.au>
References: <20251224151351.86733-1-philmd@linaro.org>
 <20251224151351.86733-6-philmd@linaro.org>
 <CAAjaMXZXSBQx+tQOyg6PVr1Y5R0c0uFsMrC9TdWE4mcvvejKZA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAAjaMXZXSBQx+tQOyg6PVr1Y5R0c0uFsMrC9TdWE4mcvvejKZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x342.google.com
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

On 24/12/25 19:34, Manos Pitsidianakis wrote:
> On Wed, Dec 24, 2025 at 5:14 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> Commit 500131154d6 ("exec.c: Add new address_space_ld*/st*
>> functions") added a new API to fix a shortcoming of the
>> ld/st*_phys() API, which does blind bus access, not reporting
>> failure (and it also allow to provide transaction attributes).
>>
>> Later commit 42874d3a8c6 ("Switch non-CPU callers from ld/st*_phys
>> to address_space_ld/st*") automatically converted the legacy uses
>> to the new API, not precising transaction attributes
>> (MEMTXATTRS_UNSPECIFIED) and ignoring the transation result (passing
>> NULL pointer as MemTxResult).
>>
>> While this is a faithful replacement, without any logical change,
>> we later realized better is to not use MEMTXATTRS_UNSPECIFIED or
>> NULL MemTxResult, and adapt each call site on a pair basis, looking
>> at the device model datasheet to do the correct behavior (which is
>> unlikely to ignore transaction failures).
>>
>> Since this is quite some work, we defer that to device model
>> maintainers. Meanwhile we introduce a definition, to allow a
>> target which removed all legacy API call to prohibit further
>> legacy API uses, named "TARGET_NOT_USING_LEGACY_LDST_PHYS_API".
>>
> 
> Personally the negation (i.e. TARGET_USING_LEGACY_LDST_PHYS_API) would
> make more sense since you're opting-in an API but that must be more
> complex to introduce I guess?

Not much more complex, this was the previous approach (allow
all then opt out):
https://lore.kernel.org/qemu-devel/20251218212814.61445-5-philmd@linaro.org/

But Pierrick suggested the less aggressive approach, opting
in, disturbing maintainers a bit less. In term of code churn
I expect the same lines of code amount to change.

> 
> In any case:
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Thanks!


