Received: by 10.28.71.155 with SMTP id m27csp682005wmi;
        Thu, 22 Mar 2018 11:29:50 -0700 (PDT)
X-Google-Smtp-Source: AG47ELugZanUStsWS2JjoV+5hhtvHwv9vrSdwmWnMFmpY0FMDRq/ITv5QctIeafBNpY6AEqm/mAl
X-Received: by 10.237.49.105 with SMTP id 96mr37551058qtg.192.1521743390635;
        Thu, 22 Mar 2018 11:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521743390; cv=none;
        d=google.com; s=arc-20160816;
        b=YZLbRhrr4dgOOVbsFe5vmDhVmBGOt5cJ2anE6w4F5Do950zqYyPKGoX0hst7E2TPOd
         hjTAqbLqkypZShCw32UTvKiQbZEZan9fh/gNgVcqVaTkdAXDCwEnw5+d1NgEeaWNlXgd
         CN9Gxke9U1FK5lPT8qfm2oEyPotlhPym2wBDFubbVOQz3OQSTMLYastnHQqcr/v8j0fG
         Fu33Tzv6v5OICWVtL6Cdo2WWip1X7rbNqhjzYQ+LbNFBdN9jMlhOBkMMJzFki5scpHfZ
         9ixwsG4On5esYJ4iAwAJzayCKlrEL1dr+/Thu4Vy9EskHzEemfMrL3SfPxmjss603/e3
         ndcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rY8VO9sPp1fwSmhckKEV4je8urtg7x+PlsLtMhVHzQY=;
        b=FprwBAkRIs5uF1afTUvjKnfVtjsw1zh8qBu95pWUQNut67JidmC6UDFfPUBwVLBE1r
         klVMzP0qfiwJNeTO6xyzH199m4GPQkNpEk71igc+Bb2nDxG5e+wvntrD1Etukvh1WJI7
         6dhfyi+p+SsaS56Zfr7fH6wJvg2z7Y4R+4mL63NClceg58SKXCdUxXpQI5csn4T8D6vf
         FzNSIjQrQDZLAHOOT3/UMUf8SCfnZdb8Rw4Go10/9a5iiI0j8NGqaJpd+uQWiSFRaIIT
         j4BTwScZuBQiMt0TkEP0z6YDE/N5WVQVesf9a5UdZrCTdkPqRPkQR/kurkMtNtmmE8/e
         QZxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b9cGRlR9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q37si1452834qtj.486.2018.03.22.11.29.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 11:29:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b9cGRlR9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez4yE-0007jt-2z
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 14:29:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez4y1-0007ht-JN
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 14:29:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez4y0-0000KV-Or
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 14:29:37 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:42043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ez4y0-0000Jb-JB
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 14:29:36 -0400
Received: by mail-ot0-x244.google.com with SMTP id v23-v6so10543644oth.9
	for <qemu-arm@nongnu.org>; Thu, 22 Mar 2018 11:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rY8VO9sPp1fwSmhckKEV4je8urtg7x+PlsLtMhVHzQY=;
	b=b9cGRlR9dsT4XMFx2R3FqhFObN7MYXxbfVhj3Y5FLoO5WuLVjr4ZESHmdKyo/Ag4r6
	oX10MPZ7STKE2ok1sqXFlrC7AqA3t7jn2eget3f7zOvozZkrJTcBBXmJOPcyjJaunszD
	XQ2lMStN1X1dj0GHwqOZtrt0TWRLZ8PTlqmPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rY8VO9sPp1fwSmhckKEV4je8urtg7x+PlsLtMhVHzQY=;
	b=QzXiAKI7AGLavoFDvR2HKGtGBbMpAwNgazIqySYotMHqecq2FSwnCsavPku0gp8lg9
	GqxzNTXN9BlMw1VYUWaHc6BBV47riGMwRp+PaZpPNKbEltoQMNR+c9Ip7/sS7uYuFvhh
	QnWte2oT6BsYtgOtJlSqiz8fMCDEHesdGY/pX4ksfV03jkqz0OhnUMcm4lQ+Ln4wBsa0
	Vma8M67ALqpgkCn90JXoShrFPGqoaKFScePyMEj+IgRqzNC0iM0pnHNaxMcwinZ0inx6
	0SBmoyjWYwutTBoe7IsA8cY66OoYUbmVSMX+Z0fhKg6SI8e1XhsunKbbf0ac2gBERxBO
	ynpg==
X-Gm-Message-State: AElRT7EyRRp6P1YhAiVAspnwrQzbSsNYwdDOiONNJHYmSEvqXuCBOmOJ
	kdL9B4Q3UaGXEAEQFFNtjTS/DA9wznEqyt0IY/8WUA==
X-Received: by 2002:a9d:2ae1:: with SMTP id
	e88-v6mr17058518otb.308.1521743375866; 
	Thu, 22 Mar 2018 11:29:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 11:29:15
	-0700 (PDT)
In-Reply-To: <20180322142343.jvc6pxxvl5zhfjgy@hawk.localdomain>
References: <20180315133441.24149-1-peter.maydell@linaro.org>
	<20180322142343.jvc6pxxvl5zhfjgy@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 18:29:15 +0000
Message-ID: <CAFEAcA8Vti8NnrQK4U4kLuk=nNMC5=KiKjc6wT7cLDnCHFj-8w@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12] hw/intc/arm_gicv3: Fix
 secure-GIC NS ICC_PMR and ICC_RPR accesses
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GxyRi/HMulJw

On 22 March 2018 at 14:23, Andrew Jones <drjones@redhat.com> wrote:
> On Thu, Mar 15, 2018 at 01:34:41PM +0000, Peter Maydell wrote:
>> If the GIC has the security extension support enabled, then a
>> non-secure access to ICC_PMR must take account of the non-secure
>> view of interrupt priorities, where real priorities 0..0x7f
>> are secure-only and not visible to the non-secure guest, and
>> priorities 0x80..0xff are shown to the guest as if they were
>> 0x00..0xff. We had the logic here wrong:
>
> 0x00..0x7f

I think 0x00..0xff is correct. The conversion from actual
priority value to the NS-view is
   if (prio & 0x80 == 0) {
       nsview = 0;
   } else {
       nsview = (prio << 1) & 0xff;
   }

so:
   real priority     NS view
    0x80              0x00
    0x90              0x20
    0xa0              0x40
    0xb0              0x60
    0xc0              0x80
    0xd0              0xa0
    0xe0              0xc0
    0xf0              0xe0

the NS view covers the whole 0x00..0xff range, but more sparsely.
(OK, technically you can't ever read 0xff, only 0xfe.)

> Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks for the review.

-- PMM
