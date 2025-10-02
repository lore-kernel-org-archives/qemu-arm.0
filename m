Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F58DCAC5B0
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 05:17:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4Bgs-0000Hh-Oy; Thu, 02 Oct 2025 01:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4Bgk-0000BF-40
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 01:17:15 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4BgP-0006mY-RH
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 01:17:08 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso3202205e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 22:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759382202; x=1759987002; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nP44d4h1jekHn6mFqnHJmhmS/9Do5wl9GUaQdd3lrCA=;
 b=iMhgCPTQFqYwu0mpP15WIsbiNqAlN5zdk6XCF9cgoUBwdeOliMoFq6wzVjZz4aC0R8
 hKxnxKLHI7iN3o7xFSEISsMtLc+TTDOM8iTLgwDDFjhQR9OWOXgwollgigRpOu0fIFgJ
 JJg0AfE4fvVdnvU6vMrss2J7kU94oe5pB0d8t/lTdCfcKphVswc+O2tSd5TtElwIrrBT
 p61KcMYDxv0NJXAVT9ljK9Uv7LJRI5lwR0b0aBPovneYnwOWugdltNp35M154bekPxR5
 SbOknKKs9yZPEsWknmzw5M2/rmIJfMAqgUnQ8RvtkpEzgHQewiAdEwtViNWub+R1hoCC
 F4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759382202; x=1759987002;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nP44d4h1jekHn6mFqnHJmhmS/9Do5wl9GUaQdd3lrCA=;
 b=KFoJcl5xnUu+6ETXi9pwkhb2RWJoltV0VPTAFXIX9c2yLQFq/cxqiYNDns2kUAVi99
 mLguujjv0F4RaHqr2rwyifZApPq9YopuUFrl7ANCdugMeUzyKk4dIS6vBrpCj/8Jm4fH
 yZE+PSN3OU4Y81w2g8HkF872Kj6MuSTe8XwujObwBxIbDc6scB1nOkeQuwEjDhp2FZo7
 NtLRN3hZSFbIvocPcpnGnMuGU6AFcjqiuXhaiFLqgpzYDSngGvSoT9EKlInJOXggFBV1
 wtbRkt0LC6XObb7sz5q4kI4M/+dEpJna9w2Wif0NmB2yaQFl7HP5p02HNdMuw7m8TyrB
 uebA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX44OTS4X/REd8ej/H6dQEK+/GODrDJpc6c/dlCeqs5e2YV687tTU6hro7jCxJn0DOZupAzFZmkyQ==@nongnu.org
X-Gm-Message-State: AOJu0YyoH3wrz07+ubtMw8d0MLOoJkJU6ZVuaqzl8BKoA14mabZg2Bzm
 YynYCNIu7dtiTePpiE7J5FViu4mCAaBoEb8NabC5e4d4a+0nKZy69cnXZh0yEjf+a5Q=
X-Gm-Gg: ASbGncs8WU7nC+12EW2uRhCufapGmWGiMjsH98uDs2z/74LwTyxTHpfPsWMSKNgZeh5
 kdPnbihwGDhNG97oBKmE2ufQ7oC94tqtpRKhTVDmbaOWI2G0ItcXv6ucGiCzIhUwMO6qVT5ikLt
 THBSEHIEQHb9+En37a8G2iCa9gLlAejAqvOVdEAuFJVwSvpDnBoSEaIVH4QGSQbgoWraYEd9kKz
 oxeSFmN2di7fGTqDQh9PIS2nCjD+Ued/fYK/TZTHzyqY5bRcaKaOt8+wV3dnHRXVBpzlTJG0yee
 QDVllBKKHC/Ibcl6i9vTza9KNU8gsuUpTZqk772ql2213uYBP3LIix4exILbSuNIpHZ/nUHAXaL
 MhtUJ7dAwgoixFqK91EdNiywP+mzqFZjJDzf/R9RixwWq0Vy9xOUUxhSSKlDGylypilCl2AsnAa
 +j+MiZqPHXDbafNVB02oIGEbo=
X-Google-Smtp-Source: AGHT+IFTCkFMkkXlWMIq3Vgvzt5IFWI271cdWtVJqy/RZz/1PwzpzG3SNgfPDaXsmuZn+VswPUUmHA==
X-Received: by 2002:a05:600c:3544:b0:46e:5df4:6f16 with SMTP id
 5b1f17b1804b1-46e61294d1emr46097095e9.35.1759382201614; 
 Wed, 01 Oct 2025 22:16:41 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a022d8sm62129355e9.12.2025.10.01.22.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 22:16:41 -0700 (PDT)
