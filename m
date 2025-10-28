Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5F2CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:43:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDoeH-0005mt-Vg; Tue, 28 Oct 2025 14:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vDoe0-0005Mz-5T
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:42:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vDodW-0005r2-9J
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761676893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8JE18ZjWlXAwit2z6n1ZQ+ilWG96/G0LXLXd9ZdiuWQ=;
 b=iZEUSRjxZdJ7kGdgEiSlEFFpd9/ZtvPpyws7xr+BMTqC78OV0z1mdiIfXhIT3OxKj8GNCQ
 4tcnAkad0hNAK4UbqRUA0qRHBbiyny60JHpMbW/glc0M0595D6LU9wDUtmcXNw5zg1uKdd
 EiEhu+Wa61BHq/s8VCqWTI8riRlEt0E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-9hs7PZL-OCa32Uy3EpJWng-1; Tue, 28 Oct 2025 14:41:30 -0400
X-MC-Unique: 9hs7PZL-OCa32Uy3EpJWng-1
X-Mimecast-MFC-AGG-ID: 9hs7PZL-OCa32Uy3EpJWng_1761676890
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-89ee646359cso1364660785a.1
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676890; x=1762281690;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8JE18ZjWlXAwit2z6n1ZQ+ilWG96/G0LXLXd9ZdiuWQ=;
 b=cWIsCiZHGTp100EYczgiV9dzb85Hr36EnehJ55P6hdZDPc35XZqqa0xKt3oBYiRwE/
 0OjTxu+XF2SvIykZCDJkiaS9wPY/ktZ2gG3Gk4LualXfLWLKcioXZ45615pPrwhITMvI
 S9VmF7pop8lbicfdr+oGR/jDv+oNRtjb6fBv9GTh+VUf3mG7osb/zezc72lKuY+25Dcc
 VDKvCW+DqWJTY6i9r/0Itl4Nbjd4dNq466XU+VQ+SoubPZC0tOL+76ipl/EPncnlYAV8
 CTd7NxbfVzYfJhWaJnIFWAMX7f27CFB5bDPuc/aqFGAguWmFfvnnWjO3mCq8m2LY/o4B
 5nXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzHrHGu2XErs9JGFjAxO8BrFtAXv9oeHDXUzcMbmTEku1w4WXcREE5wt0kut7oBK0FD2obMjpMkw==@nongnu.org
X-Gm-Message-State: AOJu0YxckhyPftC/Y7YxEFfUBwOJr0cxA1DU8c1jw81+YQH0jvIL0axc
 b/Q7pb1TgjdPXI556a/7CgcNrtuYYGS7nTCh3h6yzHGHjKtRNOXliK5EblsubfZe+Xidi3rfs4z
 C08Fo46qdSRPi9d8otsaivXzmOGEyPoHXCCz7KNOIqkk/yMLc8JUu+w==
X-Gm-Gg: ASbGncu6MGlLUqEys2r7zKVvXupvBToSYqotqdfQ0QUGzekcAd9ve83rHD8WNZMqg2n
 1LHZtHSyrgW5/zpammLCInggxb8OMqQByS0EfezZDgzwEdFV2FsMlBrV2Q4CSK1HtRN4VTPGtiN
 FXbkUmdLfxlOi9+TP39jnkxfu0NvRnPtUQNGyxYU/BPSH6+7DqNt7dv3G0zdO9t/q/x8YrNBUiS
 q54jPdr74ONbKS1wwcr6d7OC8ilireaLOEW3J/yIRobFtfeMFh9SgBNlCaH7go+pH9A61gwNOcG
 CVjG9XGipvGaCZBkSxMFhqjzrSMnAdLd1hkK/F9vBc0+hvSp6j139f8TjLQJ1qFyJLM=
X-Received: by 2002:a05:6214:27c9:b0:798:acd7:2bb with SMTP id
 6a1803df08f44-88009c0b912mr1037266d6.51.1761676889843; 
 Tue, 28 Oct 2025 11:41:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz9dR8kMz0S6e9uZHFhtek7D0C9LNsYC8wL8XSrLNCkrY/ca31qp0JCfvcV3KUiInSS0KnQg==
X-Received: by 2002:a05:6214:27c9:b0:798:acd7:2bb with SMTP id
 6a1803df08f44-88009c0b912mr1036896d6.51.1761676889279; 
 Tue, 28 Oct 2025 11:41:29 -0700 (PDT)
Received: from x1.local ([142.188.210.50]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc49204dfsm82115346d6.30.2025.10.28.11.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 11:41:28 -0700 (PDT)
Date: Tue, 28 Oct 2025 14:41:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH v3 12/25] migration/ram: Use memory_region_get_address()
Message-ID: <aQEOV2ucE_77LJD7@x1.local>
References: <20251028181300.41475-1-philmd@linaro.org>
 <20251028181300.41475-13-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20251028181300.41475-13-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vm8jFRA09qS-IcajzhvcaFuUtbvpPpq8VErW_qKnIzs_1761676890
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Tue, Oct 28, 2025 at 07:12:46PM +0100, Philippe Mathieu-Daudé wrote:
> MemoryRegion::addr is private data of MemoryRegion, use
> memory_region_get_address() to access it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


