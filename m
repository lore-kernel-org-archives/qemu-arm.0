Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8125FF99C9B
	for <qemu-arm@archiver.kernel.org>; Sat, 18 Apr 2026 22:17:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wEDyU-0001M1-2N; Sat, 18 Apr 2026 18:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wEDyO-0001Ft-Hz
 for qemu-arm@nongnu.org; Sat, 18 Apr 2026 18:17:11 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wEDyJ-0008A6-S4
 for qemu-arm@nongnu.org; Sat, 18 Apr 2026 18:17:07 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso26079355e9.3
 for <qemu-arm@nongnu.org>; Sat, 18 Apr 2026 15:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776550621; x=1777155421; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rkwGeMSpnBapIgdJPL0XX4p5ULR2X+O5b3dLSMCMjKQ=;
 b=qtJt5CJ4H/Pk1gkzy/jZTt8GuA6+2vF4Yvxsmnfz0iG3SZSTAl9+58YP8Lf+rkRDJt
 2vC0+Ezb3hrYI961W4UyWqWYTeCPCPbRc/n85IFK6RAa9EkGzimWSoLE9naKWgmo4E/6
 nBtKYUODt+F72ZuUXNZ3uKHRUTB1PFWYapVg0yIhtYctyDH3JSrmQHODfzh6KRDc980/
 lZyqc/NeAG6c/XBSOQSMvHtQxCUVj9P4Z+ommDE8vXkLyUyDaIJx422OoUhbMW6AGUsS
 /Arx1RlNOYPu/qhsdBXsmo7SsaP0XJTlA9x5qpG+g9QqZK6QH4UcA2F653n95HSU0lFH
 fRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776550621; x=1777155421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rkwGeMSpnBapIgdJPL0XX4p5ULR2X+O5b3dLSMCMjKQ=;
 b=rzRPVpLfgXJn9WeJUe7VvCKf3iTefaOkaKwTrJ/1uOCx1Xrw6vuHMnSefNNc6hyAYU
 KievJ2+kGZaDM226zfo+bA0KmIBp1MszksTA7pMNEozFuPMXSTvNG+Gqn3t4OXe6PCtn
 HuhWibXCJNDQR1njBzOHlHGk35Owa4LyQCFH/vRom+mp5nDs4h3sTFv05MbY1nSQZnsN
 Pw/hvvJbqoWaYYmkbCIydBfskrV5UdM31mcNTiNbQsGq43KYAHKilVBXh9ndTIxhuJ5L
 SMPXHlK3RGg4iXuo0jzL3Q5WDfbPMYrEc1B6pyIDVoqsBbyRLV2GFW1q4uAxjkjXPL3N
 glVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8V6ATsK2ot48/xXFF7BqYw4/44u95FnjcljrJ3XlFznxxdVQvdopTL0AL5klYfYv9E051Pxm0j6Q==@nongnu.org
X-Gm-Message-State: AOJu0YwlER3PmUg7KJf5LkJEWCY44XVEc4e4fOQfaRAu/oYAacq3zw58
 ZCmyosYlzztOz7+FVeTQeWyR4BCk2kHGW1gkBNt/Kuvr3G8JWxKIyYPBEH5EgB9T53o=
X-Gm-Gg: AeBDies+5Kxf9cOt3Mr3iF4pTaxJd+s6WHuLkQBecpm4qfAm7jEO0c8wKb4ZSjj8b+o
 SlXtkIjX5r02dxgD3hfjnU7mA+3S21Bh+SwLGsIr+TvM+CASlUANgtFFejLvVFDk+GQ0fi1zTGS
 OJ3sDxH4AoI9LSB1r5E3o0a1W48FxuzzJdgvv1Va/lYS03htdwYlxkB4NqrIgfFueQTEnOlAMVP
 UudO7g+8AAwFXp9ny/kZ3HZymDNZqw5sxSCSsV4hqjvCGwnssaAeO7ebpGD+XaIhCqqY9TbM/SI
 JO+Bfj8ne5+3HKMwoQMWGPyDP7Bq5KAcnEVyH84xoBxob4GhgDKM8SB9qNy6/uSDxdrioLZrn9b
 xFCBw1By0+1fZ+TcVeWWwedky1JYuhwH/5gfHWm+PlCCdhkc40sePPo13vxf64bRWVl/+e9jck6
 ASdJhYTJcueHmK5Gvvgi3zF6MpyOnHTnn+4AcFs+HTn3uy8r+qBhi5uuJ52uGzWNNCZZayfZYMz
 sSz
X-Received: by 2002:a05:600c:a416:b0:488:af48:af11 with SMTP id
 5b1f17b1804b1-488fb73a9b8mr90585395e9.1.1776550621096; 
 Sat, 18 Apr 2026 15:17:01 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7c2167sm49193415e9.36.2026.04.18.15.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Apr 2026 15:17:00 -0700 (PDT)
Message-ID: <1f029e85-5405-46dc-bd1b-0998c6f622c5@linaro.org>
Date: Sun, 19 Apr 2026 00:16:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] monitor: hmp_gva2gpa: Don't page-align
 cpu_get_phys_addr_debug() arg and return
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
 <20260417173105.1648172-13-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260417173105.1648172-13-peter.maydell@linaro.org>
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

On 17/4/26 19:31, Peter Maydell wrote:
> In hmp_gva2gpa() we currently have a workaround for not all implementations
> of get_phys_addr_debug handling non-page-aligned addresses: we round the
> input address from the user down to the target page boundary before the
> call and then add the page offset back to the returned value.
> 
> Now that we guarantee that all implementations will return the correct
> exact physaddr for a virtual address, we can drop this handling.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   monitor/hmp-cmds.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

