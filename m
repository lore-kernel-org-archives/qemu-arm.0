Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp191351njb;
        Tue, 7 Jan 2025 06:25:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXaz2zn+SrpOYjEyB5RkRG8SarQHLLuP+soJRmQAitu0G5sSdrsx6d+RBewARjy5noaDUAGmWUXFHMtPw==@linaro.org
X-Google-Smtp-Source: AGHT+IFQ7qxYB3zwgkuFlR3uXtjg7JZmtW0rF6Qm9EBbubt6elPfHeiZ8/OjAXuZ5u7PdzeF2FFw
X-Received: by 2002:a05:620a:3710:b0:7b7:869:2e48 with SMTP id af79cd13be357-7b9ba7f6571mr9958509185a.47.1736259959040;
        Tue, 07 Jan 2025 06:25:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736259959; cv=none;
        d=google.com; s=arc-20240605;
        b=KRMzuXOOYT7pRsYZevwrR5BKc1dbN4l+Yt/h27q1jvsg/yPy/fL4cXI11RBFm/oVFA
         s88MO+yDIgZxnvAK3pVL6lZwfUEnlZfzSkyonwf6GUFkZ9JT/7aJHtaOGpB5adhwUzQk
         rlj8GNIANedLnpQ0/dP3P4+REgLDBmOohNRiw2Ea+zy29H5sGn/khu8e5Y5G3rljV8gm
         SvybMsOqJ0G8QCjY7tnFt2CgT43nulpAvTFSU8yLCfF8VbeRtruX+2qC8F6TuATzfkL3
         OT1B1D58YPT+q8T13XZFVnXlo52U7UrlXgJNXbQqSDuXLehRU1nnZmCQoJqW4nYZjJ2H
         w7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=IaFNB4MndI1vFWN202iri2tsIJpXyjy1kRLi0aCKHNA=;
        fh=4f/545ITG/bHEjfzebKeXFpBpH0g842GxCpil6PBbos=;
        b=MI/C0lcxQbSS3JT+xX/vXGh4L5WXduFY6TBG6nhr26GVnxHriaADCQUZBe31PRwh70
         uWXLRxsZswCtm4b2aKWJVntvqE9OwgBSj3scuiCg7ndXEMO7lsZ5+6yd/e/wuOibdAiN
         PZHbW3QpEACoIBeyffrivdnJAFmqlDhczIYCIW0Vk+mJc2qAtNCnXcZAVEg01QNl/ERn
         ktaTZBfE9Fa8kkVSyiLKC3an5VzodzJjwiamKYWcKayaJafKe62C1iw8pHYf8KXT3f5w
         RvV168l3F5j3V1TSPqtAuL9FVOwZlwiej7tAllLF6c/NMOhFLuLF447EhZy17S1AWjC9
         l7cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UsWqtjSe;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4f3699si4571982185a.538.2025.01.07.06.25.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 06:25:59 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UsWqtjSe;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736259958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaFNB4MndI1vFWN202iri2tsIJpXyjy1kRLi0aCKHNA=;
	b=UsWqtjSeqNqiAQaTfCURiN9mD10DgCtYteEiMCYnY6FYd/aIfrnx+pHguoIYsYhsTpHUNO
	TQrCH76xLNZxO9ulDmcA58Ywnhw08uUE0vYIx7RDP0vveq2/VP77uxhekDkn1fd2jL2g97
	lKMvYADU/Q8MSU40q62jsCfriEBvRw0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-GVND92jSPIaHDgpu-p_m1Q-1; Tue,
 07 Jan 2025 09:25:55 -0500
X-MC-Unique: GVND92jSPIaHDgpu-p_m1Q-1
X-Mimecast-MFC-AGG-ID: GVND92jSPIaHDgpu-p_m1Q
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 289831955F42;
	Tue,  7 Jan 2025 14:25:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.101])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 976901956053;
	Tue,  7 Jan 2025 14:25:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2983521E6924; Tue, 07 Jan 2025 15:25:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  philmd@linaro.org,
  alex.bennee@linaro.org,  thuth@redhat.com
Subject: Re: [RESEND][PATCH v3 0/7] Add ivshmem-flat device
In-Reply-To: <20241216141818.111255-1-gustavo.romero@linaro.org> (Gustavo
	Romero's message of "Mon, 16 Dec 2024 14:18:11 +0000")
References: <20241216141818.111255-1-gustavo.romero@linaro.org>
Date: Tue, 07 Jan 2025 15:25:51 +0100
Message-ID: <87r05e8zv4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: wBCRknVnW//r

Gustavo Romero <gustavo.romero@linaro.org> writes:

> This is a resend of the series:
>
> https://lore.kernel.org/qemu-devel/20240222222218.2261956-1-gustavo.romero@linaro.org/
>
> rebased on the current master. The series was sent about 9 months ago and
> remains relevant. Besides addressing the longstanding issue:
>
> https://gitlab.com/qemu-project/qemu/-/issues/1134
>
> it has generated interest in the community at least twice since its last
> version, from different contexts:
>
> https://lists.nongnu.org/archive/html/qemu-discuss/2024-05/msg00003.html
> https://lists.nongnu.org/archive/html/qemu-devel/2024-09/msg00374.html
>
> This suggests the series is being used out-of-tree in various contexts, such
> as experiments with heterogeneous architectures.
>
> But due to the fact it relies on sysbus, which is marked for future removal,
> some maintainers objected to accepting the patchset, causing it to be held in
> the ML.

Actually, I inquired about the use cases, and was told it's for OpenAMP.
I challenged the use of ivshmem for that purpose in some detail[*], but
got no reply.

>         However, given the ongoing community interest and since currently there
> isn't a better way on QEMU than using sysbus for the wiring needs of this
> device (e.g. to wire the device to a CPU IRQ input line), I'd kindly like to ask
> maintainers to reconsider its acceptance.



[*] https://lore.kernel.org/qemu-devel/87zfth4psf.fsf@pond.sub.org/

[...]
