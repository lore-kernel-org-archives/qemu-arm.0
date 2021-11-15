Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5886926lfk;
        Mon, 15 Nov 2021 05:48:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzz6UHcSK6MKxr3PIaAFwWgmvInp3YO0WS0p5YXuPFueSyoghrJXFXlp/ZCVRR3KJ2Xz81R
X-Received: by 2002:ab0:44e:: with SMTP id 72mr59091140uav.121.1636984114701;
        Mon, 15 Nov 2021 05:48:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636984114; cv=none;
        d=google.com; s=arc-20160816;
        b=skYgeH3x1hKWis9ZsdgS/ufCub0R4rwBSomwlzTHrEHRsTYiIs72pJIJYQpYqr5wzP
         Vi0CCrE4Wf0b0ZonO8XG4wjpJOlHUUDdw1ABaCx8fHRkKyUbJb4Q0zzRiv7OI4GgachM
         Y+E4hhvQXUJOPq48D85q+tr2pi3D6Ig38GSJ/k6Fv+1HfT7v65CoSDitDOHyv1SSqZVg
         SRTTS1x0HUGSXDK+0brKxtUjqqhaKXIAHm7lHyG3E8jRRD5EtIriQIgra49LRRtXbPld
         fp5reWPjdDq+dFZe1Rq/eLiwrTn0bIn6IcVO77ZuloILVx4mWlu+7UvUaHPYObv+t7Tr
         6o9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=39X9PHyLgG5tKgwq8KHgl7E9/h1ZlQME+TsbaEXLlrw=;
        b=Fr/c0fi6PH298rkm/jM+OQq632P2nTflRhbCU8wUcN8R8NcDNo/cqA65T8KfoAw7Gh
         kv7JdWyDPoA6KqCc017/E1oTL9AjbSXF2ZTvU/yN/mXBdNb1wEgA4I+Gz/ZOI+EpBmlI
         nxXlp8mS6KfheG29sb3ifz73Iaa+z6YcEVUh2A1jWYH6sdiQFjHv4ISnME/Gd6im0B61
         w+MDCsh56/zaSQ/XhNei1IH6+b0RieE+2HO3gub1YT4twoea1/e2IHTDbx/KV1RMC4WT
         IzFWOFhjq2Tpw8dSB60/tJlcb3E+/Gt1soPqZpEmrT61C+F+vudQBkLPe7JprFekEprD
         cmIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z51v133k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si34479761vsk.40.2021.11.15.05.48.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Nov 2021 05:48:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z51v133k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmcLa-0000OB-3h
	for alex.bennee@linaro.org; Mon, 15 Nov 2021 08:48:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmcLH-000054-Oy
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 08:48:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmcLF-0005tU-FS
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 08:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636984091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=39X9PHyLgG5tKgwq8KHgl7E9/h1ZlQME+TsbaEXLlrw=;
 b=Z51v133kjJYihUJ6S1o9quCBm7IqkELHTcW9m+8iTI8fQzl3HZdooimPGAi448HMEXMlk7
 o+lsFoZWQ1hepvyA0muGXofkZv71mq/jFC4np8XUo2TIAW+isI3YLKhzVYZ45K/KrUvdSS
 ZlZLQcw30F/563mUhoQ5Xy/WIMEcd5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-Xv4NxenOOdGGoggfrfxtoA-1; Mon, 15 Nov 2021 08:48:08 -0500
X-MC-Unique: Xv4NxenOOdGGoggfrfxtoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC53719251A2;
 Mon, 15 Nov 2021 13:48:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC61F5F4EF;
 Mon, 15 Nov 2021 13:48:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4854011380A7; Mon, 15 Nov 2021 14:48:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
 <CAFEAcA-dxXdsaKP5G7nhSROqwsRS9=r44G7rvNpEKbjgX8BbGQ@mail.gmail.com>
Date: Mon, 15 Nov 2021 14:48:02 +0100
In-Reply-To: <CAFEAcA-dxXdsaKP5G7nhSROqwsRS9=r44G7rvNpEKbjgX8BbGQ@mail.gmail.com>
 (Peter Maydell's message of "Mon, 15 Nov 2021 13:38:43 +0000")
Message-ID: <875ystjzsd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, sundeep.lkml@gmail.com, qemu-block@nongnu.org,
 andrew.smirnov@gmail.com, hskinnemoen@google.com, joel@jms.id.au,
 atar4qemu@gmail.com, alistair@alistair23.me, b.galvani@gmail.com,
 nieklinnenbank@gmail.com, qemu-arm@nongnu.org, clg@kaod.org, kwolf@redhat.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, f4bug@amsat.org,
 Andrew.Baumann@microsoft.com, jcd@tribudubois.net, kfting@nuvoton.com,
 hreitz@redhat.com, palmer@dabbelt.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qz1wjBYjmH8Z

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 15 Nov 2021 at 12:55, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> drive_get_next() is basically a bad idea.  It returns the "next" block
>> backend of a certain interface type.  "Next" means bus=0,unit=N, where
>> subsequent calls count N up from zero, per interface type.
>>
>> This lets you define unit numbers implicitly by execution order.  If the
>> order changes, or new calls appear "in the middle", unit numbers change.
>> ABI break.  Hard to spot in review.
>>
>> Explicit is better than implicit: use drive_get() directly.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/sysemu/blockdev.h           |  1 -
>>  blockdev.c                          | 10 ----------
>>  hw/arm/aspeed.c                     | 21 +++++++++++++--------
>>  hw/arm/cubieboard.c                 |  2 +-
>>  hw/arm/imx25_pdk.c                  |  2 +-
>>  hw/arm/integratorcp.c               |  2 +-
>>  hw/arm/mcimx6ul-evk.c               |  2 +-
>>  hw/arm/mcimx7d-sabre.c              |  2 +-
>>  hw/arm/msf2-som.c                   |  2 +-
>>  hw/arm/npcm7xx_boards.c             |  6 +++---
>>  hw/arm/orangepi.c                   |  2 +-
>>  hw/arm/raspi.c                      |  2 +-
>>  hw/arm/realview.c                   |  2 +-
>>  hw/arm/sabrelite.c                  |  2 +-
>>  hw/arm/versatilepb.c                |  4 ++--
>>  hw/arm/vexpress.c                   |  6 +++---
>>  hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>>  hw/arm/xlnx-versal-virt.c           |  3 ++-
>>  hw/arm/xlnx-zcu102.c                |  6 +++---
>>  hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>>  hw/misc/sifive_u_otp.c              |  2 +-
>>  hw/riscv/microchip_pfsoc.c          |  2 +-
>>  hw/sparc64/niagara.c                |  2 +-
>>  23 files changed, 49 insertions(+), 52 deletions(-)
>
> This would be easier to review if it didn't try to change all of
> these board/SoC models at once. Each one of them is entirely
> separate review work.

Happy to split, but first I'd like to get some advice on the part I'm
unsure about; see my cover letter.

