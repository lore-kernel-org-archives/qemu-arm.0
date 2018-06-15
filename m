Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp784362wrq;
        Fri, 15 Jun 2018 05:24:12 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLjxAQzcYI2PfrXCe27aNkKaUctfV93r68aMdvfEyvT2JEmK8x8PWyqtV9z0v5g6Z6vSMm1
X-Received: by 2002:ac8:1c37:: with SMTP id a52-v6mr1199545qtk.411.1529065452117;
        Fri, 15 Jun 2018 05:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529065452; cv=none;
        d=google.com; s=arc-20160816;
        b=OU1lOPSwrl45pu9qO2Xnnge8K7BahApTs2agydXSsXSevk/CAsTzN6VFdDOlkAzxEg
         n3xtStcIVIQ20VGTIv5BMVt1owLHMcNZHgsI2Gska8kkIF6TBvHWNN28Yx6d4B9jBMDy
         f/EujDSKdfV9/ENZO5IreZI8CTQeF3m/n/xsPkL0JsC9bFJ2wPvxS0ra2LyU5k2NbREH
         zCA/9mHB8C3fF2O04gA5aOoPar5Ch2teJQyRsI5eBJCqBDbl/+Zq9rzLN0blB74HTgrL
         uZdadApVpdu6kILkSDj2Uu/JbsUHg/eKNtwEEl2a6qQcsiUa8gM8pvaNINm8leTOkHWe
         UWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/yvrpMt0wVm2bi38u9yRdseGnSrHdIUPdmq6Pd5vU/g=;
        b=u6rWTWwF4dwGznHzrka63Q7Bxu11B6v8eMa/mZ1a4jvlRBQPLbd1KEK1pySVfFs8wf
         BOJ3kkiOq5bCCU5zFSdqTGV0QLs0UCjnQt5kRJOE9tqcaZuTSsOI6BnInYNxAiSsuO7V
         0h+7rBWv8AjM7ciwReEpXuMemBaqzSQwPOjyG9SA+uw7HQNLef1oxGUExIl8F2gwMAj9
         mz04lRw4aFwLhE2coK47Iyp7wFLvZquQNn/D9443Zqttv/FwnhhAVXqKzGt+WBwWB3Nb
         IIeIzPV46hFvT4BWNOq0f9wTbYfXFbQPbTfYpKZgLUKZ7AGdLB19RgO6/NS0ryoSl90E
         KYfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SHOvNKYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 201-v6si827171qkf.155.2018.06.15.05.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 05:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SHOvNKYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTnlz-0001jT-I7
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 08:24:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTnlg-0001fn-Sg
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 08:23:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTnlg-0002BW-4e
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 08:23:52 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33782)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTnlf-0002BA-Vz
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 08:23:52 -0400
Received: by mail-oi0-x242.google.com with SMTP id c6-v6so8627745oiy.0
	for <qemu-arm@nongnu.org>; Fri, 15 Jun 2018 05:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/yvrpMt0wVm2bi38u9yRdseGnSrHdIUPdmq6Pd5vU/g=;
	b=SHOvNKYIAATCPElmjDIJs1Zd2EOHVNBFh47YjeQr4VYlcE6y2GGsrIIEG0LvU+SSlL
	lkA66Xsb9RRfJX+fkeb+tZJtcOBuCiXimx2UCFio/vckR9HdSXyfn9EawzQwGvPRPfS7
	tI4DQuziEIawQB7pDSOGIAKfTpnRma+zPq59s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/yvrpMt0wVm2bi38u9yRdseGnSrHdIUPdmq6Pd5vU/g=;
	b=jREFpjifU8jOABt3DvxXNKDn1sSCU4zeE2x93NlFyPvt4nFQVf+s9Qj73PqhGotxYX
	Z/b79oriBjXDlXEdQiU40OI6oxQvIXXPpqOgairix6bXjK0tGqXvK2/8xgqmWu7sRO3e
	2+P+fVj/dj1XKvn74PwUKZBOWXfKvoq7YoXdmIyLJTmpg6AwOz1Yy20pfxIgo3UpgPue
	i56ZLkOdad8zhWAdOzohhFsoVRRupiSp3mskaxc3Y4FPBHFn38Jc+XZ6CX8yhGr88TAQ
	cSeEOZOeOSdVTWBczKK0EWuIvkPign72bm2TZ885PaVRG4307U3dju3Vc0ZX19N8SPhx
	8pcg==
X-Gm-Message-State: APt69E321ABYCac6cuOAgqO22dSwxmHpVLZQJ3mnrJojlLQnee09k6Wf
	DwQU9gGNQuy6DlZLANPT/LCQG2ns4NBq9x4rH8ktx3sE
X-Received: by 2002:aca:5383:: with SMTP id
	h125-v6mr799998oib.252.1529065431472; 
	Fri, 15 Jun 2018 05:23:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 05:23:31
	-0700 (PDT)
In-Reply-To: <1528554193-27270-2-git-send-email-eric.auger@redhat.com>
References: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
	<1528554193-27270-2-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 13:23:31 +0100
Message-ID: <CAFEAcA9GKDdsQmfvmvS=yGnE72GqNMQuJW3AwqTdsey0iVW8SQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/arm/virt: Silence dtc /intc warnings
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
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3l4LiyWKZ2fD

On 9 June 2018 at 15:23, Eric Auger <eric.auger@redhat.com> wrote:
> When running dtc on the guest /proc/device-tree we get the
> following warnings: "Warning (unit_address_vs_reg): Node <name>
> has a reg or ranges property, but no unit name", with name:
> /intc, /intc/its, /intc/v2m.
>
> Nodes should have a name in the form <name>[@<unit-address>] where
> unit-address is the primary address used to access the device, listed
> in the node's reg property. This fix seems to make dtc happy.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

I don't understand why this requirement is in the dt spec, but
whatever...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
