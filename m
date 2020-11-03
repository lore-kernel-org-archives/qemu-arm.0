Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5146576lfa;
        Tue, 3 Nov 2020 13:23:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmEDXLVWcC/nWym5jJOqk0UO7dAv4FLyhv96ANhlQ73q2/4rEbfloDP+1x58+os9Z9rxSB
X-Received: by 2002:a25:76cb:: with SMTP id r194mr13456170ybc.320.1604438621642;
        Tue, 03 Nov 2020 13:23:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604438621; cv=none;
        d=google.com; s=arc-20160816;
        b=c+S+hO9fplDiVJPQHqpbBXZdaIrj4xNF9g7QMsXb5kq3VS7voj8LQK3rF3ks2MOtj6
         4hbPRxrXgO++Z5GExx9TzkKdIPPs0xyHju7agzu0n6W3OYfDp/+G02/L2G3npC00ybj9
         ytPCGF3fS5Q+Q9NkyTbqvt5/fljlCzAKGsKlO9pREE3u2I8H9Z3KssUHbsAPpQJ5Hcyb
         8CFZ3RLx8IWlK77yXbD5wtZPZ9SbnbTV7qGfakzf7Kti6YEFdaH4QM0jD3SDu/MbJxuK
         x2ceLXjAX5dG6i7b3zL5qTkgiziFeu5ytKEq7DC9oRJSy5m79pIO1LzrjZRJ+u6GGv5a
         3a9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ka8Xf5tuG9vgtHyQpuwVYXHEQ5Lz4ACYUCnB4dnXRtM=;
        b=pVuh51xsgqJ/He1kU0iDFWhCprZDA0D2guDjjP+KmwTnoKPxG1iTGoYmW8zKWDnU6G
         xnUz1Xch97RLX0YkiR4iT4Ily12at0dZWHpZurY1ZUMJgobnI1Y3VzXxYuoYZjMUFeFT
         MQ9ONTAgxZh1EUfB++NWs67WsxqbqtHYr3SXVIBEx6+NKvBh4XqAhLuwrq0c/DRH2gvk
         rG6Dkfm06Y0hvTsuEuLSfEpHjJujQGCzpNRZUXtYhI5+Ugdp+448Q7ZSwAuSKPDMeTOp
         wQPhlZdBv8UhjSisrCgJkrxzlq7DxS+Ub1PKa+XcDOigGlF4E3riN2RgqIqR620eVEtk
         H2jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ESRvoTKO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si125314ybr.415.2020.11.03.13.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 13:23:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ESRvoTKO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ka3mH-00062B-2M
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 16:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ka3lx-0005sf-81
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 16:23:21 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:45537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ka3lv-0006Md-Ce
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 16:23:20 -0500
Received: by mail-ej1-x643.google.com with SMTP id dk16so25910817ejb.12
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 13:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ka8Xf5tuG9vgtHyQpuwVYXHEQ5Lz4ACYUCnB4dnXRtM=;
 b=ESRvoTKO1RCFbfPpxdFV7pE791TOOMizwzEAmYDZxsC730XWTWJlsYBboWu/Tp0pb2
 0IkJf1mlQV/TbI+uJH0FvChiVwLpySyFz5OqVvbLKsz+RT39aIZDrxy51NKIFwcT4j7J
 q64oGJh5n3iGPzzlylDk7UHk0e7An1spdqHiNKsdqFylns9/AscYsrxOsVVeGpu6gY2P
 5Y7gfWFK+976sS3zq23N2UgTzZgbbohayK/Y4fMQTT3Vbbt7xszqmbA9gg+LcGB7ZgmD
 acDespIoxm07u8JVpEvfcHky+BxWaUtsZv+3vfNL8nOk97phTEZUy7J/BJCKgv5g4p10
 KDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ka8Xf5tuG9vgtHyQpuwVYXHEQ5Lz4ACYUCnB4dnXRtM=;
 b=XFS2NdHwViR9i+Vudz8a2CpvwHaGgDo1Vr8vFbtDG07cQTiJ8+Chn0abro+pA6I6yQ
 nyDQSFyQ6hD7KDzKsDwNpZnqVh6XG+Bo7eZeoQhZuXijDUC8x7bz6banZxhXeWwJ0imm
 duHisZa/Z+ufwf7mrA1hsbGFY0JP8hKbIO7bzVF4+BjBTaX4QRNb1crwIp7kwHYcM7Eq
 lvaY8w60XVgETawRdkUQjwnIb+ts+TvAbS8J3I4Rj2HZJayiF8v6TVe1DjXvwDqTkEJ6
 iVvjGodciYgJJfiD40Po5W/H5h+1FIEziG2YdK8NhweJB5CHXIOr2vTfMF88pTejXliy
 fIkw==
X-Gm-Message-State: AOAM530vZg7tH8ZokNocKwngUBBY/YdesboSg+ZwxGHblppGtiVsr326
 89kYXFgfPOV/tG0hzcLcRJ5k0iYj2uoDseOVmi2nuw==
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr21235315ejb.85.1604438597225; 
 Tue, 03 Nov 2020 13:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20201103114918.11807-1-peter.maydell@linaro.org>
 <6eefc3e5-2b95-1f0b-7b02-ef321cbce0f5@amsat.org>
In-Reply-To: <6eefc3e5-2b95-1f0b-7b02-ef321cbce0f5@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Nov 2020 21:23:06 +0000
Message-ID: <CAFEAcA9W+NW1VpNyR+M3YpV_iWTrgovYV=guNN61d+4WcPP+8A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/nseries: Check return value from
 load_image_targphys()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wJu6uuk3t31m

On Tue, 3 Nov 2020 at 21:00, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 11/3/20 12:49 PM, Peter Maydell wrote:
> > The nseries machines have a codepath that allows them to load a
> > secondary bootloader.  This code wasn't checking that the
> > load_image_targphys() succeeded.  Check the return value and report
> > the error to the user.
> >
> > While we're in the vicinity, fix the comment style of the
> > comment documenting what this image load is doing.
> >
> > Fixes: Coverity CID 1192904
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> What about the other cases?
>
> $ git grep -E ^\\s+load_image_targphys
> hw/alpha/dp264.c:163:            load_image_targphys(initrd_filename,
> initrd_base,
> hw/hppa/machine.c:301:            load_image_targphys(initrd_filename,
> initrd_base, initrd_size);
> hw/m68k/q800.c:388:            load_image_targphys(initrd_filename,
> initrd_base,

They could be fixed too, certainly; I only care about the ones
Coverity is currently complaining about, though :-)

-- PMM
