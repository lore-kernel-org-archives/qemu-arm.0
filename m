Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9224ACAC5B0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 23:02:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3MtC-0000cd-Qv; Mon, 29 Sep 2025 19:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Mt2-0000Vl-Cg
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:02:28 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Mt0-0006ny-Fy
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:02:28 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-269af38418aso66958855ad.1
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 16:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759186943; x=1759791743; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KPQiasIK8QQrqRfnx9hkyJ3s4JJz+SS06xvPEptv/GA=;
 b=M3Ub/DRsL6wLNtdZTJJzyLEtsyIMarrCIqt3YD1wujF4sfQ2QeVS1PDWrZyB7GAhCz
 IDYaPwko/zjzLMOTp4wili54NpzGYm7ApVgDx93XkkwXj8uuQH/zv/G31agLC8votEg0
 vlyboAVRyUdDAPoagJsNLMGMESow56WtyAUDyJH3l70i39dVflklrnLqt9InWJa04pWQ
 AG2ovOvRewlBJuC1qGjRBTfVKGSx8Znb3447oq8LCdi9ZA26mp/12SeWteHEMyiQo7ST
 bWLoADme0rfHmGiCGNcnpMZpExQIxbVS5OZ78WzEAufKeO1guP2X/EI6BHrhrAvdKOk3
 MLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759186943; x=1759791743;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KPQiasIK8QQrqRfnx9hkyJ3s4JJz+SS06xvPEptv/GA=;
 b=FinK0HvXQgqEYvgniOhP8MpWYyUGOfxv4kKIOY6U02CKXP5rTMoBdw+IKutzRhHWU6
 RcaERX+XOthFQ2hfeIRKtxBbU0/3WaXnTXsXMh66hPZzObMKvwINrte6HADHhlypCwJJ
 L7CLciPa8AdX+hsj1J0bS2AkmeXrpW1Xsn3/sxzBYI7YErIj1u8v2mfki1+guIa63GX4
 O2VUAHRs8ZYk0qjtEdQhkBQbxHbldU1W58JCRC7iK6eFTJ1BcRItEqZAhVuoSDTFohKz
 D4yivwBa/D8PCx+KYzQtZ9awr5oikYYveFK9yiWguua+Tf+Nqnn1VjV8IBTKdA4/AmLf
 ox+Q==
X-Gm-Message-State: AOJu0YyVj5WVtO8uUS/XxI7vnmthjv8q8Jj0sN06AVvrSRiiw59u/uM6
 9anQf5a3A7+OTqWnffSqi5XKcnywJ9vHFXJrgCuOR949fXgAl/qRzEFpUso4RXfVw5I=
X-Gm-Gg: ASbGncvdpKZIVSv1iy57TcmRfDCEiDOnRyi+3FJxw4Uhnbu/oERsxo51JYV+P0ZYryR
 eQh8w1mBEy1E/wdO3U1/bu5KUdbIlZP4m7s82RUtbpjEHRl7ogZjDcA/kL6tJaoESMeVYxhEdTa
 3dmpVs4oB2AUt/ObAScBoi4PE+PtntZYZNtz2x9YcX4MzNIN3Z3QYoRPMefSeIm/YzCJq95/Fyb
 H/nszS9oOL6b7Cb0lJopZM7RtB+4gDcmZ3agcvvgaoS0vGUw3zsgU0niRpKB9fdfa9RER7COjSm
 gtCOkNH9jyxTP0QDszwFXiuoxSaM+u9NC8khWCcLPWjeDBcVEHH2cFar+ZR+9x70Nxnc1q/TTfF
 aFJJQhM8xCLKluw7KLGGpQD3xdDDI6lrmOZgib0zvY7TW6w==
X-Google-Smtp-Source: AGHT+IGDoUEgnOgFNdTqwk+c7q5XTcIDxAYWcHH+BF8bRAsJj4CC3RTp0RUu77/x9JdfFOJHUnNRsQ==
X-Received: by 2002:a17:902:f548:b0:278:bfae:3244 with SMTP id
 d9443c01a7336-27ed4a89272mr241695805ad.54.1759186943376; 
 Mon, 29 Sep 2025 16:02:23 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed67076ffsm139465855ad.39.2025.09.29.16.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 16:02:22 -0700 (PDT)
Message-ID: <748e83e5-2719-4cc0-a73a-1de17c73bf1c@linaro.org>
Date: Mon, 29 Sep 2025 16:02:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] target/arm: Enable FEAT_RME_GPC2 bits in gpccr_write
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250926001134.295547-1-richard.henderson@linaro.org>
 <20250926001134.295547-4-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250926001134.295547-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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

On 9/25/25 5:11 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 5 +++++
>   1 file changed, 5 insertions(+)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


