Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1344129njm;
        Mon, 1 Jul 2024 05:58:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEB1851ybXrbOPDvQ6t4C1vIY9y9kq3DCeoELvJdlYzmwudDDVkSb+jkZeP4K9Nu7haflfSXtmdnMEHDbQwXuB0c/iif8G
X-Google-Smtp-Source: AGHT+IHfumK/zLFAlzY6IY35c8ziGGivG89Ja3OIwxTOq5oMv+EF/DmOWMFZRvQda706crBFHDIQ
X-Received: by 2002:ac8:5814:0:b0:445:938f:41a4 with SMTP id d75a77b69052e-44662e48d53mr60136291cf.48.1719838723723;
        Mon, 01 Jul 2024 05:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719838723; cv=none;
        d=google.com; s=arc-20160816;
        b=njjS/KFf1DO3xvouCd6+YdBK9Vz9R5FwjLZsqam2oQCwDsXSmLBL/O5DMbbihywSm0
         FVU/mdrjVfc5Di10/PDrY/5XO2/HzV626A7It3e+3fuWgbPXCW+0SJWcFesWGX8ljgfW
         dxBi2qDQ412Zx8/p/9GAuooBq5UYNG+GudIMV6rlE5c9BBrpnSaskYGWHkFyjYwYpBjM
         Oe11h+HUU7Ub76kwxO+lg3OWy2lcra4s5kINcCucpr+D82vror2YMz1iR8i0Xp5FDSBf
         QW3PBUQQx+RYqB22PIowKxDMjHyQSq6QuVFguvC6kgzhjfm8tbFxF/UrIYQcpcag8o7j
         uWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZVbTYC2kXo6At3lEjeThUtvNXyBQZV9FZqSxcaXEzRA=;
        fh=V87NEDNAeyOi7JW1jViJurxGDsKrrYe/BYEs1ZEwM2E=;
        b=T+uG+4FoYYyLLyc3HaiqWqWGfLJGlXm1Uw3UzzUgtx+J1piefN3MaUwanwckMxuxnG
         6mUy1SGVcCDADSUwlu7hU6zS9oA4pmS8xlAyrbCTeeSMYdAjPUZwcVQwRL4je/Q1+dUi
         4SbPBuLowX7062IWphAj1fO+3XCp6rFPTm5SaRJetetPrWuSDCJEJtKqdi08qqxPYMxl
         HEQIJmr7u0r5xsc/9jAAzsM+zNoXaa7lIIMq0drKhE2qdQDYb2lAirn4N8HR9slhPvBI
         idLAmanwirkqg4l/yFLRsUX9bq0ZKCtqd49mNMlL3gS57KZfp7rWg4foQctQxEL/0B8l
         CvwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxINozCu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446513c199bsi79698661cf.74.2024.07.01.05.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 05:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxINozCu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOGc7-0001Ei-0i; Mon, 01 Jul 2024 08:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOGc4-0001D6-9V
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 08:58:33 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOGc2-00070x-4u
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 08:58:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4256f102e89so20182085e9.0
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719838708; x=1720443508; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZVbTYC2kXo6At3lEjeThUtvNXyBQZV9FZqSxcaXEzRA=;
 b=hxINozCumahpTBlpUBN5TtT2qNvSMOWa3vR0nyJ7vmLk4xFMF9mQXI0r0tXjtsf0D6
 ly6S6oQ1nRMDm1tNNF7CVdoPISJwN7jrriKAgCbUV9smpXuN+x9wLzgzZX97Dg1qKElo
 P5V1OJXp18uz0wfpzmvVLccChqwQuoT5/jAeG8nJT+IZtqOW69qioMzzxmaNPgA/GvlV
 osmORZhCbp+H1l1BVEEk6uAur2w6MqX68hVzdbT1rl/8eAsCmQ4VdB6cJcuX9lkecBtZ
 3JvZ58wMVf+QGboUEHb7IwzjHFM1w6mqduPZpueFxE/67Vrqr/AhUuzhzs6End9a8e2m
 cRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719838708; x=1720443508;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZVbTYC2kXo6At3lEjeThUtvNXyBQZV9FZqSxcaXEzRA=;
 b=KEZKsQBqrK2YNouwc0e9h/R4YNDutQB2QlZ1c6h2AG366xsMsdDqtN2jmf6FyU+NVI
 E4J6qaxldmrBjd7OtPiBQQJpz2f3CZE0JIp8G8xv4lUA28VapgfDgiCek82dP3JB87cH
 jiFosgRTVm2lQcZTMJLUKCSjPThyGlkhFu1bqonQM9QNimc+eNjcb0Rr5BTcba4SeD1E
 WrnDQ5+szKHGQmpvAATDzuaGaDoJSx7Pff58x7HhCc7dg3YFp/dHz5JSV7NK3gp9Fkl0
 11s6hLcBKYpDIl7fnG76EZwf7XDQb3Lzfhs12AWxx6yHQ0K3aT5jPhZ3tjAqia5HkDx0
 ag7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZaMh7y78iO3UnAGPjFTCZSDpVQYeykwEgroi0lYy9k47azKV1DU9oqZkYeM+znFZCqN8oy9xl/oo1QMzIY0EvYSxQ
X-Gm-Message-State: AOJu0Ywd7bJFnJSmwnIZPoihONC+S6auWsJVrTvcbfrgBz0YOTCrfbkA
 8ard5HoeZisf8OHEdt4bicHGmnB70zukMIX6UY5k/MR78hTyxASCf4sQx+aI45M=
X-Received: by 2002:a05:6000:18ac:b0:364:6c08:b9b2 with SMTP id
 ffacd0b85a97d-3677572159amr3906217f8f.45.1719838708457; 
 Mon, 01 Jul 2024 05:58:28 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.159])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a103d00sm10002249f8f.99.2024.07.01.05.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 05:58:28 -0700 (PDT)
Message-ID: <d94a47cd-d77d-4eb9-a66d-17c3be155101@linaro.org>
Date: Mon, 1 Jul 2024 14:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] hw/i386: convert 'i440fx' machine definitions to
 use new macros
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, devel@lists.libvirt.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org
References: <20240620165742.1711389-1-berrange@redhat.com>
 <20240620165742.1711389-7-berrange@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240620165742.1711389-7-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: BM07XFjrPf5e

On 20/6/24 18:57, Daniel P. Berrangé wrote:
> This changes the DEFINE_I440FX_MACHINE macro to use the common
> helpers for constructing versioned symbol names and strings,
> bringing greater consistency across targets.
> 
> The added benefit is that it avoids the need to repeat the
> version number thrice in three different formats in the calls
> to DEFINE_I440FX_MACHINE.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/i386/pc_piix.c    | 219 +++++++++++++++++++------------------------
>   include/hw/i386/pc.h |  26 +++++
>   2 files changed, 122 insertions(+), 123 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

