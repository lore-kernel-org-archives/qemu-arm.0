Received: by 10.223.159.82 with SMTP id f18csp2162728wrg;
        Fri, 24 Nov 2017 06:22:33 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbDb0yjzL3D+8kzi9/GVJ7NLquRFmqd29NKCZdKAUUdjYaJTJi2H1G4b37IBwzzbv4/KGRp
X-Received: by 10.129.101.70 with SMTP id z67mr19367983ywb.474.1511533353771;
        Fri, 24 Nov 2017 06:22:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511533353; cv=none;
        d=google.com; s=arc-20160816;
        b=DEHBEGivGVo+NtOjiDS/uNaYTCxSVvE9ikQFyE79smDQGoK+jQpYkv7koh+1GMN0Kt
         HByKqhaOZ6Ahg1Xv1frUjRGHk04y8VfmXUxOTBaB0AUVLplLy5R4vv0SbLrK+1ukmwW0
         LHLIG4bKlx22Auo02YPUiaieHJLVW+zGSbxWVE5aE3/HbTGqK4DRzaOi/foEeaaoSmV9
         gFK+/1YoZgHWn3h6b5Q/OtJJzMPk5rIHMlHNquq68wnauTVVHcFWfpOFJCf9PJqCSr7B
         mpFe6h2WIRMq8CBrdRUQbdY2vjiMjqmGQcCSuyMZbn9BhwSq5RTYWv9jBWaFltveY4Oh
         /eyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=wpOQgFYcprnCfS/mRX6Ev3DqZn+RJTsWQbInjHt5N3I=;
        b=vpn+xoITcfyheNK90No0UdGEJCAcCRllrHuNZ0nHFXQUMC1aOnODqVlEdHIJi6VnQA
         Aa31Yao9n8kJ3uCTw7EL+jdqFR0KSG5x2AfEQzc8x6Me7rU58YU2Y3CsUZB6cMgqSCB2
         PnU50GNGMaCxYIYK4jofvp7dpazaRFd2ZhMtwU6AmDBuQ3xEb1TiNSpDbBPX0M4Smt8i
         EC0Q5UMIFVTSslIVkpcgmgWBI0VFSigFvoFKCv2+r9iRmtvGqdkAK8Y7WknU8usZ0ukX
         OLGHrSDEhfSWh2XhsqyEI4uz8+fTiqaiWoaA8GZuvOLdjLi3YY2/5ouMvUpRdONbwey4
         z0Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=izLbYckT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b125si4193015ywd.151.2017.11.24.06.22.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 06:22:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=izLbYckT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIEsD-0008Jc-7u
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 09:22:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIEqo-0007IC-ME
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:21:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIEqk-0003dC-Vo
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:21:06 -0500
Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e]:44655)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eIEqk-0003cv-RZ
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:21:02 -0500
Received: by mail-ot0-x22e.google.com with SMTP id d27so18878549ote.11
	for <qemu-arm@nongnu.org>; Fri, 24 Nov 2017 06:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wpOQgFYcprnCfS/mRX6Ev3DqZn+RJTsWQbInjHt5N3I=;
	b=izLbYckT1pL0oxmySDgOhdyCyaS/0u37zBuEQI1kKiDB2v3+/cm0FaUUcpIX7+/DyU
	GQIxUKzeWsTga8R8LjwLqJl8BtmIng72I6pyjBSYNTq0kD/Crr+jLs2VFQioZ2dw/rHy
	Piu3OQpdKaME6NIdb3Y2FoOW5iYrm85IS76os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wpOQgFYcprnCfS/mRX6Ev3DqZn+RJTsWQbInjHt5N3I=;
	b=qic0T16sVMeexy8YKLkkJMWnR3V03h6/jVft4ouxqg7/uJBYiXkCSsx6NV3GArkLpt
	jfdeGXxGvyJtkEvE8Eb8M0H8E3zIP6vpIIhPkLiz8kvOGvcwzBNlD3wl0lO0zaUP/xzm
	3muDV72owrkiMCq3yEupd6CXWe6KQC9jbqeEwxMbgoojLxaUjmb1VYMUwQ9tec2b0zmU
	Fx27v648Nvpf9CrDLTnrWwpGIp32YmcDOm+escyB2JmJKr9vho+DjsJLMDKpdkSV6yGO
	pFdBake2gKlfmpIU2E2iUYx5Lp0EJpFQ9vOiqK+MC9KpzOU41Hp0h5uLE5k85mMbV6dF
	0aOA==
X-Gm-Message-State: AJaThX5aTwz8KklfI9YDbzmeJSsNpP0hWlBXKQ7IJ4Qh7wOM0Jp2hCuR
	RlMQ9F37IYGlIoUGf/ELBV7xi3FrCB1uPhpyKt6J2Q==
X-Received: by 10.157.90.6 with SMTP id v6mr17946035oth.54.1511533261918; Fri,
	24 Nov 2017 06:21:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Fri, 24 Nov 2017 06:20:41 -0800 (PST)
In-Reply-To: <1511533107-5315-1-git-send-email-eric.auger@redhat.com>
References: <1511533107-5315-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Nov 2017 14:20:41 +0000
Message-ID: <CAFEAcA_K4f=mmuoEbyuFCHP2dor5p2UPyedteELQoxPYFzAcEg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22e
Subject: Re: [Qemu-arm] [PATCH v5 0/4] ITS Reset
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 27PC311BIzPK

On 24 November 2017 at 14:18, Eric Auger <eric.auger@redhat.com> wrote:
> At the moment the ITS is not properly reset. On System reset or
> reboot, previous ITS register values and caches are left
> unchanged. Some of the registers might point to some guest RAM
> tables which are not valid anymore. This leads to state
> inconsistencies that are detected by the kernel save/restore
> code. And eventually this may cause qemu abort.
>
> This series adds vITS reset modality:
> - the 2 first patches bring a minimalist reset through individual
>   register writes. However, with kernel versions < 4.15, this reset
>   is not complete (vITS caches are not voided).
> - With kernel versions >= 4.15 we can rely on a new ITS KVM device
>   reset IOTCL. The last 2 patches introduce the full reset.
>
> Tested with 4.11, 4.14 and 4.15 host kernels.

Thanks. My remaining question is: how important it is to
put some of this into 2.11? We're getting quite close to
the release now so I'm getting gradually more reluctant
to put in changes.

thanks
-- PMM
