Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2449240ejs;
        Fri, 12 Jan 2024 07:44:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgpgH1MpvXZsTZnwNBSknVz0buUFxqqI3lqofTHlK8/YGv/iyhQX9klVtAioZz3US1wUJa
X-Received: by 2002:a05:6902:1b08:b0:dbd:753:af3d with SMTP id eh8-20020a0569021b0800b00dbd0753af3dmr924245ybb.75.1705074295014;
        Fri, 12 Jan 2024 07:44:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705074295; cv=none;
        d=google.com; s=arc-20160816;
        b=pVITt3DXqR++n2C2pPvJEUzwegSS1NwJrLk6YoA95f1MgB14DIh8wKAmIgJd+FHL2N
         ShLpVcJo5kabaBMKlFqiyX98TK5OUrttjWlzRnz4SQtNeIFBKUmJ7zlU1N4WzIh10Y/H
         thq3PbbBtqW9sbgIoUTf/jf0IpcxLM6vY0QXRispo8kKW4mPTzzvVHZzcvE4LQGBwQXa
         PwJ573S5aCL6I7Y++I81dMlOGgrvv//wxY6qUse14J2I9KPkXE6Y/wqDEOuX1C8TXqVo
         zlSn6b6kyvMI7lYtUdmaDDPxEeUCUXBmUSIQT67fnmnW7bns2enZm2NRii3hf0x1j4Kz
         qNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=hfrdnEtpGn94s5HzyRrjF4o/Q8dg/DO4WQ288cW8ZFY=;
        fh=m3bHuMhYjQ2YvYwoscJTXWr8s26fyrFRD7neFrPr5W8=;
        b=DhvLqteTrzxOzzhlsso4capvwLATvYhqb83XK7slltcT9dpJnSL4wyjsf+whK+eYLB
         o61Zen5H/y/Ds/4aTbJ+OQJ6M5wkcM9j1shKhSLxFtqRPmMxZIV3aHinqIb8BVT++VL5
         bIkwIKYaucjIkNwyC4gTV2NgM7q5tYdxBaJnU2yZbbnEVyZ8/FpHxABJ4g0elnYglqlg
         RY20A8h91Iw7pVqzaIH8NJ+bDSA8cTdcsazgwOaHcmVrE72oJ2QT8+WMfYx/kez9SA0M
         W+YwE1Q9XMSxp5iU8l5lUvDJnaTROkSf+GYzThw1zUkfJKbMa6naOQYxNfq2fY8mRDGa
         KEMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IIS0v6rx;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id x130-20020a25e088000000b00dbcdff18420si1118956ybg.149.2024.01.12.07.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 07:44:54 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IIS0v6rx;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705074294;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hfrdnEtpGn94s5HzyRrjF4o/Q8dg/DO4WQ288cW8ZFY=;
	b=IIS0v6rxG8BF4yx+wUvflCmoTmm5PfIVql+BgJmIggbd5XUgZwfuzm3ekEFsAX5X66zopR
	E3jhfiBC9K2WI43eVIAeGoF6VEg25xMGup3qsgPrFyeKhIbjsdBar/KgZydHWj78THxjmd
	/0M5K4KNMkWoHESJqV6UqUrbDBYiDtU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-315-qHMIU1caNEeRbQSiFqv-Ag-1; Fri,
 12 Jan 2024 10:44:52 -0500
X-MC-Unique: qHMIU1caNEeRbQSiFqv-Ag-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05F6E3C29A67;
	Fri, 12 Jan 2024 15:44:48 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.182])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 246D2492BC6;
	Fri, 12 Jan 2024 15:44:40 +0000 (UTC)
Date: Fri, 12 Jan 2024 15:44:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Yanan Wang <wangyanan55@huawei.com>,
	Bin Meng <bin.meng@windriver.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>, Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 12/43] qtest: bump boot-serial-test timeout to 3
 minutes
Message-ID: <ZaFeZXP-3sYdnZbS@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-13-alex.bennee@linaro.org>
 <cf617223-0a0b-4d42-84a3-cd323ea4c421@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf617223-0a0b-4d42-84a3-cd323ea4c421@redhat.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-TUID: zkVDopf9+WX7

On Fri, Jan 12, 2024 at 04:13:16PM +0100, Thomas Huth wrote:
> On 03/01/2024 18.33, Alex Bennée wrote:
> > From: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > The boot-serial-test takes about 1 + 1/2 minutes in a --enable-debug
> > build. Bumping to 3 minutes will give more headroom.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Message-ID: <20230717182859.707658-9-berrange@redhat.com>
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > Message-Id: <20231215070357.10888-9-thuth@redhat.com>
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > ---
> >   tests/qtest/meson.build | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index c7944e8dbe9..dc1e6da5c7b 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -6,6 +6,7 @@ slow_qtests = {
> >     'test-hmp' : 240,
> >     'pxe-test': 600,
> >     'prom-env-test': 360,
> > +  'boot-serial-test': 180,
> >   }
> >   qtests_generic = [
> 
> 3 minutes was obviously not enough:
> 
>  https://gitlab.com/qemu-project/qemu/-/jobs/5918818492#L4984
> 
> And in older runs, we can see that the boot-serial-test might take longer
> than 180s when run with TCI :
> 
>  https://gitlab.com/qemu-project/qemu/-/jobs/5890481086#L4772
> 
> So I think we should bump the timeout to 240s here. Alex, are you going to
> respin your pull request? If so, could you modify your patch? Otherwise I
> can also send a new version of this patch here, just let me know.

Agreed, 240s seems a good next attempt

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
