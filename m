Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1992487ejb;
        Tue, 21 May 2024 03:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWyTuKnLQHJ+dfEENSvPHpLFmgJ0I+ITrzrMq9rWBzBAoxVBFSe5TeiTNAz1o11fePjZX5GSasdfUzcNoCcOTFfPL1q9vvr
X-Google-Smtp-Source: AGHT+IEmJpxCsH4G7ma96eVAPbbPTmqAvqYIvPAQRiwo75fL5vpigw0sWp7kfI1MxwsVWwGeRBfh
X-Received: by 2002:a05:6808:6288:b0:3c9:91b7:e814 with SMTP id 5614622812f47-3c997024be6mr32191698b6e.1.1716287730481;
        Tue, 21 May 2024 03:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716287730; cv=none;
        d=google.com; s=arc-20160816;
        b=qnXfVYIav9mppPX33lnHAKapzx4QPtQk9i2QUbLhZ3qyElXUWcqHzYneqalWELIVt1
         ugykEUdj7cXZdXXI3gTChn7Iyl2YQfr2G6H/3DJ0Y+orDBp8ym16Q8RZbJry5IkeRYzi
         SBvudM/buBv8GVvhwZqpNipHIrZlCmyQCc1jJ05PNG5Or4F3lJOI5mGqsg2nvtbyq+Gr
         i2yWVF8HOSi2mKA9pIWWeemxMLD4YWqkVVihsHKcFU2vgO9koJ88sO5/iiWRAWbB//RK
         4LuZpmTLwzskRt+lm1TLOm1Ze3Yu7KiddWXZ5SXC2IxvAoloT6pzItsiD8IWr0Jk+78z
         utmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AJ6PC3CGDbWHHX2Q5qYVzbZXiT+T2mYSTWQN96Hvymg=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=Zx3oVd/BTiY2D/Et2l7OpkJTF5udCmZLRwrFToLFnvq0jASO6kpH8noZTLxETq2Diu
         rhme8sYFDrfLUl2/q8tmSYMAaYJEGDfaHQSRxbqvCMPpiuQIr8QRIWo76X36ZBRo8cYs
         VXOGOP63CnQlWJBI2z3NWQmn32ARQyIK98TQj0/jUvgFC4d2Pv2F8U9+KtyQ2pvPEcjO
         cJSUHXPt9DGh18TNf2dCRnjF6NPPQlyT6roNUi4j5Z4ESsuhu6pkShmxViNVQ5Pw9gcb
         QUIB2f+KPi/V+mq1t/xyVjJk/B4s5yWd29Ehqzdp912Rnxe0m05C0YoEMA6ACFWnSqL3
         s1DA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZVDdO+AJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf33b25asi902482085a.427.2024.05.21.03.35.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2024 03:35:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZVDdO+AJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s9MpX-0004KC-Qj; Tue, 21 May 2024 06:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s9MpW-0004IP-AL
 for qemu-devel@nongnu.org; Tue, 21 May 2024 06:34:50 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s9MpU-0003tX-N3
 for qemu-devel@nongnu.org; Tue, 21 May 2024 06:34:50 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so13839617a12.0
 for <qemu-devel@nongnu.org>; Tue, 21 May 2024 03:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716287687; x=1716892487; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AJ6PC3CGDbWHHX2Q5qYVzbZXiT+T2mYSTWQN96Hvymg=;
 b=ZVDdO+AJ06TfAQEL+eudAEdLc3GoUxGfhvfE5jAJDKLBNNnPMmNaBeye7ULzyZc94F
 2liUat6DbF8Jq6yWKhu56knGY+a0jAmQgyD2Gm8tP11ZklzYloxYszaCgpX05UOEUU5v
 peI4DBcn3etbA9fn8MdjLVIib1p4zdBORBCcn6eryoCkkYxq/pPTybPAjTqdPdbv5Y7v
 8NSJodmLyAjK82zWcQhQFcO21YK9qOIa0xUzcrdpbQws5AeTfwhlt1PHRO23EL1sk6uE
 Xl0LCRaXQT40rlH+WaHn22kq6Hx6FNKgEXC1UUTWBU+9fhRU/rb9Op21B5lqEVEkgXcq
 RcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716287687; x=1716892487;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AJ6PC3CGDbWHHX2Q5qYVzbZXiT+T2mYSTWQN96Hvymg=;
 b=WE6uwAy0WYGpEel/kU1FagUeS9ubrNnyMWdWlIOztzjrmY4m7h2MDXmUfnlRQ3UCcW
 dlDYkJXtqluo270/lH/V6wJ2q7bcZvvR8a48Cpc2mksPrCSCRxhqwBku/JhoN81+ZAoX
 p8XF8qle0QoRCliLFox+uwJE4mIB1X8qXyy67L4eKh0Xi00PQ7SLZKhUW99zjTjf+QpE
 AENuWmThLkCTfb2mqDpkv8agTZzmMhpBZTyrFit/c8N/BJ5c1Gn3sjrhWSN4L+MiaKn/
 20tMPqHmsbsiYXojeYl5hsVlpPeOD06m7AichHvf66PryGNql9wwRbRbQIM1vdgH3sJd
 b+xg==
X-Gm-Message-State: AOJu0YxwA5Izv7chPP2f+QD7QspNV6n1Z4kVhslxrXVD4w/jEAMKAKVo
 UGEJKh/DuQflL139t4yJvX+2C8UPRl7sy/r2uOTbHyRQyMR8B6YZKv74CcCjpbaJKyUEtT3HYBS
 nNbpkhJOtMNA2yChb1Ikf8GlaAt497F6s7Sv+/sjz5fyEz7ce
X-Received: by 2002:a50:8a91:0:b0:571:bf62:81ce with SMTP id
 4fb4d7f45d1cf-5752b47fe5fmr6782606a12.9.1716287687108; Tue, 21 May 2024
 03:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-2-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 May 2024 11:34:35 +0100
Message-ID: <CAFEAcA-OVn1x8mThr6L8D0ShdkofhWxRWfCFNytKhnChncTLmQ@mail.gmail.com>
Subject: Re: [PATCH 01/57] target/arm: Split out gengvec.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lxcwuNJeuhoE

On Mon, 6 May 2024 at 02:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
