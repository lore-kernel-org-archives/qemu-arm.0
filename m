Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029EDFD4F08
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 17:08:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w00Yq-0007tf-Hy; Tue, 10 Mar 2026 13:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w00Yp-0007rt-Ak
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 13:07:59 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w00Ym-0001r1-T3
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 13:07:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-485345e1013so682885e9.1
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 10:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773162475; x=1773767275; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ib5erO2BBy/ha/8254UaBJ7zefW4MaIsLWTIpgciiEQ=;
 b=rPXpJAPTCMJ1c7CkzXhT1Ljc/PRaSKXRZ4W5ZK9tJ7ih3z3v/bYMXttaTfe/DQmMis
 HqlZVKT5aGdq6pr9M6EDqx44uuiJqCoxrPtn7C+avze35vVQ0Q8tCJ3uSR6aRvClZjcC
 MnFVnA4PtMAuFARduJJhBAV77L6FwqOMiLr0XRKMEeSAQAxl3wl41sudg0hnwvQ6WGDP
 m7ikbnVC/jRzkUWfcKzqoEvrPkwgBbxPsgGHZVUpvOKFFqib+yGlQPc1cZmdK4DBCGbW
 5zhzOBTjf6TPQR1QMCYPmwi7dcPY+uRKJP2YyZ06G8q0JrelFYtS/NzbC79slR6CAznB
 vXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773162475; x=1773767275;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ib5erO2BBy/ha/8254UaBJ7zefW4MaIsLWTIpgciiEQ=;
 b=ZXCNYrt5tIFpu29aJxbWnlZaySuNeX4uzQJ3bb4z4jdGdMMksFa3u/rKRTTfoHmHIV
 1BVGihF8K/nrQX/h3fiCrXW3ruxIEJDrL+jfmKtP8/ejewhmbCzq9AmtpTCHJkgledv0
 jB7ttOnZGHYmFoTfaHuwnoviU4VFOQULpW+ra/MKL5mhzNJXYvLvwuCSDkq/cdR3nmkB
 4vy7Be2RU1GmXOIn7S06HJG9nZiI4ckgD4CgzIeddDAAEP4Jqyg5SocH6mKjUQzwYlg3
 TTj4OT4ougVwLKeh2tWS4Jc6QYDE2VCb5hsWRHvkD57HbUMd+z9gtn+QfwHWbvaHphqx
 T31g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGZOOXIgBeyw7r6QcFOV4pPoZMk1mlQv+LH742cRER0QyJFllh1HpLI2Y9PraGSzcHoOYvt/jwNA==@nongnu.org
X-Gm-Message-State: AOJu0YwtAjwXo8kha8WfXandKcTHv7zsCvmUvuTE4TvbhO4NVRnGBwNM
 OibWjV1wbXBIMvJQQvoLaXqqKuKaa1bIHKn+ikcxP9FLTdo86439oWELR2oVViTs3MM=
X-Gm-Gg: ATEYQzz9dnvTsuleXzyGHbu55GxNa4++XOofilLak1pbh5z5VcLV+HPB/wE20kQpff9
 y5q1VuVvoAaTYnvgZcqh3AW16Ki8FhLt14ILNvcwasdOkgNGX5LRtU8C1uWfJZtrYBj/ZbPjoM7
 Y6c1Vt9OYvPRXilIhuKvfkMExYq9oQyNbNkVgVRNl3wkUb6bkMj9T8JfIxIQclLVVL2caO/FgSJ
 vMPAQ/p/uuAdI/bIz9MIBqMFSJXWiG2wfsz2LVfgIuwovRQytIQxbcES816Yjr1gYAKROTSeqxV
 hf0jvsc5S9MYGSpLVex4vqDGPvaS0/b6GKefqSTerhbNYib2mbzCq+HcQ8i1dYKb/fUcaFbSXr1
 q7MeZIndJWPHOcsNRGs2GxI8SxiuxjGHJ4CJ3BiTN9BepTlFlyRUlWQkNaSTK4luSkCLUFdsfEI
 tnjLGgUECZgPKTwpb2LZitA3h1y5VaB9Mym7X6hOS6nexcIXp9CZjiE2jEfPKkaWHTmt1MRYpN0
 Rt+
X-Received: by 2002:a05:600c:4f8e:b0:47e:e59c:67c5 with SMTP id
 5b1f17b1804b1-485419cc0c0mr58808515e9.8.1773162475085; 
 Tue, 10 Mar 2026 10:07:55 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485358cd26bsm148960285e9.8.2026.03.10.10.07.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 10:07:54 -0700 (PDT)
Message-ID: <ecf33730-030c-4f69-be38-831ae740005c@linaro.org>
Date: Tue, 10 Mar 2026 18:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/qtest/ast2700-gpio-test: Use g_strdup_printf()
 instead of char arrays
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20260310153334.3063224-1-peter.maydell@linaro.org>
 <20260310153334.3063224-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260310153334.3063224-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 10/3/26 16:33, Peter Maydell wrote:
> Older versions of gcc with -Wformat-overflow=2 don't like the usage of
> fixed size char arrays in this test; gcc 7.5.0 (SUSE Linux) says:
> 
> ../tests/qtest/ast2700-gpio-test.c: In function ‘test_input_pins’:
> ../tests/qtest/ast2700-gpio-test.c:54:36: error: ‘sprintf’ may write a terminating nul past the end of the destination [-Werror=format-overflow=]
>               sprintf(name, "gpio%c%d", c, i);
>                                      ^
> ../tests/qtest/ast2700-gpio-test.c:54:13: note: ‘sprintf’ output between 7 and 17 bytes into a destination of size 16
>               sprintf(name, "gpio%c%d", c, i);
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This can't actually happen because of the limited size of the values
> being substituted in.  However rather than require readers to check
> whether the arrays really have been declared large enough, we prefer
> to use g_strdup_printf() for this kind of string work.
> 
> Reported-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/ast2700-gpio-test.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

