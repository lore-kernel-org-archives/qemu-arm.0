Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2492785ejb;
        Fri, 8 Dec 2023 09:54:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkZRaNAihF4mubcLCw9wvHsZRnOQWLgC1S4SeD3VGyNPpj4uNn2URLBcFShz3Wf3Qk5zKc
X-Received: by 2002:ad4:50c5:0:b0:67a:c832:13cd with SMTP id e5-20020ad450c5000000b0067ac83213cdmr355844qvq.70.1702058080029;
        Fri, 08 Dec 2023 09:54:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702058080; cv=none;
        d=google.com; s=arc-20160816;
        b=D+kfs3RxgMTVd8dR0aJuyOwUoYrnsME2DnA7ZbVMu+DEzxKpEPBPkVM5KOma8WDrlW
         CRExgx5GXux9kjgzMzgTSg461eKUAAbJtjEUKBqqw5tHyDcU/wba0UhsTisS7DEslzPR
         sqMXks61iqCoAN+m7hA5PgFmdJYmwz6TVtYdxPmq6W2j51ZKUlbILn7MLW+Lgsj2OWQt
         fAd6J4gR2JEgDbnzFsmZwtF7qfuyTuHoXIlyBbE5NjlK5z2zLYHqx+Fw7c5p6Ch60xDH
         SZKg44Rob4MERAUQnC4DLD/7zO6dOCckuYVOsuNYsOalZ8kggDURm6vdM2Ve1WBm0Rqw
         IrnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1oFjTkTxwWRXiDAa1bd7NwDieJKmCj1wNxx5ocJgnHM=;
        fh=E5Ae+sw58p11tFK58Zyhxow9EJHZwrmlzwrzmAw9P1o=;
        b=Mdyls3Vq8MvRFr20zDxNo0B2vxUyMhv9jnUqLLUxfN4TRaLp1XSgGP0K2ZbHgh1ITw
         SCoag1vZUmzHn9KvVsprlt5xWMY+82U/dPyUj16z6E72E353xTIa98d7ogot6jwXA0ts
         PNZXH7F2w0Cv3vxMZw+RduewIp2v1xZo6dFyukDpnJ9Xng+ec9jj8byubBtsatD6q78M
         UTPuJROniyxjfX+zmwdjSe4hpatfuKL7kcXbtXSy2mZCBSsdKFyP8jkWrPiZg+4nl3gL
         xhfHqZpGvqPbH0n4ry0KvO/fyI7Bt2dO7nrsU0fSjq7X8R55mJuE0GtTISA9d20icLVf
         F3uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B1/JmUVH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a0ceaca000000b0067a24930fdasi2626657qvp.40.2023.12.08.09.54.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 09:54:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B1/JmUVH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBf3b-0003tE-F2; Fri, 08 Dec 2023 12:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBf3X-0003sf-Vi
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 12:54:32 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBf3W-0004yg-EA
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 12:54:31 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d0b2752dc6so21549525ad.3
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 09:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702058069; x=1702662869; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1oFjTkTxwWRXiDAa1bd7NwDieJKmCj1wNxx5ocJgnHM=;
 b=B1/JmUVHuJYU4PKV0mKiII8O+dkxL0lxNokw++v3bLA/Cb63KOYmwuvI1vV1MFh+s/
 Tjw2vQPWwM1Qjmw/AsfpL+lvFgIa6Im0Hh5vg/bfOIRc+Yo7P4fyouCV9jefj1HA4srG
 hw5h6j5b7hWbGLO2/yCxCT8tsBEF6Jo970s3OLdtJLwpqhIKz0bnYAKpT5T3xEp+RQRO
 nR16SLx3ylG7CFYHYZg4DVc/hW55r2I/0V9gfbpucXwZ8AxD2n/qOIOVyzKz5P+nqrqj
 DjDiPZtk8G7Bx60vzXrnd0zSUVSklOjo8XusV+Xi1Z2X0rrgpx4WyinwUj7Vfy8dmgi3
 11zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702058069; x=1702662869;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1oFjTkTxwWRXiDAa1bd7NwDieJKmCj1wNxx5ocJgnHM=;
 b=KJoqHhKsZbAnCH6kivJWCRbeni6Xe1IuHPoemO3OGyV2OGG0EDF30SwMK9QcGCYs9n
 XE57uoU4nmiVe1C0+6kjLd6sFBGtzzdPV1lFALCOU4bMJNMggngtgPpXOJDC2gNxcE0F
 AC4L3lDI64XdaBr1JK6nHpBrJVdmfP/xd1Euvovb4fqyioJlJ4Af+E5Wax/96WQRAd40
 0OJGPeerbnDYLQyAI54GjlU8iMz4ug58cQl1CsUsXaTfn0iWVFtJ+HXAMjTEG1RQjM7I
 myzFAolGG0811828RYShBRh2iOki08XiOZbyrm+QixjRc2q+5Lua2SRBlDksS824QrhB
 Mpew==
X-Gm-Message-State: AOJu0Yzv+57a/8RV/1aDmqL66q/8KbwAWhqYqW4QbQtpgMxoWZUsu8gR
 ERKY4KUXMtzwDMJIN4qhL0m2vg==
X-Received: by 2002:a17:902:d482:b0:1d0:7d0b:5571 with SMTP id
 c2-20020a170902d48200b001d07d0b5571mr435946plg.109.1702058068944; 
 Fri, 08 Dec 2023 09:54:28 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 ja19-20020a170902efd300b001d0b0334a9asm1988324plb.155.2023.12.08.09.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 09:54:28 -0800 (PST)
Message-ID: <78b637eb-f3cd-4b8d-a3be-758a25b3691d@linaro.org>
Date: Fri, 8 Dec 2023 09:54:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] sysemu/cpu-timers: Have icount_configure() return
 a boolean
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231208113529.74067-1-philmd@linaro.org>
 <20231208113529.74067-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231208113529.74067-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7uBjfs9mtRKm

On 12/8/23 03:35, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have icount_configure()
> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/sysemu/cpu-timers.h | 10 ++++++++--
>   accel/tcg/icount-common.c   | 16 +++++++++-------
>   stubs/icount.c              |  4 +++-
>   system/vl.c                 |  3 +--
>   4 files changed, 21 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
