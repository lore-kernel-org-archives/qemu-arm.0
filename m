Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp248838ejk;
        Thu, 30 May 2024 07:07:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQWhwkMBtTPK+BJ0A96SMRFU7N+/osy5Hx6kbh/+6qtUBXrdujdeH+m12WobSTpWis41l2/a60kzS3rxJtiOAOVsHSHDMx
X-Google-Smtp-Source: AGHT+IGdEP95eC5YmnNntmB2J7oNEmn+QhSGbwJ+fyZhiuBA7IR/SEyySRCAOw4o6g3p1xlqsS6x
X-Received: by 2002:a05:6830:1047:b0:6f8:da5e:de99 with SMTP id 46e09a7af769-6f90aea7c0dmr2487423a34.4.1717078044444;
        Thu, 30 May 2024 07:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717078044; cv=none;
        d=google.com; s=arc-20160816;
        b=E7BhijOl9NjI4wIxqc8ZE/APukgwZVqug8I5xzCQ8dvoiqT3uQ7JcaeUwcFV67LxcZ
         yVRHIfFjTHU7K3UisWPujz4qql9chsoj/pTqPOgkAdL5spG6bi+BtywYfHCceJCfuMZ9
         5fin7Yf8qRbmtY0LSMSbid3t2KvO6L6JNyyUK8hCwSRY794ms0hprTYDJn3o6rghDPZA
         xaNzCC2kr+o+uH/W0oN2hke5N3c9j8WBs8NotugiZClMhJTauM8/+WtOcYnEM2e1Qo+2
         lFFsuOwSe3Nf96jZStcej+E32QV0pddyQqMqpid/O/iK3lXo5tVeIcQkXlEN2fjppGx0
         HHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=u/KokNqw+9saHYGEYOOZJB7Qg5jKvekYzZO4t+TV4nM=;
        fh=l9Tm+QTBwA7wyieVxgkDSnficQGmDS5VtooY82lx9Ok=;
        b=v8/k5mmq9qwU2X7BS8JFDu4HA0WW02gxrKu2A/SrFpXlTrtSYiVXW6WoYLWDBZOAZK
         R68WP8cCAx8pUdx8/8L4iGnbFgQNGGek0/zjpJiFGurw4mftEVXigUnWlzzRVSUUKLrw
         otEqsE13BDQTt/ZH/XyWY1DUuiIWWNt1BA/1CkbTyskzRdKc2q4EPD1c7tYwQUJa3uVr
         smXSpcmIQvpyCr+ZMxEJlmWiwfjr/HDTtwpYZ39pZPajkQSX1XNTCbXeQ07eYUkN7/Op
         fnpc27rx2eCf/2q8W3u/JSxsPCZMkdpb3mEsEPMsMPSIamB16oU7oQpIMS6CWMkhirSX
         oH9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v654au7d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48a3a2f07ecsi3344031137.306.2024.05.30.07.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 07:07:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v654au7d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCgQk-0005GZ-TW; Thu, 30 May 2024 10:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCgQj-0005FY-Qe
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:06:57 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCgQg-0000mg-Ms
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:06:56 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35a264cb831so789097f8f.2
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717078013; x=1717682813; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u/KokNqw+9saHYGEYOOZJB7Qg5jKvekYzZO4t+TV4nM=;
 b=v654au7dTcx4LRCr03rQUB77fTBgJurEQHMzJFwMSsc1jJjtJUw3tc2mG26uQPiE47
 gp9kY1Sk0SE9VUGbpVwkxHL7EyodYTMTya4CaWtNN7SElJTc/z+1H0i5z08W/PoJb40K
 MfK42yGuNoMgCSK8nZ+qOKLeAWgsFOiJByqqDwZTUHkA7dkJWInCeGq1d77d3MkVy3o6
 HmKB7PuFRG4c+rCFAdi1PJx69oq7beivOXSgZ3Rb6GR5OU/D/kI7BZg4mkrOXkHT14dr
 boZWa0Y24/Sqf+oAdC0DwBlDN2YzDk2iDtjYJXDDASwGpqrMq65hmP/tJWdMJA9j3mFm
 zXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717078013; x=1717682813;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u/KokNqw+9saHYGEYOOZJB7Qg5jKvekYzZO4t+TV4nM=;
 b=tQNOsv56Z0q1vjV2QfrMSO5u/FvrSisDanJsVOx8V+Ov0lN2LTu0y0Z5dYxnU+Ylt6
 8Qe9s4vgz/lkXJkTVCRlX09f5PjQzv282UESWOQhSf4j7rDj43Sk2i3eDgadxLF4OW/y
 QobXaml13kYMZBFqHyU2XfReoSTbhWQR8E3SnqJkh1l5SESgyg7F+MR4cxokERWuzDvE
 AV98FIXiQUYi1eK1Vv/Oe4zsXuG0DAuAYwvNqTXR+mvK6BWW1LhC/W8SDm1CtSALOBox
 SG+xzMyJvkCGU+zC+A+Y/TK0nzq675MmS1FxSFWRRObaSgKX/uAkDxSxW+JQtXbt5PHw
 5ujQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIssnicolSGaMC9AHkx2jRt5Inw0mHSKQXvegYkkyd1EZYboUTfw9Ot4aBKxXqGDEBNpUN0veKpv+aCsw0cayZtiWt
X-Gm-Message-State: AOJu0Yx4vZ7mwovbFQlCPRUYtA6jzEd5bujnx9q1ovfZFULZzs1Cjpuh
 rq3VC/hsuuNBtWZG72S/jSxFfpO0S/1ZHNDp6uchuXg6rX3RY5PYCaMvJEfmxmLjgrBTAzPGbBi
 lK5pSK4K6bxHeW/DgZuOPikMHbvEO/BCMEnv3IQ==
X-Received: by 2002:a5d:4dce:0:b0:354:fbc8:1d90 with SMTP id
 ffacd0b85a97d-35dc00bdd31mr1538121f8f.43.1717078012742; Thu, 30 May 2024
 07:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240528203044.612851-1-richard.henderson@linaro.org>
 <20240528203044.612851-33-richard.henderson@linaro.org>
In-Reply-To: <20240528203044.612851-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 15:06:41 +0100
Message-ID: <CAFEAcA8RJxUGZn1QcZ9WZ+9e597UQFzxSJyxgPSE2gB2zCxnKg@mail.gmail.com>
Subject: Re: [PATCH v3 32/33] target/arm: Convert FMADD, FMSUB, FNMADD, FNMSUB
 to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: sv6WUtxPcke+

On Tue, 28 May 2024 at 21:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are the only instructions in the 3 source scalar class.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
