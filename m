Received: by 10.223.159.74 with SMTP id f10csp2393567wrg;
        Fri, 22 Dec 2017 07:33:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBosqFeN/rrfifvymCrq0fhUrnMrn9u55UyEyM/O5hPWBSVXuEN4pwrUtIzHKabx6RYnu3F7+
X-Received: by 10.37.191.209 with SMTP id q17mr11069562ybm.163.1513956804557;
        Fri, 22 Dec 2017 07:33:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513956804; cv=none;
        d=google.com; s=arc-20160816;
        b=OnprQD68hroDJfzM4R7ZyYmHsNSYic2fDAkg3Y/9F2udguJC14nDfkBaWIK4vbkFKI
         aK6m9dI0rb/if9ynOLPkuklx7BeB/b4SVxv2WRbBsGy3Y++ny1tWApOcp1s663VYNx77
         sUpzd89L7Q9ObeyxWKaZAxjixpwJ86sHUjHVM7s7uoHaTCJO5mVflMjEjARZqmleYfnq
         mfCIKCawyzSfn4oaSacMLRfuwMVh9NE7NhCne17+i7/EOhiT6a6kIULZMoSfddIzWRmY
         nI6mYvjzAFgQf5xtcqKHKZV3wfvsUsrcZGZUsjRHAHGexTsJICjrZYMdU95g5cNB2gRc
         FilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from:arc-authentication-results;
        bh=1YsNF5AYMTZWVqjdZZPdJfLRc7Rm7Ef6SLGKC6Zyp/4=;
        b=Wm3SDOp6t5DepvCplVAHAH/5U1ScpDooeCNHy0DZv4NveFgvTRRRwETxfX+ecxeLTG
         Wq7X1XmjvosMAQFjZY+J9muTWuUOq92eyAxcZ0+JEjeKgE4+yO75drpQpdzjxQij9DE4
         7HJ5gN+m5833Y07k6daBPb5+zFteMN9OXP8kp9RrZ0P97Afi3FF1zZ7JtHYuA+P78vQ4
         RgZj4ONZvp7A2EmEwhxspFhjPFHYkGmz3EyZ66fN08FXa8RMNlPqTZRtCDaAteMwhJSk
         t8Uoa8jLFwXy2E54s/GdLvPDA2/PRVkxI0ZSDEBCAgCux8KEHqUGTb4MTPx3AV+VIgvr
         XTDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j10si4190396ywj.84.2017.12.22.07.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Dec 2017 07:33:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54483 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eSPK7-0000qE-Vs
	for alex.bennee@linaro.org; Fri, 22 Dec 2017 10:33:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eSP8I-0007RX-39
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 10:21:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eSP8F-0003sH-5H
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 10:21:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1eSP8E-0003rn-Uz; Fri, 22 Dec 2017 10:21:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BADE30A085;
	Fri, 22 Dec 2017 15:21:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-74.ams2.redhat.com
	[10.36.116.74])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E678046E77;
	Fri, 22 Dec 2017 15:21:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 707AC1138645; Fri, 22 Dec 2017 16:21:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
Date: Fri, 22 Dec 2017 16:21:04 +0100
In-Reply-To: <6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	(Alistair Francis's message of "Wed, 20 Dec 2017 09:23:01 -0800")
Message-ID: <87y3lun5zz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 22 Dec 2017 15:21:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 04/29] hw/arm: Replace
 fprintf(stderr, "*\n" with error_report()
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
Cc: qemu-trivial@nongnu.org, alistair23@gmail.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LKc6C6p/aASA

Alistair Francis <alistair.francis@xilinx.com> writes:

> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.
>
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|erro=
r_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_=
report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_repo=
rt("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report=
("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("=
\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1=
"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\=
2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2)=
;|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|=
Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig=
}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}'=
 \
>     {} +
>
> Some lines where then manually tweaked to pass checkpatch.
>
> The 'qemu: ' prefix was manually removed from the hw/arm/boot.c file.

Elsewhere, too.  Suggest "The 'qemu: ' prefix was manually removed from
several error messages."  Perhaps this could be done on commit.

>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: qemu-arm@nongnu.org
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

With the commit message touched up:
Reviewed-by: Markus Armbruster <armbru@redhat.com>
