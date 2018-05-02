Received: by 10.28.4.212 with SMTP id 203csp670813wme;
        Wed, 2 May 2018 05:35:04 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZri0Rfkdb7w9JD7MPfY2iuqJbgeQ2rkTT48WWKaHDNshW2RTek/H+WOm07syayl3rx9sMlU
X-Received: by 10.55.31.145 with SMTP id n17mr15375011qkh.374.1525264504314;
        Wed, 02 May 2018 05:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525264504; cv=none;
        d=google.com; s=arc-20160816;
        b=D/BMNIrBADAof/pHkblICV6WGxO3y25s76KeTjobZNRWtiwaE24GjWeU62f7eRM9J/
         1KUt4rQ3nuCi+b1wzSag+gsBsqJIKVozK9SEjB8TVcr9aaYxIN9wlzrQ6OtoLn6M62j2
         QwQRtuOG99MyqNn0Cv3NTtEbzAN9jUOVg7YZ23ZD2q+MoRV3PGpO6yHuJ/3lLaMnzuvE
         Y7H5NswW+390UDU7TzfFMzKT/CRHURjiyhf41YtSi1OTie8uFLmMYfTvtQnJ7hLBDSQY
         Jn/Jql737o0VvV2o94Vpw3iTJ1NaJPhbc6ZLc7Yl2uImj82IeLE4Yz6j9AdgmbPmGn19
         LdSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=FnHdTgeO+woye5u+KEo4oq31PVGMNO3ecX1NE88a4Mo=;
        b=zMQURuXKqCYnIwVWdxlG9B5UzSRsQcCaCNzs3XHZnjJWeU11tL4nJUID0yS0jMTlmV
         pnaoUiz1YNdkeNmzF6eVFcYi7Czks53NxMQSshHIpNJEDIcCK1YUapSKk86bhAuKOPLb
         G23S7+2lQneKOVAaUoRSOpX1/uY+YBLn29i+NGjwKvFz1sQefktw/0SJPm3RsioVyMZJ
         T7sPze5dJNY+4H5gp+8Es21MqsChgqSCBllEzqg2EVLBAUnDa5YDWwtR8LsmdtqfJY83
         PNnQxtfvfvGCZSW9LZ1DT/PaWxyTYkSTcCGA2g/dM4qC5TH+WdNmPN71qp7M7D1Mng40
         VCTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WyEElXi6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f26si1923298qki.388.2018.05.02.05.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 05:35:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WyEElXi6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDqyN-0001xi-Qt
	for alex.bennee@linaro.org; Wed, 02 May 2018 08:35:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1fDqyC-0001uy-9a
	for qemu-arm@nongnu.org; Wed, 02 May 2018 08:34:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1fDqy7-0004nl-Ap
	for qemu-arm@nongnu.org; Wed, 02 May 2018 08:34:52 -0400
Received: from mail-io0-x229.google.com ([2607:f8b0:4001:c06::229]:42915)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1fDqy7-0004mx-5x
	for qemu-arm@nongnu.org; Wed, 02 May 2018 08:34:47 -0400
Received: by mail-io0-x229.google.com with SMTP id a10-v6so17236223ioc.9
	for <qemu-arm@nongnu.org>; Wed, 02 May 2018 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FnHdTgeO+woye5u+KEo4oq31PVGMNO3ecX1NE88a4Mo=;
	b=WyEElXi6k+yrLWmFY8rpfybeBQmZQ+LPUKa15/qJH17/CcnVYi3/tSqAEW2E5i0KZP
	hUTtyh4J+F1DKsjF5OMlP2rMSUlQmAROCif9lt707xO2LC+CbkwJRzO8mm5h6o68VLx3
	Y3DcIhQJdnYZgziFPvMPqIIJOJOD9x/wRMGVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FnHdTgeO+woye5u+KEo4oq31PVGMNO3ecX1NE88a4Mo=;
	b=BVc+4G7aXdIevZfZ1dCrr1nUjzcx6r2Dl+WdFHI3AquNfAh+cZeFFNt3S4SqDGHT9a
	VzXORltFO86KfImJXED3V6zJEclpLFlxVgI43NkPQonpGZTwYaPGUXLIJ1g2+Fv+Rf07
	oiWsfNrFYyE4JlOHgysZfmJBV+fg4/1904fuUoXF9zseGFlMrqfkbUFuDsGFIejsfGq5
	vIvQYEFag4mVGQ/emaf6469OupJj3YLr2v8vwF/albqCOqLqI7VPcKOr8a7bUGtTqFF7
	fsW7QswDScJOzgt0cZIP84fJRWm4sSS84vm8nnPr/aHdJ8UV3vuktN2Ani5lnv2np4Kh
	nnow==
