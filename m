Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp977477njb;
        Thu, 1 Aug 2024 08:18:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUi67iMRnLSWF/BYjfm6yzKQmyKp2jA+k/45cSeVZypUGJjrSxHBCJfJMby4FU5qZsp70skhRtl+7fIab4NvQbzBuTBso9
X-Google-Smtp-Source: AGHT+IF9NSC5HJ/hQitR71oJMg32ATe+dcAuBIlSeCDqGsq1XFnv2W0EJ+Haa7uLnS3MFsCSjvWz
X-Received: by 2002:a05:6808:1244:b0:3d9:2751:a207 with SMTP id 5614622812f47-3db5583912amr427413b6e.44.1722525528336;
        Thu, 01 Aug 2024 08:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722525528; cv=none;
        d=google.com; s=arc-20160816;
        b=CMCJ9furqjMlLMaRa0JIeD1xhVRTxpg2vLskLgvs5gQhF+u3QoxcMSdXIuiBXB+Fx/
         BNIJX9dsDPHN2GCRLfSmjBJj1YGpmA1Wk8x86DnqzO07J5iXd7fw9GlNEzimBECFlD+D
         YWObkew47m0iTDuGXBmWkXi8mzDJiC2XoyURTK8QiAdCEO1Q96c+lfzk4/yW+mVoUw99
         0Cwfc1YdGMKJtN9FfLgUj/RtojBZmZs8fhAOB19BH50dQdnvY+PXiWJYR4aWQhTwpp7i
         l5bAn1FbqeVUS2325hY6X6qZcXuPxXLRg8xOKsgYy85YSa6Kv8Kh3WbNXel2bBYYAR8h
         ZxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVxVy3b6V33WthljR6Bt7cM5dUbZoIOtKUfZg4kCmyc=;
        fh=dsdz7uPQ+RG3h5Gc+lbrs6RFRcK9lfsFjqNopb6pfhY=;
        b=jjOwqeHOPIQ3CQj4gSnoqPvDXN/mhqjpc6bYeE04zwUoNcaaUdPyLGG8n8MDAktILj
         0VA4qZigvo2MjuhY+Ww5a71A1/2L11Z/Qw2dh//+52z2V9lYg9ZnjeARfHyiQ4flhEEd
         TBp1oH29BQVIHtXZbJDiuoVeu9rhP7imc/H3jis7X8PZCGF0kf326vC7FWECRocTc4C8
         Vra/QJE/SptSxWmupu5i005PSJWPWNY8XbvCauLok2Ll2sc15VX78Q77JiK2kR7F2SYO
         WdgBRAKeXD2r+/oEqsjy37cJHuPFo2pYWJx2ZHLTjtrRT1LK7zSo7NJN+eLsJRYaf8op
         j0Hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aNGxgu1Y;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-83c09d25ae6si15798241.163.2024.08.01.08.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:18:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aNGxgu1Y;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722525527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iVxVy3b6V33WthljR6Bt7cM5dUbZoIOtKUfZg4kCmyc=;
	b=aNGxgu1Ym4FfW8fFgm7S3tuC3hA5SfGCUB8B+scAQVdDe3HBVeIpkcTpDTH8Ts1eMrSsvF
	BIfrM/ZxABopVjlFMdSpB6PGCr2bpLHvkGy3X1teOi7x/csKYXXelyIqS5om/sipiv+NKS
	rIlhw1JmrxAG+0J5Xae9DkdeqroY1e8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-GTGhlFpvPJuDZ_yiDzXXVw-1; Thu, 01 Aug 2024 11:18:46 -0400
X-MC-Unique: GTGhlFpvPJuDZ_yiDzXXVw-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-66890dbb7b8so149982807b3.0
        for <alex.bennee@linaro.org>; Thu, 01 Aug 2024 08:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525526; x=1723130326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVxVy3b6V33WthljR6Bt7cM5dUbZoIOtKUfZg4kCmyc=;
        b=Ow21KqOYUbqxf6/tR+QN5dACQR0ZWOpmfv/5SM9f/l3cNI3EUX2LBNj1HYUDFuLAlQ
         5DWH3ezWSv2cpz+7vp1iwR3TKxqCWAid0BQZOcJhWHZgUXyPOjkbfI1wCi2Y+r00i2Ie
         08bPx1iDvgi2DgfA1jLE07ATNbkmUJwtQn1EFYtjN2oFlp+nY2jJiF/4XsBbQC+U8LKc
         KYE/AzL6gdwNVt/UtIWBWvE7+U6uz9qobW02RQLML74ypjkeQXa6YfbzK2UoWdQMAvC3
         rGC06pOIN90DklsvbqaQUypApNOW1d95jpSV97PwgEnNSmu7XhZ+etK5lJJQKhyqPn66
         K5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVwO9MVyr6YKdXqxAAbv95ncg/329L/XUVEJkEJDnmyD8z6DpjIFACuoNhYvRUzVv9cgFr5D5dhrLmwL2kiHxhLi+OL6mgA
X-Gm-Message-State: AOJu0YwP7zIuAWpA7C7R3mO2NFsPZiODoWOWfNGlntV8MZOYRBvaX+do
	kIKJ2NpHhXF2TrLzFF8XwmFT8dfBsIVgd2hJWfh2+w/p1ZzebfJRYizAIUOb/2FhzqXQbEf/z9g
	5y5togKPcBmmUu41XNgn/Xxao+F9GLGOKVU6b5AWc7FloZgrBzF/x2RrgGDVSeDr+fqVk3PxYoW
	ZV6yaJ6dVVVm73Tk1rNRCtU1nhMt35
X-Received: by 2002:a81:9c0f:0:b0:65f:d82c:af86 with SMTP id 00721157ae682-68960589ddamr4136887b3.16.1722525526300;
        Thu, 01 Aug 2024 08:18:46 -0700 (PDT)
X-Received: by 2002:a81:9c0f:0:b0:65f:d82c:af86 with SMTP id
 00721157ae682-68960589ddamr4136647b3.16.1722525526042; Thu, 01 Aug 2024
 08:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240726134438.14720-1-crosa@redhat.com> <20240726134438.14720-11-crosa@redhat.com>
 <a7f2d78a-4de6-4bc6-9d54-ee646a9001fe@linaro.org> <CA+bd_6L7o05mENKVuLLfMFK9OF6ckU23ue0xmxiWO5oiT4ZEbw@mail.gmail.com>
 <68710de3-02da-4fa3-936c-62c85197893c@linaro.org>
In-Reply-To: <68710de3-02da-4fa3-936c-62c85197893c@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Date: Thu, 1 Aug 2024 11:18:34 -0400
Message-ID: <CA+bd_6JMb-asEgR2qLcdton9uqY8ubg0gL-R-FfaEhEjiirRkw@mail.gmail.com>
Subject: Re: [PATCH 10/13] tests/avocado/tuxrun_baselines.py: use Avocado's
 zstd support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, David Woodhouse <dwmw2@infradead.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, 
	Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nZC7dg7lM+C/

On Thu, Aug 1, 2024 at 8:59=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
> > Also, these patches count on the bump to 103.0 indeed.
>
> Then either mention it in the commit description to avoid wasting
> time to developers cherry-picking / testing this single patch, or
> move it after the version bump, avoiding bisectability issues.
>

You're right.  My bad.

Regards,
- Cleber.

> Thanks,
>
> Phil.
>
