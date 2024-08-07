Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp460750dlb;
        Wed, 7 Aug 2024 10:26:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1YaLDTqIwT8p4RJi/83/w4/FR9gmWMF4cjod888PWDhOVdgQJ05BMtl+AfRgAxVbQ5Au0zaX9qB4ZdEizM4e6er7IZk/I
X-Google-Smtp-Source: AGHT+IGSUOn1zzEdxSH60CsqSqlHzU5yICKm8UWpbb57zxly+NJkWKAF9IcOj+bQXhVO//GMGMGV
X-Received: by 2002:ac8:5d88:0:b0:44f:f693:5a44 with SMTP id d75a77b69052e-451892a3b91mr250610311cf.44.1723051618088;
        Wed, 07 Aug 2024 10:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723051618; cv=none;
        d=google.com; s=arc-20160816;
        b=UH0QZxAHoYr8JH4Jc/kt79TAwnO5jk8kfUG8amVV/VvTSuLKPewOnVSn+/l5CdXEVr
         0DzIsulTApnhtXykQrHJgAfi4yVsl+voOc7mCAG33+o6O2DY8WN3r/a4LkT0BruKKNtK
         Ud3nsWQLCuQuLJCjSAZdBZreXghBTLyPUcTIVEG7+tTN6cU/UpIVFXp3IIGH+Yny5Nuf
         wyQuAr3hzqNLiGs7c4TD9utk0zLwWF5HDM044yN7psaxG2vqKP1n2z11j9Gw+UT4m9xB
         MJL4G/pnAYApM4zBedyF2NemgxczGsCdnBvvDz52e1+QVxb7r2W+/ZowtapGDKVZwcBq
         dECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fHdSG8iEg4uS+0Sz/s3n8vWpM9yi4XCN7sVewjdqnp8=;
        fh=KCqozhMZHDZV6RUE5A6qks0bAAFST509VuzD8ADQ5GM=;
        b=wjW68devQGtGCm2v36vJ4hVYnky75KXYsNxbZp3qDWHSP4erc7dKKiwPCBlWzgM5SB
         PW6Pe1fnjqWPGykxqaKIjKqoFjLw7w+5YxKNhesjn1L6FWUhYeofggb5HCFjShjhPG+h
         mNPdoEIoaqtMYda9rYYRjwRZDaW9MqlE4iTbYiilvT8xpunCP7OUIoi6JDiJ3dKzsI45
         iVw8XxfTlOqMTu42sXGyEiF7Syw55rrniWLhKHEa5aQF9L+UPgqjSKPSZd2V3/UPoccj
         rKMS3yOG7GIXsxOeUEPu5vRYV785Kv2+uFIL3EqxQlmoRvmJHhrGQsXFn210aZlF55FN
         whog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XtArFQE2;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-451c8852962si19781171cf.725.2024.08.07.10.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 10:26:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XtArFQE2;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723051617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fHdSG8iEg4uS+0Sz/s3n8vWpM9yi4XCN7sVewjdqnp8=;
	b=XtArFQE2xh3G6CxexC0I/CMKtmow4wQ/pafsYs0iCx+1gmiIV0UK/OQsAUy1VS9+y3O8fQ
	u6etZ4g1hFIJY0PhhlYvzGaFZegPlXX58Y2jcYxCx2tSaDrTEUWTXrBivT9cpL64mL8x0r
	dT+2e4W8Jq8dIVe9BHknUuSU/S4HAtE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-CECWyyauN6OnHvQrpMyzAQ-1; Wed, 07 Aug 2024 13:26:55 -0400
X-MC-Unique: CECWyyauN6OnHvQrpMyzAQ-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-664b7a67ad4so1538457b3.2
        for <alex.bennee@linaro.org>; Wed, 07 Aug 2024 10:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723051615; x=1723656415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHdSG8iEg4uS+0Sz/s3n8vWpM9yi4XCN7sVewjdqnp8=;
        b=nzhBK2rxKKy96nRplr61Txlly5LavAaDw4IDt6Aqm5t1u08ZoqlMy8kuM5m+9Davc1
         vqTAfaaW7QSc/25gDZLHj0+p3vEMkZ2zqlX5BlSTSRUYivD0JwKS1a6nPeV6Gqk+0zaO
         ASDcDgFvZ9iim9KbZd+CsJULEJej92d1g62CcS46Ga98OagG9vHZWAubbsKMc7SmjFjT
         3aEzBOKbC0dcEMMnhrkPrpIai/gePuFdPrQG7XxET65e48anu/iZcTs4Wqa27GdW6KKV
         rmEkcsTx53ZkNeTmq58JoCJ1XhKx9EcFGjcXf1dFw8NwwcLF7B+Sftun8YUS1yv6NO5P
         kfIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0uY5QAjXzhpeBD4h+YKzUbU/d1Juvrze/TkKg2wZxIpUvLzcLpFbHgSkIqLaKRPnDMqnJbXvvxR8rugLe3ppfETT0KS9Z
X-Gm-Message-State: AOJu0Ywg7LBX58qUun4mGnBcIYkTYTlIJUOzPzhLvawXUBapreR9roJX
	xAZVIcGpStYjgtFRs5RvnAdAWFMXGeGxsYHuJTkmL2LXLukx77JoMyEmX+QwCY+6XRwVeTXAYoB
	ZtWQCsq0nT5HGtfSIQeyst3bSm6KolFjwpTx2w/JXRY0jW8RomGVneGH9BfoRbR46IxrP8HzdVH
	DD7vLZjo/+iFUtp+2aqxL55Er6WZ0W
X-Received: by 2002:a05:6902:1404:b0:e0b:6583:7900 with SMTP id 3f1490d57ef6-e0bde4caae9mr21061821276.44.1723051614773;
        Wed, 07 Aug 2024 10:26:54 -0700 (PDT)
X-Received: by 2002:a05:6902:1404:b0:e0b:6583:7900 with SMTP id
 3f1490d57ef6-e0bde4caae9mr21061793276.44.1723051614380; Wed, 07 Aug 2024
 10:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240806173119.582857-1-crosa@redhat.com> <20240806173119.582857-8-crosa@redhat.com>
 <540fafc7-9044-4e9a-b2c8-2f2f04412b88@linaro.org>
In-Reply-To: <540fafc7-9044-4e9a-b2c8-2f2f04412b88@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Date: Wed, 7 Aug 2024 13:26:41 -0400
Message-ID: <CA+bd_6Ls00k4Wb9cfHZ87oNxb=y2AaRv+ibpR-bY9XPVg3SBiw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] tests/avocado/tuxrun_baselines.py: use Avocado's
 zstd support
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Radoslaw Biernacki <rad@semihalf.com>, Troy Lee <leetroy@gmail.com>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>, Beraldo Leal <bleal@redhat.com>, kvm@vger.kernel.org, 
	Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Paul Durrant <paul@xen.org>, 
	Eric Auger <eric.auger@redhat.com>, David Woodhouse <dwmw2@infradead.org>, qemu-arm@nongnu.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Jamin Lin <jamin_lin@aspeedtech.com>, 
	Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: +HM+uj7eBENw

On Tue, Aug 6, 2024 at 2:20=E2=80=AFPM Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> On 6.08.2024 19:31, Cleber Rosa wrote:
> > +    @skipUnless(archive._probe_zstd_cmd(),
> > +                'Could not find "zstd", or it is not able to properly =
'
> > +                'decompress decompress the rootfs')
>
> One "decompress" would be enough.
>

True! Thanks for spotting that.

Regards,
- Cleber.
