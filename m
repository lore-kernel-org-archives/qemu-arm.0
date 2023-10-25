Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp6642ejb;
        Wed, 25 Oct 2023 16:34:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqqmOsTcz+Is7GT2JQQs4JAbDglgxYaz2pVyrpxYOGjcMAIwwCUN7Aguc726l71mesGOqM
X-Received: by 2002:a67:c28a:0:b0:457:bc5f:b4a8 with SMTP id k10-20020a67c28a000000b00457bc5fb4a8mr15560342vsj.28.1698276890243;
        Wed, 25 Oct 2023 16:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698276890; cv=none;
        d=google.com; s=arc-20160816;
        b=EiCgUNPLnjjmuu7avoZW6Tzk1dsx9b5MDHFzvkdfXGmiqNyVvJZXgzxYzOypiFTGu6
         fAOqB8uZX4HaSaTuxT0ecDTDJQIN1s7FixCHBCudVgE3wMeLTRO5p/w/O9i1eXxWLSfQ
         04u5MpMmKslASJwMXIPSQJ+vvsTgGbISa+9ZTSYLhb2yyPWi3LUMz8SjIv4UK5Kj+gir
         ySBUPkJG54/O2UNnKWoCNmykkEk+U5UQe77Wp5bKo/9cNxKfh/i/vofruugpGmNbeY0t
         Yx02IE6PbOCrq2Lru0LWLjIPW31h2SDbLSo+MQtjFDO3ePatdeTQgYU1C7vbY8Oebbav
         33Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=dg1OBB8uq30rbUjGjBKh1rlIsUrMi7z4i1E5b2xoMC8=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=w7aSqtrdtWVhsNHLHB3UfKWlKOTKzY5SXTTYJMDKT+tUMi31g8/NsWw1tpFxMm5wml
         ZN79jnwVFkICBtQhO7ZXNkebyaK4JUjYO0muci8koCSYI5HxqGnb+WhK7SVtCZ8Wnkw2
         Y4gTO00pYeH6M+9Q42XfLaGqXH8L1MSiW9DPmyPSZDkc9bOXGoUK/m+ndZVzpswgsgpm
         8sQGl1B+U54nhQOIWymnmOoTsWQwF0oPsXIn/pxXGYnjSuZ902yd63/qTTIFxM1h4zoB
         obW+m12Vd/vmZakinHlHk54rbzVyFRnVUt/W4nsFAT7HJbrUc2WHLsHD6vW8mgh1vUEN
         EzAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PU/bOO+V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a0cc247000000b0066d1f209be0si8966681qvh.511.2023.10.25.16.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 16:34:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PU/bOO+V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvnOY-00016n-IN; Wed, 25 Oct 2023 19:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnOU-00013z-C7
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 19:34:35 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnOR-000749-Cr
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 19:34:33 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c9e072472bso1987045ad.2
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 16:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698276869; x=1698881669; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dg1OBB8uq30rbUjGjBKh1rlIsUrMi7z4i1E5b2xoMC8=;
 b=PU/bOO+VZEn7XYRHojh27v7nvsXEMt2RnjqwnyGwOLMDNBr0U4TEb8YxUi+F/t2jmz
 uGHFEwg4d4rlGCwZnP2wE6ndoDkEFRYHDtg/Jsh6mvAMLUKYkA5tzWgA0zAhTNhMoon4
 t251lpF+MXmOgB99K6n0w9SyFmTfmpaoK9GlHMoHsvlGv+dVGGslRbY03I1nJAkFSNvh
 k0vEa634WU6MsWopDnY4TXrJjZSdhN3Cal+uiHDH+W3FyMv4ay3UuqFmBcoFsvFqVMh2
 0szbJ3jRoI9ESK3n0emRh1XT4eMtNDQHJKZKl2Uq4+h/ZZ7w8wP/h0TSbVTw4LLT6tbj
 lSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698276869; x=1698881669;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dg1OBB8uq30rbUjGjBKh1rlIsUrMi7z4i1E5b2xoMC8=;
 b=Q3+XK2/uPbEQOLyQRlwtqTuo61kFIMDXwq9hH3efBTFdN9rZsy+C8hFS4sDP7V5RhX
 oVbdVukWVkLgCh5dFr9GYWS1ERE3uIkNYOGN3en9IT6+whJhYkHtZbsAnrpYO7SB5OzV
 vIbY/SpuVfATedHXGZOQVosP+/2BneIkD6tOo/xMXEW+t6a2WKzQI6MEOh1eyj3n2ESb
 2ODctVy+LsbMHHjKiy9p1zR83NUsNck1zAQkyov5eieyzLVGPxxHy6nmaJOdj7t+H0gn
 /15qsYstcRIFolLhXVZRt8Ig1yYnFik7duyvFrXzSyFAz6I8uUuVnlpuNITuEyEp87DW
 PE8w==
X-Gm-Message-State: AOJu0YyT8y9UazPjEcGOWI2rdcCWtJ5tvJqxLN+imj9nbE2psYcE1goD
 Vua7E25hRJMpKfp4R03JntLnow==
X-Received: by 2002:a17:90b:2b46:b0:27d:882f:e6c5 with SMTP id
 rr6-20020a17090b2b4600b0027d882fe6c5mr14473017pjb.9.1698276869092; 
 Wed, 25 Oct 2023 16:34:29 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a17090a6b8500b00277371fd346sm475304pjj.30.2023.10.25.16.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 16:34:28 -0700 (PDT)
Message-ID: <bf12b6fd-af13-4d9f-9359-5fb6139a6ffc@linaro.org>
Date: Wed, 25 Oct 2023 16:34:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] target/arm: Move ID_AA64MMFR1 and ID_AA64MMFR2 tests
 together
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231024163510.2972081-1-peter.maydell@linaro.org>
 <20231024163510.2972081-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231024163510.2972081-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RHSfvVkQgl0J

On 10/24/23 09:35, Peter Maydell wrote:
> Our list of isar_feature functions is not in any particular order,
> but tests on fields of the same ID register tend to be grouped
> together.  A few functions that are tests of fields in ID_AA64MMFR1
> and ID_AA64MMFR2 are not in the same place as the rest; move them
> into their groups.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I had initially tried to keep them grouped by ID reg, and then ordered by field bit 
number.  We obviously haven't kept to that.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
