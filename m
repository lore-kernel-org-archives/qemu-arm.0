Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp832644wrt;
        Fri, 28 Sep 2018 08:15:26 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60CaiL9O1MGZFkPqtFLHdMZvBjs9jxsqCgbGix82WF6wGI+C5nVbSru9hpZ9/eIMPxDKkQB
X-Received: by 2002:a37:a107:: with SMTP id k7-v6mr12111220qke.276.1538147726912;
        Fri, 28 Sep 2018 08:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538147726; cv=none;
        d=google.com; s=arc-20160816;
        b=brpVRzMGQPQ9BdoLodXDZQynHj2+rgP6nQDD4cvgFiQoeH9IeMmfGc09D+fxH0mcN5
         XWSEWLdIampl42tpM24o+LGQ1GPu/1YPjPV0JqiXrNdAqJQa4Nnc1TKMtn/zsB6oK17I
         37j/TClwneisoHzIerGfm2ROeZLayyr9zLNnk+mdSuO7ZBBfosedfFdrtjU9HU7f8NwW
         T4DQKKqKUvT4SHBiczlQvfNRI6mKE+fyV3fdLTYHQqvIcdyZajgQSWAsHsUeycU6eIUO
         R7/y42kgN3tk6mCiI5e6srtfrF35nmtQLrhXht7BHdVZ1Oz5eXtjxk361mTxoIoK5w63
         01Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ze/NQzLsSrKKfRg/hqk5pVj2Rvg68igtk5KRYoaogkA=;
        b=atKkcJYocXFbR1t9yBV7EsugW+pxAv7sA/l9TVGX4ahfTCzah1mZcCD8mJrECQMe0u
         r7yLUFxgk6/XO4IgkGIJbosr6GuE/0T1XnMkqnMu6Kadxdk17pO/eL8ZFlWS6G4zhr8L
         PZg1RPCfdJtV/Vc8FmPgDqJ6Fz4QbCw+8c/9P2htRcDgFZiMo0t+AtBsM9uuXmRoOLIk
         LpdOwbKlp9mUhdSwWdcjJQu6CfBmpon8FDvxyAmOuAECwqe8VQxJ3qP3ulYpZOroMbxe
         UFl1y2fkV1pKY954TGEIShqhKVrbhxkCgbyq3VL+NRYErSNtyNtUpJknQZAnlIKFxeoE
         YPYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m67-v6si483987qte.64.2018.09.28.08.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Sep 2018 08:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5uUH-0004NH-RH
	for alex.bennee@linaro.org; Fri, 28 Sep 2018 11:15:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g5uTm-0004Jm-Dk
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 11:14:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g5uTi-00064M-8j
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 11:14:54 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40388)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g5uTe-000631-OG
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 11:14:48 -0400
Received: by mail-wr1-f66.google.com with SMTP id y8-v6so6791261wrh.7
	for <qemu-devel@nongnu.org>; Fri, 28 Sep 2018 08:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ze/NQzLsSrKKfRg/hqk5pVj2Rvg68igtk5KRYoaogkA=;
	b=kvRr3A1MQt7vrwRRwNONOoSaWq0MBXMIU6v9OY8REhyx7+4o3u2cpRJljgu+P1H/Aj
	DP+xC0GsdrhenbmlMI+26eqRm6OGSFvb9/tUh+8xgk1ovr2ojJSiZHUDo0kLuBzwuhcb
	nfHJst41SVy+AVrknslRbJ1VrfRt5h/3BxAzp5NBQQK7JNYdYDUUTh7BQFg8E5OtPKBc
	pVu7JT7Dbi2lQ7AE3bw8pgP3Vafj468mo8HuIMe7p/a9Q3wVx/dD6TTZizPE8GqUxa3z
	38O+/n3Mj6uV4MAZ8PkWzTDYvLV3ASHiJM8H+itW4kk5FWXxP/zBMh0NM+nHUdvtsyMH
	2lJw==
X-Gm-Message-State: ABuFfohUrOmC8IHLHuj+eaaHApyhAAwpt+gx0LHNmobte2R5wAbiNPB0
	b65AlBysf4shArkGPdIr1Vc+3w==
X-Received: by 2002:adf:f785:: with SMTP id q5-v6mr2437956wrp.86.1538147684977;
	Fri, 28 Sep 2018 08:14:44 -0700 (PDT)
Received: from [10.201.33.229] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	i4-v6sm11122909wrs.87.2018.09.28.08.14.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Sep 2018 08:14:44 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20180928135003.8650-1-clg@kaod.org>
	<20180928135003.8650-10-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <95f1e611-46f5-2a97-74dd-74be8b5ed9f5@redhat.com>
Date: Fri, 28 Sep 2018 17:14:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180928135003.8650-10-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH 09/11] net: stellaris_enet: convert SysBus
 init method to a realize method
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 370TqUq6f/hy

On 28/09/2018 15:50, Cédric Le Goater wrote:
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/net/stellaris_enet.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
> index 165562d7886a..3ee1e0f8a43f 100644
> --- a/hw/net/stellaris_enet.c
> +++ b/hw/net/stellaris_enet.c
> @@ -473,9 +473,9 @@ static NetClientInfo net_stellaris_enet_info = {
>      .receive = stellaris_enet_receive,
>  };
>  
> -static int stellaris_enet_init(SysBusDevice *sbd)
> +static void stellaris_enet_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev = DEVICE(sbd);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>      stellaris_enet_state *s = STELLARIS_ENET(dev);
>  
>      memory_region_init_io(&s->mmio, OBJECT(s), &stellaris_enet_ops, s,
> @@ -489,7 +489,6 @@ static int stellaris_enet_init(SysBusDevice *sbd)
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>  
>      stellaris_enet_reset(s);
> -    return 0;
>  }
>  
>  static Property stellaris_enet_properties[] = {
> @@ -500,9 +499,8 @@ static Property stellaris_enet_properties[] = {
>  static void stellaris_enet_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
>  
> -    k->init = stellaris_enet_init;
> +    dc->realize = stellaris_enet_realize;
>      dc->props = stellaris_enet_properties;
>      dc->vmsd = &vmstate_stellaris_enet;
>  }
> 
