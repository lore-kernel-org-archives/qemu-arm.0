Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1229232wrp;
        Thu, 14 Feb 2019 09:17:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib+A6e5p8ms/BLPD2MFRUhWDzDaVBBb229l4geTeNShPmozTWGp6W0QTx8MTWkEh5d5Nx/I
X-Received: by 2002:a0d:e2ce:: with SMTP id l197mr4135010ywe.226.1550164654495;
        Thu, 14 Feb 2019 09:17:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550164654; cv=none;
        d=google.com; s=arc-20160816;
        b=omZ8KmWGnBX0J2ex11nDt4NZ+I6PC4OR2wAM4Ur0MtagBS1XGTl7C9nlNhipYyNBAl
         LmPZ1RxMl6WF3P4B/mVZ8O6m39U13esLvHMGt20oMEQvpbj5/QVlPYDntV8/YhzU2rAh
         KKtckIc1ZUDj0/e8+FrVIavR18flVE5Vx+XYbrILdpHXVXdhwVY5M4AC30mjKt2gzgg1
         ld/YjAjpqbBA6GbkYeDqp2jFwyAVG61jCKf9wUVsMWXFLeeAb3oB4tAKUYB7M+aeHBsV
         TQKWPk+809gc4YAEQOfKDMQsBz31eLcXgtn9+E5WBJfgJvnFr4yTfdgFCr1fPqo4WUkV
         eJLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=21Ijv48zcDVCWyaJxev6XT5GZCUuMngXlYCPr6l4mH8=;
        b=nKuebLR6EHMXWsQXxDmW/zYe13A8gsmHq1H7YLz75aG2/Lw2zQuJ0RsaF8T6YplnvF
         YE9KfslBL3LmoWC0j27I/XKVdt5Ibj060VG5f3f3BsxY6vcndOgEoXEpcKsgaowrhv3H
         tUtGKyOFfXhIjM1HQ+3oOUyKyjAPpBRBn5DrlZWj+aVQzoKjI5LyPiSp5oM4nWT428bS
         5/IQsZVjp7bxm4JnutgRF+pGvVP/aRbjQaoKSTc03UWsVQStHE3mjKPlinrMyzMyLU1e
         ERYxZAr+G5iYwQhyFLekGEOcQm2ubloGLeyQ1w4+EYEWoi0ZJWcIOfbwjo2JTdOKhxMK
         O5fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eNE5AIDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si778390ybj.15.2019.02.14.09.17.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 09:17:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eNE5AIDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guKdh-0006jj-Qs
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 12:17:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKdW-0006ia-1v
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 12:17:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKcs-0000mc-Lw
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 12:16:43 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36010)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guKcs-0000kL-Fn
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 12:16:42 -0500
Received: by mail-ot1-x342.google.com with SMTP id v62so2939290otb.3
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 09:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=21Ijv48zcDVCWyaJxev6XT5GZCUuMngXlYCPr6l4mH8=;
	b=eNE5AIDd/1sq8H/JPN34D6jaF4bve8mNOpImp0hBbYvgSumFY4MIjPMZUl7b0Co12s
	RlEDkNUZUzQ7wuFhs8CjS0WnCVhA9sEXx7fRiVwZdShdsJbq7favBzSgJOb/julG/MgN
	TcApRIzgEQ+rHau+FV8Mja3NRuGCx1uKTgE2vxbk7wAxq8jPRP18vembPC9GW9DGOtxE
	emMPewz0Rzv0sJmIzx8VEnHpwLr2wca/5IBxXGDdbkNt3NkKh3y9eT1RqdXePIxgh48i
	NnqlzE8UZSK7qQUTViQecY4VCYtVpZE1Mt/WgW/d//ADIGzrJYNR8AcJMzHtRg2OLYm8
	VppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=21Ijv48zcDVCWyaJxev6XT5GZCUuMngXlYCPr6l4mH8=;
	b=ecJ+PbrAVIWKIR/8ixeLeulpnJaAzdb+EcPWYp8D6LUmiEvvd5HbGmd4WXYSGZqU4n
	lB8eQcsnbhKxodoOp++wOpJXOsCoVb2mu3zpFc7efvd9XS2V5b063peTAly52kbbew43
	d8Kwuqfzmct3lWUZ+GpkxuvN2vyhEbowJavufVy6z5TyaxleQlE2ZJ/nziecRUCBbATd
	nDQkMTW9kAV3zVbNVcP+xWQ1YiqvQfI4ooG2y64kwCVXeiWj7XE3nd2aHU53ApJE3+Dk
	/rgOJ+jLh8HozhBwnbWYZrRW/G7BAATSTgNcbeLP2xUYl0/SA5AS1tMGxSmD1x6GQy1t
	M8ug==
X-Gm-Message-State: AHQUAub+xseeVS/2LN4B+krFu5Fls2A82wWFBLbwMm/b7YRJfwkVG61j
	j6KQsZAinSbihftdJ0nIB1heys0Ybe20n7OBYfQjAg==
X-Received: by 2002:aca:1813:: with SMTP id h19mr2892837oih.146.1550164601757; 
	Thu, 14 Feb 2019 09:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-9-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-9-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 17:16:30 +0000
Message-ID: <CAFEAcA96jCVKkX8NwaZhnzEXkJBU3Djr3ivAUJWzdhtv+FOaiA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v6 08/18] vl: Set machine ram_size,
 maxram_size and ram_slots earlier
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
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JWa3hcF2Wv3o

On Tue, 5 Feb 2019 at 17:33, Eric Auger <eric.auger@redhat.com> wrote:
>
> The machine RAM attributes will need to be analyzed during the
> configure_accelerator() process. especially kvm_type() arm64
> machine callback will use them to know how many IPA/GPA bits are
> needed to model the whole RAM range. So let's assign those machine
> state fields before calling configure_accelerator.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v4: new
> ---
>  vl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index 9cf0fbe0b8..28f6bbebe2 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4324,6 +4324,9 @@ int main(int argc, char **argv, char **envp)
>      machine_opts = qemu_get_machine_opts();
>      qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
>                       &error_fatal);
> +    current_machine->ram_size = ram_size;
> +    current_machine->maxram_size = maxram_size;
> +    current_machine->ram_slots = ram_slots;
>
>      configure_accelerator(current_machine, argv[0]);

This is still after the call to set_memory_options(), so it's OK.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
