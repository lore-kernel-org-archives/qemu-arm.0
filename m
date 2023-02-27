Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4920600ejc;
        Mon, 27 Feb 2023 10:38:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+FCw/Om1/wWSDH+XMn9KYoHSGPETCRmLQvbnsJAJ2IwgTrWOQ2zC85s/xNKINQ3exWlzXl
X-Received: by 2002:a05:6214:2aa8:b0:56e:a6c6:445c with SMTP id js8-20020a0562142aa800b0056ea6c6445cmr674869qvb.43.1677523129092;
        Mon, 27 Feb 2023 10:38:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677523129; cv=none;
        d=google.com; s=arc-20160816;
        b=srNWC9mOPiRms0xm/U9A3RD+Sjc4NvG6ggQN0mPCYjS6yAQO6sp8+isiGNzUTcYGMR
         JymOmCVQWDpqaT7LDK2fZDm5elktt5FOftYr/f3gJzmFcOdKaaqdKRQJGjtlGGRuu6Eq
         ZGITv7tUy6d1LqHC5es3nk3BnA99PmjszkIdSPzD40+qsiY25Cs9nY9sKfx2HT2CrFBB
         LP01u9rxTjTTJZOehpq8fBayLtDyFMCCO0ulzKEDCtp5J7yMrOP8HmNmvhGoLfSbY03m
         1kCOg6lFhlgXHdkRuQ/OYH5ZyiFZP/ndlcLyQuWNHamYGaMcMYi3Skq4CspUYabRqcBv
         3Zvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=SWMomstYXFyZNSPGsc1edKoA4SVgbmaaZjlg916u2cs=;
        b=n+P4F9UJG4cKuibMdBxECUVPRugac0mHl3xRzh/uU3fT8MQUrZw3UBeXh8zXmqO4F4
         skFPppGnLdMgk9stK7WrDbeG2Yy0l3RfQD9/1JIDG+yBZZjTx3a+uQFc1hblG5T2+fms
         9Ufy1WwwVPqefHmZBonvo3qJ19/gLCNDUM5UXoHSUFxQ3QKwlmawi42fI5G2SAELymer
         FjVh9eUnNTEgtX6QtPH+xEHKHgExdjA1q4eQNzHIm0wEIrcr1SQjSFfZJlBoDOBbQL8+
         +onzvfTpl7+2MSj5vGs1AlWUcbcexWgouiYg3iHPXDrwTAyLeT6MEplxvSndLQEqjLOc
         xnxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XrN6BQFh;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id t18-20020a0cde12000000b00572008ee0a1si6649267qvk.558.2023.02.27.10.38.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 10:38:49 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XrN6BQFh;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677523128;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=SWMomstYXFyZNSPGsc1edKoA4SVgbmaaZjlg916u2cs=;
	b=XrN6BQFh5BuTy8DO4dCwSWuYL7/mCWC6gmEw7tpA9rLX5TqE2MrZSji/USw7iq/RTpA+yG
	hexdHKjQ0VC+PbhewM3H8Etf7vpeBRpYi15dabvRKRgXsj+YfOhbm57TMIVlLOhWEImhJc
	qx6sAvQXLX1+KFUy/lqFo0Tz30pucvE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-ZBZqiBNHN0mYplCPChLFgg-1; Mon, 27 Feb 2023 13:38:45 -0500
X-MC-Unique: ZBZqiBNHN0mYplCPChLFgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF4533823A02;
	Mon, 27 Feb 2023 18:38:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 464B5C15BAD;
	Mon, 27 Feb 2023 18:38:42 +0000 (UTC)
Date: Mon, 27 Feb 2023 18:38:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Message-ID: <Y/z4rwv09Ckhbtfp@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230227111050.54083-1-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: ZFP4QNjIv7Aj

On Mon, Feb 27, 2023 at 12:10:48PM +0100, Thomas Huth wrote:
> We're struggling quite badly with our CI minutes on the shared
> gitlab runners, so we urgently need to think of ways to cut down
> our supported build and target environments. qemu-system-i386 and
> qemu-system-arm are not really required anymore, since nobody uses
> KVM on the corresponding systems for production anymore, and the
> -x86_64 and -arch64 variants are a proper superset of those binaries.
> So it's time to deprecate them and the corresponding 32-bit host
> environments now.
> 
> This is a follow-up patch series from the previous discussion here:
> 
>  https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
> 
> where people still mentioned that there is still interest in certain
> support for 32-bit host hardware. But as far as I could see, there is
> no real need for 32-bit host support for system emulation on x86 and
> arm anymore, so it should be fine if we drop these host environments
> now (these are also the two architectures that contribute the most to
> the long test times in our CI, so we would benefit a lot by dropping
> those).

Your description here is a little ambiguous about what's being
proposed. When you say dropping 32-bit host support do you mean
just for the system emulator binaries, or for QEMU entirely ?

And when the deprecation period is passed, are you proposing
to actively prevent 32-bit builds, or merely stopping CI testing
and leave 32-bit builds still working if people want them ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
