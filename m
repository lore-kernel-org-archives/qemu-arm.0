Received: by 10.25.208.137 with SMTP id h131csp253566lfg;
        Wed, 4 May 2016 09:12:56 -0700 (PDT)
X-Received: by 10.194.142.240 with SMTP id rz16mr9275797wjb.126.1462378376259;
        Wed, 04 May 2016 09:12:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b186si6069363wmb.97.2016.05.04.09.12.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 09:12:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48839 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axzPi-0000vi-RD
	for alex.bennee@linaro.org; Wed, 04 May 2016 12:12:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axzPb-0000hh-CL
	for qemu-arm@nongnu.org; Wed, 04 May 2016 12:12:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axzPN-0006hF-F7
	for qemu-arm@nongnu.org; Wed, 04 May 2016 12:12:25 -0400
Received: from mail-yw0-x22c.google.com ([2607:f8b0:4002:c05::22c]:33960)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axzPM-0006cV-8j
	for qemu-arm@nongnu.org; Wed, 04 May 2016 12:12:17 -0400
Received: by mail-yw0-x22c.google.com with SMTP id j74so90096120ywg.1
	for <qemu-arm@nongnu.org>; Wed, 04 May 2016 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vsd0N5jCqUNSsaEo0UtB6QY/bxoW0KTu4JzkrJwmebw=;
	b=TOboMaNCBS3e6gZp3NTjhURXgKBGH2fGdKdzKLLz4H4H1qc6ggvo9Sh5ycu40y64h5
	dNZdUG2rRGNd3H20w8w50pYSLkWJMZEb8ungdA2TYIEq9ZmFoX6I3mWN4xQ+qOGrds/H
	s9DoUsrwwf/N5+1J2p8apxl+6H3X3k145uh1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vsd0N5jCqUNSsaEo0UtB6QY/bxoW0KTu4JzkrJwmebw=;
	b=QDMXPOGJB1dptIeQ0dm4y5yKkQBno6MwVPe+wW+RULb1QDcpTlBQ29sEQGofX9pWFC
	fLdxRZp9L7bkA3kjrV54f3dA/JqGdpJR90FNVbQ24UPju02PQfG6B18Vcxbl7ajn/DHO
	KbqueRNcKRaPGp6TQr6NFFGhiNSVXMpICzjWrBrWtbF+4i5tICjjCKEDV9oio4jhwN3i
	cVrrm5sl1Nr25+lqkEFf+DIWvqL8m8YMDcgGCeZ3m+zMjF3s4vmpibiqs6g/9aVOAyph
	7sQlAqz2SS/cxMiv970VnvyKfnKaXwpuIoNpVmoy3vOLrZA5cPTe2AjVXvg+aGysgkbb
	sRWg==
X-Gm-Message-State: AOPr4FXL60UbEniSckSws7Dcu0eDEbiUY4t8GGUSb9TeJPxTjEzGmp8YM/ZqL84QbhbgBtS/W3k6v2j/lxhwy08F
X-Received: by 10.159.54.232 with SMTP id p95mr6078010uap.107.1462378314314;
	Wed, 04 May 2016 09:11:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 4 May 2016 09:11:34 -0700 (PDT)
In-Reply-To: <1461002400-3187-1-git-send-email-afarallax@yandex.ru>
References: <1461002400-3187-1-git-send-email-afarallax@yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2016 17:11:34 +0100
Message-ID: <CAFEAcA-NuqFDO6E=6HD_wzAJGdZ9cVpMvpNFFeHpigkz1ME-Ww@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::22c
Subject: Re: [Qemu-arm] [PATCH] target-arm: Stage 2 permission fault was
 fixed in AArch32 state
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
X-TUID: 6iGBtkYyIEgp

On 18 April 2016 at 19:00, Sergey Sorokin <afarallax@yandex.ru> wrote:
> As described in AArch32.CheckS2Permission an instruction fetch fails if
> XN bit is set or there is no read permission for the address.
>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
>  target-arm/helper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 09638b2..59efb90 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -6708,7 +6708,9 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn)
>          prot |= PAGE_WRITE;
>      }
>      if (!xn) {
> -        prot |= PAGE_EXEC;
> +        if (arm_el_is_aa64(env, 2) || prot & PAGE_READ) {
> +            prot |= PAGE_EXEC;
> +        }
>      }
>      return prot;
>  }

Thanks, applied to target-arm.next.

-- PMM
