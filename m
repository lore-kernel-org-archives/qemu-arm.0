Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56236FF5134
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:28:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wABoM-0004bQ-ID; Tue, 07 Apr 2026 15:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wABoH-0004W3-G6
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:10:01 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wABoF-0002Yx-IB
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:10:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43d01d6b50cso5112398f8f.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775588997; x=1776193797; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QXm53oiWF1/bw7TedFswywe8K6PN0bnLDmXln32BWs4=;
 b=HV9a/0mPwrsNLwzGZ00ZgHv0jwPzFyGQ0B9hVN+eJkRRHRGezGfiZYLZPBkJd4n/GM
 JPdwqLVxWGEB15ddRrH6FJhVpoy9ihHt/pv+HVQGtJUpMYHr9GJOuE9HlyvsZagEdu/O
 UUoMsv5gg0jHmpakj0ETBD3141eEEFrqPyg6TYEgHnhBxTzWPfUyhOkdX/aabEaK+3Xi
 Qdri7ZDXRmLnRWvRjc6vamhYclylHfJD0+idmnB8e7AsexZCf3/h/xNSsAdLTxa4wa7h
 N2UwPxbixtW+IEhgjjb1xOndePORLgr2JrFZlU1HqiTLLUnLjQh+wwJHHXYThA7Tvp/3
 M6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775588997; x=1776193797;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QXm53oiWF1/bw7TedFswywe8K6PN0bnLDmXln32BWs4=;
 b=dk1fqbXUl/2qbzIK2CWMVwCszxv0IGxwVq8JA0pf3HzfbgZxzI9QxB0iqp7xNEBJzm
 1TDb2vuhGDjU8A5mmmS50yjiNBRviHHJ0VeJzdM4M0eNjneTj6//5JdBNCg+oBiuXsog
 nbGvsrA93XOwlyUSPr+Hw58Xr5ORvBbk96nmG3NlnDh1qKJ0Lz+u0KawRIqBzVXfB2g9
 hnBzpPimXBQec1oWkuAd8JTCkp9CjjR8rQ/sFNWA5f4G0vNp49rjycHGSEf5JErAlfez
 L5O4i1uo3kXup+BtgHluNdnCc9scF3YoGC1Ic4NP22mDHQCZADDgpJkyVeeNstjPSt+W
 rugw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnYVm1/JeWzg9CLTlDiMIqXYzJvdVC/yFBZeTHWaT7P+yCXUmhU4XNgdU6C4YRLhmzbDjZX4f1Bg==@nongnu.org
X-Gm-Message-State: AOJu0Yws4K+5Ni1y59hVqSdz7eC3RqtsXtdoxne1b2plZzHvi1hW/3nC
 pnyrHo8hxQNwjU9WRoNFLm+xbBQGc2fR0OjSIDxfUslVfCyT5nTNHuj15Y+uVNfXkvk=
X-Gm-Gg: AeBDievZKDsMWa1Jx+85jJRJhlacbOOHYjB7xrTsTcTavygVgMKkTvBroJgfooGxcnz
 6765eGMRnHmFEDsP2Ha1B0XlVmZnRTXHse3IRLhSNAI/++TUIgIDBJ6iI6JD640amGZFALi3YLf
 1w6FOuset8s/sGat5ySrPmq2+H5GQwWuxTSfh5pkhhE+YOtjVRnlPdmZRBpvSsdM9sui/AD/xvW
 sL+pEUr908g4Lb+xZxdeN4UD0BSV+APxYVyGJBElclTPjK3G224p86WWvqcCkziR2KN17SdibQX
 2mbSOFDG6McmfziQwskCgjYNLBi7oMb6JZTKWuCYwSCZ0xk63dKctJPlP6/W974jZQNBOZSK0iU
 /108MKLENuapIPEs27EW+k0h28yt0xHV9iIl/PkUJHBi07g9lqXKZfzXk/B+2JQWd6XLNH+/PaZ
 Pq2eYXA6m2IB5h+1X+4M91AvrxLgsTwvQ7Tt84MeJZ3kW9ubf3xntiP+n2H3OdUs6tQA==
X-Received: by 2002:a5d:5d05:0:b0:43b:6a55:e26a with SMTP id
 ffacd0b85a97d-43d2930f793mr25023611f8f.51.1775588996937; 
 Tue, 07 Apr 2026 12:09:56 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d289asm51251409f8f.19.2026.04.07.12.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 12:09:56 -0700 (PDT)
Message-ID: <276d90f2-635d-42c1-a4bd-5345720771b1@linaro.org>
Date: Tue, 7 Apr 2026 21:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/20] target/arm/tcg/translate-neon.c: make
 compilation unit common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
 <20260407022748.57629-7-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260407022748.57629-7-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 7/4/26 04:27, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/meson.build | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

