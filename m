Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1842606wre;
        Thu, 24 May 2018 06:07:19 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKwNQyUgQk0v48YGh3iejT2UkBBog4S3YwCHmDu1wbntb13MUKTucAd+dLHpvfo4MDiCcGj
X-Received: by 2002:a37:8484:: with SMTP id g126-v6mr6660155qkd.273.1527167239064;
        Thu, 24 May 2018 06:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527167239; cv=none;
        d=google.com; s=arc-20160816;
        b=zfhrwXN1OcIipzIkEaVMDmXJjUwlxC6tK5ipkloTk7xgU38PvzY7cf+CK43AKmEDAG
         KKpYGu6aZ5Tl1bhtV7AWOZDrF6soQbVKje0GBcIArdsMKY69yhi4lwSgVKF5KzMweLsf
         OdYy8Q75HgDa0kFcEn5dbo2WaBhJ26luprrekO8Bsb04XgTBEmbSVadWmDFvtS2F1CGJ
         cdWmU/sn84vDcCssqnxYTUzbZzXrCtGDpK87fs2prLJpX41dl6xrj582b9xo4gUh31i/
         j1eriUTC1qpPjUBH/SwAWmvmWS0sjktdXpPTQCv3bqTPy2fnloL5iaCNeW2MLQbBzkNT
         lXAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=kJLTxDledDlNlQEoZBJmoVF0BxL9pVLRAcCUYJquCHQ=;
        b=C9aqRgwwC5KUml4YnWo9MWbFUtHIgcyMVVAljnogim4qLIeC85M1+QAIGHubpUpeme
         tuRAEmv8pWUNS/+7cEG651FRo9jOSxQaWc+xh0U7ZXt73LRJ7fnQYQH4aTq3+3NEmcdC
         UKafa1xTkb6w5NXCTJbm0/RFZSjkS8qkVCmPYnOmzkc5TAPeK/96fLvlgUpDJEbrZSm/
         Q6gwUjlCFN5w1ddUdHz+Pye6HpXjFYRxAq1Ix7X9PY0ov3Q1iTuhyffTNueHm1U2YDGs
         KizKcsSk0Dl9tCMHCEv6QDjnSvpsv1rM0+amzWHc9HLW2vILVw2TgwZ+ZSJ1OiCZJ24s
         frVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ljQznomZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e29-v6si3188598qvb.30.2018.05.24.06.07.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 06:07:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ljQznomZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLpxe-0002vI-Hv
	for alex.bennee@linaro.org; Thu, 24 May 2018 09:07:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fLpxT-0002uM-M2
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:07:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fLpxO-0002wz-0e
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:07:07 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1fLpx6-0002p5-Es; Thu, 24 May 2018 09:06:44 -0400
Received: by mail-oi0-x243.google.com with SMTP id a6-v6so1364737oia.2;
	Thu, 24 May 2018 06:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kJLTxDledDlNlQEoZBJmoVF0BxL9pVLRAcCUYJquCHQ=;
	b=ljQznomZLVjJ3EExh1BpAJ5hO9KCHwUI2IkUd5+57irN0n3fdH857UhXDIkQbX7OtB
	zUHDJTyGJ5GP47xuxHKKiQWSEqu1ENbmDUUhAaUDsbQxZiEpbhvLWfyYjLYtOPlKZpN0
	wmuOk23ZiE2pdtIq4iAoFRFJnGO5p5OsyQlz1Q12IzqkvBkN6Dkguvho2KohdI57vFqW
	C2EtgSNTv8IZIfWGz5G8gWW8bwNrKdy22C3HOHeWb486hWlqCV2Ly0jn9q+ax0OAnHUv
	2A5asi+mFZ18lNmldAqnx/uSh7MVPkl75I5zkmw/rN5277CRltcBBc8tVLNQFkFzIhuR
	+b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kJLTxDledDlNlQEoZBJmoVF0BxL9pVLRAcCUYJquCHQ=;
	b=GmhXYq8DIXXCAysYOPzgGehSsy5mb4j0mhyNMYueowN2TTixuHJRGIZKQjhca8pJB4
	a8CJWvNk9kCLYKJngGmwk3QHzhmHe1Bd6evnnLQYIhGdoAcoDg0ojWx2wlTCX34ynXgm
	MOAhztUYEm3YZFNGuDhPDYA7vHeRqrAC5AuG+EyAjXAOJ2k/yOqvo0z8tkBaEqk3L2mt
	hYG7JhmNoxDKtpEaVxPKOeYxjIO2CACaL/0N8JUjVZIePSfbVPjdvO0uZ3OuSzTYFsPn
	XpMbcsIpIIUqj+Eh6mGLSuRtEfjhUyrcdIvbrGl0V7o4ub0Nd7fBijmYgeGMG7Sjo3ee
	xA5A==
X-Gm-Message-State: ALKqPwcjMopIZz6StddcZNTbi8HC/eRAfvnyto49P/L3nmEe73YuiaOf
	tAMwIHnmVnHqIep2q4HaDMTPQlyWCM9OACaOdrw=
X-Received: by 2002:a54:4e8b:: with SMTP id
	c11-v6mr4055346oiy.250.1527167203392; 
	Thu, 24 May 2018 06:06:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4187:0:0:0:0:0 with HTTP; Thu, 24 May 2018 06:06:42
	-0700 (PDT)
In-Reply-To: <CAFEAcA_YoGsJ_Yuc5EFBJwnANdNXb6YQ3tV5pyDr8RD=0itXbg@mail.gmail.com>
References: <20180522175629.24932-1-richard.henderson@linaro.org>
	<CABoDooOCO+NCjZaPVa6jFzEWztHSBDEMfsmjbJ_gOGNk3PRWNw@mail.gmail.com>
	<CAFEAcA_YoGsJ_Yuc5EFBJwnANdNXb6YQ3tV5pyDr8RD=0itXbg@mail.gmail.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Thu, 24 May 2018 15:06:42 +0200
Message-ID: <CABoDooMkt37WuJOmztQi0128Rv6YXrboqmmKkgAqQNXQ23L1fg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] tcg: Fix helper function vs
 host abi for float16
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dKOxcLP8/UNe

On Thu, May 24, 2018 at 2:28 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 23 May 2018 at 06:10, Laurent Desnogues <laurent.desnogues@gmail.com> wrote:
>> Some AArch64 tests I had that previously failed on a x86-64 host now pass.
>>
>> Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
>
> Thanks for the testing.
>
>> Perhaps the two occurrences of the following comment in
>> target/arm/translate-a64.c could be removed along with this patch:
>>
>>             /* write_fp_sreg is OK here because top half of tcg_rd is zero */
>
> I think this comment remains correct, doesn't it? At this point
> we've just called a helper routine which is 'f16' return. With
> this patch, that means that (by virtue of being uint16_t return
> type as far as C is concerned), it will have returned a 32 bit
> value into the TCGv_i32 whose bits [31:16] are zero, as the
> comment says. We require that because we're using
> write_fp_sreg() to update the vector register, and that function
> zeroes out bits [127:32] and assumes [31:16] from its input
> should all go into the vector register; but the instruction's
> semantics require [127:16] to be zeroed, and it's only because
> we know [31:16] are zero in the return value that we can
> get away with calling write_fp_sreg() rather than requiring a
> new write_fp_hreg().

I was reading the comment as somehow explaining the assumption of the
ABI clearing the top 16-bit of 16-bit return value.  But I agree it
still makes sense as it is.

Thanks,

Laurent
