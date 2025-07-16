Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFEEC83F1B
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Jul 2025 07:01:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubw8w-0002XT-PU; Wed, 16 Jul 2025 03:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubw8n-0002R4-4C
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 03:01:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubw8e-0001eY-Fx
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 03:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752649269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P3AUeB5zKzLtO+orAl/mtwdxHdQgBluYhKSJJpXA5pc=;
 b=dsYC/tu0kwAVGdI9kdcIuYSizwmv0QEKJk6XDPjVeUxCfk+ZQOCPhZSkwhPa2/BNZs+LvD
 W+9VcjN61wgrrhknjSDY4Sv/8KLTVUhoYO+zfacqpBz2rrPQ+s99aSX0/ZjwBLKl0ekPG4
 hrnr5aY/IAvRqNK5y/429TTuwog9CvY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-5k7QQP70PeuADgJ70teGvg-1; Wed, 16 Jul 2025 03:01:07 -0400
X-MC-Unique: 5k7QQP70PeuADgJ70teGvg-1
X-Mimecast-MFC-AGG-ID: 5k7QQP70PeuADgJ70teGvg_1752649266
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-455eda09c57so32831385e9.2
 for <qemu-arm@nongnu.org>; Wed, 16 Jul 2025 00:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752649266; x=1753254066;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3AUeB5zKzLtO+orAl/mtwdxHdQgBluYhKSJJpXA5pc=;
 b=maMiid/XRA3G4EeVVDpNifynKCn9Ab8JQM0uKQBdL5mN4zpLw9K52WXBuvfQ88naF/
 tl7DOvHBNVhB+MmlNJE4pWmWICB40UfIwQskp80CRrfKfpRNSFqZolEHNvWHb1Zi0ux1
 ud3/MatWPAdIaPdTtudv6wLU6PMvln1wjZCS5Yt+FiwRxlXrxiCvDZlO1JnSJRwdMDxr
 jpPh/aLZcGduOpSB47DZ3GU1htIK9Hb+qVIl+66+6ge1lBfJB/dZ/38YRNUlhC9D2xPE
 soKOP6qtXTMoDXcTJVxBsSSyVoXsIqYU4cGToU1KQXtHK5peW2Kx7b8a6rT3ox2YOnXz
 zqwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGOd74q5twbhH4zBtF3Qkq7GTF+06cvBL8Esn6An/+tZ0ASmrWxpW8NUAXQKb1jYjyIKDrV7q/lQ==@nongnu.org
X-Gm-Message-State: AOJu0YxqgXumjDgq1iuaLhr6a1uUVEMa7jt6vQ56f8FOHfLZRCqMMEWL
 Y4IBP/k9TlQ75FK++7JfMvqA83k5EyV2OpUg/ahk4A8hOpZ1DUPjdQ+KmMR/nNXfiq+DnZRMsUK
 S1YGGVf9oZQKvmnyI735+xxgFyhDLsCQvtX3EJ8WRwq8nMwxAkn/l+A==
X-Gm-Gg: ASbGncuVfNLLZVjJ4AEj0PjEvNCfydXunbejtmO6MxfcQsCzNAZ3Xse56h79MOHID+T
 Cogst1sKZIACgPWfdA+VtYH6TyjECnuOz7W2VXb5iAVw+as5MAIKILoexVYYm2hOU4u5wWvySAL
 N+SF9hw+IIWCSav/KUarj9nxwQ64vD/w0jY2sE3MsXWgluzpcva2bP41NoC93BcmkWFfZUuPkul
 eiOotaR4Q88Ac6R46qMBLm03DmqqvFT459Bfyb/qo+TYbVSshrCF4pLgEYDaqfMkMWO3ZMqkgAa
 2bVpP+x+D5VhYZ38REyGli7ILIr2JqE7
X-Received: by 2002:a05:600c:8b2f:b0:456:27a4:50ad with SMTP id
 5b1f17b1804b1-4562e3a222cmr11904755e9.33.1752649266255; 
 Wed, 16 Jul 2025 00:01:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYSFsbElxZnORXSiqQIoPepQ7xnDr+y5vC+zWHhu4yMUCmvO2Fn7tVx5T9nx+faMjH/PtPcA==
X-Received: by 2002:a05:600c:8b2f:b0:456:27a4:50ad with SMTP id
 5b1f17b1804b1-4562e3a222cmr11904415e9.33.1752649265837; 
 Wed, 16 Jul 2025 00:01:05 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e802afasm11616785e9.12.2025.07.16.00.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 00:01:05 -0700 (PDT)
Date: Wed, 16 Jul 2025 03:01:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 (RESEND) 00/20] Change ghes to use HEST-based offsets
 and add support for error inject
Message-ID: <20250716025618-mutt-send-email-mst@kernel.org>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
 <20250715133423-mutt-send-email-mst@kernel.org>
 <20250716081117.4b89570a@foz.lan>
MIME-Version: 1.0
In-Reply-To: <20250716081117.4b89570a@foz.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7gL66fmo9Yu0AI-ssjNw_mBehaSkA8m7p_6Bs2eaSw4_1752649266
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Jul 16, 2025 at 08:11:17AM +0200, Mauro Carvalho Chehab wrote:
> Em Tue, 15 Jul 2025 13:36:26 -0400
> "Michael S. Tsirkin" <mst@redhat.com> escreveu:
> 
> > On Thu, Jun 12, 2025 at 05:17:24PM +0200, Mauro Carvalho Chehab wrote:
> > > Hi Michael,
> > > 
> > > This is v10 of the patch series, rebased to apply after release
> > > 10.0. The only difference against v9 is a minor confict resolution.  
> > 
> > Unfortunately, this needs a rebase on top of latest PCIHP
> > changes in my tree.  The changes are non trivial, too.
> > I should have let you know more early, sorry :(
> 
> If you still accept merging it, I can quickly rebase and send you.
> Just let me know about what branch you want the rebase.
> 
> Regards,
> Mauro

Well we are in freeze from yesterday, but if you feel any part of this
can be classified as a bugfix, I can merge that.  You can rebase on my
for_upstream tag.


-- 
MST


