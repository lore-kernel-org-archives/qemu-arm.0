Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5653259ejc;
        Tue, 28 Feb 2023 03:34:24 -0800 (PST)
X-Google-Smtp-Source: AK7set9kPPyog5p30ARDAsDkg+f2lggHG7EoEMjXabMs7zEpU/UvxnMoEaPEiN1+lVPyJmHDoPFZ
X-Received: by 2002:ad4:5763:0:b0:574:8ef8:89d2 with SMTP id r3-20020ad45763000000b005748ef889d2mr5252592qvx.38.1677584064123;
        Tue, 28 Feb 2023 03:34:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677584064; cv=none;
        d=google.com; s=arc-20160816;
        b=DQaHvoLRsh5bd5UJlL+Te9AmW3t2OvZ/eUVGlMI2ah39ykTWWE+e1ivdX5rCctDdZ+
         y7kTJCTfP9hNRYykoWJqD4D4oDXzInFzzctlSu4f7E6Y4VVJZkZlPKw1RwdmqTvhY0s0
         mEF3jMeUHVjiTiPnREXgsvYJxog75XeSxc7JI7qEotJ5QwZFsftMYikym4Euvt4SefHf
         uRy9MSswiUoNzI0zGKlpFfXXkPZEaqpuJBT56xbGDMBu+/aJlCTtL0h+Ag4oFiQYrvFt
         vsXdXJAdaoBhTS2rXfjWJWIJn9yOEiXtV47d+QAXtMozBkPM1xfNwWokv5owOzapU8u0
         m8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=AOcFKXrfEoubHIMAnm01Q+sO2KA1vvwDvQy3bHM/ev4=;
        b=qdiKeTdlAnWCKy8MYtY64D1rgco0HUlsmWq8lDFvVv1J47g3t2GnFTYd+VkbWxL1w9
         F6JuqAlR3cvf6dc7bjYIx+H5tOWoktlFT3+p8Xx+QAgvv9TNHFwphJQwm0JtsX0x9RcC
         prgtbyIUo8PqDFCtGqXPJEsukoUZ74XX9w/F3Vqt8c8uJPxHT1h+7VgXVo0rhdbGHAgx
         G+he2Z23eDtfzaEunbrcLoIinfROupgyArOQyuSfCUUcH3tYBzHu4FjHmt2vlrKDawYn
         iOpQ5Z1ov0ta6qjAMInqYAJay28WFjDH47URAa9FD3sHpeLNBPFf5PIu2Udu13Q72q7Z
         Arew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CE3A9QHI;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bn1-20020a05620a2ac100b00706a9ff05e4si7312258qkb.513.2023.02.28.03.34.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:34:24 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CE3A9QHI;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677584063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AOcFKXrfEoubHIMAnm01Q+sO2KA1vvwDvQy3bHM/ev4=;
	b=CE3A9QHIt9aMc+J7DMpGIu2e0FfUfaKhPT0G0He+scX+T246mmTYtN/WqPB+AArRi4yXi+
	I9LlZSz8SCzImuXrLQK5lg0AWIfoYL5NGQCxTJK8zI1hLaxnyorC0zdRj/1N+jYMjzScMY
	gZb++4kYQypxYh3aL+ZXncD29CdDc18=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-bbFmldvKOiqrsXzc0gvEGA-1; Tue, 28 Feb 2023 06:34:22 -0500
X-MC-Unique: bbFmldvKOiqrsXzc0gvEGA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 225A9299E74A;
	Tue, 28 Feb 2023 11:34:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCF83C15BAD;
	Tue, 28 Feb 2023 11:34:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B2C1621E6A1F; Tue, 28 Feb 2023 12:34:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,  Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  libvir-list@redhat.com,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-devel@nongnu.org,
  qemu-arm@nongnu.org,  Reinoud Zandijk <reinoud@netbsd.org>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  xen-devel@lists.xenproject.org,
  Paolo Bonzini <pbonzini@redhat.com>,  Maxim Levitsky
 <mlevitsk@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
References: <Y/yY72L9wyjuv3Yz@redhat.com>
	<20230227150858-mutt-send-email-mst@kernel.org>
	<84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
	<20230228031026-mutt-send-email-mst@kernel.org>
	<Y/3CiEKKoG06t9rr@redhat.com>
	<20230228040115-mutt-send-email-mst@kernel.org>
	<fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
	<Y/3MIUDRBUSNg6C5@redhat.com>
	<20230228050908-mutt-send-email-mst@kernel.org>
	<87cz5uhy50.fsf@pond.sub.org>
	<20230228055016-mutt-send-email-mst@kernel.org>
Date: Tue, 28 Feb 2023 12:34:19 +0100
In-Reply-To: <20230228055016-mutt-send-email-mst@kernel.org> (Michael
	S. Tsirkin's message of "Tue, 28 Feb 2023 05:51:41 -0500")
Message-ID: <87h6v6gh1g.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: qkoP3m2IITVr

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
>> The question to answer: Is 32 bit x86 worth its upkeep?  Two
>> sub-questions: 1. Is it worth the human attention?  2. Is it worth
>> (scarce!) CI minutes?
>
> 3. Is it worth arguing about?

If it's not worth arguing, then we merge Thomas's patch.
