Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6895890ejc;
        Wed, 1 Mar 2023 04:25:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8RLc07XU2VvoB+nELWB9tH2VTJ8/Jy5xBHKs5aGcDZo8jmJOqn22tgNlSCkToNmgbPTa95
X-Received: by 2002:a5d:5967:0:b0:2c7:17db:bf5c with SMTP id e39-20020a5d5967000000b002c717dbbf5cmr4601275wri.25.1677673545139;
        Wed, 01 Mar 2023 04:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677673545; cv=none;
        d=google.com; s=arc-20160816;
        b=gwphsNZ3gJ8ejNbk0ug4gCWbzYRQ2AFx0bKu+qibQv+GyWtSuTTMrvkQZM0ZOez5GV
         Vl0mdDGx9QxtBTaC0oloZMBtx5+ObEpyjTxlmrHOYcyCB5DHWFPCJbHDJ4LZ6h+zdpew
         5DwXUKkaTS8zeZlZJ/BiE3H1O/JbXsVAcNnwiKBWYha3wfyrSq4/CkOrB63E5cPgMN+M
         gQQETArSOOxuWWBzI2gijxBP1g/fqamnM6lmcFW95nmvVBu2LBCzATYkhqFQvVMHPAq2
         8Rr1KbghE9irLWTrB3dCovsVbE1QB/2B/LIX6Ol0KzDEWK98+ZtzVIeWV3xF6CAsOYCM
         BOYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=05sZX5wgopLhI3s9SVqG68OzYkoj/pSPtQam+WCWZcM=;
        b=JgheTFtvpfvcRrvfHWDBzHphLWEkZp1L3SUKjUdo6fz2MJTIzXwszfG26TtGQkC1a/
         EuQACw8SvQGqa673CrdPTJx14JVRvfcUbfGFX5jIMg8cP999JDzioq/yX+T4MX0WmKy6
         eMM2lRFs8l0in/48+v9Ml9a9j/uhAPVs4UEpT9Le3Xc/mcSlPSHOO684I5GpkLmiz3W2
         nc8AmhwzoRafojpyimultPaDTXTgoC+J86mc28roH28sJnA6tSvavLvTjX7/WoVtR3g1
         QULdFE+wi4fAAakKbPczs2VPGFp09g1ZyWZdyjd5MpTu7wv+mjF/q5lgTxyzwBdhahQP
         Ie2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=VuHcHC0k;
       dkim=neutral (no key) header.i=@suse.de header.b=hHrpp290;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id m9-20020a5d4a09000000b002c703f794c0si10206260wrq.551.2023.03.01.04.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 04:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=VuHcHC0k;
       dkim=neutral (no key) header.i=@suse.de header.b=hHrpp290;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7217D21A85;
	Wed,  1 Mar 2023 12:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677673544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=05sZX5wgopLhI3s9SVqG68OzYkoj/pSPtQam+WCWZcM=;
	b=VuHcHC0kbrr1bCGnDXyfK+/EkDyDzMks8ikttqIKAlMBkeQg+z4UoZIQiedfBbF06JujdI
	ErYXAXBBjxlMLx7g0dwFaYRVtQiJ+qEFPEVdbJ5QuNsemxlifvxoJ9acH18JLc+0Ffm2fq
	dh49qyXvtq83HYsU+9DnStAD7GlECCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677673544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=05sZX5wgopLhI3s9SVqG68OzYkoj/pSPtQam+WCWZcM=;
	b=hHrpp290+4rcnbudHQmOEidN6GCVPgkSJX6gbAJY7h0Ir7k8GdxNDouFX3iPXX7P9tjVTw
	BFeFNkie1IhmGUDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0072E13A63;
	Wed,  1 Mar 2023 12:25:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 5W4UL0dE/2PHbgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 01 Mar 2023 12:25:43 +0000
From: Fabiano Rosas <farosas@suse.de>
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
In-Reply-To: <87a60wk6st.fsf@secure.mitica>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de> <87a60wk6st.fsf@secure.mitica>
Date: Wed, 01 Mar 2023 09:25:41 -0300
Message-ID: <87zg8wk69m.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: JG3UMAPsONGx

Juan Quintela <quintela@redhat.com> writes:

> Fabiano Rosas <farosas@suse.de> wrote:
>> It is possible to have a build with both TCG and KVM disabled due to
>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>> host.
>
> Ouch.
>
> Just curious: why are they needed?
>

From https://wiki.xenproject.org/wiki/QEMU_Upstream:

  Why is qemu-system-i386 used even on x86_64 and even non-x86?
  
  QEMU in a Xen system only provides device model (DM) emulation and not
  any CPU instruction emulation, so the nominal arch doesn't actually
  matter and Xen builds i386 everywhere as a basically arbitrary choice.
  
  It happens that the Xen DM part of QEMU is quite closely tied to the x86
  scaffolding for various historical reasons, so we end up using
  qemu-system-i386 even e.g. on ARM!  There is no practical difference
  between qemu-system-i386 and qemu-system-x86_64, they should be
  interchangeable. However only qemu-system-i386 is regularly tested by
  Xen Project (via osstest).

>>
>> If we build with --disable-tcg on the aarch64 host, we will end-up
>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>
>> Fix tests that crash or hang in the above scenario. Do not include any
>> test cases if TCG and KVM are missing.
>>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>> This currently affects Arm, but will also affect x86 after the xenpvh
>> series gets merged. This patch fixes both scenarios.
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>

Thanks!
