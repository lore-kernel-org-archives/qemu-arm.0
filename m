Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9496BC83F17
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:48:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFF0-0000ZQ-Ql; Tue, 08 Jul 2025 16:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZE16-0001q0-9W
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:30:27 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZE14-0002xG-SH
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:30:11 -0400
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3df5249601cso37185035ab.1
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752003008; x=1752607808; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gFl9ycDvD8hTkIKtix9h4JxZql62asrb+MOPRsaNjSc=;
 b=D+ZAmnDZiM/BvVkCkmfdl4XCg5C3mBLhY8sIHJHujEM/vnI69kfBwhx/BJW0SmgfD1
 qOc2ZYYy2tm2gKvsGzDhP+qYD2VZTN1WmiGZoO1/Wnu2E7FuQtK3GAWgJEDXhIO/3uyN
 I5R10P/35UCZHc2gx++bVtxgPYwmxOa9fzbKYOkdrILzxILZYTO3mcz4thbUzp0NR8Bd
 IVxrkfGQVg1vxTeOYcQJfX8j0gfPabZwjtP1aGvF2rYiAYJQmJJHQJaTy4EDdviTvWWl
 IYnuaPhtGqi5Boy9mIcBcIBwn9cOOrTdyLpl2WqwuSt3UDlCwBi42msnYNGgJJxK+0eP
 Ue5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752003008; x=1752607808;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFl9ycDvD8hTkIKtix9h4JxZql62asrb+MOPRsaNjSc=;
 b=Ai0wPg5QPuR1tjQfpjcKS0jI/pJCaGsCHcSk1YPpnmiXPkR5nVFGlei3Hnj60O++jt
 qPdozmtsUq6BlYkKIEYRiYLZPc79ebK3LFC/QfXtSTkneA5fPjPdR2Q0dKFahT/V9J2U
 8cBxrv1LVlYbjzn6JMJRIL6uqJNFPSUI8fK6FTmEYSnHvWYEXHTNeVpW7m0B3QXVGU0l
 hUxjMkTWclJIdEqCr5PVHJhS3ogdLbXpAhiu2Y6gqoQ4IeNZPzUMJORJRPI8dLR2wR3Y
 eJq210RutoAWKWIgYk3J+DG6ghb/prLp2ms5ydcnitGKj7tHRaThFF/ZDeyBACFRO08X
 Bdvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQq6n9NP5i5EcS6DwrMHwR7sPVJptTWO7E2hOpINlaIQ7Az1M18fHGUNxZEU/ZuvTQmbP++d05PA==@nongnu.org
X-Gm-Message-State: AOJu0YwFy+ws0x82PX4Q4WR8utknbh1xGGODpOdMeyyk5cCiNOkzmTTQ
 4/UIBIjnt/DOGaJ7TW/xkffdDi3/RGuTXStARs9naVRRwyhFaElhQZXC/KF7Joj5L9YweWLHOF/
 6pMclQlY=
X-Gm-Gg: ASbGncuH7afhF4aPTOKxOJm6Eb+ehH/eFUjQv3r77Zs1GYvPfwI/hg9UGT0z1C4aEAD
 1VyoWH3RlB6mZZ2aLWF19tER6P0gPKBQInuAbKheSU4eExEnPX95lfq/19Gdc4GqAKPMjq3meG5
 KJRGZSK7hmFMh2rDvePnDyzvBvUoZPDZbkmd7wDJKrUpVRamPWoLZXFjrsu+/mhVJpMW0c047+d
 J17jwvqWuHGhjfiKKk55S+mAMLnREfFGyVwStLM0Oo+BbcXsi55/vWk9ECyovcXapLmQKTmJMrO
 oZEev23aE70JeErRsHtmfkz65+OlMMcDxwuCx2VpNDzpl5todw4kbBwH+zChhPtxC1oPEONchhB
 wHzHuqGs/Lpn24/i4pSoSitTUtE9jZ6b3GDre2Cnb
X-Google-Smtp-Source: AGHT+IEtnZVx8pxz2Bsy1b7CSnXurKno5YuaxEVnhnM2MYcsGC4zvlbMkQQgbLPB0Lq6wNwAmjGpaA==
X-Received: by 2002:a05:6808:4fe0:b0:403:37dd:e109 with SMTP id
 5614622812f47-40d073dd740mr12731140b6e.27.1751996176929; 
 Tue, 08 Jul 2025 10:36:16 -0700 (PDT)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-40d02ac77e9sm1678991b6e.36.2025.07.08.10.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:36:16 -0700 (PDT)
Message-ID: <d182e9ee-afae-41fc-b160-971cd909b9b9@linaro.org>
Date: Tue, 8 Jul 2025 11:36:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 4/8] qemu/target-info: Add target_endian_mode()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250708171949.62500-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/8/25 11:19, Philippe Mathieu-Daudé wrote:
> +/**
> + * target_endian_mode:
> + *
> + * Returns: QAPI EndianMode enum (i.e. ENDIAN_MODE_LITTLE).

s/i.e./e.g./

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

