Received: by 10.25.44.15 with SMTP id s15csp4113311lfs;
        Sun, 16 Jul 2017 21:10:41 -0700 (PDT)
X-Received: by 10.200.33.130 with SMTP id 2mr23860848qty.223.1500264641077;
        Sun, 16 Jul 2017 21:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500264641; cv=none;
        d=google.com; s=arc-20160816;
        b=YnO3GKe9TlUtW+TuxzVdggffYxPcS1ygs3M7xKqaPZHlo4b9G7vJngwpplTCQVm+t8
         ULOKD+OiIAcWn/LHe4Pj4AVooAiZzEn7S+GOyXFyyxC6x4jZf3BGMb8Yf9ebasosLDN8
         50scv1Wu8NJuVHOsj6P81446Q4ErpmzE6rm3AnmNZZVOuVEL5o38R4AcyF/3eF9liUcQ
         gSH3DLhJqTZdw0IgKka03dazs1NaqkH7AgBWwNN1sPQY3plqi0P2Jle2HY9Zidb/GOrL
         KE0R33HrNOwTibp5CcjU4RMbhIWVFGugefz4/f2P5G6jGOzMxr5jj15QfMtf5Kn3Rajh
         xgjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=3bXEojEZlVubaxGVJxpQ/E37xuVdjzymPnltC9964MA=;
        b=xs+XE5UbYYb3PP+SnUOJzFgmbsnDb/sCp3/4nITKjJlXIc/dhDsHdim0Xtd0p/g56S
         YXcxuTH1IgplmNhHtjkdvyntETYZI+BMzt5xZgjPLVQeqMwYnLt3n3ITidMCLL51g2bc
         g6vWXzd2aZQJy9SZIpWTCJwGXNz5iTfYRNv5EOHNsievHJNlHqtSLOliKCQZObLnzHqz
         00PMFtaiSh3fU44mixt0gbi2cM7X/m+MCoNuiRgdnNsw/BTSrHMDj0/AZE2IUr4pb7CT
         SElrs+Gqcg7JWx6b68u7VTtTr2laSWHhC+cAra3dK6+otMNBb7d+d8+4fTSNN1mR1QiL
         1p/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=QHE43P0v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x188si14138877qkd.218.2017.07.16.21.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 21:10:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=QHE43P0v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWxMk-000425-Fq
	for alex.bennee@linaro.org; Mon, 17 Jul 2017 00:10:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxMh-00041L-ME
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 00:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxMg-0000Xo-IS
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 00:10:35 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:34123)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxMg-0000XV-EZ; Mon, 17 Jul 2017 00:10:34 -0400
Received: by mail-qt0-x241.google.com with SMTP id 19so1148089qty.1;
	Sun, 16 Jul 2017 21:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3bXEojEZlVubaxGVJxpQ/E37xuVdjzymPnltC9964MA=;
	b=QHE43P0vyw2A4Q824az6kFp4AfspiGan8Gy5xoGLkbFe6lEqFAb1AHUBo4NFv2EXYx
	znFvfrKES2IHU6hLw6TAZjIDNv4BVPQ7NjZVjcoP+evZeAiVbEgnPNATqEsFEb87pyY0
	dNwrENjTIdC03Wecrta0oWeVhuN3+RiVGko2MjgQ4gSDFU0VG31TDMONrblIDDSoRYLf
	ktQ+jQJiitONAlhUWJ8jE1NZnDewA8mdhGtHDL7Z/hT6+B6RnKsYdm8NTJYpzBfxUsej
	9rPDO5jGKRE3qxKrKcWsy10zAfpbn4LRtzNmI3hLP3UKUXoi79h+eNHOhsIkDGjl/G3K
	XITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3bXEojEZlVubaxGVJxpQ/E37xuVdjzymPnltC9964MA=;
	b=L7mKRjPumCif09wo5Tr0BgG1YTqvjbWTRpE2DsRoevmXn0H04C5GW5QnLRwwszxiC6
	2CN0UQAmoUhrfxdFkQbPudY7eBkclNjVdABkPovHarHcVP3v9+PmYvzPe90wmqCMuLrz
	ZqwqN6/9SU7itaQH5P8ln+Qncs9yT0jsiO10kovxaVCyJU5LAabgFhXqv7SNtREH5k13
	inCRir3eKUEg9kfkKRmuov5W3fWHD3W2/MfuvsDPVnFixdhZ2seKLHRpjvezdni47U5S
	2Zo0AKv7YaqMcPihavyZSbI346DnXEiUkdtw9wot34N/zn87UR4FPRu4fbDo8+RQOe75
	f4ZQ==
X-Gm-Message-State: AIVw110wIEKZUO1Wv6XGtq7C3cbcynvMvHOs4fPVUryn7wY7sIHwvkbi
	chvuUggPTaUENhN0JBI=
X-Received: by 10.237.48.225 with SMTP id 88mr24067045qtf.17.1500264633653;
	Sun, 16 Jul 2017 21:10:33 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	j7sm12166271qtb.60.2017.07.16.21.10.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Jul 2017 21:10:32 -0700 (PDT)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <20170717023824.18796-1-famz@redhat.com>
	<20170717023824.18796-6-famz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a237c7b7-9e27-bf0d-30c3-013f979fd248@amsat.org>
Date: Mon, 17 Jul 2017 01:10:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170717023824.18796-6-famz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH v5 5/6] xilinx_axienet: Convert to
 DEFINE_PROP_LINK
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YpdQy9wAe7sO

On 07/16/2017 11:38 PM, Fam Zheng wrote:
> Signed-off-by: Fam Zheng <famz@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/net/xilinx_axienet.c | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 5ffa739..d4c2c89 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -989,18 +989,6 @@ static void xilinx_enet_init(Object *obj)
>       XilinxAXIEnet *s = XILINX_AXI_ENET(obj);
>       SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>   
> -    object_property_add_link(obj, "axistream-connected", TYPE_STREAM_SLAVE,
> -                             (Object **) &s->tx_data_dev,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> -                             &error_abort);
> -    object_property_add_link(obj, "axistream-control-connected",
> -                             TYPE_STREAM_SLAVE,
> -                             (Object **) &s->tx_control_dev,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> -                             &error_abort);
> -
>       object_initialize(&s->rx_data_dev, sizeof(s->rx_data_dev),
>                         TYPE_XILINX_AXI_ENET_DATA_STREAM);
>       object_initialize(&s->rx_control_dev, sizeof(s->rx_control_dev),
> @@ -1021,6 +1009,10 @@ static Property xilinx_enet_properties[] = {
>       DEFINE_PROP_UINT32("rxmem", XilinxAXIEnet, c_rxmem, 0x1000),
>       DEFINE_PROP_UINT32("txmem", XilinxAXIEnet, c_txmem, 0x1000),
>       DEFINE_NIC_PROPERTIES(XilinxAXIEnet, conf),
> +    DEFINE_PROP_LINK("axistream-connected", XilinxAXIEnet,
> +                     tx_data_dev, TYPE_STREAM_SLAVE, StreamSlave *),
> +    DEFINE_PROP_LINK("axistream-control-connected", XilinxAXIEnet,
> +                     tx_control_dev, TYPE_STREAM_SLAVE, StreamSlave *),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> 
