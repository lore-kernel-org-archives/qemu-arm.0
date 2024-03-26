Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1300481ejj;
        Tue, 26 Mar 2024 05:16:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqT9q17cKIn9dXn+U8WB2cVdyUXNDkdXV3NltZM3w2D6i2v8BptI4l2bqjZmMtQyk5dQgyY1ElD7LqPnwviYb4f9yTMzrQ
X-Google-Smtp-Source: AGHT+IHLBBtiSeOKN0IB+puqVuUlvrX0WRs/8UkSx6DrcI1e19RzivkcTK/fNSSHTEaP6HJ+sAdl
X-Received: by 2002:ae9:f70b:0:b0:78a:2808:f401 with SMTP id s11-20020ae9f70b000000b0078a2808f401mr9355374qkg.61.1711455399879;
        Tue, 26 Mar 2024 05:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711455399; cv=none;
        d=google.com; s=arc-20160816;
        b=oJua7u5R0N1ET8Ev7j7l0HejvhT4z/uk9dCExda0HQrfjO/xLSeSH7hAqWQd2UIWNo
         tVBh7o9N2QNVV3IQ3+wsco7tRgUdwKdiW5rtFJ75fCYKfpThhFzjz7HQOAgI7DSrEa5J
         o2Ke6oYDpcVbgXIxU7Yuf6CttxoyiGzq+FWmWzx2zq3310+j5WrzAh0C5VV1PKP5o4yc
         fxeKKldaFXfDk0V4h+pqWKbKQAQ4IvPyCuu7qQQBhnuYCspZx310+XEVQcc4YPNz++Jf
         2C1j2vYOmKZUPvXJooW+ZwDZ8ofHDBWj+BwhTFzsrM7XvL5Dniu5dKMweZT7VpMUk657
         5WtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=lrGWBgM80ff/SJQArq6I7k02mS0j1eDOa2dzGAPPblo=;
        fh=PeQFtJtz0ihIJg6suTtNFvE+CQ3xyJ5Q+wdMPuBc9qY=;
        b=hzDtInF8gp4exjsoV4t5D0DFs7eAUGnSrmBTX0EkmBb30OYuBFSCAgjQRQTkRnwrAF
         d4t0lYZzq8sKbD/ndHKspkE73pErHgXKEHnPuWd/x37ufQ4G6XJXY7+EL5/hGGiGJzlt
         VgImDvRiHz5PWwVhLuQ+FAY6q23Tvj5rz2zNW7DtR2iCLI7RF6BrK4hJUWqYRQxpHjtN
         RlvKMj4YE4K0GUfCSTiWalqSfnBVzSLy7gveyKEP0AGICnZ1b2BsUac0tFcW2gydLrBD
         L00HvkoNwVKnCcn3hicBdQgRnclVLxGxwqWG+RNQoTF0B/tZ6Rsh0V8CM+Mtc6WPvu9n
         WrrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fnQjeDnv;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id h11-20020a05620a244b00b0078a2e0b6d87si8462743qkn.16.2024.03.26.05.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 05:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fnQjeDnv;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711455399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrGWBgM80ff/SJQArq6I7k02mS0j1eDOa2dzGAPPblo=;
	b=fnQjeDnvpN+pnUhdOJh+EgJVXqMzO8IVgv8u5LANoSV7IRn2MqWtIXwNj4hX5KviVSatLj
	EyHM2sUhPzNQLASro2FHMCH9H4fN6lrJU+A/a3q59ZyCAJ7JxjX84EKngBfcZRBF6RdVW4
	AT7iMVkMKMEJWhFvRVDVSyhBadvVL1c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-DtuFzJIEMaeaiTorG8OUDw-1; Tue, 26 Mar 2024 08:16:36 -0400
X-MC-Unique: DtuFzJIEMaeaiTorG8OUDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 044F685A58B;
	Tue, 26 Mar 2024 12:16:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCD79C017A0;
	Tue, 26 Mar 2024 12:16:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BD6CF21E6757; Tue, 26 Mar 2024 13:16:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  Anton Johansson
 <anjo@rev.ng>,  qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,
  Eduardo Habkost <eduardo@habkost.net>,  Claudio Fontana
 <cfontana@suse.de>,  Richard Henderson <richard.henderson@linaro.org>,
  Peter Maydell <peter.maydell@linaro.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Zhao Liu <zhao1.liu@intel.com>,
  qemu-arm@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH-for-9.1 10/21] qapi: Make CpuModel* definitions target
 agnostic
In-Reply-To: <20240315130910.15750-11-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 15 Mar 2024 14:08:58
 +0100")
References: <20240315130910.15750-1-philmd@linaro.org>
	<20240315130910.15750-11-philmd@linaro.org>
Date: Tue, 26 Mar 2024 13:16:29 +0100
Message-ID: <87zfulnq76.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-TUID: Y495aqjs+6+d

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> CpuModelInfo, CpuModelExpansionType and CpuModelCompareResult
> are not restricted to any particular target. Define them in
> machine.json to generate them once.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Well, the stuff in machine-target.json is generated once just fine.  But
that single copy is then compiled once per target.

On the one hand, less target-specific code is good.  On the other hand,
I'm reluctant to move these types away from their users.
