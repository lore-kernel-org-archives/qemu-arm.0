Received: by 10.25.0.23 with SMTP id 23csp3884lfa;
        Fri, 2 Jun 2017 08:56:03 -0700 (PDT)
X-Received: by 10.28.63.9 with SMTP id m9mr3763435wma.87.1496418963796;
        Fri, 02 Jun 2017 08:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496418963; cv=none;
        d=google.com; s=arc-20160816;
        b=dPpQUxOO4bO47Bj5Em6KLGsClqDP1ZY6JuediYHd+/ebOHDq+FKjfFRKBDyQNYNngM
         3/5fbWyxYdfWSkRkeChvz+Yw+PTKxclKn6eyvhY3n4syPZQ5DEQIhXNnbFv1eMj1wgMC
         sRUDuzlonQPTAoci7kHptalh7iNI/7KqDObDVJDYhGoZmO4WIO7z9mUeaiRVmoPRb70f
         gSD32BE6ZocYIRA7z+nu0bRw6jxzfuRT6iNZUTq9h0zBbPpT6xUU3DcgFvtB0vN1RqiA
         9UFZ7OI8AP70BUZPhUAyQ6TXX6Np91Yv9ioLvBLB42KN983oaplLq2GUvrxM6RPuq9g1
         Qctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+D15mduLL3qn7hnG0Waad9eO7N5tpqCMYePYfKHkdbA=;
        b=jTnuGht+MbvNXCzZK7uEp5m/xIZLU8lyDakSaa+VKCKQVW1yl5I12Fh/I61rlkvCT7
         HZC5nqyaxwcIaAZgxt4olOBAGfDVVdbevCsKwhx9h+69kyIFUmkREyI/clfyYFjj+vnb
         Hco9n1ux63hpLyeDni2ByQDUkXVzqNyTOvHju8d9XcTzXvmtdocnVW1K4cOZKzu10Pfk
         z3sTmfuKquglgvOtqodlGzW0zlIapRKl9sTjq+1dFu0WdEGgcfEjr5SAfnXxqoCBJvBl
         HnREcINldTtrEb8XkNHomUWz/yAhTIMXpzHtrFz+UlNZ944WArSnVdAj0hgqr9YJfOxd
         KEgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x22a.google.com (mail-wr0-x22a.google.com. [2a00:1450:400c:c0c::22a])
        by mx.google.com with ESMTPS id 65si3171606wmp.150.2017.06.02.08.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Jun 2017 08:56:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22a as permitted sender) client-ip=2a00:1450:400c:c0c::22a;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x22a.google.com with SMTP id g76so9175507wrd.1
        for <alex.bennee@linaro.org>; Fri, 02 Jun 2017 08:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+D15mduLL3qn7hnG0Waad9eO7N5tpqCMYePYfKHkdbA=;
        b=KeebQNaVrhBvSLKQHfPaLnwMuzzxl7sU1rzn8rpCZc+i33A8+mJ5n28ThEAbxMt8K2
         i1ZlpLlO1oXEpDkYqJFSgZxXxNGZcVnnA/Lp5/jx14thiRuK3N7iIb17cPwxJmnTrKSy
         ILXhZ3AiKYTKFIxVy46EWFhfnIlZR0z/DC550=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+D15mduLL3qn7hnG0Waad9eO7N5tpqCMYePYfKHkdbA=;
        b=i4ksgTBCYm5VqtE8IJcL8Ne6reuGG/rkmHOYXN7lVCbz/c7IlYchmTQ1X/nxHOx16r
         3bdgviaP8YfSXveSGGW1x8MibY951JpMDC/95y6rXgWdObG9QoxaTwBc/aHSVA31LosF
         gEDfsczRC52HqHcnBmS3HP7KOyaZ2XPMQlIzOtnoXuEp93Rb5bxgKy3XjE83ptiZOx9e
         cHb39WItE19r2paCXiTABXL4ga2QLm92CTg/TyDvSn31GJ3kyqouAJ1hydV7/av/7L+Y
         c5STYF/eKKg8Qo8Dl/Gu1k3hhpDiRp6RJh6lNB5hXAXF4i9tjGVXEOtX+ySz2UZ6gYjF
         aPZQ==
X-Gm-Message-State: AODbwcAi8YGOPKHanBY85B4kQFMVVgCrNy0FhXMImAPvfSyrDgoPjfps
	owcqlYoG0gbEQd4Ap5fI3QkxXjAiE9umCzBkQw==
X-Received: by 10.223.150.139 with SMTP id u11mr5478745wrb.195.1496418963229;
 Fri, 02 Jun 2017 08:56:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.178.66 with HTTP; Fri, 2 Jun 2017 08:55:42 -0700 (PDT)
In-Reply-To: <87k24us83w.fsf@linaro.org>
References: <1493314727-6951-1-git-send-email-wei@redhat.com>
 <CAFEAcA-KKvhspYza=8TNNuFtqzco=ChhtS6Aa5hnn8=Cb036-Q@mail.gmail.com>
 <4dbaaea9-7576-9acf-5327-b22db6f00ed2@redhat.com> <CAFEAcA8K9DENSPqJD2Okqjqyi7T8RhSBmhCa3ztooJK5xdcZVg@mail.gmail.com>
 <8b782ee5-3545-3cb5-3b09-209fcffee7e4@redhat.com> <CAFEAcA8GY3yqZCVHihcFaFS-EkmEy+FRJ9+Kq_xRRdzD7+6DnQ@mail.gmail.com>
 <87k24us83w.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Jun 2017 16:55:42 +0100
Message-ID: <CAFEAcA8OgWtafU+9Jy02VLdfWhdA=LymQrHsR-1SKxGZQFPW0w@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 0/2] Fix compilation dependency issues of CONFIG_ARM_V7M
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Wei Huang <wei@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: wxpP7s9yAo2I

On 2 June 2017 at 16:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>> We seem to run into "CONFIG_FOO is defined for make but not
>> for the C preprocessor" from time to time, so maybe we should
>> fix that?
>
> Hmm is should be auto-generated from config-(host|target).mak but I've
> never quite figured out why we need timestamps rather than a straight
> dependency check in rules.mk:
>
>   # Generate timestamp files for .h include files
>
>   config-%.h: config-%.h-timestamp
>           @cmp $< $@ >/dev/null 2>&1 || cp $< $@
>
>   config-%.h-timestamp: config-%.mak $(SRC_PATH)/scripts/create_config
>           $(call quiet-command, sh $(SRC_PATH)/scripts/create_config < $<=
 > $@,"GEN","$(TARGET_DIR)config-$*.h")
>
> This seems to be one of those things that goes away on a make clean && re=
build

Not the issue in this case -- what happens is that these CONFIG_*
defines are defined in config-devices.mak, but we don't have any
equivalent config-devices.h which would expose them to the C code.

(I assume the rules.mak stuff is attempting to avoid having a
not-an-actual-change to the .h file result in rebuilding the whole
world.)

thanks
-- PMM
