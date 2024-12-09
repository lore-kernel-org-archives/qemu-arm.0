Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2873468njb;
        Mon, 9 Dec 2024 12:50:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVg4mRHyud9RL36x1I2PgkgUNd4OQfi8DjmcHXk9rEV74+xo4bpNUImLKgX+uY7m5O6LmM1JqIvybQDhQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFNW+TQEeJKD6sBzc22/ckBI9fvcO1a90vH0xnsBkX7tR8YLzEgxbeEK4Qc/yhK0MIxugWj
X-Received: by 2002:a05:620a:269f:b0:7b1:43c0:3de4 with SMTP id af79cd13be357-7b6dce6c307mr292156785a.31.1733777405214;
        Mon, 09 Dec 2024 12:50:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733777405; cv=none;
        d=google.com; s=arc-20240605;
        b=cb9iwYmRkgxwTXMuW8312ufsv8+Mm/NX/PNUsrQJeQWYZIIX+llC+jkLAbkwrXBZRJ
         H51pZmJK4ue7Jn9uS4T0aH3crfaKJr+fRzN5+s2+nv82RAFp9q8kTXu+L7/dfJ/mw1dP
         gUmTpNFoKIXQRVzmOorRdLzdkpZ77FKf9AAsYzM7Je9KsCKdRyGJAfoyyRvZrO9qiFNF
         bjUUotpKdmZgE0I5BGGxGut8phHLpFaLSFB6xwovn2Whsysslsa4CRrlyc+1M+wTbKVI
         2QBAeJMIus+kJWRSFKvwweHumOpm57gzeVlVJbO+GM1Aj1uy45G/7a97ngde2c/x+6vX
         dwkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2LfcitCnMPp8cosJrqDDGIN0iIT3sziWW4Y54j3KgJ0=;
        fh=2Vn6ULre7MJCTAUsSK4mtf8QDJ9AnW1dIznPaVYZWBE=;
        b=N4idF+lSXoLXoP6SCpT72h9KiOtShA1xJN35/O8fGSXjvhXwlow8BDAW7vjQMMsbX5
         GCDN90gllPP6lHMcudq0RLKHsX4OwbXoayb780mU4MBxzOgaby8wcP9EO+srEPL9H3za
         RZZ4Ee0GRNmbGIcgZtyGo/yXLSgIV01FvV6HzWTaOWz2fuRA80FLdtnIY9aWPhG8tQSD
         lwQtMwZTEKPqz0q5JgCtuUZqs9QhVwvgNOuxvBleMo0CAiIZPw5fF1zZqTc5UMd3jzRl
         Int3SGU9M/TZg7LfBFJM+kbgGuV2VnBBzpBOTF38jJHVTAX8DmFQL8dTBpri7y6Erkxl
         PWfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u9e6/deS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8da6a2a17si125692206d6.171.2024.12.09.12.50.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 12:50:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u9e6/deS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKkhT-00044y-S9; Mon, 09 Dec 2024 15:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tKkhQ-00044B-TH
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:49:49 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tKkhP-0004Ph-C0
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:49:48 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3862a4b8ec2so1873525f8f.1
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2024 12:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733777385; x=1734382185; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2LfcitCnMPp8cosJrqDDGIN0iIT3sziWW4Y54j3KgJ0=;
 b=u9e6/deSbtpfP4KZ27nyrvSLB4jtQH7bupqppb3BxiRHDbbHwBu73zQfQCu+yF0V/Z
 spUtcqhfzdkJFcUCSr+WC0ps8WYrrD4YjR4wFXQk6VeVTUdn8klqYQb0ZNpZ3dtCRuzu
 gswPIqaF+2ZYUMLngyCl9ZqTuvZlvSrK/bXwxwRY/z97ZomgI8hY8CicbwKhj40YW9Gz
 m7nqkRgAeFFhxN4KhRFn568nqCinRtHjEJSwwsd6riCtGzhUEysdI95N1qQnedMOXxOn
 bMYx4rL6a8fbq88Ymo8NPoHjmaRdfkrEjavCje5TAs/nVqAKoow4DrW8CxU/pf2Dzf61
 5/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733777385; x=1734382185;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2LfcitCnMPp8cosJrqDDGIN0iIT3sziWW4Y54j3KgJ0=;
 b=nY6EWL6INqWgEz45pGkRX43OU7tnhfDRePUOK0CnZL/jGUakXZe93nbq8oTxuPr9Rb
 L2gvftlnE+kWGIV29yc+ln86orHBe0HP0YjA8L9qOyLC/FTcKF4QFsxQjF94h68QXzNJ
 MNit/6EPqS9uVFjaEF/BvKVViEXAuCsc5yOBK1Rfv2OrzNBLEZsteb4wfqaFoQC14w9m
 d+pM970R3ZGWazFqS/2t4/oghjbYohu8lz6Zlfm0a8XUTkrA6Y2CUfTiFWBNH1r7xgUu
 sysvee4JC7oGbdyZ+7e0CQlkwsNebC3dg9MJEhp7Z0FGU2XRsDKsnycODNg5if5axNFo
 zjHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrvYXkOIULtb1BjFV+4uiuOFw9E8UhYbpFnJTsgj+V8fQzG9g6SHSMn8f8XSDfRlfcmf5oS6IoZg==@nongnu.org
