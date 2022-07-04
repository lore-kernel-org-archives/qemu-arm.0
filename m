Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3277459lft;
        Mon, 4 Jul 2022 07:42:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sm9VfkgmjgXgDGOSxDEvpcPrMLmCnU4gBAc47ZqxjiHMlRJ/CNL1UUdf+xA2mvMHOfUJsN
X-Received: by 2002:a05:620a:24ca:b0:6af:2462:e61e with SMTP id m10-20020a05620a24ca00b006af2462e61emr20111438qkn.755.1656945728504;
        Mon, 04 Jul 2022 07:42:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656945728; cv=none;
        d=google.com; s=arc-20160816;
        b=yRYjMceBKAHxNocP1B4REqr31taXJAzNZDbQEUdc4sYdpxDO76clQjMZEdySRlApjJ
         /HODUYwPfbUP5IGC690uMoXFPa1pwhU/GKq6erSOBp29squy6DVa7et6DiyXWuceTKT6
         Ek7a/OphP26/OOa0APGT7hdQT/S2B/J8vq0ipcFtQNo5W7mSQTibBoWaEzX3X/zzBguM
         p+0ckdepTO70Dg9vXGUnkGfaw1xNdqkKOprBUKS4LuzK5PGzk1BXudaseQewq4EuE3XF
         wOPr7QKh55PVtxS7JAUip/tgQbgfNHvw/4uopzGxmKrwNUs/aZ3f+luOmaWhCcqJDi27
         yXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3YJBIQ3KZS2kosDWmEX4LYFVVC9WYJNZL4/cJiH+J70=;
        b=rxkqH4KCcOe22YY8+s1+/P/SMKNZRm386l61Q03LqxQiqci3JNCJlSBAodDdChDZx3
         k+XamogEJU0JS3ing5jFSOZpJxLhktMyxSYmoS5t3CO03drPDyyVM1sBOQ/AokdDlHQH
         NaXX+njoLiAgC6DkPmJDaAXQwqr3dOC9Ol8zzIAzKN4AiS35sORiMLUfWAjDSd37trgQ
         sf+BpO0rpoc+m+J7e+Qo8kBlqDiK+j1KfIQmwQbdY4mwPwnveOLTBqXWqvOp4a+22IcT
         TOtt+OV9x7MnhlZyX/ggpRH8dzo2Q/cdE/usyIqUpxj5gcSSp8cUtFWUdqLG7Njkq7xs
         l8qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OwdfbKzy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd10-20020a056214400a00b00470b60b9bd9si13004747qvb.524.2022.07.04.07.42.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:42:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OwdfbKzy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8NH5-00047W-VX
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8Mgs-0007ur-Uw
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:04:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8Mgp-0001an-FJ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656943478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3YJBIQ3KZS2kosDWmEX4LYFVVC9WYJNZL4/cJiH+J70=;
 b=OwdfbKzy6qal4eYOfSoqVooYFvluX4j9N8N7ahOkDA4myopgQni/DSX60bQumph7AMA1Ah
 8wzJnbwSWPcJVuAUbc6ZBIDRBLWpUOORQR9/V7KQgeUDVCWIjyKSPugqxBvg6abVeZzdIV
 0uxd0T8fnV/3hI8Y9F+8NOFQ9Z7Nfyg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-Xtma31MYM3epKVy-edd5wg-1; Mon, 04 Jul 2022 10:04:37 -0400
X-MC-Unique: Xtma31MYM3epKVy-edd5wg-1
Received: by mail-ej1-f71.google.com with SMTP id
 z7-20020a170906434700b007108b59c212so2067015ejm.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 07:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3YJBIQ3KZS2kosDWmEX4LYFVVC9WYJNZL4/cJiH+J70=;
 b=WznQm9DRB2OJMgGT98WqZzYNRheHOm8chZhb/ThmoPLSBPhuIXFF6E20k5y1s/cmwn
 Lo1ZzOA0XNdY2IXmz7lX65hGVGFmtocE4ykzPHAP5swp9fU46uUapsx58J+gv1yiQgiV
 +5P0SrrrTy/yUKQ0uAv3NzJ+QArMe03JSo/b8AIR3R5LR4ojNHJ4G6A3M9ZfiRYZNUkK
 IYWoUBBn6hQRMqrtGhaDes7ujTeicdC3aux58bajbWvVOHyOJ8tcV2lkrc/lO5bsI3qf
 FSBvB9qd74wF9HS29vAKUmig7fsE+y1OCZ4pgXJBCC2XRpr0Hqfx9cly1hpKuXV4EtvI
 OWgw==
