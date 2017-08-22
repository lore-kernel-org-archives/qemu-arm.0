Received: by 10.223.188.70 with SMTP id a6csp5036892wrh;
        Tue, 22 Aug 2017 07:47:35 -0700 (PDT)
X-Received: by 10.233.222.131 with SMTP id s125mr1393666qkf.91.1503413255493;
        Tue, 22 Aug 2017 07:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503413255; cv=none;
        d=google.com; s=arc-20160816;
        b=KEvoureVEe8+9pZ19jKyYlOPNblZsQJtofv0NKuAlNIG7Mb+Q6F7tiAfeM6zK/sCaT
         SwG3yDj3ipIXTMMth4b49ZMVB9EAmKl6wFSifRTwPPs3lDtgoFaM04zAcLXIvwHIpODr
         YJxojH7LvtDpH0cRKMF4OZbyhWslD8tFr9bxP9S/tRC7ol1paAcFryFbOGJd2ECJuY5c
         4plVcKPup7G119ArwVuTSVjOQZgCy7mAqgjNmyp4CHs/rfnzYFKlvo8huKUlOYcV2/oH
         1U0AUG/dxoSC2z9AbhGz73Y1B5onz7gvAh3GgHc0m+JACCPjyzYDkoEoSb2YEbZIKWB5
         DUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=66H6q/FJ32wxpI9GwfON7xel21gN3Xl1Nz2mY2RpWFA=;
        b=r8HwvZxwHy1d4yhCGIrtxxrmvhsHm794vblAhbf0r4WWszyL16UParyPj3DCS+tfAN
         6hnDScSGxf9qwfc8mHc3v6rBPJJTuvk3kOUsTumxxHeyEO5dUpkUrLOiHqm1+5/iRYbF
         MC/fLvfkc06gA0l3dSOG47vtI8rIm38HJk0VBdVy/HKqWg4dFlRy9FrBrZr8LRcvBha1
         R5wOGrmfukXDTvBLdLrpKd7w/giI5MAJkE9X0irU1vV+AjJtxxoA6VeGMUI69HHy4rb8
         VncHZvLimnAEkP7pXNuDkXsl6G7v1SL0nykWXY5gkOeebLpD8AftT532b3q79Mec/CG3
         yj8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VkmyxsAT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y184si9313119qkb.259.2017.08.22.07.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 07:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VkmyxsAT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkASr-0002Zp-6D
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 10:47:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dk9cF-0008U8-2j
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 09:53:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dk9cB-0001i4-As
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 09:53:11 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:37563)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dk9cB-0001ha-3D
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 09:53:07 -0400
Received: by mail-wr0-x236.google.com with SMTP id z91so124302413wrc.4
	for <qemu-devel@nongnu.org>; Tue, 22 Aug 2017 06:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=66H6q/FJ32wxpI9GwfON7xel21gN3Xl1Nz2mY2RpWFA=;
	b=VkmyxsATIhc5dm/+bGAp7IrvfYmoz12r2mWMdPlJCP2TFfIkvZykRo2prdNuALuhO0
	xBLK4XD7IIMLGqpCJ5DaZ7jgbZUD9IOgi0ikpE19EfJSIPsGuoZfNz22P3ZOGJkfJnNh
	5sWHJma2ltFCxWHhb2ppu0nXGWpHMK9RhSBFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=66H6q/FJ32wxpI9GwfON7xel21gN3Xl1Nz2mY2RpWFA=;
	b=svUV3QvCvXyU4ZdoC3EcXXePFJ7y5VYcg0xCJ9RTEdNjpaYeUf7T2aDJY+kVx4KG/v
	GaCfhwhpl8NXUg/5w6iVPbeKwbEQBL9brM0hRTXA92tjQ6r70a4lYbicufRnnVERogFk
	GYJymDJOiBH/JYVD91nQmjKv019VtibK0c9n0xeCgiBcR2+z8LJqJCY/nd4CUcqONotF
	K/4sCc+rhoqOT7TydA57jbJnrHo6sfmY4VeI7AH5S2Pd3iJj321yiAKb/W2lauT1futa
	BrVF5Cz/g935KtYEb+8anYbURSXZbaz0aUbD0hTvjartoQyvcC5AY1SKIuOiqQThb3Rs
	YMBA==
X-Gm-Message-State: AHYfb5igytu0tlcsqlH97KUZALM2bwUzprWjg2DlnKKcz1ic7zMaHzoU
	fCNiTZ9reTK5H3RfIHacTZN24QzHm1Q/
X-Received: by 10.28.19.68 with SMTP id 65mr463918wmt.122.1503409985798; Tue,
	22 Aug 2017 06:53:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Tue, 22 Aug 2017 06:52:45 -0700 (PDT)
In-Reply-To: <1503407712-9894-1-git-send-email-thuth@redhat.com>
References: <1503407712-9894-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2017 14:52:45 +0100
Message-ID: <CAFEAcA-V1igN7Sz3SusczcPadtZC-z4fyw-pvPggGT5VFFMvRA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-devel] [PATCH] hw/arm/digic: Mark device with
 user_creatable = false
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LJhhYYQzzLR3

On 22 August 2017 at 14:15, Thomas Huth <thuth@redhat.com> wrote:
> QEMU currently hangs completely when the user is trying to do a
> "device_add digic" on an unrelated ARM machine like integratorcp.
> Looks like this device is not meant to be hot-pluggable at all, so
> let's simply mark it with "user_creatable = false" to avoid the hang.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/digic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/digic.c b/hw/arm/digic.c
> index 94f3263..208dfb3 100644
> --- a/hw/arm/digic.c
> +++ b/hw/arm/digic.c
> @@ -101,6 +101,8 @@ static void digic_class_init(ObjectClass *oc, void *data)
>      DeviceClass *dc = DEVICE_CLASS(oc);
>
>      dc->realize = digic_realize;
> +    /* Reason: Hangs QEMU when trying to device_add this directly */
> +    dc->user_creatable = false;
>  }

Maybe "uses serial_hds[]" is a better reason, or does it hang for
some other reason? I think we should identify why we don't expect
it to work and state that, rather than just the empirical "didn't
work for me".

Not that it really makes sense to have command line creation
of SoC objects at all really.

thanks
-- PMM
