Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F5CC87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 18:31:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhuWh-00010V-L8; Fri, 01 Aug 2025 14:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uht0u-0000Nf-Iv
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:53:55 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uht0s-0005kc-P4
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:53:48 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-76bd2b11f80so1883486b3a.3
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754067225; x=1754672025; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RdgW7c2eroL9g4iq9Ekphc8v95mGb3W34QRHwdPUOdw=;
 b=etkCOYKEep73vpCz3guwwNyeotZu0F3IRbSaTLvajk6GSFwFSBCVPzlingYIA4driz
 mQiX7e/HWsAQoVJbeFsU7R2sZvQt7Lq1aEP4nWBpbuj1O7rbv+dLcU3hl2L2EAXuARlL
 MBoh16IG+gsJkb+sbpgXs6D3R6w9W/DJwFrtbtLYlRcLQbGbBojo1/kV73zf7Y96TuYI
 SiHL0vDNPkd4Fi9jEdIJdqdKXFi4o+9ksRK9k0GtwNYUy2Pi23ZYVhTqi/mu+NlPQrPD
 RS9+0oKup60YyBGfD+ffNy6PpCetQh9iImzNvxyFbBq5T31rvQXT+sqCC1CCZkK10hEh
 CmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754067225; x=1754672025;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RdgW7c2eroL9g4iq9Ekphc8v95mGb3W34QRHwdPUOdw=;
 b=FRs1JsGl6qGx9buk/hOLXFNMn1arLT7QdAg/C0D42Q19C6/yaZ/D+qOaxoI4tm1Q8O
 Y5IjRuGpZ2PQBM0CbWWDOaSL7UYUN1oTrhC9O+BjCOb8UQNY9WNBimudpcHZsmo5VPwJ
 z8ejOIetCMdblt+0XQ87ESXlnwCWsYQtwu/yYrpiNZytQGLEO3OuN32kllNj9XNlGVQR
 j7nSTAe4+N0xWct/5g4wV1zSgy0v82IE85p4yjX8zaysI2pIRyNYbKq2+qLQznc/D7Sl
 pw2iWLVLAhv+RPDyVvY3XTGavjjNY3OHEJPc8IuQkxtTJFptOmWTTLgyh4qprPpDu6Mn
 uyWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB8NdQ2ZewmYejcG9YHCXaqd496g1xc3VBIGM+kFMBEmVxor1mNunq7bff2bM9qJDCTBMG6IcaZg==@nongnu.org
X-Gm-Message-State: AOJu0YwxVDoFH4J1by9QYOluCtfT1riETxAoSClDPIB45jpgo8dWmFEn
 OIxV3MCZBGoS/1jEWpK4l4mklRKR1HT1W5AKu8OKgLStixZ4xokn5kldeOi2SKV1mQz90I5teA9
 uO9oDy9A=
X-Gm-Gg: ASbGncuIQlMtnb4Yg3bQE/4jyFOJ+luYfrxGLnE4HfDStvNRn2BKhaAOIn5OmQ6PWwS
 EqEzE6UCGKCL1wrF8VUuXZMplBV/oK9SajUyhukMsWdTbWwHoyAxFFh12eHsHdUknHF+MYuoGdt
 lbq7hC+D45qZlCbhFMFMmd5xGVMJTHTQFkN2MKfXDIdj5Y8YIgMa4m2EBd1EO013rV96F48Aamp
 dRhhibimoI4PoVtyckUH6FwvgRhkayPb1P9Id7CdD6d2LQ/BnlIkAlJZwzdSZt8euuuWNdOy11i
 soT7FIaOYW9W1ehdNROQHD5hHchqdNzeFUxjgQmSXcbDTRUhTvRvXd1e1NCbLtQoPAga7N3q0dS
 Kh7+1FI0zpEQ6u6Hg1elNe+7M+Q5d8vYt2hU=
X-Google-Smtp-Source: AGHT+IH1dp6cL2w8xYX+B6GrGB/3vHDERha/bl+iTTGg6uvKQNsyEjMwv1c9eDxqx6sHnl39Uycq8g==
X-Received: by 2002:a17:902:f304:b0:235:c9a7:d5f5 with SMTP id
 d9443c01a7336-24246f667acmr2140435ad.13.1754067224847; 
 Fri, 01 Aug 2025 09:53:44 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8ac02c9sm47460505ad.184.2025.08.01.09.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 09:53:44 -0700 (PDT)
Message-ID: <cf097501-98b4-453e-9d89-e4af8d0e192a@linaro.org>
Date: Fri, 1 Aug 2025 09:53:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 47/82] target/arm: Expand pstate to 64 bits
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-48-richard.henderson@linaro.org>
 <b2e40787-6043-4d4c-9cbb-731d0e92e25c@linaro.org>
 <CAFEAcA_9tkv1EoM33=G=zW6Pw0gBirvjs-SsDaC8ar8feyH_8g@mail.gmail.com>
 <2c337408-5caa-4e24-a8dd-d947203a1dc3@linaro.org>
 <CAFEAcA-LmS0dus5ZW6P+-VXkw=m4K3MaE6O+Qtj5i3H7ULJFFQ@mail.gmail.com>
 <cedc5b94-78e3-4d9a-bdd8-60c82673c136@linaro.org>
 <CAFEAcA8j7S6qVxmd8dairF=4kpn2=uBeFFxY22M5FgyTnjcJ+Q@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA8j7S6qVxmd8dairF=4kpn2=uBeFFxY22M5FgyTnjcJ+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x432.google.com
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

On 8/1/25 9:44 AM, Peter Maydell wrote:
> On Fri, 1 Aug 2025 at 17:41, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> On 8/1/25 9:37 AM, Peter Maydell wrote:
>>> We do at least define the fields so you get a nice view of it:
>>>
>>> (gdb) print $cpsr
>>> $4 = [ EL=0 BTYPE=0 Z ]
>>>
>>
>> Do you have specific pretty printers installed? On my debian trixie (gdb
>> 16.3), there is no pretty printer for cpsr by default.
> 
> I'm not aware of having installed any. This is
> GNU gdb (Ubuntu 15.0.50.20240403-0ubuntu1) 15.0.50.20240403-git
> 

Trying with a ubuntu 24.04 container, I don't see it neither. Maybe 
something is missing in my gdbinit.

> I was assuming that this was just plain gdb doing something
> useful because the xml defines the field names and bitpositions
> (at least if your QEMU has commit 63070ce368e1a where Manos
> synced our xml to upstream gdb's to add these).
> 
> -- PMM


