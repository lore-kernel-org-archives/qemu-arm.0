Received: by 10.223.172.38 with SMTP id v35csp739472wrc;
        Thu, 7 Sep 2017 14:45:01 -0700 (PDT)
X-Received: by 10.55.104.140 with SMTP id d134mr1064092qkc.133.1504820701428;
        Thu, 07 Sep 2017 14:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504820701; cv=none;
        d=google.com; s=arc-20160816;
        b=vDgqSI/VesAMTnA0uWR946qnpgiDS1OLVAMhMrudi96bgbBeRSi/hZHfrLvadvcvtF
         BQPpHcoLcKbzQymHOm4rFLTdklpxzt0oUg1EIhvyvqYKcwuKQ2DhLtDrXKzyt99rYNHD
         WHZNYZPvNu7pa9hA0EaGGCIRGIv6zRYD2+RNgyOLbcSdGYpqh+Mi3DTPAhDq8vrCSIFi
         NwwmowPLwrio5asM45fM4tiiVJmWtINIou1+m45ELxqkbV1RBNaFm5QU7H+vF9PItSk7
         s1EWDxfBpLcjUhS/tmSUdBCX9coWabj2wVJoWOM2ahqEXk9YTu3tI1ibhnDtJalrpagW
         z0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xCJqrr6/1VaWM2NBC22dc5FghfhMh19anwrDY0Mgf9A=;
        b=FNLo22z2FMRwebSI41aNhyrMoFmlI4AfdzFUFbUmoM465nsx7bbzYzJtt9ZOq+e4ys
         6cGEQK7/AitPCK2fZ7v70yRRbVAiwkZXy1ESgkAhG8uOxc3L1k1fQKe5PoC5jKktIaOk
         Mo1iHPJZwtFx52MoUOb9C/HE4VeaVEB4ravX9kIWacW/oAcmU2/+Sx/3YZB7+ZcBcBpn
         F3646o6Pt7m0bKKCSGdmmPDjHoxsYOjuFemCX7sMIfcBLM+7g1xrb+HDp9G/e/qtF2KS
         PHjvODNUEmy1vH6g0SgjXSvnjB3WI2TvN0MU+WjFirRfTW94NYcfR2GjzEbiNxxWm3xx
         T6/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eplhcqyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f38si367919qta.372.2017.09.07.14.45.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 14:45:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eplhcqyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dq4bb-00067b-B5
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 17:44:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dq4bR-00061Y-Sv
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 17:44:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dq4bN-0000Ps-3b
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 17:44:49 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:34986)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dq4bD-0000D3-5Z; Thu, 07 Sep 2017 17:44:35 -0400
Received: by mail-wr0-x241.google.com with SMTP id n64so416494wrb.2;
	Thu, 07 Sep 2017 14:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=xCJqrr6/1VaWM2NBC22dc5FghfhMh19anwrDY0Mgf9A=;
	b=eplhcqyPFLd8DrKNrI4WoY3Erlg/1zZWiG/Jkq1z1RYRuTxu/kx9jc4BsazAeEXEqr
	U2fY28q1UAMQlwt67oEcEFG/DiI7LxnaC3o3kND/NnY1mwsrmVJbV3r+BfKWDPNfnPG2
	JzGALW1a3CTlcE3dqBbhf2p1M98qy97m5dsxnrdg/x9fLNr0mgCdMHDQwMidODSU170c
	CaRlarqiImLRsDidF9i94ECev6s/lsvNJsOUxcvTkbiD7QyHYKMFVmjTFNjkrkFIU9h7
	LFAZdwSK09aoRskptoio27l0lwjsabq8dobPQLJeAHugXSoORAkfWSODSyba2ZtsykuA
	Wvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=xCJqrr6/1VaWM2NBC22dc5FghfhMh19anwrDY0Mgf9A=;
	b=SKV9frRKNYujPrEjfqDbTN2JJq7Cqi80kro6nvTY2jHqwpeqRfK2DB+7A7XIzG8K5Z
	apXiiRRwZLSW7AQb1TZPujx1itGcLcoU0Jq9M8N1OsDjoGeA4hHCqvCjmn+hqsq6xJXB
	nDOY3TWRo0QOD6mU4XlT9XiwA5Sf+jOxZQZqhRUVsmh3FhDYAb3YXG245VjAOUWa4vos
	sXYyMXEDOscjdnZvtkKN2o7oy/wE1o3dkwTkcqm3gQojBhInm4dz4Z9z6DuIQl+9r9Tv
	gXCe3lSloBj3yOECdPqq8jvJbXcG8p0yUUEQ2trgKYw0WUFuIbXWmmr5f17rG6GgZNco
	XXBw==
