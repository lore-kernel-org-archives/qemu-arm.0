Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D04FCAC5B0
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 04:19:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5z9p-0001YX-V4; Tue, 07 Oct 2025 00:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5z9o-0001YB-VN
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 00:18:36 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5z9n-0002mO-FW
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 00:18:36 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e2c3b6d4cso46288035e9.3
 for <qemu-arm@nongnu.org>; Mon, 06 Oct 2025 21:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759810713; x=1760415513; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ntoOjDf3YoDqQyd01IVuHNpp1dAxZUIRQ7d+2mqIJ0=;
 b=VxD3EMUGCvQzqAAooHgKdHv+HiWNuQZoepzVHzp0+rtH2TOSEG+Go+CINm8esjmAMn
 2mEYqpsFCBa8KMUIxzCzRe8+fTtygoU7HGi7FtmDx71xwceNyYGH07DIQ+h+Bunsg6qz
 aXOmo1veQ7EjtLEhcHzHevek8wKZgjWXzrAii7laS0ngPp6TNbxlMxcK8UNtyGblC+cF
 fNqcNPnhl6bkhgo0VnwOyCY3hkf1UmSS4qAReGRHEUylcyiiIzTOvOxdsL9i6pB4NtP8
 +2YjLWu9JpWYOzw8N8E1D8yO88zzYNutpUURoN4c4aOhYWPzs/fsUnU3KAmKpwGzyOT0
 owKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759810713; x=1760415513;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ntoOjDf3YoDqQyd01IVuHNpp1dAxZUIRQ7d+2mqIJ0=;
 b=uEVjGSwVcAfWPrLnLOFzHywak2YFUAHnTrP0W58RdTOgYlIUkhclkrxCbSrwsmb9Bt
 kXk39Grhge4olVusriGwj/s1JS7exy8ZVSTbAk8oV9qYJYaba3vlBDU5OD/SlHE5UbhK
 UmYjdm5ZLGwi540x5GokR+hMj7AmNKebtfeoHPp97IFZZ0obxKUyTIxspWQs0WAD/CFi
 7JlxUk51xVcfTt2w7kz6xgJTBQM2mq3ak9toPYDIEB3H/RlR0dec3cwQBZtFmulBpjH6
 MN9blIPBBtlIvivTuxJiwbIyt1eB5HkoS9xVMkcd3Un4Oi9884ytGYejIPgasdx5aVia
 D8aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKqmQiQkvrHRHUmJKgTu0vdfZIfib66IyT9GwBRIwcWGXXQhIYuF/QfaQJXGwqdFjXkYbeB00DIA==@nongnu.org
X-Gm-Message-State: AOJu0YzYWXC6PCYVBWugvTVDW3sE6EGawUM9qksovsKYKTWKDaoH0MI3
 uy6lfJp4wxZAKqFTiOd3M64vv+0aHfLwsG9kagXU4/WCsikec1CdmDCbthrgsGjst1k=
X-Gm-Gg: ASbGnctzV/VYn7ac4UXj7ojO42bYN4wONL0qfxCvkL54deOqDVDedLxEgBm0LnHolnX
 ARiEHqi4I82Y81itM4E0k3AXdHUAWmLEtXUkGaSw99ezGt38aqNQYtKzLjqmDX41YbCZyRPcKCC
 EBVmMi6WwYaaQxsxuJnptpF5p43MDM9GfNSWFWi5JzkqPxiAyfu3hCnMopzRaU/zBn+A/oMH4V9
 hFqOKTLdP48Voq5QdQS+WgTeEgKyW/Z8hKmqC0cd1CLzec4lcApjWZEpv6CKeQm0aR197mNMLus
 wPYovYG7gaXDO2HvKqLXOe3FxvKkax2ZWTqPrw3EqupGJEs4CUlOkZygp0rrLBMAUJPP8V4Q79O
 zg1hp4Tkx9ae5UfECbJzfcqTESn3mwoKzEmwJXEDd3UuHaCbUJpfMcnyFDpjRr/TfOKEI0aGSNT
 A5QjNcLdIdqhwitaTHog97dNc=
X-Google-Smtp-Source: AGHT+IGDAlw8peXRTxmbt0Dp91xBc8r3hdWlLYm3DcowMVLMmpP7BCA7xxiSkKgRVs+57f6H2tonLA==
X-Received: by 2002:a05:600c:3556:b0:46e:4004:a296 with SMTP id
 5b1f17b1804b1-46e71109df8mr105103335e9.9.1759810713028; 
 Mon, 06 Oct 2025 21:18:33 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fa3a0e89dsm8123995e9.3.2025.10.06.21.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 21:18:32 -0700 (PDT)
Message-ID: <1b6204de-c54f-4ff4-82a4-863bb39378ea@linaro.org>
Date: Tue, 7 Oct 2025 06:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] target/arm/hvf: Keep calling hv_vcpu_run() in loop
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-19-philmd@linaro.org>
 <E1EA7ABD-000E-454E-A49F-E8FB5572F831@ynddal.dk>
 <1c196a68-0b97-4c60-ae42-9b3643cb1d72@linaro.org>
In-Reply-To: <1c196a68-0b97-4c60-ae42-9b3643cb1d72@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 7/10/25 05:43, Philippe Mathieu-Daudé wrote:
> On 8/9/25 14:26, Mads Ynddal wrote:
>>
>>> On 3 Sep 2025, at 12.06, Philippe Mathieu-Daudé <philmd@linaro.org> 
>>> wrote:
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> target/arm/hvf/hvf.c | 40 +++++++++++++++++++++-------------------
>>> 1 file changed, 21 insertions(+), 19 deletions(-)
>>
>> It'd be nice with a commit message justifying the need for the change. I
>> assume performance?
> 
> Performance is a super positive side effect. Actually I had issues in
> the outer vCPU loop because it is only aware of EXCP_* return values,
> and the code handling unknown '0' retval is dubious. IOW I'd rather have
> the outer loop assert for unknown values, as a programming error.

(Also Richard later noted flush_cpu_state() should be called out of the
inner loop).

