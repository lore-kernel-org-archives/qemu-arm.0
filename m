Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3043474wru;
        Tue, 17 Jul 2018 12:43:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpczvFhpH6aOaFtN9YvEqyCEZWKzrf5/xL9FXrU+GoJIu11XCOFyWcZRkrRGeH8PlR05GCkh
X-Received: by 2002:ac8:41d1:: with SMTP id o17-v6mr3019362qtm.265.1531856615720;
        Tue, 17 Jul 2018 12:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531856615; cv=none;
        d=google.com; s=arc-20160816;
        b=k53RNbIcy+TOoF9j4wkMTyRFRsZ/CiosclLQmRXf/iv4NsQ2axpRlKM8Fj+qqIcpGv
         GwKSWMvoa37zBPwcY5eGMwKZjPYwqAR9+I0DdOVT378BLWkUVeN7kCfRNmCm2C8fvgYj
         M5Dni7n//v48/aWSON4Q//KIg9QZBFJv26b1DY1B2w/osvauM0FJGyusKvLJk/hE8idW
         CMMvximrMHjRli9175cev3xuPmfgA35GVi4p4ifw2xCHrSkVYQfBuHsU9kV+o4qCgfty
         dU+fFtY2We2cQU2x0KEFDX0xjnZTssPzDYn66fxyz5a4OSinJkpYJ9taZNyEiIWdg7eD
         +7Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=W/jfeoI767VwJsITVGPKWAAk8KqhKzNatZ+AuKk6N5s=;
        b=KqeVcgksFUXzVvdtJRqn+mBc3Sk2PhVvdGcxZ6pQR5wTZ/xCSaifOA09/AQxDsb5br
         MXXftYQghXWl/yuDsNyE0Go0Alh5YGoW1zqA+k+T2DiEF06l3MVsS86WY3Zm7kl5IVWG
         GqsuXYaFOm1uRb8csCm4gC4DwzbPaFsXiOY+axrgxb7BjO5r0ofNgIKTHSTsnKBp8LhH
         mSZPh9iZymaprfastEVAzHvKJ0Scukkcl6lHYJdLjYIatZaCSVBqEZtJFu3vi7LbZneA
         a2b/Mc2Ra0/rHQgYdeQlTeAijGaPrzqCHJfc/4dtVwZQaHu+1vhryt3oCMFs4YcIeZDN
         0JEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bZlp+Y1w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z12-v6si2183042qva.223.2018.07.17.12.43.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 12:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bZlp+Y1w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffVsl-0006i4-9T
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 15:43:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffVq1-0004wX-B6
	for qemu-devel@nongnu.org; Tue, 17 Jul 2018 15:40:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffVq0-0000Eg-Fq
	for qemu-devel@nongnu.org; Tue, 17 Jul 2018 15:40:45 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:43867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffVq0-0000E3-8o
	for qemu-devel@nongnu.org; Tue, 17 Jul 2018 15:40:44 -0400
Received: by mail-oi0-x241.google.com with SMTP id b15-v6so4249496oib.10
	for <qemu-devel@nongnu.org>; Tue, 17 Jul 2018 12:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W/jfeoI767VwJsITVGPKWAAk8KqhKzNatZ+AuKk6N5s=;
	b=bZlp+Y1wajLlHYeqYx25s4TunppxSVCjUL4AvWE1glnHB8zSweRoJBxG1IpSmR0SfU
	c1uKJkuXK8JrpTzYjMnRdOQD6t5CGdlN8h3Gd4HkU3Z3Gt5E5hmhwjsDGI1U3Bvh5uaL
	zDOvftm2NXRrTUy6IGOz8DetEiDKQQtov/gYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W/jfeoI767VwJsITVGPKWAAk8KqhKzNatZ+AuKk6N5s=;
	b=tDmDpAW4QYMwluRlzteSdXcZGWOJPzKdDnj2IP2cDUr+atTfc411TOQOc0wryx9m35
	onwC/5k7dFABPilgy2AvSLQQmXAiHiIcjXOrLFWX86JH2yunUAgAgfS3v+2NLKs/doNh
	C1sF5Ic11pBhyaBBppLIcJQWVuu9YqpywXB6u5zpM0aq/UuRs79Lki3lFuiDUtMBiMnq
	W/Xnq+Ls/j2em/f3P6YT0VR+Fb1C//B5LBS3nejH7RpgvtayRtUbmxmftta4PAMiEC5j
	XVRgvh3l4Za3aSpC2VqjA94/OUpqODCAIIwyBfYnssIsOZASVl8LSZnm2mBYaTcoiKms
	JIDA==
X-Gm-Message-State: AOUpUlF7BfqJriFJ8zzc2S/p3L3kt5OJfK/3UsiJsBlTBpzAlXWLzyTF
	3j7giV//ugM31jDhYtuTpo3DJK5mtj0rlVJSUGWaLw==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr3335296oic.252.1531856443530; 
	Tue, 17 Jul 2018 12:40:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 12:40:23
	-0700 (PDT)
In-Reply-To: <57aa2f3f-aa32-bcdb-f971-32709e717833@linaro.org>
References: <20180716133302.25989-1-peter.maydell@linaro.org>
	<57aa2f3f-aa32-bcdb-f971-32709e717833@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 20:40:23 +0100
Message-ID: <CAFEAcA8FnSP35scTZmLG6_qFOBsu1wRC0mLq5isz+Y_r907i5w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH for-3.0] target/arm: Correctly handle
 overlapping small MPU regions
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Adithya Baglody <adithya.nagaraj.baglody@intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JU/3mNzWNWkg

On 17 July 2018 at 18:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I don't understand why this is necessary in the v8m case.
>
>                AP                 APL
>     <----B1----|----L1-B2-A-------|---L2--->
>
>
> Your comment posits two regions [B1,L1] and [B2,L2], that A is not within
> [B1,L1] but is within [B2,L2] (otherwise we would not report a hit at all).
> Further, that [B1,L1] intersects [AP,APL] but does not intersect [B2,L2]
> (otherwise we would report a fault for overlapping regions).
>
> Surely this combination of ranges implies that [B2,L2] must itself set
> IS_SUBPAGE (otherwise the first region would not overlap the page of A, or
> would not overlap the second region).

(a) the overlap fault is only for addresses which are actually in the
overlap (ie "you asked about address X and it hits in R1 and R2"); it
doesn't imply that other addresses which are only in R1 fault just
because some part of R1 overlaps with R2. So for instance:

       AP                        APL
   [B1                                L1]
                 [B2       L2]
             A1^     A2^

we must report a narrowed page for address A1, even though
it hits only within one region (B1-L1) which covers the
full page which A1 is within. (Otherwise if we later access
A2 then we'll get the TLB entry for A1, rather than reporting
the fault for it being in 2 regions.)

(b) Consider the case where one of the regions is the "background
region" that you get if you don't hit on anything.

thanks
-- PMM
