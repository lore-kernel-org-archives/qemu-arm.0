Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1165513ejb;
        Fri, 15 Sep 2023 04:48:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/1J8qT0U2vTxgbUVbx2NAQqtrjwOhfWNtgdBYR2TieYw5xEOkaOeLrPtv6tACcR172b4f
X-Received: by 2002:ac8:5890:0:b0:410:165:9e5b with SMTP id t16-20020ac85890000000b0041001659e5bmr1640364qta.65.1694778500985;
        Fri, 15 Sep 2023 04:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694778500; cv=none;
        d=google.com; s=arc-20160816;
        b=ARI+yzq9LnjEIxyqzudm3DCkTHdBwnt/mulD7JrJb6v74nVfnZnLYxSoOgB0p8S1+X
         FtaA+OihHztGbHB4SF7buG2dtIBE8Bk01S2KzpDAjPXRssj22cQpaC7sq3VAsi1mndqf
         8j3a+9U21gY+9TgBX+cFpOeZfIN74Ry1LvLezoM0YYuhod1clKtRPBxCuUGXogJa8kSE
         YLRwpLLjfbPoKyvMl/athaCX/P0gBD/nxj9UGq2c+RBWbc/RjobPyp0MuKLA82ECoVaE
         6Nq+Ga3GiacQL0Pybx6glnQDmz6x92pYffuRiHOhpctXTvRmjNPhiKjTVS5Dl8AgHuaq
         hR1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=baQaguqmJ8fxBKT0ReK4WJRQlSZeoJ1kiWH/H24eV6g=;
        fh=12HrSD5zfQ3tBxz0GmaJ1sbmbc07r9vbI8eWDaDNtjs=;
        b=Kxaz9/0fhjR3vqnvV0MIGB7lxwYnAx/VYuLBaUSQJTukI5BVhgWfdR4uZUmGoartMb
         tBxc5SIfL2zXXcNcchbcYOloKil5pIJcJPkK8UHlKOHOxClQYhUvt9eJjdlKOVxwHQ+J
         NTPmWhFrG5jFNuc9nkeE2ZoY2jehv+o1r4G2uALTcKFdc/rsyBb5n5j+VMx41NGk3vso
         WpFBKL5/PPNjnPMcCpNs/vf5NPDZkALQg/qYB9jft8M4y8nXigO1wRrQZ1LVCr98OA/X
         NxwiN49Ugpu+mXv+N8Zmoe//S1lJKTxOIoJ4tofH+if6Q9Ii4mDTAtYRKoPM4aLzShxi
         p5eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i0GeloJA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020a05622a028800b004055a6f662asi2170543qtw.267.2023.09.15.04.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 04:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i0GeloJA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qh7J0-00062l-Qe; Fri, 15 Sep 2023 07:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qh7Iz-000619-SL
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 07:48:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qh7Is-0004Pc-S7
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 07:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694778484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baQaguqmJ8fxBKT0ReK4WJRQlSZeoJ1kiWH/H24eV6g=;
 b=i0GeloJAgSykjMhzUinROB+R/qoT9Nj3u+JMyee2N56igrrKRWz4JFJSvGboAg9KILp4GE
 OnNdSpqGMrN0uw0vO4ND02SFKfyK8U0tE4uZgi9PKL2Dr0ywkDkCQIpiu01y6BAnvrHkTy
 qGbXosIf4rJBeXlzHgpjhGTOf4Nxr4Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-hupnxgfCNRiPoQwQYq6sNQ-1; Fri, 15 Sep 2023 07:48:03 -0400
X-MC-Unique: hupnxgfCNRiPoQwQYq6sNQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40469bcd1eeso12796625e9.2
 for <qemu-arm@nongnu.org>; Fri, 15 Sep 2023 04:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694778482; x=1695383282;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=baQaguqmJ8fxBKT0ReK4WJRQlSZeoJ1kiWH/H24eV6g=;
 b=CRo1hM9hMxCflp2T3GdzEJjPg4HylvrrbZD3JVjKu5Ji8NZjHTr2EGTurpgX4pElbw
 NjrrAT+d1fYBQriAukuZtWNjgpReobGE9u7W6eQlEZ9g7BqzbYsC5FaMiyjohgNCpJ7X
 povOnDt0oDMcsd+/nnOH/6ZfjQrAxBEBCIVQ0aOdlkSQaf5uMO+RD1CBSLYK1kBL0bcy
 1EhzvlPFdLl5yDx4WuApwpPhl9hkhtQ95n7knOiv4nEujVkpV/kUKkv6SJ9wM7sSq1aR
 3gG9ZNr1n5Xo1w2WminuhQKvYJtXhsUDu5D3rItzqbbBC8CQlqiFpVRB4Bs4VILbnaBd
 Kn0A==
X-Gm-Message-State: AOJu0YzXRwZ/iwgmUj2IqRUnqhsNXVAF9vo3PzGEKn309Z0z/p3UPm9U
 sq0OdGmZqwp5zCq6WJ1Tbv7bGWZVQLEroa950SPRnr8hCZ73rffT7ZDzG/pCoqWaNlIGc9tNCku
 t3mqrnCN5KVaK
X-Received: by 2002:a1c:790b:0:b0:401:b493:f7c1 with SMTP id
 l11-20020a1c790b000000b00401b493f7c1mr1292454wme.35.1694778482468; 
 Fri, 15 Sep 2023 04:48:02 -0700 (PDT)
X-Received: by 2002:a1c:790b:0:b0:401:b493:f7c1 with SMTP id
 l11-20020a1c790b000000b00401b493f7c1mr1292420wme.35.1694778482126; 
 Fri, 15 Sep 2023 04:48:02 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 q5-20020a5d6585000000b0031f5f0d0be0sm4274663wru.31.2023.09.15.04.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 04:48:01 -0700 (PDT)
