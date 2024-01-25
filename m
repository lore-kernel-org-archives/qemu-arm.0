Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp674733ejq;
        Wed, 24 Jan 2024 18:29:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1iMZcFScYuLWkbMLyl0K/gquVuW6SioxVS1/QNLSQtJNZ6vb1c2aPwZEmFXWuva6wGX+w
X-Received: by 2002:a05:620a:5221:b0:783:85fc:e17d with SMTP id dc33-20020a05620a522100b0078385fce17dmr329457qkb.52.1706149756409;
        Wed, 24 Jan 2024 18:29:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706149756; cv=none;
        d=google.com; s=arc-20160816;
        b=wWfEQ01kn8e8FeiuLCs34qDl6ttZRjlWAEQqoI8HHU+8pmyorcdecI6mk7nF3+zZwZ
         5ypwbRjv+ebcdGsQImb/7uwBUVDO11opSRBmTCk4JcnK2KDHgx096/JJbJU/VF3OD3FE
         +vP/2Z3khf7YrVBbFpu1POzf0fv1Yt+inx9HNlAFnLR5w9LYmudAAPTUQt/1uEVp1uMQ
         FVPR9f7vsXbp2m0eWuFFxSddUutBtxF1G54IjV1s8T8Z4rXl4yj5AGT67P/G3kDKMJDw
         ADXIavEteq2OxyGcQpgaJKPCmBPPje9bAeAq+jIb8lAVK1o1wWQgvEsPMxl1CvdYiMtd
         BUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2sbOvcfEWWEK53LE7l0I3Dcz+BF6OyIsjlFHOT7/sAs=;
        fh=tvSoKfKG0C5+rZg70buX4YLSasjjtzKPCVsIOCyBYc8=;
        b=aGnldNWB6uTLlfTWX/GvFjod64Yn4Q1R3czPLyNruXi9xY3s++oDuuiggga2AGQDI1
         w0QXJrG43lRYi9F0m+AmMwxswbAhLEIfsb7APt+qfF2ZCj/m80p+rlLrTcREyprdgIdq
         iXoJ99dWJZT5kIraexyCCpQMImwBSn9g4pAf2Zj1sF97tpZ8IA6P/Pbg+frBbCY9+sXp
         Ur9ymbMddqVEDzYakVSiqUm58EXxFZNfONu0uMzc+yLcj5X3ObIuy3/WSw2jWWWSYh6H
         QYN0F2mj2o6w3CnV/l3NXSP21JXMwLaAH0M145uaFX7HvD2WJhHvrSURtYtFTe13YRI9
         Tkfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jv0wnE5a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05620a29cd00b0078158ded522si12146925qkp.635.2024.01.24.18.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 18:29:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jv0wnE5a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSpUC-0001NL-Jr; Wed, 24 Jan 2024 21:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpUA-0001Mr-F9
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:28:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpU9-0002qI-4H
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706149736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2sbOvcfEWWEK53LE7l0I3Dcz+BF6OyIsjlFHOT7/sAs=;
 b=Jv0wnE5avDt3/pTiy02XTKeX1bUdJyum09UVGZnPdC9gkYk1afF86sKf6F1X7udx2HKaPF
 EBOelkpreqWfK+U4N7Xvzp7pZtVjy0DbZQZeFdjtFWCb2tAPzn2p5w/spb5faowKiqOfzI
 9LvRi4d7dAQA9p9XUcW+USSX9HlAlr0=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-Vaj240mJOQWBmwWkNPM7sw-1; Wed, 24 Jan 2024 21:28:55 -0500
X-MC-Unique: Vaj240mJOQWBmwWkNPM7sw-1
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-5c5c8ef7d0dso3656022a12.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 18:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706149734; x=1706754534;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2sbOvcfEWWEK53LE7l0I3Dcz+BF6OyIsjlFHOT7/sAs=;
 b=NxSxm1bOgvv2XX0lPu5w+xcMSzN6vnkO9yM3hXDovGgg1fRbEResnQcLRDp+/nqNGt
 XiAt3SP3Gl2pKvhn8TCuq+jwhM4jhXG9Sk70lzzG586mMy5NG4PAQwf0mb9EVWUIv6yf
 ghUGAqAKp8LeI88ItJhKPQjWJ1KiblukTnSdp6zjdAjdEdx5w6ApbAy4poYHFh9bFNmY
 O/KvlHM2XPiYb9wfTj7SAVFYbz2XOON31WS2hxqkcf1n161gcwNIgorZTDkdcSTn6uWv
 zLhg5HK2iMo+aFCkaJwjE/zwgPltczRU7LA3a/B1OkIJsxL3OpI4CYK47jYbg7EjfLKd
 pzgg==
X-Gm-Message-State: AOJu0Yzu56IzlzCK6r/dIq0pGwhHepZd54Ve+rofMyk0NyrF0iIbtA8T
 EyfSkP0pDbBY1A5Th/D3hhSj8DHCeSSTx1KvW0Rqzrh8/rnyFqcaQIbHDX8MWPHD5k0h3PUgIj5
 GhogAMFV4xY+TseeIJDLgrELaq9dN23ZjngNwQAmZ/4TsxJApHA==
X-Received: by 2002:a05:6a20:3d85:b0:19c:7690:12ec with SMTP id
 s5-20020a056a203d8500b0019c769012ecmr49635pzi.5.1706149734092; 
 Wed, 24 Jan 2024 18:28:54 -0800 (PST)
X-Received: by 2002:a05:6a20:3d85:b0:19c:7690:12ec with SMTP id
 s5-20020a056a203d8500b0019c769012ecmr49629pzi.5.1706149733816; 
 Wed, 24 Jan 2024 18:28:53 -0800 (PST)
Received: from [10.72.112.202] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170902b7c100b001d75db0ae21sm4696611plz.170.2024.01.24.18.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 18:28:53 -0800 (PST)
Message-ID: <b71999c2-2b6b-4996-827d-577b5ab65daa@redhat.com>
Date: Thu, 25 Jan 2024 12:28:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] hw/arm/aspeed: Check for CPU types in
 machine_run_board_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20240123224842.18485-1-philmd@linaro.org>
 <20240123224842.18485-6-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240123224842.18485-6-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: sq6lWk5q9B5K

On 1/24/24 08:48, Philippe Mathieu-Daudé wrote:
> Aspeed SoCs use a single CPU type (set as AspeedSoCClass::cpu_type).
> Convert it to a NULL-terminated array (of a single non-NULL element).
> 
> Set MachineClass::valid_cpu_types[] to use the common machine code
> to provide hints when the requested CPU is invalid (see commit
> e702cbc19e ("machine: Improve is_cpu_type_supported()").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/aspeed_soc.h |  3 ++-
>   hw/arm/aspeed.c             |  1 +
>   hw/arm/aspeed_ast10x0.c     |  6 +++++-
>   hw/arm/aspeed_ast2400.c     | 12 ++++++++++--
>   hw/arm/aspeed_ast2600.c     |  6 +++++-
>   hw/arm/aspeed_soc_common.c  |  5 ++++-
>   6 files changed, 27 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

