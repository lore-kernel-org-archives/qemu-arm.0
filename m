Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp738747njb;
        Wed, 31 Jul 2024 20:39:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUKYffUWTVuksmqj9/DwXJGS1tiypKUVq36HML9eEp5ExZhYE+4yEmODsMEo2E95lxDBDl4O6xI3QrLhSAh7XtQgij9yfk
X-Google-Smtp-Source: AGHT+IE/hkkvia884MgdjQMK6zfo2kFgDYPiOx5WOl9aISXDFDh6KXrgu9IPforRdJirea5QXadv
X-Received: by 2002:a05:620a:1a23:b0:79e:ff18:b4f1 with SMTP id af79cd13be357-7a30c6d9d79mr156730185a.51.1722483590032;
        Wed, 31 Jul 2024 20:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722483590; cv=none;
        d=google.com; s=arc-20160816;
        b=PPAuHl//S8cu8oUitw2ellHWCwvtuUq35c9XhyUsqHD9Pg/TRDOU+hcIcKd6wFJmSs
         AU6w1gqEZ0ASpxIK7TLbkaZdShv+lUL1epyOpJqMh30HZqNniGrsMDs3ZCezwXpNi+7w
         USwXquyzTts5Ig9d390pPA8TlcT4nw0VnzwPW1uIwenX6cAR6QNf+D2uhV3es19FGL/j
         1gOOA2uq1TmIunOf7LUgF8JipCmiL/vS9MfPUBQS88v7eZ0mdE/vpEt+BsUBXN5f19xH
         P6ZWfAf08OLXCDZTaLDqeKlvRAxugQOcaHTiyWs41/RuVyg5ziGPe5KevK2qgFAbhot8
         egNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a9W2VRIIGErciPW7gZomIT9/wCLlvJpDwZh2b3ecZfw=;
        fh=5XZ8xRG6eQsX17X/F43z0TwLA02BN/Lild5VsXZ8Tbs=;
        b=tcZSvPKBfvkcywkNDWd+jSPgiL91GTtkWtgLBjxeuUBzGDKdX9kI/SBs7TV6XCv9H1
         vVvlY+9JVTFq6vZB7gBqlf/sdaKRbNtHOCbTlJa3SjoDjHO+JZLMWzU/8pQMUByS9yv2
         slH+u/v5mRz5Yo01VoAJ+K6DbxDPjxkkRQ0kodfUwkagjgIElcb3Bl+FEJZbA2pAWjLO
         2iLJcWAwSZmz2SLyqQVGhcMTSOpY3Za0fvHDRBwR+HdusW1xvxcNps3APMQ4MSfrPbT+
         93q2EZc24zWPLHEU/oiK4WpMDRoGwmvW13Qd6q6g9Wj5yAZACM/aQk7Z2/ccm1BGxSc7
         CPyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zh3uhhOd;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d74622e9si1695463285a.441.2024.07.31.20.39.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 20:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zh3uhhOd;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722483589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a9W2VRIIGErciPW7gZomIT9/wCLlvJpDwZh2b3ecZfw=;
	b=Zh3uhhOd9/s5i20Prnd+UkjoqOTjCNpj//kECTRFyhVPjn95NkigSnhH70uc5abPA6z5OC
	iihXlLCgxpZ07dQq9QMf/PJj1tcZEsgt7Knnn5qnmDPis5HyyrKfKL8D9lDCFaaMo4dQQl
	L7ZovpjOrpyTQEG5Fac8mfJHYhptDaU=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-6eG-T-E7PU-nC_AoN3-orQ-1; Wed, 31 Jul 2024 23:39:48 -0400
