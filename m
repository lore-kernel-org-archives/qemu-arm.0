Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp184471ejb;
        Wed, 7 Dec 2022 15:50:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf410D+uDHRiEsDD8ddtj6GyK9PGk2Z8kW7HloLXcaiBkOqSDhGMo0uRPlxw9WeWt5P1FHBE
X-Received: by 2002:ac8:5508:0:b0:3a5:2662:d6c2 with SMTP id j8-20020ac85508000000b003a52662d6c2mr75036886qtq.4.1670457042068;
        Wed, 07 Dec 2022 15:50:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670457042; cv=none;
        d=google.com; s=arc-20160816;
        b=me6jcaEIFnp8rUkY7ymI3Rf96bobbg/iATh9CusYu6KRuvENW7Ji71xw+vtD1ABnCA
         +kYK4Xb7xVsN8v01/w4qPhGzuX2HVTxPQU8c1N/ZMbVID79swCymqIrVPZ77GXW+JteV
         jxzbCNtbWavZD9GL2A3JBpDts4QNXLoZddZcU0fNCKBjmK0Odqp+iocrcURMUW23n2P8
         kQKHWXPW0QMQbA1rEayUQ6hk1NunltVEBQQxqNWrsScosKRRniA48yrUXBaR2PJkWJab
         NJwfCwP1Ivfea6988PrhY1f9OMsEI1GsdHii9pSBh7jdyrfJ2W7kQ+zeDlmwJyCF7OhK
         Msxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=bKc3D/bbj9By1d2/gb02fwFAOZysrGX1sWKaAOzWOSQ=;
        b=oSWxMbU9NLPO9U77HeMmM1/946TQSLSuVajMvha0U9DJtrjKpsNq10CrI7rtS7owYw
         32aGmezPOumdrRX6c0IPioR376c/gWNQVpVr21KJ4z5iFBXhs041xLh31ieK8pP0vC6p
         OTt1YVvkaBNdoHVtRGobxc6FwUiiWWvJZdNXbBJycvnoU1EK6T0gzbqcF3DPd9JFLiMs
         JxTQnbBMbTRjXnmBvIxFQKL4PFZpicxEtMDhNkbF4g/0XutZCqME6xFO81auivkyJOg2
         GGQoJnCGb4Zl3E0yXERmINogjzFO8I/5HUjrXQTDlN6sJR8VHxiVoHyLa6pml6sFlHCy
         Pksg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Heueythl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bt15-20020ac8690f000000b003a57645c04esi11558903qtb.590.2022.12.07.15.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Dec 2022 15:50:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Heueythl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p34An-0006cl-KC; Wed, 07 Dec 2022 18:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p34Al-0006cM-Nh
 for qemu-arm@nongnu.org; Wed, 07 Dec 2022 18:49:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p34Ah-0006lY-MK
 for qemu-arm@nongnu.org; Wed, 07 Dec 2022 18:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670456990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bKc3D/bbj9By1d2/gb02fwFAOZysrGX1sWKaAOzWOSQ=;
 b=Heueythl89iqATcVNZ70eyG3+Za7ErwPyvRqTbyMX+HDcs1tKyugPIqGIc5ExOT2J33Zo8
 ELzhyKiDKG7mupPs6x/1Jak4/BUqZor2cK4Q9/X9H9zT5yAjVibd4ERHauchaF0y60AHb0
 EIu2EA4vaAE98zw8llHRVACJi1NX5o8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-gyTPLX5hNY6QYcQyx7VnjQ-1; Wed, 07 Dec 2022 18:49:49 -0500
X-MC-Unique: gyTPLX5hNY6QYcQyx7VnjQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 j13-20020a05620a410d00b006e08208eb31so26622813qko.3
 for <qemu-arm@nongnu.org>; Wed, 07 Dec 2022 15:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bKc3D/bbj9By1d2/gb02fwFAOZysrGX1sWKaAOzWOSQ=;
 b=x6jrfMuncoWYU6OlS3y8L0w+U/uDOwRn0LupHyyAQf4cCNUc2FbtYfNmBenbQwMIoP
 ewaEHdnldTw+5EEkwywMAatIGx/A3seliy33fQtGO7qZ5u+s4AydMZxu3WGubqhuf3al
 eYO9S0o9lfpCi+6/0J+IrdP0eWyRUZXJGueD3/X2G0EHkMvbkkRFbUU5Js+lx+95sRtV
 rV7Pg/NGcNLLQTmihIQceknWOGj0Dc36JDpPg6gELUGrn+GCuFXAO0YeMtdou6zOvUQr
 RMpzAdNFF/FuzEgHd7RwPp7XVqc9vGqo+SieQ0LfAQAZdiwfGTAFNlqySE4xUJLFXc9Y
 2p/g==
X-Gm-Message-State: ANoB5pmbDm9mD+ZuEVa9lF+XRFORYXsp7AE+NwcMYAxqTvF/vm+4+yMV
 vc2M3qnVtZBfw+9r7C8N2FYT0ZlnjtCpgGncPiYVDKuz/Vf0TF4Un88N8AyjnMbFLIYTUPFAbKX
 bur5CkApyW2wr
X-Received: by 2002:a0c:efcf:0:b0:4c7:50b7:8d7f with SMTP id
 a15-20020a0cefcf000000b004c750b78d7fmr1988831qvt.11.1670456988746; 
 Wed, 07 Dec 2022 15:49:48 -0800 (PST)
X-Received: by 2002:a0c:efcf:0:b0:4c7:50b7:8d7f with SMTP id
 a15-20020a0cefcf000000b004c750b78d7fmr1988821qvt.11.1670456988502; 
 Wed, 07 Dec 2022 15:49:48 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 az13-20020a05620a170d00b006feb0007217sm9365576qkb.65.2022.12.07.15.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 15:49:48 -0800 (PST)
Date: Wed, 7 Dec 2022 18:49:46 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org,
 bharat.bhushan@nxp.com, alex.williamson@redhat.com
Subject: Re: [PATCH for 8.0 0/2] virtio-iommu: Fix Replay
Message-ID: <Y5EmmjKBBnjSlvd+@x1n>
References: <20221207133646.635760-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221207133646.635760-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i6/8uRhTkD5K

Hi, Eric,

On Wed, Dec 07, 2022 at 02:36:44PM +0100, Eric Auger wrote:
> When assigning VFIO devices protected by a virtio-iommu we need to replay
> the mappings when adding a new IOMMU MR and when attaching a device to
> a domain. While we do a "remap" we currently fail to first unmap the
> existing IOVA mapping and just map the new one. With some device/group
> topology this can lead to errors in VFIO when trying to DMA_MAP IOVA
> ranges onto existing ones.

I'm not sure whether virtio-iommu+vfio will suffer from DMA races like when
we were working on the vt-d replay for vfio.  The issue is whether DMA can
happen right after UNMAP but before MAP of the same page if the page was
always mapped.

The vt-d resolved it by using iova_tree so in a replay vt-d knows the page
didn't change, so it avoids unmap+map.  It only notifies newly unmapped or
newly mapped.

Thanks,

-- 
Peter Xu

