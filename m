Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp400634ejc;
        Wed, 12 Jun 2024 06:46:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDQTdaPmJOTpSdHD93UZhdrrHb0PDlG1tu45Ygq35uheG7bsSmX+niGq6v7PGErQWaRZ262xcGC1BkcY4HQ6dXmyZsZH2C
X-Google-Smtp-Source: AGHT+IGIwEea4p4DXzu6FwxvAsD/hKou696PnS/GvmNR3iDHoN/hKVaDnJpEJWket7b4RhZ0pFqN
X-Received: by 2002:a05:6808:3189:b0:3d2:1549:1f2d with SMTP id 5614622812f47-3d23e011fd7mr2014084b6e.19.1718199971454;
        Wed, 12 Jun 2024 06:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718199971; cv=none;
        d=google.com; s=arc-20160816;
        b=CkamYBerNj68XoAUFDO8porMc8buVQZDu4VVEBJeSH574+Mgau6rjzV4ES9X//GXXH
         Ku3ZRRPigWQO5a9gu1AHcx2RtLvSQXQesktXZjQw6P879INOXjjOAblswWa7JtiYmldF
         4GZowb+5Y5f2GQXwJYIJlByGIl8HEOSsoronCsKIi+u/AhMWMjgBV6N153Nl/FCRsUKE
         KawcH6wM62u1GNeJ/VYbSi0wl36o9cYP+Pwb8z4bbqRUf7j1aiR5ActFTSIsIU3KtYmA
         N9XgW2hghDViolftFPDAbEEoSgLELK1RUr6amXWcsXfYTMp2k6H+wMz/yw3aDJCMVPZa
         kifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3iMuEOSqVyKNMU1vKgc/9cJtilerGT1O4PEnMf0TI5k=;
        fh=pfiPflrhkShrHGL8hTWuoPB2hrxylj9wUqXmgDirl6A=;
        b=X3yhq+cLgLRH7eCZsuF/jy5oq7JayCVvKzExcEj9a5CdGoDpMLYjp+kEoF8wU8eqoB
         Xnwwjv6MCRpCMCLRqlppzPTwH9RCywKlNNgJ1x2aL1z5nw33ZrG46u7VsHjd5MYVdZTX
         xtwoFsCa7mQCMIQ4roZHfMyU5fuZhAOpWiOo4kPmwOT3YL8tFeRBMgcv+5k/SLxW0pOD
         IJ9+chuXvzMmEPk5T7q4U1hkiOL1YypXFye2APQOh8J3XMFLN3fQCmHsbueknwvGDR6j
         eBcD4SRDh72VQewWwfrIUwUgE6Ky7rUgzif7arGt9bVOS215XgozhRf+tySXlfWweNhW
         j5Bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bvUjVJE+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79733cae21dsi772961085a.415.2024.06.12.06.46.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 06:46:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bvUjVJE+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHOIU-0006bz-QV; Wed, 12 Jun 2024 09:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sHOIO-0006b3-MV
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 09:45:51 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sHOIL-0000bc-8D
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 09:45:48 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52bc3130ae6so5387605e87.3
 for <qemu-arm@nongnu.org>; Wed, 12 Jun 2024 06:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718199942; x=1718804742; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3iMuEOSqVyKNMU1vKgc/9cJtilerGT1O4PEnMf0TI5k=;
 b=bvUjVJE+4WyJgmjGmWhnPdGwjXXEyMTLV7X4q/Ma71PavNx+CnfDcpSeUcl1vHR9n2
 1kGDOyO9/RYsIrVAl+7WvSfDploeLQnKwavksH3LIxR3ZzoY04JQsXbM7/yRjhv9EYNi
 O39F5gYJg8M7HtBwDOG9sjQLMDPQHwvivC7WQnesk/tPviP4GY5vNkhw7jcSeAG5FDcc
 F5acTjZpHHlcD4JrYsKOzYju/zUETK1GQ02NJyOZKF07jl8sqyt9mtEfJSXq+imFFQX3
 RP+RRnTHYo0JoylQnLHzvCqhOdv9MzDSN8XZtTJtfAHbwRw8qKJKN2r4kz2hSGYc6ycz
 no/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718199942; x=1718804742;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3iMuEOSqVyKNMU1vKgc/9cJtilerGT1O4PEnMf0TI5k=;
 b=DE7iyB/UvmbzYktXTLIYQNUk+BTdCzNDWkWpxYUxdOLjM18U+XUOTLypRmt1b3dYoo
 Bu2cAE4fUHJkbB8hCkqN3Ty9tlRbmXBIkHukbwqct2qDr/tX9wEVhZs0Oarg+tiWs8Zw
 /x8M/Q8v1HyfA2o4tQOgpO5kTpMU/ga7aRWsioJFia4UuxgDIP0791zIg2aZImy510lM
 LZtiSyJwswqua57kyVHYsgqSUnj5lXhjMLLeVo9sMHsEiDN2G8zBEY5fOTFrIvueXrPT
 y0DrMz1Ny8hIHvx3aLdIi+OYN4jxPz4Vs6XhuLOzoh+rNdf7zh6cXQIWZFopBq1+yjDS
 gSYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTMYxs15PvevKfhu++pdUHyc4Boe0plTNQa1PVwRyaiVUU2ToyYrGgvdJQpaNNvJjvatUKdNu/KAllMnBhNsbbyi/L
X-Gm-Message-State: AOJu0YyZjBXNLcs4/Z8RSfL8ncAjybsVQs9NcIfn5apmnZphf4zk4deq
 tBlC5G6RhAaK0Gg1R4tzA8RM8onytMjn7trDnR20SeTk2Fh6IYJpcTgsnY+q3ZA=
X-Received: by 2002:a05:6512:3055:b0:52c:89b5:27b3 with SMTP id
 2adb3069b0e04-52c9a3fdf47mr1549604e87.42.1718199942422; 
 Wed, 12 Jun 2024 06:45:42 -0700 (PDT)
Received: from [192.168.69.100] (ram94-h02-176-184-0-172.dsl.sta.abo.bbox.fr.
 [176.184.0.172]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c97db2356sm401521e87.200.2024.06.12.06.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 06:45:41 -0700 (PDT)
Message-ID: <ffd4dcb3-3777-4335-9a33-9818dd413b8d@linaro.org>
Date: Wed, 12 Jun 2024 15:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 21/22] qapi: Inline and remove QERR_UNSUPPORTED
 definition
To: Markus Armbruster <armbru@redhat.com>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org
References: <20231005045041.52649-1-philmd@linaro.org>
 <20231005045041.52649-22-philmd@linaro.org> <87mswx5n63.fsf@pond.sub.org>
 <18739a67-84bb-4fd3-adb6-0db0f0eb7af1@linaro.org>
 <87plsmfgxq.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87plsmfgxq.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 0cBE263Dr/aO

On 12/6/24 15:07, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Michael, Konstantin, QERR_UNSUPPORTED is only used by QGA.
>>
>> Do you mind giving our maintainer's position on Markus
>> analysis so we can know how to proceed with this definition?
> 
> Daniel Berrangé recently posted patches that get rid of most instances
> of QERR_UNSUPPORTED:
> 
>      [PATCH 00/20] qga: clean up command source locations and conditionals
>      https://lore.kernel.org/qemu-devel/20240604134933.220112-1-berrange@redhat.com/
> 
> I pointed out a possible opportunity to remove even more.
> 
> I think we should let the dust settle there, then figure out how to
> eliminate remaining QERR_UNSUPPORTED, if any.

Ah great, thanks for the update :)