Message-ID: <b85d3293-0fcc-40ef-a170-256a20eb91cb@linaro.org>
Date: Thu, 2 Oct 2025 07:16:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/23] whpx: copy over memory management logic from hvf
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 kvm@vger.kernel.org, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250920140124.63046-1-mohamed@unpredictable.fr>
 <20250920140124.63046-13-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250920140124.63046-13-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 20/9/25 16:01, Mohamed Mediouni wrote:
> This allows edk2 to work, although u-boot is still not functional.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   accel/whpx/whpx-common.c | 201 ++++++++++++++++++++++++++++-----------
>   1 file changed, 147 insertions(+), 54 deletions(-)
> 
> diff --git a/accel/whpx/whpx-common.c b/accel/whpx/whpx-common.c
> index c69792e638..f324f5c146 100644
> --- a/accel/whpx/whpx-common.c
> +++ b/accel/whpx/whpx-common.c
> @@ -258,89 +258,174 @@ void whpx_vcpu_kick(CPUState *cpu)
>    * Memory support.
>    */
>   
> -static void whpx_update_mapping(hwaddr start_pa, ram_addr_t size,
> -                                void *host_va, int add, int rom,
> -                                const char *name)
> + /* whpx_slot flags */
> +#define WHPX_SLOT_LOG (1 << 0)
> +typedef struct whpx_slot {
> +    uint64_t start;
> +    uint64_t size;
> +    uint8_t *mem;
> +    int slot_id;
> +    uint32_t flags;
> +    MemoryRegion *region;
> +} whpx_slot;
> +
> +typedef struct WHPXState {
> +    whpx_slot slots[32];
> +    int num_slots;
> +} WHPXState;
> +
> + WHPXState *whpx_state;
> +
> + struct mac_slot {
> +    int present;
> +    uint64_t size;
> +    uint64_t gpa_start;
> +    uint64_t gva;
> +};
> +
> +struct mac_slot mac_slots[32];
> +
> +static int do_whpx_set_memory(whpx_slot *slot, WHV_MAP_GPA_RANGE_FLAGS flags)
>   {
>       struct whpx_state *whpx = &whpx_global;
> +    struct mac_slot *macslot;
>       HRESULT hr;
>   
> -    /*
> -    if (add) {
> -        printf("WHPX: ADD PA:%p Size:%p, Host:%p, %s, '%s'\n",
> -               (void*)start_pa, (void*)size, host_va,
> -               (rom ? "ROM" : "RAM"), name);
> -    } else {
> -        printf("WHPX: DEL PA:%p Size:%p, Host:%p,      '%s'\n",
> -               (void*)start_pa, (void*)size, host_va, name);
> +    macslot = &mac_slots[slot->slot_id];
> +
> +    if (macslot->present) {
> +        if (macslot->size != slot->size) {
> +            macslot->present = 0;
> +            hr = whp_dispatch.WHvUnmapGpaRange(whpx->partition,
> +                 macslot->gpa_start, macslot->size);
> +            if (FAILED(hr)) {
> +                abort();
> +            }
> +        }
>       }
> -    */
> -
> -    if (add) {
> -        hr = whp_dispatch.WHvMapGpaRange(whpx->partition,
> -                                         host_va,
> -                                         start_pa,
> -                                         size,
> -                                         (WHvMapGpaRangeFlagRead |
> -                                          WHvMapGpaRangeFlagExecute |
> -                                          (rom ? 0 : WHvMapGpaRangeFlagWrite)));
> -    } else {
> -        hr = whp_dispatch.WHvUnmapGpaRange(whpx->partition,
> -                                           start_pa,
> -                                           size);
> +
> +    if (!slot->size) {
> +        return 0;
>       }
>   
> -    if (FAILED(hr)) {
> -        error_report("WHPX: Failed to %s GPA range '%s' PA:%p, Size:%p bytes,"
> -                     " Host:%p, hr=%08lx",
> -                     (add ? "MAP" : "UNMAP"), name,
> -                     (void *)(uintptr_t)start_pa, (void *)size, host_va, hr);
> +    macslot->present = 1;
> +    macslot->gpa_start = slot->start;
> +    macslot->size = slot->size;
> +    hr = whp_dispatch.WHvMapGpaRange(whpx->partition,
> +         slot->mem, slot->start, slot->size, flags);
> +    return 0;
> +}

[...]

This HVF code is bogus and Richard has been heavily reworking it. We
haven't posted the changes so far, but IMHO it is worth waiting them
to compare before proceeding with this series. I'll let Richard briefly
explain what we had to change ;)

Regards,

Phil.