X-Gm-Message-State: ALQs6tDZrbbUbF5S4vO+Py12YQJwsSI6oPkAmGe9Fs7IVevDA8I5Azz5
	4SAxtLsiZC52lKGsu1TsmMH0ezK2AagqHilHKAGqTw==
X-Received: by 2002:a6b:978e:: with SMTP id
	z136-v6mr21487402iod.60.1525264485783; 
	Wed, 02 May 2018 05:34:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.187.134 with HTTP; Wed, 2 May 2018 05:34:45 -0700 (PDT)
In-Reply-To: <13d95529-d61e-fc30-ffd4-f1ef93edad40@redhat.com>
References: <f41972e8-0ae2-7c1d-a66a-499a841080e3@redhat.com>
	<13d95529-d61e-fc30-ffd4-f1ef93edad40@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 2 May 2018 14:34:45 +0200
Message-ID: <CAKv+Gu-JWfDCApNcw_mpx+y2i+Hkn_Ow3NN_U84ybgOSD_0JOQ@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::229
Subject: Re: [Qemu-arm] Expand ECAM region in machvirt 2_13?
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu list <qemu-devel@nongnu.org>, Auger Eric <eric.auger@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LKkkgKDn8zHB

On 2 May 2018 at 13:31, Laszlo Ersek <lersek@redhat.com> wrote:
> On 05/01/18 17:59, Auger Eric wrote:
>> Hi,
>>
>> I would like to resume the discussion on extending the number of PCI
>> buses to 256 (as in Q35) as a follow-up of past discussions:
>> https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg03631.html.
>>
>> With the current 16MB ECAM region we are limited to 16 PCIe busses.
>>
>> Could we envision to have a 256MB ECAM region and move it to another
>> location beyond 256GB, in virt2_13 machine type?
>>
>> Current ECAM range within [0x3f000000, 0x40000000]
>> would be kept unchanged for legacy and when vms->highmem is set to false.
>> Migration from <2_13 to >=2_13 would be allowed whereas migration from
>>> =2.13 to <2.13 wouldn't.
>
> If I understand correctly, the idea is to *move* the current one range,
> if the virt machine type is >= 2.13 and highmem is set to true (which is
> the default IIUC, from 2.12 onward).
>
> For 64-bit (AARCH64) ArmVirtQemu, that should work fine. The firmware
> takes the ECAM base and size from the "pci-host-ecam-generic" DT node,
> property "reg", uint64_t elements #0 and #1. (Sorry if this isn't exact
> DT lingo, I'm paraphrasing the firmware source code.) If the QEMU patch
> just changes the values, that should work transparently.
>
> For 32-bit (ARM) ArmVirtQemu, this change (the new ECAM default) could
> be a problem. PCI stuff in the firmware wouldn't work unless people
> specified highmem=off on the QEMU command line.
>
> Now, I notice highmen defaults to "on" starting with 2.12 even for
> "qemu-system-arm -M virt", not just "qemu-system-aarch64 -M virt", so
> why doesn't that already cause a problem with PCI in the 32-bit guest fw?
>
> Because, currently "highmen" only controls the presence of the 64-bit
> PCI MMIO aperture for BAR allocation; it has no effect on config space.
> And if the 64-bit PCI MMIO aperture is exposed to the 32-bit guest
> firmware, the latter simply ignores the former, and works with the
> 32-bit aperture solely (which is always there).
>
> So, for "qemu-system-arm -M virt" compatibility, I think we might need a
> separate machine type property, which should default to "on" only on
> qemu-system-aarch64 (if such distinctions are allowed).
>
> Of course, I can't tell if the 32-bit ArmVirtQemu firmware is possible
> to run on "qemu-system-aarch64 -M virt". (I think it is; I recall
> something something about ARMv8 having ARMv7 compat, but I don't
> remember ever trying.) If that's the case, then even the above
> suggestion won't work, because it would break 32-bit guest fw that the
> user has run (for whatever reason) on "qemu-system-aarch64 -M virt". In
> this case, I believe we can't just change the contents of the current
> "pci-host-ecam-generic" node, but we should implement some structural
> DTB addition that old firmware will simply not notice, while new
> (64-bit) firmware will specifically look for (and prefer over the old DT
> stuff).
>
> Ard, what's your take? (Sorry if you've already followed up, my email
> processing lags.)
>

Do we have any examples of ACPI platforms where the config space is
mapped above 4 GB?
I'd like to make sure that all existing code copes with that before
even considering it.
