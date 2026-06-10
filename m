Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D40BCD8CB2
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 00:18:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX6e8-0004Kz-38; Tue, 09 Jun 2026 20:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX6e7-0004Ko-Fh
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 20:18:15 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX6e5-0007G6-J8
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 20:18:15 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2c0c3543590so41439175ad.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 17:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781050691; x=1781655491; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KgyRmT6XiT2z2kerw8LLABkwWb8/4HFcILLuqJsOx4M=;
 b=o4P9ms+ksTc3lSw8nzHSXG+qXiikuMsCnNRzVND70Y/SHoTmLGLfTdLUZjoo9u5b72
 wAtt0pbDb1wsywDd27s3CvmGaDp6w4q+WSYSvpsI74Y4S7Xo6LY1CNo70+OCctQ21aIo
 IQloYpDbOpLU7TIZU2Bt/MDKHYBVo7PfOdae+q3AlNG4UW+c2bHF6XjnwO0iYN4sk5/0
 1Sdu8LBAr5+RFXQnnYutojT/ZJlJGJn5DY2+CeXnbpJMtpBW0+/9plPmtN2vep9Rf94n
 8sv2Szs3++Fl9DrYaXhQYk6jJ9PLkXE0hMFhm+YuTtO+ojx/xJQ2vBWOqtOWfwz7TaTv
 VGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781050691; x=1781655491;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KgyRmT6XiT2z2kerw8LLABkwWb8/4HFcILLuqJsOx4M=;
 b=cRXxwiPNk/a1rGLpqAggDl/gKDQbIkIbePMaUGIbJ7qZsWjAgI8GG7WKiwCj1HmhSW
 e945BKFx7C/mcwfyMKU617UFx4gE/GNOvX5ANlKEE1EtzfmIf8CNcRmJBdvmigHlTsmf
 U3shN8x5KBbNY4znqsDjQxf592S38rfbc72NRKqXy1/a+48h3JSk2FIXypwnVJfGs7e2
 XV3SvHrruYrsVE2EJpXLltI+silHg/6Ef6hKGZ5X8qk+t3LgVX5QdJ/bQxlzW4OTJJzV
 5Nso2qYbXCZvz1GQAlc/Iw5SK+3TjbdX4RTTqoqicxkYKung0nxCFLb0nus/R76YhUfL
 +ZzA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Vxsv+MncEnv6ZvaC4sF1XDO1oN7rvDNASDkQTcTk2mQ+Xwk6bt7nN7KJF77UjUMeFNrCbajEeYw==@nongnu.org
X-Gm-Message-State: AOJu0YydWmdnTZ+UcUENVbOzJdhG+WSpVXH9QA0DtJ1i7m0CDx2NmA4w
 1V3k0x1ahZNTf/bL/2jW1jPrw+ReOIafzhfJxEnRCH9gqWWvAGq5VWbuoYDdhkWc+I0=
X-Gm-Gg: Acq92OHNYEd6hG7JoMtffirnKiVEIdVpk0kVvh9ADg/EJF/9kktuB3xLmUDWZUIM/9P
 Vw2jktStYPVzHAnQKv2T6iDOaQtHwxNmQ9z0FHgXFzHWGNAWNW1bzQGdkdRms5HNgr6zIKhOGAv
 By75Relh3ixWY8ekQsTh4NQSVfVi1S3jzdVdO0NL7vH/cxep39Ed8dboKKS4N9M7AQbdVR+hsgQ
 FuhAwA6FxwI09RodKu2R64bAyIBSxjFw8JvZek71N5SW/QHaf/3x/7CZ8vAiZHgPbYNbJJRiAtk
 X9YEN156YYzou4wp1XigBwpD57khZKJIFj1Np/oBKsUTuaWdXQFmrrse8BhKzWSVDG1ertbt5Ri
 lYSVRx762axDwiV9+Q3KjR0V8TZ12plf+5UpNQnDnqXJvd9nFHbYKnIwfZwm+P0qyOTSefNJnie
 nE4KVnC5kXQCQKt/E487zNEpDSB5jmS2rWE9/18TKjZyZgekE=
X-Received: by 2002:a17:903:a46:b0:2c0:c37d:dfc1 with SMTP id
 d9443c01a7336-2c1e820e316mr172532735ad.34.1781050691446; 
 Tue, 09 Jun 2026 17:18:11 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c166396fa9sm226229245ad.66.2026.06.09.17.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 17:18:10 -0700 (PDT)
Message-ID: <3d519b95-595a-4a5e-97cb-6116eb577e09@linaro.org>
Date: Tue, 9 Jun 2026 17:18:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/27] tests/tcg/aarch64: add user tests
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-22-pierrick.bouvier@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260609214745.772536-22-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

On 6/9/26 14:47, Pierrick Bouvier wrote:
> +++ b/tests/tcg/aarch64/meson.build
> @@ -0,0 +1,213 @@
> +cc = find_program('aarch64-linux-gnu-gcc', required : false)
> +
> +if not cc.found()
> +  subdir_done()
> +endif

The primary thing we lose here is the ability to use containers for the cross-compile.

We detect cross-compilers in configure.  We currently write them to 
build/tests/tcg/${target}/config-target.mak.  It's not very meson to parse a file like 
that, but I imagine we could use scripts or meson variables somehow.


r~

