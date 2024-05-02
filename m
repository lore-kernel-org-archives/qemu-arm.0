Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1122995ejy;
        Thu, 2 May 2024 05:09:00 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU/faxkDpSxwjTAzjdh5vG8Qxuf+q6cX1xjf1HPvAiC191rHFTlnTdmcX3+Z3texOv0nUsNbOeb0vmbGMKjs52iDhUsQCRU
X-Google-Smtp-Source: AGHT+IEEHuHExIEeOt5vw0l5GTSc74NEcmMkrNfy3NNwxaH94G8Pm7Ak5m8OKvgS9u57ep7biPmC
X-Received: by 2002:a17:903:2302:b0:1eb:76ac:b4e5 with SMTP id d2-20020a170903230200b001eb76acb4e5mr2502796plh.49.1714651739939;
        Thu, 02 May 2024 05:08:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714651739; cv=pass;
        d=google.com; s=arc-20160816;
        b=eDrsLBOUUOgLz0mZRMO+j6wRBVJv5swG/6hfHIsJDBjrQ0G0KmhtFri+np1H+e3/kI
         VxgudMYHYw8r5FoSGznd9t9EwmaTQPJ1K++5lGQH4OCVzDrpGe5w8pSfpkShKUjXW5/a
         0qsdyB5gB7On94dY1CiN928I3AHGJ4kZw0fNbqT1GEjqvW0h8GY96I7pVcB2GCAFB340
         dj51Eyqlmwfhxt209DKO+iDYWhfJoWHUdrugrO4l0f5yanyGFhkQI/hB3jcfo4jnCYlJ
         mGJB84bqrPFJ55tX4WZqJ3hoJN9tNT4ok14P0MQ6QVzHs0Phmfg5KcQELiPtVbXdRVOy
         V0ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:list-unsubscribe:list-subscribe
         :list-id:precedence:references:reply-to:message-id:subject:cc:to
         :from:date:dkim-signature;
        bh=utvNDTrYwaJdLBcEMeei/KBGGo5NEwIoFRoals6gm0c=;
        fh=Yd/urZFZg7Xi3R8XFtpVp7/8zJiXDJBNuMkGMngw7lQ=;
        b=Fs5H+HflXrHU7uR03h3Rm7twvx0GKTmeGJKXJMOd7m8sV4PFlBg9lKbFFGM2Dl08YV
         fl9Va8j98TNkTOpWXUwNNf8hk8wzmH9ZuDu0loYwl9cOXjq09gwC4b0iYg/9MCJnXwGJ
         icoW6jhGQ+plaWfkyY++qtG1g29BsRllmn3QHSycBiqZmMm/DqWFZta0FVUqUrDu/jlT
         DNoWfoDGrustcouWIhE06Op98CyowdKlt/A9dCWrLBFiBi8ms/gbWaYcTo9JCmsPZ/f3
         y+q5CT219/L4A9BxE5F3NlQ+CzXP5Z49cNBB9Gm7nhYAxnmrG0AbEqMmy6Ilg0MhOXer
         FfVw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="a9Y/Dgvc";
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-16410-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-16410-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-16410-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id u9-20020a1709026e0900b001ec4d5f623bsi868976plk.246.2024.05.02.05.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 05:08:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-16410-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="a9Y/Dgvc";
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-16410-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-16410-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82EEDB21B51
	for <alex.bennee@linaro.org>; Thu,  2 May 2024 12:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2D16341B;
	Thu,  2 May 2024 12:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a9Y/Dgvc"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340744374
	for <kvm@vger.kernel.org>; Thu,  2 May 2024 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714651732; cv=none; b=Tv6BWsGv2eZJNf15XNGQNidDst0PTBFsLNblax/m174viuxFg/Qrvz7pGkMU0Bqr3EYJcMroO4rwvB6U2hibSmM37eNOGjral3RNdNxGI88OmtTy/rduo1R/579oHf1Mk78FnBxcv2Ue90/3OwISBP5703KqCRHzlsaoblnHSOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714651732; c=relaxed/simple;
	bh=5kblpRXC5sAqTNbcCQXjvgo5N1z61rrsj+fnVaA7prc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bc31MEO2HXwF+ROBzl0AQeZdsxgORwVIUGXdMgf5hxmDCf8vQWgrCwO9dFum5Lp7YHYeSGvxJNOtsHLuusRkuvs1SXMyxdGuGYcVaO+bQTqYqNeuFGEciurvxrbp5YlA3VCU7CY9B0FJlyFfGGsGqx0nXc7O1DEIkebwruUO8V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a9Y/Dgvc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714651729;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=utvNDTrYwaJdLBcEMeei/KBGGo5NEwIoFRoals6gm0c=;
	b=a9Y/DgvcWYtiS4Zn4S7Bn7A1QQSsmUjSuINl2seNwgr7AS+tJdWhHd9YSSM/PAG6XsEldf
	F9A8uHVdVcyQF029rW/o5R+YGzb2GhyOXNAJ72k694egorgcBgTaN7XyXKICbG/b4TmUaH
	0+JA9j3+rIn4owOEqJGVJ4pHCnLjYMg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-ZO3HT5-aOQOKzyqnwoWgNA-1; Thu, 02 May 2024 08:08:46 -0400
