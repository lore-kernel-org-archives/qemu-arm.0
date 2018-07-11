Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp4335078wrq;
        Tue, 10 Jul 2018 22:18:45 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf8CyV+bBjDokX4F/0Rpa1NyhUjSPR+Ev6oRj6gzEpow4I8Za2gGpgxKxzZl5eqUoYYgdtA
X-Received: by 2002:ac8:26fa:: with SMTP id 55-v6mr26338227qtp.57.1531286325484;
        Tue, 10 Jul 2018 22:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531286325; cv=none;
        d=google.com; s=arc-20160816;
        b=FRbytFLfILjD6aEOMkDir9wp5GuHU8azPMTmxV6VJGykweg9SqqooEIbGWwEyotWdo
         KiRNuuMbT5gw5CBHjJ9aRjXb0grh78PDO0SID2KuDN6/IgTsNn7gIS1zj61li+JWhDYP
         I9Iba4c6iZ5iZ8MpBUHAFhFX0C7zyyK1GqYbX9CmAm2HyIXrh2AHmSs5U9WRYTIHtEiF
         PLOlqMZNgtQNyy3ka8928Q8UJkoH3CspKyVNWJIoU/j15PxGTv5vXuZKcdGfXVZ7E2yr
         iW/UzZLTkoCUCKFIOuf9PqFPIoPsNQ3tpR/1gdEHhIdlUf7k4UwOXxkxJDpsXV1RKyCb
         hg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=1E5CvcpRKCGQtGfxXR+UxfgXkMFrBocafB0ntKdmP6A=;
        b=veWq3hsTDYVnjR+d32J7meMxrElRJs09bumvgC/UQgTp/0l/0EDQYL4Z7/2s+3PY+P
         p8+spBhvXvVDY+eqX9j5SBfH9B9jp81KxaNNyBjC8iWUOZ1vheikom8O+JVhKEX4l9mb
         nI164kSVy/QnlVlONSoJtBF1NSudlUhfP6mfNNEq2BN8dASbu5sti8Eide+etbhI73xa
         NxURgZni2vpa/bE594d0sqiXW9QD9TCOywTttmJWbBuDzB1kQVMf4AMSkm9FgYSva+Ez
         mBFfr4UNZ+CRR6xUmidAZvmO6r0tOtuDpAsf4v8hGqEpDRp6+LGG/x/QDbLJo5KjltGv
         VVcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HWomjOWx;
       dkim=fail header.i=@jms.id.au header.s=google header.b=D8+HxoJt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 198-v6si1406878qkh.21.2018.07.10.22.18.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 22:18:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HWomjOWx;
       dkim=fail header.i=@jms.id.au header.s=google header.b=D8+HxoJt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fd7WW-0005QJ-TW
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 01:18:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fd7WK-0005Oe-QH
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 01:18:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fd7WJ-0000EX-TD
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 01:18:32 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:46920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fd7WH-0000Dl-V7; Wed, 11 Jul 2018 01:18:30 -0400
Received: by mail-qt0-x241.google.com with SMTP id d4-v6so4881799qtn.13;
	Tue, 10 Jul 2018 22:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=1E5CvcpRKCGQtGfxXR+UxfgXkMFrBocafB0ntKdmP6A=;
	b=HWomjOWxrhhIfOG35wJdCj2Eh4+aKN7YLaBZN3vhjq46UyzvDFwnoemQubQ+HrH7az
	fuSH2gfea2I2vNDJxxrmVjMsK/z1iSPeCg/X4S0WclukuDpyEbsXcz0ACy0sK3G+NtqS
	xB8oF17QK2nJEsA/T+d8x0PtWSzsobNgYvlsSCOcHv6XhOMOqdU03o7gMpu8jYSVHyRW
	Xtc6W7rBBQ24npVryN9AdQGHiaffTCwYWuiVxGHAJO1vaZfC8iFBpEYxekx0YX0X83oS
	BVRTjTWrPJi7wk3xWuK9NS0MFVCED78NBu29jLjf0A0+UlQfbLwypH5IdAOAyJDvjBfl
	0ieg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=1E5CvcpRKCGQtGfxXR+UxfgXkMFrBocafB0ntKdmP6A=;
	b=D8+HxoJtKCwILhIADMdFRzLUddjgwRtuaZ8Xly/c88xukN2pcA8AjbUhQgB/VqtaTY
	XPAdstWrR4MYxWdv2Ms8Asv3PYPsZezfwRP7OsBeuDmQQ7cAdGEXYzf0XkOdqHzR+eAy
	Pt1vJ8AWEAgXAQRPnkiyuw3KbV9BLqcxxybVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=1E5CvcpRKCGQtGfxXR+UxfgXkMFrBocafB0ntKdmP6A=;
	b=ETpDPMZNljRqxOsIh0sB5QnmAKn5uiTR95SgG/RNjm+feLEw9D+XgsSdNjSleln5y2
	ExLBl5T3MahOKOq1RSOV6IjA47WhnlpdIvmpT8O94iX5li8PVMcu+G1mmh+JjZ0o3AkY
	Ik6kbrW0Ndxrf2vtcA9lVxoQCh7CbvrR5MLs9ZeQUt1raysVvVbVKoiKQdUpCLuv6M8Y
	qe/3FeVUMsXKC3xj5UGNTGp1aclayU0nGwWRRFELoVzqAM8+Cfb3kOC+tU95n8NvTDD9
	SDPx5nFa+bvCFuDEtRMJ2qKLp2VUw0voXKw+6Y4oxeFOihAs24Y4CWaPa1wynNymabiC
	pCjw==
X-Gm-Message-State: APt69E2G8Ygue5jVWND5j9MK/skSOFbbHKFhVPQdKvujGCHtnf+2UAXR
	O+8j+ADMkqaiuPN2HngDbt/LQ1+J1C64q3DIk4A=
X-Received: by 2002:ac8:679a:: with SMTP id
	b26-v6mr26755437qtp.347.1531286309215; 
	Tue, 10 Jul 2018 22:18:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 22:18:08
	-0700 (PDT)
In-Reply-To: <20180709143524.17480-1-andrew@aj.id.au>
References: <20180709143524.17480-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Jul 2018 15:18:08 +1000
X-Google-Sender-Auth: ohaF99jUsWcaiMJJLtM9oTY4ui0
Message-ID: <CACPK8XefwXLyAzga+8ya5i3iWQoV5XpBJ2zqGTFRsD2A45OPqw@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH] aspeed: Implement write-1-{set,
 clear} for AST2500 strapping
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d5NuNFcEFQgl

On 10 July 2018 at 00:35, Andrew Jeffery <andrew@aj.id.au> wrote:
> The AST2500 SoC family changes the runtime behaviour of the hardware
> strapping register (SCU70) to write-1-set/write-1-clear, with
> write-1-clear implemented on the "read-only" SoC revision register
> (SCU7C). For the the AST2400, the hardware strapping is
> runtime-configured with read-modify-write semantics.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>
