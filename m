Received: by 10.25.0.144 with SMTP id 138csp241188lfa;
        Wed, 26 Apr 2017 04:52:53 -0700 (PDT)
X-Received: by 10.55.77.209 with SMTP id a200mr36627603qkb.11.1493207572985;
        Wed, 26 Apr 2017 04:52:52 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v133si20232564qkb.187.2017.04.26.04.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Apr 2017 04:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3LV6-0006go-E2
	for alex.bennee@linaro.org; Wed, 26 Apr 2017 07:52:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1d3LJr-0004zU-WD
	for qemu-devel@nongnu.org; Wed, 26 Apr 2017 07:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1d3LJr-00076E-8R
	for qemu-devel@nongnu.org; Wed, 26 Apr 2017 07:41:16 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:36230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bjsprakash.linux@gmail.com>)
	id 1d3LJp-00074P-8S; Wed, 26 Apr 2017 07:41:13 -0400
Received: by mail-lf0-x243.google.com with SMTP id 75so24554055lfs.3;
	Wed, 26 Apr 2017 04:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4mgFebRbhM7lxMOj4pBtvndhKGH8l6/9hGxJ0XDAUtA=;
	b=I12NQos6vmPp+nwNVKkwpqkibQE5W+meobjYhY9FjzVst4+oIYy3l+BU64/vmqincl
	WGOlFXKMVIo88Dq6+xsruN7yrCli5zNEJlEeKkX+sAV9RLOJkRKvfjLmKrEP0jbTRtmM
	UsHd7qHPCidctpmLyL3mroAHf/AYVNAHdCxKio/H0Phh6Bj52tQcW4a2Yi0jHQDZ1WNN
	YYJ111LOF2/nIpCjWNUvO9wlZ82d03q38jFSQapKqc05gXscoSY9HqKu6QgvqCKrybVE
	8SqPTS9BfLoApU9RtqT+pa6MBf8HaVhjSGsyHR+7m+nK5TwDriNKzhvTBvgABqVs46xD
	K0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4mgFebRbhM7lxMOj4pBtvndhKGH8l6/9hGxJ0XDAUtA=;
	b=drvMq2NBybsg+i8Oh5q0W5d/9tIPUDAhuO/5YoeajLdpK0U7kCU2zp4DjYjQHJwn6o
	LYAzVBWAfCvNyI/NFXLUi/dWVOOWsNarQaJlto5WmRRW/s8Vb5hj3IwUwzLma89lyT/J
	Mv2uXtHlcmcysM2dNpRyh16EX6mV/9cpMDRTPVD1lBmpa5whuo05r9/lw2bgf1jfiEeu
	eJ3tJKAtrR9HhSnvb5pqYJt93TbaCX6RRIBIyOdyNClt6jS5e913V5VJDHk4b1w7Gja4
	uajLS64npwf3wPwFdyizxXJK3F6ndKiM+5/5XcUK5ceSBNYGs+RdMaecrhIJ6GF780BF
	VDSA==
X-Gm-Message-State: AN3rC/63ZzvoPqrMr8S0eYmQW1ZA2vXA+WSQbHbgo9jqjIhDAJTB/PGW
	97XdfHl8rEVscqfU0if7Euhqo1CXWg==
X-Received: by 10.46.9.72 with SMTP id 69mr14040718ljj.61.1493206872050; Wed,
	26 Apr 2017 04:41:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.80.1 with HTTP; Wed, 26 Apr 2017 04:41:11 -0700 (PDT)
In-Reply-To: <1492173995-14140-5-git-send-email-eric.auger@redhat.com>
References: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
	<1492173995-14140-5-git-send-email-eric.auger@redhat.com>
From: Prakash B <bjsprakash.linux@gmail.com>
Date: Wed, 26 Apr 2017 17:11:11 +0530
Message-ID: <CACJhume5bvQ4tF8RCPZ8W6rEy_jfpMF2BJPYFEYu8GkajUbQkg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-devel] [RFC v5 4/4] hw/intc/arm_gicv3_its: Allow
 save/restore
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
Cc: Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
	Vijay Kilari <vijay.kilari@gmail.com>, quintela@redhat.com,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	Vijaya.Kumar@cavium.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QpniuCr5Pcb3

On Fri, Apr 14, 2017 at 6:16 PM, Eric Auger <eric.auger@redhat.com> wrote:
> We change the restoration priority of both the GICv3 and ITS. The
> GICv3 must be restored before the ITS and the ITS needs to be restored
> before PCIe devices since it translates their MSI transactions.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
Tested-by: Prakash, Brahmajyosyula <Brahmajyosyula.Prakash@cavium.com>
