Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1106038ejb;
        Fri, 15 Sep 2023 02:56:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOi/nEVWSHqNEQI0+WGJAx7T/4CxNxxwdsev4CUf/okNVS85IR2gwjYHuJMxVyYr7klv+W
X-Received: by 2002:a0c:f390:0:b0:64a:959f:22fb with SMTP id i16-20020a0cf390000000b0064a959f22fbmr1138932qvk.58.1694771760641;
        Fri, 15 Sep 2023 02:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694771760; cv=none;
        d=google.com; s=arc-20160816;
        b=dZn9bd0q46kqOXld3XyHJDjzk12YnzMJqiPqJesJ5b6EyHj/bdGhtGMVkMkJQk29ct
         1JjS60XmzlRn2HufvEYEfqnBYTiWom9EyumOjE5knFIRTtpdiZOv4PQ8OfQiYxxyJFAV
         BHqEWl91TdaULdyyXWGCF+q/p1g6EtAQ1oS0QW/5xZdl2N1tjf5A+3pXEvbSGWX7ESo6
         n5XPLIBTmUbn9/3wE411MRwts6GRZpmcghqG6P/5d6KPZ9l7faVd3QUOHq8WlfImYIAg
         4RaAJEkQsAutgqzs7JEEM6XQnVAwqVzJ4YOH7Gsxfcg0v5aopVyM5pvlGCcJ6wuITfSs
         0fkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+e+xQ6W4IDIkD9Yc6XKgugLMqvXXlpeRmlY/za2vlOE=;
        fh=ThEABJUDOFeCcB3eRv0raUmJMlpN57h6BTRpkfyS2t0=;
        b=ETwvWi9FV/sM7o/FcUaW4dvcFRC8SvgWvqLx3PDafxUmf8+7uuv3Cmg481FJPzTCd2
         6YqLBJ9d+Mixdkw2cpTCBKPP+PfzktIqu7ZVduo2qkVDDBaepZpZvbc0WkcX9FzDPR8E
         NbFBADUx8tqfmv1WV7eyYAC7SqrZmcwLY3o9Ja5sT2Kiyb0cYSBjcyJD9LcuY7e48wAA
         fpzYit5Aoy5HY1vDexdy5UKZeTVckicf4ERzI+GF/2O1hlKCAYWujkuv0x8GtgK2uK+F
         Zq44AMObtSGTrltC2D5hXi5WgrjuthU24gHBptpsnyNb7i4N09k90+BuanOP/bRAvgge
         P4Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8X5QmTk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020a0c9a89000000b00653589babcdsi2044852qvd.415.2023.09.15.02.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 02:56:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8X5QmTk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qh5YE-00062x-Qv; Fri, 15 Sep 2023 05:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qh5YC-00061l-KV
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 05:55:48 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qh5YA-00052p-5S
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 05:55:47 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-52c88a03f99so2201689a12.2
 for <qemu-arm@nongnu.org>; Fri, 15 Sep 2023 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694771744; x=1695376544; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+e+xQ6W4IDIkD9Yc6XKgugLMqvXXlpeRmlY/za2vlOE=;
 b=C8X5QmTkChefYKS8VaW6/UoLLQJ4ujIFtoztAmZHKmbewkW1Rf+2ZUSu6O7+GE33Uh
 bmqIxTD7wKMqNpACLcPjaqA1gxrfwZezQ8D6HlvyJ8LHie0unvPfVOWpVc0uJZla37hk
 Wav1PyUlKAM7KPiFFyo44ACCrrXIiUAzQ2tF8PQ6IDu8uo1zKxcF+Lk8dBmrq2Btkhxm
 rYA5zvajJyCmKKIDoD+45Y5Naw8erUhNYNF4wQhQfXcLJHC1vsTq3RNZLZk/orBedYYm
 MJhXaXe6e38yw0rGuEWLsMY90A+sqGXSun7+NexBSGCmDn8w2ZlJRtscyz/Vu26k8e7H
 FfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694771744; x=1695376544;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+e+xQ6W4IDIkD9Yc6XKgugLMqvXXlpeRmlY/za2vlOE=;
 b=w1J4wL7JrSrkv8GpjMCAHfOveFLNQLHiopxuUwdprdjqLKQ17e4ppOtPMDwfN3a7z7
 YPeirhN5Nu25SlO0GrLcErTFSNYE6PRyWLIUHHyKll/J6CdLHZAMIi1PDXvrA4Ycw8VG
 q1JU6b526OFWPggD9oBikzcBGEc340u1hkWlaa8taMyw6QNdEKAvg9wepx22pdV1R85V
 Dz2AKL3jCEXWulYbKk3GLKNhfdMWQyb1Yt0skUZ0rgTH775c2RDSyIR5pebDNbySxM01
 IjgQla61EXMrC87qeqrwxT4vDXsGQZiRIHZts5WzY+aWYvxhgElETvMs0Oxw3o/qPSZ3
 Rahg==
X-Gm-Message-State: AOJu0YyLSc9OzQesuciHZ7Ak1BYl8XGDQX8RTvxMtSAMzOFUlWnkNffF
 TXfDqnb7yLynQL5xNxEp4LF07Lxu8d4PFcU89pGxv1+fWhfuC8Nt
X-Received: by 2002:aa7:db86:0:b0:52f:b5c8:fa6a with SMTP id
 u6-20020aa7db86000000b0052fb5c8fa6amr985358edt.20.1694771744153; Fri, 15 Sep
 2023 02:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230914224211.2184828-1-komlodi@google.com>
 <20230914224211.2184828-2-komlodi@google.com>
In-Reply-To: <20230914224211.2184828-2-komlodi@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Sep 2023 10:55:24 +0100
Message-ID: <CAFEAcA-k=KZFd8Xm30LswYZW7ZgDwVe17H5xB4EaxTFwhm1vpw@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/timer/sse-timer: Add CNTFRQ reset property
To: Joe Komlodi <komlodi@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lcWJkpvFjXsC

On Thu, 14 Sept 2023 at 23:42, Joe Komlodi <komlodi@google.com> wrote:
>
> This can have a non-zero reset value, and cause the kernel to complain
> about a CNTFRQ mismatch if TF-A (or firmware in general) does not
> initialize it (because it expects the value to be non-zero out of
> reset).
>
> To fix this, we'll just add an object property that people can use to
> initialize the CNTFRQ reset value.

I'm a bit confused -- you talk about TF-A, but as far as I'm
aware the only use of this timer device is in the ARMSSE,
which is used only on M-profile boards.

Also, since this device is a sysbus device, there's not much
point adding the property without also adding code in the
ARMSSE etc that sets the property appropriately. On its
own this patch will do nothing.

Plus, it is firmware's job to set the value of this register:
in real hardware it is always zero on reset. For the A-profile
in-core CNTFRQ we set a non-zero reset value because in a
lot of use cases QEMU is effectively emulating firmware
and then directly booting Linux. I'm not so sure those cases
apply for M-profile boards?

If we do want to follow a similar approach to the A-profile
CPU timer, rather than having a separate property that must
be set, it would be neater for the timer to ask the counter
for the frequency -- the SSE timer is run from the SSE counter,
and the counter has a Clock input and can call clock_get_hz()
to get its frequency.

thanks
-- PMM
