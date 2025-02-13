Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp635151njc;
        Thu, 13 Feb 2025 06:55:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzm3FZLDVs063opQXDtlVUYaoh/wiBtx2fzmaIee5IiCKdvI8sH6+3Vb0tXJ7pkRwUfSsJzzdcH6H1eA==@linaro.org
X-Google-Smtp-Source: AGHT+IG2Fr2zXJLFNNDYxn1JyX89piqWEgHkbu6ROku+1ABh9rGTERQRXxY0ZJrm8irFHMZyvm0y
X-Received: by 2002:a05:6214:d41:b0:6e4:3eb1:2bde with SMTP id 6a1803df08f44-6e65bf3d82dmr76620706d6.19.1739458514312;
        Thu, 13 Feb 2025 06:55:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739458514; cv=none;
        d=google.com; s=arc-20240605;
        b=SMg+7qe4CtHmPc0u8bGwxL3SB8am3VGah1gyZ+w1K2Itol8+b26jGc3vwfctrUT8IC
         pFxR+PJRspXx7zStg+dgfnYQKGqcsF3D2cZNp+DHLJd+yTdo/bjhOQSOTSPCQrBM8+e7
         +MqP2cbDfF7oB3Z172m9O+yUkVJxlydChEpC0icC2JE8HA1XIPqSS1bCkyY5fztOYMY/
         yckMl4K/C/1uKkFCf1cVXArUF/F+/r6pniiNIi9xtBcEckait++dc6lEavgO5XXqRst5
         RsuSAMsG1F/ukr93db81K3DJMlBT2iw2m3FGdAXGcYkFRCUaE/9QTWCqDrRwqaZ3ieXQ
         L0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=LsKbHcBxzgAQnpbBX0P++caW4lFP8TmEzYsHS8xMsj0=;
        fh=rrua58aPyIBHnRLYa6DhwCQw1Suzf5rAWcQoGwyatcE=;
        b=VgJ8xCGF0ps3siTp3F37wFHt5cBJoNSg7ybFlobKHnGOqqGe2Fe9upj2EsNxpfN9R/
         ibv8iaYyxiqWaSUeMmdC5/HiZS3LQioj4jdQ/TrlR6Dizyygf/xYbaZyrL++BZQWib3i
         N/4bvyH4D2aOVNeP+DXs+6R4O9TB0asZ5rCJquDk4gbkul4Bm7HIU5frSFyhCdKnbhOI
         oSvduOPTBWNKO/DCCes0Xfo2XqS7kcUpkc0SCJ0NXemVDqG5a6nDYBatji0wlHvmwrPk
         h5K8Q7CYIy4YTDpPZDZ8tYvxFtqknNe7Jt4xzek0/t9wQTjtUTbUw4Kjm5gu8CmHSvSM
         irxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fkW5hIL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9c54a1si14652026d6.383.2025.02.13.06.55.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 06:55:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fkW5hIL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiacF-0004qG-MZ; Thu, 13 Feb 2025 09:54:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tiacB-0004ov-Os
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 09:54:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tiac9-0003F7-MW
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 09:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739458492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LsKbHcBxzgAQnpbBX0P++caW4lFP8TmEzYsHS8xMsj0=;
 b=fkW5hIL8TIQw+DQynwVX05icYhDpJpSO4ASa5ZTHysGFIi2KGYCUsn7vTblIfLmCbAYOH3
 milo5Ax8CmovA4j1BvykSL80D1p9vaifmrIaxEzgGo/cG3+YCokAat6Igo44tGZHW21aCe
 mlUCMosq4v4XNkyG2wkuwPhXuXP3xFY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-287-oD1ZK_IjNZSjm2WT7juRBw-1; Thu,
 13 Feb 2025 09:54:49 -0500
X-MC-Unique: oD1ZK_IjNZSjm2WT7juRBw-1
X-Mimecast-MFC-AGG-ID: oD1ZK_IjNZSjm2WT7juRBw_1739458487
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BA1961801A0D; Thu, 13 Feb 2025 14:54:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.69])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1D7611800359; Thu, 13 Feb 2025 14:54:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 977CE1800097; Thu, 13 Feb 2025 15:54:42 +0100 (CET)
Date: Thu, 13 Feb 2025 15:54:42 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 09/23] hw/uefi: add var-service-core.c
Message-ID: <jnxvyw6q4vkng7jztu7q5rabgeohhpoxojdn4wt6xckc6pzmqz@ateji77pl5j7>
References: <20250211092324.965440-10-kraxel@redhat.com>
 <da0ac9ed-fdca-433e-b793-5423f430a852@amazon.com>
 <iuwaykfdm7bwtvblyz7lkew3em2ksi5xeztdphqjdv7tsp2ejw@s6j64y3lfmrw>
 <ea1d355b-7e56-47ef-b1e7-158003b6d85f@amazon.com>
 <kk4f5e3olb26qfjveqefkuzrjc45djikkk7uspz4yj7iesdmbj@zointitbvhdp>
 <73fe41f7-dff0-4506-8769-1997323c0a76@amazon.com>
 <4bwjwcs2k4hbrj6mokc57a5dy57jjssfxnvd4qm5257dgnid3x@yqdx7e47o2mf>
 <2c06a98c-f286-4632-a352-8b47dc4cc43c@amazon.com>
 <2vgc4scgezmb3med6dypykcym7te7gzlx7wp3vm5ehtfmxj3xr@kswpu35wt5ns>
 <f59bb48f-051d-4681-a702-6aed3420c2f7@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f59bb48f-051d-4681-a702-6aed3420c2f7@amazon.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: M4YqcxONzmT7

On Thu, Feb 13, 2025 at 11:14:03AM +0100, Alexander Graf wrote:
> 
> > I don't think so.  The firmware driver knows this actually is normal ram
> > and can setup mappings and memory attributes accordingly.  The situation
> > is a bit different from vga memory bars which are handled by pci bus
> > management which doesn't know anything about virtualization specifics.
> > 
> > Well, unless macos thinks it knows everything better and goes setup
> > uncached mappings ...
> 
> It's not only macOS. After SetVirtualAddressMap, the OS owns the virtual
> address space of Runtime Services. So in theory it also owns cacheability
> attributes of all mappings.

Hmm.  Played around with the device memory approach a bit today.  Looks
workable for both arm/sysbus and x86/isa.  Problem is, if that does
leave any unsolved corner cases on the table it doesn't buy us much, and
the arm caching issues start to make me a bit nervous ...

So, maybe allowing pio data transfers is the better approach after all.

How do your patches pick the transfer mode?  Is that dictated by the
host?  Or is the guest free to choose?  In case of the latter:  How does
the guest decide what to do?

> Yes, IIRC we advertise where the hole is. I'm sure we can find a spot.
> Somewhere next to the HPET :).

0xfef1000 seems to be free, which is kida fun b/c of the 'ef1' in the
address.

take care,
  Gerd

