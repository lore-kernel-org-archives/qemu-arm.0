Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1355314lff;
        Wed, 18 Dec 2019 13:29:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqw37av+kmyHviVT4F1bb+q85j9pmfSGuNChQRcPHWvPkKt7luiZ/2o1cKfTrRRZ7GYOdVlm
X-Received: by 2002:a37:bcc4:: with SMTP id m187mr5063717qkf.329.1576704568906;
        Wed, 18 Dec 2019 13:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576704568; cv=none;
        d=google.com; s=arc-20160816;
        b=umY2/4UBaRbbZvgaD0z4+RirfuqcB5ceiaXrLN2/yh2zv4PFH2sPaRmm5oU5/7zA+1
         zLZDjQPFrxXwCpF7d3yDSUuhcpsgF7/nezlIrYb2ApFAeCqxcRLL1BZQpYYzW/CCR9fa
         daTWi1TZKdqd0mk4wAyMsOgCw7qJ3Eg5OyV0QuvfvQj+Bg9aGC6H4j8xGDPaGPK8MEdD
         6wALrTNvNQZkVfZPutA9BKNA/fCvmJPyIO5cQQIfjgaNphC95ZMolv7TYebtQoA/CPsG
         +5WGFlZxO2P2eXaomh7b8i7DPbtPbxWL2FvvvWtPEZ7Csl1pr6cp5p7+8ThsQXCzydkr
         UAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/wTMVe3mHFcJ+GRI7GSpvgLdvogiRtHuB4BVxZXVU9s=;
        b=aECrRyB+ZLHPq93aN6bUZ6NRllNiZvwMkCXfKQCqxRtPpFdeyvxW2m5+Y2zEkH+tR9
         HeG0R041UajZQpdBvQnZ7GyNseRRM/JbnoYiaEy20iXb965T7DOEvW46ztl+l4KGe/pv
         MnNywiE8N1OjTOnlrHHYBynkYToV1nX2GFVCcvfRqitPm6QzlvphGsxX0npNWJbAq2mc
         v9tCEmxRutiU2w42itMIsoP7fTTGQXy8ewDGT/ws+LD04LwOmWpSZ358x1oocRzcFbIL
         SeIW+WaQr+Ibdj9fUx3/fiYDOqv8QKYyHZqE2vaXknzR9zRpo6GUCZP5DhcJqTy6HH8k
         z24Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O3fRKKTG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si2008043qth.311.2019.12.18.13.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 13:29:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O3fRKKTG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihgsq-0003To-7K
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 16:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ihgse-0003PD-P5
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 16:29:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ihgsd-0002ml-P1
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 16:29:16 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42848)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ihgsX-0002hV-4T; Wed, 18 Dec 2019 16:29:09 -0500
Received: by mail-oi1-x241.google.com with SMTP id 18so1251227oin.9;
 Wed, 18 Dec 2019 13:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/wTMVe3mHFcJ+GRI7GSpvgLdvogiRtHuB4BVxZXVU9s=;
 b=O3fRKKTGyd4E2NdolzDIwvJANQqdz1yhDuM/LCkaqacqt/xC1yXbyg3lngBdkpoIwr
 KhyCRTNwkjKwy582TvLU9ZDxhMP4oBvQXtExSqEuuOcvenloNKuTPURaQctNMO5LXk58
 OdzqM8+llpqFlbaJoKGsFJb4tq8wUw+DLGxHceSsdTcIjb4opR6xU5CQVoqR2d9JQCet
 JzDm2W6zq9eK8Y6OBD6SZMceBIl7+vwp6DUkNNiYjPtrDXEooalmUWHmuZu694k50NPw
 GM0zVT79BCPVUmu2LZL6t9jXEiXSj/JBWtIYJNFyWQUs1A2Nye/osNkOPjDgRPmcBMUd
 D1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/wTMVe3mHFcJ+GRI7GSpvgLdvogiRtHuB4BVxZXVU9s=;
 b=cM5KB6Zu7nI+sTNFFcwdQLRAGUucM7ab8MjvKL59niGrSJQO8Q9ScjAvq8gqYiKSMf
 hqMocF0vijZMv4gxcpcS7Py4x++GeLnCg7G+MZ4P/KsHIESRofSMtHNJvCwsffAGH5z9
 k24Rgi+NT7cjm5YsZ/TRq+LCpfrB7Nzy5WtkfaNG45bLrNlsKNIzUKBV1CJRZoN4ImWi
 l+GOndO8XA9FSWoUIBuzAVCBVvrvRCFqhy44mOeNd2tPYStiCjFNk3oPbI2XrNQgmk+V
 HlOeAfC2+UcUAogMc15GkRJngCyyfzI8JTy1gHK9AGSaKf5Ke6ouFLa7jTbiMVKFAwK6
 TWyw==
X-Gm-Message-State: APjAAAW/+vHpNWLi+rWp9RTlOlXjlpc+3PXEBiEDx+h2ehKuqSWBlzsh
 5c3/DH2udlb2XnpPxJOPxZz85mO8pxuNLWDfKJo=
X-Received: by 2002:a05:6808:2d5:: with SMTP id
 a21mr1548161oid.62.1576704548297; 
 Wed, 18 Dec 2019 13:29:08 -0800 (PST)
MIME-Version: 1.0
References: <20191218192526.13845-1-philmd@redhat.com>
 <20191218192526.13845-7-philmd@redhat.com>
In-Reply-To: <20191218192526.13845-7-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 18 Dec 2019 22:28:57 +0100
Message-ID: <CAL1e-=gOWYMNRo2rQ=eawnnM9+L6-mPAgTE-8ndO_etyZssLJA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/6] hw/pci-host/designware: Remove unuseful
 FALLTHROUGH comment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "open list:Stellaris" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qmsx/dAo/gRh

On Wed, Dec 18, 2019 at 8:29 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> We don't need to explicit this obvious switch fall through.
> Stay consistent with the rest of the codebase.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

I see you covered two cases of such comment (in patches 5 and 6).

But why didn't you than cover the following cases:

block/vhdx.c:            case PAYLOAD_BLOCK_NOT_PRESENT: /* fall through */
block/vhdx.c:            case PAYLOAD_BLOCK_NOT_PRESENT: /* fall through */

hw/net/rtl8139.c:    case 1: /* fall through */
hw/net/rtl8139.c:    case 2: /* fall through */

contrib/vhost-user-scsi/vhost-user-scsi.c:    case 1: /* fall through */
(this one needs full switch block reformatting, but can this be
changed, since it is in "contrib"?)

?

Thanks,
Aleksandar



> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/pci-host/designware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 71e9b0d9b5..dd245516dd 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -182,7 +182,7 @@ designware_pcie_root_config_read(PCIDevice *d, uint32=
_t address, int len)
>          break;
>
>      case DESIGNWARE_PCIE_ATU_CR1:
> -    case DESIGNWARE_PCIE_ATU_CR2:          /* FALLTHROUGH */
> +    case DESIGNWARE_PCIE_ATU_CR2:
>          val =3D viewport->cr[(address - DESIGNWARE_PCIE_ATU_CR1) /
>                             sizeof(uint32_t)];
>          break;
> --
> 2.21.0
>
>
