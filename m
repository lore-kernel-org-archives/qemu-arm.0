Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946C9CA1005
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 10:27:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utOEY-0004IV-2e; Tue, 02 Sep 2025 06:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utOEW-0004Hs-J0
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 06:27:24 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utOEU-0000WD-9q
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 06:27:24 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ce772ce0dbso3544178f8f.0
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 03:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756808840; x=1757413640; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cVUdYGKa24cj4nvdAy9vOSS1mh1984JyzO3vmKT9xug=;
 b=Kr4LBDXkekH0XqygISX9fUYjN4V7CeHaEzrOPN6qQ6A7zbWWpaS2osToLhUiEPSj5B
 3ss3UoDy0L25sCtWCM39fuc6/SMTgzHKal0rvGC9v97mFMyTpke2O/iLcF6i11RXGzQ9
 sUx6WIehcSHVTV6Jp8px+6evK3yoH4wKsqKyaj9SF59X/unQ2YU3rytUA5r282VPe5QF
 v02htBgOYDdOLpvnNwJsh4iV9ojqtGAWFhoCOsVNLXlmoZD2ZCcZlAFNHYTGW60Y7EjO
 c5xD3fvKaHbMdQ+Tu30z51Do/b3zSrPi6wfgkdCj4QiyesKiC7ZSLl3U6SqxJ7FD6Z45
 /AGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756808840; x=1757413640;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cVUdYGKa24cj4nvdAy9vOSS1mh1984JyzO3vmKT9xug=;
 b=ccCggYroPj25wrBUNnvMelBTyVhivr2tUivNQpX0YNdviHbZF2yyvLZmnJoqiPK63L
 jBRYE6/WafOQcJMthHyBqw5hil7uoKZAzP5K/UxHIuEfp1RwbwT55r4D4uRYUXD1KP3S
 VM4rkLTac/umkpe8V280UiNbbm11MytE8w7VzelzMknN/aFfI8MfFSKVHX90Og+2D9pL
 M2Aopw+FEjK8vwwS0kkCG5A5uMbM19baPvBhIbHU7gKMDW0L9TyZHzBMc0eFTcUPr4wa
 DPobuvcQXHzptrOaRO0ww1eNFSluWvamOD5W9wA1hJBIFXJ0gjPXanIpPz1xe95xTpXI
 uzpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy9ZfOBgY9Ftwi9xTygGPQEpdBmCkSXp5RMkM4w3lgiI7qMrnku1LKULj5nK+x2OSk4/N/J2Z73w==@nongnu.org
X-Gm-Message-State: AOJu0YzMXCAXrXltBhCawHkc/ySjCb9oZ04pBwD4wkvd6SgUcjro0oEj
 lR284A1b0p4dSPgXLX6u3FtJ0f7AQNpcYz6SRmPLcftvwaKjTUXe2aE4Lael3ulSFIk=
X-Gm-Gg: ASbGncv05x4XiueaWlwpk0OkMZg4n7AyyK2b6cXyUB28rucJ/bDAFONj3P3T9bQqgN7
 fKdyKBHe528+DyL6fRtc5EiWoFLYns/14/D9azRuqNQmdcc/kU7jY3Il7eKsHWtZ4aa7MX6Hb5V
 wVFp1C3W5hb0fkXqFI7E1160bfUfeWFsBCiMIlJmtlFgw5KE8HRPIn+wG2LvuxnNBLagcJoWv8R
 /fznJJgZ8ucekLCkm9WP4oIkCHJBwRlQPUyAVd7K3lh4hu42o8lG3aerOv7cw/nhmeS8Fb/hEQ2
 I34MO6UOXLjcfarm+Ndsu2As3zag1eJC7Jpr9jzwzvqNTxd1til5FcesQ6I1C0JBEkTnRA42j2Q
 aUTF+7sHRf6kB42GwIWJhggtKSaQKMeY0OMdsR6C9VGHIWJ/ml0FmWBM5RrZ03rFPjbh+YUm8bv
 HK
X-Google-Smtp-Source: AGHT+IHvINrOSXihdYhatG+OlhpVk1dynq2dd671bqi4jXYVESKVwjOJSVtggtl04yYkvzm7YODPcA==
X-Received: by 2002:a05:6000:1a8c:b0:3c9:24f5:4711 with SMTP id
 ffacd0b85a97d-3d1def66f6dmr8500780f8f.43.1756808839622; 
 Tue, 02 Sep 2025 03:27:19 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e7efb79sm193566515e9.9.2025.09.02.03.27.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 03:27:19 -0700 (PDT)
Message-ID: <08162174-9a37-4a72-883d-b3a610de7f68@linaro.org>
Date: Tue, 2 Sep 2025 12:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/boot: Correctly free the MemoryDeviceInfoList
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250901102214.3748011-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250901102214.3748011-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 1/9/25 12:22, Peter Maydell wrote:
> When running the bios-tables-test under ASAN we see leaks like this:
> 
> Direct leak of 16 byte(s) in 1 object(s) allocated from:
>      #0 0x5bc58579b00d in calloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/qemu-system-aarch64+0x250400d) (BuildId: 2e27b63dc9ac45f522ced40a17c2a60cc32f1d38)
>      #1 0x7b4ad90337b1 in g_malloc0 (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x637b1) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>      #2 0x5bc5861826db in qmp_memory_device_list /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/mem/memory-device.c:307:34
>      #3 0x5bc587a9edb6 in arm_load_dtb /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/arm/boot.c:656:15
> 
> Indirect leak of 28 byte(s) in 2 object(s) allocated from:
>      #0 0x5bc58579ae23 in malloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/qemu-system-aarch64+0x2503e23) (BuildId: 2e27b63dc9ac45f522ced40a17c2a60cc32f1d38)
>      #1 0x7b4ad6c8f947 in __vasprintf_internal libio/vasprintf.c:116:16
>      #2 0x7b4ad9080a52 in g_vasprintf (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0xb0a52) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>      #3 0x7b4ad90515e4 in g_strdup_vprintf (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x815e4) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>      #4 0x7b4ad9051940 in g_strdup_printf (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x81940) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>      #5 0x5bc5885eb739 in object_get_canonical_path /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../qom/object.c:2123:19
>      #6 0x5bc58618dca8 in pc_dimm_md_fill_device_info /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/mem/pc-dimm.c:268:18
>      #7 0x5bc586182792 in qmp_memory_device_list /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/mem/memory-device.c:310:9
> 
> This happens because we declared the MemoryDeviceInfoList *md_list
> with g_autofree, which will free the direct memory with g_free() but
> doesn't free all the other data structures referenced by it.  Instead
> what we want is to declare the pointer with g_autoptr(), which will
> automatically call the qapi_free_MemoryDeviceInfoList() cleanup
> function when the variable goes out of scope.
> 
> Fixes: 36bc78aca83cfd ("hw/arm: add static NVDIMMs in device tree")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/boot.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

And queued, thanks!

