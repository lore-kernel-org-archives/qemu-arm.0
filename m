Received: by 10.28.71.155 with SMTP id m27csp580019wmi;
        Thu, 22 Mar 2018 09:54:13 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtPpDNRBxpgRy3HySSzgDE9bHln/b22Rj7acLWTGNWKJYcj8EY6brAPsPZsAFnNec0boJh2
X-Received: by 10.233.244.72 with SMTP id z8mr24478298qkl.317.1521737653461;
        Thu, 22 Mar 2018 09:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521737653; cv=none;
        d=google.com; s=arc-20160816;
        b=D8w20hVoesWKlUG3X5fwDSx46funx69SWCAMH83xeHwfI3LwivlqFgOTydR1UCQixS
         1qgSunYeNQ/H1T4/MFwlYEMjTiKPI/hqzEUFXGo/ZQAlkbqtkkPHcaiEvc/2rz3VC3nQ
         OQYZMhucBTppaYwJXk9q2N3NC3fbApiQP2zzV9TAOf0EsbZUDmAvsxcuiY83WpsPSUnA
         fmqG7uEgD3LMM1BwcSeyeFxdauzs3EtHfUUr6Y0QFMaRs8nfe1WNJTbDTiDJ46mBw1Qh
         7ZmIb3T9X0Qs6sdRdvTK2AQhP5vI1bpzxFifZeCoQK9Y2xKot3hr0+7lJi07vq0ivTBz
         Tj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=yosD7plg4f9hIVR7FZHVCGilOJRomb0s4aLx89+su1o=;
        b=nhvUo5cxSHpxq/hKofxkm2O4hqQa6hI09Pl69VVDMkKQOfD5vOEvE2tx0e3NEfGKtj
         1wC7CVAcAPU7LolhPfcZUGP2FSCeqLkaFf58U52OxQZPJuBdwB9ygnVjLqWnUMtB/gZN
         LnCkqGj5BDREx4PHjSKwbpNZ6gWZzzXzulp88RoH90bUxjBUtUZ4QBSa3Si3IbQw2MEI
         MIkbXsY6bFMACoXk36W8EFx2WpgshWunu2aO1csa93rQXDrsE8OZLp/yi2t7MKwWIBS5
         UaHEfki0EdNg65OI5hEEFXlENJBVJbUl7mJBjUQJUwDbuzZtWuTXmB6PJrE35r/CKUbO
         638Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h24ItFDg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e132si5717788qkb.311.2018.03.22.09.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 09:54:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h24ItFDg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez3Tg-0002Qn-WA
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 12:54:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3R9-0000e4-8E
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 12:51:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3R8-00062O-Dj
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 12:51:35 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:40456)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1ez3R8-00061s-7O; Thu, 22 Mar 2018 12:51:34 -0400
Received: by mail-qt0-x243.google.com with SMTP id y6so9637410qtm.7;
	Thu, 22 Mar 2018 09:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yosD7plg4f9hIVR7FZHVCGilOJRomb0s4aLx89+su1o=;
	b=h24ItFDgVp5NYNl2p9XasONfAmiJuNJOPB2PPhMTYTnilE5bvtDb0CPOhOsyCBxYTh
	+Xsld29msQINxc7KypO1Rm/xZjQBtjBuW0rpgcqkoTOU2Wb18LRX+QWK7C/C3yxhMVfR
	wIrAfrTsBPd0AB3U3v9UFO8lvy3B7qr/+36HSzoMuxAVmxdd3LJR/94QnSLuoy/HrWe0
	fZsrTnhsij9XjEeiY733ySs6xOF3WP3CqGmsYnS1JIOI4Ov2dIW1A8cDnE3ojkUCBkxu
	CMsx8ui7DhsfqXfI+iqsL4bBT9UDL9dYyhFivWHwMkrzBeLiqtFmyLZwqFvoNnj3JwUd
	Zvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yosD7plg4f9hIVR7FZHVCGilOJRomb0s4aLx89+su1o=;
	b=pG52TScaNZRrjXC268LIE6ec2x3wG4jsouS/0ymIVWHPQLuRhCarRmIkVeVZ4z72wu
	RAXHIahXduaMti90CksAVmU2lNDk1eEUXqGEzv8yHhLwwd7gbWZlcKXfyLIX8FfSCxfk
	JVz4Q/iHqtTMPidaQQYeierNRsfZTMrbSEXHOkGfXQxbP5NeRC1cBkuetTB79QNVdFoN
	mtbGIDHBQrwTf+0QQQ5xZChIHmstKIguENCcQKZnJYWAB2PZ6i2Ew1SlvzO7ogFFbcs+
	RtxpwleK3eyXtA1XAN+01SiVCymKzL0gIorPYBee3V1D+KO/HhjAd9dxwQxNxcYPwqAU
	wgTw==
X-Gm-Message-State: AElRT7H0eBOYxHTeapaKUMz8lvA6QrI0W6+qnNzH2ABHt3VudCCKc451
	WbSzSkQAgwplTI9AlnhkzemJO6mkgCmmrFzOZrU=
X-Received: by 10.237.60.204 with SMTP id e12mr34594328qtf.243.1521737493412; 
	Thu, 22 Mar 2018 09:51:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.60.212 with HTTP; Thu, 22 Mar 2018 09:51:32 -0700 (PDT)
In-Reply-To: <20180322161226.29796-5-lvivier@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 22 Mar 2018 09:51:32 -0700
Message-ID: <CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	QEMU Trivial <qemu-trivial@nongnu.org>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nj87wg5fIsZi

On Thu, Mar 22, 2018 at 9:12 AM, Laurent Vivier <lvivier@redhat.com> wrote:
> Re-run Coccinelle script scripts/coccinelle/return_directly.cocci
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  target/xtensa/core-dc232b/xtensa-modules.c         | 56 ++++++----------------
>  target/xtensa/core-dc233c/xtensa-modules.c         | 56 ++++++----------------
>  target/xtensa/core-de212/xtensa-modules.c          | 48 +++++--------------
>  target/xtensa/core-fsf/xtensa-modules.c            | 32 ++++---------
>  .../xtensa/core-sample_controller/xtensa-modules.c | 24 +++-------

These files were autogenerated, fixing them doesn't make much sense.

-- 
Thanks.
-- Max
