Received: by 10.182.158.201 with SMTP id ww9csp2649972obb;
        Tue, 15 Dec 2015 11:34:33 -0800 (PST)
X-Received: by 10.31.54.134 with SMTP id d128mr15726997vka.26.1450208073366;
        Tue, 15 Dec 2015 11:34:33 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22a.google.com (mail-vk0-x22a.google.com. [2607:f8b0:400c:c05::22a])
        by mx.google.com with ESMTPS id l186si2484547vke.179.2015.12.15.11.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Dec 2015 11:34:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22a as permitted sender) client-ip=2607:f8b0:400c:c05::22a;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22a.google.com with SMTP id y187so12457809vka.3
        for <alex.bennee@linaro.org>; Tue, 15 Dec 2015 11:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=/FqlHBfbSvjohu21riguD8RR6xWLeWFkpThXRwB2i1s=;
        b=W5eSCCoapGhwI+1YuCZfX+T82e2UlOL8o2/r68djTElMXXEPV6LGPqLe3U4nnAIbA1
         wx5lIv2sf+YkOgnjyW5EoEfnnReWBH5Y3HcCsn6nh6DyJCc3QSUN9GA7LuQ1+QpwYTvT
         N0ygiCDoagNfUuYFbwPBOlegoycvDJtO6/CfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=/FqlHBfbSvjohu21riguD8RR6xWLeWFkpThXRwB2i1s=;
        b=jyIy3o0Dv1WBZj4rU9s4zhhvYIlFsnRzJDQBxVu0qONsLkicSPtOuURF88T3llubiM
         MoSxlVQhGQekgCRf4F6ZORODtePbBX+5HuPnh9c4rvtKq3HV2gn+dWfAb0a/Zdfb+v41
         +cCN6u3UVdD6fNAk3WVjnJRrss5WSn3RSAoKEHqlwFPpINuDUGoDMo5yFzUuVZbwHNhj
         Td2O6v79BfDTzmlUd7uxhPohvgVujjw9XuW5kHpYPVbdR5fH3jSs0Sat6rLBxaF55XzP
         ncUv6AbXKc9DeeuekGRO1UpijFEN7K68YFM1EzLODpy1YEL0YUswnILsc0FZC2X6ffYN
         mFnQ==
X-Gm-Message-State: ALoCoQnbjcSs0B8LzTBBx4gSndeWDkVFIrmqoQd4TQAAv+fEga9gSiYpcbjyR7aGynSi7M6EcKRQl6k72jbucmlTW8RdBU+YWOyvWX7E7ylHXBXoHPh73Ls=
X-Received: by 10.31.47.197 with SMTP id v188mr30243623vkv.6.1450208073077;
 Tue, 15 Dec 2015 11:34:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 15 Dec 2015 11:34:13 -0800 (PST)
In-Reply-To: <1449599553-24713-1-git-send-email-alex.bennee@linaro.org>
References: <1449599553-24713-1-git-send-email-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2015 19:34:13 +0000
Message-ID: <CAFEAcA8xQzgz8oSL=WtammyRjckBbyJqvzvQo54TfCj9yovaTQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/6] QEMU support for KVM Guest Debug on arm64
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Christoffer Dall <christoffer.dall@linaro.org>, Zhichao Huang <zhichao.huang@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, arm-mail-list <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: znFm/fak2rrs

On 8 December 2015 at 18:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Hi,
>
> Here is the latest patch set to support debugging of KVM guests on
> arm64. The main changes are fixing arm32 compiles (mostly with stubs
> for the upcomming arm32 debug) and the usual bunch of minor tweaks and
> clarifications following review.
>
> I've kept the GDB Python based test in tests/guest-debug and cleaned
> it up so it will work with python2/3 linked GDBs. It still isn't
> plumbed it in to the "make check" so can be dropped until we have a
> solution for testing against non-host binaries.
>
> So in summary the changes are:
>
>   - Fixed arm32 compile
>   - Use results of debug capability checks
>   - Whitespace and comment cleanups
>   - Py2/3 cleanliness for test script
>
> More detailed changelogs are attached to each patch.

Thanks, applied to target-arm.next. (I fixed a few typos
in comments and commit messages in a couple of places).

-- PMM
