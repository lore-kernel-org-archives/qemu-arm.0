Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1452535lfc;
        Tue, 3 Dec 2019 04:43:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqxG++H+VQpqBwgYPI9T4FF6nkSpSmL8BKDRLOKpBbcGAZQqVEu4CdF3J+gofwic0Ze8A5nH
X-Received: by 2002:a05:6402:2051:: with SMTP id bc17mr3030885edb.28.1575377035229;
        Tue, 03 Dec 2019 04:43:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575377035; cv=none;
        d=google.com; s=arc-20160816;
        b=J6bmMQssP+VgYe0FjKlj8VCb11JjYE/aJ30Am0zYKNdkCh5Jy4hgymzrbncgYBJfbh
         EyK+WlkgoSp7FXxsVX9UUNs5qapbgpS5g8Rsx/HRP/u3UVzB4Bl3NCRlJpeJGRuDpm+X
         chZL3eNhOnGfZLVA6eqxuIgrJIVUryLi9iwBzp/VgJ2I8dQyH91gdeXKaD7pWZEvRVFm
         ayq4YG7AxM8bhAoIjYA1IJnSjCR4yK0moreFmLof+tld5JNu9rwBV/9d+bLiNBdqv8zC
         i0CD0pjrbes2eKRBYkSO1CK17yKLs8Vya1CPEndnYcqKkD9WykGmB+JfljJXc5uyrj0P
         RXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4Ers7w9eC9tFu3//E3iYq14QUmK3g6bRYSZTOSxXBQ=;
        b=I8w7VOyCIlM1tyKpo2X4/UeMSLI4yQFGPv7LC5I47uKUnqeT6/8lqh1bB5f1sY1FKw
         maNHaELcANvIvzDYWwJCXvL/ywSAMDzRcpbi4rmX4qvtDq8LX8lMbNxQr0oPZGWx29S8
         op3WV44L46nwuZh+Pn9sdZdADt8pU/Bas46thevGdFW86vzpBAL4hKUZNdyM8psuoDV/
         VtLkhcVhLHolzX6YCNme2sqrisgzC7cTCzcweFWnQ8jnEM3lSyTnn6j3e79G3USt8iP6
         1k5RVIYY4D26gP5mOtMzgT9AqmZUNINUbGQ7TBUpcti8I/deNqGA1zo7eqyImgagjnoD
         wuvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=chSW3jeQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si1862036edp.329.2019.12.03.04.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 04:43:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=chSW3jeQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic7X0-00008H-8T
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 07:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ic7OA-0003QW-Of
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:34:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ic7O9-0005e4-HR
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:34:46 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39374)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ic7O8-0005OA-9T
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:34:45 -0500
Received: by mail-ot1-x344.google.com with SMTP id 77so2720476oty.6
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2019 04:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y4Ers7w9eC9tFu3//E3iYq14QUmK3g6bRYSZTOSxXBQ=;
 b=chSW3jeQ3yDjE9qOy+ox4lKN+4lJ9OBSxncisgX8xoaJ4nitsHCBY4f/llanEK2GOu
 eCHPJqeSvqXBE7oPaimtA+3V1CjIP5nL/1931W6gb34Hkw80zDE8TAyqQDGlvvFtszNj
 rVU3CLlVmK0XZRbccA/UmQElzTZk57ADj3urQ5g98oOE9uL08XymdWNW4Zzz8BK/kfJn
 2ETC9R7Wo+Obb+GQMBOjQnzsux8a/gq33BDL8aY2HJ8XiSdmYKEdts/3djXTOTTTVHUF
 Fqt3Xqw9jLZZDIMjf9+T2GCvYTv809ySPvJDNx1rq91CzuoeeeqBiE0SXojf2j8aHPGL
 Lf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y4Ers7w9eC9tFu3//E3iYq14QUmK3g6bRYSZTOSxXBQ=;
 b=BAxV5qAWzCjuJftSMJaxrPjS7rvvVfwDKBo8SC0bXLQ93K1W+nbUFHbKNhARXjEJ3s
 ameluUqTy7p0G2f9NkfXznvJcyIzLfA9ZTMnPl62z3aC/lcMrbR4pbz6NDbfm+bgAMBY
 rTEXAWEHSnC+lXO+o2vHe0viB84pxOlHhYNldIfUpBEHVaDrD7uPVLe+V3ih49Hf4w7m
 2vg07iM5SLRx864uuWz47erWpd7PHLnTNs3+aPOYiChogIEpI6pH6jSmgk0boogM+jnS
 GSwSPhXr7iqxGvV/F3VFOvLz2Xic/k85ylkngSh/VQ+URgv1Eu2F8NLbhGzFKsP/QXT7
 8AiA==
X-Gm-Message-State: APjAAAXWU79UddQf6FNzza4K78sIUVaUBXpaBNzBsZnV4Fn8diaEJHXs
 UlV9UjIfSItgXjLyU3MFbz7r4uBDL2/QloMsSXv+iw==
X-Received: by 2002:a9d:6357:: with SMTP id y23mr2932410otk.91.1575376481627; 
 Tue, 03 Dec 2019 04:34:41 -0800 (PST)
MIME-Version: 1.0
References: <20191203122753.19792-1-zhengxiang9@huawei.com>
 <20191203122753.19792-2-zhengxiang9@huawei.com>
In-Reply-To: <20191203122753.19792-2-zhengxiang9@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2019 12:34:30 +0000
Message-ID: <CAFEAcA_TbC2haopmmbLChuE1bxA2KV74fximNu5kQ1pQB9VmYA@mail.gmail.com>
Subject: Re: [PATCH 1/5] tests: fw_cfg: Rename pc_fw_cfg_* to fw_cfg_*
To: Xiang Zheng <zhengxiang9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dypXgQyGPvcY

On Tue, 3 Dec 2019 at 12:29, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> Rename pc_fw_cfg_* to fw_cfg_* to make them common for other
> architectures so that we can run fw_cfg tests on aarch64.
>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>

> -static inline QFWCFG *pc_fw_cfg_init(QTestState *qts)
> +static inline QFWCFG *fw_cfg_init(QTestState *qts)
>  {
> -    return io_fw_cfg_init(qts, 0x510);
> +    const char *arch = qtest_get_arch();
> +
> +    if (!strcmp(arch, "aarch64")) {
> +        return mm_fw_cfg_init(qts, 0x09020000);
> +    } else {
> +        return io_fw_cfg_init(qts, 0x510);
> +    }

Presence and address of the fw_cfg device depends
on the machine type, not the architecture, so is
it possible to write this so that it varies by
machine type, rather than by guest arch ?
There should also presumably be a fallback path
for "fw_cfg not present here", I suppose.

thanks
-- PMM
