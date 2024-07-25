Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3407965njc;
        Wed, 24 Jul 2024 17:08:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVQI+kyyNetWHbsXpT1Ajud8fXvcwmB80CAt7IhoGIgGN7i/z4OScSjWBob+pAHUhzVztV1Ro/U7xdoA9wzBE7MH97/Hr7
X-Google-Smtp-Source: AGHT+IEruGi3JBjVMlMR62aam0ai82pDIvGBRNMMqhEQ80aS5EaDfe8U78G624QaNNH4Pugh2RSC
X-Received: by 2002:ac8:5f92:0:b0:44f:e852:19cc with SMTP id d75a77b69052e-44fe91da572mr3082011cf.29.1721866097831;
        Wed, 24 Jul 2024 17:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721866097; cv=none;
        d=google.com; s=arc-20160816;
        b=J0KNjf+M9WzZ/xJVYnph8e+smONk5hkrHcEwTpEIW6LmR+Clv0uWwAzXOrXQHQaD8k
         xuIUND7GMV121lnJ3vdELsGKRhGNqL+60a6lSdDXow2FNxdHliZnf44m8FKn+tQtDK8Q
         CjDHr4/FTR4pZiKVW8LNoNICZqiTedH0xp/fWyamxkUStDol/c0o2nLpUEjlkBs1Ht6T
         g+PRVal++Q+Bnn1KgF8kiUbhqphHPW9fsimnCB82Ojwwq+Bn/nVCPDMSFzwLUTSBvmC0
         fWObd0gsEwWqWGCvN9tDEBLTHGu6Q0MGrni54IZRa4ezVewi+j/lfCuWgoDmjlFyDFk/
         yxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=q29X9Kk5wA0BKFvBR2hSL6jPiMLoZWNF1zPAoTNlJPE=;
        fh=Jm9ZwwFsGmfwuU7iuvHGLiRD7eAduG+AQmUQpkx19Qg=;
        b=lW25Q+mJnXWxI/MzMxC9Iscc67dmmoFqggNDRDk7wrIgRGfH0E9/1DMmR3gKzszlWL
         Ez68OgAjzsWFqMoM5fYC2lmUtHN+QcD2D+k1LnmPZGHGAeuujRWSOzpsIT8BLSTkVgXD
         rbuOaJOhbIa83ACav7nOIwxFxqVs00a/k6n1aO/3G1VLiShYxl0s64YDrnvjsuevF5HY
         iChtec+6bpuNU/CfzM6DXQz4AeNxiICCx0YGVbO4njU1qufTzDxFDYnoAysxub+oZE8e
         JzKMSIzZ3/e+SpM+i27knnRqImqJqa5qk+B+zHlzrTdwZsjWFHyyx5utDobVZmBCUORM
         yQEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zUAorRqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81fb4afsi3332681cf.289.2024.07.24.17.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 17:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zUAorRqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWm1X-0002e5-0W; Wed, 24 Jul 2024 20:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sWm1V-0002Xu-KF
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 20:07:57 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sWm1T-0001GY-Sp
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 20:07:57 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1fc611a0f8cso2698705ad.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 17:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721866074; x=1722470874; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q29X9Kk5wA0BKFvBR2hSL6jPiMLoZWNF1zPAoTNlJPE=;
 b=zUAorRqEY9EVRo+2q9ZXUGNn9n57375t46ufqWCTzWkK4W/oMk5UnTABrDcnrVz/+r
 O9796Y8sevd8sMUc18oedwHya3mx79R6QplWBue0VMAFSztdXckEvO8lQ2uAphYtgyeF
 +PCHuUChLTKmmMiWi+xKBvHARK5gPJ8m7wJ6gEzgEfX+rcdZpvHEs8/jsCzDG/6Qcqy/
 TmEQhSPDG7TckhjDFhUOpyiUd466qJ1uBUdVCHmtCETQZoJDNhMt9Lca/pbLdpbmCirh
 YsktqytwMxdE1p5toZ/JIkWZ/gl5tgBOrdufCm4WZoW6ZMWQhvoPkH7dJTzikXJVo/V5
 /Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721866074; x=1722470874;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q29X9Kk5wA0BKFvBR2hSL6jPiMLoZWNF1zPAoTNlJPE=;
 b=MIXLjtGWyy9BG+NYveLPbyGWXYS8b8uY6fZ7HlCN3fFaZS7mzshMaHt1fS9R04AkIX
 qtE15b7Yor3BrWwtxTaij960EC/6DENzc1wyCCMsrcFkPpaocf1Ra7S6eq7oZP9EPyNP
 3lq0Iogv/uysi/+V7SPj9ZOkiOySdOruFfLhZMTPRvzkno3Mu85VHVEgezKay+P7wJkq
 JVIUYoN+wGuWJrEKJQsuFSRLVM4U6kb0/6sa9IMofDJiB7cBdVzrBx+f1HX88JX15fNY
 HsOn2imEXh3CRE0v6Ar4yaWGddEAnFGinf00bsmHD0VcgraPgN84LBRwjV0HonesbA4r
 SBog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQGlF23wqYQCKch9jP3fjJKQjsbl8bXliC8/xjZmKymcokY3+XQ4VAzYC7BhbDSKSoPzPByUom7AVwnJaO3dZ68hE8
X-Gm-Message-State: AOJu0YwLYPyh98xGeMPgWeYw4XsDRkla7Lk5q9Z+2nbjc5eqSBKAG7dC
 DCneJEOc0lT/F/I3M8aowesr3LCVSdfN/Huo3reOvXHoL+gAsKMASFqJi4DB4Yo=
X-Received: by 2002:a17:903:244a:b0:1fd:64d2:62da with SMTP id
 d9443c01a7336-1fed92739d2mr2448595ad.29.1721866073736; 
 Wed, 24 Jul 2024 17:07:53 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7fe1a26sm1548265ad.288.2024.07.24.17.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 17:07:53 -0700 (PDT)
Message-ID: <0679a991-a8bc-4406-8e9f-5ee134136666@linaro.org>
Date: Thu, 25 Jul 2024 10:07:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/15] Bsd user for 9.1 patches
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240724220449.10398-1-imp@bsdimp.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240724220449.10398-1-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pGeArVRTuCOL

On 7/25/24 08:04, Warner Losh wrote:
> The following changes since commit 3cce8bd4d737f2ca688bbdcb92cd5cc683245bbd:
> 
>    Merge tag 'ui-pull-request' ofhttps://gitlab.com/marcandre.lureau/qemu into staging (2024-07-23 15:23:05 +1000)
> 
> are available in the Git repository at:
> 
>    git@gitlab.com:bsdimp/qemu.git tags/bsd-user-for-9.1-pull-request
> 
> for you to fetch changes up to ec018b76798e1196882ebcbf3df15e6d86ac9d7c:
> 
>    bsd-user: Add target.h for aarch64. (2024-07-24 16:02:07 -0600)
> 
> ----------------------------------------------------------------
> bsd-user: Misc changes for 9.1 (I hope)
> 
> V2: Add missing bsd-user/aarch64/target.h
> 
> This patch series includes two main sets of patches. To make it simple to
> review, I've included the changes from my student which the later changes depend
> on. I've included a change from Jessica and Doug as well. I've reviewed them,
> but more eyes never hurt.
> 
> I've also included a number of 'touch up' patches needed either to get the
> aarch64 building, or to implmement suggestions from prior review cycles. The
> main one is what's charitably described as a kludge: force aarch64 to use 4k
> pages. The qemu-project (and blitz branch) hasn't had the necessary changes to
> bsd-user needed to support variable page size.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/9.1 as appropriate.

r~
