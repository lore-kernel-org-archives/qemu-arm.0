Received: by 10.25.15.230 with SMTP id 99csp596967lfp;
        Wed, 22 Mar 2017 23:11:29 -0700 (PDT)
X-Received: by 10.237.53.226 with SMTP id d31mr692164qte.184.1490249489337;
        Wed, 22 Mar 2017 23:11:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o185si2931979qkd.40.2017.03.22.23.11.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Mar 2017 23:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqvy4-00018V-OK
	for alex.bennee@linaro.org; Thu, 23 Mar 2017 02:11:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharata.rao@gmail.com>) id 1cqvx9-0000mh-UA
	for qemu-devel@nongnu.org; Thu, 23 Mar 2017 02:10:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharata.rao@gmail.com>) id 1cqvx9-0005H1-0A
	for qemu-devel@nongnu.org; Thu, 23 Mar 2017 02:10:31 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:32986)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bharata.rao@gmail.com>)
	id 1cqvx8-0005Gx-SB; Thu, 23 Mar 2017 02:10:30 -0400
Received: by mail-ua0-x230.google.com with SMTP id u30so88522594uau.0;
	Wed, 22 Mar 2017 23:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dL1hE7WT1glJ2l2XvWTOlpdOpK+EJT2xxleb0Vgu6KQ=;
	b=UhjJ1GkvyUI17zxEkCaaLrio+YUaFnEpnmkWtqg7y/chdrZ0GL5J5T2D0Zml5Y60rp
	mZ2rAvnn9eitMmuQqWIdX8ixZ7rAoOi/D6jORbkb7OAWYctGREvMra6ZJ8HjQJvFZHct
	UvWQr6nZgIp850Y1tnIBxqq8yWZyebaSBqSoVSkQ7viWLXzy/s321WlEyZRaWDnFFMed
	73fD53PzQE0AA2UanmmwHFNE9Xa84cx8W4kZeySsWhivqQ5fzK4cmCO+1XQlX/0hbHDv
	nkIBhhZi7FxoCDKSiDI81LfqAxV1QxvFGa/cdjQNqBoX21i+xrqtW/nrfuAFFXM2rOzE
	9qrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dL1hE7WT1glJ2l2XvWTOlpdOpK+EJT2xxleb0Vgu6KQ=;
	b=UvCKOBMzdZ1ILNx5zq47wwnUjMltzQ34lZwFIZr3Wu0kiHAqH19fhvsS+ru+d/c8hs
	P55RdUvFN35GU1E5HqO6F10EsFRQErkvN3TCHp/Yna5O/IIFabJXMte5P56t+QVwshcb
	pMl3h6rD7SdrnqthZoSchzqv+aU/Q2yeb9Be56ZAlV7i53mNoBPiaQn1cQhlNgZ6oE67
	jsOiwXp2opEQFMn83Eqy4vZNLdzRE89LuDNOht2phgZVyQ1SjhZXXdZVKDIeHxfbk1pG
	gR/z7qx6EzXQO6FiOPDgpNPPUEx1NY2/E9E2rIDya8Mcl1HE2ODNINhglIIEc7e46qDz
	sXYQ==
X-Gm-Message-State: AFeK/H3gpX+g3Z/Jzl9USXEwgDja1JN3Kj1CVIQch/0OvrNK1OJu1bwbpcVvUCHqpdBqch1OBTH0ZKzn0KV1+g==
X-Received: by 10.176.0.44 with SMTP id 41mr413938uai.20.1490249430108; Wed,
	22 Mar 2017 23:10:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.197 with HTTP; Wed, 22 Mar 2017 23:10:29 -0700 (PDT)
In-Reply-To: <1490189568-167621-6-git-send-email-imammedo@redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-6-git-send-email-imammedo@redhat.com>
From: Bharata B Rao <bharata.rao@gmail.com>
Date: Thu, 23 Mar 2017 11:40:29 +0530
Message-ID: <CAGZKiBpD=uLyJWFPhxKYfn0-wLL2WYnUm5h4KJhZ_fVHi+1z-w@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::230
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH for-2.10 05/23] numa: move source of
 default CPUs to NUMA node mapping into boards
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZHsrgoZQ+JdK

On Wed, Mar 22, 2017 at 7:02 PM, Igor Mammedov <imammedo@redhat.com> wrote:

> diff --git a/numa.c b/numa.c
> index e01cb54..b6e71bc 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -294,9 +294,10 @@ static void validate_numa_cpus(void)
>      g_free(seen_cpus);
>  }
>
> -void parse_numa_opts(MachineClass *mc)
> +void parse_numa_opts(MachineState *ms)
>  {
>      int i;
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>
>      for (i = 0; i < MAX_NODES; i++) {
>          numa_info[i].node_cpu = bitmap_new(max_cpus);
> @@ -378,14 +379,16 @@ void parse_numa_opts(MachineClass *mc)
>           * rule grouping VCPUs by socket so that VCPUs from the same
> socket
>           * would be on the same node.
>           */
> +        if (!mc->cpu_index_to_instance_props) {
> +            error_report("default CPUs to NUMA node mapping isn't
> supported");
> +            exit(1);
> +        }
>

Just trying to understand the impact of the above enforcement. So targets
and machine types that don't define ->cpu_index_to_instance_props() are
expected not to boot ? Shouldn't they have a default to fall back upon ?

Regards,
Bharata.
