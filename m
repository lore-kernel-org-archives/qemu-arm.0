Received: by 10.223.159.74 with SMTP id f10csp2437700wrg;
        Mon, 11 Dec 2017 03:12:27 -0800 (PST)
X-Google-Smtp-Source: ACJfBovhI3E7sG9UHrvIEri8JrxNclfSaWrpD3FMZGgiQf1MsD1ENraBT1kgYF70TI5LbCtZmNbV
X-Received: by 10.129.162.2 with SMTP id z2mr7624ywg.89.1512990747827;
        Mon, 11 Dec 2017 03:12:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512990747; cv=none;
        d=google.com; s=arc-20160816;
        b=oIr2DkUvBnvqLSGmINQ3PVXgX1BmrJAhidFe+uzHI2ZWF7Kc03JPblEw6VUbbSIfFr
         2t5JtxaRb/9oB+d1Pol1e25HIAhYJgItjh5IhDsX/Qd5zNFrpfkb5lOFWLtYxE0/xXHg
         R2SjpRVQQyDUhx5DKgMZb1lrxWTBhGyH3zf9kiguU+gOlGO/4aqnwt7fduRBf2tHIl4i
         9hM1AIMrrilcJwhXgKUqfzNWK5QM4uVZ6zS7NsezkTCwTHjpQTL3GP4gntWWcTHuQeEp
         dRbay2fA4kFSHaM1QdIJ3cUNXPnBB8RvQduhvFGm2KXoigdbY1idcGNNoKY+3UYKlglP
         a8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=e2ghdRLQtHiAi/aOVo3MyaSTjho4g8FXAqezH5gHw4M=;
        b=DeCM7uw7Hy1v7fw451Ybnx/1PKfw6L6CZN2NTXKNUN6Qx/z5GEMGbUYV3Zhg+fSJfl
         1/Sc+gvCwquPa3++DzqIvV3dpmUM5ClQVCVyw8HvSGahAWQ7exEOizBHfYizZHXqtXHU
         q3/Yjr2dxgsTpm5Sb1RmJPJOD63mD0pBfxM+pPZz/jU3OOQVi9UmZl1p+a2OpbTjSmj1
         KcGXXwa1V0HZdHpsVpG6I4P0AF4gRRKK4sD2biCpV7QU36S08zZoJP5Bf7YrZnvQvLG3
         lK0yzOr6SJuKO43XKPs2gLk/eII2D/opYas8NBAFNdca4drtjhoOk2BXVB6Nv0yYKWwJ
         zQMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZZoNmgzB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s67si3099152ywf.183.2017.12.11.03.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 03:12:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZZoNmgzB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOM0Z-0005Cq-7b
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 06:12:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOM0O-0005Bo-IB
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 06:12:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOM0I-0005gC-P2
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 06:12:16 -0500
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:34855)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOM0I-0005fi-JR
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 06:12:10 -0500
Received: by mail-ot0-x231.google.com with SMTP id q3so14375937oth.2
	for <qemu-arm@nongnu.org>; Mon, 11 Dec 2017 03:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e2ghdRLQtHiAi/aOVo3MyaSTjho4g8FXAqezH5gHw4M=;
	b=ZZoNmgzBDRN6Zsn4nPHmadGSgBXXvovI41Sz7jis0KM9+Mw+XBo7qReOP88GfAVHx+
	+X9v1w46ZeYoknRVAwJRAHRysZr3iMcaARnjVC7ZztEE32H0H9GRJ9k1zFlICXSZtlfT
	HYYuMPOFHVF08Jky8XWMY0zN/iz4cbpgPK33g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e2ghdRLQtHiAi/aOVo3MyaSTjho4g8FXAqezH5gHw4M=;
	b=YTVJ67FQ2Fg8mnnThes5NETZTvi6HvoiVWC6WPhsZLC+dIEkrYXPAqYJAh8v5C19nz
	eqL2FnOmxe/Jc5IR6yzbGCeQQQ0t2+4nymt/X4G06N/kHfN+z5QM1BrDQl/PBMEiT8Cr
	hwtJ4g2vo6ryiuE3sIGavWTDxL2M4qzMq0FSU2nmYSogiNKOI5PKEn3bEOM9mrlwavp+
	x4DFg8jhq3x4/53neIf5X0h71N7zIPb5FUbHL39E43DgK6f58Tqsp6O61SdApaIBZbGX
	01UdcSYIqeD4kW9rnuhyl7rI1uwHo4N9ACDB58rWvIcdP6TWfy+ZEaILZ+PgVeUYBbKP
	wTxA==
X-Gm-Message-State: AJaThX5Xkn19fiGBKG4x5u9X6D83AXa2hGA2gq53YKHqRLoyWRWwVnA8
	GbWmcMwuGDhtOC9dnEQnp0WGEWgyo4dA+NjWTxYTHw==
X-Received: by 10.157.80.24 with SMTP id a24mr31787163oth.335.1512990729913;
	Mon, 11 Dec 2017 03:12:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Mon, 11 Dec 2017 03:11:49 -0800 (PST)
In-Reply-To: <20171211105546.16466-1-ppandit@redhat.com>
References: <20171211105546.16466-1-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Dec 2017 11:11:49 +0000
Message-ID: <CAFEAcA9=AzBE7CCGwHZtueyXzEGXXXSAb0ynhc-+6tzQfk5jrQ@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-arm] [PATCH] display: check irq handler index before
 access
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, qemu-arm <qemu-arm@nongnu.org>,
	Qemu Developers <qemu-devel@nongnu.org>, Moguofang <moguofang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HItrV11RhRDH

On 11 December 2017 at 10:55, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> The ctz32() routine could return value greater than
> TC6393XB_GPIOS=16. This could lead to an OOB array access.
> Add check to avoid it.
>
> Reported-by: Moguofang <moguofang@huawei.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/display/tc6393xb.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
> index 74d10af3d4..78292cb847 100644
> --- a/hw/display/tc6393xb.c
> +++ b/hw/display/tc6393xb.c
> @@ -175,6 +175,10 @@ static void tc6393xb_gpio_handler_update(TC6393xbState *s)
>
>      for (diff = s->prev_level ^ level; diff; diff ^= 1 << bit) {
>          bit = ctz32(diff);
> +        if (bit >= TC6393XB_GPIOS) {
> +            fprintf(stderr, "TC6393xb: no GPIO pin %d\n", bit);
> +            return;
> +        }
>          qemu_set_irq(s->handler[bit], (level >> bit) & 1);
>      }

It would be more sensible to just mask off the top bits of
'level' before starting the loop, rather than checking every
time around the loop:
   level &= MAKE_64BIT_MASK(0, TC6493XB_GPIOS);

Also, if we want to warn about the guest having set a GPIO
bit we don't implement this isn't the best place to do it --
it would make more sense to do that only if the guest writes
something non-zero to SCR_GPO_DSR(2), and as an LOG_UNIMP warning.
But I don't think it's worth the effort since this is only used
on the ancient 'tosa' board.

thanks
-- PMM
