Received: by 10.28.91.67 with SMTP id p64csp1792238wmb;
        Thu, 1 Mar 2018 04:51:36 -0800 (PST)
X-Google-Smtp-Source: AG47ELuvvJREeRRlIWvCsVmgT52fONS52XcBRL6QpqhnNAIRwd9O9sr4w7DY1Zd4rXYkFo1vUSAm
X-Received: by 10.129.148.196 with SMTP id l187mr875814ywg.453.1519908696078;
        Thu, 01 Mar 2018 04:51:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519908696; cv=none;
        d=google.com; s=arc-20160816;
        b=YXlLGeynLxeNuvvOTqbaoHGT1FNw5N2we4FIxy2dzvL1Tu/33j99uARSl0z4tooXY9
         j/zrRyal5dgxLstiFlN+9bxwZt5LaArY9tZKWDHiW/Lc+ECOT/H0itPUCbZENGjHIi7d
         TXMTgf+ol5ibvvxK0wmDsWyn24maeqQNlh5RbmyjtgGWwDZCZZ9214KigDLgVepza9yJ
         VHmCayy6GO1UZPyX3q7xqr2eNd1TUjXqAU9R03BA4AAM+wNpUSMrYxZDkRA9SKuQqzXh
         etgc39Ej3tM5yxWoPm5zjYBhgiit48J5jxUHM/04qLzEY+YIfFEG3eX8AWYySen9jQYg
         fmuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=mGJV+dvxoM5B6cLJ/IGVwGanc/Axt1L+cjYPbyJTCl8=;
        b=faQryE7Rx4VwURl+aYb60YTe4x9Dm0DmvC5XnbvOM4ivDEzm2LZ90TxQ1J0rWgGEVv
         weYNQPa9UHkWpJy+lNpnZj4/T1n51UuVR+zLrjJxt2JHOpRKln8awZ3IbPJSYKUMY9xw
         1EGYInwp5O0SNLUZgvNlkcqMXrLpjTiqOnkhwzeJW1URxbv7qFQkk/9+kw42zrcBAg0x
         q1ykqoTeMS9mOCqfhf8uKfyf1MyiZpM7XWS5NYzGOKBufc+CJuFVu4nYU8uphd1//bBn
         k95pvXKL0lzE9BO5yRStgaoYS93kdimtCO9NxoLOzM+8isVNa2X0M1NvZ1SxypXOe6Us
         IwYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DR4F9wra;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d72-v6si634572ybc.432.2018.03.01.04.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 04:51:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DR4F9wra;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erNgN-0006PB-JO
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 07:51:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erNfK-0005or-Lb
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 07:50:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erNfJ-0001W1-VD
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 07:50:30 -0500
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:41727)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erNfJ-0001Vm-QC
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 07:50:29 -0500
Received: by mail-oi0-x235.google.com with SMTP id g5so4350509oiy.8
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 04:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mGJV+dvxoM5B6cLJ/IGVwGanc/Axt1L+cjYPbyJTCl8=;
	b=DR4F9wraTRcOXdCNCIczy+LN9qgoi73+3wCq/g8gfiUXZ1qWAysrDZIUGX+YcPsqZ0
	ckqsHMfIUfhI4cNvRaNHOQyJn6rmpzpELHv6OI6D50PJNGLUHNxOnC97HZlssbHob2mb
	apqw0RBHRjMflOkGCXnOMCiKaITITrI8gN4Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mGJV+dvxoM5B6cLJ/IGVwGanc/Axt1L+cjYPbyJTCl8=;
	b=W1bvKXWUsgPBgZvAGsswauB/Prqi7vE/rDX7UL/ZxL70yuPlhzo5fpWfCliM15VLqf
	28b8zGgtAiM0cbFPP9kWx26EmGcyEMBgsYZMXfrDB2Df71enQphFM0OED89GCvgzZqaV
	mvOrTnRxay/h1SnPG1aoxIfFi1mrakVvabocdtb8TzGymel/Sz6RVGhfd7dHxomwOwYx
	yJYwIoMS/mF56SzaLe9bIY+S3iFJZOfxFS1kGh6lI8kwuuZQ1hlBSCOWRtDurMFCjaO5
	0QxMSXNMixV1AjdM4LbAtiJeEkj3+CYuw9OUmSWSIKLXxtH12aUyHthSMYlLGwKDaZ50
	Yx3g==
X-Gm-Message-State: AElRT7G7Q+DpIG7zf/Zxuxl2Xz2ibFEdMB7fuMwQFfYQKjjzmwgCNfCd
	whaSLYqLn4eT5/GjCBhu7eS7K8WdVHHUo4Bsn0Agwg==
X-Received: by 10.202.68.213 with SMTP id r204mr1106982oia.80.1519908629054;
	Thu, 01 Mar 2018 04:50:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 04:50:08 -0800 (PST)
In-Reply-To: <20180221113012.2ee836fb@redhat.com>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-20-peter.maydell@linaro.org>
	<20180221113012.2ee836fb@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 12:50:08 +0000
Message-ID: <CAFEAcA-i9LF26THZz8+RbJ0sv4iq9HJJ-aK2d_BrT=wu2BVavQ@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 19/19] mps2-an505: New board
 model: MPS2 with AN505 Cortex-M33 FPGA image
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
X-TUID: Eg7zZmRebRvl

On 21 February 2018 at 10:30, Igor Mammedov <imammedo@redhat.com> wrote:
> On Tue, 20 Feb 2018 18:03:25 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>

>> +typedef struct {
>> +    MachineClass parent;
>> +    MPS2TZFPGAType fpga_type;
>> +    const char *cpu_model;
> I don't see it used in this patch, should it be removed?
>

You're right; this was a leftover from when I started out
with something that looked more like hw/arm/mps2.c. I'll just
delete the struct member.

thanks
-- PMM
