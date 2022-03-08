Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2307887lfo;
        Tue, 8 Mar 2022 04:42:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfZ7+psvPRPcB3GESzziXulayDWQ3EOfIYOWI/RMp8dDP4+bnWUL5sI8Q86yajBMJqpkDn
X-Received: by 2002:a05:620a:4544:b0:67b:d13:be96 with SMTP id u4-20020a05620a454400b0067b0d13be96mr8469933qkp.596.1646743348548;
        Tue, 08 Mar 2022 04:42:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646743348; cv=none;
        d=google.com; s=arc-20160816;
        b=Poi7flDZ9Svt/O7byMK3GW9VxKmuWOGe1TeZJnCNUQxnZU4yyv1fsV0bh6F2mwzwvl
         rubT8haViHqLhGsnxM68RIXrPZo1ekqBCUg5kfNl7hIimmdpDMlut1o69+NilcB+oqEe
         KXvTKU0+RSDhHKcum5cEaOc5n4YzFX/VCZLzh4B/FxAA0xP9Up3YkArVp8IJDb/s40Jk
         iYMe++JZ3KI/SRE9y6YIZuYvo54Bc2KSxfAEio0yvJ/owA+zTCUJj6yAHqIGD4tESHvP
         eOaDIf4ZUymQezKfRDesqC14floc6gjXLCEKynwOVQxqcHO3XZ6bHts58anI/dWoX435
         9iEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=UdfQgfn4MByN1Ca5FSEAlA7o/VrsqX4RLKSBZV9fino=;
        b=F0meyAvqJ04zuWTF8dF4Rw7gI9nvVtvaf3JyYNvbe1U5MaO3Gw3luWcLNUWNT5o5NS
         8HVfLChy4Lt9DyVuUWe1dLcBt2or6HZi3hbXhcL/trOwgox/wSIgyuwPEUBqS1cfsW8H
         ElzOAgxCVGeaPwNYBnersGE/gbKbhbJVX+IrGdD+c7beDjxcHV8V99OKzMkGd7vADQzl
         r/WicaU9zJ6X4QeaJBTAk/zjBgS349P+D2zL1ns+E16I01+y2nhTbiNzE4FbLOB+feu0
         DxvFFy750qWXsLcxMuehvSXrGzKNOYaXcewkIe1MjcAoqUfBP7E27Lm7oYcCYFtmWT9c
         GiMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PiQN5JcZ;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id x20-20020a0cb214000000b0042c2d96794dsi6209541qvd.374.2022.03.08.04.42.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Mar 2022 04:42:28 -0800 (PST)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PiQN5JcZ;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646743348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UdfQgfn4MByN1Ca5FSEAlA7o/VrsqX4RLKSBZV9fino=;
	b=PiQN5JcZ9RNMOIYEIJ4kHBHEIAhvF1H6Wi8jkNmfc5bcdZHO0Di1m0L7IU+o3aQ7vuez/N
	rCMMP4zwvAqQ62/uGm5HCi8Uoy/2Yzkr/xcG7qFrKkwzwjArdlNwEDyefECdQy/+9dG116
	8aUm8xxQhAxdiUNwg4K+xjNonMQ1m2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-8fkVLVQnNw-TvxHcNmydQg-1; Tue, 08 Mar 2022 07:42:25 -0500
X-MC-Unique: 8fkVLVQnNw-TvxHcNmydQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 497C2800050;
	Tue,  8 Mar 2022 12:42:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E992105C885;
	Tue,  8 Mar 2022 12:42:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id D385118003A3; Tue,  8 Mar 2022 13:42:04 +0100 (CET)
Date: Tue, 8 Mar 2022 13:42:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>, Cleber Rosa <cleber@redhat.com>,
	Oleg Vasilev <me@svin.in>,
	Richard Henderson <richard.henderson@linaro.org>,
	Emilio Cota <cota@braap.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Idan Horowitz <idan.horowitz@gmail.com>,
	Andrew Jones <drjones@redhat.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Message-ID: <20220308124204.arfr6yuwojwksizh@sirius.home.kraxel.org>
References: <874k4xbqvp.fsf@linaro.org>
 <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
 <afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
 <20220223115042.lvxgrjirr5avzkzw@sirius.home.kraxel.org>
 <20220224101020.2dd35c16@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220224101020.2dd35c16@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: OuddvGb5PgRQ

On Thu, Feb 24, 2022 at 10:10:20AM +0100, Igor Mammedov wrote:

> wrt bios-tables-test, it doesn't need debug version and should work fine
> with non-debug builds.

Well, almost.  Using non-debug builds changes the memory layout enough
that we see a change in the memory hotplug ssdt (patch series should
follow later today or tomorrow).

take care,
  Gerd
