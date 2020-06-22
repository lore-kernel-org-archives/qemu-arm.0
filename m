Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3144299lfm;
        Mon, 22 Jun 2020 05:36:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPLx2aiQj3xG7vwkpan1A+ZPECvj5kltIUnyKNNxb+uAMJFB5HyGno1WVmwy5R85CCc/Ft
X-Received: by 2002:a25:5094:: with SMTP id e142mr26193548ybb.30.1592829378195;
        Mon, 22 Jun 2020 05:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592829378; cv=none;
        d=google.com; s=arc-20160816;
        b=W6UMVdZWOOohyQdgW/8di6WAP2nW0JNmgPzVS1fQIJucCam9OK+25Hz1Scmo4TcOOM
         kBxmXsoN+qzzAkrLgfL2RVtJU30mpFBYmiBAfdCGF4XZrIWdyeJKRiiqeQeDoU4TFjbo
         twgO0z7pXnlCFES09h5xwJDMOWUWN8o8lixqY4qMJwL+JcsKDyTYuKYRzu7EabBICah4
         E93NxOf0HhU6LyAJs3IvfhMaoZBQdch298Gs+lTSsiE+WYUCaKSPI26DqoLl4d/qZLff
         f2xZ8MK7MEtPsM+Jogrc2HrQhFWbIG0lXNs8qpmzeJGtLCV1PIrTdLnPnpKM+4JAIM25
         N65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ZsQwIz3IZE/zXcO2l6pqrWhaZuuVUhZgEgjzCtVOofU=;
        b=QS+ZY7Z2eZNzs6V3uTmTZ2pVSAizKUBt3doquflywWAAAo8bq4UBJHwwryHbAnAZjE
         ZAOIIO/nJyaZzozBQWGWZusjq+WvRxW49jBxKOI6pye2kpEv6n3ni41ldJT5x7kc5OJU
         rYuhlgCWnGRQBRTdnnh+xklwZYcfBveS8PI166ixVGQ0qK0egwSRcM0CBZOxve9eo5Mb
         CZ0U26VfP+cPumyLiEhl3atQXAx2B7P0L3tDiJZ3c7Eg+4V2N6pvwibjkGIeBfmkowUX
         VwGpFDhyazdUgv3waTdPa9NPegsENwWq9mC7p17zcQsXu9TIS2vVHQiaFpLrnAeNQy1F
         rfgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1si12787672ybq.35.2020.06.22.05.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 05:36:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnLgP-0007qA-Ix
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 08:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnLf4-0006sR-RC
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 08:34:54 -0400
Received: from 3.mo173.mail-out.ovh.net ([46.105.34.1]:43694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnLf2-0002Ls-D2
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 08:34:54 -0400
Received: from player797.ha.ovh.net (unknown [10.108.54.237])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 52B951453BE
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 14:34:49 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player797.ha.ovh.net (Postfix) with ESMTPSA id AC598F8F0E21;
 Mon, 22 Jun 2020 12:34:40 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002942879cb-0c9e-4885-a071-f559eee11254,D5B34DF2F1998B4AFDB97B5973F1BB92C24DD330)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 2/2] hw/arm/aspeed: QOM'ify AspeedBoardState
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620162818.22340-1-f4bug@amsat.org>
 <20200620162818.22340-3-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <86b1a8b3-d19b-8efd-fa5e-13caca7ee602@kaod.org>
Date: Mon, 22 Jun 2020 14:34:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620162818.22340-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11918776416077974415
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekvddgheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkeeirddvuddtrdduhedvrddvgeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeljedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.34.1; envelope-from=clg@kaod.org;
 helo=3.mo173.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 08:34:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O69nkxnkzc1o

On 6/20/20 6:28 PM, Philippe Mathieu-Daudé wrote:
> AspeedBoardState seems crippled. We use incorrectly 2
> different structures to do the same thing. Merge them
> altogether:
> - Move AspeedMachine fields to AspeedBoardState
> - AspeedBoardState is now QOM
> - Remove unused AspeedMachine

I like that but maybe we should rename AspeedBoardState in AspeedMachine ? 
The naming would be more consistent.

Thanks,

C. 

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/arm/aspeed.h |  8 +-------
>  hw/arm/aspeed.c         | 11 +++++++----
>  2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index 95b4daece8..9c9bac1263 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -15,13 +15,7 @@ typedef struct AspeedBoardState AspeedBoardState;
>  
>  #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
>  #define ASPEED_MACHINE(obj) \
> -    OBJECT_CHECK(AspeedMachine, (obj), TYPE_ASPEED_MACHINE)
> -
> -typedef struct AspeedMachine {
> -    MachineState parent_obj;
> -
> -    bool mmio_exec;
> -} AspeedMachine;
> +    OBJECT_CHECK(AspeedBoardState, (obj), TYPE_ASPEED_MACHINE)
>  
>  #define ASPEED_MAC0_ON   (1 << 0)
>  #define ASPEED_MAC1_ON   (1 << 1)
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 31765792a2..6b7533aeee 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -33,9 +33,14 @@ static struct arm_boot_info aspeed_board_binfo = {
>  };
>  
>  struct AspeedBoardState {
> +    /* Private */
> +    MachineState parent_obj;
> +    /* Public */
> +
>      AspeedSoCState soc;
>      MemoryRegion ram_container;
>      MemoryRegion max_ram;
> +    bool mmio_exec;
>  };
>  
>  /* Palmetto hardware value: 0x120CE416 */
> @@ -253,7 +258,7 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
>  
>  static void aspeed_machine_init(MachineState *machine)
>  {
> -    AspeedBoardState *bmc;
> +    AspeedBoardState *bmc = ASPEED_MACHINE(machine);
>      AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
>      AspeedSoCClass *sc;
>      DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
> @@ -261,8 +266,6 @@ static void aspeed_machine_init(MachineState *machine)
>      int i;
>      NICInfo *nd = &nd_table[0];
>  
> -    bmc = g_new0(AspeedBoardState, 1);
> -
>      memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
>                         4 * GiB);
>      memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
> @@ -751,7 +754,7 @@ static const TypeInfo aspeed_machine_types[] = {
>      }, {
>          .name          = TYPE_ASPEED_MACHINE,
>          .parent        = TYPE_MACHINE,
> -        .instance_size = sizeof(AspeedMachine),
> +        .instance_size = sizeof(AspeedBoardState),
>          .instance_init = aspeed_machine_instance_init,
>          .class_size    = sizeof(AspeedMachineClass),
>          .class_init    = aspeed_machine_class_init,
> 

