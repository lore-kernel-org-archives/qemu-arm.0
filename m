Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552E4CF45C6
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 01:21:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfT6R-0006Xh-Qr; Mon, 12 Jan 2026 20:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vfT6B-00060R-Mj
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 20:21:33 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vfT67-00023p-NN
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 20:21:30 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-7b75e366866so1510679b3a.2
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 17:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768267286; x=1768872086; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wgro1hR3cprhNDxL4FMXoZkAQhWmMLATGzSncgFQWVc=;
 b=ByVsQu2aiMlPfCc3/TNUm94GFrGh/pQ6ZTpOqs5xBKJVM+nLfCDpxBkSYdVyB0T/7q
 RzLYZCKn6KMGnzE5T+KeUcuba0YjQVpQffjIG+2IFfzCouCEhJAd5fQirOMTHbztSM2k
 8AY3u9lp/r9r1AyL8ZQ6G4SWvdU4i+40mdO+9ySUQJF79lr/lqJElDuApvJUv/Vp8LPj
 Clj9kVsBpVoZnkuVrKnTxFe2RTOPQtzQe1aNO/GG+v6CpRkkdwelOOUdLgG0iQ4GGl5t
 ZdXN4cxnUgp4Rlve8QNm9ys9tBUHaz7MvL+FU/8YCnrUJfCt/7XcEjJwic2GeViqnesO
 6cgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768267286; x=1768872086;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wgro1hR3cprhNDxL4FMXoZkAQhWmMLATGzSncgFQWVc=;
 b=H307ALyBj1xmu3UnnnP84+hpWfwQoBnaJDH6DXqVYBKZjLy3VD6tpLV8RgImNDvZbh
 BJ3mtpd5esT8lemqZB9ttVuDHWGMxqWSTBRi5lbECws4EXipR7PR9DKndNGiQGnM26nw
 URHRF3ONIv01LTrB5H/WFnHYqmofc4v3n/JVK0pqLXBH/Nj/a9H4y8PHJ4PQJcM/09Kf
 LmgbzQ1YHlGdqfdmaTFUTNUueHbyH7H4Z7V5U3tpaPtlH0CgRLsP89QegrIOguE74SPv
 s/5H/ypZUJsvNGI8LoChKgHaXBioLJpZ3fYhsE2EEi+TlJ4l40r5btKceYdFrFq6MOrb
 GNsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKWRx9XWCecTCJxSp0xRXEvW4zRDhE5tqExXknD56F+WEwlGUXeEAAG72eOCq9N72xJMUxEuJPrQ==@nongnu.org
X-Gm-Message-State: AOJu0YwFDZgRXkclnFmHSyq2ppia6jQIVIX5lZ0RZEMkyX5FGnaREcgr
 VIDOWuz16jl8zwtT8yHbbsoxMwh2Cw4fg7yiof7FTWpg/rGJ5Tt+2DZ3de/qS5cKhr0=
X-Gm-Gg: AY/fxX69G937VrvGt0L3t+By9YXrVP2/TlUityth9x/6d4cssfaaTJWPAj/KODm8+DX
 +RhdpXZPGhVsBNpKq9wJrhmEVyv+GnFXAJLr0RTSgzYQtdOhB481c2HO1ezu1nZCNg2eaRdnP5S
 1K/n4Gaefut+IqchYJzHxIiyLw+Ehwi7PgdbLoLWvM6hcBnew3FEycRzwAnbqNRu54/ztqCqs7e
 kDXt3XlLXo5X2gu+8RhejGreswi2xAyAUAzY4EikCr2mkp9KuqlWMnEwYDq+TaeyrGew1HHybO5
 mFPU2+ji9VirRYf2jz5gZP2qDXHhYMS8+OqB8OgjOgjfpBNsUxvqgtNgVoXiPVjPnMED+elXhwK
 jOl/zc/9IEFGiDsFWR2tlt2s2brhBmRcz3PaDprWB+OLy8lodWlACKUKKw0qbye+LBd2IMsNChr
 spcebvlVa3ayrV2wQOF3uFj3XGrP0=
X-Google-Smtp-Source: AGHT+IHDg+dMh4mWZOKZ2urkwjrP4qE04zjq0TblbV2UPeMr8YnREH2ipYJ1fJkNk5yedPswu8Xjcg==
X-Received: by 2002:a05:6a00:f88:b0:81f:17b:c70f with SMTP id
 d2e1a72fcca58-81f017bd35emr9200873b3a.29.1768267286177; 
 Mon, 12 Jan 2026 17:21:26 -0800 (PST)
Received: from [192.168.15.8] ([101.187.175.172])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819c52f88casm18702037b3a.34.2026.01.12.17.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 17:21:25 -0800 (PST)
Message-ID: <d497d932-3430-4608-a909-a25c5487236c@linaro.org>
Date: Tue, 13 Jan 2026 12:21:16 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/12] hw/m68k: register a mcf5208evb_cpu_reset handler
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Zhao Liu
 <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <20260108143423.1378674-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260108143423.1378674-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 1/9/26 01:34, Alex Bennée wrote:
> It looks like allowing a -kernel to override any firmware setting is
> intentional.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/m68k/mcf5208.c | 25 +++++++++++++++++++------
>   1 file changed, 19 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

