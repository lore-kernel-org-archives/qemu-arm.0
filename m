Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B0CE92FC9
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 17:50:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaHNr-0003GC-3r; Mon, 29 Dec 2025 12:50:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHNd-0003BY-Fj
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:50:12 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHNb-0003QD-Eq
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:50:04 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-7fbbb84f034so6254657b3a.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 09:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767030599; x=1767635399; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EcAbgDXHVxo//9dE/opdwDSUstPmjyc3Gle9ozu/kak=;
 b=cSqJlNEy72Yaf1FaAfSSzMtMoBHpjWIjueDjKi8uGZySCg8Qk4lg7qQmx6uDs4MCrO
 ngv7WoqLCI7geuAvimUHz+XqqRjRsI+bDiaOV5erU8m/a/xg5LxGD2r1bfDZSMwDw+TG
 yaa/O/aM5AdkF/KHxQQ9b7VfjHUsKAjk8/EuRcDzssTt/QAn9Dv3ZacjQ/QS+5NobzBB
 Y2f2xVg2YLKa0XA0SKWSvSg19hTw/PWJSh5bik0+tqSYwzTnocI5zmNe8mfL4lWtsJw8
 wa55E/QG2zC/s8jBmDx22FEOQnkWPzJ+HTwj/RwdwPShPVjkD1mEhlowMf9J+vZ2nljl
 g8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767030599; x=1767635399;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EcAbgDXHVxo//9dE/opdwDSUstPmjyc3Gle9ozu/kak=;
 b=CW+ewjIAC6nIqA+dSbIaRuI+ZfIPLI5CCmGEAjmOBRrelG7XQ1OOIgjDV5EsFEo5Q5
 T95bjaXLxz9nCfb0D8VoixVBVpmd4eDczPj2QYo+HOLf5T29U/PQM5hP+cxf7wgiE4vh
 dUpjoFeACXTZPxFlIAJK+J4oY+gdEt3HB61zfHZf+NI4rdwY5O84tSyx3CJvjygLhD72
 bCtX4/WCuSmGsx4M7V8fTc2woemShMVKplBrEJYlltv20xDZvQCWtzKnQcumuLQjyyD4
 kQCw4JlKunu7fj/P1fNWWFo6jvJsYjcd2fNIjL4EbbrQyfcyOtAMR3/ETkl/z9ovoJWz
 s66A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeUiNAd2xzUBDATFSaRUsLURYLVRuAbJm3N3CiLqAShvI38wKqP4IcTW5qpzqz9wgB+R6SF5/oJw==@nongnu.org
X-Gm-Message-State: AOJu0Yw50MtylV64wHBKM/aIfZr1DdKJ8Cd70KmtEfV0wKayfd99tT2c
 kih7DjpcRceqr2GkVlVYUVBngF+MysbPxybCigWUDTsJQQjvnVlBc3kDjz5Lu4iPWnE=
X-Gm-Gg: AY/fxX7ckNZzplbhsdFBftrmZdxhE8JCEY3yYhHVo/mvABiAD8rO9VMPyRMt9MAHOp5
 YWsn5Ho4LEmZQmTKPPjSm0bSv4O1Wb/DYk9oj6slmmT105i7ASvWAa0J2gL7MEU7bSo1yACRVkn
 BgKpyz2FoQzMr7LW7d8deP+QNKcoZg9YiUWfqio6HzO/PI9C10zzLUJRe+P4fWGNB1yexQ9paGS
 KOI9/6C77ZrHFri+mMuTilVVwhHtbO98s0ln+31vC4vNvq5RdbMTI7ykOq2l6tnTNcgaeKDsFD/
 ZKOcOF37p/67nbH13SSfEznPY5KMfFfEWAXelMuosr9NbpkKiXgwsJEEls1RC9fFPBm8pkiFwsM
 xpquBCdr4wzSm61NkRx+NeYcDylHZ5JXMzYh6rYxD9oHm3OZ89TINrUzrqlaWi0EI1TVye0nskZ
 kOUrkITM6O9W52Wg55ZGEyyXPj7g3NPehzI0sUG381x2Hp8Ee+0gwQMPAS
X-Google-Smtp-Source: AGHT+IGHkY0NPJFlofxy7Lt+4zSf3MOYzItOPAg2JidTI0ZvomHj5KR6VtjPsNPyzYiGIk6cD5T2YA==
X-Received: by 2002:a05:6a21:33a0:b0:350:66b2:9723 with SMTP id
 adf61e73a8af0-376a9acee6emr27007930637.43.1767030599142; 
 Mon, 29 Dec 2025 09:49:59 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7bd61b4csm26034630a12.18.2025.12.29.09.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 09:49:58 -0800 (PST)
Message-ID: <322e53ba-4b89-48df-95b0-98c2a72d174a@linaro.org>
Date: Mon, 29 Dec 2025 09:49:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/28] accel/system: Introduce hwaccel_enabled() helper
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
 <20251228235422.30383-3-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251228235422.30383-3-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42c.google.com
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

On 12/28/25 3:53 PM, Mohamed Mediouni wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> hwaccel_enabled() return whether any hardware accelerator
> is enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/system/hw_accel.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