X-Gm-Message-State: AHPjjUhSZroI7ecg93DnZZ26N/e3hq8rszqIM4wBxEzrJzpcCpJ8xswf
	x7VDZPqey4Xs7+O/If5JtdZ71qaD+g==
X-Google-Smtp-Source: ADKCNb6VIfROp6SdlwCKZ7oV5bU3PW+Qb3ydKKQ8LuebaQWRBJK74wCk3U3RVN2vhZenxgVjHA+nktmGHXqFFow0zrE=
X-Received: by 10.223.163.83 with SMTP id d19mr421921wrb.84.1504820672616;
	Thu, 07 Sep 2017 14:44:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Thu, 7 Sep 2017 14:44:01 -0700 (PDT)
In-Reply-To: <20170907213525.GJ5763@toto>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
	<20170907213525.GJ5763@toto>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 7 Sep 2017 14:44:01 -0700
X-Google-Sender-Auth: njvul4M5fH2VhK_RCwiQ9vd9KXM
Message-ID: <CAKmqyKNrbdGJ2n=HHeUfJOq-EUmwbY_330DGL+BD++BtrSwnxA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-arm] [PATCH Resend v2 0/5] Expose the secure and virt
 properties to the
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
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sRA7mBH8UOQJ

On Thu, Sep 7, 2017 at 2:35 PM, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
> On Thu, Sep 07, 2017 at 08:56:55AM -0700, Alistair Francis wrote:
>>
>> The EL2 and EL3 work is working well now and interanlly we now have
>> tests that expect to start in EL3 and transition through EL2 to EL1. To
>> make this easy to run let's expose the secure property to the machine
>> and also add a virt property that can enable EL2.
>>
>> This series also does some machine/name tidying up and makes the first
>> move to deprecating the EP108 machine, which was just an early access
>> development board.
>>
>> V2:
>>  - Add a virt option for setting EL2
>
>
> Thanks Alistair!
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Thanks Edgar.

@Peter I updated the patches on the git branch I pasted earlier to
include Edgar's review.

Thanks,
Alistair

>
>
>
>>
>>
>>
>> Alistair Francis (5):
>>   xlnx-ep108: Rename to ZCU102
>>   xlnx-zcu102: Manually create the machines
>>   xlnx-zcu102: Add a machine level secure property
>>   xlnx-zcu102: Add a machine level virtualization property
>>   xlnx-zcu102: Mark the EP108 machine as deprecated
>>
>>  hw/arm/Makefile.objs         |   2 +-
>>  hw/arm/xlnx-ep108.c          | 137 -----------------------
>>  hw/arm/xlnx-zcu102.c         | 257 +++++++++++++++++++++++++++++++++++++++++++
>>  hw/arm/xlnx-zynqmp.c         |   3 +-
>>  include/hw/arm/xlnx-zynqmp.h |   2 +
>>  5 files changed, 262 insertions(+), 139 deletions(-)
>>  delete mode 100644 hw/arm/xlnx-ep108.c
>>  create mode 100644 hw/arm/xlnx-zcu102.c
>>
>> --
>> 2.11.0
>>
