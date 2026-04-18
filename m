Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C17AF99C95
	for <qemu-arm@archiver.kernel.org>; Sat, 18 Apr 2026 22:16:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wEDxo-0008AV-4w; Sat, 18 Apr 2026 18:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wEDxj-00081F-NC
 for qemu-arm@nongnu.org; Sat, 18 Apr 2026 18:16:28 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wEDxi-00085P-81
 for qemu-arm@nongnu.org; Sat, 18 Apr 2026 18:16:27 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso18884235e9.2
 for <qemu-arm@nongnu.org>; Sat, 18 Apr 2026 15:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776550584; x=1777155384; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ePfa/GMngx5939waiNGcXDE+WF6mNQU/sdgDKua9di8=;
 b=XRwlP/Bugt3uONGDwJrayVrqDfFSgEgtKICr2bC+uF0HE2ag4ypoptDRVKirEP8yrU
 2TuEN6ifvx8z4To3/fnQW0vB7pYP5UMk7uzIofzVhkYP0RJVmDAzZtZM8UzVb6cztcSd
 ayHQYCknNDJYlTtHgZdKAE4G7WQ2djMJ68uugZ2Z9+Q2UqhutSihIK0A4glhdkwDokvB
 N1g9SYongoghXwXUjreVImZqORWKfHlxcnKwbhEd3cxUPsqXxmw4OO9t6s0gamoKEGOB
 U/2ywi/pQWwvr0bAO+0Dtqrty+UhXbJq9tO0S3dlFcisiCOSkLUiShM1bbsJtWZAVZ2k
 5zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776550584; x=1777155384;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ePfa/GMngx5939waiNGcXDE+WF6mNQU/sdgDKua9di8=;
 b=kmM8lHjaddPQQfRgz4ChGOXsd1C7dnVsv+XcLFHD0urx8YS4RUQQIaX1iacM3FJPMw
 wGc48NbGo9VX93vkKW+L30uumniZJS8JmqvvpezTXCYq/Ac+xvUAJtl4DoYaK2ircGgA
 G0BzK5sC4eyWRNUo+c0i0pWL38lAS7MPpcIYOr9JFgQEZ0Ar39H7YpZSkAWrw8Zs6isT
 XcbmZQqmhFYGXW22aRYEGVYdJ4Zm/weOfN0qkRC9RZr4XAbcJgiiNHfRMoZ7jEVjX9C0
 qK5TYNg5gPgEmC4MzWa7mXtY+r+UNX7WvwlN/Vq14TaIu9c7N/dFbdOdPeIa0j1i1/vc
 gaFw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/utXzG6ixwxhYiz/as4XxEVzp8PM130a6sLlsUHrFHvJZY2rDr7F9zBlbHJBITZJVX0fKHoTHI8g==@nongnu.org
X-Gm-Message-State: AOJu0YwrRsdAfBaWNb2b9fY2SVoYEA8b/BIRPChozAjDFE75CrcE/OuL
 Ja5kvvpLyLGPBwrpMrSBJltstkbqvP+WoJZrhsc8G0CQFCSttJSvpTaFIl82C+7OMUk=
X-Gm-Gg: AeBDieuBxakUkP6aHoJLIxqhwLosrLl0ErSFloTZIj2EVW+6NuGM74i++HnAjXbZovC
 rsyN1you6XRECHDpCACaSIbgs+jxzzCINqhQcoqfROl8YD7nGsVZpX7rDo2nnGnlPxDgWlKk6Ej
 zrA8nW8+XU0fuKMuJJok4g01Cs3HycB99v70B7KwQ6iNHVrkuU9a8SgCuh9VeXCuF7cL8fmItZ4
 1O3WGqsYSbYsgDGvP7Crmm4kE6XAhkzIG2BjK+nWD0/Qh6DWJrPn8G4CKuDZpf1TFSgKPZ+BDf0
 OYcHON3mJ+kt4ioqqv3HDDCNagaz4rJgd9ociP0IXYz1A1TNEUNQxEjApIpj9QY40ThGrqHFbHD
 ACMQkTIyXQdi9YOrPqSYluo0knnQG+MV8hBu8d3UYJyXxdqfrC1pCed0Bbhx63TPRCOdlG3i1a7
 d1ilP7pKYEE/oCGU1XRBmFPM3eBCtLCrlcUy28hJHy5c6iIxpVZo3qwhKRaMHNupD/CAInSbNKs
 nyy
X-Received: by 2002:a05:600c:5295:b0:486:fbd1:9dc0 with SMTP id
 5b1f17b1804b1-488fb780463mr102683585e9.22.1776550583775; 
 Sat, 18 Apr 2026 15:16:23 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1682sm16978866f8f.1.2026.04.18.15.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Apr 2026 15:16:23 -0700 (PDT)
Message-ID: <0824f794-c89c-489e-a020-1e75f3b00321@linaro.org>
Date: Sun, 19 Apr 2026 00:16:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] target/arm: Rename arm_cpu_get_phys_page()
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
 <20260417173105.1648172-12-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260417173105.1648172-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 17/4/26 19:30, Peter Maydell wrote:
> The internal helper function arm_cpu_get_phys_page() is named that
> way because of its use in the get_phys_page_attrs_debug method.  Now
> we've renamed the method, rename the helper to match, since it can
> handle non-page-aligned addresses.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

