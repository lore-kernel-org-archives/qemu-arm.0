Received: by 10.223.197.9 with SMTP id q9csp4491603wrf;
        Tue, 3 Oct 2017 06:55:15 -0700 (PDT)
X-Received: by 10.200.56.215 with SMTP id g23mr14737218qtc.251.1507038915844;
        Tue, 03 Oct 2017 06:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507038915; cv=none;
        d=google.com; s=arc-20160816;
        b=Kw+oymN5lTrvcAn5Esvp0Mg7IYP3vPAESP1mSA8jnw/Uo/Hga6ZuAztZIbVEjA3pU1
         hcDxEx7bq4XoTkaOIkyNZYq/oirVa9MUNk1B8UzH/pCi+WgZ0qCrrlaVuBNEUOf7PGlq
         BDEaFexep4r3vuC7hkb2BalvPj2dFfF8yFIYqcNIrg6tSihFhgxqQiI9/kTJEWTdO3Ud
         080ZXS4SEiI82L3tZsXY5NGggD7HQU1nu8aHnLkofPgQpdHXZuaHpx6bpyOPojyUtivc
         hNfrT3EtOfhjMbyx2cnXaxyVSYM5vu7Te6JhVja/UlVonXg49tS0FpG9N4imrk1m09Or
         T5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ub+VX+r1TiJwDC2KEX8g3NxCD9LY8EylwOwS0KBdOE8=;
        b=bx12yfOAu+u/drQ/uTNofbEFMy4S6ZZyQom883Pg8Gsqr1r/jv/yRufb4MU4oHYbOo
         ODnWUD6PuCQdkvn+7r6XvjGOHrKGSNogQJKLcnkVaFS36alcSLpM4HGLCsPcb0z4WCt0
         0Wx08wx+I/us4o08kF9UEDUHYTfJpBmTLO56ZBA7U9UnvGXLo5cYEig9pjHkBvYghZMm
         DMyQlxSFzuTtY78/PqfkinytO6PnNsXSmdkHlWrbQRqhgxejAVY/JP7lZVlNkp76XoEm
         fnffJSKQEuxomPL27LhVQfUMtlBV6Fj5+OgOscMdjbdOQ8PbtG4adOiwE8p1RmBguA7o
         XctA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JFEcvh0k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y128si10780687qka.241.2017.10.03.06.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Oct 2017 06:55:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JFEcvh0k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzNfH-0000dL-9v
	for alex.bennee@linaro.org; Tue, 03 Oct 2017 09:55:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dzNaN-0005Wx-F8
	for qemu-devel@nongnu.org; Tue, 03 Oct 2017 09:50:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dzNaH-0006ad-W7
	for qemu-devel@nongnu.org; Tue, 03 Oct 2017 09:50:11 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:44785)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dzNaH-0006aE-Og
	for qemu-devel@nongnu.org; Tue, 03 Oct 2017 09:50:05 -0400
Received: by mail-wr0-x236.google.com with SMTP id l24so3448665wre.1
	for <qemu-devel@nongnu.org>; Tue, 03 Oct 2017 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ub+VX+r1TiJwDC2KEX8g3NxCD9LY8EylwOwS0KBdOE8=;
	b=JFEcvh0kn8l2jrTL0qyaQak+1MnjzcN6iNk64urol1gf/yptEkiRziCpMMnQVaFT4S
	ziCh2sSJGTlctkVr4WpQZcGVUMH56tcoxwbszxrczsC16wi2RYf0uXfv8QYSdnV+dCze
	v5GOt3cZC4WTJcV63lF7xWZ0bDt9IHKiuqm+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ub+VX+r1TiJwDC2KEX8g3NxCD9LY8EylwOwS0KBdOE8=;
	b=PNesdOtYeub23I4nZAjgGhbyi1bTQ4NYa2TRDx+s7BOmJS5cj7JRg4n3EsLdd78txa
	O7MCsfzXhUfunQp/ARMBHnYT+jJ5eVIImfuHu/HJLMcghfcRkU8IV3XvzdETvrxf3Sx0
	aKqmr90ND22ywWi6Xsfh1te9svieMB7xWc+ekvQrAnuXFOBwrjNJOCiHjw9Y4bR5qXR5
	6XgEdfutcbT9qURY4xfoLp7VwBevn5LP7yewH6Bek2nn/BJJyOXtmr84BGqP3y6SdjDq
	rkJBvrEinwvNji0VAfg6WITUIBGmsNUQKIy+Kie/hcKrOzPg+AXyhwcBMaBRS428VCyk
	swaA==
X-Gm-Message-State: AMCzsaWWcoBQJxLHz7doNs5dBSshTqMWT9cgwelQgoTuNqUzNhSIrYLo
	JJGaJl+XKp+Vo1yaDFIcCkxPiDt+AUw8eWCAa130BA==
X-Google-Smtp-Source: AOwi7QBL1xMS0yyZKdyR1II6SN5j592c1lg33CL0KxRC3qap66IFos7SnJ+3Qpo88UU9n8DSykTARnZ21HgitrGCW3U=
X-Received: by 10.223.195.194 with SMTP id d2mr498838wrg.173.1507038604650;
	Tue, 03 Oct 2017 06:50:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Tue, 3 Oct 2017 06:49:16 -0700 (PDT)
In-Reply-To: <1506441116-16627-1-git-send-email-thuth@redhat.com>
References: <1506441116-16627-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Oct 2017 14:49:16 +0100
Message-ID: <CAFEAcA-V5QRwBCCEvekUvTcVtt58y=1McU41LY0z3XP-JyQsXA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-devel] [PATCH] hw/arm/xlnx-zynqmp: Mark the "xlnx,
 zynqmp" device with user_creatable = false
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NtviNjXLM53D

On 26 September 2017 at 16:51, Thomas Huth <thuth@redhat.com> wrote:
> The device uses serial_hds in its realize function and thus can't be
> used twice. Apart from that, the comma in its name makes it quite hard
> to use for the user anyway, since a comma is normally used to separate
> the device name from its properties when using the "-device" parameter
> or the "device_add" HMP command.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/xlnx-zynqmp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 2b27daf..d4b6560 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -440,6 +440,8 @@ static void xlnx_zynqmp_class_init(ObjectClass *oc, void *data)
>
>      dc->props = xlnx_zynqmp_props;
>      dc->realize = xlnx_zynqmp_realize;
> +    /* Reason: Uses serial_hds in realize function, thus can't be used twice */
> +    dc->user_creatable = false;
>  }
>
>  static const TypeInfo xlnx_zynqmp_type_info = {



Applied to target-arm.next, thanks.

-- PMM
