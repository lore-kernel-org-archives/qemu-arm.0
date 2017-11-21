Received: by 10.223.159.82 with SMTP id f18csp965253wrg;
        Tue, 21 Nov 2017 09:45:01 -0800 (PST)
X-Google-Smtp-Source: AGs4zMav4CYvue273doqXlJ8AvSmTN7LUTeANLxEUWr/PrUVm5lmAAycw2zjsJnyQqgjUZzRXQO5
X-Received: by 10.129.103.195 with SMTP id b186mr11589720ywc.162.1511286301141;
        Tue, 21 Nov 2017 09:45:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511286301; cv=none;
        d=google.com; s=arc-20160816;
        b=IUnl6WZecQrHkp8du1fh+jg24J19H8PNg/nSmndGDMaUIUyW4O1yCqYjMV0wgprNKR
         YrNC0wHwWH9yi89ORDX+xt/85CLiv1neFTWEPo2ttV7X6+nmeC0W+vREf9nw/6Fdy1Fp
         +/SdaDHKD1zfZQwh/53nAKh/k7wqx5Gc7+HRL96KvRWEr98t7P/mAwKxMAVP05MNkky9
         B5nDKPLhdgY9uVKFv2qNRNADXLJX2q8Opb6cVm6iqSDS0hpXD9KIAAt5WXb0fNXf3Gb7
         6yOMbZNuzlmgHpLtaxkKr9dJPDMHsgIUQkV9ptT7uZhWwCIdU+k72ADOv6Xnx3mLzLQ/
         JX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=qR8D5I8FaC4HONPiCdoXwS0aCjryxsam+iR1zDWqKV0=;
        b=ph9o9UrPaT5kDJT/7T1bmCCgd7lya5HoT7xHEq+H7iOUSZTCYA/X3VHxKuQr7pIOn5
         uhcKyGwpShbLONF1FCpeP38PDc/DArNKOgDYxNn4+1EScxsxpWVIadE0oJuWLXGH/aRk
         BEUO5R9PndXx1in7aEfL+FUQNcMa2EyTeUAjWl2utsYtEiC5dpS9gr7qsqNlJOb7MBM6
         eEyZP/cKSOOvU9cS3FG/mr6P1IKngkKtHi39oNA1VUZXvF+uKrdvikaR9SVfIp7EhZmk
         L9ECj0D03RIxbHI1b7IqzQlh9tgnxQR7lCKO9n1+3PqH8sXiPrhqFzl01QeFR4PunRDx
         Frwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HQJSFeK9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v62si2945581ybi.488.2017.11.21.09.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 09:45:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HQJSFeK9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHCbU-0004Xj-K5
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 12:45:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCbK-0004XY-Bu
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 12:44:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCbJ-0006CM-Gc
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 12:44:50 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:36644)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHCbJ-0006C2-85
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 12:44:49 -0500
Received: by mail-ot0-x244.google.com with SMTP id t79so11243047ota.3
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 09:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qR8D5I8FaC4HONPiCdoXwS0aCjryxsam+iR1zDWqKV0=;
	b=HQJSFeK94Nw/w9kiE18m8Gd2xRsXE1dkfXKxul5cNdSVy+utCSbUQRI9ZSNiIISpR5
	mFNb+dvGHdlMadHUdje4K38jdh3NbQPJhyQWuIRRR1z2e9N+WFz36Rw/0adEPIPBKGgk
	4F7QZCX5aeHKkCa8LXcQgJZemEOpYUPMS1uzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qR8D5I8FaC4HONPiCdoXwS0aCjryxsam+iR1zDWqKV0=;
	b=MOtERurzjR+ZLSa+U91nef/5uXTNXRG6ymEcHjnmI3BbTDIkvUW1aV2DQw6/7mqm5o
	qBsEE9P0oNYXHP/uBujuPaxDSyQZ7DA3GBjecAyUJdZSg5rNHbbIll97hdGTXmSnppI7
	SwFxSkBFOIRSDmcXj0yIzbefNhrlL+5m4GrZjCCPZtqBedXTMUPYTt5KDUCHKr75V6hM
	qn99k3kKvMGOnGIOEe3Bt8wHnXBJhTUkiF/6bMv4ZyqHdNf4Wpr2J3Lr8Um1WjKT+/5T
	5hSSogAM0ZbRNwkfxiX8taIlH3ief7u7IXVn6A7UGzJZ8ZZlpxyIppbeLPu7dPxiTuFy
	tsKA==
