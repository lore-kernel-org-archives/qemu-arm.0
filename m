Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3843660wrq;
        Mon, 18 Jun 2018 05:11:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLeOJsdgXmAji5WOTGoK+OHI7tFrVLQJdjfDc4hjYTS/Bj0ZlbxmkTVytfT/Gxt4bqV2ZH2
X-Received: by 2002:a37:bf42:: with SMTP id p63-v6mr10030208qkf.240.1529323911570;
        Mon, 18 Jun 2018 05:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529323911; cv=none;
        d=google.com; s=arc-20160816;
        b=aNVp9yxjl9GfJvAzDNLKeDTsHlXSo6naK4KqD/TAP7hdH1bOZqRPs4H3PGg6NqfhPa
         LpeNHR5XKcbWEKy2SQQcPqx2iJO6ooaRgLt4yMz0N6mfTTxaaU+EDrm9uQ3myNutJVzu
         xopgYsaCq3LcBamDkeHSz+UHmX+J4ECOiaThdgvG9AK0hHBn0Epb3eqmSYl9EHmWbRj/
         FVLGEKUzAn93TJXfixPtAUBRShfWm2HSnvWFFMqXPRvoV8aLWoRf62pMV+8i/593+M5L
         jFZu7FZvlLfY58UfHP9SaCQqsWDo9PXc5X8xF2H6w8phCD0gtCf/5rQz0BitM/YPPWtk
         js3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=y0RZg6QvpgOBEjLao9QQ524FRzaA1fzX9cq6MMVsS7U=;
        b=OtB0hjOW9B7JIIuBqLipTNfzjLAJm1LKApiZVMH487yp4kSgTvK5yT4dZf/Rx4Q0N1
         NkCKO45c0dRbBX08VS6SJ3ldqUOMKVozOajwsPWDxuZWhv7DO3/PYXk8s4xUZdsSrSDg
         rGJ61oKYP6PpPCb3z6amkkk+AitMCSXsQd3HH+xn9Jh9NVEnuLsw5qACxLTdUHIlVQm9
         qz2PcBB/SWmmTqZFcFyGgq6iDnteyjHQm3u9mmgilOkUhuI4ujMSHpNn03Jh5ctTc5dW
         /1H+hY7PVisn9zCSJSJ77pm88PJt/1lTZVhDsxMnhflDwGZuZxXoaWrsN5ylgxnMleaQ
         vieg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CSI50fYi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p127-v6si6735412qka.116.2018.06.18.05.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jun 2018 05:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CSI50fYi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fUt0h-0006QZ-3M
	for alex.bennee@linaro.org; Mon, 18 Jun 2018 08:11:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fUt0S-0006QN-MX
	for qemu-devel@nongnu.org; Mon, 18 Jun 2018 08:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fUt0R-00050y-QP
	for qemu-devel@nongnu.org; Mon, 18 Jun 2018 08:11:36 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:38486)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fUt0R-00050U-KK
	for qemu-devel@nongnu.org; Mon, 18 Jun 2018 08:11:35 -0400
Received: by mail-ot0-x241.google.com with SMTP id p95-v6so18180563ota.5
	for <qemu-devel@nongnu.org>; Mon, 18 Jun 2018 05:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y0RZg6QvpgOBEjLao9QQ524FRzaA1fzX9cq6MMVsS7U=;
	b=CSI50fYiPJaFOKW3gLol7phLYxBgH4ktcDNY3/aPbph4ppERBpWh3CEtf4Seg1BWJ6
	WZ5abQNUprRCbINwB9WUuk605pb/DNQ8Wmt/LLHWuq8wIeqQBYF8TKMI1EGeCXfnqFav
	v8N6bAqxWLSOwNQaMtLvQ/uqG+v7WkV9mqg04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y0RZg6QvpgOBEjLao9QQ524FRzaA1fzX9cq6MMVsS7U=;
	b=qHtoRDAilVpGMEraYrgMaXgVVDT797ekntvKsZC7BEovCNXECzZ7wRcI/iscMsIJHc
	gt3dBlfQCT/lkhI2cYl6L1ILJebGuBL9rP3HZzeXGvBcHc1EhXlatxDEZ7L5a3mlJXlv
	NgUwwkKo7vYo+CS8JcOovMo5ne15aLEi2g5f9/WS8OF27sukHvPgQVAXOWt7XJnen9hc
	SjX1SGInMzKldTIxpb5J4l6UG3iiPEoSpDja4oKPUq0vjWOnudVc7ItO+HyyXjYSvHAe
	CeUsW3po5FD3IqdKR+pfG0XFGDEo1zYVLZxEp+Y9yn3qcqSJ49GEbDypZhc3W+VGJbDM
	0dFw==
X-Gm-Message-State: APt69E1FkEa2TEACqsJPnfx+qrFlsh/mhuAhjrjd7mat9N3qiJJfiYWU
	8svbxUoaQiVeHjVrVnt2pD2kZEtmGDIJFCC2v36pig==
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr8077077otd.210.1529323894901; 
	Mon, 18 Jun 2018 05:11:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 05:11:14
	-0700 (PDT)
In-Reply-To: <1425bf1a-1502-b614-ffb1-b261cb24d1de@greensocs.com>
References: <20180606093101.30518-1-luc.michel@greensocs.com>
	<20180606093101.30518-4-luc.michel@greensocs.com>
	<CAFEAcA9Oh+faKrBwDb7LAG=drkQTtbtoOrV_WUqa7twJi974yQ@mail.gmail.com>
	<1425bf1a-1502-b614-ffb1-b261cb24d1de@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jun 2018 13:11:14 +0100
Message-ID: <CAFEAcA9eU331c+hYQZ-+Y-G9iL-aUZhBpFBbFmxemfK-=ued8A@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-devel] [PATCH 3/6] intc/arm_gic: Add the virtualization
 extensions to the GIC state
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /TjC7WCHAfl4

On 18 June 2018 at 12:50, Luc Michel <luc.michel@greensocs.com> wrote:
> Indeed you are right, h_apr is a leftover that is not used in my
> implementation. I use apr[0] of the vCPU interface to store the APR
> value. If it's ok like this, I can simply remove h_apr from the struct
> and from the virt VMState.
>
> The same goes for h_eisr and h_elrsr, which are in the struct as a
> cached data, but that can be recomputed from the LRs, and thus don't
> need to be stored in the VMState. In my implementation they are
> recomputed in the VMState post_load function.
>
> If you agree with that, I'm going to publish a v2 with migration
> compatibility and without those three registers in the VMState.

Sounds fine to me (though keeping the APR in particular in the
same array as the physical APR values is the ugliest part of
maintaining migration compat so in that case I think it's worth
at least considering whether having the code look in h_apr
would be nicer overall).

Where struct fields are just cached-data, a brief comment in
the struct definition to that effect is helpful.

thanks
-- PMM
