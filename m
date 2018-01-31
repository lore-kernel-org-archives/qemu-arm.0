Received: by 10.28.71.27 with SMTP id u27csp8358wma;
        Wed, 31 Jan 2018 09:08:59 -0800 (PST)
X-Google-Smtp-Source: AH8x226z9fBTv26nifyhCKAa5U/5zd5VX/PjLWUCae2KYYULYi8hV12HSEthPyklrwEXo0qxFbTg
X-Received: by 10.129.198.6 with SMTP id l6mr22385181ywi.495.1517418539050;
        Wed, 31 Jan 2018 09:08:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517418539; cv=none;
        d=google.com; s=arc-20160816;
        b=HYJkIzrrOVrmKnRMpnDDMiWyPxuY1q7Q/1cNjOsSIWwUGxM+9wM+SRffeSErykI6UI
         uG0DQSczrpaEaOR3m78hlF5XdiTx0sH7c5xfojQ3yTwq36vINMHqy3b2oD0CXcCO4arX
         2RydCVcLtIxNIRfONim3EH08xcJu/Aj/4xcBxL2GQcKZ9F+EAqPSjCZ1dHfUxKitxsvg
         F6lykm3tkVD8uxJYyjkfee5v69WQNBG+J8PP8yEgxcQGnXfOEEqDC0/2kfHhc6XDxEqY
         jWjjxa9gE7QhkK2H7rcOYNuOygsp5/jmiRaJyXIl/6PDWddD+mjvtv9esnc/DZum8BMX
         tTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=MWQYz1O4jGil23Ix/scILcKH4lLob2LxvQYltfFGdLU=;
        b=AxaXCJlJiq9+e8axzpkKMbvEpWvpY4gfKNYJEwp6FnAqviHDBkNaw1omS9QB2P2gbE
         pjOYQ/0p6Nl9l3e3Nto1DVWKsdSs8rBqHNpGCqsZH/XVnsVq+IxEOrZXThHc/zCfGuKp
         5jydfqrdEaQfnItrJvBoTxCzd93z/sO5FCGQvSOvmMqsmeVheTcra2alnPa6kzDPZsaj
         rVefJP0GupMDPFEAuS5/+mTESO0TXep8M7BETblX1eEJRxFfhIOWb9/EMUndQFwJQRer
         7jC/7p9tvlCGolYqf+NhqucsQmsVMpavsSQUeF6MXMCYut/w6buJVGzVX08woAKjOCgm
         2NTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d9CvXk5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si2887200ywo.450.2018.01.31.09.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 Jan 2018 09:08:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d9CvXk5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egvsY-0006sf-GN
	for alex.bennee@linaro.org; Wed, 31 Jan 2018 12:08:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1egvoJ-0003VN-J1
	for qemu-arm@nongnu.org; Wed, 31 Jan 2018 12:04:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1egvoG-00059R-SR
	for qemu-arm@nongnu.org; Wed, 31 Jan 2018 12:04:35 -0500
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:41182)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1egvo7-0004zu-Nz; Wed, 31 Jan 2018 12:04:23 -0500
Received: by mail-qt0-x229.google.com with SMTP id i1so22697729qtj.8;
	Wed, 31 Jan 2018 09:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MWQYz1O4jGil23Ix/scILcKH4lLob2LxvQYltfFGdLU=;
	b=d9CvXk5oYNKFHs+i5CWq0qiAoBjb+YTn744kq/KEQxa1Ra72K6uj0l7zO+XlrNJUPy
	g8+kobXkU+xMmyoLcMPjocHzGodFrSLo/JQNpIxfwW36GemfECndEOgYoNZ8eHQQ9m/I
	a4HMDlFxb2aPTY2PkkEXFc+H5Nv3czh2ip6W/K03mjOTbjcxyEzwhfsSEp3Q1aWwFfZt
	+Osri8ompDiUQUmAWx7eAOweDk9sJTpwX3ZHBXqn83LF96K4z7a1AUK2VfwyqSshRngx
	sVovcVkBtrKogUiFevr2AbFJPF+WXjKoaXrTALjFrfcrFLW0uosdIPJvLuC0t+24bwob
	SJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MWQYz1O4jGil23Ix/scILcKH4lLob2LxvQYltfFGdLU=;
	b=pQBtqOyViDyU3DRtB8wHW7RslpijIQGspE1BQd+yZ9gsBIis96a8Zp+NFacM0x3l/n
	h2K/n0tyKremtZGkVBV7xMeYztdf1LoJ78mkUAG4aYVWIZQzwxK4SYTTgz8o6HC7JS+4
	teN33yaFnYvOeSpTcjST2R6b31UccEfOOcgaHUdc141rEJhDzA/StIitUOBajO/phXbj
	fEdbIcPHBXGSIUohobrMmzqdG4tHTANjzc78GcpNq5Vw55y4ZHbSkCCej+0UqCeQdLCe
	hWfhUXCAoW1iBjPnWhejBotoF448kBNFQ404Ri3120t+3gpbdEAT64Jhg7M/qHtY0j/m
	fB6A==
X-Gm-Message-State: AKwxytddVHJRZ3YhzfMOGCxeVWNag7Mo3RqJptV6e26hDCeUxmLFcU7X
	Gkjg2LZi6+G1VXZn0V2BqZ4=
X-Received: by 10.237.35.38 with SMTP id h35mr51617835qtc.300.1517418263209;
	Wed, 31 Jan 2018 09:04:23 -0800 (PST)
Received: from [10.17.0.157] ([190.210.239.69])
	by smtp.gmail.com with ESMTPSA id
	t11sm14165215qta.70.2018.01.31.09.04.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 09:04:22 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-3-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <05796947-7765-f662-0827-2ac9d2f018ce@amsat.org>
Date: Wed, 31 Jan 2018 14:04:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180116013709.13830-3-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: Re: [Qemu-arm] [PATCH v4 02/14] hw: i.MX: Convert i.MX6 to use
 TYPE_IMX_USDHC
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YNez09KPltyu

On 01/15/2018 10:36 PM, Andrey Smirnov wrote:
> Convert i.MX6 to use TYPE_IMX_USDHC since that's what real HW comes
> with.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/fsl-imx6.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
> index b0d4088290..e6559a8b12 100644
> --- a/hw/arm/fsl-imx6.c
> +++ b/hw/arm/fsl-imx6.c
> @@ -93,7 +93,7 @@ static void fsl_imx6_init(Object *obj)
>      }
>  
>      for (i = 0; i < FSL_IMX6_NUM_ESDHCS; i++) {
> -        object_initialize(&s->esdhc[i], sizeof(s->esdhc[i]), TYPE_SYSBUS_SDHCI);
> +        object_initialize(&s->esdhc[i], sizeof(s->esdhc[i]), TYPE_IMX_USDHC);
>          qdev_set_parent_bus(DEVICE(&s->esdhc[i]), sysbus_get_default());
>          snprintf(name, NAME_SIZE, "sdhc%d", i + 1);
>          object_property_add_child(obj, name, OBJECT(&s->esdhc[i]), NULL);
> 
