Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39798C87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 23:03:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj4Co-0002Uu-CF; Mon, 04 Aug 2025 19:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj4Cf-0002RL-6T
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 19:02:50 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj4Cd-0002Lc-Kw
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 19:02:48 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so4259362b3a.2
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754348566; x=1754953366; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VfgY3sBiYAQQZg3ggiJYjZ1XvZYDGJgLBI56ZzRqnXc=;
 b=v9Ye6Xl4OdpNNPdXXCL2JdLQblm95OQT/OhfNS+mNf5VgCS08OI1f7uSPdm/OZfe9l
 yi5avUGvzylHQcNy8BHxWVMqYqm84G3dp5/wGJBVgpM78j4zk9mF/Rc9Jc/jYTQd9cZd
 RIP4OVO4JSiecOjWeUUFxc2w89lT8x3SxRZPNWsgsRsNrHMnt3Rp+YtHIjydsshS9zI/
 /yi0iBssAWZNPgDXZrbFfM8coW90SbmYQSvP9RANYuF36/DGuTjAH2eHdROsA7j0Q8QK
 reySadhdbUEHaahh1tVlYgSrra7PNDdMkOlD3FukfQ0VhNUowcA8KjJe3tCiG2f6u093
 XnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754348566; x=1754953366;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VfgY3sBiYAQQZg3ggiJYjZ1XvZYDGJgLBI56ZzRqnXc=;
 b=XuyMiMqcZ5cshw7iki8xVzDaRlGrbaygsYh+wCM7PJaHNgFhJHikdmWIKDi0WdXlK+
 zLr+NReAM8a4pp8/PDgPPhkJnZcqYD4fyGMjvoSnMgSrxtB2KXpDNGvh9nfXLnycYZ2f
 LX4H8VefW9OyD+zpYuk+1rCMx/UCxYsHHHNVsbBEjoxes3jxZ5wMzwgF3mVLAYXYV2Ku
 qRv4l5UyvW1sxuAGOgrCcSiiPeEUTkg9ihiMSgCgP6IVC/HaS+ZWbUaCWvR/Advxo7GC
 L4Tndu3xKT/7e8mwdk+6JC4lpwZYTVTwjb9Y+5enyxeEXOnJY30QhrCVOQbRF1TR+3dp
 jaMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV11dskbDFDtVNV5gQEOxVuyA2htc6mVoxPfIzZeSOcq6TeR/Ra5Hfd8H+eAN/5k9uDbbObdKPvuA==@nongnu.org
X-Gm-Message-State: AOJu0YzZxwz+vrly3Jd1Iisp/11YH6c+cQsdZMfq3IKd/WAuMeZZAfKk
 +gVcS+XAzCy6yieO+4wnUA/kFJUMpDEHTSBwFfEfqSXFAqxaHPSQnVaSqpPFvIEGYac=
X-Gm-Gg: ASbGncvvWZwVld4PvCMRvTQLSiEw9Eb9IpUkfng/n2h7fHtGSIQDjiGAyGxkcnabGAy
 zWFAzsgDWahwT8LgTHqigScmH1j6SJr9dMp/cz+wp85kaIn5YMIn4++dSqO9BhLM5HIknW5D1Qh
 hxNA6DudoeVUv6E9/QYp+Bk7tB4SmlwtsF6cBSFm9Sd9LGzRNjEXmxVPjHOPsMhP+1uqHjbbqJs
 A+ZNo7L87NIqF1ULVfSRZBXFItlI7fKRkdNBbP4wsoQW2iW025t5p4p1tCa4K9InwdhdHRXMz2j
 I2n2MwwfY0jgwWz+sZs3LvvcN6Pd00TGbRI4FOkIE+FhPYo5bKb/tpyTzWH+Do8PKN6LBcuXuw1
 5wCzpNdhTbLPO3jomKdu7paQsm/14mhS6P50=
X-Google-Smtp-Source: AGHT+IFg1JC7KqD9ocypFi6ap8Msyv2B2YCFd8j/Qf1Y46B2WQj6nsm4Gyk/srROqHgbh84ioPm+pw==
X-Received: by 2002:a05:6a00:92a9:b0:748:2ac2:f8c3 with SMTP id
 d2e1a72fcca58-76bec4dbd7fmr15477190b3a.24.1754348565974; 
 Mon, 04 Aug 2025 16:02:45 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbcea9sm11468728b3a.61.2025.08.04.16.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 16:02:45 -0700 (PDT)
Message-ID: <fcd9e270-4e1b-4420-a44d-735d4ab0c23d@linaro.org>
Date: Mon, 4 Aug 2025 16:02:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/17] whpx: copy over memory management logic from hvf
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>, 
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
 <20250804142326.72947-11-mohamed@unpredictable.fr>
 <16f2c007-8b84-4b44-b0a2-25b61c7cb3c3@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <16f2c007-8b84-4b44-b0a2-25b61c7cb3c3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
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

On 8/4/25 3:56 PM, Philippe Mathieu-Daudé wrote:
> On 4/8/25 16:23, Mohamed Mediouni wrote:
>> This allows edk2 to work, although u-boot is still not functional.
>>
>> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>> ---
>>    accel/whpx/whpx-common.c | 201 ++++++++++++++++++++++++++++-----------
>>    1 file changed, 147 insertions(+), 54 deletions(-)
>>
>> diff --git a/accel/whpx/whpx-common.c b/accel/whpx/whpx-common.c
>> index 86750c304d..752a57170e 100644
>> --- a/accel/whpx/whpx-common.c
>> +++ b/accel/whpx/whpx-common.c
>> @@ -258,89 +258,174 @@ void whpx_vcpu_kick(CPUState *cpu)
>>     * Memory support.
>>     */
>>    
>> -static void whpx_update_mapping(hwaddr start_pa, ram_addr_t size,
>> -                                void *host_va, int add, int rom,
>> -                                const char *name)
>> + /* whpx_slot flags */
>> +#define WHPX_SLOT_LOG (1 << 0)
>> +typedef struct whpx_slot {
>> +    uint64_t start;
>> +    uint64_t size;
>> +    uint8_t *mem;
>> +    int slot_id;
>> +    uint32_t flags;
>> +    MemoryRegion *region;
>> +} whpx_slot;
>> +
>> +typedef struct WHPXState {
>> +    whpx_slot slots[32];
> 
> Please add a #define for this magic 32 value.
> 

hvf code does not.
And the size is never used out of
whpx_state->num_slots = ARRAY_SIZE(whpx_state->slots), so there is no 
risk to have anything out of sync, thus no benefit to define this.

>> +    int num_slots;
>> +} WHPXState;
>> +
>> + WHPXState *whpx_state;
>> +
>> + struct mac_slot {
>> +    int present;
>> +    uint64_t size;
>> +    uint64_t gpa_start;
>> +    uint64_t gva;
>> +};
>> +
>> +struct mac_slot mac_slots[32];
> Ditto.
> 