X-MC-Unique: 6eG-T-E7PU-nC_AoN3-orQ-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-668e964ffd9so135296767b3.3
        for <alex.bennee@linaro.org>; Wed, 31 Jul 2024 20:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722483588; x=1723088388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9W2VRIIGErciPW7gZomIT9/wCLlvJpDwZh2b3ecZfw=;
        b=Mfl7nrKYuFM0GsS5gmlvwu7SOn0xiZw7qOb9w2SQrI6MN5VXRcapjRQw2/LdTBkjHg
         3M6okUyfAgYDv7oae5zTf1h6bV9eBgIV5Qi7WgykEFLTARVS5OBi7AQpXtBtGERRDw44
         8Bhv1lZn+eaLrpopHWCjzr81+KV33UZG9jBbfOgnlo1+pKYRvDw37keXixwDRE83p3xk
         7SbRh3i8ZU5tsrLmdrb3RS/SUhzsZ3zzJgxMRp0l1ncMdxvAHCYQEdEGbzGKPvdpxZEx
         SDHupZK43vSBMdA1fepTRRUWvAjU0ebjCW4dYpQABmPJYF5ijYM41uFMkpIj/HFkGrtZ
         6mNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0jisSn99SyYPCnUk2Chm6Xr0YRIToZoXNeRNXE1KR132/TjnOoZF6a190M1rZj7t2pl9Zed312ceWX6NHSGJzPHHp2Stb
X-Gm-Message-State: AOJu0Yx1IxeIALzNyqyJSDvj5gyvcoKh1uLz4tGlBrldwZNlzf7IQKSv
	RrSwVZTg5lmPy3c52ChXWcqGxqnEu7kK4QPMMEbaoa3K3SjbT6urWFEW5UUExkFmUmfq6m11A5k
	ZUFlAMum3eGfY13tnh4yBaIxXHKtnGdn5l2DeTftbGptbXrvP/Oe3uM0IbsostrGKLN4D5KLs/f
	tarmftP74Q2z3SIFClEwRPDNRj7nzA
X-Received: by 2002:a0d:dc81:0:b0:65f:8218:8b2f with SMTP id 00721157ae682-6874f605a38mr12027937b3.43.1722483587795;
        Wed, 31 Jul 2024 20:39:47 -0700 (PDT)
X-Received: by 2002:a0d:dc81:0:b0:65f:8218:8b2f with SMTP id
 00721157ae682-6874f605a38mr12027747b3.43.1722483587507; Wed, 31 Jul 2024
 20:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240726134438.14720-1-crosa@redhat.com> <20240726134438.14720-11-crosa@redhat.com>
 <a7f2d78a-4de6-4bc6-9d54-ee646a9001fe@linaro.org>
In-Reply-To: <a7f2d78a-4de6-4bc6-9d54-ee646a9001fe@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Date: Wed, 31 Jul 2024 23:39:36 -0400
Message-ID: <CA+bd_6L7o05mENKVuLLfMFK9OF6ckU23ue0xmxiWO5oiT4ZEbw@mail.gmail.com>
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
X-TUID: sUzb0S3ZmT7R

On Mon, Jul 29, 2024 at 10:39=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 26/7/24 15:44, Cleber Rosa wrote:
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >   tests/avocado/tuxrun_baselines.py | 16 ++++++----------
> >   1 file changed, 6 insertions(+), 10 deletions(-)
> >
> > diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_b=
aselines.py
> > index 736e4aa289..bd02e88ed6 100644
> > --- a/tests/avocado/tuxrun_baselines.py
> > +++ b/tests/avocado/tuxrun_baselines.py
> > @@ -17,6 +17,7 @@
> >   from avocado_qemu import QemuSystemTest
> >   from avocado_qemu import exec_command, exec_command_and_wait_for_patt=
ern
> >   from avocado_qemu import wait_for_console_pattern
> > +from avocado.utils import archive
> >   from avocado.utils import process
> >   from avocado.utils.path import find_command
> >
> > @@ -40,17 +41,12 @@ def get_tag(self, tagname, default=3DNone):
> >
> >           return default
> >
> > +    @skipUnless(archive._probe_zstd_cmd(),
>
> _probe_zstd_cmd() isn't public AFAICT, but more importantly
> this doesn't work because this method has been added in v101.0.
>

While it's not the best practice to use private functions, I just
couldn't accept rewriting that for the skip condition.  I can make
sure future  versions (including 103.1) make it public.

Also, these patches count on the bump to 103.0 indeed.
