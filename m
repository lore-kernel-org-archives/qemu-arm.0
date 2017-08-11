Received: by 10.25.221.202 with SMTP id w71csp1128096lfi;
        Fri, 11 Aug 2017 09:50:35 -0700 (PDT)
X-Received: by 10.200.9.75 with SMTP id z11mr22198905qth.283.1502470235819;
        Fri, 11 Aug 2017 09:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502470235; cv=none;
        d=google.com; s=arc-20160816;
        b=hhXCLvB1kRZUb8IhRlKTY4UsrGwk1ouGrH+r5ZQ0GlwDMbA7KOWGpW1hlPCHNC1tSM
         em+plU0BT6JuEeaiCc8nUv6XA/EGYSMDEeNoBLddzQlmk81uic2IQqSdY6L3YjD1Ineh
         AiJ/7poNmkNNuVpyIkKVsA85G29Qr5DKc7kTGzcC/wvPHDKxXo4LqV9dOwq83ePW+n2a
         rZbQjCFfmaV9cZqBxQnFc1MyER8qSQuh3/VK4GzrkIuAElozebSvcpFNuBCBMQhfeCYl
         EUvD2YEf63GHmKYVNoYo+rpwAXi29hEzDE9FyK1oZ581b7EjKxZDbkmpwx3txNYvmdLM
         Rsug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bVUQkubm3snmKPVByxDVR40WM0YvZLkAT1odEZIw0jg=;
        b=QTqKahBsLQvOwA728Dp+isw/cCnhxBq6Q8RfX8Vi1Ev1zecsziW5QgQ08IjBRUGewC
         6oxEj2aiErLEWVilIamZWloOmMRb7qD25lViO3ANpkyegxpJvwTtvd41y3uOBqo07amg
         VcY7dnFuDs0y9hoq8wSMxn8TyUP+T9cZJg+Z8Kso4b8V9cK/zrvCJUD6BXasS3BUPAgL
         WZy9dqDMEMpsRma383aN22W3sPpi3rM7dKdgKw8NIpyYI9JAf5hgm71xMXhVYaAJKzb6
         0f3IsqDVA6OkYJoF5CkmG30nSp8lh+QufDSF5+rCax7QtgksaEllTzaf/ctAgyptDUKN
         7qKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V4ahf/0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y13si1114824qtj.489.2017.08.11.09.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 09:50:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V4ahf/0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgD8r-0006Rw-4v
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 12:50:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dgD8k-0006Pz-Rw
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 12:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dgD8j-0006KS-Rz
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 12:50:26 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:36250)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dgD8j-0006Jh-MV
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 12:50:25 -0400
Received: by mail-wm0-x22a.google.com with SMTP id t201so45905584wmt.1
	for <qemu-arm@nongnu.org>; Fri, 11 Aug 2017 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bVUQkubm3snmKPVByxDVR40WM0YvZLkAT1odEZIw0jg=;
	b=V4ahf/0fYNOyUUIXo+Ewf1IwL6JfGBBNSZVvfuaciemJCuUOgr5LGFMHPwIjNeeXgp
	6VK2HEntSWoFLSh2YnW90MRMz+Hss3XxXxw5Vj1G1CRIuiX/cZb/MsADGEMqWqonQ20J
	00sj0YAS3hrHUuMBaw8+aMpyCRP1pf4DsAloA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bVUQkubm3snmKPVByxDVR40WM0YvZLkAT1odEZIw0jg=;
	b=s6XuMX8zRT6M4dN6NNpw0d59eQRXEkyeUAKM0ujQ9Q+SuKwR2BeRNp/8z0ozw2lJPP
	WcQG1PLZScJW8IMQU8i3/G3yljK7Y8ZdNnOoxeEBNTq23J1pkuuefnLdlgu3yKZNXhh3
	mt7K3eugdc8YVWi1XAbPokbPbD00agK0/5y18O6MssOhVNfAMN5rLz8IAMFA00CmW1jY
	2vk1LgkCzPfCHtyqNAJfP+yb7Ms296tzmyurkfwEPQ5txxmiCKD0cRFkNYY8dgHnh8hP
	G5H/OUa2KpCrcUYpQUo/gB0gC7iSvJeZ/zBv5S+uMQaXT+RlJ9JMPQlHrWq4/NHkFEvm
	h4xw==
X-Gm-Message-State: AHYfb5g4Iz8/TKzppjHUmXaIg/KIFOdhvk9BQHIr7kEL/crfIZL0uy5r
	qtnjTwDH0wN//mcdVvv0jRQqjG4TaIhW
X-Received: by 10.28.8.140 with SMTP id 134mr1605596wmi.108.1502470222855;
	Fri, 11 Aug 2017 09:50:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Fri, 11 Aug 2017 09:50:02 -0700 (PDT)
In-Reply-To: <AM3PR04MB0616F921434F49926CA6213DFF890@AM3PR04MB0616.eurprd04.prod.outlook.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<1495537965-4187-2-git-send-email-diana.craciun@nxp.com>
	<17ae81be-a86e-d0ab-de93-046846e0b7d2@redhat.com>
	<AM3PR04MB0616F921434F49926CA6213DFF890@AM3PR04MB0616.eurprd04.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2017 17:50:02 +0100
Message-ID: <CAFEAcA-Qmtc6qM25192u8_YLP9h+Xne0b+zXLfngEE7djx2xXw@mail.gmail.com>
To: Diana Madalina Craciun <diana.craciun@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/2] Increased the size of
 requester_id field from MemTxAttrs
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
Cc: "mst@redhat.com" <mst@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, Mike Caraman <mike.caraman@nxp.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel@redhat.com" <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zybmn98zzcMi

On 11 August 2017 at 15:32, Diana Madalina Craciun
<diana.craciun@nxp.com> wrote:
> On 07/26/2017 03:23 PM, Auger Eric wrote:
>> With respect to the renaming, stream_id really is ARM specific and
>> corresponds to the ID space before the SMMU while you mostly address
>> device id problematics here (ie. space id input to the interrupt
>> controller). Maybe a more generic terminology such as originator id
>> could be used or source id (I think this is Intel terminology though).
>
> I agree, originator id sounds good and so far it doesn't seem to overlap
> to other specific terminology.

That reminds me that the other thing I'd like to use this field
for is the "identify which CPU of a cluster made this memory
transaction" thing (which you can get on ARM AXI etc buses).
So that's another thing that would need to have some part
of the ID space...

thanks
-- PMM
