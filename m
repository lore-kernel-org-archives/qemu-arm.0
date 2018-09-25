Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp499499wrt;
        Tue, 25 Sep 2018 03:32:08 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60vhfV+OHaOkr9T7Bw32BbSaZPQEhmO8NwYpvcYkSvrm+ecVIDQsuFqazJ38uscRM3Oszx6
X-Received: by 2002:a0c:ad8e:: with SMTP id w14-v6mr197346qvc.149.1537871527955;
        Tue, 25 Sep 2018 03:32:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537871527; cv=none;
        d=google.com; s=arc-20160816;
        b=1E8Pupe2cBII2TkVjn+dWvYiRmaZbeGygayn4T/N7XmmsaoVLw9j7R7fNPQGu36sD7
         cYaRMTfnTZ8hohz3X4pco0PfGdXuXqL5vCvjwIifQ+IRZW7vTa/r3NMhLhqDJODDPpJA
         tGNx59liaQjZGqmgd5dyTypR4igmjCMja8oF74WbBMgufcFLHq7N1C0CnGKrnek6Wuak
         XbAbkEXYzXh8SoaxMqmlxdChzhz3OADsw0uHq4Csy9O1JLNTi5h/2cEy3AuoyOXoRCaK
         VTC6AUwbpi0aUDDN4EK45OBVHmKzK6vH8oixIG4XZAxs1k/Iupfgp0Gb4xLWvUHw70UH
         Xb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=NTQ6fJ79OsKPXfPaEFlXvjXIE7Hmcmi8Wt0e8gij7L0=;
        b=HchF2bVylsFILmuXQJpnveJxeug/88lmaPOj4Br8jzkzgFCR0Bfs8tm+nA3SOBfIlq
         bsqe7dyi3BGxPrTn4s659/opO+xdMVntWrWC+C9KA8cNMH0m8IlYCWGR2H+ia2iocO9g
         v8CEc/d08KzInQQV53mqqkrt4Ev63S806Bd9dLvmXTbATb58Hk4J3xdFshdHaO7gnWkT
         nSj2kugXIJDmtvHIeTnrCOCf1jhSmNaVH9diU+5RD458STNFUyhkecPz5mTTWj9s4Zbo
         tdxd0/6iVMnSn1Tpsw4pCzNS6jShpRB3uGMqPR+fi63bVVmrqKZ/GIphpALVBMx2kpPb
         nTAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X+I1U3xx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6-v6si1454625qvb.284.2018.09.25.03.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 03:32:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X+I1U3xx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52061 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4kdT-00076X-DY
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 06:32:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kcq-00074e-3G
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:31:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kco-0007VN-0h
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:31:27 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45925)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4kcm-0007Oo-0s
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:31:24 -0400
Received: by mail-oi1-x241.google.com with SMTP id d63-v6so1028516oic.12
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 03:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NTQ6fJ79OsKPXfPaEFlXvjXIE7Hmcmi8Wt0e8gij7L0=;
	b=X+I1U3xxod8elqkxpEDS64KrU+NToURRgJk9M1JDp2HU1KOWSjnsQj04KG/T0kEom5
	xzxEU+qM3Ay9GDRa2Ytxz0CZVeQm3nDWrXPhSihWRkjT5Gp53tEWWv72DYB8FX78C2A6
	2ZQUNARgR1cElKdjNBRMIJkPPHwORIw6VbPuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NTQ6fJ79OsKPXfPaEFlXvjXIE7Hmcmi8Wt0e8gij7L0=;
	b=O657sESOBkggaMkyUI9RAU+f6A0QYBLaDOeUCnkZ382zgXNKmsUTXt7h1o9oT1WB9R
	qz/7tBgVTmDFDrJnLMEuGdwUvYssJB2Ie+NmmOPyVJPyf7BDewgT8nDQ4yIhTsWSsBF9
	yiwhb+xFmbFFPH4jPZohVa0D1IvbGcnMYctVBKfhQFt9sQHMG8G6R3+f62O+XzOAXJLh
	dsxYu0HE57vJ812FAt7R+BFo9xPg8UyEZ340tA6XZ8BGweOvqmYI1/u28mkLd2jPMNuQ
	q4mm/x+/+eu5l9F0YFbCMQsuuJK5yNcHcn4/Rmfd0SZJuZrW+v/Wme4AUkVPnX1muHC+
	Vf9A==
X-Gm-Message-State: ABuFfohM1rH4jiPVCqJ/tXe8bFJ0RDvOf0OuvK98+X1BTD5kNNfIwcsH
	kg/ydbXoZC6hrWO0qrwdYMaA85ZvBKq2JaXgwKFbxA==
X-Received: by 2002:aca:6898:: with SMTP id o24-v6mr206944oik.44.1537871478005;
	Tue, 25 Sep 2018 03:31:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 03:30:57
	-0700 (PDT)
In-Reply-To: <0d9483b2-eab3-3361-8d10-bd31bb11e169@greensocs.com>
References: <20180823103818.31189-1-peter.maydell@linaro.org>
	<0d9483b2-eab3-3361-8d10-bd31bb11e169@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 11:30:57 +0100
Message-ID: <CAFEAcA-Zg95BbobEQ0B1NhYdx0skYJ-n0XFxcXQkt9QxHfwZ8Q@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v2] hw/intc/arm_gic: Document QEMU interface
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tC33tFbrWc9d

On 27 August 2018 at 08:16, Luc Michel <luc.michel@greensocs.com> wrote:
>
>
> On 8/23/18 12:38 PM, Peter Maydell wrote:
>> + *  + unnamed GPIO inputs: (where P is number of PPIs, i.e. num-irq - 32)
> I think here it's "where P is the number of SPIs".
>
> Apart from that:
>
> Reviewed-by: Luc Michel <luc.michel@greensocs.com>

Thanks; applied to target-arm.next with that fix made.

-- PMM
