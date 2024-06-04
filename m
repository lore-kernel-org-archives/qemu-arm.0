Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2748201ejs;
        Tue, 4 Jun 2024 00:02:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsWXt5I3HnrQn7K4gdqmd5sbujg4zNZLf0hDKizKE6D31pY3wxor9RXZkMtb17pr9er7AG4+hWc0ChE7iD4pYruOX10Wmo
X-Google-Smtp-Source: AGHT+IEl/gvYWXBw4FfksK/v27XcwYXTI7ZCWVLlbRjljul/XkVE1yzZEeid72VywECpFA0CTYRD
X-Received: by 2002:a05:6870:14c9:b0:250:8aec:b650 with SMTP id 586e51a60fabf-2508bcbf85fmr13429169fac.37.1717484523248;
        Tue, 04 Jun 2024 00:02:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717484523; cv=none;
        d=google.com; s=arc-20160816;
        b=A3ojwe2YZKKr1G/Ls7qz5zQ7bPxI80m9LEXD9XgCNfvBS+mtFN/TllrcR9KQAbpdyL
         ELghdJMSWjukmjyVJtOmUtTkyUIuKi9M62u8Jkwv5dWx4IEwcA8f11jYU232ACIJ5c+A
         9VmrodIuquMdKPoZveFvhFAxTlFBsladjsJOg9tvGJb2i8dBQhiHOcdfqJ+3+44n2a79
         7AE8ld9UpUGyYvQQs1N0DCL6V/fZYAKVBaSuqm8FYq31qhTxezDmcDCZqcjkTcvyecSq
         fedmRn3m3gDQGnZlTuUN6GwwhnYzKx9i13KQRruCG5rWwqolea83ECTRE2W6E8dUXM9l
         LVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=onYLLgU2otqdzJpJbj41dXVqS1O4Z84VNROnkX7NwnE=;
        fh=pr0RUGVMIxE140BsQqvFuHDc3vBwKq1NgAu1YT5VbWE=;
        b=XKlMdgIeWhQIwcQj+A0hsDFxNTvEwsRBiQaqvwvVRGfEk0pgW0Ar+C5oLScCLSWOin
         loEUu4FEHIlCyO+jdIWUgz6QIo+kxy5fZlf9Ie4Kzkhcf/0Y6zUe/AvGDKVLn/gPZj7G
         hHejz3GhX+vw1yUfVx39ovhppKhEZNjRh1DdmNBIUsa0+ayyrMVH9jPZq6+up6qFspZO
         cL2XEn2F9DPykrSS15jOVCDtgXTh1Tm7pXxk3Po7ixhL6ltRcwqmUmOqde8n3rpRzS04
         kPWoqKEStkRsO3B8KIteR2tjWsaWYiK4rjpwy51Mbevw7attALVaLqICudvj6Zkg4W1Y
         Xtsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=KRMVp9IW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f32c28c8si116634685a.763.2024.06.04.00.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 00:02:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=KRMVp9IW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEOB8-0000BW-Bc; Tue, 04 Jun 2024 03:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sEOB6-0008VC-Pd
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:01:52 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sEOB3-0006eu-Sx
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:01:52 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52b83225088so4861219e87.3
 for <qemu-arm@nongnu.org>; Tue, 04 Jun 2024 00:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717484508; x=1718089308; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onYLLgU2otqdzJpJbj41dXVqS1O4Z84VNROnkX7NwnE=;
 b=KRMVp9IW4h7HkokHE+Q3lYICGujsMrtefLWdbs3ZEEzvGjszbJ77v98XkB7SRfLkHb
 iA8VyAgydHrsy5yLh6zK0eG+DGj43zRrMcx0MTjEsjuS4t2Uxu/jj5o5Z7FOvyjy7uG0
 qOkypoOhWf4jEi+FbwXeZ+vCtDAJb1kCJWY6kDk7ELwhgIwMlWgUH+uDnDPpHHVr+9QE
 bRNDUGsoD+x9koO8+nESAoa+2yLQHTVguoCFF4QBv8R4EoaY3EiENiznkHEQoGBwMR93
 wborIjGWStS78LydQDGvIGvRDdw67nMQjyiS/jIlOQt/TAUKsPcE6JADN9Crlx1S2Crs
 WRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717484508; x=1718089308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onYLLgU2otqdzJpJbj41dXVqS1O4Z84VNROnkX7NwnE=;
 b=w1aUOQi4BV5y1an9SfexVRukJxj18AKaH5SJxKJONlENNHpyiebHzf3u5CcwHZp5vV
 GO7T2W6PMNBHJbY0CvL4XUK9dOunL2eQuQXC83xmopRHjxUWHiM5w0TjmIwJlwv/xhR4
 /knnwBjtXoQDLdf9Cr9+DYwcUbZpuIQQhqpEUJ5ecHOPCLZzUzQTY0fAVs0WRjf0fx10
 VN1gAnTHClY/AQtM860kIEDWEFQSn0Go7fYJd3NVW58CjBAdWfql5TE/aVkiL6M+Vukb
 3YVhgbuZyxuY2DGqiZSwnO71R/Ek80q0rpUgkNaTpIvuV4CGGp5B5z9P1zOVfvED1ory
 8yoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC529R2WFW2qoBU9MOKwU22YXALivO8Vrdop+6I8iyQn6x+phZPnbl/5guhcKxwDSf5YqcbdeyF2e9NcyF45iT5Sga
