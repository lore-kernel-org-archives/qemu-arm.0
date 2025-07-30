Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0596FC83F26
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:01:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDut-0002Kd-IA; Wed, 30 Jul 2025 17:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDaa-00004u-5g
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:39:53 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDaU-0007uN-VG
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:39:51 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-23fc5aedaf0so2524395ad.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753907985; x=1754512785; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MveHeWPbl1cK/yYhThcUWupCyeGutMqwJDp8kMUgRWU=;
 b=ASpEZzuXRkaY328ZNi4xXLSECLhHAAnm9Qf/zjOzznXJlIvr7zH0pJed3WLSvouHLA
 PkIAG3sH43SADIMCEzw+fmTwMYtXLQ3M722Q+recUBUrFHPtP8NiCTU+MRQjVObvsCyp
 lIhRnm3fRhXbjBRRBQNzlnQboHHyKf4zwnPnhqP1Xi56emd6BX5O+xYPZ6clDY7hE4p3
 buVS3rFInY9tbkQQ8qSxq4wyFvWlMzh7eV3lHcuAxOehW4swvA4XHceTy5MWqghepY5x
 Pkr5QFpptXn9l2mFnY+u4zz+mCBfHQxSYrtx8XDPmjR+hVZPC8hQKN5WflU7f1Y5cwRJ
 fU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753907985; x=1754512785;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MveHeWPbl1cK/yYhThcUWupCyeGutMqwJDp8kMUgRWU=;
 b=erPGr0wv7dVJ51ugUwUoylnNRizdcv+kD9uSdIVTmI2rxXKSuh+UDQNSKbx3JhavWB
 3Tf3hP8UvzJF7YYkRkUDtiXtl/ItQlkkcWTtBrcKeU5ljsBaaD7FdkhhR8YZsI0zpKN3
 jXwUU5wdp6ViGa01B9/Jr10FWGI93JH64hOmy/CpStahG+14mPcNwcXs3iNImuuX1wpf
 WgWXiRGa6XUcK6H5CqpumfJg7U0zD31FGyEJKiJjF59hYdTZdmigwzdK3zZn6LoT3f8n
 mUGKqqo/e1jP5y9XUUmsz5oALZ9/OmGn04XQu053iJDcm7OIgbi12/C03NpD4uIMO2JE
 1FpQ==
X-Gm-Message-State: AOJu0YyB2CHVHT76hNpKQOWlRma6pAjrqZ0Xhv5p5026ZddqbKGvb68D
 qOmAeGcXxeMCbGwKFb8S/ISx/vQTJUCRDTMOi3XbvmW0sBzMe6uUu0sJMHYv9lPDOpk=
X-Gm-Gg: ASbGncshYUcUJZ/kIrf4glTW2TJueNO/u68T/Krx4ejuXp1+EdTH/hHNOdcE+OyNMGt
 R5QCSh9bDaAwbifMtVF/7oxokavSC1xmjEEK3Dx5YiG4AJ/sSPq7PtRYOQuwHtHKEaZmojpehdD
 eIkMtqO9fCzHzOV3MQq5p/NU0wJA5QoU4JdIE8alnbv46OKwxRt4HTLYt84KdM9/mqmN0Mso8TD
 iUcEXxRLD4/ejgcIxHhe4IkqPt4q3VnZj+Uu1892puS/6bmajD4JAEGwDIrMVYWyFrjteEq0/FH
 ABMuwHpv+fqOVwbbF95bIvB3qFWJTitC/ICXnLdUOGgn2MRvyYOw8GZOIVavBZeMoFAgpR3KS9B
 DvxmHBdXU6PPt/HYQ6BIvoDBYmqza/spCicr7RcPbRui6AQ==
X-Google-Smtp-Source: AGHT+IFzr8KA7LGQn8XZxmJf0e2X7hSzRp8SNFYGTzyA2vSlV2TdZVOChemx/WMBH8rW9kci3glaxQ==
X-Received: by 2002:a17:903:1c2:b0:235:ed02:288b with SMTP id
 d9443c01a7336-24096b1c3d7mr69851405ad.30.1753907985270; 
 Wed, 30 Jul 2025 13:39:45 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef65d2sm158325ad.31.2025.07.30.13.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:39:44 -0700 (PDT)
Message-ID: <64038dbc-fb0d-4cf7-9242-4073149a5b19@linaro.org>
Date: Wed, 30 Jul 2025 13:39:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/82] target/arm: Enable TCR2_ELx.PIE
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-12-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62f.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


