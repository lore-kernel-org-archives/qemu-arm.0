Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp109034njb;
        Thu, 27 Feb 2025 01:51:06 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCW7Bggyf2sWejezsvnfCzAh1mTBB8WakLQAFlMUHK9HMo3YTrDoMf1CzTR0VROAtKLOj4qhu5jDu+rrlA==@linaro.org
X-Google-Smtp-Source: AGHT+IHNkHkraYQciFQe42EscJ31ENQqT7LcPVY5jfBZfQmYem9FBcWLihNlz+uxivIMyaloMSOU
X-Received: by 2002:a05:6a00:3903:b0:725:cfd0:dffa with SMTP id d2e1a72fcca58-734790a7df1mr14694996b3a.5.1740649866024;
        Thu, 27 Feb 2025 01:51:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740649866; cv=pass;
        d=google.com; s=arc-20240605;
        b=IRvsXFsZg67YIcy4b0ngMwOxcarNn3xzEDD3YW/+ccFxnznr4HTrncb6aV5LHcztaS
         lQqdgEgAorkjqe/wuz4CZ5mQH0b3+8XtHItEdy42udEYnpw8ZDhwvcHFgCIyYjAo5Dap
         RtX1xnI3EeUmJEtwtwa44aKNFOTaOmesyBvBvV9RlfMNpqjVicylA7t6hdQJ9PCD1QNz
         +Tq+MOBYSEclO6XwOnTijKVkMgNEh6v+4oNnIyYPwn9/vVRjJRACXBLsR6+DEcN9QRht
         7e15Er7mvyyaQdmUMDRVvJFKZExJZgFjAJEWHf+0t1sA3WvYR/iPfqarU3ebhyMo5v3K
         QGfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=LWAZvimGNk1tF+ANGXTAMRK6KN/D4dhCfoJh3bD4+uw=;
        fh=szgN8crarefwNg4KxIyo6VFPF0+hqIg9G0fOSz5V9Cw=;
        b=ShcoqYzCJEtsGvOqjnvucdh/Ob1KZsoV3O/hezJrwl23PZvZG7aHER0Jq4ehpZ5Hb8
         TI4Jg2MvfYkW4XNyxezla5/OwYwr0sG911OoOeZ9V+iZXrnq1pHozOsqiGUeP/MqGRyQ
         itqw1JJD05SWDfNqBD2QrGmkNijlVmb1PcaKi5/wTKjbcZUZNno4ZRrXq7eSrw/PxEp3
         7tUyFSmbaa3GqKlm8RxZ87OUfDZl21VfELiNXcyP0uNBV6wbKSQs9fnmat4jc2UVnE/s
         aT8ruMl1SZVF2JlweFiZfOpx5OdRCRwvszbjWcrAWIoJGCxCBm4dxRu6fhijJjk0GCMB
         TWiA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UPKGURUM;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-535941-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-535941-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-535941-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d2e1a72fcca58-734a0040474si1666110b3a.213.2025.02.27.01.51.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:51:06 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-535941-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UPKGURUM;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-535941-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-535941-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C37EF3B2B55
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 09:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D73227BA4;
	Thu, 27 Feb 2025 09:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UPKGURUM"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F36270024
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649854; cv=none; b=c0gmPInvj7H8bUgEPp/wnOn6t986yLS3l+Ivth6R/Ldow+L6X3sTs0sX1dGyOFQK4QlftG3/RoJ/JiTgF2X3ICJ4RSDfVLfUyCKFEACl1gNqqgOBIics4zMr/+V5aGM7g0NnPXG2Ugeyf13qxJ6Z0plriz42w4Zrs1G8F4s/ybE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649854; c=relaxed/simple;
	bh=LYL9cYL6rj6biQ2SWuMn4r7Oi5SZYKYmnfyqUvUiymA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LVmTVLvvUHf9GmH71HmpZYJGSvxIhri4V2Va2jIrjsryCikJP46DeNVjVRu461SoPWyHNwA2EAYqOygbPv/sQ3gkGz7gqKtZmXCe1MQd8uqjVKUbUg0DycSu82gQuTJs+B0XRwMEypJehNqvsodedWFZySGiOGFNYKx5rLhKtE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UPKGURUM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740649851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWAZvimGNk1tF+ANGXTAMRK6KN/D4dhCfoJh3bD4+uw=;
	b=UPKGURUMSPMiHYKZDWnrCDZUM4jUrkxBwn5p3vsw7M6aHfg/IlX4roCWiVhiEMTFiMXRS7
	PbnSBZuEp+dSryPIZk1LtUre3krHmh0/UVd8eEidJ4BvSXpXzySjj9iEIag8KBdTKV1BR+
	/8Q7O3Ovg2SzXJ80XI3w+Umwyr/WIBs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-Pm_SPCUhOVGPJYG0ec9owQ-1; Thu, 27 Feb 2025 04:50:50 -0500