X-Gm-Message-State: AOJu0YxX/yDmSxjEy2b9bMtKpVDF6v/Urhfxo1XBb7e1oiMEvYkbVHQC
 IRyUeOF2DCginTk6o+8mlK0BLwfYXbPEVXynGjTMmCR27KWWl6goo8CBVXN19+Q=
X-Gm-Gg: ASbGncumiriGjWxd3CuKk6aluR+FZPkJ53ngifI+LstfCZfxSJldJGgK2CnHRzYYs0o
 SSFdx97bb8hrFjimBIs3iHaZWo9WwnSrzJQqSsEYfb+SobdpWVf7wK4RYdpkTa+9oH4pFaVk2Jc
 q3L/IwDcyXXcAnI6+UThsDP8kSINt2rliDJUTqVFSsPuCHsrjz2rpoV/WHUMHd4fUaFJ0waiT+g
 Gg7vtCwl1U0L5L9aHlIFrVaDmbQxvgd10JsWl9bw6khp1UN2u982DCKOnbC7gve3vIwv84Tfjgv
 JKojymE/9JdcngMzkrZAEc7a95LygsKW
X-Received: by 2002:a5d:5983:0:b0:385:f66c:a4b with SMTP id
 ffacd0b85a97d-386453fe701mr1490019f8f.47.1733777385391; 
 Mon, 09 Dec 2024 12:49:45 -0800 (PST)
Received: from [192.168.1.17] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861ecf40a0sm13918626f8f.13.2024.12.09.12.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 12:49:44 -0800 (PST)
Message-ID: <3a2dc416-bb9f-49f7-8f82-cb9ddc8feab1@linaro.org>
Date: Mon, 9 Dec 2024 21:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] i386/hvf: Variable type fixup in decoder
To: phil@philjordan.eu, qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20241209203629.74436-1-phil@philjordan.eu>
 <20241209203629.74436-9-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241209203629.74436-9-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TzOFIZ/kwuE0

On 9/12/24 21:36, phil@philjordan.eu wrote:
> From: Phil Dennis-Jordan <phil@philjordan.eu>
> 
> decode_bytes reads 1, 2, 4, or 8 bytes at a time. The destination
> variable should therefore be a uint64_t, not a target_ulong.
> 

Fixes: ff2de1668c9 ("i386: hvf: remove addr_t")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> ---
>   target/i386/hvf/x86_decode.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
> index 79dfc30408..6c7cfc820f 100644
> --- a/target/i386/hvf/x86_decode.c
> +++ b/target/i386/hvf/x86_decode.c
> @@ -61,8 +61,8 @@ uint64_t sign(uint64_t val, int size)
>   static inline uint64_t decode_bytes(CPUX86State *env, struct x86_decode *decode,
>                                       int size)
>   {
> -    target_ulong val = 0;
> -
> +    uint64_t val = 0;
> +
>       switch (size) {
>       case 1:
>       case 2:

