Received: by 2002:a05:6512:48d:0:0:0:0 with SMTP id v13csp2795900lfq;
        Mon, 18 Nov 2019 04:26:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzsQ29nG0QqNazhgkAjaVnS2CVR3NcC4f04I3gAm32Qe11VRVilK3Qv3PUVVJoItfCTKAAs
X-Received: by 2002:a17:906:80d5:: with SMTP id a21mr26327493ejx.114.1574079986849;
        Mon, 18 Nov 2019 04:26:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574079986; cv=none;
        d=google.com; s=arc-20160816;
        b=wUl2JrVA1CRI4FwmdNZJcTmvgRMlxjOEUcvl698QuHuI9Nm4/Q4gv395UTX3MAM5Dg
         +Jtza9zF+gSMHvG9nywyeXoyrB3TV2M1MQxzOGKhFFhpgJfVD7xX6ZQYJbJm39Dz8xx1
         orcjMk8/3EN/GjZu/JIJrbDqmW2dCiNWTVaLrwnfSlHREwMVPqmyOImxS0H0awnYCqvq
         Ne7tNUAcD7TzpahasyivpcJ4YTVuIefUZCxh+en004qEdBn8UukPTB6vhqHVy63RLiHH
         L2ySamLyR0SRQWtPqdogPxjXUnfLXwIvrF2yitFYi7HfFpNflqSvWVq2Ih+gitJKKe63
         evaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ib5KKhD5HJk0z9NsNcG+DYUAl/uqORxihVH5ZKzHyY8=;
        b=KNaCtsybuMflpqDUyUP4Q83IY0a4beRlPtlYAKlSNT713t9UQXn1LTDUikIbjosuM+
         o6kTlD0k45Gu08xXZiTOpYCihOO6WQ+XlEwUyxPFaOcz/jmr9VnIT71blwnqfnAeNDLy
         PQBJPRiP7DD7nLf+Lf6MZOciaJq6daT4+cicSAJSkAWhw1kvhVHXhDalZw2CnaSgItW1
         hsfgsofo6m9mc6fUttpTKR+kfzoHCLrfMZN5f6GCjMaZBzYsjlJQmn+M3xHOmy1OGI2t
         dnOe5zfBS0UKtlx2etTdUe+1eStNZ2yxbOfgb9Tlocln2iKgoaDTq2DdkGm8N+n0zCyq
         Fy1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PfnZKmsH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oy25si10854029ejb.291.2019.11.18.04.26.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 04:26:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PfnZKmsH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWg6r-0003dm-Lf
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 07:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iWg6h-0003cu-EQ
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 07:26:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iWg6f-0001hA-Om
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 07:26:14 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26571
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iWg6f-0001gv-I1
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 07:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574079972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ib5KKhD5HJk0z9NsNcG+DYUAl/uqORxihVH5ZKzHyY8=;
 b=PfnZKmsHs2p5/KCbh6yBGjc9+Lc9DbsDVoUdAp1k7XA1t1W3un2wXzy8vlmlbwBugxSV3/
 rDlr71dq6qGOqaxmmLZLMsyKmS+4twWFCmMt8fiHPeigZ60cyRAFsAStDYLQr+o5+NavQa
 OyNVdOxJpH6vpQsBHoV0Db8h0o4dygw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-uDfpR0SvOD2jDjrJNBcFSQ-1; Mon, 18 Nov 2019 07:26:11 -0500
Received: by mail-wr1-f69.google.com with SMTP id f8so15261317wrq.6
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 04:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k3zctEOJ/bTdP4mIF4ywjSUD0sBgS+dq3Ce/p9kgI94=;
 b=aIqL1kr7yWCW5qNQJoM9wk+4gOIVp20JxOkPPaymT6LhllwwzzPcloMz/R/2bFfQL0
 2tqtVsj6VJQBhWDRleFKj9/eoLXBz5mLlHYAlkZx0GkXGgJoieJpLIP2j6whasJlA2zM
 Q/KJNf+BQuUzByYx03y0ltXf/64kZBtoBtEhx5VmtLyzZF/XN/ohmhV1q4iqMPtjF/e5
 KmrN0KHGJ3GxqiBzV2plcRGomdUIC3AUD99brfwBoMraOFfWu45uVgC4EVP1OqP5irBw
 RvpPOim1Sgfco07M746fpDZG0UgrFvWNkVs9GF7XnTfs5CJ/t13wtSeGHKkvjE97OCWd
 ciDw==
X-Gm-Message-State: APjAAAWSB7BdgZxzkaCQRJWnVpRC98cVl22+SR7RHo3V70vLcNrBaHUr
 SghrcnTYqpx3ABUMYcLA76hPukZ7fAVlqoYo5aBylGiewj9vXoDCLhsPhTC85d9ItsonpjMzAtv
 4kggfuV5BdbyB
X-Received: by 2002:a1c:7701:: with SMTP id t1mr31250531wmi.113.1574079970119; 
 Mon, 18 Nov 2019 04:26:10 -0800 (PST)
X-Received: by 2002:a1c:7701:: with SMTP id t1mr31250514wmi.113.1574079969955; 
 Mon, 18 Nov 2019 04:26:09 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id d7sm23350868wrx.11.2019.11.18.04.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2019 04:26:09 -0800 (PST)
Subject: Re: [PATCH 1/3] MAINTAINERS: Add hw/sd/ssi-sd.c in the SD section
To: qemu-devel@nongnu.org
References: <20191012065426.10772-1-philmd@redhat.com>
 <20191012065426.10772-2-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <46d94900-e916-54e2-06e6-1963fbed3bb8@redhat.com>
Date: Mon, 18 Nov 2019 13:26:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191012065426.10772-2-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: uDfpR0SvOD2jDjrJNBcFSQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jh86qK8Uq8sq

Cc'ing qemu-trivial@

On 10/12/19 8:54 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> The hw/sd/ssi-sd.c file is orphean, add it to the SD section.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3ca814850e..47eae9fc46 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1445,6 +1445,7 @@ S: Odd Fixes
>   F: include/hw/sd/sd*
>   F: hw/sd/core.c
>   F: hw/sd/sd*
> +F: hw/sd/ssi-sd.c
>   F: tests/sd*
>  =20
>   USB
>=20

