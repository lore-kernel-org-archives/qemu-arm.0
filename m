Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2358842ejb;
        Mon, 20 Nov 2023 09:41:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyPZw3IBinIHBay+tpypu7PnDjgJwSdhWFs/Z8qrbbThAH/SpEYf9Ww+QTWlCpd4sXNHUG
X-Received: by 2002:a1f:c506:0:b0:4ac:5d9:e655 with SMTP id v6-20020a1fc506000000b004ac05d9e655mr3782182vkf.0.1700502066127;
        Mon, 20 Nov 2023 09:41:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700502066; cv=none;
        d=google.com; s=arc-20160816;
        b=yBlCZVLuW4d8ygvDOlYlcEFAZIbkc66vYzZqQH+l7XdW6H5S3s4hI8gfAsIQP/8LRD
         cQvt+mU52IA9+tfyQwlqrMoasaij+3TpqCrR18/+Th8BCVxTyFib5FnpkgjgdeIbmfFu
         1XKslqa8j63Dr03tC/kAHzuaflpGqCvLz66KCgOKY2S8vcAedjc8U5RljynxU4Ahz7NK
         9avXlI39E9K8jZObyD85AWKIqlSJ52TL/kRZbKi0va9W4X7t5Qzg84hxwR9FCwLYFpla
         ZQkrOtGqn5GJA0igNBW316mMEvt397U99wDQ6NfCmt389F44+7BSiG4vnSKUp60kgD1y
         uH/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zniXinmm5mT1NKcggD6m6tjOWoFpPePq+zVwIUa5EfM=;
        fh=eky7efgQyYzMG2FWmKjO1+L94YWR2hJR1GXjIr28iRA=;
        b=xP9OhcNlO5Tqq8kjYDnURiKT3gOpchgnSLWNUxxcZr62cYhB83neYe+FtILidSXgP3
         cQcsQS2CBLvVkdZjjpcfZA5eHaoiJALV8Z7YkOGqwjaxYhp61uDXQdR0bQX7S5UHPE+z
         WXH59eN6VKWHrl3XBbj8MCT2pJwtkKsH+TfnASjEPdy8YfsiCvjm/BGRjGwuPji0Yf6K
         aKme4/ZoFC+j6zVuhmDgWKmOwIamtM2cuCXxTZfhudYwRJmIoTxKnun+p0yS9Cna9orV
         yi43NzpsRoVOe9ybzCnL7TAgRyEBtACbXgT/CoYiDKcBQSqPVqmDWt4c85P7zZtnSiY0
         LAug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EC/ebZ9i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7-20020a056122130700b0049d704f3d8fsi1902386vkp.308.2023.11.20.09.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 09:41:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EC/ebZ9i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r58GD-0000B8-8N; Mon, 20 Nov 2023 12:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r58GB-0000AO-5c
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 12:40:35 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r58G4-0005Ll-U2
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 12:40:34 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5488bf9e193so2654751a12.2
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700502027; x=1701106827; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zniXinmm5mT1NKcggD6m6tjOWoFpPePq+zVwIUa5EfM=;
 b=EC/ebZ9i2WgEm8SzRrgkrNZk0f+m2yM94ZCowpOT+i4J0kB+XaKQccY0qPTMGldp9o
 V3QxvQOfl4m5HbAsdjLtbtlywvNu5fLsehRtGxjq1dCnVhd/uQDIR4CmKIl0Bqcxrd6V
 T/iSRsb35nzYtushJM9qBtMBJ8u6pNp+eV+v7MeV5LWDOs/AQgXYDCl0lps9Y9rlUsRD
 PHLLflO519RRmSNqiCg9Ppm+IUhUidYwq/9sHM1KQJEwj/MmbVq1hvH30cca+XxRDczb
 X/BAgAky8OratFtk4BUeXRds70h8ZSqYp5XMNlFYUIJZquBpU2WaxCYcCe5XX4c5djZN
 3kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700502027; x=1701106827;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zniXinmm5mT1NKcggD6m6tjOWoFpPePq+zVwIUa5EfM=;
 b=PrRL7Y14NzTv3hjxydNTymQYU76RaEZ23Qk/lnJje/qVAcEo1/a0V5WZ5byyo0QDx9
 aytjIGCD28DmDrSOCKjvKCApVozeTDguKwWO7VX/KsToiDrqkAxrCsmRZD251B5fVNNN
 S3FoZquOSZ2bS5ERGnsK4Ma0ITg1W3hTsLhRThHwkaJk3tNgCv7C2jCmBYRtwXpZLNIP
 Q8la4Zq1TDlIdpnSUe9aJQy6TSxwCSaKkoOgaexG89fZvW4hEeDYUmWn86xOQOdWPJHn
 sxCefNdULJWnZeTuXNvfWTlJ4PQOmfKYLPXTiUWhg/KAL5S5flLMTtLpcPYbX1Vh9kTL
 GcsQ==
X-Gm-Message-State: AOJu0Yx48OZo6nX2a3aI3kodpJ2QmS4p6p/+GcxV9SVJ+7mkcjpuxOvh
 tPMX2Cd7IFTdaYb/7AcTU4gOvSvvh0m+RKeYVJTGEA==
X-Received: by 2002:aa7:d616:0:b0:543:5d2e:a9c3 with SMTP id
 c22-20020aa7d616000000b005435d2ea9c3mr87058edr.20.1700502026943; Mon, 20 Nov
 2023 09:40:26 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA_koyJSR_7kF6TByA_rm2nJQr-8UnXrtu3JqwgpqUEctw@mail.gmail.com>
 <20231109135439.1297135-1-leonid_komarianskyi@epam.com>
 <baafd137-58de-42e9-9f06-c7f7789d4b77@epam.com>
In-Reply-To: <baafd137-58de-42e9-9f06-c7f7789d4b77@epam.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Nov 2023 17:40:15 +0000
Message-ID: <CAFEAcA_auQOuPyZMbGd2G6ePn60nnPLtm5N+jRGz1bTvsg5Scg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Add overflow check for gt_recalc_timer
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dmytro Firsov <Dmytro_Firsov@epam.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: kX0SUAVjwmS+

On Thu, 9 Nov 2023 at 15:14, Leonid Komarianskyi
<Leonid_Komarianskyi@epam.com> wrote:
>
> Peter Maydell, thank you for your comments.
> I apologize for so late response - returned to this issue and now I will
> answer faster. I fixed the commit according to your recommendations,
> please take a look at the new version.
>
>  > There is also a comment or two from me in the bug report pointing
>  > out that the handling of wraparound is also wrong in the other
>  > half of this if(); we should look at that too.
>
> I read this topic and as I understand changing the other half of "if" is
> not related to the reported issue. Since it affects running virtualized
> setups on arm64 QEMU, e.g. Zephyr
> (https://github.com/zephyrproject-rtos/zephyr/blob/main//boards/arm64/xenvm/doc/index.rst)
> maybe is it worth merging at least this change?

I feel they're really pretty much the same thing -- when we
added support for the timer offset registers we didn't correctly
update the arithmetic that calculates when the next interrupt
line transition happens.

I've just posted my version of a patch that I think should
fix both halves of the if():

https://patchew.org/QEMU/20231120173506.3729884-1-peter.maydell@linaro.org/

Thanks for prodding me into looking at this issue again -- I had
somehow got the mistaken impression that it only happened in
some weird icount sleep=off situations.

thanks
-- PMM
