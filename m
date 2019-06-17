Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2763398wrg;
        Mon, 17 Jun 2019 10:33:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwfjeDseNXl3Ro5EQ2E2a/GwgwFIP/eX9z9Mx6PxCRmg30euNYDEBMQFcZEqEZM4zMYvYhN
X-Received: by 2002:a05:6000:c9:: with SMTP id q9mr11927476wrx.208.1560791946932;
        Mon, 17 Jun 2019 10:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560791946; cv=none;
        d=google.com; s=arc-20160816;
        b=EHVYhOISAJE4nLF3CcViav/tHxPvIIdb87cFyYL8lsaVN99dZWj1lMcr8aMkBRNbxV
         M4jk6HTJHGWTbxnDcSuE8WAlIGOHAzwqv0qlGm1jTKjQED8MWQ2EZFnK0hyrMZ+y8g2C
         mpr7dTwMtQR9Ur/IVTFNtS48bdSIO3UqoJi4AM0lcnHaJDBKqe2HeU8klk/8ejrEV6k/
         loEir6BB/q+tTiSKZ/+eKeJM2F8zHjTnQFNtxV3CQ4GvGImYUT9YoMx/+9F4YR9DcIaD
         KeW5ui7ZeudAJdZYiZYfcWHDFMRJ+xYAxipLPp6dqT8/y2jwMSv62gO1WCaj/6OyFeku
         YLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=p4qnA9oL0BPxkrOSqqsQYJaOB8IB08w7HDDnpsjfjTA=;
        b=FBiL1/P+CzEsAPplzm+IRvr2tNCYhdjDET+Qh8zXwqn/26kRlRnskBWCJgMDLKzDgO
         qJCd7JPuVgQnfduq+v6ky6Prlpvkq5qa3K9TEgMpGSOgSC4/h3Uwqut+7bJXiBnCESrI
         dkNaf0xzLPVh1ZNrI4oIBDmj9jAqPckIRBigXTOE2G8qMU/OfKdhL76oqQv9Pu+6WNy3
         7ZMLQpflI0+T5KQB6lHDakLanhDwIWCTchCpAm+6sOLxy6FJCuGFgoHb+/g80b/m79BC
         JL8mC0YcpKhfjXsQ0dPk40p2bvVjTm9QFlP9fBjNhj/csbOh/5gU0lzeC1cedIK3bCY0
         oFHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e0VcNqXN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si4620127ejm.175.2019.06.17.10.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 10:19:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e0VcNqXN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcvHd-0005nP-RE
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 13:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40805)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hcvGr-0005k0-7s
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 13:18:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hcvGq-0007Od-4v
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 13:18:17 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:47073)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hcvGp-00075I-TC; Mon, 17 Jun 2019 13:18:16 -0400
Received: by mail-lf1-x144.google.com with SMTP id z15so7057688lfh.13;
 Mon, 17 Jun 2019 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p4qnA9oL0BPxkrOSqqsQYJaOB8IB08w7HDDnpsjfjTA=;
 b=e0VcNqXN9I3TQJRvm+HJUA6JLogFMS+eeQKnk7uwnmJ2ejpHMBuO7TiZPjc/TZHojF
 XHpGk1IjZfsFuDYJB/GPMxtpQc0PFgDEGVDNCiHLKWnUDMYUMI4MTiCPr961CWkmu9oz
 pnYIT2k47WZbs2i1zlFXI9OU2L9LhM4Y7uU2FETV/yYGTLOcCseoW2xoCQ0CRn8AdPkl
 wJYaSM7/XZ+8N7yVaUb9UauJaDaFWeNVUaFGKCfll75V7WhI1xzHw1YCWUyBU4849idh
 Myigavlp0KJsZleLm0pbHZs2zbmS22LEWR+GVOm9k4ZvcHkZ2Ez1wbDPrLeJx8f08gHM
 atyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p4qnA9oL0BPxkrOSqqsQYJaOB8IB08w7HDDnpsjfjTA=;
 b=XR9cxfVRSz6XwgmVcKcXJ3xMEHu6xNBNG4gCNAQwRg49Tneqqea+HzCOwv0nOUI4T/
 B8BvAgCyHChihUeWQJzZ12sFLlPOAsevkB9I3jkdLiHB3Ug852W6rggRBbLoUiMoH5Gx
 NEW8CKm7L/c6sfobCpE9kDSsBcE8TmdSQpPLn7iWfQcnSRhCJdGgDqdvmqHCq5eJVbC0
 1h1TbsPea+WDjVUSYVEi6c43vh7l+1QPAw+/zO+BTt095ebS2or2O85Z+5ZUU0+amxR+
 q9C9aLjLqp/HSw2Ry3exA3q92eC3se63N+DGDxFwAmB8A0cjvA2WpF81KxgZvRWM0uF0
 dYhQ==
X-Gm-Message-State: APjAAAUAmL9On42sVPKtA3mgKCQwbyk2tUASphyXAbGWIb7PKmYxMx2U
 qMy/YhEBpOnLrank/uA7dpyyX4MYH8qvXV0PDDk=
X-Received: by 2002:ac2:5324:: with SMTP id f4mr15421710lfh.156.1560791881225; 
 Mon, 17 Jun 2019 10:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190617160136.29930-1-philmd@redhat.com>
In-Reply-To: <20190617160136.29930-1-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Jun 2019 10:15:14 -0700
Message-ID: <CAKmqyKOc-ZnGhUgsBzHx2oGoBCoKStTHVWySUqP5kF88LvuqTQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-devel] [PATCH] hw/arm/msf2-som: Exit when the cpu is not
 the expected one
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nmR9XIojV2vv

On Mon, Jun 17, 2019 at 9:19 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> This machine correctly defines its default_cpu_type to cortex-m3
> and report an error if the user requested another cpu_type,
> however it does not exit, and this can confuse users trying
> to use another core:
>
>   $ qemu-system-arm -M emcraft-sf2 -cpu cortex-m4 -kernel test-m4.elf
>   qemu-system-arm: This board can only be used with CPU cortex-m3-arm-cpu
>   [output related to M3 core ...]
>
> The CPU is indeed a M3 core:
>
>   (qemu) info qom-tree
>   /machine (emcraft-sf2-machine)
>     /unattached (container)
>       /device[0] (msf2-soc)
>         /armv7m (armv7m)
>           /cpu (cortex-m3-arm-cpu)
>
> Add the missing exit() call to return to the shell.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/msf2-som.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> index 8c550a8bdd..2c9984bb3b 100644
> --- a/hw/arm/msf2-som.c
> +++ b/hw/arm/msf2-som.c
> @@ -53,6 +53,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machi=
ne)
>      if (strcmp(machine->cpu_type, mc->default_cpu_type) !=3D 0) {
>          error_report("This board can only be used with CPU %s",
>                       mc->default_cpu_type);
> +        exit(1);
>      }
>
>      memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
> --
> 2.20.1
>
>
