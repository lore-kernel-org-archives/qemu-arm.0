Received: by 10.223.159.82 with SMTP id f18csp3069877wrg;
        Tue, 28 Nov 2017 08:07:56 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYFMUNFIG/wbbo+0NYaA6VIi+LXgxfWBkNDf7sZHGBl8Jw6VPA2VBG+gSGrikI1Y/2FbRcw
X-Received: by 10.13.192.198 with SMTP id b189mr28186343ywd.336.1511885276798;
        Tue, 28 Nov 2017 08:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511885276; cv=none;
        d=google.com; s=arc-20160816;
        b=XW8zic9P8r8Hjc7qr2kJnWJOOCj9FJyu1a/LiYbz4ybwA12o2anxd0PvsE7XFxQtWb
         mlu0pa832OHSjMxYWyQJxV0+JiKU2+qz6LfAsYb82QjJBgifOuaSo+r7qmSBh8ZaeQ3V
         Hc3yc7Dr5opGFahYADBQjJFDbu3gR6l/xaw3QFb3d8B/bisCPL0VpmmEmoyfbNhgplG4
         ON8+CoBktsHDXJaiPGEvlKpALnVCt+Ug3GQ4eLdVj3fDxRn8LB4jLOGUomhvOxjbxP8C
         ElNDhN8IpQ4xKwKJfw9/KsJ8WRFD6oWG+QTEpkHqJQJE3oNrIl4amI4/B4T9SPR9GA/a
         YtaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=h5QVY8KpX1QlPhTEN7ebQtpyiNPqF7GgDyB2g6k9sls=;
        b=b3tPbi3qv/B/T1qmPzdGDoIn0/ALBHXADSn/ljNVmp6WvIYEZ6nKs+hgM/NP8C896i
         xc2D+EM2KBVM2gQ5+J+5ItDjugOIWh8suMN1b+3+D3uRg641sbd/haS5SHTU9nz+EZGr
         L6oRVCHnJqGcXuktj6h5ez/F76/Myv9PHzj6nFp89oZG0AKlr5TX119U378RkghaR23r
         qWknkDkxyrvSKZAqChOM7j7Di/D63gE2/b0i3T3Iaq6/x4RoSIP0ZKcVZD/voHk70YcG
         ZHX9ioOTXZh/mjaTqCr7kWnKIj5Ok0tBMlFAx/Ys7LITJEpQD49HjaGZIkfSUM1UzDD7
         MuPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QLVoMw8e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n15si3161582ybf.301.2017.11.28.08.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Nov 2017 08:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QLVoMw8e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJiQO-0007nl-6z
	for alex.bennee@linaro.org; Tue, 28 Nov 2017 11:07:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eJiMc-0002LO-91
	for qemu-devel@nongnu.org; Tue, 28 Nov 2017 11:04:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eJiMb-0006R0-Eo
	for qemu-devel@nongnu.org; Tue, 28 Nov 2017 11:04:02 -0500
Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a]:43388)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eJiMb-0006Qh-8b
	for qemu-devel@nongnu.org; Tue, 28 Nov 2017 11:04:01 -0500
Received: by mail-oi0-x22a.google.com with SMTP id f69so222405oig.10
	for <qemu-devel@nongnu.org>; Tue, 28 Nov 2017 08:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h5QVY8KpX1QlPhTEN7ebQtpyiNPqF7GgDyB2g6k9sls=;
	b=QLVoMw8eaSL0K+YZ/FOcRHLnnv39BcJR3NjvBQvqVX7k/xVlvE4yGlx+W5wIe3WuD3
	d+gVS57XF8MmNCW/FLuTi8D5+KDyQmr/g6EdGykCkqmweX/JGrPf4AM2EC5dDHQ0xVQg
	4l44vtv+iSLHpmf62u4pFJ1wJlfMdniunMUns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h5QVY8KpX1QlPhTEN7ebQtpyiNPqF7GgDyB2g6k9sls=;
	b=ZMGttGNPpJoPHcMx345UNI6j2gFsg0QWFr6vujpNYpEh2LHGK2s7gdac84Od7B2LSG
	iMfkn85FvK35JCSe4XALO7NtBVeZJTqr1/QtV5Kn8v7BI/21PQ9UsnP5WWA0Xi507R1+
	lYLpCqkrzeG7n43SXTofLU6ksXWT2glOpiW3mAT+UzRDaPlwYfw77iptfA4VgkytlwNh
	9DhEWi5CaTAdk+ApbYU/6sZf9VbCoKdvPuc7JSD6UsJhwtdBgth9H4oy74Xb4bFtr3Hn
	thf4WK4PfEYOw0o9un3EEh4OrckRi/0JhyT6aO35UG6MdZLL6IN5E9g/jlAELguDURWn
	Q07w==
X-Gm-Message-State: AJaThX4nJeiFw62/WClN3L2o0i+OGgUNPLomnLR8JrIScwHhEZ0d00hs
	MAe/fEZUUGlmwMcOReovq+UFtF5OLJRqJcl7vmhXrg==
X-Received: by 10.202.180.132 with SMTP id d126mr16352963oif.299.1511885040347;
	Tue, 28 Nov 2017 08:04:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 28 Nov 2017 08:03:39 -0800 (PST)
In-Reply-To: <1511883692-11511-3-git-send-email-eric.auger@redhat.com>
References: <1511883692-11511-1-git-send-email-eric.auger@redhat.com>
	<1511883692-11511-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Nov 2017 16:03:39 +0000
Message-ID: <CAFEAcA9Tj_y2FzDktjPpP3OGQTYmsy8LD7MhxaXxORx1Y_oGcg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22a
Subject: Re: [Qemu-devel] [PATCH v6 2/4] hw/intc/arm_gicv3_its: Implement a
 minimalist reset
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
Cc: Wei Huang <wei@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9UpepCj6f11Y

On 28 November 2017 at 15:41, Eric Auger <eric.auger@redhat.com> wrote:
> At the moment the ITS is not properly reset and this causes
> various bugs on save/restore. We implement a minimalist reset
> through individual register writes but for kernel versions
> before v4.15 this fails voiding the vITS cache. We cannot
> claim we have a comprehensive reset (hence the error message)
> but that's better than nothing.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
