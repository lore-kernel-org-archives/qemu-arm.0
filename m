Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp633132lff;
        Wed, 16 Jun 2021 12:17:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2SER36ETpVnaoILqoX0iCWTphEhxTi4L6M8og0qTxsPu2Dcbsq0J9+jsO0gedximvE0rK
X-Received: by 2002:a05:600c:4fc9:: with SMTP id o9mr580663wmq.73.1623871033947;
        Wed, 16 Jun 2021 12:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623871033; cv=none;
        d=google.com; s=arc-20160816;
        b=Xq/MuZNHJ7HgBE/FCXpm8EGGJbVSEFbB584FeY7xI05daGwfXx10exJUJdxg0/Ne4d
         PD1eJf+VS9itkCO+pMuSEB+BEiOHN/iZysWRo5prIUNl3hZE13pKwhT3lbBvlDJVLY35
         cxTplCymGLfMmvCAcZOVNuG8NqjaMwdMzd7xU0XPrtAL6z6CiCJJCkqH9mMwNL7sUzWN
         gQvnPryiv/AOyHjB8S1EFtcRqvsypS7MtVucfByjiPtqFDSLL97W+aYtUP0/WEhf5M5t
         vr/N/oM/gjp8uSK0uxtZuB6gtKWo2GzDnY962Mhe2MQPHVp1LvpoDs6uslZgOi9qKPih
         co+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=iwYgsGqaMnikrs5SiKIqwp82TkLou4IHu977RuRJhE0=;
        b=YMhqIc2k5B/rqjNw8SVVSwu6dU7DnYOagQSm8zXGHB4J3Telbc5HpnoU6we3UWT+uL
         EZYTPSv0qvoZuaMpTLS2UPjeeL8xi7IBpZ/ffBF35Besp8BzvJ1VmYVcLjEhNfgTaVOo
         ZhMjUmudvUscAf2jqFeGtKDryTRMYJqPk81TFZiv7cJmG/dBpDIq0U+7V802vjYKUsFi
         x2MdcWCvldVnswicLcHccvJIFD4rdT881sUPn5bxaN1kBHNBhE1yCqjjocnwthMroPsL
         jCyMKKGmmfRMygMk/fzNnW1B/SkrJFfEp2RsEHLffxQh0yU6fNPKQMRJeM03TO/NHhTE
         iPcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=Z25Wu33Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si3472354wrs.148.2021.06.16.12.17.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 12:17:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=Z25Wu33Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltb2H-00072H-3N
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 15:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ltb1o-0006TX-Gp
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 15:16:44 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:44655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ltb1k-0001BW-8t
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 15:16:44 -0400
Received: by mail-oi1-x229.google.com with SMTP id a26so3624644oie.11
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 12:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iwYgsGqaMnikrs5SiKIqwp82TkLou4IHu977RuRJhE0=;
 b=Z25Wu33YKYMuUNgyZxk9iz9rARRaaBsBjQCRZucHJajc5vKAJXRmE7TB662hWE/Spe
 MSGQpcYLUtteuVNVDUsO5kxicUG7B4am83OAvsSZkxIrqV2gxZT06lXCM0Poujek+a0Y
 gMyLSry5qbGVEfa9CKBQyeEdlnu6yPjVhTTAwpCVkxO5PdKhEysAYZWvVmRNMh/DhiFV
 Mb/Yv/Z9NW5Njz+eDy9f7xMKA3D3zCMiXGLSaDgohmKcsi2482BR1q9mnelLz2Xi3o6U
 fAtHq54xY6LrWANWyO0PVuQ1yMIn8NfFI54Z89AvTYv55jmmPm7DekKqcCXBbK3jT+kn
 4yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=iwYgsGqaMnikrs5SiKIqwp82TkLou4IHu977RuRJhE0=;
 b=bPE02K+wQ0NPUfDXgQxVVTVa3faW5kXXGLotdwFdABbMzRKx0jkup35LtlyFMb3018
 FGmc8zi2hv4mIibtJq0yvrZe+ZqIduOgUxuwvpLMaVWzazxW9b3+LXjIXITHccse8PBv
 tT/6bwKeXqtd35L6kJIL6PzSvMX6bhIfTMCm7vLCIUziZcSO9ADlHfhynCEpwNmqHoms
 3b5MfH7Bit2gfK08Zg5MBvA7uv23CsJJCnSDYjlAkps3VlXRN6NlSg8EjUmK9dlvJH1s
 rnLtjPYI+Y98cEz1pQ9UGok+1dRyu7oLoFmPTPdS0vTTizAxDKC9JHmj1e57D9ZI6Fyi
 Cdvw==
X-Gm-Message-State: AOAM530Zf1p0Q+0gVz7VMwHcWrR9UHlzxAyiBuDZ1vaodBjk2A2OpvUT
 RE6fML/BZMjeti7gJJZjm7gakw==
X-Received: by 2002:a54:4401:: with SMTP id k1mr733503oiw.2.1623870999092;
 Wed, 16 Jun 2021 12:16:39 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:ede8:ade8:da1:e1cc])
 by smtp.gmail.com with ESMTPSA id s23sm732546otp.38.2021.06.16.12.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 12:16:38 -0700 (PDT)
Date: Wed, 16 Jun 2021 14:16:37 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Message-ID: <20210616191637.GF11196@minyard.net>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-7-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210616161418.2514095-7-f4bug@amsat.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=cminyard@mvista.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: cminyard@mvista.com
Cc: "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hievD8zh9Rjs

On Wed, Jun 16, 2021 at 06:14:11PM +0200, Philippe Mathieu-Daudé wrote:
> Instead of using the confuse i2c_send_recv(), rewrite to directly
> call i2c_recv() & i2c_send(), resulting in code easire to review.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
> index f4c5bc12d36..b3d3da56e38 100644
> --- a/hw/i2c/ppc4xx_i2c.c
> +++ b/hw/i2c/ppc4xx_i2c.c
> @@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque, hwaddr addr, uint64_t value,
>                          i2c->sts &= ~IIC_STS_ERR;
>                      }
>                  }
> -                if (!(i2c->sts & IIC_STS_ERR) &&
> -                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
> -                    i2c->sts |= IIC_STS_ERR;
> -                    i2c->extsts |= IIC_EXTSTS_XFRA;
> -                    break;
> +                if (!(i2c->sts & IIC_STS_ERR)) {
> +                    if (recv) {
> +                        i2c->mdata[i] = i2c_recv(i2c->bus);
> +                    } else if (i2c_send(i2c->bus, i2c->mdata[i])) {

In the previous patch you checked < 0, it would be nice to be
consistent.

-corey

> +                        i2c->sts |= IIC_STS_ERR;
> +                        i2c->extsts |= IIC_EXTSTS_XFRA;
> +                        break;
> +                    }
>                  }
>                  if (value & IIC_CNTL_RPST || !(value & IIC_CNTL_CHT)) {
>                      i2c_end_transfer(i2c->bus);
> -- 
> 2.31.1
> 
