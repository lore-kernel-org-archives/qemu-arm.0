Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp336076wrt;
        Fri, 7 Dec 2018 03:02:06 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VmKL9/jVgQtD9qgIFh+QaTfhe0CwrTD8tiU3KsAk+bqBzVPANk9yy+LDeLypLRPttdtDUz
X-Received: by 2002:a37:2815:: with SMTP id o21mr1298645qkh.225.1544180526189;
        Fri, 07 Dec 2018 03:02:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544180526; cv=none;
        d=google.com; s=arc-20160816;
        b=0KalUa1bCgTlWCT/DnnDAA0cnaUybcLCGmooin5EE45WRQinWPMM1kkNJe9TceUAw9
         85Tz+UKHmDiDRAhIYARLzMY5SNXLuaj6WREL0HXFYBd7OU9GfCwr06QsRWcCfLU8eS7E
         xngSEnxGWt8i7p0R5JC2W6iMDvScX1tcnh4O+WZv2zTQR/UXJRxTlx+SOrmyGC+rTojY
         VEoPe3opCAcuec4WCWenPCayV7uNtA4XXIwO7t8eC7FWBAeuiliWuGu9AZtu4fFH/iXD
         HJFihPpu5Cwj/9OsLcZ40I/Hyyy96JgcFP1lQxPN3g6U98wqCc4UDEiTErIv8gAtgOpx
         /u8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YIUrs2ZRmSK+XWV3HRhc+BoX1G89rN68Q+XS4sGU7Ao=;
        b=r1/v0jrwOA567CuEYf0YFGYtE84WI9S9QnZrxVpgp1EaSnGGKtxQcfMVOIuKqg2O66
         V6dzOiU9jSCSZVDQZtk3pkrhijgtpXSbLXTvdPqOKX90RkIMHyfvCs2rzFHyaPk6Uvyn
         24daEjv1VM10aHl2M7HXaiRjzvmGyqBiZxkAZL/V20H3zTGqSRJhpKJ5/X+ZRPD3sUGo
         I4IVxLodK5cqd5GaAKMYPMCbcE7OID11XYTzkcj0/Ux2FxAnfgTmm2ud0sXtu48TNnqM
         YjLLYSI52K7ICiMH+cQcwoUPLu7kuYzoVufqFHax8vkz49PLabMJBY6IFyj0dHub2KUF
         COMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=awpEPqP3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f97si2003906qtb.199.2018.12.07.03.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 03:02:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=awpEPqP3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVDtV-0003pG-NX
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 06:02:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gVDZv-0005Xr-Ps
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 05:41:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gVDZt-0003WJ-CR
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 05:41:50 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:37946)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gVDZt-0003Vo-5j
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 05:41:49 -0500
Received: by mail-ot1-x32f.google.com with SMTP id e12so3361086otl.5
	for <qemu-arm@nongnu.org>; Fri, 07 Dec 2018 02:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YIUrs2ZRmSK+XWV3HRhc+BoX1G89rN68Q+XS4sGU7Ao=;
	b=awpEPqP3WzMkTj56KJGXyOCEakMtp1BU8Hon7xO6r2V3lcvXmK29YcTmYPwc85W3GE
	6EFZUwMleVU/i2xOutN5MxTG7FuWfdtIMFtkUK1loy3JysZ6v747mK4IxfTXQ4gGcxLQ
	Io54z6Rpc0fhfacdaWFnLiT1S/IBoU7h59EGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YIUrs2ZRmSK+XWV3HRhc+BoX1G89rN68Q+XS4sGU7Ao=;
	b=T5DmKVY05MkFMc7M93RGkRBIpKwE3gsYIiWNM/ehfLbO3wBHTgU53EKsDsz/qSNU1R
	3a5bfPvwf20/3vHCMmS6xealSu5UDbM0Lac070N2L9LFXwU/dhKCDyeKoZUEJ7aSEDvK
	9aFxNe1UIOwLnhpU5zcNwlRoERYY5YyJoPW+/L5tixoQvzJENcM4smCJ49Ah+AVRYpPq
	xSl5ULHVlCTF6hWL9nEvZ8q6DqyK2gNgohituXCwEnRgL0wJyjPbAHpPHTmkhBLxnMsp
	Fk+UZnyc+0PcWWzsLY9hfs2WD1X+PcqX1Vexb0z8UZTD/XY2qFVAOMDNkHG3cX+frHDt
	eswA==
X-Gm-Message-State: AA+aEWa0Tg3vvaXP39k8UDUGx95TWkUtZCnokrmIPi8KYHDaXmh/cfFW
	0MHaNq6IsibxTstX/030Xwd+PtbCmcd/Lrekj//Uew==
X-Received: by 2002:a9d:bf7:: with SMTP id 110mr1126627oth.201.1544179308489; 
	Fri, 07 Dec 2018 02:41:48 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9qhe0ZemTkc2jkEO=_hu6PhvKUKGHC9QYTj2j+QHhNf8g@mail.gmail.com>
	<CAFEAcA8fYaKTZkLR8Ja3P590bSWy1cu61-gSxyf6+wXCfCLoxA@mail.gmail.com>
	<CAHmME9qQo4XfRgZUZDt3xbx=5KmRoYbO3N0+3m9gdKi9hvnZQA@mail.gmail.com>
In-Reply-To: <CAHmME9qQo4XfRgZUZDt3xbx=5KmRoYbO3N0+3m9gdKi9hvnZQA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Dec 2018 10:41:37 +0000
Message-ID: <CAFEAcA_3aGAZTEsuqjEnjijTnJi4QCVM09yYJ3-dwQp8wmkA3Q@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32f
Subject: Re: [Qemu-arm] more serial ports on arm?
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: smFIMpEShK04

On Fri, 7 Dec 2018 at 04:43, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Tue, Nov 20, 2018 at 11:08 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > It's still stuck, because unconditionally adding a second serial
> > port to the virt board breaks some commonly used existing guest
> > code (UEFI + Linux), and it's not clear to me what the best
> > command line UI is for allowing the user to request the second
> > serial port.
>
> Can the UI be the same more or less as for x86? Specify a second
> -serial, and then the machine gets one added? If it's in secure mode,
> then it's added as serial 3 instead of 2, to remain backwards
> compatible.

Yeah, that was more or less my plan. I just haven't done
the work of digging around to check whether it matches
what other QEMU board models have done and whether there
are any other hidden snags yet.

thanks
-- PMM
