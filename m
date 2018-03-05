Received: by 10.28.91.67 with SMTP id p64csp2780165wmb;
        Mon, 5 Mar 2018 09:17:13 -0800 (PST)
X-Google-Smtp-Source: AG47ELt+/m7wcqA/gRVUkUV7GnPuq6qAG4VJXTXqFgPQfgJfUb2xuYPBHfuxs1wuWGzcmZ4KVwPO
X-Received: by 2002:a25:5f46:: with SMTP id h6-v6mr9566278ybm.384.1520270233662;
        Mon, 05 Mar 2018 09:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520270233; cv=none;
        d=google.com; s=arc-20160816;
        b=wnquPuKjaQLlwSD4+fT7ri8KMh0zsKRwU/PQVwCOKFLAlnaMNN0h6EikHZ8PKjxHfD
         SGbbeshyEWRJmQ9PzDl5v2cO2T3oOgu6zxPiggjBfeRUOggZdorgFRI/uepEJSNbaXAR
         tZXOdFfpVmTiiLrJfGd7gV0f7nRZbJ2faoF0n07FASkLHZkXNGy/3efh1eUNld23MC0q
         cg6jrTBD1OFJlNRSUv57OFWImFI7xNwK0OZwbjhgYH9vPyDkzrWG3qbTuRys37lSVZC7
         mrF11pK3SpTTCNgZ2lq+4DoO6bdcR5qX+pU9M0SU9LInbO+6zCaKZdgB91Dbt+h3M0cu
         X0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Lu5lzMo/IrEJPwYiNsGt4M64CnRbmEwW+sVxl3DvanY=;
        b=UFWnwoQYjS7Ra3VY8+Z0LtFhZuYkTRTrlQ+/vi8gsp8q4BdDewOU2WYqzQMDXBwFkI
         /JrfYI2GcQM/Vsa/KvXFVRVDir07ca4g4ipaPk5l74jqrrSJwlVrj2A/QGFYfcpUpE6x
         XJM695U4KakA9uHrV1SdAiX9fVC32d7UHUdjB9ebyGhKlAZTebKTv6D0lTt/1tIWUIET
         YT0Dph7VlKeA7adp6lNpMR810BHrLk/qAAGlh2Eesvo6kURGw/C2EEeO2GBiAVjKxf4I
         YFd07T8EVWgjH5xDr2hjTNNaqdHFxD2Cmjo1e8FNRdzsc9uylSwJ3LBctlCP3Cocx6KN
         6oJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F1BVemcK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s12-v6si909714ybe.715.2018.03.05.09.17.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Mar 2018 09:17:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F1BVemcK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1estjd-0000jH-2m
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 12:17:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1estjM-0000hg-1X
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 12:16:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1estjL-0007Pi-B6
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 12:16:56 -0500
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f]:43019)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1estjL-0007PY-5P
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 12:16:55 -0500
Received: by mail-oi0-x22f.google.com with SMTP id a207so12599786oii.10
	for <qemu-arm@nongnu.org>; Mon, 05 Mar 2018 09:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lu5lzMo/IrEJPwYiNsGt4M64CnRbmEwW+sVxl3DvanY=;
	b=F1BVemcK3X4A02K1K6CCqxvR021pBAY0AHHmXLlBv+Cjp/LAoQWfrKVlWWBVdY4+xD
	tZsGztH+wXf/V3MOCey5QdJNFPuxrS1aPt2ZS1IlcoIDmPckcqASrOLwGTeMtiim6kWo
	26ZLypNwEsyneSjsi56lRQBS7XESkgaadtCJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lu5lzMo/IrEJPwYiNsGt4M64CnRbmEwW+sVxl3DvanY=;
	b=uitMD+tcpFCax3tlL18OD7BzxgmrwHhbMf4/YzJrZf1PWtklV1vF0agRylFuquMzw6
	hsm9mu8czxEWH7ETakGGvhAPgUMCbgqETKfUwtnYQGEs7S8RDVilK0ATC0XpFaNcx/PC
	Lci+goy6XbUzZXZFNZwhCcT3+vmwXDh/2CpUqwHBCmAY/SCICqDjw6w1TOC2Ni27pT5q
	8QDNEZIKsj38mdXrJpx2zqiwWEE/kAJAc+cPxsHaecRdlPS4PZIIVSE3l/Vm0t2TkykL
	d69nY8dkr6c7eCd+NQSPLzl7R6W3cMMT1pNWdpmLNSixzVMNzNuD1qJgVdsDclrqkBm6
	YdfA==
X-Gm-Message-State: AElRT7E8WZaKgAltvigUhpqy+k3rRZwc9Zdx2ufMCShvZDnBysdorACq
	RjpJXPLzQcS0KErblLL9Q1pe6r/yOg62QWKSFqAdfA==
X-Received: by 10.202.25.26 with SMTP id l26mr7741540oii.80.1520270214379;
	Mon, 05 Mar 2018 09:16:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Mon, 5 Mar 2018 09:16:33 -0800 (PST)
In-Reply-To: <1520266949-29817-1-git-send-email-thuth@redhat.com>
References: <1520266949-29817-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Mar 2018 17:16:33 +0000
Message-ID: <CAFEAcA8OZOCG-nhdWrw3D_KJ4OC5R87asV8-e4Ydpez1gUf1fA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22f
Subject: Re: [Qemu-arm] [PATCH v2] hw/arm: Use more CONFIG switches for the
 object files
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AFvdeYb4hzwa

On 5 March 2018 at 16:22, Thomas Huth <thuth@redhat.com> wrote:
> A lot of ARM object files are linked into the executable unconditionally,
> even though we have corresponding CONFIG switches like CONFIG_PXA2XX or
> CONFIG_OMAP. We should make sure to use these switches in the Makefile so
> that the users can disable certain unwanted boards and devices more easily.
> While we're at it, also add some new switches for the boards that do not
> have a CONFIG option yet.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2:
>  - Fixed the miscategorization of the boards in v1
>  - Add separate config switches for the boards that did not have a
>    config switch yet.

You could argue that the 'virt' board ought to have a CONFIG_VIRT
I suppose, but personally I think our config setup is an unmaintained
mess anyway that really just boils down to "enable everything", so
I don't care very much.

Applied, thanks.

-- PMM
