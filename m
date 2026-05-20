Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C092CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:27:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkfr-0005uL-TP; Wed, 20 May 2026 13:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPkf6-0005Nj-30
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:24:53 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPkez-0003q3-C1
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:24:46 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-449d6c68ed8so2317777f8f.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297884; x=1779902684; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EANHwnYYHEcI+VH4RFyz2Hu1fN96LzD1GzWYAjg5pqw=;
 b=V4p0oPrVHtzSefaJQuQko4oLeKzvh0Nn4hx0EbKNC8x6SDtLubckbPp+LXd1qxF5J8
 EwuXkhuMOA2w+iRsjx0CtBI/pDt+1cK7GaJK+Etknb2Cd0O8iztZmMb9K6yQKMcaqWw/
 hF6mpPcw+XmAN3dKnS6es1pApySgH4TbfLud+Lnu84+MzwShzlTd4dUoffH52z5NOdGV
 VU418t6ord2SoJTWZZp7XV2XuibqW+ecL2t2T+Tz2SNxwtvi3K8NY1TSYB2a3Jn+Jn8Y
 xm11MzBMrjzFlt9SNydSiUthHRcD1La/IJZR/YFf8i+1tsIIP72/Rx9kJtvpagWdWoLT
 fHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297884; x=1779902684;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EANHwnYYHEcI+VH4RFyz2Hu1fN96LzD1GzWYAjg5pqw=;
 b=AlDFCROsaS9DOT6e00dZ7XHGI6QyyZEN2goENXctyNX5ztUEOnG93+G/+es0RkC41R
 ufGnuQC2WrXPtTwFktXVL74iowbbpbf+xjACODujMlGrqa7d6mbkyGzn9CN2To8nZrNP
 FrOGRoQYLCi2vb6I4R6ha9YsCxSJo4S97oifEp44Gr7aPLGeSTseQqntTl6ivHoLnfw7
 st23voAavyPd43oBu8hnvySmrwdCtZUCep9+IjkQQwbDj3Ja7DoG4tMtBaYwfIitZ3BS
 H6oiByaYSbM3rxuTvb9rKbKJgzJ6fQNApIq5pyJhz2uqvyTjBcs5uOdSHZeKn34X88Ht
 wvfw==
X-Gm-Message-State: AOJu0Yy6/l0233cgZ8wzPfU3OEQ1L6KMZeRyuTE1OBsZlyby2QYJ1dmm
 lR7XqOiFyn+TR2BwcalR7o7Xb5FAAtmbVOil04I9YCbZ9voCPa7y/TWkQdvH5r+VgR0=
X-Gm-Gg: Acq92OGfqABX8v5zJYy2IcJ2p7uiujLRTpTT32yKVqrCwlx2mcqt/93WutVofp5AB/s
 CK7MvBBEIM9hFqJKQn1UIzPqzyqFcQcKBCgnoUljY1gCdgZFbPJYZ1WkZK/1XAw8I9uES3wQ6SP
 nA6ZCyA+2f43lslesmeEhoiscbR/a0rrnWv1dKj0pqlhRCnWn+6t5E6dBVvgCkHot+XFuEocJ4l
 CAQOqQ1c67b14yMpD4T6Ir5fVXoQPouhix+PUJT1P84KzZ0EmcAg5Kd2Dlq5yQZodujSVjCXLPe
 1G06ZZ7Ua4SjbofdAaC/1d14LaPNwBDNAIATrB/BXt3GOkZJTO8NA0QEisWamdCTU5aOUciKOu+
 igyXw0ju2umFCXZb3MJSeUsOoKwRrBSUuN1dLrzF6REhAtSZOh0HJ4hayEJMFAwET93dJIFH2Yh
 RwcJuLlOvhdezkAz4e5VC3nt+B5OiWFTU4ebb7vm4Be/NPnECiL6RgvAxhztQFj9wUgmtWZH7Gg
 RXK
X-Received: by 2002:a5d:5f53:0:b0:43d:73de:abd2 with SMTP id
 ffacd0b85a97d-45e5c58728cmr41517642f8f.26.1779297883919; 
 Wed, 20 May 2026 10:24:43 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a6454sm56789395f8f.34.2026.05.20.10.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 10:24:42 -0700 (PDT)
Message-ID: <3ccb29a3-1a70-4d27-a28f-330e6a60d3b3@linaro.org>
Date: Wed, 20 May 2026 19:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/30] fpu: Use parts64_round_to_int in
 parts_s390_divide_to_integer
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260520171820.848839-1-richard.henderson@linaro.org>
 <20260520171820.848839-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260520171820.848839-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 20/5/26 19:17, Richard Henderson wrote:
> We will not expose parts_round_to_int_normal.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
(as in previous version)

