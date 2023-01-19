Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp567301ejc;
        Thu, 19 Jan 2023 11:21:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXumnJKSpvjS+0fGthK7CPJzGIeSijNJrqjYPZU+aXY9PvCg3eqTDH3g5XbvE+gfZAW3IHC5
X-Received: by 2002:a17:907:d23:b0:877:6873:70b9 with SMTP id gn35-20020a1709070d2300b00877687370b9mr7093316ejc.29.1674156114400;
        Thu, 19 Jan 2023 11:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674156114; cv=none;
        d=google.com; s=arc-20160816;
        b=UGa4mxX6A21Jxky8/aTQtwNZD1ODyPXo21WeSbMnOfxgJ1kndZwR6RPxdPcDszkUgf
         EuYKdQ0uy3tF8kT3zZL731GE+Y1xKp/PHoprv3oEWaAio88CGPoITop93hT3HjsznFQv
         RW5fl2S/VKWlrohk9OT9XG/KWjM7mc0rQI8dgpp4/XYTzZzm0JG99y4o1rtVuNr8cykO
         QovsUr/qAvulXn8hPIgbESULq8HWeua0eokr20vhGu7Wsxhi+8iiqy7IgZhQ6Fmu2bFI
         T2EO4Kk3epH/RT3Xdc2MBdzqgxeK0BvMeiQkniojUEgY9O8tjyCN76zgeqTvhHMG74+e
         l4eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=+ygE7a/jCSaLOmfjTN+IOSjItga07YqpMC6SAqW3auw=;
        b=xzkFKd/k938kQpRwChMFADgFvWT8IetCrUOXlsTq0xu0TWAOjSY9EtV9lkk2HCj814
         A8/imk7GKeS4iyi3cQ9WrX79qkk2jBBSFqr5VAaYpe0wIMtovrXVFBI1G7CSqHCVKQfj
         ahb/N5nLjSRJUBUYhJkcprd+Ci+rCqJcuspyxZ1ioL5UCsnCN4kT+s5Qxgl/9Ezbq6Cp
         /oZcsQmZKoyprFeAI1aYovCm+iqU02zZvLLxOVgXMbC/gKYRNSteMgJUtAh24XWAECVO
         7rrnUiBG3kgS4d/SZaSBrPqU4n1f+g1OYiSapxg23kybyVATTrWrcrEsYa4A6aVDlgHc
         t37w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=1VIC9IKx;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id q26-20020a170906b29a00b0087532d0249dsi5644251ejz.77.2023.01.19.11.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 11:21:54 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=1VIC9IKx;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BFDDD219A8;
	Thu, 19 Jan 2023 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674156113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ygE7a/jCSaLOmfjTN+IOSjItga07YqpMC6SAqW3auw=;
	b=1VIC9IKxoOe9cw/k/vDqpaGQ+BsmzKqrbOJgnLR/BiOpyu3jS+PPwNKKd/YUMVw9NQLu6v
	p9bZv40vA1zjSUYLhZdx+S8cK8Uu04mNpywWsjZ9F1k71wGUE7H+TOmE8RoxfRx6Tvm/Q8
	2DYgDGTIvEvwuAbTR8IhVtDR2zY5x78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674156113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ygE7a/jCSaLOmfjTN+IOSjItga07YqpMC6SAqW3auw=;
	b=9q+P9hYqcYFDErETQCoWXgA+HAPYbKVKB742xGilDZhGmF9C+aqopWlUeVjWUzJZqVEEo1
	aqLZKs2FG3UEIyDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4592B139ED;
	Thu, 19 Jan 2023 19:21:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4SEYA1GYyWMqPAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 19:21:53 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna
 Reitz <hreitz@redhat.com>
Subject: Re: [RFC PATCH v4 11/15] tests/qemu-iotests: Allow passing a -cpu
 option in the QEMU cmdline
In-Reply-To: <cb112a3e-ad40-08ef-52b3-503d73ce97c2@linaro.org>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-12-farosas@suse.de>
 <cb112a3e-ad40-08ef-52b3-503d73ce97c2@linaro.org>
Date: Thu, 19 Jan 2023 16:21:50 -0300
Message-ID: <87h6wm49f5.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: jXkl6Wt39zGB

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/19/23 03:54, Fabiano Rosas wrote:
>> +        cpu_map = (
>> +            ('aarch64', 'cortex-a57'),
>> +        )
>
> This isn't a map...

Right, a dict would be more suitable here. I had just copied the code
from machine_map a few lines above.
