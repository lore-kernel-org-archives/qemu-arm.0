Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp252690lfg;
        Fri, 5 Mar 2021 03:26:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw47WM97I295491tztsLyYlPTBVMNU49je/hd/GPxHfXwq8fRKhjhJl+IHOi+W9k33Pgn1Y
X-Received: by 2002:a9d:19a3:: with SMTP id k32mr7527349otk.189.1614943611471;
        Fri, 05 Mar 2021 03:26:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614943611; cv=none;
        d=google.com; s=arc-20160816;
        b=Ivr2G7WYuF/Yq8lm0VWkRs4aVNcUxGYs/JCVLxeLjEIMI1gmt06ZUM85kTYA2Q2lvV
         ch3UHXIkefLMbpFIPK6rZ1Cvjyvm11GJyHIlgWAIJGJGL3jlZDc1+0bliSn623LzMmb5
         MFmoR1lqjeZBTEXfRwPEHK+VogUfl9rk6MxtwlFSP5/HGT1E1A45antkDSZIbwCcOQVR
         uPDWqsDMcS1oOeMX1G2qxrKULoOSRN/8FUTfXFATR9HDnXZfUkzvCni+Iqlmy0csLj21
         Whuj2bSfOlRK1VH6MwRJyfszW9rFnrjWy8/ylcWMuLmyGnOcituh9TruauZCuMEXF81o
         nNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=WUjXvSUF/znig9w8SEUZ4Zlrm5t3ShQE7zZ8M/JJwRQ=;
        b=IJgvwu8nr0aEnv1TmdnlFbBsZU8cFyU14NBFy6U9oDRkdfg/U4UwgGs9fb/B1LpDSO
         5IEHr9OWoMW5a08h5aXefkie7CxppaJNR/pWYxqOL6v2zbZBK3g7BqPi4pJ8ibmnhr19
         +ImXDK7qiuiXJP+/y0pPIsYtoDFLPXHb2thWVnk6RsComOPlKKq43us/I9SBDD1RPewr
         NkzyinE80eArf4AeKrvNH60uDjaZSqGHtb2ekqeVqasiSig7KD5spc0Aquv5Ux8+Gnwb
         zfg1sc2fNUQ9SZXgqv4bY3rJmz4SLY95C14FvgArSfO7Ycgd/U2Vlf07Rd3+gcpjLgK4
         ivuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FPGYH+xw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11si2504121otf.221.2021.03.05.03.26.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 03:26:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FPGYH+xw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lI8ba-0006ej-OU
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 06:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8ah-0006dK-HO
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:25:55 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8ag-0006Nb-40
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:25:55 -0500
Received: by mail-ed1-x52d.google.com with SMTP id m9so2079000edd.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 03:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WUjXvSUF/znig9w8SEUZ4Zlrm5t3ShQE7zZ8M/JJwRQ=;
 b=FPGYH+xwTyinYIYHLkR8e6ezZ9IaCx2i6OvW49/cJSYpfN+VR+ZBCdcY87vA2VDDvm
 PS32W4pOQo2DicNTO7YPeLWUVlb7r1j/Sna3k6oCZ6Lu8JQxnmgN/53Nse+EAvT4hFNe
 nsMg/BcKKTEA4/usCIVB1thkBlIqKexvnEjDii3OQkQurSszy6SJrRmMQeawKjHZFfu/
 2Z4v5dUclomz1jsCZLHHb2CmULw6oNdjlfi6TaLKOSXapWE3eNQXJkGYTXWvHrYax0pk
 WYIiQAyvcTbFD6f0DHrj7lqw4NsLR5RnvJW8KGOdkxIw7Wd90bE5WtPhRsmfYQT537oI
 yxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WUjXvSUF/znig9w8SEUZ4Zlrm5t3ShQE7zZ8M/JJwRQ=;
 b=sfLAlL/yywcZp64py48QOsfwBSPqe3hJsJNcvMWw3qYha8F12Oy5dtO60PMW+WbUkW
 FSBl7BVOEm7LbaavQt4e9ASxvc7EXkGHEi1gveTejm6wy1/mPFytTKiUruGH0trVmxkT
 beGTe92GO6NmwQ3JyhQBKKHIgO3FjBoQ/lbB18Je+rdMzkB5+/YVSeuZMsIsSjUvSsLV
 5SPKMNTNUk3V/N5jf3j+0t6GJwvwcEctv522YHFMTx/rN2tZvJ/4cwNXTuufP7s2pG/2
 JJ+fZQhGb3Lf9ZNPoHGkn73u5YZ0imXMeqVl5jz/VhGd3KDQ64/KqNmOrk5KTePwY2qq
 89qw==
X-Gm-Message-State: AOAM532r7qw6wtsJZeBPOHbnoQwWvE8NZb+raCB/ZoBT+sHAJdCpp24C
 Auvr9BrAsiWeznyX4TJIbS1UZeWFiUEuRDpBa+DW8g==
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr8487445edu.100.1614943552697; 
 Fri, 05 Mar 2021 03:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20210219144350.1979905-1-f4bug@amsat.org>
In-Reply-To: <20210219144350.1979905-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:25:37 +0000
Message-ID: <CAFEAcA97DRcw_2ARFmuMbhkcYO_Jin+_=Vsizk+6Sy8jtZoxCA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/xlnx-zynqmp: Remove obsolete 'has_rpu' property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5K99BmTzr38N

On Fri, 19 Feb 2021 at 14:43, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We hint the 'has_rpu' property is no longer required since commit
> 6908ec448b4 ("xlnx-zynqmp: Properly support the smp command line
> option") which was released in QEMU v2.11.0.
>
> Beside, this device is marked 'user_creatable =3D false', so the
> only thing that could be setting the property is the board code
> that creates the device.
>
> Since the property is not user-facing, we can remove it without
> going through the deprecation process.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2: Reworded per Peter suggestion



Applied to target-arm.next, thanks.

-- PMM