Message-ID: <48e669f3-4fae-e3cd-b436-7f2c989b879a@redhat.com>
Date: Fri, 15 Sep 2023 13:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/18] RFC: Remove deprecated audio features
To: Martin Kletzander <mkletzan@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org
References: <cover.1650874791.git.mkletzan@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: H69jsi+w0I4w

On 4/25/22 10:21, Martin Kletzander wrote:
> I wanted to deal with https://bugzilla.redhat.com/2043498 and I got a
> suggesstion that removing deprecated features could actually make it
> easier to propagate the error.  In the end (last patch) it turns out the
> error is still just reported with error_fatal, so it probably is not
> really needed, but I really wanted to dig into QEMU more and learn some
> of the internals for quite some time now.  So I used the opportunity.
> The one-liner ended up being an 18 patch series which was, for someone
> who has just one commit in QEMU codebase, a pretty challenging task.
> Although I tried my best to do things properly, I am not sure whether I
> handled everything correctly, hence the RFC.

Rebased and queued what's left...  It took a while. :)

Paolo

> Martin Kletzander (18):
>    hw/audio: Remove -soundhw support
>    hw/input/tsc210x: Extract common init code into new function
>    hw/audio: Simplify hda audio init
>    hw/audio/lm4549: Add errp error reporting to init function
>    tests/qtest: Specify audiodev= and -audiodev
>    ui/vnc: Require audiodev=
>    Introduce machine's default-audiodev property
>    audio: Add easy dummy audio initialiser
>    hw/display/xlnx_dp.c: Add audiodev property
>    hw/input/tsc210x.c: Support machine-default audiodev with fallback
>    hw/arm: Support machine-default audiodev with fallback
>    hw/ppc: Support machine-default audiodev with fallback
>    audio: Make AUD_register_card fallible and require audiodev=
>    audio: Require AudioState in AUD_add_capture
>    audio: Be more strict during audio backend initialisation
>    audio: Remove legacy audio environment variables and options
>    audio: Remove unused can_be_default
>    audio/spiceaudio: Fail initialisation when not using spice
> 
>   audio/alsaaudio.c                             |   1 -
>   audio/audio.c                                 | 204 +++----
>   audio/audio.h                                 |   5 +-
>   audio/audio_int.h                             |   1 -
>   audio/audio_legacy.c                          | 555 ------------------
>   audio/coreaudio.m                             |   1 -
>   audio/dbusaudio.c                             |   1 -
>   audio/dsoundaudio.c                           |   1 -
>   audio/jackaudio.c                             |   1 -
>   audio/meson.build                             |   1 -
>   audio/noaudio.c                               |   1 -
>   audio/ossaudio.c                              |   1 -
>   audio/paaudio.c                               |   1 -
>   audio/sdlaudio.c                              |   1 -
>   audio/spiceaudio.c                            |   3 +-
>   audio/wavaudio.c                              |   1 -
>   docs/about/deprecated.rst                     |  24 -
>   docs/about/removed-features.rst               |  27 +
>   docs/qdev-device-use.txt                      |  21 +-
>   docs/replay.txt                               |   2 +-
>   hw/arm/integratorcp.c                         |   8 +-
>   hw/arm/musicpal.c                             |   8 +-
>   hw/arm/omap2.c                                |  11 +-
>   hw/arm/realview.c                             |   3 +
>   hw/arm/spitz.c                                |  10 +-
>   hw/arm/versatilepb.c                          |   3 +
>   hw/arm/vexpress.c                             |   3 +
>   hw/arm/xlnx-zcu102.c                          |   4 +
>   hw/arm/z2.c                                   |  12 +-
>   hw/audio/ac97.c                               |   9 +-
>   hw/audio/adlib.c                              |   9 +-
>   hw/audio/cs4231a.c                            |   8 +-
>   hw/audio/es1370.c                             |   8 +-
>   hw/audio/gus.c                                |   6 +-
>   hw/audio/hda-codec.c                          |  37 +-
>   hw/audio/intel-hda.c                          |  25 +-
>   hw/audio/intel-hda.h                          |   2 +-
>   hw/audio/lm4549.c                             |   7 +-
>   hw/audio/lm4549.h                             |   3 +-
>   hw/audio/meson.build                          |   1 -
>   hw/audio/pcspk.c                              |  15 +-
>   hw/audio/pl041.c                              |   2 +-
>   hw/audio/sb16.c                               |   9 +-
>   hw/audio/soundhw.c                            | 177 ------
>   hw/audio/wm8750.c                             |   5 +-
>   hw/core/machine.c                             |  23 +
>   hw/display/xlnx_dp.c                          |  12 +-
>   hw/input/tsc210x.c                            |  79 ++-
>   hw/ppc/prep.c                                 |   4 +
>   hw/usb/dev-audio.c                            |   5 +-
>   include/hw/audio/soundhw.h                    |  15 -
>   include/hw/boards.h                           |   1 +
>   qemu-options.hx                               |  37 --
>   .../codeconverter/test_regexps.py             |   1 -
>   softmmu/qdev-monitor.c                        |   2 -
>   softmmu/vl.c                                  |  10 -
>   tests/qtest/ac97-test.c                       |   3 +-
>   tests/qtest/es1370-test.c                     |   3 +-
>   tests/qtest/fuzz/generic_fuzz_configs.h       |   6 +-
>   tests/qtest/intel-hda-test.c                  |  15 +-
>   ui/vnc.c                                      |  15 +-
>   61 files changed, 329 insertions(+), 1140 deletions(-)
>   delete mode 100644 audio/audio_legacy.c
>   delete mode 100644 hw/audio/soundhw.c
>   delete mode 100644 include/hw/audio/soundhw.h
> 

