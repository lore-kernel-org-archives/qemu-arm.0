Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1997FC0360
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 16:04:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFwWz-0002P2-Hs; Thu, 23 Apr 2026 12:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wFwWN-00026B-UR
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 12:03:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wFwWI-000766-AN
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 12:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776960193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4+jjOKI3lM3aGymycKN4JAGzsgHGzIKbItTOkEQ6LxU=;
 b=TEgYsu1TuJrDE1NAS1SFD0yeXK73BU2W5ldskgpnFHDqhJFXkpPtt+f3CGyBNe8kqCnrGA
 /FZgIfvdqFNxs37IqdbH+x//dDlkwA01j169je3f3cnu8nYgV9TY0cW3CqeJul6zgCQtQJ
 kwZJaMMZoO2KhLPcbJvdzyniE2WIdKI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-RzG8YDBLMDeIv56XxfjXGQ-1; Thu, 23 Apr 2026 12:03:08 -0400
X-MC-Unique: RzG8YDBLMDeIv56XxfjXGQ-1
X-Mimecast-MFC-AGG-ID: RzG8YDBLMDeIv56XxfjXGQ_1776960188
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8d5b5d607d1so1326344985a.3
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 09:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776960188; x=1777564988;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+jjOKI3lM3aGymycKN4JAGzsgHGzIKbItTOkEQ6LxU=;
 b=Z0Rp76RXBdW0V1h1fsFNE2xGu5CDZn2N+65LR93IrwEArpCLl99Un9iw3uOU5ki+K6
 ePCyMcirdXMr8FBO7sd3qeeUAq6aFVD2wxnGwvaTC0kNs7fS5kBz0l1mSwm/K4pKQdgk
 eOUoGz725uUi7oZ5XSOori6YnH9rjbiULUf4Bq4ruUnRjapnCR3BS46fvHx5n5oiREV6
 xpGgl11xP0ppBfnOMpFH8CGjeA9W93SRYuTq5soWXcjAboiE++uuih26TCC/CbE+XaSr
 N+4SFl328crNmiFmBNu6eO5RpwaB77AqxXg8Zja4omxNEbdxQ+Cmb74M2LhKPVIBeLNX
 nKPg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8vaS8p8Zt/EhA3HVWgNPcWk14HG8VDw+FpwmjF0tTuXpuKitXB+Mvt784/jONHFwnERSJqfY9B1g==@nongnu.org
X-Gm-Message-State: AOJu0YxCWZj+SEp8FVT75m8Wu76e39dEwcB1tLJclKEeh+DvtvtISbKH
 5PCeubBaPWmzmwfhOA0lfg2C2Zoo8/1QOwZ8wuIwxWpwXb7maA5KrcMK13pgvIAzt3BXi472cLk
 yo8pz43eTM2d7yBGYf/BfKTU5JyyeG+yTWtg6WcX6rRvVOr1ExUz7Fg==
X-Gm-Gg: AeBDieuKF4nqLvgIrfkTj8k+j7bxLyKlPBdOAI+JNb3le6si43riwxiGitlXCFYCrYb
 luT0/0VJ7M0nFGK09xkx03pp8rEIBwQBWqWMVckXnoEA9gVaDjOu9me+5UYtHBMcUBanK53Hzot
 Aedsd46Co7ao+aDZ2qbKRhT7CQiGOXZ9UeOqug0xR1cJRDbCtrLicciQ3DaIEJa6CWIRHz94g2B
 btUhT0nA+AX3v+3PCPDy7/YTAE21LJfDS6BCnElIxF6sVHQ0V24VOl5qMQKepS/3+MhpDsopOMV
 xKH86FlFzaaUtXKdu+JeEvpQzv78xvwivrgnqffYTxeqVHn4+xCDttFmAV+7u5QIcNv4Km4OGuv
 C1mSIXJMXM60aMCy23Kz/lk+6V3XTQsSmE+gPSLGT8f47I9mXOzaaSaRRQw==
X-Received: by 2002:a05:620a:4455:b0:8ea:addd:8954 with SMTP id
 af79cd13be357-8eaaddd8df1mr2638345385a.24.1776960188104; 
 Thu, 23 Apr 2026 09:03:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4455:b0:8ea:addd:8954 with SMTP id
 af79cd13be357-8eaaddd8df1mr2638338685a.24.1776960187476; 
 Thu, 23 Apr 2026 09:03:07 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ef47be2d91sm612562585a.12.2026.04.23.09.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 09:03:07 -0700 (PDT)
Date: Thu, 23 Apr 2026 12:03:04 -0400
From: Peter Xu <peterx@redhat.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 "philmd@linaro.org" <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH v3 06/17] hw/usb/hcd-ehci: Change descriptor addresses to
 64-bit
Message-ID: <aepCuBHa8kl0qT96@x1.local>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-7-jamin_lin@aspeedtech.com>
 <3ee36a34-573e-48aa-91e3-9140244717f0@kaod.org>
 <aeJNdLTRSZQiEiP_@x1.local>
 <TYPPR06MB8206C244CD249505E6B543F8FC2F2@TYPPR06MB8206.apcprd06.prod.outlook.com>
 <aeYrfQuAsEaOpH_O@x1.local>
 <TYPPR06MB82066A191FB2B0AD05F7C295FC2D2@TYPPR06MB8206.apcprd06.prod.outlook.com>
 <aejdEO2CXg-QuGcL@x1.local>
 <TYPPR06MB820607B5BBAD8C8DC0A4D2DFFC2A2@TYPPR06MB8206.apcprd06.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TYPPR06MB820607B5BBAD8C8DC0A4D2DFFC2A2@TYPPR06MB8206.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _3rbp-5fp5F59XYO_Fd6Zmk0-CFhay8JQdZOG2GKPII_1776960188
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Apr 23, 2026 at 01:48:36AM +0000, Jamin Lin wrote:
> It seems that we need to use the device type name here.

Heh, yeah, you should be right.

-- 
Peter Xu


