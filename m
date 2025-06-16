Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1683899njc;
        Mon, 16 Jun 2025 00:15:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjR8a8+1NXVHoADboAI/xDYpSyfsJ0R3gVd0Ub+8S9e8fZ0YlvCRZMEdEqrsIsRUt1+vVwQ0ex34mAMw==@linaro.org
X-Google-Smtp-Source: AGHT+IGGBWqwnvd9NiY5RtsThFZ/slA2w54RiwjG7JMWEglb0fF7vVpr7F0J7abPfR69h4CzgOmQ
X-Received: by 2002:a05:620a:40d1:b0:7ca:ea9a:828c with SMTP id af79cd13be357-7d3c6d081bbmr1386418685a.48.1750058112172;
        Mon, 16 Jun 2025 00:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750058112; cv=none;
        d=google.com; s=arc-20240605;
        b=h9y0tfD7I1NACuTUul7khixaVOzSVI8s8Yj8Yhp4vcifMs/r2qA7udX+NLTn6ZAzF2
         sKN6EF/NPA58KJSNhlpXDrDsSKD/2NECY0fTMtgzXQ/h8TfC554vwGOoNbw0264KRKjR
         LcxZS6SZJCTwMMNjyvhngzstA8+eIRvP7qpT2Hxce5tcS/GIJreXqjFm2RirYkgcKSW2
         Tk4tHCZASYwXtcG1obyv4OskhbHfmUce8NJlcJUiMqqk89ayF0pDV9wC4Pk2gnwdF/rH
         lKd+Yrxo5Kd7hQgmTlMhR/JVeW71PYwjg3Jrffg1RPqGiK8T0vbgLnqNn9aQtvQPrS3W
         BWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=NpVt4VPeWJoe4jvmjR7Zfi9vrG4WCqdL8uSvZVASWPQ=;
        fh=5T99cXbFVnqQSvj390hIErVDiIkEA9FslZRhpXjEaKo=;
        b=SCbFh2+hx9HdTNs2epgvMM3ARhfFbljTso6kh8kJAOqXO4IN8ENOcW27xyv1RvvgYx
         DzCDMVhHj76VNxSHHifUduxK98i8EvWN6UUjChnroLT9+MWmvcHc8RUmIVJyf7CB45uD
         JzkW4SIQO76isHptHwMtfyoG/oD/ZDTorsujPmE2AEI1Ilb+1BdI+QhUH4A+lPKR2Xg6
         VwbW9CCozQkd/L8pP7wezlIXw3kxrWMD/ruqEIy2YOkk9I0PiZNXOHrPtNKVGjZ9xqk8
         jobh/X15oK8FDMJJMoWnppeHAddINUeK8zMhA2TEvxf6P9myBFgVbiJc3Pje4/WnQdfD
         DyNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f03165PU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ea7b2esi937170385a.212.2025.06.16.00.15.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 00:15:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f03165PU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR43L-0003Dc-QW; Mon, 16 Jun 2025 03:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uR427-00036Z-Hd
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 03:13:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uR425-0000oF-KQ
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 03:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750058005;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NpVt4VPeWJoe4jvmjR7Zfi9vrG4WCqdL8uSvZVASWPQ=;
 b=f03165PUod3RvUImNYMH8nxnO9Dbh5oaCIHf7PimKoJ3RFysN84GyVFa04n+ooowg01mPA
 RIDrpMog0Ouur6oho2p/fLrxRTRvn0CNy0wFdFQuJXBrmQI7oqQT8BbePygXshv9S7FrRS
 8IrMY+uDdtU+lPFV6Jb4KWtZldhPtHo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-28-ZWxk0m5pO3qwhZh2nhl48w-1; Mon,
 16 Jun 2025 03:13:21 -0400
X-MC-Unique: ZWxk0m5pO3qwhZh2nhl48w-1
X-Mimecast-MFC-AGG-ID: ZWxk0m5pO3qwhZh2nhl48w_1750057998
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7AAC719560A3; Mon, 16 Jun 2025 07:13:17 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.53])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 14B9818003FC; Mon, 16 Jun 2025 07:13:11 +0000 (UTC)
Date: Mon, 16 Jun 2025 08:13:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Sean Wei <me@sean.taipei>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH 05/12] include/hw: replace FSF postal address with
 licenses URL
Message-ID: <aE_D5zVzf3qHRP-2@redhat.com>
References: <20250613.qemu.patch@sean.taipei>
 <20250613.qemu.patch.05@sean.taipei>
 <3aa8de03-911e-4906-a0c5-5b8ea269ad28@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3aa8de03-911e-4906-a0c5-5b8ea269ad28@kaod.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jdnrl7d166Nr

On Sat, Jun 14, 2025 at 07:29:09AM +0200, Cédric Le Goater wrote:
> Hello Sean,
> 
> On 6/13/25 18:44, Sean Wei wrote:
> > Some of the GPLv2 boiler-plate still contained the
> > obsolete "51 Franklin Street" postal address.
> > 
> > Replace it with the canonical GNU licenses URL recommended by the FSF:
> > https://www.gnu.org/licenses/
> > 
> > Signed-off-by: Sean Wei <me@sean.taipei>
> 
> Instead,  I would remove the license boiler plate and add :
> 
>   SPDX-License-Identifier: GPL-2.0-or-later

This is *NOT* something we are doing for existing code sources,
unless the person removing it is the exclusive copyright
holder on the file.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

