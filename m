Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1196238wrp;
        Thu, 14 Feb 2019 08:47:15 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYAwpAiCslrc6CO6j74Q42RyJvYxkyzEXrcY0ryUzTdrS69x0HpcS+0SfCLorMyAeCp84um
X-Received: by 2002:a0d:c4c6:: with SMTP id g189mr4053221ywd.106.1550162835317;
        Thu, 14 Feb 2019 08:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550162835; cv=none;
        d=google.com; s=arc-20160816;
        b=ZE06+4mu/oZCu50wOHceJYcOEFMqTXE2svkl7NSA0p5yuePxr5wUHqX0axLY1uw2PT
         D9+h0CxGoiSnqldKQevKyL1L3AeE3cE9TWYfoObv+N3YgMjF2UFsgUQkyGRr/FPKKtdJ
         /Qu1BOXXTnrKAd2dbVnmZbC5MYNBkxdjpRgQQd+KGBNbH54kofT36YTp9DMGUOsoxLoE
         4x5B0Nk+pxGW75iiAOMOcOKY50k38m3cJaZxbZ5ZmEUwGA9DIpJIBg5vGd8z6Ht9k8uH
         AksVCwxzSYJE1Ci8HYhTaO+XTLRqQXguWNx2H4xEkIb11z+oQlaS+zHLgfPGeMIN+AjI
         z6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D9NQnXkxgk0TfYgeIIwse+6YaJNUCzRL7qHyHMkzRLg=;
        b=MLOMUKxdUJbiEm7BLOyxGGEuyvk522zC+Ccbzv70gy9r+vF4hm2oFFp2WmHVXD5RKU
         G7K+eiokcc32+SJ010aNNpHZf/3RXzbG4693Gev1pUVK/pnDGPMClOm5zD+oM0DUnCw2
         6QIJSdGws7FuOQaOozCblk4pZbGY9O9pArTP7oUnpnCAK4/nahAh1bKA/vhxqQRaUBbj
         0FBHukVAp1BAGUkNi78cDAOeqmcCLLoczOHR7fWZixB88VApt6UrQSJEELKbbyOof4ml
         mmr1HeVDNnGiLDf+SRK0QvC6o/z/SJ6UntgsywAegfxS8t/lvLLg/BP9gjxrOfF8pwuw
         sk5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lz11HuKj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o123si760582yba.38.2019.02.14.08.47.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 08:47:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lz11HuKj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guKAM-0000fU-O9
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 11:47:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guK9r-0008Q3-La
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 11:46:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guK0N-0000pS-RM
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 11:36:58 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37390)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guK0N-0000cK-9G
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 11:36:55 -0500
Received: by mail-ot1-x344.google.com with SMTP id b3so11534442otp.4
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 08:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D9NQnXkxgk0TfYgeIIwse+6YaJNUCzRL7qHyHMkzRLg=;
	b=lz11HuKjzrpo+HluDC0hUh3GAQhNuGC+RMKE67ynkRy/ijGQg3OKqEZuQZc/wotmFG
	Zk/uVHDBH6hSSS11/9XZuVnhC+Vn/CRcrN6DZUtocKrB/sy2f2bkc/ztjgsUFv4XMgue
	PJd94ydx6jM+Bg4UFzh7waQNDRrI2o1DiV5fh71GuZh24ZvfiVTZDTJgx7TFrSjzHuZJ
	W9kFXjvuqYHX+HliNhtfC1ESRUuYFjTCZu2AGsf431eeyqBKaH7nCNi3XoR9I2DKlQ+Z
	3sLwg0cCn3wb9o0CVxZWZmNFBZh97mO31Wr5/skCMWcYXKhOt3d905FqceC19twKgmCe
	mCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D9NQnXkxgk0TfYgeIIwse+6YaJNUCzRL7qHyHMkzRLg=;
	b=b9/iSqzZqsTeAvronpZoJSZ1C3Mdbf1wfHdZHdhJvvRUMR0NHUYJDtFQ85NrlWRM23
	H6e3ujB8SzeUC44EveL6yTOGHprZsmwigjYBDrOsWMSxiEc0O26EYoiAM82EybGB3E/c
	Mqyy3YPoVDh+pIIlyPV0WQp+ekPoeruHF8IzI7IGbm3H141tR1qtqITO/ZU94HDKbhAc
	uuEcSl/RzV+Jq5RKgj1dTnuXTlpdTCGDdLPLRC3eYD1oqHig+Ql2FojwoPhCIQdGVGLG
	USpvuaHC2YkYQZyB2ZaXtmYlXMmoFXmDwJBWVt0l1tpdafbSBwyd8qwqTHkSjApr5wM6
	4Qrg==
X-Gm-Message-State: AHQUAuZ6a3ZtgCuxI4PFQlWs5hF+VArYYxVYwp98i9i8coEZ/161x8vm
	knUch1gdBcASJzRJVYi4C2WdDVxmteQNON9wYIIWrw==
X-Received: by 2002:a9d:7d18:: with SMTP id v24mr2809272otn.352.1550162202547; 
	Thu, 14 Feb 2019 08:36:42 -0800 (PST)
MIME-Version: 1.0
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-2-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-2-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 16:36:28 +0000
Message-ID: <CAFEAcA-Csfn9qzLxcuCBtmjyCSLbtCELcr4+h=T79gum0JCHCw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v6 01/18] update-linux-headers.sh: Copy new
 headers
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
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QlbsRAk63xMl

On Tue, 5 Feb 2019 at 17:33, Eric Auger <eric.auger@redhat.com> wrote:
>
> From: Alexey Kardashevskiy <aik@ozlabs.ru>
>
> Since Linux'es ab66dcc76d "powerpc: generate uapi header and system call
> table files" there are 2 new files: unistd_32.h and unistd_64.h. These
> files content is moved from unistd.h so now we have to copy new files
> as well, just like we already do for other architectures; this does it
> for MIPS as well.
>
> Also, v5.0-rc2 moved vhost bits around in 4b86713236e4bd
> "vhost: split structs into a separate header file", add those too.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

I think this fix is handled by commit a0a6ef91a4a4edde27
(now in master), yes ?

thanks
-- PMM
