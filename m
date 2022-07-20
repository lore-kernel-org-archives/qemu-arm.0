Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp2693363lfp;
        Wed, 20 Jul 2022 08:09:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umxqDiXUpFXY49TlNJRFapJr2GQ2+jt2dz5EMZha/i+FsTfOK9CUqcqdwR5jAhKWDzfhJ3
X-Received: by 2002:ac8:5f83:0:b0:31e:e9bb:f03b with SMTP id j3-20020ac85f83000000b0031ee9bbf03bmr14957593qta.408.1658329764021;
        Wed, 20 Jul 2022 08:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658329764; cv=none;
        d=google.com; s=arc-20160816;
        b=JMALKMb69g3vqeYY1Da0kIroY6KpP4oC5iiMPpUCqmhHc8gxW9LbgIpN1wxhG7Hx8B
         OHe0oeEWXCIpMAQDK8USyUzTriQDr+coiZLvl++1ZjV5WRRo5MvjmTJIncmxtOwA1kq2
         jMSnwSU/1/tsZl26vJQ4w233rauJahQ7SkXrXJlnqIWeCWNI/sWbkZ9YvOJsxo3Pgooy
         fp4dGeq+AU/yaaDz1aTX9tKsgmemfxHibkJ33Qafr+UmyfcrUBk0KeNmvOWlfZVIEVec
         AgL/8joVj/TYlVNbiU5wT/RJKLSbVGy/y7M8l4qjEyJbLgJmKRNIMS2oBjmaCowCpnoL
         plFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xb2iXRiiWPOKHdOO/t/d/mSxFvMW6DWY1KLNER4QZ2c=;
        b=xpBaP3yKOV6Iftw8wLsT3kTGOTWoOlBWNMEg70eoOPFdjUCiUMlwPcQxpOyET2pI2F
         cNqx7xM/dW31+KnPbPeNNXgTrqeNxJ04GzOCidTksbXKLOOKZz/0LkVp0GmZyBtuomC7
         IHOJM+yV+zdXZg+h8yHjSkF+rHVWH0zT5LJ9f8uaQylW/5SAgvg77ful8h1G5qxPUc+0
         Kzl/TMpxXV50ebyEY7SAG7vQJuU77lng3dgvE0Jq0fzQHoWFwQvPoDDXzTVPidTwPeMV
         KRA0H6ElrNOtiqJ9bx8q4eOrt3U98HEhQ3tO1giADhnGl03R/aevtM/YqZu4RzHef6CT
         Y1aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ANvQF9ft;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a05622a01c300b0031eb40130a5si3473329qtw.87.2022.07.20.08.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jul 2022 08:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ANvQF9ft;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEBKF-0007uY-I0
	for alex.bennee@linaro.org; Wed, 20 Jul 2022 11:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBK3-0007tP-Iu
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 11:09:11 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:42964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBK1-0002Bp-SD
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 11:09:11 -0400
Received: by mail-yb1-xb36.google.com with SMTP id c131so31882634ybf.9
 for <qemu-arm@nongnu.org>; Wed, 20 Jul 2022 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xb2iXRiiWPOKHdOO/t/d/mSxFvMW6DWY1KLNER4QZ2c=;
 b=ANvQF9ftc+OFBTJYb/dNdqR/HTYQaoiWPzBMBRMgkhpl/aYRvaAhdjZEX9MnIwUqWG
 hh+zclGQVIOUYjRK8pRY+6bPJCh/4t5iwVMV1CHVVS0hSpiVexJXplQRQunbnhqQ2oRD
 e+zUsk8nQeLWXSbBO++V0IXSHD1HeqAKkdnEBA6cY6brIlFf99a3/OXHc6BsIq5ylmPL
 nXv62oBl7vSWpPBkd1mjt6mGwnOh5RqX8oqJR6h8nJKbVUXyqA+lY2xyZ5ZghlPyWbkE
 JNdfHbRLiI/pxZWJf1n2umqtyhekjMv2XoJXRjpeCdIMeVbyoxkxgiEX0Sfs4niguMkH
 zxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xb2iXRiiWPOKHdOO/t/d/mSxFvMW6DWY1KLNER4QZ2c=;
 b=KOAsz4zSoVaZVfMK9XEpiA8zydKXuWX23PyTy92z47QCVRlCyBkOtmRum+oSaGl6/H
 SOuO737h4eLEGEX+tLsj7shWVBH775ncA7yOPVX1ycPxh2dKPMHDOCeenSEbMIjvflxl
 +NozP7ackZSA7/33tnzFshu7WDF+5iGLuTzhXLoyD0UiIq620pgczuwmLclcFWE/aESe
 A2gKD+B6eNHJHKnYR4Pl8MZl4zUF7bRsTnipJnt/NgayHu30O1xpK6NWQpYPdQcQFz5z
 3PTCxn6WPVZrDnerAVYfE19jHUbF0nro40AUFqM8JfKkhgqHDtYEi5xvmJt3MOAPw78U
 IFLA==
X-Gm-Message-State: AJIora+KNTCeXyE4T/CxqjfquSPBfRyEMVzCL1kQgV7qNXVqti+kBWUl
 ZfDApyKWmjmOoqXCB9GZtGbdqijafzJZxY8IlgTQBw==
X-Received: by 2002:a25:281:0:b0:670:9755:7067 with SMTP id
 123-20020a250281000000b0067097557067mr3214023ybc.85.1658329748613; Wed, 20
 Jul 2022 08:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
 <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
 <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
 <CAL7npF_8ErAn2cvFBQxVCdP96uKpdRQMs_3aL_UW5OLzm3Q=GQ@mail.gmail.com>
 <CAFEAcA-cTzrA6fZXw7onDJ77NMwjBrSFVwADYmttCgdOf9ODYw@mail.gmail.com>
 <CAL7npF9H_eKi0jA_m-wV=jSHy9hc6re7TpTe2ni=9NYK4CxRpA@mail.gmail.com>
 <CAFEAcA8xV-BdhvwvkzRHxqqEX9BAwDJGwHS=koBRbDeGHwQHEw@mail.gmail.com>
 <CAL7npF9bOP=bPtyFS-K+HgXGy9+W11M0ELRJMqQp1-JB_jVx1g@mail.gmail.com>
In-Reply-To: <CAL7npF9bOP=bPtyFS-K+HgXGy9+W11M0ELRJMqQp1-JB_jVx1g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 16:08:57 +0100
Message-ID: <CAFEAcA8hbU7PJK-YvOkbjj2F2PBW1M9J10DkHqUPXTSxYOS-5Q@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ocot5+aspQ8f

On Wed, 20 Jul 2022 at 15:45, Jon Alduan <jon.alduan@gmail.com> wrote:
>
> Hi Peter,
>
> then, this is the key. Please try a newer version. As I put in the title, this issue is only to see from 5.0.0 onwards. Qemu version 4.2.1 works fine for that.

Er, yes, I know 4.2.1 is fine. That's not what I've been testing
with -- I built versions 5.0 and current-head-of-git from source.
But you asked what the Ubuntu qemu-arm version on my system was,
so I answered that...

thanks
-- PMM
