Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47534CD98CE
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 17:25:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wY5dX-000608-9C; Fri, 12 Jun 2026 13:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wY5dV-0005z0-9R
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 13:25:41 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wY5dT-0001Jq-As
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 13:25:41 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2bf237e1433so14715215ad.1
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 10:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781285138; x=1781889938; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ap3zR4q8wn/pUeHvTArAj5xBgHaQc1AEBeZjVAImwK4=;
 b=byaC6Truy8jpgQBvQmXMjsjZDTdOOsOlOHlxOTcvrcLvp8NVvyUqKEQslNKK/1RHhN
 4cfGtWuea215wEQdyEnQ8pNyV4s72CPENaL22V50oOXK9gPw7R4pW2Zsvh53jpYjGd10
 aHlm8sk40OkXvXrPXpaeT24782ehJw3ihkSYvflbb247Btt9atkFLA0sxzMrqBkcQf1y
 nAoLdADtEMFwkarhVQ89rteVtVtNegR0Gmc/82xk40f658Nu+LTFuXQWPSHIRhzbPEd0
 WFPSvN2y0xd3Frh9WPGRhsqKn1djH4qxqYH0n0MMpDsGWcOSQC1KSmqb9Np+9L1tjadu
 40Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781285138; x=1781889938;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ap3zR4q8wn/pUeHvTArAj5xBgHaQc1AEBeZjVAImwK4=;
 b=oQDTYk7dv9yICxo0knZjS90I89ff1XqnAdirWsRshhkJ3JxYuH+gWUX0vFWiYu1t0J
 Q7jr+DTLqrsk7EAqfwnrNCyfe44gZorgoRzrv2t32Dk8ORF/Tk/7cVZbwzhiTsKnhZjF
 kXR5GA4DlMOrhzlMspXdghrnNUN8TDs07T7egCBrEv5zj/2rdEOpn9nX7ep6idQwRol9
 nyLnpazUz5FNxMbX6hRSQwoyyfpqLI8rKEy5ZeifuHttWwEM7vvNSBEhQZ8/QwgzDVq3
 dDniHA29rIxgwg//DMuBVUSOQtxyDDWQGFoOO/CaiJDEh+BsBVm1ovbZ8t+7jPok0ZC4
 qLmg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Je1sO3NdWWxIjqoTS9vqk6Jl+u7tXKhg+GWIhD3/mHqIdG1L/D2AwjUILYZb6NDwyNKXfxgx8qQ==@nongnu.org
X-Gm-Message-State: AOJu0YwYFyR+FNs8Vd74ISbyKI7QWbwIwSGZQwKa91kwo1zH/CX6mCUU
 oWSNuF5Wl2WHbWDqbGkilZ874EtCrhQDFFj1XGYD9rrjz84XW2x64851i1oSBUAkn5o=
X-Gm-Gg: Acq92OFMkr9cEru2Xgm3eHtECrNsX9V6qvNQQx3uZMAYB3//7EsKkWnKyT2fOz2ZPOt
 u+Z4GPmr+fOmBeiIXKCjPOSax6lXRe+pfcnG0GyEYcaiMp9WxzUna8zElGnWKxwIm05U96jmLVm
 QLgCOFspq9IDRR26RGKjb9qNmQo7cLeUofuq4VjR7O8n3VkW+1R0bVS2bRASZCKig2QQNcfV52/
 IXtgUL3ViMfW672GAyF2DmK6510NU/qhYQvAIeUqaJbZbSEu13xFh5VzdBEsopSilN34YOP1+Bu
 pEZYy9ni9SDt64KWZv0DtSSxlzNGOj/A33aH+LfWV04U5iz3aQRysX2gYLRFQaZieMe5c8C5la8
 zovIIXC94IPwzn4IPju7KD0cuRU7dhOFf4UOPSaGwkAziD5fpE09Ia9RxBjV40l5XGE/JqZ3xc+
 59vyqyi8a5NkC6FOiLy759sJtPC54XULlcbQoa
