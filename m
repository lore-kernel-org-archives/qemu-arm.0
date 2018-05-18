Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp267851wme;
        Fri, 18 May 2018 05:16:41 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrLWRabdBSrQmTbAzeh3IqftXJOSfCv0CzVHVlPAZm69zm3myakAWS9gfuIO9NYgL8J27Ux
X-Received: by 2002:a0c:e609:: with SMTP id z9-v6mr8662930qvm.158.1526645801376;
        Fri, 18 May 2018 05:16:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526645801; cv=none;
        d=google.com; s=arc-20160816;
        b=upu9ge/TYT8xy6+M5LCp8hHiZVTtcHRALezVB2g9XUydEoCB7EnmAwe3BU0BAs3r5B
         r+rr6ai2AvcOY3l0vtdjKWNTQln8mX4on6LfhbhtZahFzuJ50K2J3wDj3PyBsiUN6bEM
         sYe7TniuoOEeGaoQlGoyVvN7T+1/9bVF+wA0PpDRjZfLfT+ZERf5VFEM3Inzp/Bz/hpu
         OkbTyoExB5aseP/j+x7Pcgorwqf5A8wHvUbNNvTK304Bf+o4OJWTlhODOcw5E4zrSVn1
         MhY61S8TwVh7IiV0Hdbb7V7AG00de51ntjYqZ52gBPJddQtklvOz03Yi2QDtZ6eCWUyD
         tttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xewTYlcStlTrI98/MBIWHgK5KjjW7ELsM303OBDf7+E=;
        b=IK4WcVNFXfEUijCZagO7L+ST8AT1YlGv8v8Orglq53fpvhXiOElOP/N+F3yksVq/bA
         wLRb5r5SwhbqE1FXoB9aPH80zdvBFHfAbvgK/9kyYYddTxiTa0uBu6ko5yHTdVJb1t33
         K4TVIHrq6Zdcudo7gyxsk5uMJ+qFyS5/7V4CMjnxYR+lEYwENDofBSIBOWqrSfjekY+6
         jUo4CyEf851gXpawEM/FdOWGyXU7QkUmBByHgwdZKU2RESMy6uhg13G6/Ev6/1EcImm5
         5c8g6kgM7MJ+gjjLaIUaZuzA2xdCcGGrsm8GT1n9VKZtW15KqKGTbaPwv8hCcIcnXd1G
         FI1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GgHdQQkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h24-v6si4904933qkj.187.2018.05.18.05.16.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 May 2018 05:16:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GgHdQQkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJeJM-0004Im-SC
	for alex.bennee@linaro.org; Fri, 18 May 2018 08:16:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJeJA-0004IX-FS
	for qemu-arm@nongnu.org; Fri, 18 May 2018 08:16:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJeJ9-0006uF-Gk
	for qemu-arm@nongnu.org; Fri, 18 May 2018 08:16:28 -0400
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f]:40648)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fJeJ9-0006tk-AE
	for qemu-arm@nongnu.org; Fri, 18 May 2018 08:16:27 -0400
Received: by mail-oi0-x22f.google.com with SMTP id c203-v6so6902726oib.7
	for <qemu-arm@nongnu.org>; Fri, 18 May 2018 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xewTYlcStlTrI98/MBIWHgK5KjjW7ELsM303OBDf7+E=;
	b=GgHdQQkXVfyRkg/9Vv08r4/u7khxjDB64YLAPEWGiaU7DbVsRJQiy3dn/b+4KGrx2j
	uDh6oVLzuZGp1tldXz0ePGfbeXJNwFq0g1rNhWvGVwljmutD92VsdzsCRvbAoSlpujm7
	8RD3K5AmeG5rfsnS1gF4/HfS1Z4GYMQPoHXz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xewTYlcStlTrI98/MBIWHgK5KjjW7ELsM303OBDf7+E=;
	b=X+IlVVeY+0/zKNBj4bSe1MGBMiTITAvZ+ipNMtUsK37gFpDN1YTyFzAGWJXFUFw1Aw
	O5NjsYqo30Y6xxrhwEIfbkLKo36CRKCKwGwtk9RooJW7Iu4zt5393vSSQlHw2P1PrxbA
	j4++rMaFEYOavfqvxjsxRAl8t7OVbUCXGdWvtaAld5wJr5QnC4/bJfzc3hG9i2ZFsUVq
	epeCkmnbQy1eGJ7zXiuZm/ZXJYOi3u/LJvgWsPaXdzAPmKle5/7ARyVgPejfUh76Je4H
	1++3YDIG+Mve3yUY2476nR0LTTqRDMHa2a36Igd0iRSzk2pGYHvjLpcwrCiBa+NJ8n30
	F0fw==
X-Gm-Message-State: ALKqPwe68OiTxHDQYNJBJtyhiidgTKBV1ixqHDkNyfzEDy8s0DOLERv+
	ctyN216y/xAwZR90XZx4e4xKs6X5eC+AUfywJoABCw==
X-Received: by 2002:aca:4384:: with SMTP id
	q126-v6mr5118096oia.164.1526645786578; 
	Fri, 18 May 2018 05:16:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Fri, 18 May 2018 05:16:06
	-0700 (PDT)
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 May 2018 13:16:06 +0100
Message-ID: <CAFEAcA9p2WAsb7xiC9Y65EZYWzOrG11P_hKTx5BBPQAnd1xgcQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22f
Subject: Re: [Qemu-arm] [PATCH v3-a 00/27] target/arm: Scalable Vector
 Extension
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
X-TUID: 3xfLTxym+eg4

On 16 May 2018 at 23:29, Richard Henderson <richard.henderson@linaro.org> wrote:
> This is the first third, more or less, of my current patch set.
> I'm sending only this portion now, rather than another monster
> set all at once.
>
> The major change is to move the call to sve_access_check inside
> any final decode reject that might be required.  There are other
> minor cleanups to patch integrity and comments.
>
> The changes are mostly trivial from the February v2 patch set,
> so if an R-b was given, I have retained it.
>
> That leaves 4, 7, 8, and 26 (new) as unreviewed.
>
> The patch that enables SVE for aarch64-linux-user is not present.

I've applied 1-25 to target-arm.next.

thanks
-- PMM
