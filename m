Received: by 10.28.71.27 with SMTP id u27csp4322569wma;
        Tue, 6 Feb 2018 14:13:42 -0800 (PST)
X-Google-Smtp-Source: AH8x225+DJCP4eM/s0mev7qUbc4vFVPll6r3rkbten1/dWm2Il7oxXIbxBUOytSgkUS64koMrmcm
X-Received: by 10.37.103.198 with SMTP id b189mr821444ybc.199.1517955222828;
        Tue, 06 Feb 2018 14:13:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517955222; cv=none;
        d=google.com; s=arc-20160816;
        b=Ir+7KWIcTuOumueZQwTDXOW4eksZO41DGdU4OuKm5raYDIe0wUC+gUQdelSCa0z2/k
         4ioAXI+4PeeWMWh4XwkrpvBuSgCn3HgrcnehOa7n6nUhuDBA5uU1VuOtmB91p9polYNt
         8tWW6VMMCm9x7lA+OjqRAgToHZjfo1wTGL+NK1zji0RYBAUUcsMmGwMR1oyxZ4jEvgg7
         EKoh8THUrNLDImlyhNiOF/OgnpmJMIBngqIDS3Por0Bi2sXiIU8bcC8LIObxu3+gr/6o
         F6apjnMER3ec2zJgtD4C8SH7eAhnuIv0QmzcdZSBxBbDFJ/K8W7O5zrA2lFRbhTc4svu
         yLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=E0UtkbRbAbCjTBlfJslaZdVWvU8T3T/NhdVdyFhOnWo=;
        b=yqNSehy5n8vpMZP4HEPtNipEwjk15TZak1aIaSr9+wD9f2F1fy6+zjFIJO6zUpjdGF
         aW1S3w6C3jWoCmNCiAGDEZx0gVGR6sftFg8WJK1ytrhreKksE4WvvGKaBFCjlYHpDyyn
         wq0OHmm0olB0tVte+CMMic4sTQ0eHl5MXXLN0Skpcu7Ba+5pYsowhdrYnlezlVOcXcpn
         WfWunzAdmguL5qbTVm75+uEGcVhR2wlEqRbs+Udwa/GSqWFl/9E9YEITr2FYYQZFXndG
         kJbVBki4yU0twoqbHucxcrfmfd1WWxHsaui0ZW3j/rPO4bwcwNrqtE7VY/P7q5A+CBcB
         6V9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g66si613ywa.650.2018.02.06.14.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 14:13:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejBUk-0004qK-8X
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 17:13:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejBUa-0004pD-SQ
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 17:13:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejBUV-0006s0-U2
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 17:13:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38024)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ejBUV-0006qT-Nt; Tue, 06 Feb 2018 17:13:27 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1519C5F7B1;
	Tue,  6 Feb 2018 22:13:27 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E65D60A9D;
	Tue,  6 Feb 2018 22:13:26 +0000 (UTC)
Date: Tue, 6 Feb 2018 20:13:25 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180206221325.GB13301@localhost.localdomain>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<1516694904-64879-3-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516694904-64879-3-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 06 Feb 2018 22:13:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 02/25] tests: add machine
 'none' with -cpu test
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rWnJOMfKeI29

On Tue, Jan 23, 2018 at 09:08:01AM +0100, Igor Mammedov wrote:
> Check that "$QEMU -M none -cpu FOO" starts QEMU without error
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v2:
>   - rename file to machine-none-test.c (Thomas Huth <thuth@redhat.com>)
>   - use qtest_startf()/instead of qtest_start() (Thomas Huth <thuth@redhat.com>)
[...]
> +static struct arch2cpu cpus_map[] = {
> +    /* tested targets list */
> +};
[...]
> +static void test_machine_cpu_cli(void)
> +{
> +    QDict *response;
> +    const char *arch = qtest_get_arch();
> +    const char *cpu_model = get_cpu_model_by_arch(arch);
> +
> +    if (!cpu_model) {
> +        fprintf(stderr, "WARNING: cpu name for target '%s' isn't defined,"
> +                " add it to cpus_map\n", arch);
> +        return; /* TODO: die here to force all targets have a test */
> +    }

I'm unsure if it's OK to purposefully have intermediate commits
that will generate warnings on "make check".  It could confuse
people doing bisects.

I would prefer to add this warning only after all targets are
converted.  Or maybe only add this test code after all targets
are converted.

-- 
Eduardo
