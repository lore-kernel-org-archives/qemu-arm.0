Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp519098lfm;
        Wed, 15 Apr 2020 05:42:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypJylfXcIhe6Ok42HdZhaWfJtQBzn5hWGavqPw1f5mSEmeLAv6UEdarIMFcjBo7AfLApbnZg
X-Received: by 2002:a37:6c81:: with SMTP id h123mr25716825qkc.290.1586954551984;
        Wed, 15 Apr 2020 05:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586954551; cv=none;
        d=google.com; s=arc-20160816;
        b=URSE1jtCvRc5O4qVAdA5Rlz3OhMcE/Ondt12TA/MXyVTOAfciVTmpdCokVZA71m9W2
         EFPeIKTNbwJuv4wQWLX7oF25t8EnWNXv0g7GPBKQMnXFYQEa0MHvix2RPXQDfTdnr0Je
         7QnU33QywyH7DZcN8lLYB6uX+NmKG6s+NEQ26IzdkvirJPm88iVOOAlmYkxHR+X690qG
         RKOeMsEewddEmqYfpKlJkMkiRA+VDsP2k4A1TylvODZ7d7XtjP39BeKqQvgxoc4eBOGf
         JpryDLAkUpnePAFez22QqPR/b4jWe5JkVPpUl4CcBH0R0CugznBLz/qzxtO8L5VKDtkr
         lJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2hfbt2K15csCGvIx3QO/hVwsuFsbfh6/5w3bbgIgOk0=;
        b=0XQQt6royqmu8ln8k4EKQ7TnFFrf2e0DlsxiA1rxOvIiQ9ldQ2mfAMeQBj+0GBqnes
         XLCuRwpfe794tPTnodLviIR3b6WqyxNI7zMlH7wWm9WKEMA/alcodo4+uE0LyNoAwlNa
         dSTQb5mw8sCJD5gk7eu/QwMZvAoAK168YGuie4k/2GvWoENwQUFLjt4Ld00bYxx+bxbv
         6CzRxSSiPahn+818QQ+eWDd+Sherazxd4q6we/W2k7qALfNfXQmxzXXKUSep9426JfuL
         JIe9NjSfpeGwvt/ukg1Jmo+uTFtPHUoP6merLrHCsT5aeQEyDwsRtbFfx6vD46ZcK7gx
         DhIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KhPc6Tx8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si9177257qvz.101.2020.04.15.05.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 05:42:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KhPc6Tx8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOhN9-0004oM-E4
	for alex.bennee@linaro.org; Wed, 15 Apr 2020 08:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jOhM0-0003vT-9c
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 08:41:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jOhLx-0003dQ-Hq
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 08:41:19 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44007)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jOhLx-0003cy-9r
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 08:41:17 -0400
Received: by mail-ot1-x341.google.com with SMTP id g14so3180447otg.10
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 05:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2hfbt2K15csCGvIx3QO/hVwsuFsbfh6/5w3bbgIgOk0=;
 b=KhPc6Tx8F57fncSLkiACqyRc6Xc8vSLnhul0OSweWzKF0zhEPqaOetFEVCZXDKEoUj
 AXShra4wkNjMJSJGwGwrXhnFAew7CS8UPsMrEuK15eHx+jVH+rYes15sXQzcP15H/p17
 SD7qE1Ofwr6YHk2CEcl1UdBrXvUEJxTC1Iv6AAgeGgGvwBeKHS0HgjILbUiK7YrHRG3+
 g+EWfxN9GrBtCmNT3jj19lRFvoEJs1Hyf5JY1oLXB5LwDJnC4XfVWsvtNi1K1liQkfx4
 j6btNl8Q91JoSwS0724lCAHdnVazmBZIJT2qy59vmWvNQ1xcFBj0s9W3o1cq3+qrCzcw
 qCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2hfbt2K15csCGvIx3QO/hVwsuFsbfh6/5w3bbgIgOk0=;
 b=elXCH67og6rj70+y73BQw6aminVNy4gjdCiFqrwvLHmKBXMqko5gzhHw0Qv0uKkKhm
 9NbeEIUaghfZDZjetDgF3Ol1mSjyCkQVlG2+hr8PUGqOk+PGuXe888quaA5Njj+lyMjU
 MC5sOTXXNw9vf8373SGf0SH7cUfeCwcM/3sMI8w5a8jRxIcGrgfDv3gGse3E9lGJoSMp
 +kEPVX+ZVQIUhIbZtTd0x6uFAlesJTD9myBFs/N3vpXupn6anBb3Q2U9ytLoJnFRdjoS
 DdY0NCHQvv140+weRJWeBcwKX0GnJ4fImBXwPciGskgIBoLFYEZQyzdEARzlQ/KFj1SY
 2aPw==
X-Gm-Message-State: AGi0PuYgTqyX0cUQxAPeuzl5H+NUXoTZ4IjyWjNj8nb8KpoR/II7arsb
 qTJLshNAKpmpDiLhYf4gEg/dAcj7bpB+AE/3eSE8HQ==
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr1248988otc.221.1586954476361; 
 Wed, 15 Apr 2020 05:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200414120935.12719-1-peter.maydell@linaro.org>
 <20200415123310.GC1344391@redhat.com>
In-Reply-To: <20200415123310.GC1344391@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Apr 2020 13:41:05 +0100
Message-ID: <CAFEAcA80g-Zohi0t7u51aNs58i8_zPCOcRob6zx6DYdTjYfXWQ@mail.gmail.com>
Subject: Re: [for-5.0] Deprecate KVM support for AArch32
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vDr5Fbj0b/HJ

On Wed, 15 Apr 2020 at 13:33, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Tue, Apr 14, 2020 at 01:09:35PM +0100, Peter Maydell wrote:
> > The Linux kernel has dropped support for allowing 32-bit Arm systems
> > to host KVM guests (kernel commit 541ad0150ca4aa663a2, which just
> > landed upstream in the 5.7 merge window).  Mark QEMU's support for
> > this configuration as deprecated, so that we can delete that support
> > code in 5.2.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > I was reading the 5.7 merge window writeup on LWN this weekend
> > and saw that the dropping of 32-bit support had gone in; just
> > enough time to squeeze our deprecation warning into 5.0 so we
> > can drop the code in 5.2 rather than 6.0...
> >
> >  docs/system/deprecated.rst | 8 ++++++++
> >  1 file changed, 8 insertions(+)
>
> The docs are sufficient to start the deprecation process, but
> we might consider also having a warning from configure, or a
> message on stderr at runtime to make it more visible to users.

Mmm. I didn't feel entirely comfortable making code changes to
print messages at this point in the 5.0 release cycle, though.

thanks
-- PMM
