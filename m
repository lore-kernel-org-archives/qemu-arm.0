Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9401165wrt;
        Wed, 5 Dec 2018 05:50:23 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UDg6MhY7z0kKNO0g1kTUp6rLegw/SIFSurWtf3ouTK5rEWquGf4vsvopNz/wV67DEMs68y
X-Received: by 2002:a37:1222:: with SMTP id c34mr21728365qkh.283.1544017823909;
        Wed, 05 Dec 2018 05:50:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017823; cv=none;
        d=google.com; s=arc-20160816;
        b=bRV6PUcviGAfOZgrmRwhCsPDkpHs55WNJwlOE5ptSxDRqsYALbA1BKXhXvKpeuXkWY
         rnlwn+/OzCjrvBumtfe+ZTF9wxNVX/oRcQgKPnH9qXRM3scl3uw1jPpOQj7p+tLALf/1
         20g6OnkZoKgA1bmCWnkkKV3wPVavROZo5kobImKuHWjDXgfcT9V9Uoj/6iUI5trDlXrg
         TLpOY32wk35mYYHre7J2rLBYN4buK7/hv0KoHOjUDVkBHEfxBjJnu4QiT54BkiEguyC6
         HKUsclZ8JvdKqATDlRARCeWOULNE4kohUSnAE/fnuBwxRIj2uBxUoCm5WadJBkjlslI6
         ZE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=iU4PImxCyESoZZFkb2sM6n2gI8NQ/Csplr1u4XeMHKA=;
        b=O4NQqf8KbB2r846UwYTKP9QfpUSotchhg1r6HlTqDP5FmFjvp9WqazTOYr9eIKbBCa
         +moGBHcPRJ4SocA1pGlvzczQ+D1llOwi9m3DxzGGOWSLZSNhmEfesIE0bZdE0yb4F/Zy
         fNdf8TuypeNa9w71/SwUEEjjHKquRAiTa1z5JDAmt8y0GUbh/Z52Rwgk5WTIf4TmE4nV
         6QYdxk1YfwSztJKopJWIuw7YkR8YczbhMzB81ZoIem/GeTTNgw/vLqWUiEZMkzve9qj7
         ZPOniz3ba1oH3jns5UehcWRMVNz1zwDCM6apV6RNKqAvRix38SLkvZgQFhIKKVLDIWIC
         B2lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="MqUAb/8F";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=hBEnQzb1;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=hBEnQzb1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g8si13834886qki.184.2018.12.05.05.50.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:50:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="MqUAb/8F";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=hBEnQzb1;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=hBEnQzb1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXZH-0004VD-D8
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:50:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gUXTw-0000Pr-If
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:44:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gUXTq-0006LP-Mz
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:44:52 -0500
Received: from greensocs.com ([193.104.36.180]:40232)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gUXTo-0006J5-Ne; Wed, 05 Dec 2018 08:44:45 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 50BBC441999;
	Wed,  5 Dec 2018 14:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544017475;
	bh=z0pT/iDNfCRtgPcATBjFOQ/WdomrHdIvno+XJ4UNNkQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=MqUAb/8FADuiSuB0ojfMECriUslve5eOTHTlJ2rfix+lS3tz0W0T3bxgdd8Z+NIo4
	Bx+m+Lxb2FxkQoC7e/EgkDbMf0l90ct7aTUFjO/3CiV28NIUBQoXoXcg8OxQLWdh1t
	dvgSylYyYThKQUFO/QlTRNNeYEfqFAtF/5sMoDjA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=hBEnQzb1;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=hBEnQzb1
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vTcyf5BFTuO; Wed,  5 Dec 2018 14:44:34 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 7865D556D2; Wed,  5 Dec 2018 14:44:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544017474;
	bh=z0pT/iDNfCRtgPcATBjFOQ/WdomrHdIvno+XJ4UNNkQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=hBEnQzb1v3s+sanBVe0l4n7xMsgVE4sp834hz8sc3tLH1Yh9NwoQx5cFXQciLiOCf
	tgvhsfQrcjxVBKBD5lmlu56YJUy89AywtpVaMe0IZT8oQIO4g9stXsvVe+x07Jbl6Y
	4wFnRSt3umlWQkeErbk/QDHbNGltyQdKRqjAlc68=
Received: from [192.168.61.102] (lfbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 11A85441999;
	Wed,  5 Dec 2018 14:44:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544017474;
	bh=z0pT/iDNfCRtgPcATBjFOQ/WdomrHdIvno+XJ4UNNkQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=hBEnQzb1v3s+sanBVe0l4n7xMsgVE4sp834hz8sc3tLH1Yh9NwoQx5cFXQciLiOCf
	tgvhsfQrcjxVBKBD5lmlu56YJUy89AywtpVaMe0IZT8oQIO4g9stXsvVe+x07Jbl6Y
	4wFnRSt3umlWQkeErbk/QDHbNGltyQdKRqjAlc68=
To: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
	<20181126132731.GJ18284@habkost.net>
	<CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
	<b8e20686-e5d1-a844-48f7-a4ae471e3fd5@greensocs.com>
	<CAFEAcA8j4xTiS3_ktiA0hm2N4cu5RvxAtYqUHgvY-bUXgcwbjQ@mail.gmail.com>
	<50645862-a638-ad2a-bafe-1b46be42aec4@greensocs.com>
	<20181204180607.GB18284@habkost.net>
	<CAFEAcA9JXeRGfKzouYJQKxgXuw_Z-up0a1ijZX9hZvXbdkwiuA@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <285f9e1b-2542-9a45-45da-c93ee2467815@greensocs.com>
Date: Wed, 5 Dec 2018 14:44:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9JXeRGfKzouYJQKxgXuw_Z-up0a1ijZX9hZvXbdkwiuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU
 clusters
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X+/JedWunaL+

On 12/4/18 7:24 PM, Peter Maydell wrote:
> On Tue, 4 Dec 2018 at 18:06, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> In either case, I'm still missing a clear description of what a
>> cluster is supposed to represent, exactly (see my previous reply
>> on this thread).
> 
> Here's my attempt:
> 
> A cluster is a group of CPUs which are all identical and have
> the same view of the rest of the system.
> If CPUs are not identical (for example, Cortex-A53 and
> Cortex-A57 CPUs in an Arm big.LITTLE system) they should be
> in different clusters.
> If the CPUs do not have the same view of memory (for example
> the main CPU and a management controller processor) they should
> be in different clusters.
Thanks, I'll use that as a start point for the documentation in cluster.h

-- 
Luc

> 
> I agree that this is slightly confusing, because the concept
> is on the boundary between something that's real in hardware
> (eg in a big.LITTLE setup the CPUs are in separate hardware
> clusters, and of coures a BMC processor and the main CPU
> are definitely different things) and something that we're
> defining for its effects on the GDB UI and so we can make
> sure we don't share TCG translated code where we shouldn't.
> 
> thanks
> -- PMM
> 
