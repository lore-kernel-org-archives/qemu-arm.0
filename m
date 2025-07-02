Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3696034dye;
        Wed, 2 Jul 2025 02:53:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfBLD4SMu2BF5DWOa7GgBgotrjF+3urGtmPDF6FvgHClDTKH6ybzDmrhybWsn8Jn88PEi0r6ckZTRMdg==@linaro.org
X-Google-Smtp-Source: AGHT+IHsVJOllqsDchZRODLVUnfz5F9PEfCDxoiODYaDSKwUzFJSxn/sDp24aImWEA4v9+5N3951
X-Received: by 2002:ac8:584e:0:b0:4a7:189a:7580 with SMTP id d75a77b69052e-4a97698289cmr34429911cf.26.1751449986441;
        Wed, 02 Jul 2025 02:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751449986; cv=none;
        d=google.com; s=arc-20240605;
        b=QqHFkUKDWycq1GadDghjRcSEeLDzyiHK3o2Gl19QOJeZAB1DvGbK6i3e3369VkXNAk
         ABnjqnYddCfBZVEGr1BAzk9WQu0jSQO0lYE750VAJFFRkxqMq6+s8FKpPFa6YCPLWUWD
         rqASpgA9T6VAzt0iswPCcYkXGg6uF9WzOKtZM+ucvbsX03DFT5w7qhpI01VOG9HSI/Mg
         U8Ga/lcK+LNdnIxIQUQPmDcS/btEErjpLel9nNm4kozrjmMDcMsF2E+e0Uvi1ySUDp5p
         ICG0ZnxRz/sVObjCcXryw1Bnw1MOekkZULnx7JKeH9oXuuurEKYZNHK2InUtQ3tswXSl
         hQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=TVGCQRvjpcJ0EUym+BMRZADm7767a04CNXZRyCrLG1U=;
        fh=pmpK1NuySfEHQJ2F6sFue7wDq7jQgmVi33TEY1EoaBI=;
        b=K6y9mZqifcGT4EIcGwf8c1ZDYJXFAeKs9qOdMRnVHjO5isjNlPVRYydUId1lybGlJ9
         eY1fTQkDkshrDnqPLKaohck84uEwXXe9q+ZraK3PVFscie/9p4VXmMMq9O9/qByH0bWM
         SkjBpCqjl47i+PeGn9Z78tTL1x8RzFiqwlo57DMYOsyyk6xcNZ/6JUVQKHvUj8RuV93j
         4Q1FKAPqKSIC2AlR/aNSs6XQThQHZxnyFe4ZUWjB1Yx2BiS8YqKO+aaT5bYPFq0v8eHa
         mSEMlUbkAk+X57VuM1vQ6PPTWZGsD8ePfVoSLx0l+wzex/oWiMwSwGvW0e7d9SMgAWUo
         bCEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VlpsWzRH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc559a79si134133041cf.541.2025.07.02.02.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 02:53:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VlpsWzRH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWu8x-0002QJ-UX; Wed, 02 Jul 2025 05:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1uWu8v-0002Pe-LQ
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 05:52:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1uWu8q-0007PF-CH
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 05:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751449952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TVGCQRvjpcJ0EUym+BMRZADm7767a04CNXZRyCrLG1U=;
 b=VlpsWzRHR4fSrtKWnz9ByoFIv7cB+4n40agsKQC36XXSPAjtFo40F4P6lNQdvizfrZCqtD
 A7gj1F4aaUecZc9MCS1wf5cTcpwV45x+bNC70azC7B30+kv9pkEQyRnEEnre59lz4hurLE
 0gXda+A0YQ2wIz1+tAN/rNPLzhsai3g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-375-RbkRDh0mNbq2Ar3s8Uauag-1; Wed,
 02 Jul 2025 05:52:28 -0400
X-MC-Unique: RbkRDh0mNbq2Ar3s8Uauag-1
X-Mimecast-MFC-AGG-ID: RbkRDh0mNbq2Ar3s8Uauag_1751449947
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 753E7180120F; Wed,  2 Jul 2025 09:52:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.226.82])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0615A180045C; Wed,  2 Jul 2025 09:52:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9B1D4180039F; Wed, 02 Jul 2025 11:52:22 +0200 (CEST)
Date: Wed, 2 Jul 2025 11:52:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org, 
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v7 2/2] hw/i386: Add the ramfb romfile compatibility
Message-ID: <etie67k64lfoaaqhuym5ayse6ejbwmdqrbm6n3ja5raqqsuupm@j5tev5gtzsqx>
References: <20250702085616.2172722-1-shahuang@redhat.com>
 <20250702085616.2172722-3-shahuang@redhat.com>
 <dec256c0-d0a5-49d7-b5ce-a025eaf27f8c@redhat.com>
 <36d469be-d9fd-48c9-8106-2db885e6fe39@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36d469be-d9fd-48c9-8106-2db885e6fe39@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ygapCoZuE0rU

On Wed, Jul 02, 2025 at 05:28:01PM +0800, Shaoqin Huang wrote:
> Hi Eric,
> 
> On 7/2/25 5:08 PM, Eric Auger wrote:
> > 
> > 
> > On 7/2/25 10:56 AM, Shaoqin Huang wrote:
> > > Set the "use-legacy-x86-rom" property to false by default, and only set
> > > it to true on x86 since only x86 will need it.
> > > 
> > > At the same time, set the "use-legacy-x86-rom" property to true on those
> > > historical versioned machine types in order to avoid the memory layout
> > > being changed.
> > > 
> > > Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> > > ---
> > >   hw/core/machine.c             |  2 ++
> > >   hw/display/ramfb-standalone.c |  2 +-
> > >   hw/i386/pc_piix.c             | 10 ++++++++++
> > >   hw/i386/pc_q35.c              |  3 +++
> > If I understood correctly, Gerd said we needed to set the prop to "true"
> > on microvm too? I don't see that change.
> 
> Yes, I try to do that. But I didn't see there are any machine type in the
> microvm like q35. I'm confuse about it, How should I do that?

Just add them to microvm_properties[]

take care,
  Gerd