X-Gm-Message-State: AJIora/O4RLLuYDJ/2bvJLxrlIJR1TOpv16ev6bznS69MFJrVL6+APH9
 V5d1TVAvllgmwu3WeLo1CRObYKlDSgCb/6BGl6rqeYuKp+zM6Nq1EJZADwBdqYexRQUby3QqSVp
 X9/W2M1488Lhoui8=
X-Received: by 2002:a17:906:938a:b0:726:942a:54ef with SMTP id
 l10-20020a170906938a00b00726942a54efmr29203730ejx.728.1656943476272; 
 Mon, 04 Jul 2022 07:04:36 -0700 (PDT)
X-Received: by 2002:a17:906:938a:b0:726:942a:54ef with SMTP id
 l10-20020a170906938a00b00726942a54efmr29203661ejx.728.1656943475852; 
 Mon, 04 Jul 2022 07:04:35 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a056402051200b0043a61f6c389sm1726951edv.4.2022.07.04.07.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 07:04:35 -0700 (PDT)
Message-ID: <0b04e477-75ec-cf8d-04b0-e6c6653504ea@redhat.com>
Date: Mon, 4 Jul 2022 16:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/18] block: Add a 'flags' param to blk_pread()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, qemu-riscv@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <laurent@vivier.eu>, "Denis V. Lunev" <den@openvz.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113524.197910-3-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113524.197910-3-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DFSB0D6+dVIA

On 17.05.22 13:35, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement it using generated_co_wrapper.
>
> Callers were updated using this Coccinelle script:
>
>      @@ expression blk, offset, buf, bytes; @@
>      - blk_pread(blk, offset, buf, bytes)
>      + blk_pread(blk, offset, buf, bytes, 0)
>
> It had no effect on hw/block/nand.c, presumably due to the #if, so that
> file was updated manually.
>
> Overly-long lines were then fixed by hand.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block.c                           |  2 +-
>   block/block-backend.c             |  5 +++--
>   block/commit.c                    |  2 +-
>   block/export/fuse.c               |  2 +-
>   hw/arm/allwinner-h3.c             |  2 +-
>   hw/arm/aspeed.c                   |  2 +-
>   hw/block/block.c                  |  2 +-
>   hw/block/fdc.c                    |  6 +++---
>   hw/block/hd-geometry.c            |  2 +-
>   hw/block/m25p80.c                 |  2 +-
>   hw/block/nand.c                   | 12 ++++++------
>   hw/block/onenand.c                | 12 ++++++------
>   hw/ide/atapi.c                    |  4 ++--
>   hw/misc/mac_via.c                 |  2 +-
>   hw/misc/sifive_u_otp.c            |  4 ++--
>   hw/nvram/eeprom_at24c.c           |  2 +-
>   hw/nvram/spapr_nvram.c            |  2 +-
>   hw/nvram/xlnx-bbram.c             |  2 +-
>   hw/nvram/xlnx-efuse.c             |  2 +-
>   hw/ppc/pnv_pnor.c                 |  2 +-
>   hw/sd/sd.c                        |  2 +-
>   include/sysemu/block-backend-io.h |  3 ++-
>   migration/block.c                 |  4 ++--
>   nbd/server.c                      |  4 ++--
>   qemu-img.c                        | 12 ++++++------
>   qemu-io-cmds.c                    |  2 +-
>   tests/unit/test-block-iothread.c  |  4 ++--
>   27 files changed, 52 insertions(+), 50 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

