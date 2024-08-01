Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp736531njb;
        Wed, 31 Jul 2024 20:30:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1CMShtRnU8Xtt+9uSWxfyq/juSG4gXDCfymyUMLrlQe9kQ1IzOF7X8wBvgppCK1XtoFjF5aTHnecxYyb+iSNWKQRDvBER
X-Google-Smtp-Source: AGHT+IGOijzwwS+2CuSKJPiS0rZL6jveaRvPY8IxaHriKjiabA/SADE5PrfwQ9dICHQ/rTFDOyZA
X-Received: by 2002:a05:6214:498c:b0:6b7:97d7:1204 with SMTP id 6a1803df08f44-6bb8d8543aamr7378386d6.5.1722483042973;
        Wed, 31 Jul 2024 20:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722483042; cv=none;
        d=google.com; s=arc-20160816;
        b=stQEqJQT76I77wV7PyIX3azlsgc2WL68n0BAIMlLCygCdkAhoZPVFJVXjV6fOXKBf0
         IPLBYgRoafp1SOiu1elmiQ2h01eF0p4c4eul1m+6QmQEb0vBAEXAuQ3efs4t1SNepR/z
         zd7ZkZWMh65Fv7buuBBT6eDtGoPFnn4X9b2PDjRl9KGL+fxS7bR4JC0hqrDTAZ9UxSZQ
         h+VMyTOpvxxuunQ3MxKz0R8nJKW0eZikwDFOCivS4l1b9AXKNP0h4p12e7d4XUjna7dz
         0UaP6kEsxVmYxWAWBU4zDUK8o0siPdOX0Tv6oSq0N34rRHsdACwrtwW+PYeq6ouRnsd3
         KR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yRnIoxhtmS04LUR5Fr2AhObq2Vi0UowFWVOhiKEXTVQ=;
        fh=DgFWXV7+bwEHhtQac3v+t7lKCOxrOaNHn5fV/CLMvGA=;
        b=zqKS7xjNul+kL6eGuizBDF8QWOrT7uMDgM+pnyeWbIfEdedO+eMmh+vKDNV4kdnCLT
         0JhLbJ08GO1yRuj7q6CPyovsIL23pk2lLpE7BbABXgB7TqPwO9GNfFwg3YCEaQ5pJHmh
         t6mwlGrlQ7h5TaoOPfh66lAOcbvwaF86nSXq+z63nAbodhCAiEnfwg+ilRVaooAPo8aA
         ANvJatjEl2aNB19S986sn5PyXKpCDsNgwXD0lbkRbBc+9eTRLBf0XEWKe9vQOqPE/Q2b
         2NUDCITDMo1dJc2bj4qgdQNx2h9UnswYRRWvdqrbfmMfLEwlmkCmizC0uRT6J5EcC0wn
         ckhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WaIEaqdo;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3f8ce297si166962346d6.96.2024.07.31.20.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 20:30:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WaIEaqdo;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722483042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yRnIoxhtmS04LUR5Fr2AhObq2Vi0UowFWVOhiKEXTVQ=;
	b=WaIEaqdoBQkmkIOU+6gcXYMWQtXstPhOEYf84nrAsiTsg27mzrxbt/bMTJVHmHXTcs9yr4
	NjVf91t2+gI7zQpgK515N1QRLqTksoddBhOdok/QedK1x64B+xnFg61fDc5BbQyLW0zJVL
	F37/EuokA4fmiCex0v9EaHIN1R8WiOM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-KzanqCPBPSqdQqHkN3JUUQ-1; Wed, 31 Jul 2024 23:30:41 -0400
