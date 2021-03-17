Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp214696lfg;
        Wed, 17 Mar 2021 02:10:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX4U7FCgyuLJCQi6wOZ8MG6MGnMD22f5m9wGV8v0QSEc9VklFSFrg1SJsXrYo3jTY1SM67
X-Received: by 2002:a25:50d5:: with SMTP id e204mr2989522ybb.294.1615972228168;
        Wed, 17 Mar 2021 02:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615972228; cv=none;
        d=google.com; s=arc-20160816;
        b=K6Pf8hcvU7M/BAaeFKDqfkbeTj5xOs+RYTINJH/nrxLCL/wgxKZn9Gf+XVNCrHY0oS
         y3GBR5JXCJ40XVBj2Vw4bJkRfdiG7kR9T2XmpPOhhvrPHHInrova447yXsxGJd1A+KLK
         MN957lHoxtn5m9uQmyUkp7IwGpQ8nOOrbDJPkYp5AzoBhow8OeUXHj5Vbpl1/RFKPbaw
         aM8jOrwzqxMARWnZnMs75vaaOio7hy5GnyjG4rVYzWaLYFK5oPTD+Cx3wrJq778V9l3L
         XFP4hwIiJhCyFQoHchTiAhjuFCmtPblaSYyhO135Od5CXVat8Db5eGNo1Xzkz4OazUKf
         CtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AT6AGryVfAQzGuwwXs7eUT4zEJi6ZCaLdN/NLPmoO/A=;
        b=etuebKZ2+71947nGfMRZ1X1aEIHmj67XySib2pI3HyfiTQZApstRp8ValQe58/bRRX
         9MT/I07klb5SLlMK/RAxcCBX8S+alS97OaDBuj+rsf5D18B2XweCN7/YLDWWZXl6cvlI
         GJ1ohJBFwcG04l7O/fx6Ezxf36h84ZLQXiDVVNP04qdJd+ymPrCiOlA8BTidSihuD+QS
         OHiSDrVqnQWbJLDywKH8EjWAspT+Rb5iZPHbBOVQOGoEuKbUAcy5w8QA5faknTjhWAfs
         qxO+uL5ocqRQVhq63rfCpb1WcDHDBGy8bsp9pGtx3O7LTCNKmWNcRC1UovbD9tfrraUP
         ehhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Edva5iUY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si2503902ybm.92.2021.03.17.02.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 02:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Edva5iUY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMSCB-0002z7-Ga
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 05:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMSBl-0002xw-QP
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 05:10:02 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMSBj-0005a4-KL
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 05:10:01 -0400
Received: by mail-ed1-x535.google.com with SMTP id e7so1285210edu.10
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AT6AGryVfAQzGuwwXs7eUT4zEJi6ZCaLdN/NLPmoO/A=;
 b=Edva5iUYxE1DMqi7lxg2NXsOX4dR/RfTVe9tCydH8DAILK3nUVIBstC+iuzHrTEd6g
 InQqC9eOpjZkZCDFLFUQV9zIjllD8YvqS3DxNvBDe3KGJu3Un6HdUBCtK/pQPv6SbQDw
 0k5O14Qhbz2BBI3amJj7TFk709rBOPXwb+WSdiBxqBS8yUALJuDsR2JGk9PLgtZzOIfD
 Bx3/OfA/verRBwJYgMdKqbCyaYrJwtubMMvb1cCkNVRL/zTGZu8kBzLZLbcujv28tlUU
 sgFeSLuRLsVWHVe2nGV9X9oVrun4YAJw46AM5GQhOeu+zZrd9P/w7jiOEGKiitBdM2bF
 3nTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AT6AGryVfAQzGuwwXs7eUT4zEJi6ZCaLdN/NLPmoO/A=;
 b=X/mJ2hyf0XgYGmjO8qTfDIOCptjWhOKSpmJ/1jPmCgkXF86wCMU0NHnuIA8vYcf/Mp
 42W2KHB+1lyYpt//VgZwg7yvirg6WhImYnHFkNQABdmnvyBPxYTpNt9e4YHteyBQx5N1
 CB4o3MIQ7E3jYFXsCfjKrZzCI9yHKRsYNCPHWK3EvGyZ65UkzExlSEdFx4OxMUd5E4ug
 YH5HbZ8jOidakODmG0zgVbLEbsL5yHb8VXZQMdJs/6pGyqKxrL0OfTVSil8JbUTcb2Vg
 cW0yjVogukpKnBV+LiiH0FCMzq9NqUGw4//xa3P+L9ehB6HrAT4TJvipuq7X6NFBJQlO
 6qTA==
X-Gm-Message-State: AOAM531jzdtlg6/O4apeOLFTU3pjJuEnpNlDx3iQy0m5Q9F73pSwM8lX
 6qcqFWMjtqDUqxK/4LB4LMixB8m5iC81xrAgggPIcw==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr40301647edv.44.1615972197126; 
 Wed, 17 Mar 2021 02:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210317044441.112313-1-gshan@redhat.com>
In-Reply-To: <20210317044441.112313-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 09:09:34 +0000
Message-ID: <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yDZQpBiCEcot

On Wed, 17 Mar 2021 at 04:44, Gavin Shan <gshan@redhat.com> wrote:
>
> There is a added clock to trace buad rate change since v5.2.0 by
> commit aac63e0e6ea3 ("hw/char/pl011: add a clock input"). The added
> clock causes migration failure. For example, migration from v5.2.0
> to v5.1.0 can fail with the following error messages:
>
>    qemu-system-aarch64: error while loading state for instance 0x0 \
>                         of device 'pl011'
>    qemu-system-aarch64: load of migration failed: No such file or \
>                         directory
>
> This fixes the issue by reporting the baud rate change at post load
> time so that the clock won't be migrated by sub-section to avoid the
> migration failure.
>
> Cc: qemu-stable@nongnu.org
> Fixes: aac63e0e6ea3 ("hw/char/pl011: add a clock input")
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/char/pl011.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index c5621a195f..401bd28536 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -322,20 +322,20 @@ static const MemoryRegionOps pl011_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> -static const VMStateDescription vmstate_pl011_clock = {
> -    .name = "pl011/clock",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> -    .fields = (VMStateField[]) {
> -        VMSTATE_CLOCK(clk, PL011State),
> -        VMSTATE_END_OF_LIST()
> -    }
> -};
> +static int pl011_post_load(void *opaque, int version_id)
> +{
> +    PL011State *s = PL011(opaque);
> +
> +    pl011_trace_baudrate_change(s);
> +
> +    return 0;
> +}
>
>  static const VMStateDescription vmstate_pl011 = {
>      .name = "pl011",
>      .version_id = 2,
>      .minimum_version_id = 2,
> +    .post_load = pl011_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(readbuff, PL011State),
>          VMSTATE_UINT32(flags, PL011State),
> @@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
>          VMSTATE_INT32(read_trigger, PL011State),
>          VMSTATE_END_OF_LIST()
>      },
> -    .subsections = (const VMStateDescription * []) {
> -        &vmstate_pl011_clock,
> -        NULL
> -    }
>  };

Doesn't dropping the subsection break migration compat ?

thanks
-- PMM
