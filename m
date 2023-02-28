Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5532842ejc;
        Tue, 28 Feb 2023 01:01:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+T5oXGuVg6FibAZIDQHrhq2Fh2eJRDKw7hv0EW4d94KN10k+gjp1CUI2rF7B5pG7ol4oGL
X-Received: by 2002:a05:6214:5003:b0:56e:a96a:2be1 with SMTP id jo3-20020a056214500300b0056ea96a2be1mr3521886qvb.48.1677574914150;
        Tue, 28 Feb 2023 01:01:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677574914; cv=none;
        d=google.com; s=arc-20160816;
        b=P4tRPZEa3DymSEhj6f2mC7OOCUyi6iB+iklG1iC26BsoizUQzlJMc5qtCLG4Lbz/cc
         a3WCuFG6i1oyDMfyK3ddlQmlGtBVEglSmDhjhNg3Mx4Ik9YMSO6XEzmKd3thldgUA4Nr
         46OgH5rzZRLVNcVujh4fwRco+2FZMWKNwputyT8zdQutyigoEqxVSOr/QAC48hjfo7ds
         v/oQ2dCzyQzuPjYheLDiRxBxxSxXo0UGfjoH0FDUoolSa9/ZHtnVvX5MhO1e9HQKZbsb
         cV7xUsPV2ebok4c1fQiUPUP3PltalzyBiyKtEB+7OJRc2Eq2kFtNsLuSsmxZKpHeiQbx
         BSGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=l6vrEM3/+CLVFY3tVeIf9d5TLFCA708VKaeYPHG45Hc=;
        b=rCVLIwn/7VRnNYKE4ENlV1VFlg7auNkHBTdnuB4cpsWDC5hdSWX78Z/CJ5Vaic1egu
         3I56zK7nD5sxDHmiEmz/JnyKTpzMfpMLa2AzcA3wubciaUhriaRmtVeRaSNe139gxilZ
         39FfM57MjPdvdeflPcLWsKjSgxDD6pCPM2z19SVPKFZgScRClnRGwTtHERC1AeCTALxi
         /tU26u1sW2Iz3iqKWef1RxDIMFKk7jFzSFaMifdLFeYawGxL0ZIWM05ybbHwmMRtcKTF
         Y0Mf2lTKf+HWW0ae8nCmu67o8G7LhiVHC2FrUmQiNhlrDFUHqHjp16JIO2B0nbbIJH4h
         /fTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U7bo7JRl;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id i5-20020a0cf385000000b0056eb40a88fdsi8293421qvk.484.2023.02.28.01.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 01:01:54 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U7bo7JRl;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677574913;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l6vrEM3/+CLVFY3tVeIf9d5TLFCA708VKaeYPHG45Hc=;
	b=U7bo7JRlbvQIC0pY2gS385o9qF20ENE5EzwIVGodljCWs6eRn8NVo75Sb9CVyojA3VeMx0
	LhdUPJnza1LY9QP85EOPJpLN7KQ6O4FBXpiek1u/DkCwiGVIolt/5itpAhgcDEPej/3OU9
	LM+CgaXGiOH5itZKB5NYIcF23jlfERU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-g2TUK-noP6SPVJBc0lV8-g-1; Tue, 28 Feb 2023 04:01:52 -0500
X-MC-Unique: g2TUK-noP6SPVJBc0lV8-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5BD4877CA3;
	Tue, 28 Feb 2023 09:01:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D219E2026D4B;
	Tue, 28 Feb 2023 09:01:48 +0000 (UTC)
Date: Tue, 28 Feb 2023 09:01:46 +0000
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
Message-ID: <Y/3C+jC3Lk5MJxfu@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-TUID: /ZpKx4Ifh1GT

On Tue, Feb 28, 2023 at 08:39:49AM +0100, Thomas Huth wrote:
> On 27/02/2023 19.38, Daniel P. Berrangé wrote:
> > On Mon, Feb 27, 2023 at 12:10:48PM +0100, Thomas Huth wrote:
> > > We're struggling quite badly with our CI minutes on the shared
> > > gitlab runners, so we urgently need to think of ways to cut down
> > > our supported build and target environments. qemu-system-i386 and
> > > qemu-system-arm are not really required anymore, since nobody uses
> > > KVM on the corresponding systems for production anymore, and the
> > > -x86_64 and -arch64 variants are a proper superset of those binaries.
> > > So it's time to deprecate them and the corresponding 32-bit host
> > > environments now.
> > > 
> > > This is a follow-up patch series from the previous discussion here:
> > > 
> > >   https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
> > > 
> > > where people still mentioned that there is still interest in certain
> > > support for 32-bit host hardware. But as far as I could see, there is
> > > no real need for 32-bit host support for system emulation on x86 and
> > > arm anymore, so it should be fine if we drop these host environments
> > > now (these are also the two architectures that contribute the most to
> > > the long test times in our CI, so we would benefit a lot by dropping
> > > those).
> > 
> > Your description here is a little ambiguous about what's being
> > proposed. When you say dropping 32-bit host support do you mean
> > just for the system emulator binaries, or for QEMU entirely ?
> 
> Just for system emulation. Some people said that user emulation still might
> be useful for some 32-bit environments.
> 
> > And when the deprecation period is passed, are you proposing
> > to actively prevent 32-bit builds, or merely stopping CI testing
> > and leave 32-bit builds still working if people want them ?
> 
> CI is the main pain point, so that's the most important thing. So whether we
> throw a warning or a hard error while configuring the build, I don't care
> too much.

If we're merely wanting to drop CI support, we can do that any time and
deprecation is not required/expected.  We should only be using deprecation
where we're explicitly intending that the code will cease to work.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
