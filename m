Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA30F9936E
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 11:13:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFrzN-0005mw-Cb; Thu, 23 Apr 2026 07:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wFrzE-0005lr-JJ
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 07:12:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wFrzC-0001a1-1m
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 07:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776942763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pQj9Lid1x+fDjXB6D147jsGj2fGp3a2IHvbjQzYCQ0s=;
 b=UeMZCVLq4fQucCFBBIHOk3DzyfHsfNuYTqlQpwDuzq+4CaN55b+ZTTMm5jnv8V+RpriAqb
 8J7JmqW9yGxPzho4R8eMBJNzJCj9Xa+VVyzE1xakLakuackOkqVuyQVwrJsIKsp9Y2R6D4
 ziPv/6DeVCbABm3NDaA1um+2G4mR8DI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-c3VOGZpHOpy3fzUe2AQeeA-1; Thu, 23 Apr 2026 07:12:42 -0400
X-MC-Unique: c3VOGZpHOpy3fzUe2AQeeA-1
X-Mimecast-MFC-AGG-ID: c3VOGZpHOpy3fzUe2AQeeA_1776942761
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48a5adc141cso11792925e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 04:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776942761; x=1777547561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pQj9Lid1x+fDjXB6D147jsGj2fGp3a2IHvbjQzYCQ0s=;
 b=KBSqXqd456aKLYQkgaYiSnoht1B0jKv/ze1JjtyRmSkWMQ/Z9Z9GBe/RLZ+d69qewU
 js79aPURSMuR7u3+fx7eo9264829z38z9PzoCrwxBIyvb6FiQamQj5uFWvkSXKXG1+4z
 6PyOhqsiNMJ6d2XD7ji1FNwXz01jhLYGO5Fu64rY/ccGKNFGdkdhPjnS0cfGr4bjNyHM
 J6LQXAV5eKWcZZkFCJYx9BKcUcVjkzoLqlz+22dHiw8PM990x2X4XyyT8e/2KZnZDUbU
 /opUGHIV2G/xs4M7ArvIIQvLbAUjhXFXCtDf4kFnskkiQRKWx8iMaolr7nQP+pzrc94A
 Yl9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ//tmR0uE/oRTcQNPM3LXsP8YcgAc1bU7K2ooQNFDEPbzdiTQ3/fgotFZrOcdk1xK8teLZ/e1LCag==@nongnu.org
X-Gm-Message-State: AOJu0YwRrEGwhlUSxOKiWB4cnwmEZ6PDVm/hQioye8jwqVDnkJMEFnwW
 xgg59zuRrZiscxZCoV9kJTJ6+7Tu4cqgJWpPwwnmo1oyDG1m+Yk99n/YxYlYcezy7xE/c4aWFYD
 BJqSMFoxc7q58CrXRljWVlhGRBUy4EES23Ikqd0z8RMtEwRWCGYvdOw==
X-Gm-Gg: AeBDieu4wStkdJEXopth2KSLcoCjOxFgdTVEw6uzFO2Y1GNO9Xz7JVXZQkd5nWhNEl8
 RWh9xUekWz8mncJGWXNCgt4IY82HQMs5sIRVpgXsFnanbaK7WG9QXcZ2r4UoT7g3OJ9g5k6uirh
 At3r54kN60ltZ7Kd975EtTaHbkweXFIQmAEwnOpBV1ylCvCTMmgeqO/znaMY3vf2RqavwYacqq4
 AclcrE9URM88z6zKgYyAe4/i4MagffnVLL3dYbT9uLOSlsTaInPxWg8yaPfWihZryWT2e06DgEJ
 lLiRjs6aN8aJQ8yFgYngDTONN6KJezxRnmpuyjj/5dqacc/qhghrlH8Q2IfIdtHdE58B1xx8arA
 ql882x/WoAuUWnaVsSjJaLGcmox5igyKb4zybUHXSVPlvzkyRH5Zitt2XTvxymYRS0g8dSQ7hYm
 59KuEZuGdZ2egLgwVsauShnM3eVs5YIPC02HU=
X-Received: by 2002:a05:600c:3b2a:b0:48a:534a:eed8 with SMTP id
 5b1f17b1804b1-48a534af0ffmr180058935e9.1.1776942760748; 
 Thu, 23 Apr 2026 04:12:40 -0700 (PDT)
X-Received: by 2002:a05:600c:3b2a:b0:48a:534a:eed8 with SMTP id
 5b1f17b1804b1-48a534af0ffmr180058585e9.1.1776942760302; 
 Thu, 23 Apr 2026 04:12:40 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.85.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb77b001sm243348605e9.3.2026.04.23.04.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 04:12:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Wei Liu <wei.liu@kernel.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Magnus Kulke <magnuskulke@linux.microsoft.com>
Subject: Re: [PATCH v3 00/37] WHPX x86 updates for QEMU 11.1
Date: Thu, 23 Apr 2026 13:10:12 +0200
Message-ID: <20260423111011.460531-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422214225.2242-1-mohamed@unpredictable.fr>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qYo90AznrhlGRC2z812-49-FOLTONqmNEDirjKHj4-c_1776942761
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

I have started reviewing this, thanks.  Up to patch 17 it is good, though
we want to tighten the MSR configurability up in the future (please
look at KVM for ideas).

If you have any more changes, please either wait or at least post on top of
those first 17 patches.  I'll focus my reviews on both this series and
MSHV in the next few days.

Paolo


