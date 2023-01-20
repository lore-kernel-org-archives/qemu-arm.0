Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1019655ejc;
        Fri, 20 Jan 2023 04:00:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXugNz0HpEN9M0PRm4HuRB51Q2K4bQYCaAB62gockvbv8rcDz9k8ikEOxXzMyniXkVCEcq0o
X-Received: by 2002:ac8:7ec2:0:b0:3b4:7efb:36a7 with SMTP id x2-20020ac87ec2000000b003b47efb36a7mr33422562qtj.27.1674216047178;
        Fri, 20 Jan 2023 04:00:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674216047; cv=none;
        d=google.com; s=arc-20160816;
        b=s18s9eSY69B1jr0JaZObuM3ExsN72HvpGtLn0kjmmnEC3AG+tQZgpmhHL0l33ELv2O
         JQ0x/pBmkWDy22ib9E9legwDuZ6IEDnPwd9lGcg0bjrb6p+2JXllz4pHXtHX0zH76DNf
         9YI7k/m8wfYoeIwHvKsjl1wJVTjGYrx8kFLBvvjP2PpiohzjYbZvHGEBbys7F9FEkyJn
         WxUe5pBRC1tY6eOXB+ew/0H74kHstAdGpqms7N6jNZPlpMcvcgYX7odZ+w9oGHiByeVJ
         xriKxH+NFtmlhAwS3hIWe2Kc+YOdn4mDM4TkjccIETneeXTWShJ10SwHFnf3b66dkxQR
         6gKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=j2oKxstBMt2dys53+Gz34pT6e2xzFXD9H32SKo6hObo=;
        b=KrkDzcBZxod89nWE5pg4tZzPBHJOXD2jMbZAZtl8UIFdluCNvVByXC/FhaLslh+10c
         j9G6OyJX+dTAjEXIaFOWlwz+Y5AfnS/7kHFU4BFMheV9vXuMEsuGQdZUefQYs5zGniIc
         6ChzJQOQrkZgSJLNIRLoKaYiR1/j0ldDCjk2XzmXAlI1cygJlRuseOJwtKx50m29IDiW
         Wni20yxJKNd4BAyo/q2P2YXPjr4+DjYipyG/VZqwzEbnMAEHQV9wSr3kdSPvpuPi9RDl
         UPBGuh/OprgswIkxInmqwQHtqRVpWCGEW1y5ubyFdN39tnzMRNS0qmIkcorV+44jbT0v
         0gLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D9E3Mecr;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id y18-20020a05620a25d200b006fca83b669dsi25912912qko.61.2023.01.20.04.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 04:00:47 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D9E3Mecr;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674216046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j2oKxstBMt2dys53+Gz34pT6e2xzFXD9H32SKo6hObo=;
	b=D9E3MecrVi0cRgw/UhgDFLnZ7+RQlLb5PPzn4g8508Z+rccKsEgOmGMa4uXGm2RzAYHFWp
	TJn/5/Akf8VBgSwbaUi4Ny12dAvF74/DgUKUP4Sf7om9FDRmIHwAwvvkpHaTTWnogU9Mfv
	5IuIP5q55kbvu8hGIizirCjWzAfAEZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-VJk14Sw_POuWekKkOmZ4uA-1; Fri, 20 Jan 2023 07:00:42 -0500
X-MC-Unique: VJk14Sw_POuWekKkOmZ4uA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CAD085A588;
	Fri, 20 Jan 2023 12:00:42 +0000 (UTC)
Received: from localhost (unknown [10.39.193.175])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65BA939D93;
	Fri, 20 Jan 2023 12:00:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v4 06/15] tests/qtest: Add qtest_get_machine_args
In-Reply-To: <20717e57-8524-5bca-efc3-ff294cda34f6@redhat.com>
Organization: Red Hat GmbH
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-7-farosas@suse.de>
 <20717e57-8524-5bca-efc3-ff294cda34f6@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 20 Jan 2023 13:00:37 +0100
Message-ID: <87wn5hh0uy.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: qsk7O5JNg5WZ

On Fri, Jan 20 2023, Thomas Huth <thuth@redhat.com> wrote:

> On 19/01/2023 14.54, Fabiano Rosas wrote:
>> QEMU machines might not have a default value defined for the -cpu
>> option.
>
> Which machines for example? ... I thought we'd have a default CPU everywhere?

There's a patch further above that removes it for KVM on Arm... do you
think that's a bad idea? In that case, I'm not sure what the default for
that case should even be...
