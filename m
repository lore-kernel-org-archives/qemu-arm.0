Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5906379wrp;
        Sun, 29 Sep 2019 08:55:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkpa/d2Oxz5AsPU3hxKD/E5Gtn50PVksLC2hsEm9t/zSoG6m0bsm0Vrk9pRvs72iMlcd2k
X-Received: by 2002:ac8:5414:: with SMTP id b20mr4295017qtq.85.1569772542131;
        Sun, 29 Sep 2019 08:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569772542; cv=none;
        d=google.com; s=arc-20160816;
        b=05d8QosYlC/kfwAJyda1bjFTxfw7y8O4aKS0PpDVmVCd8GyVhmR6Qi8qpgTVrP1tN3
         5cV80bB4eNWiFGHN57r5vjTt+sY13E8cc+7m1uWSnTn2Hg6/5/HrB1ffATl2ygqmRjbz
         8uOqJ38Y4hpaugCSEZNZw5+8gqE1oEDJPlKtwz1fLs8+nAToXHmwJvAFc3QgpttEqzFW
         cxcOV6hxFfkPpQXWY7tlJeLt5hDKtT3SwGjFDz8aBqfCJvLE2olX/jpoj/wATVNHqVzJ
         26sUslgc8Chtq/ThMdYPTEDwD8iDxZcjN2r6na4LLvheIfhJBLDJ4omlBv3nabKMzGxJ
         wThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=pvfC2gT+1fyxF8HNPDqCWPRGayLN9bCE9RC7HdlOIzM=;
        b=Bz505xb1rJNj6a+tboUKcwGL5BQ49OSZx4GCaVlgshOf5J7eyieMCo0FHBJa/u6kbD
         6NGs+Hqe/ZM4nxSBSDaWoZcAEO8Er9uuc+FBFSHdsKjUdaDtHQi3AnH5BDXSIglCtYhC
         dlctjE6iskjvsyBzdlNlC1ow5kUvtFZmOJ1FqEsSxz0xDiglGYGawHscXfROo5otNBZT
         oochoUyEnsVl/SPLlVlz/Jxs9yEIvRgNnfHkaEx+dozKfLC2R/Y3+l+96Aju8MQSM61R
         jJw4koo6Re6zQLK8nLmjr8o7u+aBWTzoAKpDwgVzSfIKe5SB9nn+SaF9imFO4DGovQZ4
         EV8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ujjk9gDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h33si10803688qta.183.2019.09.29.08.55.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Sep 2019 08:55:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ujjk9gDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iEbXw-0000uS-MA
	for alex.bennee@linaro.org; Sun, 29 Sep 2019 11:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iEbWv-0000rr-ND
 for qemu-arm@nongnu.org; Sun, 29 Sep 2019 11:54:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iEbWq-0000V3-Hx
 for qemu-arm@nongnu.org; Sun, 29 Sep 2019 11:54:34 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34941)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iEbWa-0007ED-TQ; Sun, 29 Sep 2019 11:54:17 -0400
Received: by mail-wr1-x443.google.com with SMTP id v8so8291783wrt.2;
 Sun, 29 Sep 2019 08:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=pvfC2gT+1fyxF8HNPDqCWPRGayLN9bCE9RC7HdlOIzM=;
 b=ujjk9gDd7wpRzGtbN7/gZh8/iHk5WuOIveHcgGQqI/SU1I2q6LLZlCrsynlSmlbIYS
 R1l0I4ky8czXMQ19btkJ4mWJvV12DXx3FUHLYAAyNT9MrQfg610U2AByfT3DS/NEnLJC
 HMOxaRMlx2MVLxnHhkNCGctHcZkGohw70YMNmYE282AvivOiZob/6qzh/1E3hdSIEYEa
 36vL6dWJ4XaBi07C43y4WwEidVftrxATkv2vIkmtR0mWJ76PLmkwmTad+z2vpMv0KzFi
 7uR7W7Z/UY+Z6THv+TqvIan1w7nueCayZxxT6zHQNlRy5wFqmnu1yRn2Ps/NK4hGGy8H
 rWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=pvfC2gT+1fyxF8HNPDqCWPRGayLN9bCE9RC7HdlOIzM=;
 b=qBpixyX3XNoFCmCZkpKBXWGalep1lVAtPgM6dAKuxN6tmabOVjdj2Rz9ejecw6JdNS
 aWZXbB5sexkqloRV5H9KrU1NIhTRevcnfEgyWFs4cnSSUT0Qjt5SCSodfZAe2Y8CZID6
 bkB0yPKPYO2mOHu3sNAF4IXxaR4Z4unocnVs7BZFHihOCiFgijlrupYWE4+tv4IJ2ya+
 sju94lZXjLSHQGu0LCg64gl6FSVqYJtj/P9DkH9eUnzcGeDyWWTcZDr+vt6CSNvaipCN
 pdS5TTPjExnXZ1N1FC4Vyi/D8Ph99Qi5hnB1fBSVm2ev0e00DnrK41eU5DEL1QCUCkKc
 KIug==
