Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp387998lfp;
        Wed, 5 Feb 2020 09:44:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzgx3zY8N3mNBriEQat46Q7MjiZr/1x6ASozU29MU7IuOHvsTnnEKm/yQzlwV2K4WE7pTZ+
X-Received: by 2002:a37:4fc3:: with SMTP id d186mr3094667qkb.100.1580924690202;
        Wed, 05 Feb 2020 09:44:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580924690; cv=none;
        d=google.com; s=arc-20160816;
        b=UjwolCnpFA503QCdoHSJETGo1tOp9rdPhcIMCFjUR/mOFy1/TEIhF2icEa8+6oTxyg
         1NaBdymSQFVdMZkjBOG2GHUjyQ6DEEO/h3OZ03Ik1iHbCA+ETF/FjoXnFL40lGB3uA8O
         21dKZ/zRjqPvKreEJ0SpzRVLR2blNd3rOz03l3i7DdgIioZ6m+tbInGD9wL4Xf79u/LE
         YRp7EbYq//Xdna4KNoRAU4UOxgFFQvGbPkWVo10gjSFFhUsalm2UPj/1fO7ZCFKBXO12
         bYmlHDq/MVLr0K0yBYH6umBn3aTeX48zCNSAr/LYq7s9oaAAdTQOfYtM8GTM9q0JtZ/k
         j+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=m20qCS/ov/7+NPhM7zIEUTKoyl4bHuA+F0liqTdvC8A=;
        b=cjvQD0MG6uAetg56X/l1AJceXjdDr4bLdUXbeMFsvN674+xZTmTroAHo2+okZ6KCcU
         TWmRmPRN5g7cxGfBY1Y0FKcw5dls1VHaLmIZ+jGu4U00eWQyGh6+dM4LMhw2R4/l3czm
         hgGVxgIwu97UdJSBYHvc/ebS5SSi64qFug99hjCjWDyqBaEb5jqLFhnxonVP1a849CrY
         OfLflkbbWCFp1SCWVJARYINSBAfGf5EA7pw3ZzpymfDrMjJH7pRBZkxzGhhX6TVPWQS+
         YDzqBVthjmrEJgSIeEfYyIhbES1+/80OVtvPRytS5qr7KhIC9e3RwkOZWdQ4BaXS65ok
         2Hdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=byJiCR9W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a82si251426qkb.366.2020.02.05.09.44.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 09:44:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=byJiCR9W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izOjJ-0003qY-Mp
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 12:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52772)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1izOiO-0003Jb-DW
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 12:43:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1izOiN-0002Ix-AS
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 12:43:52 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36310)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1izOiK-0002DQ-Pp; Wed, 05 Feb 2020 12:43:48 -0500
Received: by mail-pg1-x542.google.com with SMTP id k3so1314244pgc.3;
 Wed, 05 Feb 2020 09:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=m20qCS/ov/7+NPhM7zIEUTKoyl4bHuA+F0liqTdvC8A=;
 b=byJiCR9W/Myhs5sIIiQltATEvcrRCXdcCQxbOvneSvB/epzHzmU/JUY2sVomXt8FvF
 E8SF4yg7rEdtKrpDcam+i0LtGWrpG8MAgQRxPPPniWVSi0jy1MS5f9x6iVX+DEgsiSPa
 D1x1TiTFDFacMLIn+ZQiQut41Kp83MkGzSM6cycbkkX1K+C/OZKhXHFaNbPl2jqpkS0i
 sNnlgkmy3Gpql+iZ4GumjxOY+Li/3wm9FkLjv3Ry/z/r/OT0QljEjuKvK8CKVElRBsfO
 fnqLQTz2jzraWI9ic3SDxlTTvs4xGrnBZFqTZifYUmsQvx7C00jVdN8vbxJ3AgDatPvP
 4yMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=m20qCS/ov/7+NPhM7zIEUTKoyl4bHuA+F0liqTdvC8A=;
 b=dBc/CQnDIQSXTMkCrN6GTzRHSm5wvJJRZZXSBv66a+pTVG+7Mm4UBfSiUsir2WX0Ro
 /1z6FZxn2RoqRlRzbCDZyteetoGVyPcldqtBhHMTcycMJ7WmTlMg3JH0b4+Z99eGJeWg
 /u2nhAROH1htChfo8m1b4Yr0gUF3TOtMEpPtZqLRYsFJ8aaR2DwAW0lDV8ukaNhUwOd0
 zJhLc0+Cw461uQTuMRUuonilhbeR+jLPui4kDeF4TSgUkyFR82GHJPxMpiiA9nigb+tI
 9n0xcQgMBMJvdPK+GDHLXLAEOo3XoNtUYETU8ia4tHrr1oeOcT+1lGunBUlULqOO8AiC
 ZbDA==