X-MC-Unique: ZO3HT5-aOQOKzyqnwoWgNA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33064101157A;
	Thu,  2 May 2024 12:08:46 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FBBC400EB2;
	Thu,  2 May 2024 12:08:43 +0000 (UTC)
Date: Thu, 2 May 2024 13:08:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
	devel@lists.libvirt.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v4 01/22] hw/i386/pc: Deprecate 2.4 to 2.12 pc-i440fx
 machines
Message-ID: <ZjOCSUdwB9GZV7d9@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240416185939.37984-1-philmd@linaro.org>
 <20240416185939.37984-2-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240416185939.37984-2-philmd@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-TUID: OQRJ8fLbFVqi

On Tue, Apr 16, 2024 at 08:59:17PM +0200, Philippe Mathieu-Daudé wrote:
> Similarly to the commit c7437f0ddb "docs/about: Mark the
> old pc-i440fx-2.0 - 2.3 machine types as deprecated",
> deprecate the 2.4 to 2.12 machines.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  docs/about/deprecated.rst | 4 ++--
>  hw/i386/pc_piix.c         | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

FWIW, this patch is potentially obsolete if we go with enforcing a
general deprecation policy for all versioned machines:

  https://lists.nongnu.org/archive/html/qemu-devel/2024-05/msg00084.html

If this series merges first though, that's fine. My proposal can
easily be rebased on top of this.

> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 7b548519b5..47234da329 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -219,8 +219,8 @@ deprecated; use the new name ``dtb-randomness`` instead. The new name
>  better reflects the way this property affects all random data within
>  the device tree blob, not just the ``kaslr-seed`` node.
>  
> -``pc-i440fx-2.0`` up to ``pc-i440fx-2.3`` (since 8.2)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``pc-i440fx-2.0`` up to ``pc-i440fx-2.3`` (since 8.2) and ``pc-i440fx-2.4`` up to ``pc-i440fx-2.12`` (since 9.1)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>  
>  These old machine types are quite neglected nowadays and thus might have
>  various pitfalls with regards to live migration. Use a newer machine type
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 18ba076609..817d99c0ce 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -727,6 +727,7 @@ DEFINE_I440FX_MACHINE(v3_0, "pc-i440fx-3.0", NULL,
>  static void pc_i440fx_2_12_machine_options(MachineClass *m)
>  {
>      pc_i440fx_3_0_machine_options(m);
> +    m->deprecation_reason = "old and unattended - use a newer version instead";
>      compat_props_add(m->compat_props, hw_compat_2_12, hw_compat_2_12_len);
>      compat_props_add(m->compat_props, pc_compat_2_12, pc_compat_2_12_len);
>  }
> @@ -832,7 +833,6 @@ static void pc_i440fx_2_3_machine_options(MachineClass *m)
>  {
>      pc_i440fx_2_4_machine_options(m);
>      m->hw_version = "2.3.0";
> -    m->deprecation_reason = "old and unattended - use a newer version instead";
>      compat_props_add(m->compat_props, hw_compat_2_3, hw_compat_2_3_len);
>      compat_props_add(m->compat_props, pc_compat_2_3, pc_compat_2_3_len);
>  }
> -- 
> 2.41.0
> _______________________________________________
> Devel mailing list -- devel@lists.libvirt.org
> To unsubscribe send an email to devel-leave@lists.libvirt.org

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

