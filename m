Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp484516ejb;
        Wed, 24 Apr 2024 03:06:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWa0GC8gK9dsZ7MnOTZ0joS/TY1p2iSXhpbggWybtdomGqqp9rYy7g7kXef/4crGntfrRAahIqY+FCw3y/ZFu/y649cGbG5
X-Google-Smtp-Source: AGHT+IHYTJJC/HP2iD0EmbFi5GO33Omq2ldWjNKjEg83d6ueEs4AWRak0qtir3pXuJgkl1MvcDRq
X-Received: by 2002:a05:620a:2551:b0:790:9174:1e2a with SMTP id s17-20020a05620a255100b0079091741e2amr929760qko.26.1713953197853;
        Wed, 24 Apr 2024 03:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713953197; cv=none;
        d=google.com; s=arc-20160816;
        b=ecXQb+l12vs0mqiLjywOTVIMBZSYx6ANzBXzlvqcnsWY/MsZbUCY37UY7xdUlu4WdA
         Bfy87RsClsSr/Ihi1/No/GbN9WAnTcE87i2MyCSfC4Icj1uVTMe9UoS+MAtbu5OL6+2b
         KbPnIZixVlNNYvvXlcAIVhDGBh9MBC55aMzVfdlSrvp76AiNnRtIE2lc4y0sseEEoeOc
         zxwJj827in9+luIHOpy//n5j7+l72RpcrZIdpamiSt9UggBl73syNkHf4V2yFNDwLYqB
         hQmlerP8JomzRGNPwiV+a7OUetBs/JsjBihKl/v2+A28ie9EfaUlQgX9ToGVvx16mMzv
         HxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RJeq6fIxiiTYHpTB+2A2F57sm5CMyZXLKrdNd8XZ0VU=;
        fh=U7oG2q3W9OE9kSW4UYryCeU4dXYDUCuZzffpR5zy1MQ=;
        b=uQF6hW1D+qKgXwS4cMDMvtMPpVdSueNVHrbsw9U/wswazyyE015LaLR+gOHwQ1/Shr
         XduaDwAQgH6RbnTDwkIMdL2YZWD4XOUap5m3XOmGNqbVIcaHjrl6cyLjYsEvEDP7Q7WG
         1U9O5SuLRiSZmuxBCooOWutDscK+yWZiSUKlQ3jyOJDuM9qFiAGtStc1VRLssJ6EpbVO
         Q5XRYd1SFmP5M5bRtVXIytPxk3xZEXe0b7xCxpwPaJinH5SlAT3PsCXmsEc6l+2TclJ4
         Afi7wgH9KWcFTiLaFbcH4hI7VKzcgYfplBNk68gLkU5WltPb5E8wCEWROdGW0iYGH+jp
         YWGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NDqyptc+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pe16-20020a05620a851000b0078e5f1704desi14433921qkn.224.2024.04.24.03.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 03:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NDqyptc+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzZVs-000086-8f; Wed, 24 Apr 2024 06:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzZVq-00007e-9z
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 06:06:02 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzZVo-0001NM-Cp
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 06:06:02 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-34665dd7610so3473434f8f.3
 for <qemu-arm@nongnu.org>; Wed, 24 Apr 2024 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713953158; x=1714557958; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RJeq6fIxiiTYHpTB+2A2F57sm5CMyZXLKrdNd8XZ0VU=;
 b=NDqyptc+ZNJMakhN1Dt5p642bao1ACFdV4WFl9RJ/MA4npzInJjvC6BaDwZm5VcMiy
 zufFcb/2Mzwcg5e0bzfL7Z8eT62U2ma55GZ6gZgEVvkjDge0/jk7kVdFPaOnsKdWHEPe
 o0D7DE/roT4pyHBevgBjUYmBBgCziz5H7SdRqstTMH9jyg8xTZP+kH1QbD8BzQxiEEHV
 3YIHG+PAGhQv7Rbube16Pg5wf/eBDYi52H5yV3B2w4BYYChiRawMGyzdTVPtVsb9rB3Q
 q9QsKHCfD3eDmja0BOVAqGDFDWdBQJ7BHLEmbYhPss0flpOUO9G01WSloOgU6oS/dLue
 Qrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713953158; x=1714557958;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RJeq6fIxiiTYHpTB+2A2F57sm5CMyZXLKrdNd8XZ0VU=;
 b=BHhHsmhP1VG7KWC/Qq1rZJuPk1y+sUc+RlMcMM9uqe4PN/LY1wQghavYTALVlp5xMe
 AKb+EGlVs+fmpX40KlbWJES7JVNunBAvV2cwXZjyuBXFwyFQtej3uYKq0KcPtre+mGmk
 h1pTEQXcryQhOQAadbmZXqKVTJ5z0ATcH3XoSZT2zEheUsDLQL3c4+6TeH05pbHYIIaE
 OQN/Ya4HDpjgENK9dE++NQOc7p2P6/WoaYHQIx2Bf5+HkowR0tvwnGpQIjLdk1InIlQy
 vrONF91oNXtCCKJ2gR0bugAXjR0w54gn+unSNiX5KyoprUB2pF+W6/UvkqNiCJcf5lKY
 OMUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC4W+k+m53Vn1QqnX2Nf+VnsyBs0AeI74IvKCktIQBVYpWJvJ8pUDEYGlvlqEXavia/IJEaRFehp/oqh44oE02Ui2q