X-Gm-Message-State: APjAAAXrg0wCLEsCjYTVsuDf5Ml4Xkqt7W2JerL9TrNL9oVgMplX2S3/
 hdbasqICgdsApX/kuUNZJ0E=
X-Received: by 2002:a63:3154:: with SMTP id x81mr27267470pgx.32.1580924627389; 
 Wed, 05 Feb 2020 09:43:47 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id i6sm139610pfk.38.2020.02.05.09.43.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Feb 2020 09:43:46 -0800 (PST)
Date: Wed, 5 Feb 2020 09:43:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/3] m25p80: Improve command handling for Jedec and
 unsupported commands
Message-ID: <20200205174345.GA7754@roeck-us.net>
References: <20200203180904.2727-1-linux@roeck-us.net>
 <20200203180904.2727-2-linux@roeck-us.net>
 <accf297f-0c54-7475-8817-c1014999a57d@kaod.org>
 <7fe70871-c0e3-4ff6-bfda-17b45aa50c5e@roeck-us.net>
 <22a96987-9548-1335-8b04-00167ed9491d@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22a96987-9548-1335-8b04-00167ed9491d@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3EqZPjNgv8fX

On Wed, Feb 05, 2020 at 11:08:07AM +0100, Cédric Le Goater wrote:
> On 2/4/20 3:28 PM, Guenter Roeck wrote:
> > On 2/4/20 12:53 AM, Cédric Le Goater wrote:
> >> On 2/3/20 7:09 PM, Guenter Roeck wrote:
> >>> Always report 6 bytes of JEDEC data. Fill remaining data with 0.
> >>>
> >>> For unsupported commands, keep sending a value of 0 until the chip
> >>> is deselected.
> >>>
> >>> Both changes avoid attempts to decode random commands. Up to now this
> >>> happened if the reported Jedec data was shorter than 6 bytes but the
> >>> host read 6 bytes, and with all unsupported commands.
> >>
> >> Do you have a concrete example for that ? machine and flash model.
> >>
> > 
> > I noticed it while tracking down the bug fixed in patch 3 of the series,
> > ie with AST2500 evb using w25q256 flash, but it happens with all machines
> > using SPI NOR flash (ie all aspeed bmc machines) when running the Linux
> > kernel. Most of the time it doesn't cause harm, unless the host sends
> > an "address" as part of an unsupported command which happens to include
> > a valid command code.
> 
> ok. we will need to model SFDP one day.
> 
> Are you using the OpenBMC images or do you have your own ? 
> 

I am running images built from upstream/stable kernel branches.

Guenter

> > 
> >>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >>> ---
> >>>   hw/block/m25p80.c | 10 +++++++++-
> >>>   1 file changed, 9 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> >>> index 63e050d7d3..aca75edcc1 100644
> >>> --- a/hw/block/m25p80.c
> >>> +++ b/hw/block/m25p80.c
> >>> @@ -1040,8 +1040,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> >>>           for (i = 0; i < s->pi->id_len; i++) {
> >>>               s->data[i] = s->pi->id[i];
> >>>           }
> >>> +        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
> >>> +            s->data[i] = 0;
> >>> +        }
> >>
> >> It seems that data should be reseted in m25p80_cs() also.
> >>
> > Are you sure ?
> > 
> > The current implementation sets s->data[] as needed when command decode
> > is complete. That seems less costly to me.
> 
> ok.
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> 
> Thanks,
> 
> C.
>  
> > Thanks,
> > Guenter
> > 
> >>>   -        s->len = s->pi->id_len;
> >>> +        s->len = SPI_NOR_MAX_ID_LEN;
> >>>           s->pos = 0;
> >>>           s->state = STATE_READING_DATA;
> >>>           break;
> >>> @@ -1158,6 +1161,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> >>>           s->quad_enable = false;
> >>>           break;
> >>>       default:
> >>> +        s->pos = 0;
> >>> +        s->len = 1;
> >>> +        s->state = STATE_READING_DATA;
> >>> +        s->data_read_loop = true;
> >>> +        s->data[0] = 0;
> >>>           qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
> >>>           break;
> >>>       }
> >>>
> >>
> > 
> 
