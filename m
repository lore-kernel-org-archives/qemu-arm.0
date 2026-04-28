Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8F7FF885A
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 06:09:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHbde-0001y6-7r; Tue, 28 Apr 2026 02:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbdS-0001mr-V9
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:09:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbdQ-0007jr-Oj
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:09:30 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43d03db7f87so7466671f8f.3
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 23:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777356566; x=1777961366; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rtYH4PQyyJnj1p7aRo0kfTr9/95pcoWQx2j9Q6QiHf4=;
 b=chYpD3vm9pQsPR26pyplkHBeRsyltt9rEQJsFrNMzXYKFLE4nXwKVIOxFJw3aDfH48
 rmUX8/czfs4m4fe+mtn9pzccxCSrAYcVnRg7ltNVTPpMNS9tn7KkfcRFCrYVx2awBNqO
 VtfkeIhPLtvXh6VWtaKKfKg+NqML1vcJ2OdS9tPFtjR1bxFRxslM8ONx/SrmhNcTK6YQ
 XVrRtjVDBAco48GbNFB6XfQf3dv3o2TrcGiT0DuuPF4qhjxxiNsSiO6FTK8k3zCJylhh
 aHSJHCUR472N2XSIKx/qvDHfWwcWaFOD6pYrU+BLyQQwzIf5XvfuFNGt1Er4R7+Np4oI
 jsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777356566; x=1777961366;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rtYH4PQyyJnj1p7aRo0kfTr9/95pcoWQx2j9Q6QiHf4=;
 b=XZlcvoXkVOwB1khOtbIIyw3F8n4XQIEbhXNOxh+JhBJQAO0XHGe0icT6TMS1ZMJNJ9
 Yioh+3aOuqL3nsxX+XaPQhgla7Ot/4l9UkyLWfpP7GLbl5ltw7Crc4T2pdpeaFq9PB8b
 xVPs/Q9XFkSjQ9o6RnUkpCLh6p2E7+Wwlu6NXyD0WrwZkpdfkVnycEt0ky7ahnwQ9CmO
 ztVk8/ZS6oWzRE1dTIhPaCHX5MKIaXI3UIRaGNM+ywpEqd7HwQlc0WD+owomKkmNDPUy
 2Cca5e4syom5yEhoXVDb3eGTCxkls+HBd7vi4pVfq9C0U8eEcfLujstGqBwyf1g+1td+
 Vd0Q==
X-Gm-Message-State: AOJu0YyB0hWw0Ih29NMVbvFsomYkwp33r5MmulSwPZphbWjtirvtY5Wi
 qHeS+k/jWKsGwVgNJqgr3tcz3vpR+FyxIKOSqOKgDj3k3Hi37KhtjP8U8FC5d5LX7E9PU+jVQIl
 JqkUZ1i0=
X-Gm-Gg: AeBDievgHnOt5JqxUMEx5+p9At9hLJwr/Oj7c8afU4q7Yn+MDcOlRu2C9ulQJO0LBNq
 pblTXGCwR+sazm1xbZiHBWOp8qq/u3xvV46Zm3us8PfGEGGCpa0la/WqdXy+U34hObNjd1a2dzr
 neDU3NoCR3BGsBDLApltNn6ZdJSEHKujUntiMkveCbexu/kpQueZmp+7TT4tghvQIXzn3WfPw18
 r0XQbwW3CBLrMiBvD61sT1vqP2T0lDR0Zd44eNJLPdHdv08dpqkfvmLFN2aq0zobJF9hdFN9hC3
 mFzGHwvENmOn6NSO++7bEkAQOOBasmEey1S5e5IzAj3CMph+JdbFJw5OHA0ayN6HKk2wdGUg8O/
 M2Nb3CHrrP/1c7DBMY1H9f9Ci4wat8xYZpwhbgOp3zFe6JxVt5JJxe59lu44P9ROxyBa/jxUHQd
 esMDC+QEFLCNMQ3ZmK3YPdMXBLXhZ34yIrXxKiojzwJf5KqrNjZ9o341rz3xzmh8/UB3X4TS5iK
 pFX
X-Received: by 2002:a05:6000:4e4:b0:446:96b1:f51 with SMTP id
 ffacd0b85a97d-44696b1113fmr1119854f8f.22.1777356566434; 
 Mon, 27 Apr 2026 23:09:26 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4464004ed80sm4141211f8f.34.2026.04.27.23.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 23:09:24 -0700 (PDT)
Message-ID: <54742395-8d3c-4e5d-97f9-0a06a8fe7c6b@linaro.org>
Date: Tue, 28 Apr 2026 08:09:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 50/84] fpu: Inline float8_e5m2_pack_raw into single caller
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-51-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-51-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

