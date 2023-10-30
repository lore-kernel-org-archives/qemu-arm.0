Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1748453ejc;
        Mon, 30 Oct 2023 02:58:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvchMzKz9SXgL/fnWJ2cVDaJVB4DGzL4k3ifTj5jJPHG8G+Di6ZCjfCjFfVfuCW4c1Wzll
X-Received: by 2002:a05:622a:18a:b0:41c:c5bd:712 with SMTP id s10-20020a05622a018a00b0041cc5bd0712mr12519586qtw.62.1698659901680;
        Mon, 30 Oct 2023 02:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698659901; cv=none;
        d=google.com; s=arc-20160816;
        b=XKOscw2z8gitozX/EtIhSe8QIBBFfC43ltHbtBZy5KWsSpSNURLenLCz3PC6/hTrh1
         baficftcIcijOWO3NVNTi8Abx9P4HXQUjaL2+o2HgmsTVGclXVgV0WhQRjAmAhzLmauE
         ExmYTuI/Z9k3N8kYrJzXDoDglfrgs3K66Idw9P2KMn9PnvIEZyv0xn5FcBzejcl85bVl
         UlILX+yDjEQkZyDK2KYQLlrp8ymfxp9ItaLAcW3YStnuslT6PAkqi4H9tbCYLpFSZpD5
         bEg81ssH7Lx1pqSStNUAG5CO4Wv6FUE3tdHlPHtiS3C69oZCB2hR56rL+PirNdPd2LPr
         Eq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kjiqMpBbuo18cY+BKm3RZowLigXwjatDzWQIVgU/F3E=;
        fh=+A2vLxaMOeUbnawOALRLh/tFHQQ9pKWls59Bm8F5bM8=;
        b=dhA3Z7SYA6Oi+PzHLAzM1DqW9qfeLZatzhsDNj4FrJsbycm318PBA2lJ9LCJpYVJt3
         9jnDMt30WBTRheaioRPvqF8ACSI0Rf2a5cxE+kH9Y9Zru9SRrlxpdDqpGO9bKuJWqkNT
         vYs041gAEKZwCKzZbqUQ95+J4uZYVPgBvhPuupHGrITwmhM+H0lVLzq0+QmCQN1TuJ4T
         3YTbQB+ekfRYDh4yUc94I76eGGm65JiDU8spMcyAycTPBDQ4HK5mfxkkE3DStpseda8Z
         8S3pS08QvgfZCwc/GEP3zkdj/aShXgqueI8w2OKIgwovKYiVfSkh8+jH6sd5aFBbYUM2
         pW+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dindWcga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20-20020ac84e94000000b0041cc5e9877dsi5441363qtp.746.2023.10.30.02.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 02:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dindWcga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxP2D-0003uM-0k; Mon, 30 Oct 2023 05:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxP2B-0003tz-Jw
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 05:58:11 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxP29-0001gg-SW
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 05:58:11 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53dfc28a2afso6770921a12.1
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698659887; x=1699264687; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kjiqMpBbuo18cY+BKm3RZowLigXwjatDzWQIVgU/F3E=;
 b=dindWcgawCUPE9i/8masgHsNZhi5PhtDDt9vfkfZfHhRDPEERx6l81H1c9owWJaI2v
 /+nwWL8YucnObKcFb6LDOt1Ulzs+xmHJWOac9THZRm3yg8qxvtSUixCtHmHw9UyyrOCZ
 rp06J84T4kYNVIpcW4VNSIF9/zreQLlQaOeTpIwE7U3ZNU1qMnrkFjz/IqIlrG3sY0ye
 F0JCd3e24aSGxR4PZMgRpfgYNg+azMG099dNTLtxsrb59N1xG1EoYkOZs1WOX8cO0A/a
 clvqLz1uM8iWQ4QoyxpVZlDoPX6kqdYvZATzktaYwqHDfoVtNJxbnQ7j3EW5A3RC0dWT
 mD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698659887; x=1699264687;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kjiqMpBbuo18cY+BKm3RZowLigXwjatDzWQIVgU/F3E=;
 b=bSVGlQW5eOic8c3LlsmgmxjxlJV79c7NJpOamBUT5/tQ6ztbRz2dzNk7CT+vVzL2Nh
 Ig80v14JcsS3e/THzCiUV3KOfCSzpsp/BgMa2dxJVqmTjAH1IfFxhAMmzUJw5Kl5tUPb
 i1p0QDa1pEmSV5gXfoWXhqKn/wGBNssFbLjPZ6oGGNwCFUW1bW2qASQL0XzqYf5ccMA8
 F+dF8n/lpvRHrEQ41sY5/5lVtGC/MZUhczi0ZjfOD1ZVPWidZfmYoYik/EFEJvvD6UgT
 26lqfY9Em2cryKmwqG2Ch8p47yNxZI6JpBc0+ei/CnVxa3Cncc6rEKinjDmqUIyHTBxR
 ABfQ==
