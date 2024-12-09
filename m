Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2472125njb;
        Mon, 9 Dec 2024 02:29:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWSOXf+Y0kzQSIZhQHLGE1UdqJtWF/0zSulNMPdCv9fNGKkjcPgthOoGhrepg8TpWKa6YiihIZE1DLiYA==@linaro.org
X-Google-Smtp-Source: AGHT+IHaLcKx9kA6Jz5WSO5wv7qDaK1hRjIadS5ZrlX4XkXKP0VERiAgQCm4AvU0jb9sFgSwWeti
X-Received: by 2002:ac8:5ac1:0:b0:467:6833:e316 with SMTP id d75a77b69052e-4676833ea7dmr28551861cf.53.1733740193089;
        Mon, 09 Dec 2024 02:29:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733740193; cv=none;
        d=google.com; s=arc-20240605;
        b=aEh38LLwk4ppjAMz2o0kOSRs3MDY2Ev8F3IIQ5K0VXKv0FAuNY1fU4x2ayLNKu+8YC
         T5JdXmJVtEkA//Ui7QPIRUZTuI3PgN4gWtZjPg4l/zInf3apVc3mYoljBIu2MOUex9D9
         3bZV8E3Qh1iCcDCYSirI69UkkW9fxPbVEslghqCflMHK8JcZFHOLdR7/kCbo981K17Dh
         WNO3WOqWiurY6T+twustuLqPIpNhtfMeHjPTklhBTSunYNgNg7g1JAAGO8blogKIeTKX
         INcDQ6M4+GQ9LjN82DUTRK/OxeWsgtXBNIqWdAlOk/o2DjTEK+z+Zm7fVsTpIqCMausC
         RusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8JIB06Is63aqP/v7CjgO+2buwxAwNok2VczuvxBnCYY=;
        fh=etS5avVqYWmrnbreL/pTa1Az/kJpB/gKJa5k6ugq8m0=;
        b=RRhYzfK//qRZ0lnhja9ldp94ZSYNAU3/gHitU5JhIr1iMPg8vDf6XAqJwYKpZmPpeh
         VpqAfNOm3emQAs0S4nyMFiBJTAftoaaFccHvHuHksXejAxsoeOHPd7pwqLucsAXlgyLn
         ROigShC163W67jy1bu4LvlupSD742bIKmYJUgMOPzfw1rmOfcllrKKHr66SOlqSa7ju7
         BU2CxGz22cIl/CBP5oZJHzD4oMhPJoBbwtKZsCgFRbKYN1dD1yAInJPC+SztQl15X4Hp
         qQc0JjPDdQej6Vt6jNwkiw48yQqI45YEiGImwO3qXcEdZKmtv8OEemInliLETC2f0e6F
         uEMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZebDAj4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296b909dsi127194671cf.72.2024.12.09.02.29.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 02:29:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZebDAj4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKb1B-0002dy-Oz; Mon, 09 Dec 2024 05:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tKb1A-0002dp-R3
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 05:29:32 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tKb16-0007vm-6H
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 05:29:32 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d3d143376dso3341358a12.3
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2024 02:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733740163; x=1734344963; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8JIB06Is63aqP/v7CjgO+2buwxAwNok2VczuvxBnCYY=;
 b=ZebDAj4vxcrKWZ4/Matp8Zkr/+meO9bBvH56iAculHiyWzj8iXtippiecrB1Jt7Jcq
 22K5irAGXXSpL24NPsDfZtd+cuZtpPehvXZHMPWmfBbBDdJcav20YWceWpcR6yrPukrU
 kKMli4OdOHX9Ek5Bm7ZO4aJc1f/LgRHGjJHk1qQbBLKS7vIobrFrYSVOhTUcLC+aJF0J
 N4YYYYswxV5TWgUdODLfAtZv7mJ30dk+O9/u1O/Do0Q3nQJKxMh4xRC3OC6Xiycg9713
 xm4QiBleleuiJSMmoZDujL9cENX6oloRgEIRzVm9F71oLfBrF6+WozuxBz8YHkSQ3F3N
 fyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733740163; x=1734344963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8JIB06Is63aqP/v7CjgO+2buwxAwNok2VczuvxBnCYY=;
 b=DUbd9Re+qpmA6PRPLwGmqONeWkiMyv+L7YGchV3KzkjQzbtdiJi25bgFBhdvpQ57VR
 2Gf4J+/KrXrzzc6x8otfUZEbIolX0cp3ey2LCIVmdC3Z838zPhYf6Rc3xMseLcL816h1
 JoYEk5P+nnlSM0u6wHJL19SC/S6tj/mRTM9V4WHd4TfBiDTh5rHNZfw/XZkTnu0IO6cF
 IwSePWjVeuwftH4zkO/+RP1QgNCzs984xI9WUezhXD9kVhp7LWgWy6xKKRkJw9tEvq5U
 3DeCZDsoOoApJ8T2bagORRLukM7Fkt6C7m1a27XTJlRWy53mXxE69SB0eVIuFfQBz1dz
 mEug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSHalohh4WbmPH+zAggEjxXsEBO5zNUXXi9HwKnNjy9PH9ziK/Xle3VRaZESilaCl6CXIkhAVceQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx4aNJUR7zWZzONwiX+1ZVx76MwsI77WBtPAyRARKOk9CYTYYxG
 yWdTUOO2RQJD9xeP2gYOsUgGmeY/Btkhsoe3UOV0u3cGbQ9MioPO/0MWieqdTHBE6/w3+0LUzZw
 YKv/I7Ls6lc2WlfrqGea0fTZaV2k5ggVdO3YHrg==
X-Gm-Gg: ASbGncsQeRE9LO33F2/G8drxWIh1dW/uHE1fWv3RyTXE2cG+WxBHy4xeLF2KOB8u6lm
 uXWtHDxKcsFMwyDypQNlr8yezaXGSBLC6DglQ
X-Received: by 2002:a05:6402:274d:b0:5d3:d4cf:fea0 with SMTP id
 4fb4d7f45d1cf-5d418612f4dmr21699a12.21.1733740163476; Mon, 09 Dec 2024
 02:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Dec 2024 10:29:12 +0000
Message-ID: <CAFEAcA9_L1Lk=O4-uJ7Qck0RMkUOxySw_LuX087X3TrNqNyoMw@mail.gmail.com>
Subject: Re: [PATCH 00/67] target/arm: AArch64 decodetree conversion,
 final part
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ayax60CKwBBj

On Sun, 1 Dec 2024 at 15:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Finish the conversion of all aarch64 instructions to decodetree.
>

I've reviewed most of this now; I'll review anything I
skipped here in the v2.

thanks
-- PMM