X-Gm-Message-State: AOJu0YzExBMCA9svUCWdb1KcuPnMJw/w8pOyqEAPpu7QYLfzTb3kJh8N
 JQkwmxMAmLEGpIREKUaZo61wfKp5Nu66fjrJxKznoOqen/h8ViMa+E6OdRNUn3w=
X-Received: by 2002:adf:f809:0:b0:33e:7f51:c2f8 with SMTP id
 s9-20020adff809000000b0033e7f51c2f8mr1482384wrp.36.1713953158508; 
 Wed, 24 Apr 2024 03:05:58 -0700 (PDT)
Received: from [192.168.1.102] (mon75-h03-176-184-51-42.dsl.sta.abo.bbox.fr.
 [176.184.51.42]) by smtp.gmail.com with ESMTPSA id
 j13-20020a056000124d00b0034b7906c716sm3564205wrx.106.2024.04.24.03.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 03:05:58 -0700 (PDT)
Message-ID: <ac66952e-4281-4250-96f4-dc3d5b518d24@linaro.org>
Date: Wed, 24 Apr 2024 12:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: Provide MemReentrancyGuard * to qemu_new_nic()
To: P J P <pj.pandit@yahoo.co.in>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <20230601031859.7115-2-akihiko.odaki@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20230601031859.7115-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y/aRyt9flhsD

Hi,

On 1/6/23 05:18, Akihiko Odaki wrote:
> Recently MemReentrancyGuard was added to DeviceState to record that the
> device is engaging in I/O. The network device backend needs to update it
> when delivering a packet to a device.
> 
> In preparation for such a change, add MemReentrancyGuard * as a
> parameter of qemu_new_nic().

An user on IRC asked if this patch is related/fixing CVE-2021-20255,
any clue?

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/net/net.h             | 1 +
>   hw/net/allwinner-sun8i-emac.c | 3 ++-
>   hw/net/allwinner_emac.c       | 3 ++-
>   hw/net/cadence_gem.c          | 3 ++-
>   hw/net/dp8393x.c              | 3 ++-
>   hw/net/e1000.c                | 3 ++-
>   hw/net/e1000e.c               | 2 +-
>   hw/net/eepro100.c             | 4 +++-
>   hw/net/etraxfs_eth.c          | 3 ++-
>   hw/net/fsl_etsec/etsec.c      | 3 ++-
>   hw/net/ftgmac100.c            | 3 ++-
>   hw/net/i82596.c               | 2 +-
>   hw/net/igb.c                  | 2 +-
>   hw/net/imx_fec.c              | 2 +-
>   hw/net/lan9118.c              | 3 ++-
>   hw/net/mcf_fec.c              | 3 ++-
>   hw/net/mipsnet.c              | 3 ++-
>   hw/net/msf2-emac.c            | 3 ++-
>   hw/net/mv88w8618_eth.c        | 3 ++-
>   hw/net/ne2000-isa.c           | 3 ++-
>   hw/net/ne2000-pci.c           | 3 ++-
>   hw/net/npcm7xx_emc.c          | 3 ++-
>   hw/net/opencores_eth.c        | 3 ++-
>   hw/net/pcnet.c                | 3 ++-
>   hw/net/rocker/rocker_fp.c     | 4 ++--
>   hw/net/rtl8139.c              | 3 ++-
>   hw/net/smc91c111.c            | 3 ++-
>   hw/net/spapr_llan.c           | 3 ++-
>   hw/net/stellaris_enet.c       | 3 ++-
>   hw/net/sungem.c               | 2 +-
>   hw/net/sunhme.c               | 3 ++-
>   hw/net/tulip.c                | 3 ++-
>   hw/net/virtio-net.c           | 6 ++++--
>   hw/net/vmxnet3.c              | 2 +-
>   hw/net/xen_nic.c              | 4 ++--
>   hw/net/xgmac.c                | 3 ++-
>   hw/net/xilinx_axienet.c       | 3 ++-
>   hw/net/xilinx_ethlite.c       | 3 ++-
>   hw/usb/dev-network.c          | 3 ++-
>   net/net.c                     | 1 +
>   40 files changed, 75 insertions(+), 41 deletions(-)