X-MC-Unique: Pm_SPCUhOVGPJYG0ec9owQ-1
X-Mimecast-MFC-AGG-ID: Pm_SPCUhOVGPJYG0ec9owQ_1740649849
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38f3bac2944so285718f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 01:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740649848; x=1741254648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWAZvimGNk1tF+ANGXTAMRK6KN/D4dhCfoJh3bD4+uw=;
        b=lHzVHdd38KxVHNNBGDwB8MnMINystmeproy0Uf2yRj3tJZVl01G7ERSBs7YDRxQz6s
         amQLA4sjuB1XY2x1i+6iZMBz0rtZwJ2DGcg+9iWtpHeVxxl/e3EqBXWZN3Z/2EcR8fxk
         8kXoum4BRXk1k+Ea2WP/o0EqKh49qN/CDyK207W6K05hn1Nlq3KwtdZ/yyTQgnxwPPlD
         nxwV8+iSYpkJn+R606XyVQn9XaBbnTsv7ekwti0hZw0Sd5egrlk16BCtidj1ZO2KGezB
         iQEdX3slMcB37xqATFoCnPpeYmHP+mrbFlOLxzo1v+6vYHaqH6eSVuf0tkfVYJGAhMYJ
         Obuw==
X-Forwarded-Encrypted: i=1; AJvYcCX/we+RkN2shW/xKp8B0UUFh9rIqcg2yoI7l//jasv0NC8clNunZbpiQ9vceDVABQbujJA8kg6EqKezswQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6+h7XKuNKm83GjcHuHsRRopu6vmIMLMFRtOQVLT1SNCwQ6BnW
	k0Z3Ley03ZPRjzQwF5vC1g6Ye+kuADMgxX7eYbPraTfQhzcW8iK1cVCn10kEiNlQeXmFpXZdpHL
	o+tizgTMldzWU4cTgsbuUi1sYQzWUT6H94l8wgfKk0PKWc4alj88072SnrD07ztBYw1OsWQ==
X-Gm-Gg: ASbGncvhWc0kAW7IXOSCKLnqdy0SI6FJQ0liYgp2ZoszAhud3t3G+mocBgS77pb9OT4
	y8IFiTSnw08tlLid9IHJIJCu++BYgUari50gZKBKMHXgGZuDWklP2kfzffr4IlpQ12gwEYfkwa/
	DHv43rRof/jmHHXYdiZt7GTv8CzdKIHyi9ZvtzvmRxa8HLDx6Rp89dO/PEYX9WCYjdvpoG0HGa2
	jJZi90s/HIn4pP3palZZ2a02BhNhxzyijlOLuC22iebY0OgdcP8RQSzJ5vZqM3jn9AK2u0N2tGN
	ti3Mlx5VlC1xK1k4sk3FiwwaOI0oVgSCcAKQZ45LZLDIet6S8uvx+4EerY1J3KY=
X-Received: by 2002:a05:6000:1acf:b0:38d:c2d4:2399 with SMTP id ffacd0b85a97d-390d4f84abamr5489407f8f.41.1740649848471;
        Thu, 27 Feb 2025 01:50:48 -0800 (PST)
X-Received: by 2002:a05:6000:1acf:b0:38d:c2d4:2399 with SMTP id ffacd0b85a97d-390d4f84abamr5489383f8f.41.1740649848097;
        Thu, 27 Feb 2025 01:50:48 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47965ddsm1532686f8f.18.2025.02.27.01.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:50:47 -0800 (PST)
Date: Thu, 27 Feb 2025 10:50:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/14] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250227105046.3c67b7c2@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250227082638.7db90257@foz.lan>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
	<e9e0aafd7cc8613709171ec5d8a6d9d9be62d7c1.1740148260.git.mchehab+huawei@kernel.org>
	<20250226165226.49b88429@imammedo.users.ipa.redhat.com>
	<20250227081927.726a1938@foz.lan>
	<20250227082638.7db90257@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: FQgClTqVKq/f

On Thu, 27 Feb 2025 08:26:38 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Thu, 27 Feb 2025 08:19:27 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > Em Wed, 26 Feb 2025 16:52:26 +0100
> > Igor Mammedov <imammedo@redhat.com> escreveu:
> >   
> > > On Fri, 21 Feb 2025 15:35:17 +0100
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > >     
> >   
> > > > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > > > index 5346cae573b7..14d8513a5440 100644
> > > > --- a/hw/acpi/generic_event_device.c
> > > > +++ b/hw/acpi/generic_event_device.c
> > > > @@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> > > >  
> > > >  static const Property acpi_ged_properties[] = {
> > > >      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> > > > +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, false),      
> > > 
> > > you below set it for 9.2 to false, so
> > > shouldn't it be set to true by default here?    
> > 
> > Yes, but it is too early to do that here, as the DSDT table was not
> > updated to contain the GED device.
> > 
> > We're switching it to true later on, at patch 11::
> > 
> > 	d8c44ee13fbe ("arm/virt: Wire up a GED error device for ACPI / GHES")  

After sleeping on it,
what you did here is totally correct.

You are right, We can't really flip switch to true here
since without 11/14 APEI will stop working properly.

Perhaps add to commit message a note explaining why it's false
in this patch and where it will be set to true.

> 
> Hmm... too many rebases that on my head things are becoming shady ;-)
> 
> Originally, this was setting it to true, but you requested to move it
> to another patch during one of the patch reorder requests.
> 
> Anyway, after all those rebases, I guess it is now safe to set it
> to true here without breaking bisectability. I'll move the hunk back
> to this patch.
> 
> Thanks,
> Mauro
> 

