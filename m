Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp667365wrv;
        Tue, 16 Jul 2019 01:42:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwOhwjYhhFYwdFhFYsR3P4R9cZPDPdndP5krH5SDR1TeTKkpct4OtGEHdSjsS+rpUwCXUJs
X-Received: by 2002:a17:906:4d19:: with SMTP id r25mr24241253eju.125.1563266552472;
        Tue, 16 Jul 2019 01:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563266552; cv=none;
        d=google.com; s=arc-20160816;
        b=VXuoHSWMrBXCI5Djgnbm6seOUuJc2bcuLztMJxPWKh0tzdzzlXUZ63MCpQn73AG7h3
         mdXCYvnWIbbasrbojDv1yBm7hH/mkqpxtvd5B/MED/jVAZBYL24uA/r5R5auCCua4HHl
         mguL6HFDGksxj6swGzwtbYuxoes/aK9TJRW3fKE7H8WFMQUzQyCOpQISbVqjF5fiAFuT
         H/PuJlKqLl2Oa/yDDMrSjAWjwsGUcO80UdrOlO6go1zPNWvVM0fvwo6lOrYMCvDkyxFw
         IKZqAKRDlfrzFn36S+rzE75YN3eTXeNY1QUPEsLFIiTS9fxDQnroqNKc/Wk02syySyQg
         P5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Q/YxPxd4DxCSQMytCR8hYeli7iSJ8Ua+Zby+MH7PHRc=;
        b=eqcID8u9AonZM/Cb3u7wBCImis4MkoSh+grujhu+mYWxBBTuU2tAvtuzXq6pfsqNnE
         KhVJTMiVDX6aS6mF/k0f5mr2+3wwC9T+r6V9f28XEqZEjbO+2I6cXstrgUPeNL6TiECX
         ky1fr3QjSin4tAQ5oW0FDREU2PJBOiEAxAb7k3oEWp9ba1tY6MTkkU75uC+zU9YvuWrz
         rh7A5lICa0m8SMhLnxiSws8sLgjYhsenZUGNy3h/fsRtE/D1MlzFeBKLImaQ+iA52nrF
         fP+s2lpOsz4V3fJ2qI5d+IDIaG57EgP47BQOtvtNt5QGlTuM6p0xkrpHqhwI1wTRGofZ
         TudA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x43si11452976eda.147.2019.07.16.01.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 01:42:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnJ2d-0001La-I8
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 04:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1hnJ2a-0001LQ-Al
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 04:42:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1hnJ2Z-0008Bu-AY
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 04:42:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12613)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>)
 id 1hnJ2Z-00089r-4p; Tue, 16 Jul 2019 04:42:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 56BCC87630;
 Tue, 16 Jul 2019 08:42:25 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA06560920;
 Tue, 16 Jul 2019 08:42:22 +0000 (UTC)
To: Ramon Fried <rfried.dev@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20190615051722.13994-1-rfried.dev@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <555fb9b5-361f-fc3f-ff35-38b993a29edd@redhat.com>
Date: Tue, 16 Jul 2019 16:42:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190615051722.13994-1-rfried.dev@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 16 Jul 2019 08:42:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] net: cadence_gem: clear RX
 control descriptor
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LBZDkJ9jvUgH


On 2019/6/15 =E4=B8=8B=E5=8D=881:17, Ramon Fried wrote:
> The RX ring descriptors control field is used for setting
> SOF and EOF (start of frame and end of frame).
> The SOF and EOF weren't cleared from the previous descriptors,
> causing inconsistencies in ring buffer.
> Fix that by clearing the control field of every descriptors we're
> processing.
>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>   hw/net/cadence_gem.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index ecee22525c..d83a82bdb0 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -406,6 +406,11 @@ static inline void rx_desc_set_sof(uint32_t *desc)
>       desc[1] |=3D DESC_1_RX_SOF;
>   }
>  =20
> +static inline void rx_desc_clear(uint32_t *desc)


Nit: is this better to name this as "rx_desc_clear_control()" ?

Thanks


> +{
> +    desc[1]  =3D 0;
> +}
> +
>   static inline void rx_desc_set_eof(uint32_t *desc)
>   {
>       desc[1] |=3D DESC_1_RX_EOF;
> @@ -994,6 +999,8 @@ static ssize_t gem_receive(NetClientState *nc, cons=
t uint8_t *buf, size_t size)
>           bytes_to_copy -=3D MIN(bytes_to_copy, rxbufsize);
>  =20
>           /* Update the descriptor.  */
> +        rx_desc_clear(s->rx_desc[q]);
> +
>           if (first_desc) {
>               rx_desc_set_sof(s->rx_desc[q]);
>               first_desc =3D false;