X-Gm-Message-State: AOJu0YwOM3gDarfBy+EhdgaJ8TYwM+Vb/o9rhnPljc84XX7d/Z3W3pk6
 7CeXDqtk/TkYPxGqI4WidvfNG0dEo5Onw8oq/j14pg==
X-Received: by 2002:a05:6402:70b:b0:53d:f072:7b0a with SMTP id
 w11-20020a056402070b00b0053df0727b0amr6863423edx.39.1698659887328; Mon, 30
 Oct 2023 02:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231017193217.1512868-1-tong.ho@amd.com>
 <20231017193217.1512868-4-tong.ho@amd.com>
 <CAFEAcA_yCEtDkW6R43LGNjWGH323HuSWPFibgaRSZ=+DqfrZ_g@mail.gmail.com>
 <BL0PR12MB48827D764A414B476C261C45E6A1A@BL0PR12MB4882.namprd12.prod.outlook.com>
In-Reply-To: <BL0PR12MB48827D764A414B476C261C45E6A1A@BL0PR12MB4882.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Oct 2023 09:57:56 +0000
Message-ID: <CAFEAcA9P2en-D4jam1VXMu_8E-w-OiKDPGvBRZHAb_buNBo5bw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] tests/qtest: Introduce tests for AMD/Xilinx Versal
 TRNG device
To: "Ho, Tong" <tong.ho@amd.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "alistair@alistair23.me" <alistair@alistair23.me>, 
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>, 
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>, 
 "frasse.iglesias@gmail.com" <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: 6Uil5edJNSop

On Mon, 30 Oct 2023 at 06:25, Ho, Tong <tong.ho@amd.com> wrote:
>
> Hi Peter,
>
> This is in regard to your comment on the use of g_usleep() in waiting for
> an event-bit update from the device under test.
>
> The TRNG device model presented in patch #1 does not have any asynchronous behavior.
>
> So, do you mean that, although the qtest process and the qemu-system-* process
> are running as 2 separate processes, qtest infrastructure already has the necessary
> mechanism to ensure that:
>
> 1. After qtest test sets a register that has the correct deterministic behavior to update an event bit,
>
> 2. The same qtest test subsequently issuing a register read will be guaranteed to observe the updated bit?

Yes. With a qtest test, there is no guest CPU inside QEMU. Instead
when the test says "write a register" there's a protocol between
the QEMU-under-test and the test process that says "write this
value to this address". Time within the simulation only advances
if the test specifically asks for it.

So if your device under test has the usual property of "we just
immediately update the state on register write" you're guarenteed
to see things on a subsequent read. If you are attempting a more
exact simulation and do things like "when this register is written
we set up a QEMU timer so that we only report the device ready
after a certain time" then your test needs to manually advance
the simulation clock with clock_step() to the point when the
device would report ready. (Usually we don't care about that
level of simulation accuracy, so clock_step() is used largely
in tests of timer devices.) Either way, this is unrelated to
wall-clock time.

thanks
-- PMM
