Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1835572wru;
        Thu, 16 Aug 2018 06:11:37 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz9EDzHUl8UjPvnkB74wgBBya6UjsrkcWxLM9+z7zWKpoPG0XyiexQ/6fFnPxiaHxAHCi5q
X-Received: by 2002:ac8:12c3:: with SMTP id b3-v6mr29539124qtj.352.1534425096932;
        Thu, 16 Aug 2018 06:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534425096; cv=none;
        d=google.com; s=arc-20160816;
        b=WTVWmZUnCBmxbWfb40GK2VFQpmFe7XBGG2VjqDvAES+Zou3oSjREhnz3SCAJwr9XcB
         CN3NsVqZF4wdcXZRwgVaJTCramx5u815Sfswv6VppV6IbJ5nh8t4BZItGLNSo4UhmcV7
         vOmSn3lgLGvdz8DC2pDYWn6yOsd5rbZWxPeLKiZejfs/U4TqC+qITEkSY7KsBnyZ9FOx
         BIVS280O4+AICAV4vbbj9q79DRCqnfN7KLHsylJSCpwiOPrjq2OR5bClPhW1QhPfbKAx
         kPZ1FtoHJTHiyFzPtUpav5cPAX2ft4AuMWQdUE4rKGrILfJ71Ng5Z4gLZwNz5Rwk9r8k
         mjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=g4aCoBT/7ix4PYLDyZkgJAUgkn41e4edTLWBbemqo3w=;
        b=zFy9YQyhtTYW2Nfy17QP/G0rHezoEghPeCxXlTdE4PCcFU5kcQMjFVzA4YK0gCB61h
         3bBdn+UJuLRqDgBTHzDeyMN05wfIEC+0ArSbDSf4U/UjzYgE8OcpMGRJBRRExOTn0Eu2
         KLw9uPn73sWYcADCXLkxAP8r86RJDlIE0AjlCsiJKz+ys3sx4PwtS1f4y9ClApRXfKU9
         LKJRWKxKA6qIuvH4QSE61u3YUQJhEMt1psMBm6i6cn4SIsVQEtQHLDvJNgRqMSbcjk8p
         XrV/7hiFLXtWwLUPf3jYrk1xzVe4HMtUiFQnu7La9JDx/zrh1bpYrc3DSSqYt+YfQGG5
         UZnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GSoc95wM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o127-v6si1545239qkf.68.2018.08.16.06.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 06:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GSoc95wM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqI3r-0005Zr-D5
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 09:11:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqHw4-0005KW-5G
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 09:03:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqHw3-0002JB-DX
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 09:03:32 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35375)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqHw3-0002J1-8H
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 09:03:31 -0400
Received: by mail-oi0-x243.google.com with SMTP id m11-v6so7848235oic.2
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g4aCoBT/7ix4PYLDyZkgJAUgkn41e4edTLWBbemqo3w=;
	b=GSoc95wMFDpBgqY5VJqWc71x+RAFRCfvhhs1JP47TFReKh9aHvqNCku0OWaX8SMMdk
	chsS/Wk3sav68SQMKMWJWN1IiD6ophyz49S6rFPpV8B9dR+gR20u7bD9LwELfanwYdK1
	/tceyqzU1ychovbR11rpmDCmp+Oi0H75XBSU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g4aCoBT/7ix4PYLDyZkgJAUgkn41e4edTLWBbemqo3w=;
	b=dw+sMDr5NcS2PORAYHVshIaYYicVX/+pwLhQb1GcfgXYcTNo3aK2q4TGKyyU9zv7EL
	qxS0v7era91qA7t+XsMf8urWwTsw54gvAG4ctRUXDZhMMmjKl/kT0XrDIPqkMDqGk3n5
	InzLUchvmHiTpTwe91rq88hxcymzMkBSTNa8TWPj6zLckuCQqFwwA2/LK+5dEmLoKyVD
	K4bDBulUvpFWqN0t3Sc01jQQwKA/k71S3OoldGWV6d/fF0ByY6/EpGIpay0pwputvR42
	WdP+vm6JdXQPfCHzMmeB8Wq+4pFYOBZLGZFE+6vKuNe4vCy7v5O8waoMpi5UONlvFWTx
	HmQQ==
X-Gm-Message-State: AOUpUlFhlmPvrSLV92UecXOtwaFqN/g7M74zZE1qZHoSlWBjGbwtvM+6
	et6sBsccn0hj62PEKcfWnrFTIDl/n6Iq2TpXJqN+E1svBCXn8g==
X-Received: by 2002:aca:c351:: with SMTP id
	t78-v6mr29207797oif.338.1534424610654; 
	Thu, 16 Aug 2018 06:03:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 06:03:10
	-0700 (PDT)
In-Reply-To: <1534420566-15799-1-git-send-email-thuth@redhat.com>
References: <1534420566-15799-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 14:03:10 +0100
Message-ID: <CAFEAcA_pdycNxCqxKArO-PV6O9WBLob5f8iry_iJ4g-yP-MQYg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH] hw/arm/mps2-tz: Replace init_sysbus_child()
 with sysbus_init_child_obj()
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wMx6KRs8H/g7

On 16 August 2018 at 12:56, Thomas Huth <thuth@redhat.com> wrote:
> Now that we've got the common sysbus_init_child_obj() function, we do
> not need the local init_sysbus_child() anymore.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Applied to target-arm.next, thanks. (Might end up with some
textual conflicts with the various not-yet-reviewed MPS2
patches I have on-list, but I'll fix those up as I apply those.)

thanks
-- PMM
