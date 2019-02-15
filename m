Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp143726wrx;
        Fri, 15 Feb 2019 12:22:12 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib/6LmmyUzBUAOYxaZROtPbsrgOYmMorub6ZrcUvAJz6lopY8VOA5ntqpUfzB0IPYtceoq1
X-Received: by 2002:a25:828c:: with SMTP id r12mr9507975ybk.331.1550262132853;
        Fri, 15 Feb 2019 12:22:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550262132; cv=none;
        d=google.com; s=arc-20160816;
        b=OflrIqbHbBDAovOJdswsJ008WAPdoS2aYWiRadkSooqFXU1hCtOCJOYFaFXYj6Ph4W
         ybihE90D15ZOUkrRWoxQHusTEWlJIy0+z+5sJU2/lQch7tB0D3pqs61yX6BFlVg8sDB6
         xKTwmRzGRKaiY2mFx8wVogvMxB3hEgiGnO11YO/bYmLauT27MyWK5MnQ/hFJl0XKRQ8g
         UhsFACHapTh/0kJq/DGwNivPkXw6J/ZEC1hTc8c9vw1bbIRdsMTCwHe48Eabj4d2dXHR
         BGyoZqFD/POhASfTi+HCT+SR9uARmwZeXYXnZI2PCxp96Q+kPnz3DgXU2qktlELcvLtl
         xH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=tcZwbpI4M1zrBL6QM6485lkoWvGoLZ8TIcl59c99x3E=;
        b=0ck5R4iYSW3UFMA9dkx4PmkYAA17GHgWKABkeWqyOiTUdfKks6TRoE6gqWD09+ZK1I
         nRsSo0b1H6/qz8V1B7VDAz95swPvJzqYbz6NmBREr+YKSRD40+H+pjXkF6pHJNs8s9Tl
         U2u8weOkHAjGoUaFwnhsvp1N9q5y5Up3DZk6WPjv/n4fKJ7iYfQ8T4FHSH9pL3xMo1Ji
         PEDLVpOJiGHZNCe7pTyLpN/jFTxb/lntLFvvi9ZPDJWsvJ1vCxAJoi+NYWvEDF8abF1E
         qsN6vNw9O2+b0Sbg3sMFf4SEhBWQP6xoFoHoYV/o0BWxlbWzZp11wJdMR2h1F6VT/erh
         xwdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h130si3645917ybh.170.2019.02.15.12.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Feb 2019 12:22:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gujzw-0005Re-BR
	for alex.bennee@linaro.org; Fri, 15 Feb 2019 15:22:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gujzT-0005Qx-40
	for qemu-devel@nongnu.org; Fri, 15 Feb 2019 15:21:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gujzS-0007gx-2O
	for qemu-devel@nongnu.org; Fri, 15 Feb 2019 15:21:43 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38389)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gujzR-0007VD-RL
	for qemu-devel@nongnu.org; Fri, 15 Feb 2019 15:21:41 -0500
Received: by mail-wr1-f68.google.com with SMTP id v13so11623402wrw.5
	for <qemu-devel@nongnu.org>; Fri, 15 Feb 2019 12:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tcZwbpI4M1zrBL6QM6485lkoWvGoLZ8TIcl59c99x3E=;
	b=ne7y9pL8dWfZ+VieBzY3FuCNXDYeLMKH1nm3SUR7yf9jRrC60xfTMrOm9Ixwv9uG76
	P3GXyz7TSaLMz1P1siyC9Y5Q8yrNa0yIrxqnLf+F69KdMIpxY4kD1aZU6WIE65cw3Q7V
	UNoD2ePw2GPHiC2JZgfXYJKb3OA2FBsmnADgYUhq5bW0RfRIpXjiaJJsQLrMNXaQnjs+
	mqMLLC8Dp5CTv+gD5DCRL/huz5CmdvT9mVlejtzsKmhkRLs6/HCrx9M+gTpV7ZEBk4UT
	p89XUSUpYGXIIlbqoWr7cq4uKv4kXduITOzRRKgCk5Tp1/M4+isC7DqYnmsUeFKVkIEm
	KHTQ==
X-Gm-Message-State: AHQUAuYaASanAtJmizLf1gaOKEgerVxaFgFH3KQMHTKXwZ1obMBC/mmE
	uMewFjNxXbm++rByfFtMT0E7xw==
X-Received: by 2002:a5d:4702:: with SMTP id y2mr8811349wrq.149.1550262086818; 
	Fri, 15 Feb 2019 12:21:26 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10])
	by smtp.gmail.com with ESMTPSA id n6sm3533508wrt.23.2019.02.15.12.21.25
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 12:21:26 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190215113707.24553-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <44ee5b1f-6c2b-24d2-52db-9c5000dc6461@redhat.com>
Date: Fri, 15 Feb 2019 21:21:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190215113707.24553-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH] hw/arm/armsse: Fix memory leak in
 error-exit path
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G8hmEk8UCcuB

On 2/15/19 12:37 PM, Peter Maydell wrote:
> Coverity points out (CID 1398632, CID 1398650) that we
> leak a couple of allocated strings in the error-exit
> code path for setting up the MHUs in the ARMSSE.
> Fix this bug by moving the allocate-and-free of each
> string to be closer to the use, so we do the free before
> doing the error-exit check.
> 
> Fixes: f8574705f62b38a ("hw/arm/armsse: Add unimplemented-device stubs for MHUs")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/armsse.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index 9a8c49547db..d0207dbabc7 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -762,26 +762,28 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>  
>      if (info->has_mhus) {
>          for (i = 0; i < ARRAY_SIZE(s->mhu); i++) {
> -            char *name = g_strdup_printf("MHU%d", i);
> -            char *port = g_strdup_printf("port[%d]", i + 3);
> +            char *name;
> +            char *port;
>  
> +            name = g_strdup_printf("MHU%d", i);
>              qdev_prop_set_string(DEVICE(&s->mhu[i]), "name", name);
>              qdev_prop_set_uint64(DEVICE(&s->mhu[i]), "size", 0x1000);
>              object_property_set_bool(OBJECT(&s->mhu[i]), true,
>                                       "realized", &err);
> +            g_free(name);
>              if (err) {
>                  error_propagate(errp, err);
>                  return;
>              }
> +            port = g_strdup_printf("port[%d]", i + 3);
>              mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mhu[i]), 0);
>              object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr),
>                                       port, &err);
> +            g_free(port);
>              if (err) {
>                  error_propagate(errp, err);
>                  return;
>              }
> -            g_free(name);
> -            g_free(port);
>          }
>      }
>  
> 