X-Received: by 2002:a17:902:e750:b0:2c1:e04d:7cb5 with SMTP id
 d9443c01a7336-2c412841372mr46331635ad.34.1781285137718; 
 Fri, 12 Jun 2026 10:25:37 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c432d86501sm25776505ad.61.2026.06.12.10.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 10:25:37 -0700 (PDT)
Message-ID: <123d9e80-d731-42c7-81cc-71de47bb13d3@linaro.org>
Date: Fri, 12 Jun 2026 10:25:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] system/memory: Use __builtin_mem{cpy, move} in
 accessors of ram device region
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, mst@redhat.com,
 berrange@redhat.com, david@kernel.org, alex@shazbot.org, clg@redhat.com,
 pbonzini@redhat.com, philmd@mailo.com, phrdina@redhat.com,
 jugraham@redhat.com, shan.gavin@gmail.com
References: <20260612110307.1264798-1-gshan@redhat.com>
 <20260612110307.1264798-2-gshan@redhat.com>
 <223f5f94-b9b7-46b0-8466-5be655203a0e@linaro.org>
 <CAFEAcA-TgP_BM0WQo3rysZmvhNN17Gc_nrSYB6pXn-mvs5w13g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-TgP_BM0WQo3rysZmvhNN17Gc_nrSYB6pXn-mvs5w13g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 6/12/26 09:36, Peter Maydell wrote:
> On Fri, 12 Jun 2026 at 16:29, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 6/12/26 04:03, Gavin Shan wrote:
>>> This replaces mem{cpy, move} with __builtin_mem{cpy, move} in the memory
>>> accessors to ram device memory region, preparatory work to make ram device
>>> region directly accessible and bypass the bounce buffer in the DMA path
>>> in next patch.
>>
>> memcpy/memmove *always* compile to __builtin_memcpy/memmove, and the compiler later
>> decides whether or not to expand inline.
> 
> Yes, but if you pass it a fixed small integer, then it is likely
> to expand it inline, whereas if you pass it a variable then it
> is likely not to... The patch is attempting to persuade the
> compiler to definitely do an inline access for 1, 2, 4, 8
> byte access.

Sure, for hosts with unaligned accesses.  We still have sparc64 and (some?) riscv64 that 
don't automatically have such and will compile to more than one host instruction.

>> My real question is: what are you attempting to achieve?
>>
>> (1) is the problem unaligned access to a mapped physical device?
>> (2) is the problem vector access to a mapped physical device?
>> (3) something else?
> 
> I think there are two problems we're trying to fix here:
> 
> (1) If a device does e.g. a pci_dma_write() with size 1, we want
> this to turn into exactly 1 byte write into guest memory, for the
> normal case where the guest memory is real host RAM.
> This deals with the e1000 bug where the pci_dma_write() turns into
> a call to glibc memmove() with size 1 and glibc's implementation
> turns that into 3 writes of the byte to the same address...

Gotcha.  Easily handled by not using memcpy/memmove at all.

	*(char *)ptr = val;

is sufficient for all hosts.

> (2) If a vCPU (emulated or KVM) does a 4 byte access to an
> address which is in the PCI BAR of a vfio-passthrough device,
> we want this to turn into exactly a 4-byte access to the
> mmap()ed memory which is the BAR of the host device. This
> is because that address might be a real hardware device
> register, so it's important to access it exactly the way
> the guest vCPU asked for, and not do multiple accesses or
> misaligned accesses or whatever.
> 
> (The reason we make pass-through BARs not "direct access"
> but instead go via the bounce buffer is that we were working
> around (2).)

That's going to require qatomic and alignment checks.

That's also going to beg the question of the intended behaviour anything that isn't a 
naturally aligned access of size in {1,2,4,8}: fall back to N operations of the minimum of 
alignment and size?


r~