X-Gm-Message-State: AJaThX4XB4E6FUfvv5b/gxMWJ3mDZI/hagEH4vSUIWNaSWfjJaHmy//6
	xgEEwaK6SW3ZmkA5TMbTD/YsYHfRJrJBmO1P0+smWw==
X-Received: by 10.157.40.7 with SMTP id m7mr11735056otb.91.1511286288388; Tue,
	21 Nov 2017 09:44:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 09:44:28 -0800 (PST)
In-Reply-To: <20171106154813.19936-8-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-8-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 17:44:28 +0000
Message-ID: <CAFEAcA8H=tSbr4hdz5eDqHPkmDx0qvuRNdttim3m1JB0YqPUnQ@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v3 07/30] imx_fec: Add support for multiple
 Tx DMA rings
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +hJxZgK0c0/a

On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> More recent version of the IP block support more than one Tx DMA ring,
> so add the code implementing that feature.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

>  static const VMStateDescription vmstate_imx_eth =3D {
>      .name =3D TYPE_IMX_FEC,
> -    .version_id =3D 2,
> -    .minimum_version_id =3D 2,
> +    .version_id =3D 3,
> +    .minimum_version_id =3D 3,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(regs, IMXFECState, ENET_MAX),
>          VMSTATE_UINT32(rx_descriptor, IMXFECState),
> -        VMSTATE_UINT32(tx_descriptor, IMXFECState),
> -
> +        VMSTATE_UINT32_ARRAY(tx_descriptor, IMXFECState, ENET_TX_RING_NU=
M),
> +        VMSTATE_UINT32(tx_ring_num, IMXFECState),
>          VMSTATE_UINT32(phy_status, IMXFECState),
>          VMSTATE_UINT32(phy_control, IMXFECState),
>          VMSTATE_UINT32(phy_advertise, IMXFECState),

tx_ring_num is constant for any particular instantiation of the device,
so you don't need to put it in the vmstate.

It's pretty trivial to make this vmstate compatible with the old
ones for the existing single-tx-descriptor devices, so we might as well:

/* Versions of this device with more than one TX descriptor
 * save the 2nd and 3rd descriptors in a subsection, to maintain
 * migration compatibility with previous versions of the device
 * that only supported a single descriptor.
 */
static bool txdescs_needed(void *opaque) {
    IMXFECState *s =3D opaque;

    return s->tx_ring_num > 1;
}

static const VMStateDescription vmstate_imx_eth_txdescs =3D {
    .name =3D "imx.fec/txdescs",
    .version_id =3D 1,
    .minimum_version_id =3D 1,
    .needed =3D txdescs_needed,
    .fields =3D (VMStateField[]) {
         VMSTATE_UINT32(tx_descriptor[1], IMXFECState),
         VMSTATE_UINT32(tx_descriptor[2], IMXFECState),
         VMSTATE_END_OF_LIST()
    }
};

and then add this to the vmx_state_eth at the end:
    .subsections =3D (const VMStateDescription*[]) {
         &vmstate_imx_eth_txdescs,
         NULL
    }

Then you don't need to bump version_id/minimum_version_id on the
vmstate_imx_eth struct.

> @@ -791,6 +821,7 @@ static void imx_eth_write(void *opaque, hwaddr offset=
, uint64_t value,
>                             unsigned size)
>  {
>      IMXFECState *s =3D IMX_FEC(opaque);
> +    const bool single_tx_ring =3D s->tx_ring_num !=3D 3;

This looks odd -- I would have expected "single_tx_ring =3D
s->tx_ring_num =3D=3D 1" ...

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
