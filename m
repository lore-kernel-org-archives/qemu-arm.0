Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10787266wrt;
        Thu, 6 Dec 2018 07:57:54 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XFHXBLU2SBr5D+/9TnlE6la9kgYiCjyz0DxOzj1CmE96QPIgrmJh+MbsbY1JWmxeQKWFB4
X-Received: by 2002:aed:3a22:: with SMTP id n31mr28184397qte.29.1544111874249;
        Thu, 06 Dec 2018 07:57:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544111874; cv=none;
        d=google.com; s=arc-20160816;
        b=hhYL7yU08pmGuu0pdrdfD2U78GN+ssBMOp5cuQZ27nkyjvdhrbu+O6/SeJO+D0fuyj
         dqZoYa0jLOaF4O0Pc/i14IiY0AK0e0SX3zptJApRO0PMrhwU90FUd/PokvH4G27ao8Pn
         HU772xRwgHXeG3Jr6JbpCo3GphnYGdA/n7FEwym6IsenzRfU0xM148XwR1lnxNkjjmN7
         59g4pPqcN86oQLNOREE37O3OBXWXP60HzYkmwXEqEfrbyhjL9GvpKHOWLlqVe+1+aYQl
         rYnfhzS8O85vMdaoCFNH6M/PDtbuoT75fLWbAND56/JmFZtV+VqgI4hkIAdz+zf9f3c+
         dfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zydhDXwZex2ZGzmG4x/EcHEYNQpgSHZtHBCgs1ZJfR4=;
        b=qOhSyl71n1zJK2JXHX2HnmB+8OhxI7L89pBe63SDaHbTUQCAP59lXuvo56SjUDzHst
         zv4NbXW2RElOtNiwpdkzz7Uac7slAg4nX08CdAd6EnFpFhO9dDg4TYYqzMViSii+AWh3
         FCXSWZP8Gs1Ix2tIz3gaqdrWDeK1dCHbdn7AHp3J0Hw0pGthxkqL7Z4If3/18MHBKXSi
         zqUnmPsXT6a1JPu64wcm/GMUTRXxPi/d/RjG3PrDH4/GTKTgVpWlx/ao8Z2QCkvIJ2c8
         ObrvUGxRdctIejNhbRdkNt+r4mPAcXUUXIjP6Bxi2z7KKSglWSYsK/tAFSmraNelbyUl
         f2sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SfNQ2l78;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c48si433207qtc.275.2018.12.06.07.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 07:57:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SfNQ2l78;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUw2D-00018C-GG
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 10:57:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUw1b-00014L-E4
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 10:57:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUw1W-0006RA-8S
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 10:57:15 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34941)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gUw1T-0006Lb-O1
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 10:57:09 -0500
Received: by mail-ot1-x343.google.com with SMTP id 81so860675otj.2
	for <qemu-devel@nongnu.org>; Thu, 06 Dec 2018 07:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zydhDXwZex2ZGzmG4x/EcHEYNQpgSHZtHBCgs1ZJfR4=;
	b=SfNQ2l78IwbeaHnc7rSFVUMEWOpTJLy6jDMb1WUTrSARFp+6zuApjvvnTdhqksNH7B
	bz4cT72/mwfiiS+h8GsXXtFm9j0hy2Gzp1IwR/E3R4mFAwCoP67Gk2SIcoJcmr0ePRTW
	esrlIUmK+/n+PlRcw+l9vOLwJWnPhm9NELm/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zydhDXwZex2ZGzmG4x/EcHEYNQpgSHZtHBCgs1ZJfR4=;
	b=fTZazZ07aQfvw5rsle5aKkYdzfXs/eOp0eX3f5FDnxUmfes1Xs6XseWsQxAWtNYnDz
	4Yc4wmFY8n69FuTaY5JzrxPAUVDXKAJEIQLpAWNWy9AAP8MWLi90ZO59ZOKaVdGt8P7n
	DQYcf+K6ArQSY4JTEpsDzhtPmVjTEPwZG1Mxn6uw/8GaZsWYc9MvoFwAnpzqYk3LZyba
	LwD6Xvc8nOzM8CSn945s/ae37Zn3tcFkqdCMEZXT39VGQD38ROxDc6ijTe+LsDN+KIxw
	uteYEr5Kw010LKT94kIWHfy4y1idYTnJQWHcQ4Q76KhXxsnPiAiLg5dwSPcRPtuso4oE
	1tCg==
X-Gm-Message-State: AA+aEWaLjhf1KyOU+2YeoSHd5zwYCYH8CwYiKsGyqgQeOeSRN5lOmDnO
	6SuFlKCRrCoR8s1WR1ZLF0sY50J9EiJ7zIQmKQ86Lw==
X-Received: by 2002:a9d:3786:: with SMTP id x6mr15682704otb.238.1544111823369; 
	Thu, 06 Dec 2018 07:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20181205134243.4791-1-aaron@os.amperecomputing.com>
	<20181205134243.4791-8-aaron@os.amperecomputing.com>
In-Reply-To: <20181205134243.4791-8-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Dec 2018 15:56:52 +0000
Message-ID: <CAFEAcA8EcYu6SWYzQzLL1136RZh1XQnhcFitSkd8koMgJJ3MgA@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v9 07/14] target/arm: Define FIELDs for
 ID_DFR0
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
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WR9nb3Isby5h

On Wed, 5 Dec 2018 at 13:43, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> This is immediately necessary for the PMUv3 implementation to check
> ID_DFR0.PerfMon to enable/disable specific features, but defines the
> full complement of fields for possible future use elsewhere.
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/cpu.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 627e5c1995..304e6e47b3 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1586,6 +1586,14 @@ FIELD(ID_AA64PFR0, GIC, 24, 4)
>  FIELD(ID_AA64PFR0, RAS, 28, 4)
>  FIELD(ID_AA64PFR0, SVE, 32, 4)
>
> +FIELD(ID_DFR0, COPDBG, 0, 4)
> +FIELD(ID_DFR0, COPSDBG, 4, 4)
> +FIELD(ID_DFR0, MMAPDBG, 8, 4)
> +FIELD(ID_DFR0, COPTRC, 12, 4)
> +FIELD(ID_DFR0, MMAPTRC, 16, 4)
> +FIELD(ID_DFR0, MPROFDBG, 20, 4)
> +FIELD(ID_DFR0, PERFMON, 24, 4)

Also
FIELD(ID_DFR0, TRACEFILT, 28, 4)

(this is a v8.4 field; we might as well add it since you
have another minor tweak that needs a respin.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
