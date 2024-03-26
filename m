Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1297923ejj;
        Tue, 26 Mar 2024 05:12:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWP8nSqztTIdAspWQb9/G4O/hPpDrugByWUr5vH+U4gqDc9KP2B94ihE6cyMwzr0FnhX+BQ0IfTvQQjhuzMGqGF72oWX2OT
X-Google-Smtp-Source: AGHT+IEgJvs31fcCkb7n/xmaEhHq1TKIVeRXLuApOfXKoWPFJeJqYgkzsPLDEagbO46+5x+4lXK2
X-Received: by 2002:a25:b11e:0:b0:dcc:d694:b4a6 with SMTP id g30-20020a25b11e000000b00dccd694b4a6mr7698375ybj.15.1711455135866;
        Tue, 26 Mar 2024 05:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711455135; cv=none;
        d=google.com; s=arc-20160816;
        b=CQeShMBtlMuc6uzvqb6I+NsZEEbhRbBIyMIcfoD7ZK86hvLadIdTtSj3qp2Qwk4noe
         dannaXum6k9j60cnwNKtuMhDleKHikTLOcAZO4Fvzc/haRxxdyvyO2ZVDN2CcY0ghzMA
         CfYL7WeF1SnKLG+zgpyVZtxO7fCimsYySONgdnoZkIN8AraErCbu70lCYqeF+M9/7FbW
         +lFBTS/WaqPHqQRB0Hqjf877opQTmiQo1T9r37RQ6y/bqGI5WAwDrWp/oCzuhpmPpll/
         BFln8EcSMpFxB+cNakIdZg2JL1v39ExaA57zibHo7p4MGpTJIQcof6b2cTJgVzOMHJhG
         XKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=JK7PxkLrpc8p4rqT0olFI4lkMD6HLzYQkR7E4sD9yko=;
        fh=Y5Y7lz3TTFaQodMjtZimB7xtd2hHX3y4oiMU8S5R+Sc=;
        b=qnkk0KF3lu0PJpVZ1WBbXfAUAenpy9EksFzLU5gb3yaCBvhqxzNxKTmGbCDsG07HaB
         SIok5ZFwIWU7Xy3AmfywmMwWjaCWPrRSBtRAGYDaCMYuDuBf/M05FGdcl4F7e0KEtu6W
         7L0Rqx+9Do7kgbSxJFCB/pD9HzVF12DwyuCyWl+pTVrPB0c6famVjkZlcBgIMQDA9paK
         +XwYiXp3AqFYrHSy6wrk6BRwqt+Hzi5awMc6xAlullTN+vaNk5zveY8zx+Aa0cH74yyu
         NN9lFFvxxBz8GcUHqu/XP5cFsTWUhZxgXreBywycHqR807T0sDtFmyeMPhdkfKFb14Ny
         BJbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YvYBBhUS;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id fw8-20020a056214238800b00690d467e02asi9638592qvb.394.2024.03.26.05.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 05:12:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YvYBBhUS;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711455135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JK7PxkLrpc8p4rqT0olFI4lkMD6HLzYQkR7E4sD9yko=;
	b=YvYBBhUSdpf3XcddxRtnNZsyMZhDd0dHt0hFrNxhPf2QNHHNhxtzHDJ2RHoSaEpwD11k00
	YhkBkNPFH2QAcQkHAkUhPTqDRH70YmhTIl8gyzzfHU5CWsiixVYcRzKXnVHq44qzjJbL0m
	lfuXLoe8Mhtb1jIyBn3sWbqVSPj85kk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-140-mYzH5MSJMiuocBk96IiVjQ-1; Tue,
 26 Mar 2024 08:12:11 -0400
X-MC-Unique: mYzH5MSJMiuocBk96IiVjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE0F31C01B20;
	Tue, 26 Mar 2024 12:12:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F5B01C060D6;
	Tue, 26 Mar 2024 12:12:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 110F821E669D; Tue, 26 Mar 2024 13:12:05 +0100 (CET)
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
  qemu-arm@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Yanan Wang <wangyanan55@huawei.com>,  Eric
 Blake <eblake@redhat.com>,  Michael Roth <michael.roth@amd.com>,  David
 Hildenbrand <david@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH-for-9.1 09/21] qapi: Merge machine-common.json with
 qapi/machine.json
In-Reply-To: <20240315130910.15750-10-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 15 Mar 2024 14:08:57
 +0100")
References: <20240315130910.15750-1-philmd@linaro.org>
	<20240315130910.15750-10-philmd@linaro.org>
Date: Tue, 26 Mar 2024 13:12:05 +0100
Message-ID: <874jctp4yy.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-TUID: NImSy+8N53zB

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> machine-common.json declares a single type, which isn't
> restricted to a particular target. Move this type in
> machine.json.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Previous discussion at
https://lore.kernel.org/qemu-devel/875y45kt8i.fsf@pond.sub.org/

CpuS390Entitlement is specific to s390x.  We need it for
set-cpu-topology and the s390x-specific part of query-cpus-fast.  The
former is conditional on TARGET_S390X, and therefore must be in
machine-target.json.  The latter is not conditional, and in
machine.json.  If I remember correctly, I briefly explored making it
conditional, but it was too messy to be worth the bother.

Anyway.  We have a target-specific type we want to use both in
machine.json and machine-target.json.  Neither of the two includes the
other.  Target-independent machine.json cannot include target-specific
machine-target.json.  Two solutions:

1. Define the type in machine.json, have machine-target.json include
machine.json.  Ugly: even more target-stuff in machine.json.
Potentially slow: including qapi/qapi-*-machine-target.h now includes
more.

2. Define the type in a submodule both include.  Since nothing they
include is a fitting home for the type, create one: machine-common.json.
Ugly & potentially slow: yet another submodule.

Nina chose to do 2.

I figure I'd leave it as is until we get to the point where we can get
rid of the *-target.json entirely.
