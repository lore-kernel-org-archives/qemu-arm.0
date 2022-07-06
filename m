Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4583185lft;
        Wed, 6 Jul 2022 02:54:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vW9uKII6K/IMmZ7T1+Tr6uwYsMJmFbYnc0PhuxGYYGw0pS48fWu/Q/WlY+NQHjvC3WCZxi
X-Received: by 2002:ad4:594d:0:b0:470:a86f:efe9 with SMTP id eo13-20020ad4594d000000b00470a86fefe9mr34492897qvb.24.1657101254704;
        Wed, 06 Jul 2022 02:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657101254; cv=none;
        d=google.com; s=arc-20160816;
        b=OMhCWQ3vyL1c5LNOkIyUXaliVMul6IAnvtNVXrfqjF0KH0Drw0yz3+E5oFlO8ySH02
         bgsPK47pewfIt6mvKRTKBbCY+B6XGzc8LO7F2nljafBVXgyrMxIhO8h6tExNTZinUteF
         abaJdpHV6RqqC31jElRyc7SJ/tKKsveXPMai9Efj/DA1EGyNuDZPoCmhNuaZutV9mgkO
         gcLXbSw0CHzttV7Ic1AIYhNcp+UnPh87LqBPnwU1rME8W0W0O9SX+FkzJn/cfabbZxcu
         gPGDi9IdVCSWn27QP5kOfPiG/BH5gAgyVgRqFKI/gKum/ChjfdK6SiDn/WYUXXtwfUVi
         zHjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Z3KVOETwHBpgBlP/XTrW1zbDvukK5C5SpzilgdqqDrw=;
        b=GRg5DEgKZbNNGmbqOynfs3Lvgt5KxU+psJUQJjdLjLW2QiIfxQbyQf7ZCga20aYdYG
         sR+Ph0uQHqnEr4jEh3shgpt+h3Lc4oZu08UqUY9fWf/YjiRaXc50LyHG/K9ezkGNunLD
         mEvCMhhum5GJPytotke6eU5xdmwDB3/dW7D2hi0oVg87TNhWdCZG8moaKrxNXt5uOJB2
         kiOARS2lsNx1khimEfAfoEvRlY5tlmG19q79rfhc0Nm8b6Re9agL6TTrsCQxvlXrTaAi
         DgOSWitY2V2b7nFA5ssahVrjsAyGFOLg1iGywzZryDnoXgW2qtpdolFaam6zvu0D1jil
         2fZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HSgDnsHE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a056214202c00b00473246500f7si59153qvf.232.2022.07.06.02.54.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HSgDnsHE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91ja-00053p-6a
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o91IL-00057y-OA
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:26:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o91IF-0000kW-SB
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657099559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3KVOETwHBpgBlP/XTrW1zbDvukK5C5SpzilgdqqDrw=;
 b=HSgDnsHEuOc+L7mv5/61sFn+6RDDC31AyAUuuoAu/Bi23RBTOvmUFsSB1Y79zWEkFSh8t0
 uMFb/JXHO0n9qquYOmqkxqVa8DCR6P/ROehVIgrJ4aj4mlCexAXRp2h6jzzhz/H5Oas5lL
 vikiWPkaTBZ0FTqAKLKaAWMTZs7NnMc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-T4jPpf_hPFu3ngKtvGrnmQ-1; Wed, 06 Jul 2022 05:25:58 -0400
X-MC-Unique: T4jPpf_hPFu3ngKtvGrnmQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y5-20020a056402358500b0043592ac3961so11066159edc.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z3KVOETwHBpgBlP/XTrW1zbDvukK5C5SpzilgdqqDrw=;
 b=ZAWYI3jlgm02TSdPs4yafKveR6vsFG8u7VGvFW/NpCPCLfUsya1gq9kfnk5izId9tj
 LB4+ookBmJcvDV65283JqYyllkCBRTKEj22eO5OzPHM3g/4cWVvn5EGGUTCoekRcHA5X
 94cD/uef93jWvBH/v8zGGPfPqdoVRuBu+pp9hX6LH4MFIaXpfCwJtFvuqLp7eumbP0Oe
 qlDHv1HgGp5UMPNMorB3SHhN8M536kFsQO6HFqvcVZfkSgNiGfEMmG1RJ0klYnSmhit0
 m0tzHYHmsyS63PZsSGtOygbWnghuFd3RKz24wV4OGhC/wVaI6vt7bEm/1Xi+BWgnD53m
 2Sdg==
X-Gm-Message-State: AJIora+2AzO+GscjCqaKPx22x8n8Y2cOgV4hNOJUi1yYRfNqVtlGwTy5
 kgSn8AxumqCaaTXdplQJtXtchAX9BrgQXNrTjU+hi2XCE+Dg1bj82t5tKcMneIVST7GB0/flROi
 LVptDn3Tv25YyDbg=
X-Received: by 2002:a05:6402:40cb:b0:43a:8a99:225f with SMTP id
 z11-20020a05640240cb00b0043a8a99225fmr2712418edb.414.1657099556758; 
 Wed, 06 Jul 2022 02:25:56 -0700 (PDT)
X-Received: by 2002:a05:6402:40cb:b0:43a:8a99:225f with SMTP id
 z11-20020a05640240cb00b0043a8a99225fmr2712360edb.414.1657099556446; 
 Wed, 06 Jul 2022 02:25:56 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b0072afb23fb9esm532601ejh.16.2022.07.06.02.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 02:25:56 -0700 (PDT)
Message-ID: <4f6c4f22-d446-5fc9-d7e3-9fbd2bf32da4@redhat.com>
Date: Wed, 6 Jul 2022 11:25:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 17/18] block: Reorganize some declarations in
 block-backend-io.h
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Joel Stanley
 <joel@jms.id.au>, Bin Meng <bin.meng@windriver.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-riscv@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220705161527.1054072-1-afaria@redhat.com>
 <20220705161527.1054072-18-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220705161527.1054072-18-afaria@redhat.com>
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
X-TUID: Lvv+HrpFFK07

On 05.07.22 18:15, Alberto Faria wrote:
> Keep generated_co_wrapper and coroutine_fn pairs together. This should
> make it clear that each I/O function has these two versions.
>
> Also move blk_co_{pread,pwrite}()'s implementations out of the header
> file for consistency.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/block-backend.c             | 22 +++++++++
>   include/sysemu/block-backend-io.h | 77 +++++++++++++------------------
>   2 files changed, 54 insertions(+), 45 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