X-MC-Unique: KzanqCPBPSqdQqHkN3JUUQ-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-664bc570740so28551687b3.0
        for <alex.bennee@linaro.org>; Wed, 31 Jul 2024 20:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722483038; x=1723087838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRnIoxhtmS04LUR5Fr2AhObq2Vi0UowFWVOhiKEXTVQ=;
        b=mz+C/P3aBruXKSBMRmfSXFENubEkwSaSD+OMZdM7w+0iaoQBhl9kFh89jkzG4hD8oH
         QVQyG2cilfBXexjVtY0kNQZKW5wQQ/ldy0Mfugzm/IHkTJExuFMHpwSTLqOBcwIODjZS
         DXBVARwRNw9MX9Lom4JpoCDKlpG+4dWCl6QOXKdImFUbhc+6f7F/m/9Z0TSfE1iZIqBd
         +fpqyF38sK3fA7oi8LI39/O0mWxS1KSgbAXCZZf4WD6C/MgAF/z464CHrDbkQWQNidZN
         /WyJhc+bINgWXeG287ZALD53s5JJuZhRv2TbWGVw10+XVZrzGyTe39MJ4KXNtSY0++k/
         AWRw==
X-Forwarded-Encrypted: i=1; AJvYcCU+NdtIwxiNnej+Vx394sbDSmulZ8cRiHTR9mGSmAyIKN2KkdaVIXrIL249LWXAzac0r4dUSBlTLhuXfTCDx7uK5A+vRJRR
X-Gm-Message-State: AOJu0YxaIjmlbMSueLPKcrT75C/X3kpMvztGStx9KnpgMlaDSoZVLIkF
	9PQ2YUTOrZy3dHGi0e94SiZ8TETdAq+IoqSrm2DHhMyZ0aPIKkZMBbtkuNBn9oQpx8DD32xudTy
	dLaxupxwIQ/O71RIXUlKXrCONAlnm8J5YM/xUuoCGW8KaYQgsYX+YO7/lIe6uarnGlD2wWxzYTU
	I6b7mJefWBgGDoENUcbQBxI60jedER
X-Received: by 2002:a0d:e944:0:b0:640:aec2:101c with SMTP id 00721157ae682-68741ef40fdmr8391967b3.2.1722483038629;
        Wed, 31 Jul 2024 20:30:38 -0700 (PDT)
X-Received: by 2002:a0d:e944:0:b0:640:aec2:101c with SMTP id
 00721157ae682-68741ef40fdmr8391817b3.2.1722483038348; Wed, 31 Jul 2024
 20:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231208190911.102879-1-crosa@redhat.com> <20231208190911.102879-7-crosa@redhat.com>
 <20efca0c-982c-4962-8e0c-ea4959557a5e@linaro.org>
In-Reply-To: <20efca0c-982c-4962-8e0c-ea4959557a5e@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Date: Wed, 31 Jul 2024 23:30:27 -0400
Message-ID: <CA+bd_6K5S9yrD6hsBsTmW4+eJpPsquE8Ud9eHZzptUwDrHcpeQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] tests/avocado/kvm_xen_guest.py: cope with asset RW requirements
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, kvm@vger.kernel.org, 
	qemu-arm@nongnu.org, Beraldo Leal <bleal@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Sriram Yagnaraman <sriram.yagnaraman@est.tech>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, David Woodhouse <dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Npf2im7RM+Cn

On Mon, Dec 11, 2023 at 11:32=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 8/12/23 20:09, Cleber Rosa wrote:
> > Some of these tests actually require the root filesystem image,
> > obtained through Avocado's asset feature and kept in a common cache
> > location, to be writable.
> >
> > This makes a distinction between the tests that actually have this
> > requirement and those who don't.  The goal is to be as safe as
> > possible, avoiding causing cache misses (because the assets get
> > modified and thus need to be dowloaded again) while avoid copying the
> > root filesystem backing file whenever possible.
>
> Having cache assets modified is a design issue. We should assume
> the cache directory as read-only.
>

I agree those files should not be modified, but I wonder if you
thought about any solution to this? Given that the same user writes
(downloads) those files, do you think setting file permissions between
the download and the use of the files should be done?

That can make the management of the cache (such as pruning it) either
require undoing the restriction or being done by a super user.

Anyway, just curious.

Regards,
- Cleber.
