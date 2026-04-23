Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C54FAD3EC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 02:45:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFk3w-0000Pq-Lu; Wed, 22 Apr 2026 22:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFk3k-0000Hn-9r
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:44:56 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFk3i-0007Vs-Uz
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:44:56 -0400
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-50d880e6fbbso73165011cf.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 19:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776912294; x=1777517094; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=raaHHjNtXM0QC1nyr209ZTdMF9pMv7BHcldBBSXeacY=;
 b=aBk9q1GOe1piddQPcxsZ+NmxlGjqcnIWzK4owojhAsz+6LGQIKekbr3JAcvMTxRuUr
 77wfXZmljETbApRveTrJ4MdCatFzUwu0VsVUwR3ZPBcMUQs4Ydk3UtN6yOS7MV6LfPIa
 BybYSylx4Co1jrShNJSZfns/Ljx2Nnxl5yIyDr2Jn8Dp0r5CIh1MhPTp8xwtsrX0CTOE
 kjjgZxrqSSeZFrXuR9WBp5l91xjsk8lN0TjA6wiE/++3TzP3UhF5imcRJtQRXe/EbkAe
 h3GkNxxNevaTaIhwaKePTCtMewnhELLtCm79Qd7RwsQyb3AzLLC2/yO082OHulOqg7vD
 8hnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776912294; x=1777517094;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=raaHHjNtXM0QC1nyr209ZTdMF9pMv7BHcldBBSXeacY=;
 b=NSPNCzCpsdDJ/EmLWvdHJRGAxcK0vCxloTYZ4PL0IyFzdoodV7u6s6vghPeCHQhDF6
 oPmHL59pE+gCC0Cev5cPTs1kQvd1ZznOnl3cVFRPLXK24lm670a/sdyPzCf7aZsDYkrl
 HSniIkhxd1AIY6Mpp0t4PKf/3cvdSWo+wchxdQxmu3IIwYXA0/yFcS5lbCSAwLaPkcPj
 VpUeXCJdEftq+lJmPXuZXljrtsVWQnjut7t/htCAQ+dK8i2F/Aq83/pkuemiAF+LcU2g
 ctJGo+iffI6byyBRvvUvWhrNfc6Jo8Cf5YUo2rxMk7bL19om85BCm/pLVhGfgPOo1Mcn
 xy2A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ebh9hUCAwn9Hf4OaWhsTorwuhAgnl2L5LJbRFQhvL3VN+oF6oPrS7XD7d5jdrOx+m71e3tMGfDg==@nongnu.org
X-Gm-Message-State: AOJu0YyJkcTtdDbSHJDX35NFgrdbLPYT5IJfxU1F9keJEETj+bdhLBuP
 c37AIMlitv/ZVFZEGwG5dVxrblJMFxc8H4xdy9gfMk3wpPFQlJCZ4GFFJkpZNNRcFkk=
X-Gm-Gg: AeBDietlTHSnZWDniKKF+Qjg2ZVEuUhOl2fcW0iyGgOe7nkC548JM2D1amr1gUG7Qhn
 v5HoyYgLURb+/48S3EGL8s39bHjhq3mXaIA6JNRJDAX756bBKr3m7fcfCawu+E3XT52ZUNUXirD
 zqemVwSp0y3BP0unFYiyTZX8pKwdHbV/MM0TkJcbuFuMVDOfnAk/RJ6OpjTScVX45NWc3X943rI
 tQ9NoauNxRNf6qLQHsFCbOFPim0wLS5cgiMntgXTyyjFjICrskVOTnIuy2WnwZucWWmaYQADcE0
 h0SAiIVobE7oju20xzmYigi3o5D24135hONI0QuVGWjkpVzZ8FOxR2V/9VdDd7Sf/8fxT5G40vw
 8yP7jPYEuBfc6g2w4GmBBn2ONLgN9nP1XicJ8MmOVSeQB1TDB6taEbSDzPvIHYhBTb+N39vzZgT
 cR1+kC5g8Ls5W5NyU+Xaql0unYxEEDfgWY3El2VMe1H/J7gHDkiug0Pf/T/Pmg2e/S34dMjAqWS
 oAlJRt/kFe2wk811B1WEEd7gWua
X-Received: by 2002:a05:622a:580f:b0:50f:b732:2027 with SMTP id
 d75a77b69052e-50fb732263fmr113900161cf.29.1776912293737; 
 Wed, 22 Apr 2026 19:44:53 -0700 (PDT)
Received: from [10.72.56.227] ([172.59.184.224])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50e39449e36sm185415121cf.21.2026.04.22.19.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 19:44:53 -0700 (PDT)
Message-ID: <815cad3b-458c-4599-bb73-d588a4a68572@linaro.org>
Date: Thu, 23 Apr 2026 12:44:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/17] plugins/api.c: Trust cpu_get_phys_addr_debug()
 return address
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417173105.1648172-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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

On 4/18/26 03:31, Peter Maydell wrote:
> In qemu_plugin_translate_vaddr() we have a workaround for not all
> implementations of get_phys_addr_debug returning an exact physaddr
> for the input virtual address: we OR back in the page offset to the
> return value.
> 
> Now that we guarantee that get_phys_addr_debug returns the exact
> physaddr for the input virtual address, we can drop this workaround.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   plugins/api.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

