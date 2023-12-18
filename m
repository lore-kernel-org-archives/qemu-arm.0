Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp618605eji;
        Sun, 17 Dec 2023 23:26:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRich7keYQ2etKvJa6va/fRaSxj577WAb+OmmSwNOPxWnvqTRYOEc+2u9MS0DXQQ3afn/O
X-Received: by 2002:a05:6214:226a:b0:67f:2201:81df with SMTP id gs10-20020a056214226a00b0067f220181dfmr6231489qvb.28.1702884410365;
        Sun, 17 Dec 2023 23:26:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702884410; cv=none;
        d=google.com; s=arc-20160816;
        b=Kl0i1G3SKj4lZpoMwHQq+x2v9adtckbEv4ZXVr6Ltg/+CfNWDiLPae5g5KyseR8XbS
         aRd/cejfOB5rPhGav1/+YOqtUwdfytEoAt4yuaBXysnvWgIJSVW15gD0Ynb5A4qi3o0/
         pY4DZGqybGdPfrPZ/thKWSKdiXzwUdv/Ao5Yb3Po+Of7L8xzV8BUXjGc2I6x1sku11JC
         axfakBkDbGMYLgs1XmysK5bM+oUGbGoZT6p+TGhTVRgoYI7VanN/WJvAFBc6jir8aqg9
         b5awrwi3DhqGIzJwKqNKn23MGo1h1UTVDQokIkCUzmmbeeSXeRV9njmvXcRw2uHO1xtM
         JBzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=HEP9cBYUupaX8fOw+ri2243FNDdUxVKWCm+ZN6/xHPU=;
        fh=uqmWA2ihpJ25DJQ84lcaTSQdl3+LzsYg8tZLT4o72cs=;
        b=efZMQ0meL8tvZ3zJEKNkp6eX6xMD+dI9Ejy0FTDkibeC0CUQGJezY8MYNZy+/E5oNc
         KVxfvs01cWv6hAwrJ1jddxmfN4T+V84+qp4GlR6ZQjpr/e9t88Lr31QvUeosPuMUWjAD
         YPCWqM2JEkm2Ke7UxFEYDMLEiF4XuhIhcd5TcrjXVbbQuHomYr1r6DYC9ebkxWEok1ly
         /MfUwmnROGHJZqfu0MqG62HOEIRQxG2iiHAjKdS077ORDpjRV3Lw90PSb8KVqYn/VOjg
         StEh48kg7LGFAmu1RYfZjr2E2ht73qxDkV0gP49LE9e4IbU63jWDIk16Yk8cYMiep8F7
         0Djw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CTRAyTQJ;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id b19-20020a05620a0f9300b0077f129f0a08si21775639qkn.784.2023.12.17.23.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 23:26:50 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CTRAyTQJ;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702884409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HEP9cBYUupaX8fOw+ri2243FNDdUxVKWCm+ZN6/xHPU=;
	b=CTRAyTQJSo3ZUECDSn8MOkWkux/s57vTpZ4+KWBFIym8wJBP8ApYkiyhX8+T5hRBOSUWt9
	yq65LZsdWlFkVLSo609j2Upc0ZI/XTjiBBC/u2F4AqYEP7ekUjy0TOBZ2XnMahiW3tyas4
	BssRw/ReSCX3R5uvOG6MQs8WJZKopTs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-EtXnlD6HM9aJ8mfvJTem4Q-1; Mon, 18 Dec 2023 02:26:45 -0500
X-MC-Unique: EtXnlD6HM9aJ8mfvJTem4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B42784AC62;
	Mon, 18 Dec 2023 07:26:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A86140C6EB9;
	Mon, 18 Dec 2023 07:26:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2D43D21E6920; Mon, 18 Dec 2023 08:26:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
  qemu-devel@nongnu.org,
  Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  "Edgar E.
 Iglesias"
 <edgar.iglesias@gmail.com>,  Igor Mitsyanko <i.mitsyanko@gmail.com>,
  Radoslaw Biernacki <rad@semihalf.com>,  qemu-arm@nongnu.org,  Leif
 Lindholm <quic_llindhol@quicinc.com>,  Rob Herring <robh@kernel.org>,
  Alistair Francis <alistair@alistair23.me>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>
Subject: Re: [RFC PATCH] hw/arm: Prefer arm_feature() over
 object_property_find()
In-Reply-To: <CAFEAcA-Je+_tNCwiL_sQb-tDmCRJ2LWm5mAfuowtxbUBNEWQXQ@mail.gmail.com>
	(Peter Maydell's message of "Thu, 14 Dec 2023 17:25:36 +0000")
References: <20231214171447.44025-1-philmd@linaro.org>
	<CAFEAcA-Je+_tNCwiL_sQb-tDmCRJ2LWm5mAfuowtxbUBNEWQXQ@mail.gmail.com>
Date: Mon, 18 Dec 2023 08:26:43 +0100
Message-ID: <871qbkug24.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: Ny6gCikW1G8E

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 14 Dec 2023 at 17:14, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
>>
>> QOM properties are added on the ARM vCPU object when a
>> feature is present. Rather than checking the property
>> is present, check the feature.
>>
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>> RFC: If there is no objection on this patch, I can split
>>      as a per-feature series if necessary.
>>
>> Based-on: <20231123143813.42632-1-philmd@linaro.org>
>>   "hw: Simplify accesses to CPUState::'start-powered-off' property"
>
> I'm not a super-fan of board-level code looking inside
> the QOM object with direct use of arm_feature() when
> it doesn't have to. What's wrong with asking whether
> the property exists before trying to set it?

I'm not a fan of using QOM instead of the native C interface.

The native C interface is CPUArmState method arm_feature().

Attempts to use it on anything but a CPUArmState * will be caught by the
compiler.  object_property_find() will happily take any Object.

Likewise, typos in its second argument will be caught by the compiler.
object_property_find() will happily return NULL then.


I also don't like adding QOM properties to instances.
arm_cpu_post_init() seems to do that.  I feel it's best to stick to
class properties whenever practical.

More so when management applications are expected to use them, because
introspection is much easier to use correctly when existence of
properties doesn't depend on run-time state.

Kevin's "[RFC PATCH 00/12] QOM/QAPI integration part 1" explores
QAPIfication of object configuration, loosely based on
<https://wiki.qemu.org/Features/QOM-QAPI_integration>.  A QOM class's
instance configuration interface becomes compile-time static.
