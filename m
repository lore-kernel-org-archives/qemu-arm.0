Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5645120ejc;
        Tue, 28 Feb 2023 03:24:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9+M8RbyEPkPCcQjyLOU/Qfo8edJ0v/2rIkNA3IqQ0TAgxBGpAZXc847hZbjH+00pUebAn4
X-Received: by 2002:ac8:5ccc:0:b0:3b0:98c3:217c with SMTP id s12-20020ac85ccc000000b003b098c3217cmr4091273qta.6.1677583450408;
        Tue, 28 Feb 2023 03:24:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677583450; cv=none;
        d=google.com; s=arc-20160816;
        b=Jw2nbLYLyUCbVzBTh6jr97KToOSONDucnPa/tfDgtQIOspivGKSDOyiYMHfCk8KBKO
         jNo3Z92jjzIKBuF+xXgME0MVBGyJRvIczWLik0ZIYMrjFTCP9sG1jhXc5A4dfNGA8oN2
         n87HZfuIK0OkLDIfsX51+X0cUNouFK5GTEQm6SOhXf3h3+f2etGBlHHgxMp9Ocf+3EVB
         Kurj0qq1oOS89EwUSyK1rlJZjEbfFzyGTraaWcEH9gzWPhVt4oVTsfNbMR0sRoomLtPx
         Hm6nheRIgfHjKRARmG5oh8wLi8cJ0sFynuivwLEO5wChKgQVA7/dbBndpF7Y2YseA0M+
         ZMag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=cPt18yMFBhgEWcyFKRvmzxmC7YZWJirJ75g/XkJWVsg=;
        b=FBJCkysERLnek433t22cagH/89gHRoiQvxXV/+FRrxUy16SuM9b0/HSPfY+VOWTvSd
         dLytoALqXHgVjAtXhjECKpbCxevOmyX7iW4mLm5WQhH5oI5SsE9XyAwPB3tMl6pgW/bg
         WFot3l0LOBYAjba2ooGRbxhxSjD9FSiWbANQs6e/IfLHLtekQ70fTieP7ywae7Z7Qepy
         2jIN+YbXvlpB74n1itZK2GNOduEG07zg3wPZiKMODRcF8LvJn+sCVTIiUPBxHeG9bl3W
         1ZYSd3F0I1sHYh1BeEQ+qdlV/CBOzEmbiBLrB3/D68JIZ7M06pUOgffkOXa+10UfKAeL
         9jDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BkQXwGdz;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t25-20020a05622a181900b003ba10333aa9si8896940qtc.522.2023.02.28.03.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:24:10 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BkQXwGdz;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677583450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cPt18yMFBhgEWcyFKRvmzxmC7YZWJirJ75g/XkJWVsg=;
	b=BkQXwGdzbZF7Ur7AANLRRr+QWwW1OHQR2nW1Vgk5a5JIUSdMPgeTNzG98NUtP3k+HbOFfI
	67jhmhwcRZDZtZufzs3aObGCWX8JoAjIyr/DdZcws63PGVodZTwHknpK44Uem3kj8h6EXR
	t6/k75E1XuB19tI0E47Ql/07i49uWz0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-tjH4Ij4QN4yzBsDdN32l0w-1; Tue, 28 Feb 2023 06:24:08 -0500
X-MC-Unique: tjH4Ij4QN4yzBsDdN32l0w-1
Received: by mail-wr1-f70.google.com with SMTP id l14-20020a5d526e000000b002cd851d79b2so318930wrc.5
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 03:24:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677583447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPt18yMFBhgEWcyFKRvmzxmC7YZWJirJ75g/XkJWVsg=;
        b=UaHnFMQFl4LXrAF+XvoJxhNEjUcs1w+p7p+PFu6mRlri4bzNCoaQnEx462FYmQG7FZ
         cTvAt2ZjkV2MiPTHgAHJcS5vtW6Yk7ko8l5c8tfBn8+zxo8VdvBheuRW3oRSScQziJzD
         PTCkRbGtjYKlADgxwp0fOPPy0N7NbVEhdMizYnQSdz0eVX2H471kVwWoCtaD2c4Df2fm
         5aGXUyWy4CysWaAbgLN23fGBzv+icwSiWrarjFTEIzXiTqYoZ4tsa6IVydMBKqs2cV/0
         jbIUQHDgjlQWmihDp80GVZpKerEh+4D3h89HMVoIdjjrEzegv4RJLKSTjJ6ThDdRUOAc
         g8WQ==
X-Gm-Message-State: AO0yUKVhQNYmtKBnfCuMh0uqFOjY1w+Xw1y7rr3le8d4B/U+sPOZBb/8
	ShCZz23GEeLXUXneSjtgWaB0smIIKyPLKPSa3YgjGAYp/Gsa4AGRXkWw12oEIsJsCyRBZq3hwxF
	bbjcjn1FKAr/Ozlzh
X-Received: by 2002:a05:600c:4507:b0:3eb:2b88:a69a with SMTP id t7-20020a05600c450700b003eb2b88a69amr1863544wmo.14.1677583447611;
        Tue, 28 Feb 2023 03:24:07 -0800 (PST)
X-Received: by 2002:a05:600c:4507:b0:3eb:2b88:a69a with SMTP id t7-20020a05600c450700b003eb2b88a69amr1863526wmo.14.1677583447355;
        Tue, 28 Feb 2023 03:24:07 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.141.194])
        by smtp.gmail.com with ESMTPSA id i13-20020a1c540d000000b003db06224953sm12401771wmb.41.2023.02.28.03.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 03:24:06 -0800 (PST)
Date: Tue, 28 Feb 2023 06:24:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228061853-mutt-send-email-mst@kernel.org>
References: <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
 <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org>
 <20230228055016-mutt-send-email-mst@kernel.org>
 <072a7502-6061-12b2-f778-736c6a8f5912@redhat.com>
MIME-Version: 1.0
In-Reply-To: <072a7502-6061-12b2-f778-736c6a8f5912@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: eWbszwC/ZJme

On Tue, Feb 28, 2023 at 12:12:22PM +0100, Thomas Huth wrote:
> On 28/02/2023 11.51, Michael S. Tsirkin wrote:
> > On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
> > > The question to answer: Is 32 bit x86 worth its upkeep?  Two
> > > sub-questions: 1. Is it worth the human attention?  2. Is it worth
> > > (scarce!) CI minutes?
> > 
> > 3. Is it worth arguing about?
> 
> You are aware of the problems we're currently struggeling with, aren't you?
> Darn, we're having *SEVERE* problems with the CI, the QEMU project ran out
> of CI minutes for the second time this year, and you ask whether it's worth
> arguing about??? You're not serious with this question, are you?
> 
>  Thomas

Yah just couldn't resist. How many minutes do we use per month btw?

-- 
MST
