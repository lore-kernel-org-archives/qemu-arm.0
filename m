Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp6102849lfb;
        Thu, 10 Dec 2020 09:21:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDT6ysfPnzT0AmKus6fQ5ejuwyHTOqrL+lcCCv/PYm4coydKsGjLmIURFDSjJD9KHc6D0/
X-Received: by 2002:a25:ca17:: with SMTP id a23mr13121045ybg.229.1607620919190;
        Thu, 10 Dec 2020 09:21:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607620919; cv=none;
        d=google.com; s=arc-20160816;
        b=Z+1qIdaAkVekQLLU1DGfmZuw3QiS3kywiQpbwujvkvl1NALkRTRd3ppsUpTwNHvXkW
         q3pWXVo7YxtUz4oHNO6Dmm1PJLa6OAsB1OLtiZd++bAhOhsvv6Z7vThgen4nvG3XMJDC
         AiRyN5TeMrYlv9pElEcgBPXsnySHU04F8i90YCW12M1xUPCysKSDpyAltmxnbbOJ6tIU
         FTF9hIOY+NzXjipCTGZXqUhiQJcx2LLWhO0FLjM+iU6ZGa8FqTrZC5mq3rssLfklXSmp
         75TM9PA6a41YGAQX2jrQqDVJNE151htLkMuJXFy0zBDuAmizIz76JXnwfZJRR4+Mg23P
         5nUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pfj1puOpiJL6VjR02uzkC4xoC7j8c4k8TsJ1EKm2VO4=;
        b=qBtNCdwB7wcQceYILGA0mWWPor20fUJhDloC0d3bifQOhlALFbcujPkcdx7+fsFYdG
         HcLv1KD9tqKXV/h6n7sKHpG7mDP6z3ZS6yLdosN69t8xdx3zj9TGv1WVd/Jvz8Jc/N7z
         FKrlPjnIpKln46IEMs1u+pOKxyLAwdckvO68aqyXiKFtj4T1jTk1JrqhysW+3feDrkTg
         5Yg5cPlRx0TElRRkQV9owB3icuwv9i/fFC4hlmDtwg5XMWACYjq+Ps9CZt3+yhzu/aiV
         4qOZXT5Fr1JJOV14ztq7Ef2SpAISs0Axv2/y7cW77zz1tvMauG9c3wUv5klIOYl+q66W
         AEvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cLI8+kdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b139si6271856ybg.237.2020.12.10.09.21.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 09:21:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cLI8+kdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knPde-00058O-BY
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 12:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1knPdH-00055M-AE
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 12:21:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1knPdB-0002uV-Mc
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 12:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607620887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pfj1puOpiJL6VjR02uzkC4xoC7j8c4k8TsJ1EKm2VO4=;
 b=cLI8+kdw1lgtw/Eloxl8kLvK/1bYWDztUliGmZf/q1czfDm2FO6kTyZUd1vI+x2oDSGpLt
 gzTU2m+Q1MhPz+MIA+Ql6ITuxLFtkzYt+/+Pd6kO5eXNtFsVTKmrBpU0Ff22Lji26KE71p
 sSW4gDQ4re59Kspi67t4PVz3ujx+GRc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234---X9xsU7NKqbzTl9vy5JJw-1; Thu, 10 Dec 2020 12:21:25 -0500
X-MC-Unique: --X9xsU7NKqbzTl9vy5JJw-1
Received: by mail-ed1-f71.google.com with SMTP id dh21so2725318edb.6
 for <qemu-arm@nongnu.org>; Thu, 10 Dec 2020 09:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pfj1puOpiJL6VjR02uzkC4xoC7j8c4k8TsJ1EKm2VO4=;
 b=kPM+37reQPenpT4aBTCIgTbAxMURP2grpiZuOcK7oFp5O5eXGrTlTqzcCgKZTwRb3Y
 XY7MqrfMCQ/ywho6oZi2nB5m+TW4ooddJElQhWnYkTm/Xc6G+mQFo7liLLDahPQ+SoeW
 acIoRQ1y4WF6vkCPefV68kju64p/ihSXrHGgrwbJVIUhsCj8J093rDPx5qu+SaL7d6zb
 JC9fT0mSJcU1rCsJ/TDeEoclp3cxg+xdlmJ3OyNhvl26X0rZG41/hCM+pifYLddMWZ72
 vOZtTbfzr/nIRG9pKu6UxaJgmHlJRafAwZ8XqWHFeJzV0MIdC50dweLJXDJEOHixbbV1
 3s/w==
X-Gm-Message-State: AOAM531umrE/Lh8xXYNvCuMLQLqWV/AOTttMdGJoXgqOHZjz4ZqCPutE
 SMgmuE+uZ/OE1vnJ2HkAvGGBQa0q8lxEKD+ljJHW6p9Xg9er4Q74Hv29O5EvN7DIDaHRDSKGcq/
 CCxBN/1SwUgBlApJ5azxd3oZlXHSY
X-Received: by 2002:a17:906:c087:: with SMTP id
 f7mr7374241ejz.492.1607620884404; 
 Thu, 10 Dec 2020 09:21:24 -0800 (PST)
X-Received: by 2002:a17:906:c087:: with SMTP id
 f7mr7374225ejz.492.1607620884230; 
 Thu, 10 Dec 2020 09:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20201210141610.884600-1-f4bug@amsat.org>
In-Reply-To: <20201210141610.884600-1-f4bug@amsat.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Thu, 10 Dec 2020 18:21:13 +0100
Message-ID: <CAA8xKjXOgSHh+MQnnLRaPCtkC-but0-Y4oi9Fi607o3iOjiiCw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/misc/zynq_slcr: Avoid #DIV/0! error
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Gaoning Pan <gaoning.pgn@antgroup.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Gaoning Pan <pgn@zju.edu.cn>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H8vaM6h5fHlV

On Thu, Dec 10, 2020 at 3:16 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Malicious user can set the feedback divisor for the PLLs
> to zero, triggering a floating-point exception (SIGFPE).
>
> As the datasheet [*] is not clear how hardware behaves
> when these bits are zeroes, use the maximum divisor
> possible (128) to avoid the software FPE.
>
> [*] Zynq-7000 TRM, UG585 (v1.12.2)
>     B.28 System Level Control Registers (slcr)
>     -> "Register (slcr) ARM_PLL_CTRL"
>     25.10.4 PLLs
>     -> "Software-Controlled PLL Update"
>
> Fixes: 38867cb7ec9 ("hw/misc/zynq_slcr: add clock generation for uarts")
> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Damien Hedde <damien.hedde@greensocs.com>
> Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Gaoning Pan <gaoning.pgn@antgroup.com>
> Cc: Mauro Matteo Cascella <mcascell@redhat.com>
>
> Alternative is to threat that as PLL disabled and return 0...
> ---
>  hw/misc/zynq_slcr.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index a2b28019e3c..66504a9d3ab 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -217,6 +217,11 @@ static uint64_t zynq_slcr_compute_pll(uint64_t input=
, uint32_t ctrl_reg)
>          return 0;
>      }
>
> +    /* Consider zero feedback as maximum divide ratio possible */
> +    if (!mult) {
> +        mult =3D 1 << R_xxx_PLL_CTRL_PLL_FPDIV_LENGTH;
> +    }
> +
>      /* frequency multiplier -> period division */
>      return input / mult;
>  }
> --
> 2.26.2
>

This patch fixes RHBZ#1906388:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1906388

Thank you,
--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0

