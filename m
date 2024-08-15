Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp889191njf;
        Thu, 15 Aug 2024 08:06:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdCmA0HU66KUYroSGuwBh97jTMbb5Poo/YuyoUyLiov7YxyDjl4jownp+pAeStCkLjDLvNLa6VGRI63enEmmAm70JnysUC
X-Google-Smtp-Source: AGHT+IEyesrU5oLK+BViMVELCFIlcHa92VUhcp5dsOOT+bXehgDcZjqtAupnQQEoemjhlsoBUoOV
X-Received: by 2002:a05:622a:418c:b0:451:b7b6:3573 with SMTP id d75a77b69052e-4535bbaccb7mr81400021cf.50.1723734403424;
        Thu, 15 Aug 2024 08:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723734403; cv=none;
        d=google.com; s=arc-20160816;
        b=YBOyXr8mAVh5wjRXpUK37IasSimt+XUaU9Rxp7HzNQyeH/bdEQntCycdC/p0TXVhig
         vPvfTboCC6viMKVu6MMIyyylL/3KCnZSXpy9kKg042+Ap2m74O0/Sr5uA+e7h13MLKfo
         VCPLz4+0M9PnpsS2ZoemunEW0sYEuDvmg2kfK/Ok9uPmddpmZwIdAvNjk9tU43f1eCMG
         3IYACqrX90/rpn3Ax7sWFJwRw9rTCpgRIrIbW9om8kxh4H9YShGIgOiK7GZo1zbOFt2M
         xE8WAyp7F7CjiwS5g3RYrN8AlZxT0dzG2f1yxtkIlrSjYFfbB06ePx+s059/XG+LzTLC
         ayzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=jqHpAnMw0F+Vhqu50n7PycRT6hCvYh6HVrX37OXsHUc=;
        fh=MlE3tNe6Ef904LazAnUbK4NLRjGFWP6P1cjAv+Ol67Q=;
        b=t1XgHg7H/thqaWgl5wtuxndRzHpSUaL1YBX4TM88UsJdK4jp/nWFU726plQeZYXqX2
         40HTVoMCVlNhKTup4cHHwJ+w6PT8nObdCe9+36J9R8xN1zBW7jGxSEqRjsAICUr441h1
         qx9c4I4H98rCJ5G5oF+OdY4O9V3dgSM7Jjfawc806WFlTcUrbIxzgedoK21n66WR59/R
         8b4GOQdIy+n27staDFCB82v1LqxDB8VL/v+vkJkWGz1vqNpKJYDt3V9JW2yHh9AeEZkO
         +2Vok20wThGajI0tsh685boxqBEbIL7Aaw6KIEr9HjnH+T6rEdhq+hc45ksC22bGsNDE
         GDkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=boJyXsuL;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4536a08fb19si18464931cf.453.2024.08.15.08.06.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 08:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=boJyXsuL;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723734402;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jqHpAnMw0F+Vhqu50n7PycRT6hCvYh6HVrX37OXsHUc=;
	b=boJyXsuLydaQLqKok/cGb6f1qrtbALobjOZFTPuloBtAp4cm/wfabU0CJMTLAmVFR+jHBD
	UMlY3xuAl1naPJDvikbeFhTD1oR40wXe45+CTU6S1khKOZYZN9MbN7BTLTGQIAowrpuVAY
	XhP0zaymPmzH1NieL+rOPew4L3wPnmg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-260-9Y3gDyCrMCe6y9L-jMAKbg-1; Thu,
 15 Aug 2024 11:06:38 -0400
X-MC-Unique: 9Y3gDyCrMCe6y9L-jMAKbg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E180C18EA8AF;
	Thu, 15 Aug 2024 15:06:31 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.137])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97EE1300070A;
	Thu, 15 Aug 2024 15:06:23 +0000 (UTC)
Date: Thu, 15 Aug 2024 16:06:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	ARM TCG CPUs <qemu-arm@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Junjie Mao <junjie.mao@intel.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>, rowan.hart@intel.com,
	Mads Ynddal <mads@ynddal.dk>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v7 6/7] rust: add crate to expose bindings and interfaces
Message-ID: <Zr4ZbOHR9Sc10YSX@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
 <20240815-rust-pl011-v7-6-975135e98831@linaro.org>
 <9f6c96fd-bb0c-4014-bba1-70986f4bb384@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f6c96fd-bb0c-4014-bba1-70986f4bb384@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: goA4h/cy/EkP

On Thu, Aug 15, 2024 at 04:01:17PM +0200, Philippe Mathieu-Daudé wrote:
> Hi Manos,
> 
> On 15/8/24 13:42, Manos Pitsidianakis wrote:
> > Add rust/qemu-api, which exposes rust-bindgen generated FFI bindings and
> > provides some declaration macros for symbols visible to the rest of
> > QEMU.
> > 
> > Co-authored-by: Junjie Mao <junjie.mao@intel.com>
> > Co-authored-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Junjie Mao <junjie.mao@intel.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > ---
> >   MAINTAINERS                       |   6 ++
> >   rust/meson.build                  |   9 +++
> >   rust/qemu-api/.gitignore          |   2 +
> >   rust/qemu-api/Cargo.lock          |   7 +++
> >   rust/qemu-api/Cargo.toml          |  23 +++++++
> >   rust/qemu-api/README.md           |  17 +++++
> >   rust/qemu-api/build.rs            |  13 ++++
> >   rust/qemu-api/meson.build         |  17 +++++
> >   rust/qemu-api/rustfmt.toml        |   1 +
> >   rust/qemu-api/src/bindings.rs     |   7 +++
> >   rust/qemu-api/src/definitions.rs  | 108 ++++++++++++++++++++++++++++++++
> >   rust/qemu-api/src/device_class.rs | 128 ++++++++++++++++++++++++++++++++++++++
> >   rust/qemu-api/src/lib.rs          | 100 +++++++++++++++++++++++++++++
> >   rust/qemu-api/src/tests.rs        |  48 ++++++++++++++
> >   rust/rustfmt.toml                 |   7 +++
> >   15 files changed, 493 insertions(+)

> > diff --git a/rust/qemu-api/Cargo.toml b/rust/qemu-api/Cargo.toml
> > new file mode 100644
> > index 0000000000..51260cbe42
> > --- /dev/null
> > +++ b/rust/qemu-api/Cargo.toml
> > @@ -0,0 +1,23 @@
> > +[package]
> > +name = "qemu_api"
> > +version = "0.1.0"
> > +edition = "2021"
> 
> > +license = "GPL-2.0 OR GPL-3.0-or-later"
> 
> in particular explaining the license choice.

Semantically this is an overly verbose way of saying
"GPL-2.0-or-later", so just simplify this.

> Should all rust code use it?

GPL-2.0-or-later is what we expect all new QEMU contributions to be
licensed as, regardless of language[1], so this looks desirable.

With regards,
Daniel

[1] unless they're derived from one of the few pieces of code under
    different terms
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
