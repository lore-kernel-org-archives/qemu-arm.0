Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2466392lfv;
        Mon, 1 Nov 2021 12:42:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpGXveSsrDlbXV6qVcVOi8mpRGLskl0929SYLKMrm3m5XaLdbjLGCrfVtG+B+ZieD141qe
X-Received: by 2002:aca:f182:: with SMTP id p124mr928543oih.168.1635795764476;
        Mon, 01 Nov 2021 12:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635795764; cv=none;
        d=google.com; s=arc-20160816;
        b=SWYbjxZpBhMvvOoo9JMUZiY/ByzQ57JJH5zklB2HW8fCGC05tatr6jVjfPwXeqQlps
         3YzEUUNZsbuwvDV3sPVVMDS150gm2F5dt9WrPo89Pgz4wMJGKRtVCigProjl8S8bPDHn
         t15tGx14D86mvyps+u/RqUo/bes7cW5FGLL4r2m3UQxo+7Dvhd20oCR5KpfsDzxHBYzM
         zdykkG+wLW/8GUgiSvWTbkAM/kT99utNNlvKvYoY229e638d7F+Jhvd+GohyuBjhIzid
         AYLzGHQJojJLSmshf7SaYkr1fFckZE4Wdn3I6jvIzs1GRQkIZFcjkcSFrz7z6Inu51JJ
         ovpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1nG2KOKvk6PUZFwMv38E+byTjYzdGsIoHrs4BaKLf4=;
        b=iS3/mSKMvgtbdWgYEb+MOO9H05Dm0mvPY/gZ38wPxD7XyTK9Vh3bWWOoa5GXEWX6Wr
         g4xNfhe/gmdXxi25cl+ERBDFk0vJ4XEf0uKPfqj82vIECHItdFDdsPwf01Tp9JEXX4wk
         nahFq6O74+O1DJbkphXyHuHHTYtwJVdV6Ru+vd6zlnsiEN/fgEEWZW5BdVVKMmXcEH/j
         JFZ4ma85ySC/1Uf0ZqqJ5+XUFRhjlFk5QXmzccS17vrtBWUetJQFDSNH1FgH78sZe4Qm
         fkSmPqgUwhV6noXVAZi6Nn2HR6N34fr3+hU8ipcv9wKGYO/EAvkdK1sbuYv7FAi6D5Np
         HzwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ThuqwX8N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si7528809oie.279.2021.11.01.12.42.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 12:42:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ThuqwX8N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhdCd-0001dG-QW
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 15:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbJB-0008K4-2Q
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:41:23 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbJ8-00077n-NM
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:41:20 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso17737536wmc.1
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m1nG2KOKvk6PUZFwMv38E+byTjYzdGsIoHrs4BaKLf4=;
 b=ThuqwX8Nw3lYMBbmsO9FseDu2oTCUUdoXXdIMfMYNP5YwatkpJH7CLzchJ8Bi5AoyV
 73MCdsiouxEzq3a4E6JNYwzCSr1fUTYnia4JJk/y1zKYqtowFtVeutVwEzQIS24fY5zR
 TeoH8s07xGuvODgccByr1E6pnwvGxb8DOz0V1mU6T8N9XNc0Hq9EXwjKytnJ+hqBCfvy
 KfuJLQyLyaIp8YkPjuxac0l85qo0LlIbnBlbUsSZ89Ibrs2/7NB+mZUxSU6ONWO4SYwy
 se+IyoxLA9Lx+gsmYQEwxza6Ks0tX8OS6UPFqmhfC6p1o1YF6aoyprCmPtJzj/glkaUc
 nw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m1nG2KOKvk6PUZFwMv38E+byTjYzdGsIoHrs4BaKLf4=;
 b=D4qKJqa2q9s2aubVJgXmB8o/zO4GjuFVM25XcDIsnNuG/NzHGGDCXWMQ+nHak85ego
 fdRviTE+MSTpz85xMUwqYCDYScx0R0SgPcKaYQFhW8MMXIRBZVzktYffnrCWVUzcYmiY
 OH7Q/hXp6gFfHiXLsJMfSQp8ZLpu5li+krTwX2Q7m4O94734sHI9Kj9uBQTBg3LO7W8u
 JQQ6jS0dnug9j4lSyKmxpAURue3Tlzy4bka6WrOGX8CGkzm7H6a5CSKJxYry1MDsx23C
 +tCb75ketvTs81GlNi2EmutnrzLxJIkzj+NZrBTwwvGEBYXk3U5RQ+NUGrDRsZE1WXNU
 asqQ==
X-Gm-Message-State: AOAM5324ZzyMjm7bSqTNJrEBKbj0EoeBRa62ldOgHUTekXqCiKPBdiPq
 Yp1WRzU0ow4DQw6efRkewxIc5w7CEWTZy/YgRS+JdQ==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr380801wmq.21.1635788477273; 
 Mon, 01 Nov 2021 10:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-6-wuhaotsh@google.com>
In-Reply-To: <20211021183956.920822-6-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:41:06 +0000
Message-ID: <CAFEAcA8mwXkPSMubBjmqzFkK6ghmyW_ngz9AejeoF-GKkqSL6A@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hw/nvram: Update at24c EEPROM init function in
 NPCM7xx boards
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ehfGVJjkrcUs

On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> We made 3 changes to the at24c_eeprom_init function in
> npcm7xx_boards.c:
>
> 1. We allow the function to take a I2CBus* as parameter. This allows
>    us to attach an EEPROM device behind an I2C mux which is not
>    possible with the old method.
>
> 2. We make at24c EEPROMs are backed by drives so that we can
>    specify the content of the EEPROMs.
>
> 3. Instead of using i2c address as unit number, This patch assigns
>    unique unit numbers for each eeproms in each board. This avoids
>    conflict in providing multiple eeprom contents with the same address.
>    In the old method if we specify two drives with the same unit number,
>    the following error will occur: `Device with id 'none85' exists`.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index a656169f61..cdb52b9922 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -107,13 +107,18 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
>      return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
>  }
>
> -static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
> -                              uint32_t rsize)
> +static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,
> +                              uint32_t rsize, int unit_number)
>  {
> -    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
>      I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>      DeviceState *dev = DEVICE(i2c_dev);
> +    BlockInterfaceType type = IF_NONE;

Why make this a variable? We only use it in one place...

-- PMM
