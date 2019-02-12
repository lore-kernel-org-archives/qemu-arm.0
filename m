Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1043086wrp;
        Tue, 12 Feb 2019 10:46:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia8qAEyjGA4XMIaf6OulqxPJuqyYYLD/dPu8LZRev/uLsUApt8BTuxlwTdD0huzlCVEqX8G
X-Received: by 2002:a5b:b85:: with SMTP id l5mr4295272ybq.123.1549997197147;
        Tue, 12 Feb 2019 10:46:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549997197; cv=none;
        d=google.com; s=arc-20160816;
        b=LCWIoS24sTc0xCv+BRi7IoDW79RCDnB3Es9WDAqcBsqYgxhJfL0rUzpE0FlyaxOlRf
         +ZWDBiZ8SnBm8vxv/Ki8CPTxg+Jp03LlZHGtMD6w/2e2q4vg6/Z8Qj3rcSxpnX2+Uxmh
         nYmgfFGGBT5otRB3pIw717Mk5Mfihhg2Pi4GXNVAZQhDaL64QnoSU1EstC63+IWbBuDl
         igRYZ87ZJCEgEsvsdsP1kOBL9NrMUtDQjXFVTp2ReHskPH1FMMRv+67joKdZhmM799lx
         MCHYGetm7xayxfEqzjsS762BNyu9bdsfR1xZ94BUfMnNc0Ni+PctZL5fmI15kxbm72iY
         Frpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=KX2YWwbAtIIH+3ykf5E+bu+Ox61bOO99G7xFohrivcI=;
        b=kM7xPK4fis2+TI7twuXlcpUy7OI79GCmTqf65q1/7p7CVMOuZKQvTRsdaSJgE7Ijor
         IVrUkyEGMwS3oIfm2LjNM9EvDB49lzMNSRmxAgOVa130VHRbNKQEA3kFrkRet8rWvEgf
         Fuju0Fo1S9G8PPBoIYqn2wGAqvX4SBtK0Ax8hDVxl0JKiB6Hl+k/05kxXO3c8ejVXOAT
         DTCFMR9NO8olXz6i6Wpq7c4SF18RnXMK1RimK9mOjpjjimxYL2mjjnDpMqqf9r/cCNOO
         n/koNGGA/11/Oldc/S4PUIxVAms7RxdPa4ih274PD1dA3EhknB4s6oimCrtVwTYwUguJ
         8aKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uND1jCpX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v127si8212684ybv.113.2019.02.12.10.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Feb 2019 10:46:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uND1jCpX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtd4m-0000ug-JG
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 13:46:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gtcm6-0003Oe-3y
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 13:27:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gtcm4-0006PQ-Ot
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 13:27:17 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40481)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gtcm4-0006OV-94
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 13:27:16 -0500
Received: by mail-ot1-x341.google.com with SMTP id s5so6099242oth.7
	for <qemu-devel@nongnu.org>; Tue, 12 Feb 2019 10:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KX2YWwbAtIIH+3ykf5E+bu+Ox61bOO99G7xFohrivcI=;
	b=uND1jCpXwlbum41fMvJkwTe45yZZqXX+Xr8FM9uXEJWDTZ0O6XWJg1xmIQWX05KuXy
	E77+2qX56GeLiIe2kxoyTNc3/jfXSWhM3Da4QtM2jCoHogFd+jSYXOdmlcwtqZL+LsvV
	U+Xgsego3GdiGTzfIByF96X0+OuuLUpuBvBfUpAHH1aTg1d4tAKo5j0U9k7oAEHRq3F5
	dbcTUvg729G/Hcu5g/U/Iy73WQgKR8Gm7txgsNEJouAGgf/ckDtNT0Jk6qIUJQqESoc1
	PKtBmyy24pJnR5KbBnZxjUL03BLnmEVW3iGNjTHLA6ZFI67i4LtPhqD2KtFvLcqMT4T0
	imVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KX2YWwbAtIIH+3ykf5E+bu+Ox61bOO99G7xFohrivcI=;
	b=OEcO+U/zrio/doFI0U+KyT3Nr4G7n+F9IkGzrQwffwRf6fuMijjI8Ipj/ZKnMXiI9F
	2c8c0sukInkZW4UmnnEG0NSBhgcYk1OhpBFMwtlb2b/y1LBdcLp43NvJchN42OsSqH3Q
	5ft9M7Ilnm4R1qUcr5dWlh44g+0Ur9n7KcA27Knd+ejOhSIpEkMwaktMWNtnm17glR9a
	dQ3Cq3QKW8LZray5dSmOs9FPZaENPBlq0PBD+b73Zd/Jv0sGBdRVXrZOJJuZHysGkVK+
	RoXYsQo0iFnQSIglgEEi1CzUftE5feMi+QLD2e6LaYOzX6ccxHpWEtRi9k55zyw4yQ6J
	sYOA==
X-Gm-Message-State: AHQUAubw+SJDuY56PI9Qd6awbdw75JikbK+Q75i16HaHsSlRjd8xY+VQ
	ytaBzfRn1JEAneAGfsZ72R6mP5y4sSXQ+ekd6GJT3w==
X-Received: by 2002:a05:6830:141a:: with SMTP id
	v26mr4763010otp.151.1549996035069; 
	Tue, 12 Feb 2019 10:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20190212181917.8322-1-peter.maydell@linaro.org>
	<fdf9bc20-2694-107e-4e27-d5db7616a367@redhat.com>
In-Reply-To: <fdf9bc20-2694-107e-4e27-d5db7616a367@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Feb 2019 18:27:03 +0000
Message-ID: <CAFEAcA85ErU5oKR2_2nOgf82ZSqJBogXY-krtJ8z=Yb0f83b5A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH] hw/intc/armv7m_nvic: Allow byte accesses
 to SHPR1
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Julia Suvorova <jusual@mail.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2VlE8qLtW+UO

On Tue, 12 Feb 2019 at 18:25, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi Peter,
>
> On 2/12/19 7:19 PM, Peter Maydell wrote:
> > The code for handling the NVIC SHPR1 register intends to permit
> > byte and halfword accesses (as the architecture requires). However
> > the 'case' line for it only lists the base address of the
> > register, so attempts to access bytes other than the first one
> > end up in the "bad write" default logic. This bug was added
> > accidentally when we split out the SHPR1 logic from SHPR2 and
> > SHPR3 to support v6M.
> >
> > Fixes: 7c9140afd594 ("nvic: Handle ARMv6-M SCS reserved registers")
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > The Zephyr RTOS happens to access SHPR1 byte at a time,
> > which is how I spotted this.
> > ---
> >  hw/intc/armv7m_nvic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> > index 790a3d95849..2fd40f9dc4c 100644
> > --- a/hw/intc/armv7m_nvic.c
> > +++ b/hw/intc/armv7m_nvic.c
> > @@ -1956,7 +1956,7 @@ static MemTxResult nvic_sysreg_write(void *opaque=
, hwaddr addr,
> >          }
> >          nvic_irq_update(s);
> >          return MEMTX_OK;
> > -    case 0xd18: /* System Handler Priority (SHPR1) */
> > +    case 0xd18 ... 0xd1b: /* System Handler Priority (SHPR1) */
>
> Can you fix the nvic_sysreg_read() case too?
>
> With that:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks for the catch -- careless of me not to check the read code too.

-- PMM
