Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4C7E92FCA
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 17:54:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaHS6-0006Ml-V2; Mon, 29 Dec 2025 12:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHRt-0006IY-JV
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:54:33 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHRq-0004nH-Rf
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:54:28 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7f89d0b37f0so4520647b3a.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 09:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767030865; x=1767635665; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5mESAwMIaZhTqkXM52ikDUvB0G0HmjkijOpwFN/LSz0=;
 b=aDX9kzppoiXMGQ9doY21zNY6tYjuSlX4mNu18gOM8ykY5rRj0SzZ/T4/A7JaYJs1AA
 juKOLnrXLaTy9kKkD+PUOfCJxUaSqFG+UqN1OaEtVqvjwqTdm8qe4LcCdPcWT45iwv2b
 0sJZx0iYmp1j4VnQ+iXR4qfpdVjczHy3w1hqakJ0448koubBo6R1xd+rqCoVxfc8VOhy
 V62CNlCy6PW2SXeDLFjKNVcM/UorcmT7MK6wL6a/m/kvv7SIZLYyVWCV2aYZyZlE8p85
 BnvLgl3EEd1z6UL4hxJV8PEXpEJOGeS2y7SFkUG87tvpEw7cCzGztOH3viLUZF3cXMlR
 wDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767030865; x=1767635665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5mESAwMIaZhTqkXM52ikDUvB0G0HmjkijOpwFN/LSz0=;
 b=YySRLetLfAZIl8xJOxrATp08301aFeVnXeh6MaOt04JCFE30vUVeBdrm6FckiplpcL
 8/IatbZQJWZauHmJe6CyBJ+o7zON57Zyz+P8MyQw08pA6fYUy9GVNwWFYntSH/n0NjI2
 zDbSKK06vvhRcG2yXAdtsjFhSJ4bBNZrOntljiZzq3IFhftlQe7iyZO00ES8iVMNJGZG
 afNz7db5nhoRvjqj0j8Vf9hnuZu/DmaX/PN8/XkmfmjlsIicafUefIKLhiKeEQULpy5I
 XTUwoNPoQhoazoNbVFlo80zFlplwMrZhj7pFHBaUToqNJT+XruzNYBJ1SnD6/ZMOZDiF
 SRMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU30EBkI9W+RWStCjWrEn3V5c9LFgGYPCGPxBr7uPfxBGZV1NE/xuwqj3icFDjhm0+/Zho+RNOt8A==@nongnu.org
X-Gm-Message-State: AOJu0YzOkBd3FAASJEx3+IS7LLKL5G9MI9C6yrkHked1iZPA9RzpYlUU
 0p7t+4Lk5SfI0Tsm6cUctsb/1HtVK3L/xRax5lctESuxTkWzkGRZSWq5O1Y/djCBxEk=
X-Gm-Gg: AY/fxX41G6JHTMjiZ7BaTMUqx9vMYig9pb/0eASOwiN0rZGdVU7h6RoM7DzwmFdSFJt
 PuNyfYQnKLui2x31aTNQ47HbDWk9U5p1yW7oW59wYEKzIEzUScuBw6qMlCXsGgKTjGsziJKxEGm
 kitJzyT/wsML4iAwCwJAlx93BlIhBCS1gbhli64t5nieZJCRb86GJs0y9CmwJzP+7SNU9N+dRqE
 oVQqqXlu/5t6iO0w28gyonvysjKwu1oEvJmkibEDhwi3PXJgpby9IbYA5m2xI/AsHZWs4/6Uzdh
 pfwqfwyZvjUf4Qrl/EIjBnOchVnx2y/ftve6SijYWtUtZvtpGtJb0mERW4iWwyHtoPoad2Oy7nc
 KytgJP1Fdi4BzrRfdHzZL/mxx/MtAPYO30iwQS+tm4EZZsmHvi6Ay9c/tXfKDbbJKvVVn3DWXOL
 Usl4URru8zMfXac3HaqW+3aFcJ+MFUB2+1a4LQBgGg2tEenvgGiky1xkKmzmy8sfXa+VU=
X-Google-Smtp-Source: AGHT+IHQ8yYvue4jDg7JeE3lH+Gt+4MdRjzYLTmvkOUCJGp4EE3jFYwbcLmUa8MKW1PV9cUvFd421Q==
X-Received: by 2002:a05:6a21:99aa:b0:366:14b0:4b17 with SMTP id
 adf61e73a8af0-3769ff1ba96mr30143190637.34.1767030865328; 
 Mon, 29 Dec 2025 09:54:25 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7c147943sm26110508a12.26.2025.12.29.09.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 09:54:24 -0800 (PST)
Message-ID: <6f75cae4-817f-495d-98ec-c7af210db9db@linaro.org>
Date: Mon, 29 Dec 2025 09:54:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 14/28] hw, target, accel: whpx: change
 apic_in_platform to kernel_irqchip
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>
References: <20251228235422.30383-1-mohamed@unpredictable.fr>
 <20251228235422.30383-15-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251228235422.30383-15-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42b.google.com
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

On 12/28/25 3:54 PM, Mohamed Mediouni wrote:
> Change terminology to match the KVM one, as APIC is x86-specific.
> 
> And move out whpx_irqchip_in_kernel() to make it usable from common
> code even when not compiling with WHPX support.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   accel/stubs/whpx-stub.c        |  1 +
>   accel/whpx/whpx-accel-ops.c    |  2 +-
>   accel/whpx/whpx-common.c       | 10 +---------
>   hw/i386/x86-cpu.c              |  4 ++--
>   include/system/whpx-internal.h |  1 -
>   include/system/whpx.h          |  5 +++--
>   target/i386/cpu-apic.c         |  2 +-
>   target/i386/whpx/whpx-all.c    | 14 +++++++-------
>   8 files changed, 16 insertions(+), 23 deletions(-)  

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


