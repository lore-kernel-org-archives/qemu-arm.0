Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3543371ejc;
        Mon, 16 Oct 2023 16:44:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUdFiddR12x5y6prYngbeSWtvpIGECiW1VT2MDQXgnYU3OWtwxB9ooydUPJ8hF+TgemgLH
X-Received: by 2002:a05:6214:224c:b0:66d:2785:a2b0 with SMTP id c12-20020a056214224c00b0066d2785a2b0mr1317668qvc.29.1697499860171;
        Mon, 16 Oct 2023 16:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697499860; cv=none;
        d=google.com; s=arc-20160816;
        b=ekVWk8F9InaUscNkhz/49nLVXE5+rLSNjGh2cSdz5oAxaNtnZSkPhsCPIUvc2V5sx8
         HtlHiyxYxA+fVN4fvzMzBA/U6viUSMYPLZpPpB3ioTRmOdzjtp9Z3Lj1+SXowmuk/xTj
         xdY4kY3KYYweBhLLqE77xsN6AOpp7kgW2/P1KR23sCpEGu4YdpgM+PYNhqcYTXMM+NOb
         YW1BqFhMD/LZOaqQIqwvhhQbQemgatwx7o6wuv0OmP+totlY3i0t4eMtyR/jZhti2g5H
         r1kJnHwLOpzI8dsl8xC1NX0iSgbSLVr+i3j5u+UvXfWkHQaJD35P0Np9QLE3O4tMTG0g
         wdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dpxlt8g5Ojddq8Rd3dSRfnSKOcRnZ4337Zr0WKbHWEY=;
        fh=G1vUCWdmxADOk4yZr7uuUFnKXcu9qszpiiBWFYdwKFQ=;
        b=HAkxLo8RHDv8s2tkQjDSu+9ZmoVBmLTrfmOcI18olIn6deRdNKaCp6Dlj7P2Lkuq5U
         bQ/TORqm96oXgMz+6oFep+6NawhXLTYl5jcdsxfQFRnuomTUqTnwYVbGE6wewBwuFFfE
         7eX023FIoe5hSSWsiCfZCjDQnOSrU59yPfw3GIcFQMG3LnKqWdTwnaCyUgAXFH5gSZ88
         IDcKMvF7KaIrcOzVBmaHc+sD/SAr5NZf3p73I6V7WV6uyJY+O1PY8FeqURX4+52/IRjf
         kt1+AQoD5YA+ToZwn72icdGV9p40gKgEmORJHb21iXjQkbzNDAgtyAmEaONIaHqbqp1T
         iuPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A9UBBvgb;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a11-20020a0ccdcb000000b0066d03429df9si173860qvn.382.2023.10.16.16.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 16:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A9UBBvgb;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697499859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dpxlt8g5Ojddq8Rd3dSRfnSKOcRnZ4337Zr0WKbHWEY=;
	b=A9UBBvgbmqdVjCg3Zm4vWbZ/rS3/lgZya27bOdR6heoAdfpuPg5iLw0IS0fOMBkUhI9JJZ
	bHkds7G1tRXj6NrmP/0lTNfM+3gi/c4Fa4dVJk0pdCSIGk+5GFVmiwOir9VT2vIj0DRvBj
	IPBZa0n9bkf0lhKqDuqRpIjXK46vysI=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-4CZ7CEl9PHaYvL7f-yMcHg-1; Mon, 16 Oct 2023 19:44:18 -0400
X-MC-Unique: 4CZ7CEl9PHaYvL7f-yMcHg-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1e1a878ef40so6836119fac.1
        for <alex.bennee@linaro.org>; Mon, 16 Oct 2023 16:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697499857; x=1698104657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dpxlt8g5Ojddq8Rd3dSRfnSKOcRnZ4337Zr0WKbHWEY=;
        b=mVRe5IiqX+UOWdm2ogJdWyaIiHFt+CLh+gVYSdZwP44AX8tf1vPiPzWJmRWnHKkSo3
         w7SdkNt+wkVbyYi3y/QLRWTiJppVYRv0/OXw6qzvYceAEGr2PRz++YQcyLbROyZflVi+
         bJbc5ABOxysyr6lYSy75GY1DYnCX0oMdodCMc7o+X8R8H3/4/JuB3EdiBWLnfYusRXxB
         i+VmF2/59s908VKpV+Y8NXD0tdTZ6vx/lWDviquraSotlHnNlcOK20X7BnirOfhFb7rq
         TpuMS5eAcl27bFYw3Ir1XOKyuUQDjeBtVcmWLgyE3wxCfu+uoBYGxoDP0GxcMiwawDau
         Y+uw==
X-Gm-Message-State: AOJu0YzuOhUOHUt6M2PlitKWrvVtRzUpblonGpksrtHR6x1kbOWogVc9
	CzpUi4M1qdF1DFTkLUDf2dNODsygW2MfDZeaKv3YB0Gr3Noe1GJ4q/k+8c1Vz3yAEnDU9mWLtn7
	Q51891b6ZMJwXQbY1Scwa1PfKMm+nIkVZ
X-Received: by 2002:a05:6871:31b2:b0:1bf:77e2:95cc with SMTP id lv50-20020a05687131b200b001bf77e295ccmr548411oac.17.1697499857622;
        Mon, 16 Oct 2023 16:44:17 -0700 (PDT)
X-Received: by 2002:a05:6871:31b2:b0:1bf:77e2:95cc with SMTP id
 lv50-20020a05687131b200b001bf77e295ccmr548386oac.17.1697499857412; Mon, 16
 Oct 2023 16:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231013190941.3699288-1-jsnow@redhat.com> <20231016192101.GA161375@fedora>
In-Reply-To: <20231016192101.GA161375@fedora>
From: John Snow <jsnow@redhat.com>
Date: Mon, 16 Oct 2023 19:44:06 -0400
Message-ID: <CAFn=p-aO0ADr-oD3XvQs=8keNs27p3b5LGHzvZxeoMWLbu-KpQ@mail.gmail.com>
Subject: Re: [PULL 00/25] Python patches
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, 
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, Ani Sinha <anisinha@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, qemu-s390x@nongnu.org, 
	Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>, qemu-block@nongnu.org, 
	Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>, 
	Leonardo Bras <leobras@redhat.com>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Eric Farman <farman@linux.ibm.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Halil Pasic <pasic@linux.ibm.com>, Cleber Rosa <crosa@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: PJeg73fiIXuk

On Mon, Oct 16, 2023 at 3:21=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for an=
y user-visible changes.

Hi Vladimir: all done!

I've created a MR to backport your changes to the standalone repo
here: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/30
- please give it a quick glance to make sure I didn't butcher anything
in transit.

Thanks,
--js
