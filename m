Received: by 10.223.183.22 with SMTP id l22csp1974139wre;
        Thu, 17 Aug 2017 03:42:24 -0700 (PDT)
X-Received: by 10.237.63.92 with SMTP id q28mr7222602qtf.49.1502966543919;
        Thu, 17 Aug 2017 03:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502966543; cv=none;
        d=google.com; s=arc-20160816;
        b=bLHVZAFRYMlchN12FPScx8/AZr0goSKsqPV51x7giiZDGohYE46F8xslk6XOnWK6Bh
         CD13KbKgucQ9/Ivghc7I+tkXyNNQ57GOfTBdZ0iIV8iEgIAa8rWHStkqs0CVwNTyw0G6
         jGpeK+EbKqaEdW/7smAQeZRw8Ogy9QR0AtmYdM9RT7b0M+SkSuj2dcdoYekvgtvH6QfN
         IGmdhq4OAjxRpskeMtammgML/c0WUR4rW/gzeEsnPWrEYZ/0BOpZlMEOZcNSo79kBg8J
         jV3DAeVosk1SrsjkLBURfumpO0nBZFK7rgIjgW7hTLhTB/khyxZlvJm/zEp3O/gb8YVu
         OHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=FDBEeYIp4H4wZANhr7GKuTVSa2NyjSNsSyypF+cQnqA=;
        b=gf6IT7juHTO5KG0nwhV5f0RBnSvHkIXj9Vo6MDWeNveHqornk+IyOR2xAXMi3zS7YJ
         tAl47gWjRWFsXt6Vz/Vzwprs6PN0cuP6NEC1AtYCVQhmX7Qv9qvbKmccDLmn8pZp/LV8
         mEW1xkB0oWNkujYGogZc49peOKZbWMq7mJ3IMcDjR72xqmSUyb1mzBQNUPZ4StTPnIrb
         COY2pXboTY/yFAwYaCfbfcSxIskzlE+MifHywgN2y7DTLQ7W18IAGbjL1VGcELOyX8vI
         mycE+RjzzpL4d23iaCMBBlf9mA7FcA9KMu0PFe3TgDGVBUxX41PzkjMDWYREyspx4atL
         ahKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R3RKYcZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f2si2636243qkj.379.2017.08.17.03.42.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 03:42:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R3RKYcZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diIFp-0003Ug-AT
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 06:42:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1diIFm-0003TO-Hg
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 06:42:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1diIFl-0005CB-Qh
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 06:42:18 -0400
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:33492)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1diIFl-0005Bx-Ig
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 06:42:17 -0400
Received: by mail-wr0-x231.google.com with SMTP id b65so39824325wrd.0
	for <qemu-arm@nongnu.org>; Thu, 17 Aug 2017 03:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FDBEeYIp4H4wZANhr7GKuTVSa2NyjSNsSyypF+cQnqA=;
	b=R3RKYcZD0NAr/Vvjrbjc3oZJb0Hz+5Pul/uaaj8QyxfFhuyt6RLWoob5tD8gFmp5dN
	gdsE4kphj3IDEvv23ImKLIVMFXlKkcc8ErdI8hTjgiCfxsg9HLBJjvfx9kmVZhb5+z36
	ifPblQhVNQ01u1umDPCpFGB9o3mIq3drZWXs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FDBEeYIp4H4wZANhr7GKuTVSa2NyjSNsSyypF+cQnqA=;
	b=V4eTb64e2QiRxfpKp6zruL6nsDnAyDPwmqtOO73mGvjnAbKeM0hjsdI918z07bv4Q5
	Haq689gqCI4cCjMIIxNQ2h/5zGPeyHJLv4+/bi/DXUvsfZgtaeKcgTYqDE482f2wE403
	OA/aMvl8b4TkC+ffwwekgepoQfV8x31NyuTFJyr2/4rQGxhcMO/JhEd+aOtdwE4slmuJ
	vMYwgW6ymYo5ySWWKvPGI3YjdpQ3tcRpnBXMoir4uyiMGAqGYoFQjT+9pahIVMcMFBNc
	fjWgj2wofOjIVrOfSa5NWTDlQ3RSsn5bdN/or34ismyB+V703DZLF7EKXhWEbzgjdYJX
	lM+A==
X-Gm-Message-State: AHYfb5h84mUgcpKz326W/AmRdyP5rJiySgeJK9tQ+rzSY/STyFRtb4b1
	pEZKffa7EynW8nif2JyzK5CSu1pph7SB
X-Received: by 10.223.163.20 with SMTP id c20mr3338372wrb.173.1502966536258;
	Thu, 17 Aug 2017 03:42:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Thu, 17 Aug 2017 03:41:55 -0700 (PDT)
In-Reply-To: <20170808132300.uyrrmgoij4qlwy52@kamzik.brq.redhat.com>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
	<20170808132300.uyrrmgoij4qlwy52@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Aug 2017 11:41:55 +0100
Message-ID: <CAFEAcA8NLFVitFfMxKC3Tp7u_azFkOSnWBcddhUCF5Fx2dm+aw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/4] ARM: KVM: Enable
 in-kernel PMU with user space gic
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
Cc: Christoffer Dall <cdall@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jwb+1QGEEw4g

On 8 August 2017 at 14:23, Andrew Jones <drjones@redhat.com> wrote:
>
> Peter,
>
> ping?

I've applied this to target-arm.next ready for the first 2.11
ARM pullreq. Sorry for the delay, I'd put not-for-2.10 patch
review onto the back burner since I knew nothing was going to
go into master til after the release...

thanks
-- PMM
