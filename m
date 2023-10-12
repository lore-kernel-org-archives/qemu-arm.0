Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp559132ejc;
        Wed, 11 Oct 2023 22:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG+JRvlCdrqG8HPt3xrVk9G3cYfP0wUA6hOIQYH3iLQ40WKU+8INvv2CidZvJoTKwkI8w9
X-Received: by 2002:a05:620a:4728:b0:773:af69:e614 with SMTP id bs40-20020a05620a472800b00773af69e614mr26061706qkb.58.1697086966517;
        Wed, 11 Oct 2023 22:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697086966; cv=none;
        d=google.com; s=arc-20160816;
        b=lp3rFSNjOPEaMKxH20qdUTdoAgxEaNcPu4pE20UYgopY2Umqgk8wVpncf3DLjuz9MD
         2Wk+OL1lSwmJ3KpM8A9y0lJJRjHXCDcd+oZ2kQZXV4lWtCUL/6uao432jRQxKAZXvLrE
         WPuEZ7lTto8O9UwOrX5jbVuh0ZNA++emjoTU446sifDAnq+MV4xPWYN2twuQYfkL4RFT
         nXdFdz9ra/jqZJl6gbeKJDHDJKixYaou8U3ahrPtq4y7r8huM6LKdzTIvgoZDWGHvvys
         2B7jgMW0BH3tySCIxXONocHJg8yop1K92wBqyLMJL5LrvrNxispajgSZzx9CHlUk674+
         3whw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=bEpuwG2bay5KSJPJMED03m4/4dDBW5i8wGLKdx1G47s=;
        fh=xS3BrZyG2rj1ajevhvmPm9aSpsZ1Ef9x6zZXaxhdPXE=;
        b=Z2cTL8HVmFExKmiatyZ8mnst/bum2FVaDBhOqm6JODMwbY5veedZYTvsI0bL/7DZP1
         i/1YW9GuoycDbKrTbMFn/3ECvcNSYohGYLloVe96LOgEr61Zo6VsRHJ+kDqhV8OXG8jm
         F8BUZjda4cT4QpeDAoiSpB1E9BdCmIF8emfy6JQsFlcFIO5Xo6j6ZqqOU6mhWPO7s9oJ
         N+k0CnpxDd2UgvxoTTa3Eit9ofnavaCzYezu3t0s205X9ANFIWrqOG49j06TpQolxYyN
         fyq01S1oybIg5Fbvw/a1ClR5RYou4MrFv1efs9O4QNUQZqrNJ7ISO+ue6WTnjFp+MtQ0
         d3vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fBY70VRl;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bk36-20020a05620a1a2400b007741b0f3fd8si11086242qkb.283.2023.10.11.22.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:02:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fBY70VRl;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697086966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEpuwG2bay5KSJPJMED03m4/4dDBW5i8wGLKdx1G47s=;
	b=fBY70VRlg3KVHiL90CSQq+6GUelIZPgW1NCOQflSjN/O+DBkTL1R1YUBQE0Fss7CZpc762
	Tn83Qxzoj+u0JVqJOZPGdr1N4flRGdK5ngKaqFr102HnLBZI8vvb+xIdkiSc7nuvAW+dYw
	q9E1gdNUI3HdqqKnf8DMhCzLzRtuIBQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-raQN4y-POpSPmemt03LyXw-1; Thu, 12 Oct 2023 01:02:40 -0400
X-MC-Unique: raQN4y-POpSPmemt03LyXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40886811E7B;
	Thu, 12 Oct 2023 05:02:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 193781C060AE;
	Thu, 12 Oct 2023 05:02:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0BBB221E6904; Thu, 12 Oct 2023 07:02:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
  peter.maydell@linaro.org,  alex.bennee@linaro.org,
  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter Xu
 <peterx@redhat.com>,  quic_tsoni@quicinc.com,  quic_pheragu@quicinc.com,
  quic_eberman@quicinc.com,  quic_yvasi@quicinc.com,
  quic_cvanscha@quicinc.com,  quic_mnalajal@quicinc.com,
    Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC/PATCH v0 01/12] hw/arm/virt: Avoid NULL pointer de-reference
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
	<20231011165234.1323725-2-quic_svaddagi@quicinc.com>
	<b98e4566-56b4-d0e4-adb2-c163c7c26cfb@linaro.org>
Date: Thu, 12 Oct 2023 07:02:39 +0200
In-Reply-To: <b98e4566-56b4-d0e4-adb2-c163c7c26cfb@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 12 Oct 2023 06:30:24
 +0200")
Message-ID: <875y3cph5c.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-TUID: 2k7tLTwHXvDx

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi Srivatsa,
>
> (+Markus/Peter for QOM fu)

QOM fu needs Paolo; cc'ed.

I'm not sure how much this is about QOM, though.  Perhaps it's more
about good taste.

> On 11/10/23 18:52, Srivatsa Vaddagiri wrote:
>> Avoid dereferencing a NULL pointer that its_class_name() could return.
>
> While your patch is correct, there is some code smell
> around its_class_name(). IMHO a foo_class_name() handler
> should never return NULL.
>
> I'm trying to rework apic_get_class() similarly, see:
> https://lore.kernel.org/qemu-devel/20231003082728.83496-1-philmd@linaro.o=
rg/

In both cases, we have a function to find the device model to use with
current QEMU configuration and system state.  The fact that one of them
returns a class name and the other a class is detail.

Observe: this usable device model exists for any QEMU configuration.  It
may not be usable in certain system states, though.

Since the function deals with both, it can fail.

We can separate the two concerns: first map configuration to device
model (can't fail), then check the system state (can fail).

Feels like a matter of taste to me.  Does it result in simpler function
contracts and more readable code?  Can we do it the same way everywhere?
