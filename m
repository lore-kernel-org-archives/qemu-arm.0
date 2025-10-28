Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E35CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:59:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDiLu-00073g-Ie; Tue, 28 Oct 2025 07:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDiLs-00073Q-OC
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:59:00 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDiLo-0008Au-3G
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:59:00 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b3c2c748bc8so757783066b.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761652730; x=1762257530; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wy2BlbrxqK5kccqEE3t4oM3+Zf5sY388xcAHOtsVmlg=;
 b=av8jBkydKjQp73oG24MD2IK+9W39D5AfQ/sTzOQVp4LQGn9YoHb94yxoArscG7LDsA
 hEceN3MTf4FaTP2EO9EEEN3vGVxpfKYDfGfT6cMqxytBBJ6q5Ad9BmEsl2io7Oost8cV
 eJXTwJWS/sN8G9oqXipAKYNasjMDqErjvew75aZvb9k/Up+1/cmIIPeAZObnrdLZH5ar
 yKpMQ4lB0eQnMtqdC9/+MdQhIa5GSFuIGnFV3/8IIAKxdMEjZyPpQRt39zGFqeKX70QM
 kHMveqJ9sItFQPJ7eXfDeWnakCCtIzTxMTTi4NzF7MsmY59EWaoUCkBij2INcPom3Neb
 X9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761652730; x=1762257530;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wy2BlbrxqK5kccqEE3t4oM3+Zf5sY388xcAHOtsVmlg=;
 b=VrNjXwl55kxgv8DMb6JClviByuhraHQNVpaHUUy77i0YEVmFhhcZQ1C9hlA95F8EpX
 4yTUepXixIHd/Gn8D2VLPT/wkObOnftYVmohLpn+AOb0JaFv0EaCDbhwbH3f0UNL29Jt
 1IaxieiyjgG5z+lGES9aF8YdyMhvy6QkoRzKQlchaNVltuAn5vED5NLG1zTiKsEdPUj6
 qMd+yohUGazRSVihF3FZG86HMe/W4xQpBbVPjA8NXIG2GtL0UMG6AoUZb3AbVU0xnRh4
 RSjHbvWW0XkCEpAGCzTz/TM2/TSnNYZ2Uc97/epuktO24JSxcIMkBqx8A+Hf13eNJk/r
 O4OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPYLFNRc/HwArDANAYokSOF3zRx5Zca8zYMZHztYXGb4ZV797qqIQGZoFm4aJKmEo80l0siXYA0g==@nongnu.org
X-Gm-Message-State: AOJu0YyIYpna93MLr5hIPpNLD2p0i5B3k48bkpF9N/Un8Ut3RfLXjjmx
 gLxCRF1vTYz66Bh5d2dsXsxXleqmJfDAfZNWi6WIZKFhvojHKLyE42kpEkmxmPG44rc=
X-Gm-Gg: ASbGncvJW8mhUfXvcdfLDATA+3NL41J1B2IwlQYQEo//sM/UojzL2uho3rEsyTEKMmd
 9JNbH7J7P/JL4K/fj/llvZbRCz/pnupAvbLA39zfE35Sst80nVhXPAtausgjXR2qSXsV+LXLRSk
 idxL4xNfzLXmJx5QaRtOkkggQsQ982LGPer5ec/Q/9pdziHxx/sv+8plNA7jAM8e0ZdcMhYlLt5
 HtzKtKJoogAFRvVySwEHqEQe3LMYIexzdmzLDfjA9I3VK/KBy49r5MMZs8C0N44C+Q9rzMAeMy6
 VdCXY0gam/ENwm9ZyIG2GCp3kQe6WRRoz0o4cjiWiHZEdLiFghADEWWZQablQabwhkZd21FEPU9
 zjTQQoFMYDUwMqo+moowZPY5KYhiQONdrbASGMo1V5zQ1v2zL6mJ4PFsXm5ayrMVdRGsX9CwV/J
 X3r+8zJ07XfJ6C5tTB
X-Google-Smtp-Source: AGHT+IHXiCoxFla0G3jkdf0kzf3uOGdZNKHg5UeyhsvibzUa33gUAF2pOXQ2ASTh0pP6h+6Xuf9aTw==
X-Received: by 2002:a17:907:6e88:b0:b50:52a4:8f9a with SMTP id
 a640c23a62f3a-b6dba55baf3mr360297866b.45.1761652729686; 
 Tue, 28 Oct 2025 04:58:49 -0700 (PDT)
Received: from [10.240.88.227] ([212.144.248.67])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8548eda6sm1057613666b.75.2025.10.28.04.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 04:58:49 -0700 (PDT)
Message-ID: <c58dd19b-5bf5-4cf3-955f-e98a89fecc89@linaro.org>
Date: Tue, 28 Oct 2025 12:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 41/59] target/arm/hvf: Implement dirty page tracking
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
 <20251028054238.14949-42-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251028054238.14949-42-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
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
> +            if (memory_region_is_ram(mr)) {
> +                uint64_t ipa_page = ipa & qemu_real_host_page_mask();
> +
> +                /* TODO: Inject exception to the guest. */
> +                assert(!mr->readonly);
> +
> +                if (memory_region_get_dirty_log_mask(mr)) {
> +                    size_t page_size = qemu_real_host_page_size();
> +

Call qemu_real_host_page_size once; mask = -size.


r~

