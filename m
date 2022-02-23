Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp50741lfq;
        Wed, 23 Feb 2022 03:11:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFSCZEwKdeOUeTYFqi3B3nt3Ap6wskUm25zeYdHEvUTR6Wl/Br9Vy2eEkhkY44n2sdDilw
X-Received: by 2002:a05:622a:1192:b0:2d1:e58e:7659 with SMTP id m18-20020a05622a119200b002d1e58e7659mr27019630qtk.41.1645614718252;
        Wed, 23 Feb 2022 03:11:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645614718; cv=none;
        d=google.com; s=arc-20160816;
        b=TCf/nOsLD69kytxfjCR30X/diD0JrJ3es5XFtdXDYG90R9fMb27dXPI2XkOic/879L
         XAXPZzBUgeAvirm2JZn+fVnhl0AC8oerDFrsM2tvOTcXJkbaOzU95Kzk1eXtUtAGk86Y
         NE+mB++fzOAdcWfWmjfDjfRCPFK/7DnLNPzyL9rbe1SiRH5GAcqd8/cC/sJkAk3MFRwL
         A9g9Rore4Bb/A37yc/gRYnL+K9ROLswAKoMuZgu1n1TS89NbTNs0hdlThMp5gg6HmpNK
         pDcIB6y7Y5cQwk4XIZAkSn3ZiLoktRC1aK6+DfpknGBddqzVqjRLfvcSY1eAdqLx897P
         Pj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=JK7oyIv3Qbbhv1nup1LAU0/7Ssy0jSC7ErjVBhLSzIA=;
        b=IwOrGQqH3+uJ1wOVuwgEjjANDk06DDn46GB+WjBldZhp7qjK9OHZNODCYZuH2GPDYF
         aVXNkDMCj/9fS7HVbciN+YixmBRSsOjmoNTXRQ6oEIQFeEgu6omAg+1zqBI60vnOzWVR
         sq3XoA6qLrSo3PmcTnbTU7+73pBhkNncii4ZaheaWsTJGtjoq208ikAHJRSrUkTQIuah
         jwRTZmTDF7DgTy3reymdaWABdUtbEgqcIaRIo1Cp7II7dtbzGykGpxbjWK1GsArv9oqv
         ReAk7049sI0Kop8GUZVbsy93++4PPxkrYrnZUjmQoLhyCML+fjhILtlu3CAdq+Cjo71N
         6yag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eMCAkH6l;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d12si1302515qty.572.2022.02.23.03.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Feb 2022 03:11:58 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eMCAkH6l;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645614717;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JK7oyIv3Qbbhv1nup1LAU0/7Ssy0jSC7ErjVBhLSzIA=;
	b=eMCAkH6lLkyUmNt98y9pf9gmBQk2JAmgwzlUesWbWwl89y+PB8ZfhYvZbn1agedIuY+v/f
	oFKlBri1RY/972y9VwFSnuswfynZbbDybewNf5OZC9p0EXSzpMJODT7cYy61g9HNinz4lu
	dYTm28qv2WMA6CHQrYq0CQDoEbNjQac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-MXLUO9GiOgivybumxPGasA-1; Wed, 23 Feb 2022 06:11:54 -0500
X-MC-Unique: MXLUO9GiOgivybumxPGasA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07B0F801AAD;
	Wed, 23 Feb 2022 11:11:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53A187B5F3;
	Wed, 23 Feb 2022 11:11:34 +0000 (UTC)
Date: Wed, 23 Feb 2022 11:11:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>, Cleber Rosa <cleber@redhat.com>,
	Oleg Vasilev <me@svin.in>,
	Richard Henderson <richard.henderson@linaro.org>,
	Emilio Cota <cota@braap.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Idan Horowitz <idan.horowitz@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <drjones@redhat.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Message-ID: <YhYWY0Ea5KwlCj/O@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <874k4xbqvp.fsf@linaro.org>
 <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
 <afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
MIME-Version: 1.0
In-Reply-To: <afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: DZ3Qd5Js04pp

On Wed, Feb 23, 2022 at 11:53:28AM +0100, Philippe Mathieu-Daudé wrote:
> On 23/2/22 10:19, Peter Maydell wrote:
> > On Tue, 22 Feb 2022 at 17:33, Philippe Mathieu-Daudé
> > <philippe.mathieu.daude@gmail.com> wrote:
> > > We need the DEBUG profile to ensure the bios-tables-tests work.
> > > 
> > > If you want to boot a guest using EDK2, you should use the images
> > > build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
> > > not these images.
> > 
> > Do we have any other images in pc-bios that are silently
> > "do not use these images, they are only for a very specific
> > test case and nothing else" ?
> 
> I might try to move that to test/. Gerd, are you OK with that?
> 
> > Also, "make install" installs these EDK2 images, which doesn't
> > seem like the right thing for "this is only for one test case".
> 
> Well I'd prefer we never had them installed. Today I don't remember
> why it ended that way. Gerd, similarly, are you OK with not installing
> these images (after a 2 release deprecation warning)?

If we didn't install them, wouldn't that mean people using QEMU upstream
would not have all the pieces needed to use AAch64 virt, without now
building EDK2 themselves. That feels wrong/bad to me, given we ship
firmware needed to use everything else.

I don't disagree with recommendation that most people are better off
using distro built QEMU + EDK, but if someone chooses to use a upstream
QEMU I feel it ought to come with firmware needed to make it work with
all targets we support.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
