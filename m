Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4606252lfb;
        Tue, 27 Apr 2021 02:20:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuTYzF5hNtiwyAe/70guFuVIvwBCLAybvhEioXa1GN7dIw8K/iFAQ3TZiJMA25FGfK62wi
X-Received: by 2002:a05:6122:2ad:: with SMTP id 13mr16837332vkq.11.1619515248550;
        Tue, 27 Apr 2021 02:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619515248; cv=none;
        d=google.com; s=arc-20160816;
        b=QAgFfjoI0fsIv88whXr9eYeVwvv6ZDx3UUYJewr7xcz2yRNaMN1k+7xxJo9Gzi6wJ0
         S6Lh1HprjbjXHHUEmhit8CRZSEYp6shNR8pho9QYMlLg6+WEC3MqtCBE5+BdnVjgRl+v
         6erhvTJxlf95bH5h+owSNFm7CNIGRQ4dsNFuOZHbD2QU/zJ5Qtrhn2II2dwJngEE/ynu
         okbNL0zk+VuXlPLtSB07CjU7saFmou4lfB8q/0FcpwoMYPBmfX4x8PfVU0tW/iTUpwlU
         vumqLsGZq4oLgimbKBSYsAuoN5E68RFZECGtROcX3E0wDL5A2YPf9DLls0NRlYAs4Y3c
         iIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hd9A5B/gmaq7vbkvgMWO/lHXkZZvwSK+yXa9K68PMC8=;
        b=F2O94B4N54Y3GfabVwkagwLr8fVscGg/gicU0pTTlj1jd+sEJh+kPB6R5HHQgdtEwW
         AxabeYtA5zq582dKV2I4CBa5UevP/W8ivpbh/bbnJwD1y9kskNdHSTV75KvNXg+hptfb
         00UJ6IGq3N6couAXzZlly8ZBsrg0LfnB8jzY+IkeNHmL0HMib0xNgOnlJLCFT5zdZfip
         TEVT6ZsBu1szM9TQJ36YCm+mvhC9hiui2cILFIuCkUJsjzvaGmDQogLyK+Aa4e2Oben6
         UAeK9PWCwcBSpv/ThbaAmqMDDq6YvwAeP9ZD1gNKtVEtb6ChOemy201XMprFw9Tk0sWy
         GUeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FUrsNtsa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si1729923vsj.49.2021.04.27.02.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 02:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FUrsNtsa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbJte-0006n2-5z
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 05:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbJt7-0006mN-Gr; Tue, 27 Apr 2021 05:20:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbJt5-0007JC-Vf; Tue, 27 Apr 2021 05:20:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k14so8773009wrv.5;
 Tue, 27 Apr 2021 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hd9A5B/gmaq7vbkvgMWO/lHXkZZvwSK+yXa9K68PMC8=;
 b=FUrsNtsaBgJIVkpl9zuaMCwMPEfx3AAdX6pVsVWalzQndHkFEVuAVWss5ofFBC/mlq
 djGjJWG2UYtmuq1bUdZftVGvjBqXOATHb+PHV/SoJxQtf7b5hp6JHJ/xX1v5cBG2xkrz
 3iriWu5UsGteDg56e2JKzj67uzlh5V8cvsoL7qIAudapT+uAayvDQK6wQWk++A/LFyrd
 WXbGxLNDHxRjynoKwe1Hyev3wRs77s/d5ER8DHH+5St1jeCcUW/sN2PSNlM/RZmQKWWD
 bMQpj15iYSXVq3fLPg8/LVNB7eXBNYLp7D6YexFr/EX/9DdNWf8iLUoo6vGr1poXr+8S
 PcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hd9A5B/gmaq7vbkvgMWO/lHXkZZvwSK+yXa9K68PMC8=;
 b=UDczSroapS8XUHxPruwtgMEVSu9Wp9LYvdWlMPMI57OHIaU+2MPdZKzKBJB5brHM71
 LiAGVP/TigDb6BvZkt45cQofLFpByy5Q3WH+XooT3jtbYW7/y74z01Hx9nwm85UAkTy0
 GZfWSN/PJEYe8VQKeTlmfHM7uTocFZRmatKHowZ9weAt5gARjiFmlIve1oGl5qcPGTas
 jmOiozcjnSikFSWiUcKgcLcbFrRnTHpMLvYFgaqYA+EVfHIGs4tznBQxmUkUjYIfLcjn
 NhBk5/5aB4sbLIVvQ+EUIGZlsjK4SwaCz20UelZV7p+nL9vFmuZU0gk40PkJrTtk0KyO
 +L7g==
X-Gm-Message-State: AOAM532SzXDGwVHQcFij6klz0JiUx7dzUZ+FQnY7UUDj7CmZ7BbGyQwy
 b04pZ1tSSTfe2RqUJR1vHM8=
X-Received: by 2002:adf:f947:: with SMTP id q7mr28126018wrr.414.1619515209310; 
 Tue, 27 Apr 2021 02:20:09 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p5sm7782415wma.45.2021.04.27.02.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 02:20:08 -0700 (PDT)
Subject: Re: [PATCH 1/5] hw/ppc/spapr_iommu: Register machine reset handler
To: David Gibson <david@gibson.dropbear.id.au>,
 Markus Armbruster <armbru@redhat.com>
References: <20210424162229.3312116-1-f4bug@amsat.org>
 <20210424162229.3312116-2-f4bug@amsat.org> <YIdso1hf+bXwZHmG@yekko.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9dcc20c7-6371-dc77-1cd4-706301ec5c54@amsat.org>
Date: Tue, 27 Apr 2021 11:20:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIdso1hf+bXwZHmG@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5HCYFcANG5KA

On 4/27/21 3:45 AM, David Gibson wrote:
> On Sat, Apr 24, 2021 at 06:22:25PM +0200, Philippe Mathieu-Daudé wrote:
>> The TYPE_SPAPR_TCE_TABLE device is bus-less, thus isn't reset
>> automatically.  Register a reset handler to get reset with the
>> machine.
>>
>> It doesn't seem to be an issue because it is that way since the
>> device QDev'ifycation 8 years ago, in commit a83000f5e3f
>> ("spapr-tce: make sPAPRTCETable a proper device").
>> Still, correct to have a proper API usage.
> 
> So, the reason this works now is that we explicitly call
> device_reset() on the TCE table from the TCE tables "owner", either a
> PHB (spapr_phb_reset()) or a VIO device (spapr_vio_quiesce_one()).
> 
> I think we want either that, or the register_reset(), not both.

rtas_quiesce() seems to call a DeviceClass::reset() on the
children of TYPE_SPAPR_VIO_BUS:

Abstract TYPE_VIO_SPAPR_DEVICE has the TYPE_SPAPR_VIO_BUS bus_type,
and registers the spapr_vio_busdev_reset() handler, which calls
spapr_vio_quiesce_one()...

So either we already have 2 resets, or the bus is never reset?

The bus is created in spapr_machine_init():

    /* Set up VIO bus */
    spapr->vio_bus = spapr_vio_bus_init();

TYPE_SPAPR_MACHINE class registers spapr_machine_reset(), which
manually calls qemu_devices_reset() and spapr_drc_reset_all(),
but I can't understand if a callee resets vio_bus...
