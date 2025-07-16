Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6ECC83F1B
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Jul 2025 18:12:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uc6cG-0002nv-It; Wed, 16 Jul 2025 14:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uc6cE-0002gs-DT
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 14:12:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uc6cC-0007fC-KK
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 14:12:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4560d176f97so1498835e9.0
 for <qemu-arm@nongnu.org>; Wed, 16 Jul 2025 11:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752689542; x=1753294342; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbwv7/3tZEUbk2tUrI36mk/UyQGz56MEArNMWN7F7VU=;
 b=FXKPyxq7QF11rntkOs7fP9PAIcXtjewGpJcn2cqiPtT/cS2zmGXu2ZeDTSPHqP111V
 IYkpJM2qPCI/C0nBS9oXo6wvrrkYSpRKo8cO3QG3h3+FQnyG0FnUDcMDUoywTx/mV37I
 lpJIktUWfK6meilJgh1n6NNoXScvDTXHhyncb5jpNsRhVf2MsuiORLEYcvJEUvqj6nIy
 5r9PKlh35lXicUwgPKnL33x4nzUhxmJ6Ef46Qk9Ti1O74xyRFPpDH1E4BLHkTaNewxB3
 aCjHlj0wppJ+adyWwy+nn6DqPigVHDook5J+6X/xEV6B2QEeiSYrDO7i5+A28Azx0aAU
 ph8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752689542; x=1753294342;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cbwv7/3tZEUbk2tUrI36mk/UyQGz56MEArNMWN7F7VU=;
 b=gUqHRVSSL6utOEugeUT5tAC6FNi65xRqWJjVJNjPBtjSE3rBQz2ITqPFQKzG5QVxJP
 ZnDfywRUWPcmNTlY25JbBqcabFroxTLFOfBVrtIcHPGr/7z7HuXRf2WLp0B+p4ve2IT2
 J0/HrMXoHUoJi1d2KVp45W5lDR5eJh24RbLl7Wdn2LIvK4NcoGq0OYEQvcfRch9w6tDa
 LaY9GP+splrB+E/rbyr3VuLCkaxN5uJhL/Q6f207VzcNB3fHFrTfWvKSjMG9Thgmg1KY
 3Hh3l6C2orA8gyJoP5yWxwPDTnvey2tUM9bJSLQifPXEG3XxA3DITlCgL+e9nLHwI3CG
 XYHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUeyOoeWf8sUhw/iu5+JKS+ztADZj3wBPUZ3YsxQDs9PQvNhJ+C8DNiNkQKXDCNH5ERd+7IlxlPg==@nongnu.org
X-Gm-Message-State: AOJu0Yxn6DXwFWPuWYZKHpouPl7Psg4tVFUG9R4mnaAw0Bg6gjMc/wSL
 FUZJB6vpGh5RKQQOPNIC6/kISoe8E8vN5JDLh7OG6BUlGO/AhmZIK5nJsyiugYQduRk=
X-Gm-Gg: ASbGncvFaGMOwu8fuexeEHYW/rQp3A2OAWr3cHLXokMD39Nb3+RuupyQA5Ksatn34FD
 uIyEVh55W0P9MqhaZp/LJIkPjec6W8ab1SjeDu2JOtaxAcLM/UD3PnRUfoPfN5jbn/tA383KD2t
 sOF8QtLBgXztim/7RpXNb79yIx3vNDxGoYH7hTtSHT5TI9/hw5Ny9ZdJJIPtHkAWdAtSykVAC6B
 sohC5jhPpwfLgISXRkFnvAWnebFhC9IJ7c7RdHJwvx4FXI+4yEvJiqIZtZKlMWfd4iOGCXHhXr5
 LRq7V2K+g2W+Ct9OlN/lkaFshtii89bDQgbhz0GWmnleDP0cI/KRI+73TrlEWEfyWBxsVZkmu14
 LQsoYUFuDqzKldtk1HfqEBFs=
X-Google-Smtp-Source: AGHT+IGJyje28cO1VdCxdGr9KYywbhvezLBfJJzKnYOIpVt5aSoAnliWX7eQ+FZ8u9ORKJDC+J7v6Q==
X-Received: by 2002:a05:600c:64ce:b0:455:f59e:fd79 with SMTP id
 5b1f17b1804b1-4562e33d64emr39399125e9.11.1752689542585; 
 Wed, 16 Jul 2025 11:12:22 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e802ae4sm27708155e9.13.2025.07.16.11.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 11:12:21 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1718E5F885;
 Wed, 16 Jul 2025 19:12:21 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Cameron Esfahani <dirty@apple.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,  Roman Bolshakov
 <rbolshakov@ddn.com>,  Mads Ynddal <mads@ynddal.dk>,  Phil Dennis-Jordan
 <phil@philjordan.eu>,  Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH-for-10.1 1/3] accel/hvf: Display executable bit as 'X'
In-Reply-To: <20250716172813.73405-2-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 16 Jul 2025 19:28:11
 +0200")
References: <20250716172813.73405-1-philmd@linaro.org>
 <20250716172813.73405-2-philmd@linaro.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Wed, 16 Jul 2025 19:12:21 +0100
Message-ID: <87seiwxawq.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Developers are custom to read RWX, not RWE.
> Replace E -> X.
>
> Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

