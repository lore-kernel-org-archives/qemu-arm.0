Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6301136lfg;
        Thu, 4 Mar 2021 06:50:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLoQ4tCETUehGsCi+LHHSZ8M7n48kXVDAqUT5B57hqlUD9NJPo0R47Yd0VB/jTS3ee6cdU
X-Received: by 2002:a02:3846:: with SMTP id v6mr4516158jae.7.1614869443652;
        Thu, 04 Mar 2021 06:50:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614869443; cv=none;
        d=google.com; s=arc-20160816;
        b=kKizTfnqj6eYAq9wA48CxLh6+4Rzum9zD4xvWjeygBnE4xkAvGKlAm7SiLLV04r7sS
         n6MntFwE3AMmTayUWpfGsNEiuobzy5/D9/g4X5JM7EDUQ3+HcleogiVMKX8x5Vw6/bTj
         NsUlzZW6cmByZzDjoPlvIDfoZwSbiPPh4bgymUEfbul3l+USYEw3QQXt41l/fGpHRX/o
         VxRJhaTFzm0EBeWMfW87BV6ZSw1O4dtuJZkIsxsX31JBUKStqCvnJy08EGvz0PgK6no3
         E+VdxVJcB8H3BZfwhjQQplwetou0OK0OpDcoBVb+Mx9MOyFB7prFL2by/QXPlqwtYxqd
         erOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vD4LG8XTdkx50eIzR1+D7fIVuihnIWuBJ+K678poNN8=;
        b=Kz8VDuxsV9ejP38FtkcCk7/8vkSmHha4vH/iHyBnrJV34tPiBVjrA50TFc14uo3ofr
         ipNJ3McLOY8mA9QjiJoAtUaaM3iY0+Y87H0SaQHVi5jtXpYFltIYkDTCNsj817h8WTu2
         JB8otXOwRKz8wCm7pO6/lWu2nMgENxPC50wwiAUkOY+cA6+LS3ZxKv3VMkLJQqnz3wAt
         rLoOpa77dgNSD9nBpg233DASSd1sSmSwMvyhUcHb762IGHjM2pTZvYRQ4hdq1Q3wsyA+
         hmGRTTWyJrC2G1MBL/BhBDtQ7WhMs4PbQQUY4ng7JI7+H3/OCQDg5JYnFPxIWAoVpCp0
         tb4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cS+QLNLz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si25144414ild.147.2021.03.04.06.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 06:50:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cS+QLNLz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHpJK-0003NB-SU
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 09:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHpGj-0001U8-GG
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHpGg-0007oS-PK
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614869278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vD4LG8XTdkx50eIzR1+D7fIVuihnIWuBJ+K678poNN8=;
 b=cS+QLNLzmLI//1nnLH8o26xgKoeJgVbSfZI62SYaRff4ddPA1ur4fKnS8RMSM4EDR+M1t2
 s3F7HI6XuGVAn5JlDocbz+8Pu+0HaKrjH6jKfX19r+cxEJICm7ejigrEAuZNM8tsU3B78D
 zPtT3G3p0oW9IUSLBqsEE4kSde6Ur60=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-PzMm6BVyOce4BKfXn8z4Vg-1; Thu, 04 Mar 2021 09:47:54 -0500
X-MC-Unique: PzMm6BVyOce4BKfXn8z4Vg-1
Received: by mail-wm1-f72.google.com with SMTP id 73so4540652wma.3
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 06:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vD4LG8XTdkx50eIzR1+D7fIVuihnIWuBJ+K678poNN8=;
 b=QU+Ggk1HfMvAwRvn5322mgkS7m6mvPGOJwMvH3Vkeq6a40CkL5tv7LHn//f0ZnhC1U
 Qfl0B1Kvs+o0h4gV8CgadX6Cmgpf4Bk0512SrsKzspE9IjJtqbZP8pMPQCuDrAyu2leK
 G2J3IPGAbfFEk6/eiLiBB4Ga51gyQrNh5FitLn+1OHNo9zZhZIR37ssdQDruXEyEFLOE
 zgQ6Q53UIzDH3s0cvrEkhE+QZiu+FNaCl9Vnzj4yW4UlmjO7jOYXes4qfBaQK/M+o95m
 ShdvTLzBGMFoDXeW2f0lBHlbHgPcmW0+D2b4fH2JfVu7oOBo2Bv45zKMnCp83+93uz4u
 JZmQ==
