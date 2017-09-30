Received: by 10.223.197.9 with SMTP id q9csp1238170wrf;
        Fri, 29 Sep 2017 19:27:45 -0700 (PDT)
X-Received: by 10.200.17.23 with SMTP id c23mr8978625qtj.74.1506738465124;
        Fri, 29 Sep 2017 19:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506738465; cv=none;
        d=google.com; s=arc-20160816;
        b=W7tf5aMNz8HAaysGt7JO4j0ftAdSWT7Vtvyk27gbDfx05LK0dBLcaNrByfgZcM7tgH
         0yw/8hd2mO9VoLhgI5JvMFszeT0WlcSFDV1FD46c41tGSxJEOg9458eo4I60v59uElwx
         RprQ1jlI5hDqhVmXAFJ2was2U2ceHEYnLVia2OIQt9pfDltbNGMU4hbvKw2I+2TcseyB
         5T2C++rlYsrtoPP6H2bYkeStNdBoUED4tNLv+v60P0/cg2OhqdwQ+fsoSzuR2itGCh3i
         iNeWlnYbUzBwMVVUEVIrRmOVgwu6f/D2CN2n+cZHK0sKz9d8AKM5QO9SZkOrPZPfwWz9
         kufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=LmuiFlNxMnswn2vCFx0eSBz1tqHoXcLy2k/a9KiE2kg=;
        b=cTNZ/NpZ5ytpZROtIsma8SO+hwxz7aCUuDB4W8UnzcjzqwzNv0RaRUE/FnVI7Kf8kr
         Gizk4Ht/ocSuWyEACAOlZWj/8cEGfe7c4WYq3DKxIcDfaAo4tIFvhJM7JAL3mz8wWRln
         k3P03QLzhif2o9vlNIo8+/RqsU0/vUZV8VCVOsnmfgMDpVgn0sLr5HPG6p8FmS2xAPpH
         Bs2l/AuzC9JXlIJ7PBG3ru7WGCYl+zXQfmXpIYf+XslJAgHjpJJFj+tt3/7pr8Pj5B6X
         O7cYCcQlZAn6tP5yshIRVzmaBSb7/5v6zwLV4VsN4V0qRDk0G00SYLCLYL024y9nRGro
         S5rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SjoVDUx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32si2387504qtf.422.2017.09.29.19.27.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SjoVDUx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37867 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7VG-00060n-RQ
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:27:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy7Us-0005o6-Jl
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:27:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy7Ur-0007WU-OT
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:27:18 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:43244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy7Up-0007TL-Eh; Fri, 29 Sep 2017 22:27:15 -0400
Received: by mail-oi0-x244.google.com with SMTP id c77so61716oig.0;
	Fri, 29 Sep 2017 19:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=LmuiFlNxMnswn2vCFx0eSBz1tqHoXcLy2k/a9KiE2kg=;
	b=SjoVDUx7fSiewioowuG1DHIbTdGmdvK/s/F5/W++ZO3+uQhvv2ojBkHMQI/zYfo0kr
	N/ldQ5zTm7ZViQZhbZkfz4qgDKBkk4BQHHSWyz1K0Kat2P4K6uOHpVd79sSBl4IdoxCp
	IyKTtVosCxlOoXfG6OxEnlb7MWOiKvGAklIi+0BDmY3xahK8U5l16O8n1ZEn9FPs5Ou2
	nyMgJIRSTICUBGbO2n681N0CX8k9UK9/VXBqriMvT3s9L7whiyctshHjHifawlDuYiuC
	iMsFbYy0NCBRqjMI52A0mVWZQ/b+ZGylDzQPF1X9pEgAPNZbZVBWaNjQcj2up2JbyFwh
	y+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LmuiFlNxMnswn2vCFx0eSBz1tqHoXcLy2k/a9KiE2kg=;
	b=iUCVbAYDy4feOnMJKTc5sZTwNR5E/QXsh1HTwmdDCWyGEluvOcnSTWP3TmJ+Fi/j/p
	XdwlZ6s6z2C19WCsMBQtKw7gmb/TF2Y5oR8GM0dtd9QBBO2FE2FHjZAtesBjvPTPBgZL
	cGQiJ8MWFZ7hlnSmkQensyYQojGDUoZ+4L1LeN6ScadgPwi8fzgiV4owuFagNqhGWk/x
	HNvisP8rh/EodoF97ViPDupP1LCmXFIElWT3Jw/sfeszVcS+l1exCw2VOftsXc5/0TkI
	X0AfK/B98T3mwTjI6HQLvfRvk5vxTpnKsrBwJEZKG27yFJ298pcX7itdegxfGsJ9yljo
	uGjg==
X-Gm-Message-State: AMCzsaWXlTonOdhQzaYSIr7K3CI/7UpPgkCo39WzU6wnUxwd/c/Ecvr1
	3xM7z0VdLT+2UDRxL5cU6JI=
X-Google-Smtp-Source: AOwi7QARUTNCl/Wb94eB0g8Nn2AOKy1Px7OUpMZ1hesB/k1O1L+k3Q4UvQ4qRefY4edfmTYa8tNsQA==
X-Received: by 10.202.51.10 with SMTP id z10mr3485927oiz.172.1506738434853;
	Fri, 29 Sep 2017 19:27:14 -0700 (PDT)
Received: from [192.168.109.31] ([64.125.109.186])
	by smtp.gmail.com with ESMTPSA id
	v14sm2709618oif.39.2017.09.29.19.27.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Sep 2017 19:27:14 -0700 (PDT)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-7-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <46b536c8-db38-0f89-3a8d-703ddad78923@amsat.org>
Date: Fri, 29 Sep 2017 21:19:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170918195100.17593-7-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 06/17] imx_fec: Use MIN instead of explicit
 ternary operator
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: 3cBJwWYBDhnQ

On 09/18/2017 04:50 PM, Andrey Smirnov wrote:
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>   hw/net/imx_fec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 989c11be5f..8a77136d38 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1074,7 +1074,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>                             TYPE_IMX_FEC, __func__);
>               break;
>           }
> -        buf_len = (size <= s->regs[ENET_MRBR]) ? size : s->regs[ENET_MRBR];
> +        buf_len = MIN(size, s->regs[ENET_MRBR]);

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>           bd.length = buf_len;
>           size -= buf_len;
>   
> 
