Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp614425lfb;
        Thu, 26 Aug 2021 06:30:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB8vWiuv/YrElm4U2mGNP4Kz0Eahn6TIwGUn6mjg0iM53DaWVLU9sGLLLdlC1FNgyQlnkS
X-Received: by 2002:a17:906:a382:: with SMTP id k2mr4314988ejz.454.1629984653731;
        Thu, 26 Aug 2021 06:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629984653; cv=none;
        d=google.com; s=arc-20160816;
        b=jCJLcuyT8QRIGQEAHDhixLQlJw3CTe4krvCkO32u4/7mU+GUso38maXALgEvHtW7R8
         3F/PNvb9bJWvpwmY9x7xlpBJk1xW3L98Z/1mIjo/tVETXClxc+gOk8iRHHfWgn4hNTfV
         J1UbWR/cszjsdGc0xhLJG8+uq62GdOWa1EKLl3+BMJwmHWY6WgFa7lvWKarXyKElYrc/
         EwfzjQVCVxDdBtbmgqSr/HwS1hFwfqJ2igROVk9hTmfrvdgVYj9yOwioCWba+lxIlm8N
         RLCEqUlZSBVAqgdCXqGoKy/Cw7xgElvhtan0fjR/APonfFgq17vcrvPx/dV22prdxiKm
         b6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zxGexwbco+d/07qE4oRx9+s3rxnu7r68q1Au53vT/4k=;
        b=vOzP0+ue9Nrb18URbFnkwlC6kbB0j4mddT9FU+CGRVRUm9Ta2mq7VIj9NS/Gwr/C/E
         rO/Dv2nJOLrTMlMgFSqlIJWDjdOgA7ShNCpdykBppXJvqJNyKiUGHPXQXYLd4u/uad+l
         Sn/RKKbvPBGeBKMg4QcufPv+T+OD67ROVIxz+hjIpKdotzQihlLYOnXvY0gA26dVuakm
         9sBrfyvXFKst5dAwNSDXVLxnhxvGtyBvulnuPsXnLU7cvt9bAdI0awfAlgWhWDv1Tye1
         BVncH4l4GvcwDSlUBL4+fX275IIpfpOnH8ykJKJwx2oeoqIvcR8h2I2YFeaGgKCf4cIJ
         9kLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qIPjyej5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si3661748eje.121.2021.08.26.06.30.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:30:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qIPjyej5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFT2-000713-O1
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFLk-0000QD-Os
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:23:20 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFLj-0000ZJ-0o
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:23:20 -0400
Received: by mail-ej1-x634.google.com with SMTP id mf2so6227140ejb.9
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zxGexwbco+d/07qE4oRx9+s3rxnu7r68q1Au53vT/4k=;
 b=qIPjyej5RrZyXMkf1KwZ0roefO5KtJU6JpVyh1T1OL4+ctn0T/3MG2jTmfOt4GkJpz
 +MEt4nGxYCwimkQoMU5saC/fnS4OTsW/J9meAJM2NUjhPd5xY+t77FaciRzHFd5h0XQ0
 Oz5zWsdS7FzLOvt8KZrSkT2KstxJyV+j/hS1/7rwVGYvTuJPtDu7vbeEJXHYy28uN+Fy
 JoxC9r5nnOpTO5QtCg9m9eCxvDoD7Lxcos/bWApereVeqUcCW1l4vpsnstsRZByCS2kZ
 Ck/flCy4YHvpJ4FkTv9OOKh+kpKZrVnVDc4WlKbVdy9Q1wGLFnJuRHWFBl8e3mX9jKQa
 Xu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zxGexwbco+d/07qE4oRx9+s3rxnu7r68q1Au53vT/4k=;
 b=KkzCBQH4VuXX3yYMYli5cE20d+wSlFjTma14wvLONulnDuZTj6iDt18pRlZuOaklAE
 0x7d9o5M8dHjTzU3e8HM7phDVkX65jqJJ4VyKcD0uJA5TBdQXY0faNKR47Mueapkahi2
 Phmb83PQ5u9HuBh3ms7kj9tIVKsWoaxzNYoRioJgd1zowdikDmWb2aNLxv+TOEAq/eL4
 iezlIHOl/DHMBAslbhk78pSCo2GWHlQzCaedvnPE0WHKqnjMtmVANFIG67LA2FBYrOFy
 /w6K9nM6GdkCYNZo0AlQDtxac+tpKybqtm+bstPZ14S0P70gePlaa0rAEoAFwE464pvE
 PqYA==
X-Gm-Message-State: AOAM531V1a86UqruGHrU7D2J2GrRzIDTNKzbuoq6eDT0et8Y9rwxNhNv
 5SHCUadzM/X7Qi3fi18nax2YRGuOW+XVUXm4GercQg==
X-Received: by 2002:a17:907:75d9:: with SMTP id
 jl25mr4331499ejc.4.1629984197255; 
 Thu, 26 Aug 2021 06:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210823160647.34028-1-drjones@redhat.com>
In-Reply-To: <20210823160647.34028-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:22:29 +0100
Message-ID: <CAFEAcA8XP67bPYXmY3S7SsQzXjjgbxsMCOHmA=PcGNz8iuP10Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rTki8Jck8EB7

On Mon, 23 Aug 2021 at 17:06, Andrew Jones <drjones@redhat.com> wrote:
>
> v2:
>  - Completed testing
>  - Removed extra space in an error message
>  - Added Phil's r-b's
>
> While reviewing the new A64FX CPU type it became clear that CPU
> types should be able to specify which SVE vector lengths are
> supported. This series adds a new bitmap member to ARMCPU and
> modifies arm_cpu_sve_finalize() to validate inputs against it.
> So far we only need to set the bitmap for the 'max' CPU type
> though and, since it supports all vector lengths, we just fill
> the whole thing.



Applied to target-arm.next, thanks.

-- PMM
