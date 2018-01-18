Received: by 10.28.173.206 with SMTP id w197csp6888354wme;
        Thu, 18 Jan 2018 11:02:17 -0800 (PST)
X-Google-Smtp-Source: ACJfBouH3rheVa3mKcO+XsfGqTbFv1Sw8Jen0SjSasCvDHthBrKpeNo3lBIMBGkv6uoKBcmnm99a
X-Received: by 10.129.115.198 with SMTP id o189mr5978732ywc.174.1516302137475;
        Thu, 18 Jan 2018 11:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516302137; cv=none;
        d=google.com; s=arc-20160816;
        b=mepAujb6+5p5K5FGEXH8hUjZCSJOjjTWKXuV4W7iU//L/BJ7awIerZEFWT1x8f+UIV
         5QsFahKiATpmGdhAT1vDu83HlqTfg6r291j/iSKhbv4uVsZCtHoMQsC5mmc/catkCa0Y
         JkoL0PGrkY0AZJVFKJn3ZDpKkN8oeNUqOpjKVVCmHWkHUuVi6v9f/LOrDpuQTwITXu/Q
         S7fC2GElGZxfJFkr6Fr3YqoCROha4KgMgVRu8kJESzqNQsMET0foiFCGxoHwxqMpSA1P
         dKEKaQX55xMFjoHVCU9k2arXGo5liPsnOR5fmEI53NS2NBYTnA0yW8Y/HBNTi1uxrOtG
         bYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=EZQ47VpkHawiQvNU0vgcsiivsYTfq/VNXfvZxt9tPBA=;
        b=yWyWbIuVhI2GGQEzc8cQ/OEGgdy7T5X1dm3O+ooDJY0AW31qBA0aycgN+UZfiZWEio
         MjgeDopuYVl2EDEh+3WBemg4xBGr0hrdPCURzXdJo6Y5wup+HhQtLIMp0gJsgSctNMou
         BEmTQ0Zr5K0a96VFhsilOAG9gvSIinywlaTGUKETPDFZp/qd5oeqLQ3TNQI6sJlAaHrB
         iXsxEE35wjUhUKoZzst7EI5aH111/X7PWpqXhNy6N2wXTJ2Sbdpqaq7sQA1MuaYPIcd1
         v1gNquTZVGkwBljkdUHUNefEctriGsQqQTFZhynqUStvz/krRuK8schsjQQtut1I190H
         3YAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i204si1863676ywg.220.2018.01.18.11.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 11:02:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecFS4-00065v-SY
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 14:02:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ecFRo-00063y-UX
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 14:02:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ecFRl-0005LM-2r
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 14:02:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54816)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ecFRk-0005LE-Sa; Thu, 18 Jan 2018 14:01:57 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B726C9FFED;
	Thu, 18 Jan 2018 19:01:55 +0000 (UTC)
Received: from [10.40.204.87] (ovpn-204-87.brq.redhat.com [10.40.204.87])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3093D189CE;
	Thu, 18 Jan 2018 19:01:46 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
	<1516296842-136976-2-git-send-email-imammedo@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fdf04c18-457e-3208-c464-11eebd142c54@redhat.com>
Date: Thu, 18 Jan 2018 20:01:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1516296842-136976-2-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 18 Jan 2018 19:01:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-ppc] [RFC v2 1/5] tests: add machine 'none'
 with -cpu test
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DHjdvoZc3+zk

On 18.01.2018 18:33, Igor Mammedov wrote:
> Check that "$QEMU -M none -cpu FOO" starts QEMU without error
[...]
> diff --git a/tests/machine-none.c b/tests/machine-none.c
> new file mode 100644
> index 0000000..d16c283
> --- /dev/null
> +++ b/tests/machine-none.c

Could you please name the file with a "-test.c" suffix, so that the
"*-test" wildcard in tests/.gitignore catches this, too? Otherwise
you've got to add "machine-none" explicitly to the gitignore file.

> @@ -0,0 +1,71 @@
> +/*
> + * Machine 'none' tests.
> + *
> + * Copyright (c) 2018 Red Hat Inc.
> + *
> + * Authors:
> + *  Igor Mammedov <imammedo@redhat.com>,
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qemu-common.h"
> +#include "qemu/cutils.h"
> +#include "libqtest.h"
> +#include "qapi/qmp/types.h"
> +
> +struct arch2cpu {
> +    const char *arch;
> +    const char *cpu_model;
> +};
> +
> +static struct arch2cpu cpus_map[] =3D {
> +    /* tested targets list */
> +};
> +
> +static const char *get_cpu_model_by_arch(const char *arch)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(cpus_map); i++) {
> +        if (!strcmp(arch, cpus_map[i].arch)) {
> +            return cpus_map[i].cpu_model;
> +        }
> +    }
> +    return NULL;
> +}
> +
> +static void test_machine_cpu_cli(void)
> +{
> +    char *args;
> +    QDict *response;
> +    const char *arch =3D qtest_get_arch();
> +    const char *cpu_model =3D get_cpu_model_by_arch(arch);
> +
> +    if (!cpu_model) {
> +        fprintf(stderr, "WARNING: cpu name for target '%s' isn't defin=
ed,"
> +                " add it to cpus_map\n", arch);
> +        return; /* TODO: die here to force all targets have a test */
> +    }
> +    args =3D g_strdup_printf("-machine none -cpu %s", cpu_model);
> +    qtest_start(args);

May I suggest to use qtest_startf() instead?

> +
> +    response =3D qmp("{ 'execute': 'quit' }");
> +    g_assert(qdict_haskey(response, "return"));
> +    QDECREF(response);
> +
> +    qtest_end();

... and that should be qtest_quit() if you use qtest_startf().

> +    g_free(args);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("machine/none/cpu_option", test_machine_cpu_cli);
> +
> +    return g_test_run();
> +}
>=20

 Thomas
