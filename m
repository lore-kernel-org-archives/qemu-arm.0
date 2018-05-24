Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1959482wre;
        Thu, 24 May 2018 07:59:33 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrXwxoNx3YIaZcAya1EbTXMytSXX8cUPuUcN++R+y4A4n1sjZDmwOJiIGjYZ5Br57K8akQ2
X-Received: by 2002:a0c:b0a3:: with SMTP id o32-v6mr7031223qvc.246.1527173973707;
        Thu, 24 May 2018 07:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527173973; cv=none;
        d=google.com; s=arc-20160816;
        b=lPbk8yLIprlvr8R2rybItQwOOX8l7HfOdVfqQRoPzNnOGbXZh+bdReRFtcbWjf5iFW
         eY+6jHrUldZn/DTIUJ4Pqr6h3Khmb4dK36O176Tr9BelAmT1qroI+9XMNoP6OSTGTVsV
         pmm0mDQmJSv6TEMUJCBYwRo1D+pSV2OsKjAeKRjPFEqN8DZ2vZWiVvceHINSgEuR47r1
         iJqNONfWTFwB+xK+oBvW94isWmxM4d0bomEGjpTJ7PDWngtjSLX4tBZ+UrLoa/popsWz
         8rOW06pdsHan+g5CMy9TaHm3NaBirCPn4muMUHT7LvFrYVcImwQJK+jvmyg2U0XfjfhP
         VzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=S9re/GuVivLGInbUi943pXBrvgZKzzvY5weRtemmBw8=;
        b=wWcd6IVojTmluw3JnmeFyKn/EL8Y3mNjjn/EkaumCVw/o7waSId4BW4tLJeKb4/Oyf
         yH3NCrqPbKQynlmE2j7sfmArkvuOrV6xo1t4HGszuxYJz9kQ/AL9Bo1SDYPGA9sfIJ3t
         nAzmfTBykY+3Dst2F3X1918jy5txlL3Jrq8BDxMvcPLeG7qAjzE4eyXucMHdwO1TpzCN
         iud1xGcHcvkgfe/FR3x1jkftuQhqyqM8pMtC6W7wGDWJBXOpGp0EG1L0Q78+h+6WlhfQ
         dO3zEg+VaGB40How6yomL0SVQLCm2MyemCIpX6sfd2MSKPTnBvN3F9sTLtwoghMpLHDk
         /ZYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R5TCDLv6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n10-v6si2573306qvk.269.2018.05.24.07.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 07:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R5TCDLv6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLriH-0007BD-Bf
	for alex.bennee@linaro.org; Thu, 24 May 2018 10:59:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLrhU-0006lz-VD
	for qemu-devel@nongnu.org; Thu, 24 May 2018 10:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLrhP-000455-GB
	for qemu-devel@nongnu.org; Thu, 24 May 2018 10:58:45 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36455)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLrhP-00044a-BB
	for qemu-devel@nongnu.org; Thu, 24 May 2018 10:58:39 -0400
Received: by mail-oi0-x243.google.com with SMTP id v2-v6so1722236oif.3
	for <qemu-devel@nongnu.org>; Thu, 24 May 2018 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S9re/GuVivLGInbUi943pXBrvgZKzzvY5weRtemmBw8=;
	b=R5TCDLv63KCFRu+AXF0/lC4pRNIC1HjR+MrrQLoca9yhWAFxpJ3oFASGMLgg1H/nwd
	rrKkVAYtf7+bT4zOz8xF5pJteRjdtk1WBkpqMrD/uO8PZzQfCVWF60r6DXsy8GXWtA4d
	uiie1VJXxI/62oxF9WAr7tqqKsU3D9BwJO48c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S9re/GuVivLGInbUi943pXBrvgZKzzvY5weRtemmBw8=;
	b=P748eWlCL+ReUzySEozdRIjWmhjdyKMDDYc/QYzbi4rSHWs6NjGG7dNPc6hks21WbN
	aBqGMbOnx2pvyWdvrjGzy2+6y4fLZyq92H2QmX0fFlMeRyP+P6KIUX2iZCoZSZb9cRHS
	55iZXZq8lXAellu//Eh1h4pvs2GmmcDy/KRFf+DGSfTEeODuBKXtWqXW9QCWyxiiOKKV
	I1bIkAECnHFqlAxZDfLH36g72nMWVGTO2P2nU16pQ7pp0pOxv5JtQNfEk5Uvzyj4SNDG
	xWDnkydyvxxGopsdhg969tFdGBoj9aQxkt9TuXx274NrldUZ7k91b8FNAypZQtPSZ4Qq
	eXiw==
X-Gm-Message-State: ALKqPwfF9L9TlLiAO8VUyPaFdLYmMuJJoN3sQA1HbtE7kaxikaD8B5EL
	2+JNnACNOUIKt3Dl98oPkwWlCgQyvh7H7B4axen0hA==
X-Received: by 2002:aca:f141:: with SMTP id
	p62-v6mr4305509oih.80.1527173918644; 
	Thu, 24 May 2018 07:58:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 24 May 2018 07:58:18
	-0700 (PDT)
In-Reply-To: <CAFEAcA9oCppg2C32vd3YKKmvfO7n1KnFeXG14CV7UHcZpxcTqA@mail.gmail.com>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
	<acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
	<CAFEAcA-xbHtxora5TU9psYnBgP0+N8_nznhVppEkg7fmmwip3w@mail.gmail.com>
	<10801e6c-5028-add6-b082-22c5dc9758ca@redhat.com>
	<CAFEAcA-eW_1M42c+Fjt98AgVsnbwjwWap3JZFHNU9f8S0H_qww@mail.gmail.com>
	<38aee779-1baf-ab96-7489-0f34bda2f8e6@redhat.com>
	<CAFEAcA9oCppg2C32vd3YKKmvfO7n1KnFeXG14CV7UHcZpxcTqA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 May 2018 15:58:18 +0100
Message-ID: <CAFEAcA-ffKgP30kPm=rWqMv4CewGRqu_WEcpwqGp+hqZzwhn-g@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH V3 2/2] arm_gicv3_kvm: kvm_dist_get/put:
 skip the registers banked by GICR
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kgVxrB6ZBP/J

On 24 May 2018 at 15:56, Peter Maydell <peter.maydell@linaro.org> wrote:
> Oops, yes, you're right. My explanation applies to the
> various other bitmaps, where we are accessing the
> fields in the data structure using gic_bmp_ptr32(bmp, irq),
> but not to gicd_ipriority[], which we are directly accessing
> starting with the first word, not by indexing via bmp[irq].
>
> So we need to handle these two cases differently.
> You're correct that for gicd_ipriority[], the code in
> master reads and writes to that data structure as:
>  [0, 0, ..., 0, irq 32, irq 33, ..., 0, 0, ... 0]
> so all the values are in the right place but we:
>  (a) unnecessarily read/write zeroes for the PPI/SGI fields
>  (b) fail to transfer the last 32 interrupts
>
> We can fix the gicd_ipriority[] case simply by adding
>    bmp = GIC_INTERNAL;

Oops, I meant
 bmp += GIC_INTERNAL;

thanks
-- PMM
