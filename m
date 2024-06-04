Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2747788ejs;
        Tue, 4 Jun 2024 00:01:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5OE8GD2LKLc8cPFlkyiqAyFmZ2pZwHzDR4Fuv7DsQBo0jbCO0cM4G7r3aKk+ssq+e95B6ELahWD8CJwksZai4bvbvYvdi
X-Google-Smtp-Source: AGHT+IGvjPP/3WEiJiNvX4x92gOoefqbRBEpwqD9sPG3/KQvoF74HHocNffiGlTI78B0Q0txAGvg
X-Received: by 2002:a05:6808:394c:b0:3c9:95e2:b080 with SMTP id 5614622812f47-3d1e34a14admr10433658b6e.25.1717484478739;
        Tue, 04 Jun 2024 00:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717484478; cv=none;
        d=google.com; s=arc-20160816;
        b=NVyk2oi/QDNlvWXxusVv8pnZZlQAgt0smhGNzfR+gPS0UDr6MBOmHXIShzpn0OZVes
         mYuZ6heerRrWjPXlaHHPy0jtJgNZ2ZrK0IRGyYh67igRzxRAG3AWtHVVY7LJUNS5eFZ1
         u6LJGHMG/s1RkEMpTiUxTOT8+ZUYeZ8EO/pfZ1GJVqem8zNE3vUUfkH5ULecwzRaPh5f
         ajt8Qh14pSc/bm+W8qeEX48qPbhQLUFAniQNytEeg/cV9uzbkSrB24yTkS0pmkNQ3goa
         6g5YxhsPsvcwrZBifCRlfl0eKJTGw/2TfMQeP5YKE2cHLaByRZeC3zhaOAfB9KCI7VzC
         Dj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=EEd2aHyq//5kCa93gnoLSFnczPLMT6qnXjplmrHppI8=;
        fh=0KoVYJyWKPsGfwi0aP5t87y//bfrfQheFe/tdPFWn5A=;
        b=siexI+S8BDV9YZdJIzBej+xmfPPa5CGFkkJ4ALnie3/yyp1oKKb0ls97jo3Kk3Hb+7
         NGSgs0Fd3Zf5zz6CJokEQMEqVHSI5PYZPL0ECTNPu54PDMOnPKWsJT9LwQslX+aPwasg
         QncUREK1OU3Hw2ZNAZ2KbFrq18jBwn4gLfLrg8mujzYOBceMbOgVKVr2j0y6l69sbBBk
         c8N9VMa53JIkRsqBuQrOEmsDuFLY++z7OLRmt5rNq5MB5/2xUqzPd6FgBz53Hqs+zy96
         p1K8W3L+EeYhWblBZtjFjWYRBkm6LWzYGWv/6dci4HBlr2XmKE5XyCJHJXHXmXEyYia8
         /4Ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=Ku2vn66u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b42b76dsi8119326d6.480.2024.06.04.00.01.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 00:01:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=Ku2vn66u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEOAM-0006vr-FO; Tue, 04 Jun 2024 03:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sEOAL-0006tq-0d
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:01:05 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sEOAJ-0005i4-Do
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:01:04 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52b82d57963so5324932e87.2
 for <qemu-arm@nongnu.org>; Tue, 04 Jun 2024 00:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717484462; x=1718089262; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EEd2aHyq//5kCa93gnoLSFnczPLMT6qnXjplmrHppI8=;
 b=Ku2vn66ux5hFg0lhlKr1Tv9Fu2M2HIcwrF6XGUxKnPhlvWl60xp9vJbvGbIkX56x2N
 dRmKlqVG12gBMiBAux92AQnyxPf+rArtDgA5tadYZnZFhadXf54YEXjyxp1rM5MI6c0J
 5cX0w4lsbHI89HYiLvaMWSet7w1sFCalBUZZ40Zh38cGR22IE30ilrK3bhrggv/PuUcF
 Ab2w0G66i42Wl7E3gyHaOePU4j7tF5lQtx+L8SEMdmI1W7nE2vlqUqz5eonKj43Dn96e
 svyya4OTl2TI4MSPC+suXHZ5WnsRfciZZ4+a7tgnlBifAXEcZPHx+zNUF1ot9ZJimlzs
 kKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717484462; x=1718089262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EEd2aHyq//5kCa93gnoLSFnczPLMT6qnXjplmrHppI8=;
 b=u87BdVLSFtKZTlfQusuvG2cvOuoT9ZHhq+e2FpsrkxoI1cp4jYgcE2dYC7FsRD6Y2r
 iz9+sNuIrma5gj2K9+9THKrtjFd5OUJgkTW83nJTswrC+zKWuyY43Z6feRsKmz36Ljdu
 BgwawDINlPvWSQe2DLdFvPHkac97mcZIC2qT4ge1HGzNhwVyNufXEPTCdfF82BAOjEKc
 SjyHIi6KqA1u4htiqdjOI9wh6h2AJxk1pW9KdYGC5M9RGJzlZXr/cmpPTcI9pE6mfF8E
 Mq9YDs04AoVi53ok+iXWjQzV25fory46RLrlmAG5OxMbIoJE68tuxxSXEHR9PR24QMpD
 pNtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZSfh0F/nIcehSJD6hKWLVid0W5tTBlKOukT6rftSHZcUyESqUb8b6AdrArGVKzGJ5/kJMVShnvRllf7tj1cvhTe4m
