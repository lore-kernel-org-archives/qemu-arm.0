Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10668219wrt;
        Thu, 6 Dec 2018 06:10:03 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UcW+tqaMgZv3ywpH5kzEe50DFWBfWoK/SslDG8/KcZma0QkUINB2O+dEa427/JkG2f/XLd
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr8797887qvq.55.1544105403297;
        Thu, 06 Dec 2018 06:10:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544105403; cv=none;
        d=google.com; s=arc-20160816;
        b=RMUZJlLuyUag1fBiBkA/toxJNfJYp3gChDvGTNpEqEcqBpDt8KLvv9eADqqj7LsyCF
         W4KAWk2DDw6kl34zEdLvkHV8FbdnU4Am2iUwqnDF8XrQhhB0UTOIbOXFBC8aIhXmCuoW
         crnHZTe3n/ttbRTtYlakWSWLhnY4i2qOd5Y1c0aR8jwzrzIyXJ1QNUFTx8gsOse1sGbL
         vlLIcpgUW5AaDEbC18col+lazJYnjl6hFjgMtjT2i4qA0XHQzmNFJXowc3zo+HnotU2p
         s4TqpYzgC05lj81HjBnjRt+vM79GDVzlkHyQ7BefOdSusZKCWCOnlJ10fQ/b/Fxd8ilB
         dwow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TG3ZdnRNofRzXXBETRDO6KJhpOz9g9lY8eIHQHqYVpk=;
        b=i24d4kfTs6WPw5vPuJCulHkZYx5Y3OoHimOHBgOhs+6GAmpZnM/EuDY0vThL15BXj/
         4sMGKTd5+RTatMV86l8PKOps4iaLqYIgF4dhX2wlNYLdj1uRL4MKbQxyAO7YmFOC0RdB
         kisrXYBFVMJEDMrlgpJ+kTQqxEvdap8hztpUTsUc7HbALVBq515tn92y2XzCQkwzts4N
         vwFxo705dFAdRoX+f9eCT1oorPLO+ZHKDm3yQddQVN/V+3/nmyD5TYR8RnXsTehrQlgS
         QYI1/eiw1bgn63NWBIqdLRFFd0kxBmgOaBwYizPPP+eMV3NJdYc91COuJWTCTfnh6Q5O
         thtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KON9DDfF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j5si295541qtd.148.2018.12.06.06.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 06:10:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KON9DDfF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUuLq-0000NI-OW
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 09:10:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUuIt-0006LX-LW
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 09:07:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUuIs-0001CJ-Rg
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 09:06:59 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33925)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gUuIs-0001BZ-Kb
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 09:06:58 -0500
Received: by mail-ot1-x343.google.com with SMTP id t5so512833otk.1
	for <qemu-arm@nongnu.org>; Thu, 06 Dec 2018 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TG3ZdnRNofRzXXBETRDO6KJhpOz9g9lY8eIHQHqYVpk=;
	b=KON9DDfFC9xicXHg6CvFV5BixgaPnIQLMsiHT3rfdrD/sxyNfS8nraBpXGrWsp1C7P
	XCKH7G0iazSy5d60jzQsYycYzUc41fD9X7xLN5GMQBP2ww3bI0DOwDHdVYzEhmDUc1Ls
	w1XWgVX0FFI/lRkkUmGPGE3jxJjOEXLyH476Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TG3ZdnRNofRzXXBETRDO6KJhpOz9g9lY8eIHQHqYVpk=;
	b=By0DWJBx3s25iDgmxrVxFRGAC9++agz2KIV0O619r5tOLKsMoinZZyiRvVv9BC4oJ4
	toqjb1b5tPEKj3tcNQXfdD/NajkGB5lWze0WeTnJeD6ZkQBxLPNHbYAhKBIFs8+91Gv4
	jZ9W5puIWwjeRcXmkfUk3z42E4xAIL1x3Hgj6FjF3V2vjtqevODSz7YEBgVwpZEoIBvq
	fhZYA+c3PSSC8BSrSicvCXNghg3JmWq77Sq+VDUzm1fT3DUBiDLpSLj/RA68K4xZaHCN
	De5hyPbZpa0U5HoJDTciMMGBSbDCz424s4SErG4gdfXul3EqbepblWa6vyG2M25sUSZm
	IOpQ==
X-Gm-Message-State: AA+aEWZIR0AE3UcLKhutZYrcqrPKqQNAx0HAsLYfBLzz7Q11Opb53G6c
	hN440gQFRcw4iRUC5a49QTcD6cE6hpaa/sZIwSfCEQ==
X-Received: by 2002:a9d:3786:: with SMTP id x6mr15423927otb.238.1544105217862; 
	Thu, 06 Dec 2018 06:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20181205205827.19387-1-ehabkost@redhat.com>
	<20181205205827.19387-2-ehabkost@redhat.com>
In-Reply-To: <20181205205827.19387-2-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Dec 2018 14:06:46 +0000
Message-ID: <CAFEAcA8hxO_2+R-Y2aEa9HzbLnsHedcErAWAwMDw5mJRq+mcww@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH for-4.0 1/5] virt: Eliminate separate
 instance_init functions
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k+HCd7Oerggs

On Wed, 5 Dec 2018 at 20:58, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> All instance_init functions for all virt machine-types run
> exactly the same code, so we don't need separate functions.  We
> only need to set instance_init for TYPE_VIRT_MACHINE.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  hw/arm/virt.c | 87 +++++++++++++--------------------------------------
>  1 file changed, 21 insertions(+), 66 deletions(-)
>
> +static const TypeInfo virt_machine_info = {
> +    .name          = TYPE_VIRT_MACHINE,
> +    .parent        = TYPE_MACHINE,
> +    .abstract      = true,
> +    .instance_size = sizeof(VirtMachineState),
> +    .class_size    = sizeof(VirtMachineClass),
> +    .class_init    = virt_machine_class_init,
> +       .instance_init = virt_instance_init,

Indentation looks like it's not quite right here.

> +    .interfaces = (InterfaceInfo[]) {
> +         { TYPE_HOTPLUG_HANDLER },
> +         { }
> +    },
> +};

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