X-Gm-Message-State: APjAAAWe9z+m8ZK0cpcyJyNZGMglKaqJyu9YFed2s50YoOdCMLH06JHn
 yJ/NaOZkSQhTscXAVfIwwNE=
X-Received: by 2002:adf:cd86:: with SMTP id q6mr10030651wrj.153.1569772442036; 
 Sun, 29 Sep 2019 08:54:02 -0700 (PDT)
Received: from ?IPv6:2a01:c22:b04f:b200:7a70:bbc8:8101:45be?
 ([2a01:c22:b04f:b200:7a70:bbc8:8101:45be])
 by smtp.gmail.com with ESMTPSA id n8sm22302088wma.7.2019.09.29.08.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2019 08:54:01 -0700 (PDT)
Message-ID: <c8a8c7758104a1a5fe052743b5a22d3a1353de91.camel@gmail.com>
Subject: Re: [RFC PATCH 14/14] hw/arm/raspi: Add the Raspberry Pi 4B board
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>,  qemu-devel@nongnu.org, Pekka Enberg
 <penberg@iki.fi>,  =?ISO-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>
Date: Sun, 29 Sep 2019 17:53:52 +0200
In-Reply-To: <20190904171315.8354-15-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
 <20190904171315.8354-15-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l0JJnfr7AHoM

El mié, 04-09-2019 a las 19:13 +0200, Philippe Mathieu-Daudé escribió:
> The Raspberry Pi 4 uses a BCM2711 SoC (based on a BCM2838).
> The SoC can handle up to 8GiB of SDRAM, but we limit it to 4GiB
> (no 8GiB models in the market yet).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/raspi.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index b4db39661f..59ee2f82b4 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -39,11 +39,13 @@ enum BoardIdChip {
>      C_BCM2835 = 0,
>      C_BCM2836 = 1,
>      C_BCM2837 = 2,
> +    C_BCM2711 = 3,
>  };
>  
>  enum BoardIdType {
>      T_2B = 0x04,
>      T_3B = 0x08,
> +    T_4B = 0x11,
>  };
>  
>  enum BoardIdRevision {
> @@ -56,6 +58,7 @@ enum BoardIdRevision {
>  static const char *processor_typename[] = {
>      [C_BCM2836] = TYPE_BCM2836,
>      [C_BCM2837] = TYPE_BCM2837,
> +    [C_BCM2711] = TYPE_BCM2838,
>  };
>  
>  typedef struct BoardInfo BoardInfo;
> @@ -90,6 +93,12 @@ static const BoardInfo bcm283x_boards[] = {
>          .ram_size_min = 1 * GiB,
>          .ram_size_max = 1 * GiB,
>      },
> +    [4] = {
> +        .board_id = 0xc42,
> +        .board_rev = { T_4B, R_1_1, C_BCM2711, M_SONY_UK },
> +        .ram_size_min = 1 * GiB,
> +        .ram_size_max = 4 * GiB,
> +    },
>  };
>  
>  typedef struct RasPiState {
> @@ -336,4 +345,24 @@ static void raspi3_machine_init(MachineClass
> *mc)
>      mc->default_ram_size = 1 * GiB;
>  }
>  DEFINE_MACHINE("raspi3", raspi3_machine_init)
> -#endif
> +
> +static void raspi4_init(MachineState *machine)
> +{
> +    raspi_init(machine, 4);
> +}
> +
> +static void raspi4_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "Raspberry Pi 4B";
> +    mc->init = raspi4_init;
> +    mc->block_default_type = IF_SD;
> +    mc->no_parallel = 1;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;
> +    mc->max_cpus = BCM283X_NCPUS;
> +    mc->min_cpus = BCM283X_NCPUS;
> +    mc->default_cpus = BCM283X_NCPUS;
> +    mc->default_ram_size = 1 * GiB;
The comercial models are: 1, 2 and 4 GiB. Why do you choose 1 GiB as
default?
> +}
> +DEFINE_MACHINE("raspi4", raspi4_machine_init)
> +#endif /* TARGET_AARCH64 */
Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>