X-Gm-Message-State: AOJu0YyvwYbLyMsnsayiSEimAyY9aonUlVgXpdX+F2RXor/ulw+sQhHh
 ENSLV3RCiWow1/OhNivL0fvjHaQQYSnVPiZp9cdnARABIrbGX2i/CueIEzT8gm+F/4xut+tTs80
 VWLc=
X-Received: by 2002:a05:6512:b24:b0:523:8cd3:42cb with SMTP id
 2adb3069b0e04-52b8957ff7cmr6884184e87.7.1717484507868; 
 Tue, 04 Jun 2024 00:01:47 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b9ea8ca6asm295327e87.245.2024.06.04.00.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 00:01:47 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2eaa80cb573so36472041fa.1; 
 Tue, 04 Jun 2024 00:01:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWTKPwIFLKfCdKEecHW+XDKFHvm+nRibq3LJUA3O8FllUgfN4JkWj9j0C9nMNXc8q68zlRiSF9ySllryJVN0dCHSRt4BNFu1sdstNeRYzUpdu2hJERPbdPys2U=
X-Received: by 2002:a2e:93d7:0:b0:2ea:a382:67cf with SMTP id
 38308e7fff4ca-2eaa3826e48mr47887901fa.24.1717484507004; Tue, 04 Jun 2024
 00:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240603055248.3928469-1-fea.wang@sifive.com>
 <20240603055248.3928469-5-fea.wang@sifive.com>
In-Reply-To: <20240603055248.3928469-5-fea.wang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 4 Jun 2024 15:01:35 +0800
X-Gmail-Original-Message-ID: <CANzO1D1O94uSp--EtCyEF1=xaxq4s2R1BYuqf_-5ri-rSKOT2w@mail.gmail.com>
Message-ID: <CANzO1D1O94uSp--EtCyEF1=xaxq4s2R1BYuqf_-5ri-rSKOT2w@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/net: Fix the transmission return size
To: "Fea.Wang" <fea.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x133.google.com
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
X-TUID: YmbOy16Qf4qX

Reviewed-by: Frank Chang <frank.chang@sifive.com>

Fea.Wang <fea.wang@sifive.com> =E6=96=BC 2024=E5=B9=B46=E6=9C=883=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:48=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Fix the transmission return size because not all bytes could be
> transmitted successfully. So, return a successful length instead of a
> constant value.
>
> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> ---
>  hw/net/xilinx_axienet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 7d1fd37b4a..05d41bd548 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -847,7 +847,7 @@ static ssize_t eth_rx(NetClientState *nc, const uint8=
_t *buf, size_t size)
>      axienet_eth_rx_notify(s);
>
>      enet_update_irq(s);
> -    return size;
> +    return s->rxpos;
>  }
>
>  static size_t
> --
> 2.34.1
>
>