X-Gm-Message-State: AOJu0YwP1BoJY5i8TzmhySGI2atR7tjAbt8RPjELZvBnLs4UeaPWAZGw
 /YmvWtLUaunOfsObVoYrrBXwH2ZUZqgSuzeb8pXuOPhjCyS2bhZqLIwk4jVKDhM=
X-Received: by 2002:a05:6512:3b25:b0:52a:d87f:60e3 with SMTP id
 2adb3069b0e04-52b896f7eebmr9616137e87.57.1717484461608; 
 Tue, 04 Jun 2024 00:01:01 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b9b812641sm441130e87.39.2024.06.04.00.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 00:01:01 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2eaa80cb573so36462941fa.1; 
 Tue, 04 Jun 2024 00:01:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUYqttBAhF1umPjV0M8XmmpnObEaNLc56xaiqLqxNfpMDZeTlUTkri3JQYgUSvvYTzYEhHGfLWoHi69XblA2Tszi6rvvAL8F1jpcHZa88gL88XRXsTX43mtAEg=
X-Received: by 2002:a05:651c:233:b0:2ea:aca0:2769 with SMTP id
 38308e7fff4ca-2eaaca02a6fmr34880401fa.1.1717484460050; Tue, 04 Jun 2024
 00:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240603055248.3928469-1-fea.wang@sifive.com>
 <20240603055248.3928469-3-fea.wang@sifive.com>
In-Reply-To: <20240603055248.3928469-3-fea.wang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 4 Jun 2024 15:00:48 +0800
X-Gmail-Original-Message-ID: <CANzO1D0LK82JxLnARyamRTW0xd7sY-bYga=d8kqnuBzJ5fYEGg@mail.gmail.com>
Message-ID: <CANzO1D0LK82JxLnARyamRTW0xd7sY-bYga=d8kqnuBzJ5fYEGg@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/dma: Break the loop when loading descriptions fails
To: "Fea.Wang" <fea.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x136.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TxoIpj0lZEKy

Reviewed-by: Frank Chang <frank.chang@sifive.com>

Fea.Wang <fea.wang@sifive.com> =E6=96=BC 2024=E5=B9=B46=E6=9C=883=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:48=E5=AF=AB=E9=81=93=EF=BC=9A
>
> When calling the loading a description function, it should be noticed
> that the function may return a failure value. Breaking the loop is one
> of the possible ways to handle it.
>
> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> ---
>  hw/dma/xilinx_axidma.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 4b475e5484..b8ab5a423d 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -291,7 +291,9 @@ static void stream_process_mem2s(struct Stream *s, St=
reamSink *tx_data_dev,
>      }
>
>      while (1) {
> -        stream_desc_load(s, s->regs[R_CURDESC]);
> +        if (MEMTX_OK !=3D stream_desc_load(s, s->regs[R_CURDESC])) {
> +            break;
> +        }
>
>          if (s->desc.status & SDESC_STATUS_COMPLETE) {
>              s->regs[R_DMASR] |=3D DMASR_HALTED;
> @@ -348,7 +350,9 @@ static size_t stream_process_s2mem(struct Stream *s, =
unsigned char *buf,
>      }
>
>      while (len) {
> -        stream_desc_load(s, s->regs[R_CURDESC]);
> +        if (MEMTX_OK !=3D stream_desc_load(s, s->regs[R_CURDESC])) {
> +            break;
> +        }
>
>          if (s->desc.status & SDESC_STATUS_COMPLETE) {
>              s->regs[R_DMASR] |=3D DMASR_HALTED;
> --
> 2.34.1
>
>
