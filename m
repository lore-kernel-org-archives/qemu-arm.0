Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp894149wro;
        Thu, 1 Nov 2018 07:42:52 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d7eXXgCtLj/ezv29uHiWLA5PoAW6SwRMjfKvIwzx3OgxX3IFdgpUpSADIO00Qwua6DHYYb
X-Received: by 2002:a37:18d5:: with SMTP id 82mr6538375qky.65.1541083372295;
        Thu, 01 Nov 2018 07:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541083372; cv=none;
        d=google.com; s=arc-20160816;
        b=DJyb3aIKWUsY5jz+7y+YeCHELHQZlKPiBmvSaxZa9xeanpQPX6ybODOkN9glpVnLui
         JqGinOAABNMfD4SNTvtXjoDzZHJJ3g++K9ktN+y78qsbiOud5KOU5iUjXL1OvgB5Y3ZM
         yK4vZmxIyMumuohCb98rAIdbnAX65KJ8YiYRn2SMqCsnZwCo6sCoqeycxOhFgFevvKRP
         nV1Opw7cGKWJsV9BgB8Gvcxkvq+Ej+zq890iy9c6StHeLo/wA2KQE0omNuLypWomd7em
         tMu+pDOxlIY3bpR96Jfwqgi5iIaDXbRyJ0rDMFofetryMuoujhEG4tKFRjQnwb+KzhLE
         ZQ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to;
        bh=ideSqBkX7lMRC2fiTyJY7bx8HeT11Xen4/wm8ScxDGQ=;
        b=Jyy0cANqZ2frzjVK1PW/JPQDhoNN4Oz2jsA8FHlb/mF8v/wEZTeCOMgLP0O5vwwRc2
         eG1yXZCnJxojyuxHREKUxsGELF6c9fOEKBa9guxPtJD9IY8ttOmAtX9J8Am+clA779p1
         9odz48/8FoKnfQIY0HrEfD2ODvoapj55/VBkVuIBOpJVHr/X5lYT5nzW78x4XOCEWfEe
         kAdOrCZsY/FjYgN/jQ2wxYWstjy9wChetBdipvtmraYhDusKqvlJ5chYYmosP3M4DlFo
         faHPrut6YCjIfrAyVKxZgSYRE92NxW+AvjwAbJYQrLUjCaQFhWNVgxqXKWWkCsiTGoxj
         oiKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j123-v6si311828qkc.18.2018.11.01.07.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 07:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42383 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIEBP-00018Q-Qz
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 10:42:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gIE7Z-00058A-8I
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 10:38:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gIDvb-0007Ks-QM
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 10:26:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20292)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gIDvG-0006vw-PH; Thu, 01 Nov 2018 10:26:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 674A3C05090D;
	Thu,  1 Nov 2018 14:26:09 +0000 (UTC)
Received: from [10.3.117.124] (ovpn-117-124.phx2.redhat.com [10.3.117.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 667B3600D1;
	Thu,  1 Nov 2018 14:26:01 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20181030001841.1658-1-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bcf1457b-8f0c-3d02-cb40-529eddb19316@redhat.com>
Date: Thu, 1 Nov 2018 09:26:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181030001841.1658-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 01 Nov 2018 14:26:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] tests/bios-tables-test: Sanitize test
 verbose output
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iuf1Ia6eyI2r

On 10/29/18 7:18 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix the extraneous extra blank lines in the test output when running wi=
th V=3D1.
>=20

> +++ b/tests/bios-tables-test.c
> @@ -371,6 +371,9 @@ static GArray *load_expected_aml(test_data *data)
>       gboolean ret;
>  =20
>       GArray *exp_tables =3D g_array_new(false, true, sizeof(AcpiSdtTab=
le));
> +    if (getenv("V")) {
> +        fputc('\n', stderr);
> +    }

Umm, this prints a blank line even if I run 'make check V=3D0' - do we=20
support V=3D0 as a way to disable verbosity, in which case you need to=20
actually inspect the contents of $V rather than just assuming that if it=20
is in the environment things are verbose?

> @@ -397,7 +400,7 @@ try_again:
>           }
>           g_assert(exp_sdt.aml_file);
>           if (getenv("V")) {
> -            fprintf(stderr, "\nUsing expected file '%s'\n", aml_file);
> +            fprintf(stderr, "Using expected file '%s'\n", aml_file);

But that's a pre-existing question, so it doesn't affect this particular=20
patch.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
