Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp252396njc;
        Thu, 5 Jun 2025 06:38:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsogjn2Xa63/jn94IIdmijZrgfUp5oI9GVa12xtKGK5VkyRhzW1imOIBg7bXbBLYB41dP7bKnwl0DdNg==@linaro.org
X-Google-Smtp-Source: AGHT+IGSQ7g19S5I4TSYagtshX1PBcM/k05wQnjavPp/BTPRwNvvHjMHhQ6eh4csNbTjIWuwLDoU
X-Received: by 2002:a05:6102:5091:b0:4e5:a567:8e57 with SMTP id ada2fe7eead31-4e746e4fef3mr5794964137.24.1749130686862;
        Thu, 05 Jun 2025 06:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749130686; cv=none;
        d=google.com; s=arc-20240605;
        b=LuHC1Ifpxv4vtkLC5spIGKDnV0D9fPErfroWawx8yMbOuJh7id1HiRrZN3pv04sEg5
         4lbiAZJr7rbVgDpnfYkq5VBdEC1li+EWpoi/99y8iJivmEsSuKJCn/OZJipHHws1Gg7d
         5xS3yrAGyndvbERN+2q1TjKo0TnxnEVcVx56v27+Xc8hvT5M4GJqz7gvtxc+5Lo0xV4t
         WH20rGxO7Yepr9yzL9MPQAZ15LG0cV90etOf+im0XbrBmWpZv7gNEG0jZ0oJmbIwOjdV
         ccTchLUeulv9qXYjsR+WOXB8ctGGk9oD/1GOs3/8K1IXbRD0Z2pz5OmL07TX1hH5phgs
         ZkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=dcs/PgRwrP3LRRWQ9yWdU+Tj4aW+TK81BVmdebMJ6Zs=;
        fh=mq+eA5Ew6Jvzo5gXsNpOksALOJrWL088BluSocoei+M=;
        b=dc+y9RlKDhG6B8YLhpEOeN7K5Wq98wCLVRRbeV301e8LKYDMF99VYM6jCQP4Or4OEw
         JfkvIID/itmz67HcJeqJhCa5t+SZFrs7SlaTYmeTaerI2MiRSy+1ZGOthJ6pLUgVQE1R
         nyX9n4221j5WTQgvHMWaJfoXM+ZBhPjF47V/Ym3aBPTbq6cl/iE35SIKjF8GaT6ekjys
         9jhLXZEqSlCTj9oG+RJ17wEwl7l53w6fOPqNEINzodjauR5BHJvBHiycuEJTmhI/o66u
         zkcXCsSUq+TPCjhZv/nR8S1yyYurg5lWNwhD841WxmtW+pmzl72Cy//lVdjObqtOjT7c
         dXFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ci782QI3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-87e2a3694dfsi4835732241.30.2025.06.05.06.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 06:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ci782QI3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uNAn0-0002ch-8v; Thu, 05 Jun 2025 09:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1uNAmu-0002a5-B3
 for qemu-devel@nongnu.org; Thu, 05 Jun 2025 09:37:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1uNAmr-0008R6-Js
 for qemu-devel@nongnu.org; Thu, 05 Jun 2025 09:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749130651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dcs/PgRwrP3LRRWQ9yWdU+Tj4aW+TK81BVmdebMJ6Zs=;
 b=ci782QI3+Cj8ko55X61MyuaJyUKR0cVpLNI1cwU4ivhlZoTiNKjIj3PW1/qo0EmVLS8jdB
 yo7NLx4HPNVE2Me7IbR0mYlowjg0mukMXsMIAcwFPJzqEYKbq5ePpbKiuy7xHAslra0bB0
 OL9cIE79GkraiNPX4OOlPvtwZYubF5o=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-438-BB8NhiGVNGmtRd704xwCog-1; Thu,
 05 Jun 2025 09:37:29 -0400
X-MC-Unique: BB8NhiGVNGmtRd704xwCog-1
X-Mimecast-MFC-AGG-ID: BB8NhiGVNGmtRd704xwCog_1749130648
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 42EC41955F07; Thu,  5 Jun 2025 13:37:28 +0000 (UTC)
Received: from dobby.home.kraxel.org (unknown [10.45.226.180])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 18F7A18002A5; Thu,  5 Jun 2025 13:37:27 +0000 (UTC)
Received: by dobby.home.kraxel.org (Postfix, from userid 1000)
 id 249BB466513; Thu, 05 Jun 2025 14:21:24 +0200 (CEST)
Date: Thu, 5 Jun 2025 14:21:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org, 
 Eric Auger <eauger@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, 
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1] ramfb: Add property to control if load the romfile
Message-ID: <kep5frpl24d74evoyf367pqkyoj6xez2pirk7xlzcoompyzq4c@ouxab77sdm55>
References: <20250605030351.2056571-1-shahuang@redhat.com>
 <746b078e-bd06-4361-aec7-2301412abb18@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <746b078e-bd06-4361-aec7-2301412abb18@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MrtIiiIswQ8I

  Hi,

> > Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
> > the x86 need the vgabios-ramfb.bin, this can cause that when use the
> > release package on arm64 it can't find the vgabios-ramfb.bin.

> Simpler to directly pass the ROM path instead of using a boolean,
> so board (or CLI) could pass path to non-x86 rom.

The rom is loaded into a fw_cfg file which only seabios will look at.
So this rom logic is x86-specific.

edk2 ships an EFI driver for ramfb, that is how ramfb is used on !x86
platforms today, and I don't expect that to change.

IMHO a bool is perfectly fine here, I don't think we will ever need the
flexibility to specify some other rom here.

take care,
  Gerd

