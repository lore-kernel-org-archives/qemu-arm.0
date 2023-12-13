Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1860778ejo;
        Wed, 13 Dec 2023 11:39:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvv7EIezpeDK9TttAEnnJ+w/E8WGZr9uH/kdp7ZyDNUnH2H9zAn0XyDRd7dOg66zaPPTbg
X-Received: by 2002:a05:620a:3c91:b0:77e:fbba:646e with SMTP id tp17-20020a05620a3c9100b0077efbba646emr10056256qkn.77.1702496375884;
        Wed, 13 Dec 2023 11:39:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702496375; cv=none;
        d=google.com; s=arc-20160816;
        b=aPEOTU8+jBFXh6CDDM047tIhN9G5uiV6Rq1fY45fDWBeU0/jfDiGH0B5PtjiKBUrWq
         e2zcWXCiZn2gfBOqYTRbHrvEIL9Hjhi0Hf3BU6O6FlktfTiN61pKHxcnSJpYe81V28zl
         ihaQ0ewcKHIY9Q2zuL0HH6vvzQPV7MsIII6e5FMFZWvGmP6lncGjmkUa92yKdt8trS3M
         EXAEyz5il6TFizGknhhqiPtxZu5mOLYCNJoJpV+YXYESNYMyoacEYdEGQH1kwy2CDKVY
         9pEVbrdU3IUYX+xFD3DmyYjdxp03TzkanLAUGbxIyurG0FzKFmo1HjZCUjDFfC6hcuIt
         bbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=pKJ2gmaWxKAK6Y/wvzA1srhiIXS0NochFPI0HVkNASs=;
        fh=N4CpcqxbsHgP5TDw+/NnFTICJzz9PyxXQffAzBp+JEw=;
        b=lF4y4PVLPOT2tyDLPfQsgqhs/xzvSt17SbEKQ9eUoRbJh35jsfFnM8N8Vjw9EBKFMT
         FDI0vlUnPvXMWvy8dSQg4paC71+9x9p3GegAAaQYuRUNyofBY5K0D53qvVSkWy5JVuRu
         YfW63TCzUoUxav1a7jEv7sHKim4bef7n30R0FmCS/Ae6vsSwLb6NV0zvYZzitu4tLdgW
         60q8yk2ZJtUKdBtj+rFANWq9uwDJxPBdFoUui7DwoOjZgSdBE+fK8kjMtQcjwqeIL2Bg
         n6p3ROXaDIFwap7Zhjq+8QxUmeW0kzRjTvowePUuZCQbDtZkd8WzaT09d0KEhPX/ZgL+
         KVjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QIbU+Lr7;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bt14-20020ac8690e000000b0042586375f66si14816305qtb.124.2023.12.13.11.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:39:35 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QIbU+Lr7;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702496375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pKJ2gmaWxKAK6Y/wvzA1srhiIXS0NochFPI0HVkNASs=;
	b=QIbU+Lr7B8/Bj0t6vXZJFT6Bmoq39y+tN10ts0xUlbxp+C3JQxqLUNrJROsJzODiHk1Esx
	OQQVYqnXqumY2EzLL7JbwOl4/li+QrCIro6WCePE9G9JIp7uVbKwx2SeWBG1KTe+KreLhR
	1p4X3NnKmvIDx69OH1qYtEbxdJN4A1g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-HANLME-LOSCusGI_e2kGGg-1; Wed, 13 Dec 2023 14:39:29 -0500
X-MC-Unique: HANLME-LOSCusGI_e2kGGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E444488FC26;
	Wed, 13 Dec 2023 19:39:28 +0000 (UTC)
Received: from p1.localdomain.some.host.somewhere.org (ovpn-114-21.gru2.redhat.com [10.97.114.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 104BE1121306;
	Wed, 13 Dec 2023 19:39:20 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Paul Durrant <paul@xen.org>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Beraldo Leal <bleal@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 02/10] tests/avocado: mips: add hint for fetchasset plugin
In-Reply-To: <8717f71f-5350-45ef-9712-89c1240bc77c@daynix.com>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-3-crosa@redhat.com>
 <8717f71f-5350-45ef-9712-89c1240bc77c@daynix.com>
Date: Wed, 13 Dec 2023 14:39:05 -0500
Message-ID: <87zfydvqna.fsf@p1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: P9cxB2URb2V/

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2023/12/09 4:09, Cleber Rosa wrote:
>> Avocado's fetchasset plugin runs before the actual Avocado job (and
>> any test).  It analyses the test's code looking for occurrences of
>> "self.fetch_asset()" in the either the actual test or setUp() method.
>> It's not able to fully analyze all code, though.
>> 
>> The way these tests are written, make the fetchasset plugin blind to
>> the assets.  This adds redundant code, true, but one that doesn't hurt
>> the test and aids the fetchasset plugin to download or verify the
>> existence of these assets in advance.
>> 
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>
> Why not delete fetch_asset() in do_test_mips_malta32el_nanomips()?

I was trying to preserve do_test_mips_malta32el_nanomips() in such a way
that with the eventual migration to the "dependency" system in newer
Avocado, the lines added here could simply be reversed.

But, that's not a strong enough reason to justify the duplication.  I'll
follow your suggestion on v2.

Thanks!
- Cleber.
