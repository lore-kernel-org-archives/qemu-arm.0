Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF35CA5FA5
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 14:28:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBCL5-0001xr-8e; Mon, 28 Sep 2026 10:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xBCKk-0001wH-6m
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 10:27:59 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xBCKi-0005m4-46
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 10:27:57 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49fe8bf173aso16384185e9.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 07:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790605674; x=1791210474; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=QLnMYjWC1u10mfgCAHCtME2LwGdqsSld+xN5u2fCvr8=;
 b=dxTgajszdL3zHpxev+X6paVi/Gp3r6voM1tWoZQ/+zKMAkinV3LS4qrpFcjo7XbHs+
 2NgG/VIuSWbSIamsgeqiHF1neoHs7x3JeenZbMyVhIQvUKxqgoDZYaymFwY7NB16NX45
 OJBDWSoFgIV5xrotdvk5/8VFKf4ykcAVlTmfEcGqA/57aNXItRmV48qUY+Lz1q9NT9Bn
 2QVk/48FfhKAyho5L3Bw0lGLzbJiXwe8tXaBo44eAXL5vCjwROYjIp7zCQcXh/oQUjng
 YORfmSAda2kvn+K7vkkehu+fnBfaC7ppuOBNhRB9vg31vrHSvcBu6t3FKbTp64c5sUfr
 0Y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790605674; x=1791210474;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QLnMYjWC1u10mfgCAHCtME2LwGdqsSld+xN5u2fCvr8=;
 b=V2UMCoP2aXaPUciArYxjeH+6bHcalz2KUwaG+Lzuf3DMXasF8zh8GjBbeAHY5P2QGs
 to5+UGJiaAEFePCmtROTruH8SlZURlzEAW5e7CGBSSO+qJDvPFIbVG/5vy6fb1jK3CbN
 Hr8bJ3gfD9vNeCDXiR1vbiOrEjadaHp34y35CvqeYrt4hfLQjDjIyqOGN8le3IsYGeBr
 wgrWBJK0qjMjy2RfTLD0PFGaUsH6uZ02Zq5ITn2Rxv9M+LTgFG/YZKNs7hODly54YHdi
 bWpApQwaFyOWbB8uQ4NqPlHhXji61lHJUUPAQKAxNn/BHlaMqm+E5NukLHemGtyJj2/E
 Q9zQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxaaQsmSZg+Z7ibHwmULOafXqDkVVfN8BPGX09NOuP/cC/DOgZFdzmyZEMQFiZ1J2DilkIUXmhAvw==@nongnu.org
X-Gm-Message-State: AFuF++k0Eg1GztH3w37WzdQrWC3teO3ZbAEAQDunFoEd+pyS9YQIfrrV
 ese3WtLn4bd+p9w7URgKSWo+6w7f1FxL9Oy3bG+ZhIGI1RNpK49keAbf0CJgV16Qkcg=
X-Gm-Gg: AYBFou2SNbngSFwc56lrRyJ1kE18uJaiHLHh+/zj8YUhyfC4OSUTO/dY0oMO6ZUU7tT
 R9/njMUsxKNwtktysPk3vi5+RFB1LDHcHYXaWlWBAaLEgdB9VZ9mwwTfzuKKabP7erYR/j3342W
 8RXzXAw9/gdqW06O0e/azf8ybro0tGhdNDKCLiemZcDx58TxRSMl4umRm4gU7Zl7+8HPaEnZFvm
 IaPdyG0c5dm5yVOSt91ZkerXli5iD63RglWKWA85jsHUOMEfrEjYfwiaW9uoss0h7pOnR5b8305
 lOAy6kW+VPf+YlE4jzG5dSS4Q3qcFuw2z3nbwl+jwMBkypA7BgB6LLLnZK0BG2mwSz9bOsPNP6u
 4+O9wMSjvY5iSk+o3efh8JlDLIJ6rtHjcc80FgpJm0GKt1q2nD3ZVpioZUTUT3lkrl9HibpVvPd
 wJTf/nxIV6Gd9Tcy/PjTc0kYZnzoLBYrxPZracH0NYWTzeGsFycfApdd09ts3WAqwZVgrl2w==
X-Received: by 2002:a05:600c:138f:b0:49f:cbf3:551c with SMTP id
 5b1f17b1804b1-49fe66cc5camr221553275e9.12.1790605673588; 
 Mon, 28 Sep 2026 07:27:53 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0018e6dcbsm143688625e9.6.2026.09.28.07.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 07:27:52 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 851055F8C1;
 Mon, 28 Sep 2026 15:27:51 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] target/arm: fix user-mode emulation of
 ID_AA64MMFR0_EL1
In-Reply-To: <CAFEAcA8DLweguCk7-9prMKraPcYRC_Sf5WD_07Ke9cLi4R9-Zw@mail.gmail.com>
 (Peter Maydell's message of "Mon, 28 Sep 2026 15:02:43 +0100")
References: <20260921142910.1462880-1-alex.bennee@linaro.org>
 <CAFEAcA8DLweguCk7-9prMKraPcYRC_Sf5WD_07Ke9cLi4R9-Zw@mail.gmail.com>
User-Agent: mu4e 1.14.4-pre4; emacs 30.1
Date: Mon, 28 Sep 2026 15:27:51 +0100
Message-ID: <87mrt1a1so.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 21 Sept 2026 at 15:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> Since kernel commit b130a8f70cbbf9 (KVM: arm64: Check advertised
>> Stage-2 page size capability) the relevant Stage 2 have been pegged at
>> 1 f(4KB granule not supported at stage 2) by the kernel. As a result
>> the behaviour of the test differs when run on real HW compared to
>> under emulation:
>>
>>   id_aa64mmfr0_el1    : 0x00000111ff000000
>>     !!extra bits!!    : 0x0000011100000000
>>
>> Update the test with a new helper to explicitly test for fixed bits
>> and update v8_user_idregs to match real systems.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4566
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Why is this only an RFC? What would you like comments on? :-)

skill issue (or possibly my shell history). If your happy to take it
please do ;-)

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

