Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5586CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 18:42:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v41m0-0007gU-2m; Wed, 01 Oct 2025 14:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v41lw-0007fx-Fg
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 14:41:52 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v41lh-00082T-VV
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 14:41:52 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e52279279so957675e9.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 11:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759344092; x=1759948892; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nl2SIymaSoLGPM0GZwLv+GOmwyB7QiFpXfrEivX0AWY=;
 b=vuhDYXarAbGjUUoVwGLbPqIgfzsaq1GJX6P+a9rAs6+UJElnUHqkZRXnQS+VV13meL
 VFdAmd4lYhrjxFZ+nu3LJMaFi8lMmK5ojzVuQ1oHXneI90k8XXrz8h1b0vHz2jwAEAOI
 RmdfziOBgUyb0Yy0failf32oSqwyJZ0y0L81SYoNU1GgG1lYW3qzTaLlea+fKRYsnQXx
 c8SuUljOyt4te+gc+ym2dA3Xo1nk87TeN8Tnlg1XhZGewl1/np5/3l4ivrOWOAOG7sjr
 UNW1r+JKIXgFxaLgcnD/3gjM0MT2OOVSeqMRvxOhhg21elxsNLahAen1GNWVamS2YBKM
 iMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759344092; x=1759948892;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nl2SIymaSoLGPM0GZwLv+GOmwyB7QiFpXfrEivX0AWY=;
 b=AsNAhHvLjg1UsXi2mrvQa7o/CpzeKYetJMXvhaBBBj3B5JF3Gzans4CjlJNU++2in5
 J81HIjeBoIiyw8hA0gBazO5fDSYFN+Ym2EUH6aLYYf9KYh3LVDUYj8lsMObov7gJppwF
 PVvjZEicVhRW1gED6h7OBcN7Ot4ImjBFjnLDq96oggYLCXfL+Qbqt4ZEnJDqZ97WZoE7
 d1Tc1zrRht2julY6GrH0og4HjpWLhwI4m6RT8edmEi2gjjDrEm2JvVQO3u/BuMmntlI4
 TDX5MIrAepJUz2rLyU5xhWXCSNGqNsP6a3d0033dk73yYGPhpcBAfCcWq3RbwHcY3EqA
 MJXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzCl0YQLPLspX9AtID1my0nt+S44bm9WIYPs7tydK6iycmyXb8aaoAnroRBqnJyj58jEhoM7hSYA==@nongnu.org
X-Gm-Message-State: AOJu0YyCp4tFx2cGONGuvMRB4NCAjcU9qfA6L62UjnC/SDv+/gvmzpQ2
 RTWTjLNM1E9TfnZPmN7lRkwic5sVM+YAigF4ks6JrqcDD2bQyONracHCggFfKKtrXHQ=
X-Gm-Gg: ASbGncupy9xbJruGsce4MyWksILZkGYSEXbzc+pvR3FMMNIw9/M7PM05kNo1DgroXg5
 6miChV5TZWgi0d5OJf1U6g0BoRpnFfv8QaDhwJs6Gf9tO/6EI3GGEwkupDAe5hB4gWBciAfAe0p
 JYVvSRHmYMzc5HBaFQPBkYNCOf0Sq13/zd11TInss7thrsQKUyEQ8/ewjSQ/8FfrVg0kFjF1uIi
 337mvakAmeqc2Lhavk/i4+v2565U9S0ido1L5W0p1u6r+UXQQFUthbR3C3DmEApVje2wFD7zzXc
 QRBVySWCu6YP1uKfIJo6gYkzIo0blKQ1xOQlQJF7r7J5o1xTU71iR37naleAoTsrjxJtKKs/6Ab
 vcD/vAz5x0cF4kqidItiSHR9rfBuRxx5zKaqLNhGvExQ9vzg1tXgdLG8p5s0jlsHaFiEMSzEW4r
 AfK2MyCqjwZD8Hp6In2J0=
X-Google-Smtp-Source: AGHT+IFDUgMWWFaSlg8mrmo+Ej2x7djhEHr3dK7DVzmPuJgOTJ22nVrphKZblwmNTwIXsEZAORf23w==
X-Received: by 2002:a05:6000:1787:b0:3ee:11d1:29dd with SMTP id
 ffacd0b85a97d-42557816defmr3489400f8f.35.1759344091981; 
 Wed, 01 Oct 2025 11:41:31 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e693bcc93sm2455395e9.13.2025.10.01.11.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 11:41:31 -0700 (PDT)
Message-ID: <50536048-2b05-4424-8254-d61711b03693@linaro.org>
Date: Wed, 1 Oct 2025 20:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] tests/lcitool: drop 64 bit guests from i686 cross
 build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, Thomas Huth <thuth@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org
References: <20251001170947.2769296-1-alex.bennee@linaro.org>
 <20251001170947.2769296-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251001170947.2769296-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 1/10/25 19:09, Alex Bennée wrote:
> With only TCG available we can't support 64 bit guests on a 32 bit
> host.
> 
> Fixes: 5c27baf9519 (docs/about/deprecated: Deprecate 32-bit x86 hosts for system emulation)

AFAICT this is only deprecated so far. Should this patch go with
a series taking care to remove "System emulation on 32-bit x86
hosts"?

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/debian-i686-cross.docker | 2 +-
>   tests/lcitool/refresh                             | 2 --
>   2 files changed, 1 insertion(+), 3 deletions(-)