X-Gm-Message-State: AOAM531hccAdJY9CuiR0TyDw0RdJi/gPZoXXlxkti8DTSt3QFPDA2S3i
 QsgxpokiiRLp/zaC30MqqQsr+5RVU9tJoZ84yzBvCJywbOS6iE9SPYxdt67h5Tw5rA7gSM5rRCt
 1GaR2M62ADNPksGU=
X-Received: by 2002:a05:600c:289:: with SMTP id
 9mr4345520wmk.135.1614869273426; 
 Thu, 04 Mar 2021 06:47:53 -0800 (PST)
X-Received: by 2002:a05:600c:289:: with SMTP id
 9mr4345478wmk.135.1614869273255; 
 Thu, 04 Mar 2021 06:47:53 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y9sm33916942wrm.88.2021.03.04.06.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 06:47:52 -0800 (PST)
Subject: Re: [PATCH v2 0/2] QOM type names and QAPI
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210304140229.575481-1-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b0bdf980-3f43-8619-2e5f-ac5b03c328a4@redhat.com>
Date: Thu, 4 Mar 2021 15:47:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304140229.575481-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 frederic.konrad@adacore.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 jcd@tribudubois.net, qemu-block@nongnu.org, quintela@redhat.com,
 andrew.smirnov@gmail.com, marcandre.lureau@redhat.com, atar4qemu@gmail.com,
 ehabkost@redhat.com, alistair@alistair23.me, dgilbert@redhat.com,
 chouteau@adacore.com, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 jsnow@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wBCxZ6tCIUpW

On 04/03/21 15:02, Markus Armbruster wrote:
> [*] Paolo's "[PATCH 04/25] keyval: accept escaped commas in implied
> option" provides for comma-quoting.  I'm ignoring it here for brevity.
> I assure you it doesn't weaken my argument.

I even agree about that, for what it's worth.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


> 
> Markus Armbruster (2):
>    hw: Replace anti-social QOM type names
>    memory: Drop "qemu:" prefix from QOM memory region type names
> 
>   include/exec/memory.h                        |  4 ++--
>   include/hw/arm/armv7m.h                      |  2 +-
>   include/hw/arm/fsl-imx25.h                   |  2 +-
>   include/hw/arm/fsl-imx31.h                   |  2 +-
>   include/hw/arm/fsl-imx6.h                    |  2 +-
>   include/hw/arm/fsl-imx6ul.h                  |  2 +-
>   include/hw/arm/fsl-imx7.h                    |  2 +-
>   include/hw/arm/xlnx-zynqmp.h                 |  2 +-
>   include/hw/cris/etraxfs.h                    |  2 +-
>   include/hw/i386/ich9.h                       |  2 +-
>   include/hw/misc/grlib_ahb_apb_pnp.h          |  4 ++--
>   include/hw/misc/zynq-xadc.h                  |  2 +-
>   include/hw/register.h                        |  2 +-
>   include/hw/sparc/grlib.h                     |  6 +++---
>   hw/arm/xilinx_zynq.c                         |  2 +-
>   hw/audio/cs4231.c                            |  2 +-
>   hw/block/fdc.c                               |  4 ++--
>   hw/char/etraxfs_ser.c                        |  2 +-
>   hw/cris/axis_dev88.c                         |  6 +++---
>   hw/display/tcx.c                             |  2 +-
>   hw/intc/etraxfs_pic.c                        |  2 +-
>   hw/microblaze/xlnx-zynqmp-pmu.c              |  2 +-
>   hw/misc/zynq_slcr.c                          |  2 +-
>   hw/sparc/sun4m.c                             | 12 ++++++------
>   hw/timer/etraxfs_timer.c                     |  2 +-
>   softmmu/vl.c                                 |  2 +-
>   tests/vmstate-static-checker-data/dump1.json |  4 ++--
>   tests/vmstate-static-checker-data/dump2.json |  4 ++--
>   28 files changed, 42 insertions(+), 42 deletions(-)
> 

