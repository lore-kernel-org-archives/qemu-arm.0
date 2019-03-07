Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7413137wrx;
        Thu, 7 Mar 2019 09:42:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxHV7w9My5qYr7Fin57Npty2EQHuAI6AerDBHeAZeFXmrWwh7G0ObMb9KHcphcmTHV6L6W
X-Received: by 2002:a25:bfce:: with SMTP id q14mr12034183ybm.231.1551980541248;
        Thu, 07 Mar 2019 09:42:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551980541; cv=none;
        d=google.com; s=arc-20160816;
        b=j9PZZ4wYVupxkwm0n8ckP416bdpdfr+s9RhzhF2YK0/GcNpFCzXKoJRhDWoWNAr5uV
         YGjanwt2uGDiMA5JNxIzSbJguRvNYQs5wvGO5DPTPpPJda0HjhJ0pDPEDJ2yOdMF3SLN
         RpRAJ8cOMSTwE3pWEQee+vdbpFsZRyECpMHrz33ZlUB2ulHryWL2fDDM7vVJv3No4wI/
         22fJkXUiW+Bw7TXx7guzY3MKxxcnGs3y+b08tyr0GYvhfJ9bVvzkhDPYX0wLw9BvGk75
         fd3RePU2GOVaqeQdq10Hvpt1KKTYoTuVu7ibC92p142Mo2GydW8WurYy3Rmu14iMI1cj
         5b8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=7u7dvR7rjyLV2i/8RluyTAyYvc/w5RpBxK2rgU690vw=;
        b=iQqTfFRlAc4WJOrOCa2Hwacr2raPg/TJqAGqcxwHtNecsyES9mf26IT6KCgPkhvDzA
         2EVmNrlj03oJXqt8m9DvBcsgz5N4EpzsJJNO+CpfcZyr8/WvgdTusCkVL7Ocecm0WLss
         xd/5l3y+DID8/WvlpCLC6YdRxQUKl1yoA73mQr7OGlwoLowcRnr2NKr5yzFu3Hxj8LQR
         Kap5Mg0h0WVHucdeOiWiEfDyFugnW1K13bmyD+OwSZ3UD7EOdDnUcmsecf31vsy0TrnV
         delDMX6yODeNZuDoyjWqmQ0NnUVThJLKOhzXlHTqmBZZY8XffwRHjwfGE3KOWA1KNWoi
         I5Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14si2865666ybc.393.2019.03.07.09.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 09:42:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1x2C-0003Z7-LP
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 12:42:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1h1wmu-0007gB-I1
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 12:26:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1h1wmt-000568-Lv
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 12:26:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51288)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1h1wmp-00050H-Vp; Thu, 07 Mar 2019 12:26:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5D3513AB0;
	Thu,  7 Mar 2019 17:26:19 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01083282F9;
	Thu,  7 Mar 2019 17:26:14 +0000 (UTC)
Date: Thu, 7 Mar 2019 14:26:12 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190307172612.GC8899@habkost.net>
References: <20190307090639.8261-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190307090639.8261-1-eric.auger@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 07 Mar 2019 17:26:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] machine: Move acpi_nvdimm_state into
 struct MachineState
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
Cc: peter.maydell@linaro.org, sbhat@linux.ibm.com, david@redhat.com,
	richard.henderson@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, imammedo@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JP5s8Tagg2TA

On Thu, Mar 07, 2019 at 10:06:39AM +0100, Eric Auger wrote:
> As NVDIMM support is looming for ARM and SPAPR, let's
> move the acpi_nvdimm_state to the generic machine struct
> instead of duplicating the same code in several machines.
> It is also renamed into nvdimms_state.
> 
> nvdimm and nvdimm-persistence become generic machine options.
> We also add a description for those options.
> 
> We also remove the nvdimms_state.is_enabled initialization to
> false as objects are guaranteed to be zero initialized.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - s/acpi_nvdimm_state/nvdimms_state
> - remove ms->nvdimms_state.is_enabled initialization to false.
[...]
> @@ -765,6 +806,20 @@ static void machine_class_init(ObjectClass *oc, void *data)
>          &error_abort);
>      object_class_property_set_description(oc, "memory-encryption",
>          "Set memory encryption object to use", &error_abort);
> +
> +    object_class_property_add_bool(oc, "nvdimm",
> +        machine_get_nvdimm, machine_set_nvdimm, &error_abort);
> +    object_class_property_set_description(oc, "nvdimm",
> +                                         "Set on/off to enable/disable NVDIMM "
> +                                         "instantiation", NULL);
> +
> +    object_class_property_add_str(oc, "nvdimm-persistence",
> +                                  machine_get_nvdimm_persistence,
> +                                  machine_set_nvdimm_persistence, &error_abort);
> +    object_class_property_set_description(oc, "nvdimm-persistence",
> +                                          "Set NVDIMM persistence"
> +                                          "Valid values are cpu and mem-ctrl",
> +                                          NULL);

As noted in another reply, I don't mind adding new MachineState
fields, but now I noticed you are adding new user-visible
options, which requires more care.

This patch seems to make all machines except PC silently ignore
the new nvdimm options.  If the current machine doesn't support
nvdimm, "nvdimm-persistence=..." and "nvdimm=on" should be
rejected by QEMU instead of silently ignored.

Probably the simplest way to do that is by making the
registration of those QOM properties conditional.

We could add a simple
  bool MachineClass::nvdimm_supported
field, or we could add a
  static void nvdimm_machine_class_init(MachineClass *mc);
helper that would enable nvdimm support on the machine type.

-- 
Eduardo
