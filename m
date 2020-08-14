Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp541139lfy;
        Fri, 14 Aug 2020 08:23:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCi+MWBsX11iDWjbxvJZw1x4NpL+uku7dQhYoSl34IU97OJqZQDGoi6T5hy6qt+7LLWmR8
X-Received: by 2002:a25:ab2c:: with SMTP id u41mr4251152ybi.399.1597418597948;
        Fri, 14 Aug 2020 08:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597418597; cv=none;
        d=google.com; s=arc-20160816;
        b=d6pNmofrnUfJbVb8rXKYaqrska36l1ld2QXtbScqd4YtmacqQrvOAOQS4+qJr31c0h
         kZnMW0Q/9Y7K9hcibnMVV72gUpD4k5UHwFhkVah5FQvnacZjQJhVdVslalSKs6J/hl91
         ERUQwqRj6YYc85zmYAs898J69y04rGqwObTMqpTOVsj0JobuS3rW1veO7lxvcpzJNjm+
         tmH+sDABw8jGhGM4Ti3pMRXH8aeT1dxJY/xRlW8qvZy6Q6K9YAWNPJOuCcKZTVxAW+L4
         8JkUBBfLXRkGtpTHkpYMv9DQdhAULhHufDl01irN96E3cU5oe5jnYw25VL7lUsTkxmam
         0hIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xtt73A/X2cf9b6MoJt/wCCC2aLBtUWrgTkG2A7fVThY=;
        b=dKjRUTX/Pbd95xU8A4TztDwe56TrD2x9JLTuUNIv4M2rE2hDpLetPRlezHdq7767C2
         GvxeiGe3Bl7gm8u2DS84yeY4whDhlfOnHSMMc9AnAiz6vPiyPMyxd3Pzi8/Q2IwZRZP/
         UNg0rOcwX3qqt9SH8fLr7xSU8p7mzCAyd6zHuepY4h+5wHhS0GMNGy8dIE4KhY93/vbO
         U1tHY7YZRwwpihcAy5QrvX1t1nvL+fi+wdsVFvO8bY7+5Du5UKf4dNaZo8YRkJMuzcRp
         XLNG3sCtCd2yeS6zDodMGh5V/fxXMwtVWsCRSJsW1lYUgdSHRG3o+dCKSnj+wDNzIlkj
         MH7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="sEV/yKY5";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14si8625172ybq.296.2020.08.14.08.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 08:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="sEV/yKY5";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6bY5-0000TG-8q
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 11:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k6bRO-0005eY-03; Fri, 14 Aug 2020 11:16:22 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:46366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k6bRM-0008PZ-32; Fri, 14 Aug 2020 11:16:21 -0400
Received: by mail-il1-x142.google.com with SMTP id c6so8688535ilo.13;
 Fri, 14 Aug 2020 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xtt73A/X2cf9b6MoJt/wCCC2aLBtUWrgTkG2A7fVThY=;
 b=sEV/yKY5jwRsO9e8gzS+Lr6CCwqhW5gDQV8UyI4edo10Xvmze2YvC9yFxuq+6IxjMw
 c6kRpBXxaWdE6Gi7arExCOWZpPY5ZUCI5SxJ5hsbVbl4h1TlzfzCChvGK+xWaH+xMdtz
 vW0oBRVuUQOUAiCY0QZPwER4sIOM8p55uc/nrsx6166xHedtDna9Nz71d1SsWCic0uVB
 jnBeqycZWrfSwVZYnPc6R+xIWXUFZII72mSA8STPWT7mRvKw7YxUsdf9pHE7G+tgaR1j
 fzj7co7uAYwoqq7jANztHgubXh5zMbXNCeh0KiNiQgBEJUjiYf46k3Tp/Vh8vG6lMCPu
 hHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xtt73A/X2cf9b6MoJt/wCCC2aLBtUWrgTkG2A7fVThY=;
 b=tWmR98Yt6nJIKQmroPfjow2rQJ0dCaiYXiJJlcP9cd8FSS8tvW4/egKx1OazJGCNAj
 T+ZYIsXy8AC+DWMVUp8N9E/zdpAAWBCbFoZkOlqGwLDpe35QVWqrEA5B50kCVmrKBVXT
 vY/W5yyf9ZMYa6k4UOm2WXrtfkePFGeG5RLsMBKcCLwygEEZtvxkd4u9KK4Cjv0/VN83
 jpsvANZsz/LRijCwVE5Bq2Ojla1IhamTXVAYyxRfLLdAwwCZvOd0tCEV2iTqICwJcVSz
 8J3gOIVGBzth9n3v8mkriZHWd9RNgX72ouWGQ6eHue0/Qz/lxys7mzABSbPvMcRTASwM
 DaAQ==
X-Gm-Message-State: AOAM531/kgTckAwRbgDoYnrPRuoFpnKJoriix0h+/3f4lOI/E6Pfa1a5
 ujEj9Hyh2LQAIKb6nIRKF2qSVlPUCaadl1vfRYM=
X-Received: by 2002:a05:6e02:ef3:: with SMTP id
 j19mr3067780ilk.227.1597418177525; 
 Fri, 14 Aug 2020 08:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200814133007.16850-1-f4bug@amsat.org>
In-Reply-To: <20200814133007.16850-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Aug 2020 08:05:48 -0700
Message-ID: <CAKmqyKPxRQWNSq9N=5d=VhD7Lt=eKds-Fs=3J=-Gz4rRF=0vdw@mail.gmail.com>
Subject: Re: [PATCH] hw/net/xilinx_axienet: Remove unused code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: seLScYZvNnNS

On Fri, Aug 14, 2020 at 6:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Most of the MDIOBus fields are unused.  The ADVERTISE_10HALF
> definition is unused.  Remove unused code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/xilinx_axienet.c | 23 -----------------------
>  1 file changed, 23 deletions(-)
>
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 1e48eb70c9..2e89f236b4 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -54,7 +54,6 @@
>       TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
>
>  /* Advertisement control register. */
> -#define ADVERTISE_10HALF        0x0020  /* Try for 10mbps half-duplex  *=
/
>  #define ADVERTISE_10FULL        0x0040  /* Try for 10mbps full-duplex  *=
/
>  #define ADVERTISE_100HALF       0x0080  /* Try for 100mbps half-duplex *=
/
>  #define ADVERTISE_100FULL       0x0100  /* Try for 100mbps full-duplex *=
/
> @@ -169,28 +168,6 @@ tdk_init(struct PHY *phy)
>  }
>
>  struct MDIOBus {
> -    /* bus.  */
> -    int mdc;
> -    int mdio;
> -
> -    /* decoder.  */
> -    enum {
> -        PREAMBLE,
> -        SOF,
> -        OPC,
> -        ADDR,
> -        REQ,
> -        TURNAROUND,
> -        DATA
> -    } state;
> -    unsigned int drive;
> -
> -    unsigned int cnt;
> -    unsigned int addr;
> -    unsigned int opc;
> -    unsigned int req;
> -    unsigned int data;
> -
>      struct PHY *devs[32];
>  };
>
> --
> 2.21.3
>
>
