Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57831F99C9C
	for <qemu-arm@archiver.kernel.org>; Sat, 18 Apr 2026 22:19:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wEE0J-0002m1-Fo; Sat, 18 Apr 2026 18:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wEE0D-0002k0-R7
 for qemu-arm@nongnu.org; Sat, 18 Apr 2026 18:19:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wEE0A-0000Pq-BF
 for qemu-arm@nongnu.org; Sat, 18 Apr 2026 18:19:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43cf8d550bdso1641463f8f.0
 for <qemu-arm@nongnu.org>; Sat, 18 Apr 2026 15:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776550737; x=1777155537; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KlA/U8IzlztRpTjIxKWBW7w5+tdKgQaG5Gqw3lrujRY=;
 b=HAeAT1r/yf8wup7TD03OsxvktgNnzVpK5/KAAli+biF+6kR8mkRDRL7hnqqgtu5cpL
 0t6xnQEOm5Lu0p0gpZVlsUOWL1fb897qE/QabiNPo5DkTtlYg1r5Hib/mQX1MNXEjAP1
 AUT5vB9ENoOjhiXy8MhQ9QEU5n0J4SJKdSYwF0bkkCld6RRBtinLOe4YRY6KfusORnPX
 FMuKZI2WMQR7GnNqkFlCNUZso8KKwtYbnVFXM3E5mI3Za4siH7MfGdK/tHaumMVynj1x
 Uq5VrkWuouXMWeVv1b0lzSqmL8WoVKKTIjL1suoIN0I3UWedjaL3mHwCzzmEk2iclRXK
 IYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776550737; x=1777155537;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KlA/U8IzlztRpTjIxKWBW7w5+tdKgQaG5Gqw3lrujRY=;
 b=Y/dqeri11/GOrOHezEy3ENpZi84uOdvaaNFFm41cGGV6ojK547xq3/zKkn8lDtxiC+
 zuaHYYqfdqJPkSJf5GPKSfFHIoNVvgTZ/GvhKcGmHF+5BL0zwipjZZorhAWgr5phgcdJ
 UhsgDJAW61IDWZO5Jq+8Kyh1taYizHwO52mwDarpuCTY1YncOXypAg5Vu3Z9cWxJb5xg
 o/oavuzQtps9OXzUgrjVfp20U0gL9sfAgk+ncaH4BCGj/gHY4U2b0p10jalmjKVu0/Jf
 3/0hmBhhMVsjbZLoMFZ+Yj2V+zv2zMTH6N8UsVeJhW/3djxleIl6MKPANXtiABaFpmE+
 bySg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9gqkEeHOOBl4kemapGUEzPFxtFr2FOQBa2BekOsY6otf9i2ncJrw1wSJf5vJv3qqe5wuiKYe8uEw==@nongnu.org
X-Gm-Message-State: AOJu0Yx1RHhT93W3rUwVQziVFy4tA8DKn2YV76rMpieMF3O+sDTDT1cB
 SsCAaiQTRVbBXjt9vmO5oFVs3+NXlrwjQj2taXYzpc4Oq6gHZn58al8QMiz0ifmn6Tw=
X-Gm-Gg: AeBDiesrLeJr2MMutUYBtJ/hOjg90N8iKxMBPKDhNYgn+gYqKeCMr/NmDMN7D1/2dSv
 BhnR3y43esIRnW8Y7oqyyYttzIm9nuoEAYu6i05Z/mwqXVPzVAl8eRk/+ky/XBlFA3eY9gpnMKq
 Ty/2Gc5XdAOUAeT7mLnBrvN/6sbvXX7yQU06L4B6caSicDWn2RHXxeUKSPzggtFj84wXZANGEmr
 kkCiGgSPbWW81JWKTPbLRdowXzj6N++RE83rDD6AEd1xti6bp95pRYEPjYrIYhyK0qRymjlCkyS
 z+YTNI7+pGaEn2l47aIkJb1Jh3DXRy8JO+W1StSGFO9utPPeAcPClARhztt7+WKkJDYf+sF9szF
 ogcNyyXBiz0DAEDq1WaC7h1QFQf2mZcmsWJvERDBkODfqk+MLEVls+/91I0j9RVjp51g5h60g6j
 rtTrk4PGAyaQaX5CRF6crEEua55prJxSRVXsUIl9ve5532HDhfistnZ/TDdMhfJSv8RsKbe2jmr
 /0g
X-Received: by 2002:a05:6000:184d:b0:43d:7633:2649 with SMTP id
 ffacd0b85a97d-43fe3e23dd9mr12771269f8f.45.1776550736636; 
 Sat, 18 Apr 2026 15:18:56 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e44f69sm17077287f8f.25.2026.04.18.15.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Apr 2026 15:18:55 -0700 (PDT)
Message-ID: <10de63fd-88bd-4088-ab7d-d97a722ed1f8@linaro.org>
Date: Sun, 19 Apr 2026 00:18:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] target/riscv: Make get_phys_page_debug handle
 non-page-aligned addrs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260417173105.1648172-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 17/4/26 19:30, Peter Maydell wrote:
> Currently our implementations of SysemuCPUOps::get_phys_page_debug
> and SysemuCPUOps::get_phys_page_attrs_debug are a mix of "accepts a
> non-page-aligned virtual address and returns the corresponding
> non-page-aligned physical address" and "only returns a page-aligned
> physical address".  This is awkward for callsites, which in practice
> all want the physical address for an arbitrary virtual address and
> have to work around the possibility of getting a page-aligned
> address, and it doesn't account for protection being possibly on a
> sub-page-sized granularity.  We want to standardize on the
> implementation having to handle non-page-aligned addresses.
> 
> The only thing in the riscv implementation that we need to fix
> is the place where we explicitly round the return value down to
> a page boundary before returning it. Drop that.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/riscv/cpu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

