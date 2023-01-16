Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1411272ejc;
        Mon, 16 Jan 2023 05:45:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXushDaYQRUbhNXqGgn56B4/q/34IO9JVi9Z7M+Xk0ouo0ramRURl54RdX1DcOOjUQLkPmeP
X-Received: by 2002:adf:ebc1:0:b0:2bd:d34e:534c with SMTP id v1-20020adfebc1000000b002bdd34e534cmr11112333wrn.36.1673876737315;
        Mon, 16 Jan 2023 05:45:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673876737; cv=none;
        d=google.com; s=arc-20160816;
        b=pCsXVieDE+/4nEs9YUjN8v64FNU9rLKMCZOEk0C/VNclhk3w9U+FW6WXadQ6ImFTAL
         m/zMONEMH7FAfTbEnCrXmJnORSgiY50+MvpdsoG8JiKgbjo+a2J5GSl7pyxQvxZCFk2u
         y85eWUz5PsnVS2OZRCYwHTGJPE8+hSPssDNkKck5ds7sH2pomCyTMu40ryvMriuxzb1v
         5WvJ0BapQU5ZY2oLZ+T35LFa0TqeJ5oQHM3QHBZHkW9Pea008P8YnzJuCoka1ZXUvAm2
         UfKXRnl2ZG2JBVeaqD2NeOMc/cD4n2AyuaU8w3FIF7vAZYTYhel9JK/3BHiw/TFVnCJM
         qXRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=9P9rok1+3VTsTeZXa2TO/Cf9rR6N2BtD12VhnVoV9Q4=;
        b=lbP70s/GiCkkATQeDo3Q4MSBkocTNTQ9vAJeawKfBvCSPMmbWe0rElDOkRQL8Hnxgw
         6lE8cWw0CB+xTMVAeH6lRkjpj+tzjkp/YPmZ8ZP3tgPEUl9g6hGWwu2aDLghyLLXR7Gg
         ZMm6R144XITcEsHFoZ8I6TIHXp057r0hl7/cLiAHLYy9Unzk1V7dEwB06zBZaPJY3YKY
         c8CuDHQHlQIKjGk7d9F509HYStoIgrPtncJ7NTxjjY6zuh6m5bDeQG5PjJ19FZO9tbw8
         LSAnsBthcn2hSt/973K6iRsjS2513PteBdWMwN2NY47Ylc66xzQF+FsFp7nxWHxzrJS5
         3/VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=j8LVhcag;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id h16-20020a5d6e10000000b0022cde86b8absi21987170wrz.707.2023.01.16.05.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 05:45:37 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=j8LVhcag;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9235367893;
	Mon, 16 Jan 2023 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673876736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9P9rok1+3VTsTeZXa2TO/Cf9rR6N2BtD12VhnVoV9Q4=;
	b=j8LVhcagNbaXTBbG+6rhippSfkO4zbVYn70WgRyt/d2OZt4/ASajwCYml+8WVo3weota8D
	Qrt5XNz67+mOhOV7FDfKwqm/3k2N4KO4sRvfJAN2E25Ou50iCs2ojlTHn4aFSqpnXTNjMm
	PIMoG/1n0fiYDc/VZ9xrkzMmv5+/8Z8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673876736;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9P9rok1+3VTsTeZXa2TO/Cf9rR6N2BtD12VhnVoV9Q4=;
	b=UZNsg76eDGDcnJvsTJDJOZKuV6AcqOO9gObIqiFr9dlSf2smAfbDG55oUYwwlniKq64et8
	26211GfZS29D8yDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13FB0138FA;
	Mon, 16 Jan 2023 13:45:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GMHcM/9UxWP7SAAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 16 Jan 2023 13:45:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
In-Reply-To: <bb5f5cd7-6d53-eb69-3e79-db95c9734f07@linaro.org>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
 <bb5f5cd7-6d53-eb69-3e79-db95c9734f07@linaro.org>
Date: Mon, 16 Jan 2023 10:45:33 -0300
Message-ID: <874jsqzj7m.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: JKwf9AYQE5gl

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/13/23 06:04, Fabiano Rosas wrote:
>> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
>> cortex-a57 as default cpu for KVM.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>
> Ideally there would not be a default at all, requiring the command-line option to be used.

We could probably do that now without impact to users, since KVM would
always require a -cpu option due to the current default being
cortex-a15.

>
> Second choice would be "host", since that's the only value that's actually usable (except 
> for the off-chance that you're actually running on an a57, which is less and less likely 
> as time moves on).
>

I'll have to go around fixing qtest first, either to add -cpu or to add
-accel kvm, otherwise we get:

The 'host' CPU type can only be used with KVM or HVF
