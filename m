Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp764695wru;
        Wed, 1 Aug 2018 06:32:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfeFezQyjyY2mGsjy6fc/Wc2xMZ+qqsnSFZcqOLZ/suypKooQqe0oYoAJbYGvF8w8XX7lUe
X-Received: by 2002:a0c:d5f2:: with SMTP id h47-v6mr23270137qvi.218.1533130321878;
        Wed, 01 Aug 2018 06:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533130321; cv=none;
        d=google.com; s=arc-20160816;
        b=IB9MjaYjNcJSDd8RZQCgK4ZMWH4DS4aHDYvO1oGTTVRikX8ptpfM+/bK6hlbDLJ/Q2
         e+QlKCRb9CtTxbJcuS6zErpoB6aWnIoVKOFfPp1MW/IuZQg2Q97pRH78+SdTSFuAsaK/
         qF1RUxgIBsdksI8Z45aqKQ2Jjuo2EL94q8Xd2jMM7JA5zrpJzxnNv/JpNBrmTgnNrCOW
         XDsbsneo1SUSAvQnRJX759NT6h7CsYeInW3/OdsWxia8FXrXQJ70jTG9fUV0etuRJken
         OUBzQrgcBda6/wuQJmn6xOuIOu5ik81bQ1Az3dovOVByiANw5r0juS1qzHVw3dx0K7AT
         2c0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8m29MBQJA3oEIuvarrptwvj+GIsMP0zD1HpPKwD26nw=;
        b=tgfvGf37KOkUjxLIqUthdwTYMO5BFyCpTXwOoE7miPHjAyJF0MB0lfQhXvOxB8+a0K
         a4nOw6dnrWvWDtN929OIZp8hfiLe4naLFrwjBeU8m2Bz24O75bgYBy22GW+4LKaeoEK1
         X/hn//ghceU0USrEiGJ4y7PDtI5iZ/NbeclxOKY1rFCYttlskqDYppJUIgsSAgc8/pMn
         0D79dVsFxYF4xPRQn7MMwNa9ZSxOXFCye5OBvYJOoGCtVK7vg0MsWZxrJcUYfjEtQ3C6
         Kn05OoQDfobSSEfM/cu2+g/rVUeoCZnjX9Z2W/OqcZbhyDwezKxSJUhxnJNsArs3WS41
         1NQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kq4VgHmx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t37-v6si5690600qta.92.2018.08.01.06.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 06:32:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kq4VgHmx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkrEP-0003rt-Cv
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 09:32:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkrE8-0003mu-Mn
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 09:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkrE7-00071H-Q0
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 09:31:44 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:42618)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1fkrE2-0006yS-Mr; Wed, 01 Aug 2018 09:31:38 -0400
Received: by mail-qt0-x242.google.com with SMTP id z8-v6so19807578qto.9;
	Wed, 01 Aug 2018 06:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8m29MBQJA3oEIuvarrptwvj+GIsMP0zD1HpPKwD26nw=;
	b=Kq4VgHmxeFziIfWNJP/kEqviCyXIGl0tL+j1nQI9bZZ10BVdXFzOuBXtt1dIGuQOpw
	qtp0by7ABIv/sIUek3fNdH9cYgjZ0Gmorww9YsrtL3/3PNR42QnpXavu94cghLZ0KJVC
	Oq3PezYBym007GdvKFFGq2h8dwklJgxSo0GOSLeffvrx1qZYcRA1sIIUPM2VIIzQFTIx
	W4rtzRXCEm+exXgEo2Dd5m26SBy/CDlQPivGyX4RBHK/INWr2evOsvXdT3xXrsNnCjDr
	uM6vvW59cobWR11zre2zmjitTwNTvXqRBUIjN2QEPNX6PUgrz+7SarQbK32muHyA/His
	CXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8m29MBQJA3oEIuvarrptwvj+GIsMP0zD1HpPKwD26nw=;
	b=WoRqy5wZHo+qu85ZLJOeplhbc8BEOM/+VGG5RLgyGuojmFSd5XJ13i2E4iGe1mjvNe
	K1TKSabliQPmLSarQ4GKP4xWQkP59OspXYO3luTRyQPeCwsqzTbhkJ5xOzUR6OdBmrWu
	bRKGQ1PDj2ypkSW+6Ecnk/BcrrGrpxAzW5FY2+OfR02iFJAR8WAmC+GUDk4HSKQX0LA5
	Ft3bWUHMXX0V002pStfNWX64YS9XiIt1kpLoo9kZWMVn8XlzsL8wQoJjPMNoRBIIPmwx
	0+a333K7y55GMB4E1oE1M7aHzes01o6Dmxaq/8tSD8UdJVn/74k7aLSbidx5+obi/BbD
	G7cQ==
X-Gm-Message-State: AOUpUlEytSuMDaZRXLfA4ofBboJwRWhC2QxjxjfxgbsXFPEKOBbhBgye
	PTgd3TjLUvlc1PfXtWQPoCRqIey4TAxSUz/d2rE=
X-Received: by 2002:a0c:8d8e:: with SMTP id
	t14-v6mr23454483qvb.32.1533130298111; 
	Wed, 01 Aug 2018 06:31:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:12c6:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 06:31:37 -0700 (PDT)
In-Reply-To: <20180801123111.3595-1-richard.henderson@linaro.org>
References: <20180801123111.3595-1-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Wed, 1 Aug 2018 15:31:37 +0200
Message-ID: <CABoDooOS+LgTWwxedNzwNesg_aiZjqbdT-=HaiDBZwj-QN5EQw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 0/4] target/arm sve fixes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nLc9qOJldfmt

On Wed, Aug 1, 2018 at 2:31 PM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> These four patches are minor, reported by Laurent this week.

This fixes the reported issues, thanks!

> If there happens to be an -rc4 release, it would be nice if
> they were included.  But if not, no biggie.  I suspect that
> other minor issues will be found past these four, so I would
> hope everyone who cares about sve is just as happy working
> from a branch anyway.

I indeed still have some things to look at.


Laurent

>
> r~
>
>
> Richard Henderson (4):
>   target/arm: Fix sign of sve_cmpeq_ppzw/sve_cmpne_ppzw
>   target/arm: Fix typo in do_sat_addsub_64
>   target/arm: Reorganize SVE WHILE
>   target/arm: Fix typo in helper_sve_movz_d
>
>  target/arm/sve_helper.c    | 19 ++++++--------
>  target/arm/translate-sve.c | 51 ++++++++++++++++++++++++--------------
>  2 files changed, 40 insertions(+), 30 deletions(-)
>
> --
> 2.17.1
>
