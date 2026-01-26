Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCD6D19502
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 19:04:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkRt9-0003fm-M7; Mon, 26 Jan 2026 14:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vkRt7-0003ex-GY
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 14:04:37 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vkRt4-0007Dw-0c
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 14:04:37 -0500
Received: by mail-pf1-x443.google.com with SMTP id
 d2e1a72fcca58-81e8a9d521dso2904159b3a.2
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 11:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769454272; x=1770059072; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=egUK6u22SaLwJjNs7oulkHQit78mz6kIW4KKWWkvBio=;
 b=x8a/ue89+0MuBXzTshCXmHyG7d9RlG/mc0p8RZVHuzXyZgwEIzYRmNiZofFboe2Ys/
 j5Ii78uDaELdHFyKKvA4yrVwKEPCnjXi2jQ7e2kEC9zhjw5hTNdsyydsDvwYau/4hc+0
 3SoE62B7HapH6RHu1Z3AM/su7xSVWVZwNH1HdjbEA/yNzikjVJDI+QLrTyZKVmxu8U7l
 LYw1y1Q5AISGyHJMlr9A8Kb4EEiMNegIcywRruqyl5eJdC6L/Zy0E6/0ghylEEdbINwZ
 p0XqRmgN03MY+3Gg502peW/tXKgKPEMsqng2BfoEXZMN706bKKzzRVuWb5lwsSSsnFae
 kGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769454272; x=1770059072;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=egUK6u22SaLwJjNs7oulkHQit78mz6kIW4KKWWkvBio=;
 b=C3d2Umc/FquWU6gLGHC1wpCXMkXeUo3/ogeEIAhakVzGlCd8nBONyLLUPW4NoKMbOH
 aq1jgH/FDSbOLojUXBw+i7PvtwyjSjLBQFAXplfdwjbY1IOcZZjYJP/81iKRjZbV1BxF
 qUbSMWNm4i1eJd6oWEkvjSxC7DnOqb+gqZ6zHCEFxNJG6IVIX0F49heTv+Te/I8J9O/T
 8CERFkRbp03W6SxynqRkN59iKHGtoY+I4qV2iKSMxTyk6SmUp2MbJdbJCr0MyCIszoOh
 voUlLjU8VKSd2YWJw0r8TSKd+5NCiYAqnaAPyu2KaAoVqQxhd8iAXDi0lpBUBCm1x09b
 h/Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEqSoi+ok71BTAk3JSjPdy7c6RObhzxbb4zjs013zOPzyO4tQYEdHWSrcb0v3U0SUrM11+EAQVvg==@nongnu.org
X-Gm-Message-State: AOJu0YwZ3Wgpa847ns7yqsRQpOlj0OmtSezZXmk9XL2ekcemAYvkTZkO
 OYxRayyhGTmXIdBS8yD/wrRFbjoTiVjnnye+clBn9pVAFk5qIce6PrT3mBu4IXTzDi8=
X-Gm-Gg: AZuq6aIEUYGj0XLzzDbIugimT4LSvlWFLAhWvdGUsCRUdDxV+30/ddxA3rj5hEk486+
 UVFbDlGAS0Gxs1woFUI6eVZB478S0scXbVL3YBnwgKq5HUtc5fzdmzcgp48bqPDTcr86a7bntal
 hHRLJ9/NJWp+pwExNWhR3EnI+JjGKa/oqCs24do7SD7rDhafBMuAkL5iBz9tbB8YKNpxc6EwtXS
 i7uNFP/oq455372dcDHxbO36igI33U0X8xKd49IbRXMQRp4AGz1ElmVXh7bf4kB7xV0sjQs/EB/
 qUqdDH4cmkFVdTNcbJt9r8Egcx6i5Z0QF5vLNO8/AcuFk9DiU9o1clIlUv0BIgdP1EQqBJDcck9
 vcA0+BgrSWz7PvyUU0CKDeg51rvMYb73m+4gJrdhbctLSNBNfBdKRTe/O7lStaLLW48TBUcc7ql
 iWV/4qJ37lTmmcF4CR7AnAdxl8qculLqYMJfbvW4nCwvJUcfl+4VQKUcwU
X-Received: by 2002:a05:6a00:22ce:b0:821:8230:235d with SMTP id
 d2e1a72fcca58-823412a8468mr4721391b3a.39.1769454272274; 
 Mon, 26 Jan 2026 11:04:32 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8231871f2c0sm9845862b3a.31.2026.01.26.11.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 11:04:31 -0800 (PST)
Message-ID: <6dce5ad6-e88b-433c-8eef-98dbe72acbbd@linaro.org>
Date: Mon, 26 Jan 2026 11:04:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 32/33] scripts: Add a script to run the wasm-compiled
 QEMU on node.js
Content-Language: en-US
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
 <2af460d17a47ec69d691dfb876f834e4685f9d6d.1769407033.git.ktokunaga.mail@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <2af460d17a47ec69d691dfb876f834e4685f9d6d.1769407033.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x443.google.com
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

Hi Kohei,

On 1/25/26 11:03 PM, Kohei Tokunaga wrote:
> run-emscripten.mjs is a Node.js script to quickly test the Wasm-compiled
> QEMU. This runs directly from the terminal using the node command so the
> HTTP server or the browser isn't needed.
> 
> Node.js 24 or newer is needed to run wasm64 binaries. Also note that QEMU's
> "quit" monitor command doesn't work as of now because of the Emscripten's
> atexit issue [1]. Send SIGINT or SIGTERM to the node process to exit QEMU.
> 
> [1] https://github.com/emscripten-core/emscripten/issues/26040
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   scripts/run-emscripten.mjs | 66 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
>   create mode 100644 scripts/run-emscripten.mjs
> 

I followed the instructions but could not get this running:

$ /usr/share/emscripten/tools/file_packager.py qemu-system-aarch64.data 
--preload pack/ > load.js
$ ~/node-v24.13.0-linux-x64/bin/node ./scripts/run-emscripten.mjs 
--preload ./load.js ./qemu-system-aarch64.js -- -nographic -m 512M -L pack
file:///home/user/.work/qemu/scripts/run-emscripten.mjs:51
if (preloadModule) preloadModule.default(Module);
                                         ^
TypeError: preloadModule.default is not a function
     at file:///home/user/.work/qemu/scripts/run-emscripten.mjs:51:41
Node.js v24.13.0

I don't mind having a nodejs, or python script with browser. The point 
about using emrun was that it was easy to get something running, without 
fiddling with those kind of details.

If you offer a python script that automate the creation of details and 
spawn a server, it would be acceptable also.

Regards,
Pierrick

