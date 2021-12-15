Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp58376lfj;
        Wed, 15 Dec 2021 10:32:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXUiO9dy+R3ZHKHG10a2D81amxfvXT8zWZ+wHQphpt8XJi3f/aUN0fTmEI6aVcg1KbjgFz
X-Received: by 2002:a05:6214:27c4:: with SMTP id ge4mr2244762qvb.39.1639593157676;
        Wed, 15 Dec 2021 10:32:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639593157; cv=none;
        d=google.com; s=arc-20160816;
        b=wFvvEhwtQQYnJEmlUg9tb0WyVI/i3alhGNlX3K1cauEwWT5wcETsA/M8H0zAnhGsps
         XDRe+Q/MPLyvrXvqrNPOGvSc7Ikxr9Dvi+eg3ziU67NC/6Ktpsizy+bgRZaQ+nWnu8lM
         tls0irLCW5WC6t1iU5dzuYcE3YIdXa/K8aXKLUa0z0xYwbtey3KrOdNm43/b4I/nBtW+
         z2kbsrFPRvcQTqlwOHIMC2Kzt4R6LyjvlQ/7b3hA/4PQUBsi0ND+ZHMV6A8+EE3ezgK4
         TIsuB2uIEbymg2YLeWJkD20WeTpQ1PMxoAAN9kQxpT/qSWprk2SS5YXK5mQuSln+d3rl
         xtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:to:from
         :dkim-signature;
        bh=mqwrPSbY/JGb754RPS3dLXynKiuM1Q8YUyM0R4IY3/s=;
        b=nJE+FPjCYonthx0DQJKt5hn/miwKF4CzJZRHinlasIfSo0p/m0+nDS23Jdk2Br3rXA
         ESYXIa+WumYtsXUmu679bRZ5djrJ0C/dEOPLQPcCnqmGJEKwYgoDTnPrZ3IZ6Wj8H/7+
         Lqjj9TIz1skBJUFa0wEZogBzKuZNv9ZUp/lZBPZ2QF/ho9Zlcrf/4QXWCAi6LvlP//qw
         /8Kn60liQPI4jO4EsSwV/ZzuXu1LI8NB7py62B2x6whkhqdslN0dDc0C5fN6QLdTJIoL
         NV/rorvEJ3dXMYnZOHiTIhQiOTKdpK048MMrvr0Bxw5DLDP89b8tuacNatjNv3440h6u
         IRyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YYyJ+5QL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si1308404qka.353.2021.12.15.10.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 10:32:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YYyJ+5QL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxZ4u-0005al-Vn
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 13:32:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxXuZ-0004rc-9N
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 12:17:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxXuX-0001wm-Sn
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 12:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639588668;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mqwrPSbY/JGb754RPS3dLXynKiuM1Q8YUyM0R4IY3/s=;
 b=YYyJ+5QLZDnpb/ac7oI1P8TuWKrpae4NLjIu1CdQJT0YuTR3dp00HvXSZzHCQFw9WYKokj
 U4OayA/N8nt88wkhyQJ5VdenK/Qr/XJXQF0X6RH/XnryT5QkE2guImZarYaSI22O+7Du3X
 HqiVN7mnzmbeBDheVrX4UbtA9bAPjAk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-7fM5LB-2Mtujisi0cZSgGA-1; Wed, 15 Dec 2021 12:17:47 -0500
X-MC-Unique: 7fM5LB-2Mtujisi0cZSgGA-1
Received: by mail-wr1-f69.google.com with SMTP id
 f3-20020a5d50c3000000b00183ce1379feso6100552wrt.5
 for <qemu-arm@nongnu.org>; Wed, 15 Dec 2021 09:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=mqwrPSbY/JGb754RPS3dLXynKiuM1Q8YUyM0R4IY3/s=;
 b=0pG0Mc+O1T72ocVqRMViK5/AzZeJRyL+Un3HF9pvHT7DKOKPl3Y+NxK32Pe6Bm8uDZ
 +XjF+wojDW7FpA9gul/KkqoRFZbSQpDe8Fw/idGnypXrh2YM802TOR5F78jX4rAWYUl/
 +rcj6YDhpfKKOntIGEc335eMLzsC7yvJqa5je7EvNepARUG9UvcDG+CVTQsbxWEaUIaQ
 k4bw8/WsWvYfkwg98GLItQZ60uFgyFz7R3XBgvTS+i15PmzeJcfYDN7k1n+MDcwhgNtP
 mSTKE11BGC654BBJpX7teZbVTJbELQGpXDmZYUFvQkfxoreZLgl58bDk5Almity5w/gw
 a8BA==
X-Gm-Message-State: AOAM5307Gmr4R7T9I7dq4Ylc1MFhTXlw0IuPxQsOcNdnEQ0VNImlimrK
 whdOmIDHPmQhVmr3Z6coq+VkOwHpALttP91R9yNpQ3diPpipuisCDFmkYKcM+dEmGYt8KJFZgCR
 1FU4k/PtbCp2G
X-Received: by 2002:adf:b35e:: with SMTP id k30mr5252603wrd.707.1639588666288; 
 Wed, 15 Dec 2021 09:17:46 -0800 (PST)
X-Received: by 2002:adf:b35e:: with SMTP id k30mr5252578wrd.707.1639588666140; 
 Wed, 15 Dec 2021 09:17:46 -0800 (PST)
Received: from localhost (static-174-144-85-188.ipcom.comunitel.net.
 [188.85.144.174])
 by smtp.gmail.com with ESMTPSA id o4sm1334197wmc.43.2021.12.15.09.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 09:17:45 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH for-7.0] hw: Add compat machines for 7.0
In-Reply-To: <20211208170241.110551-1-cohuck@redhat.com> (Cornelia Huck's
 message of "Wed, 8 Dec 2021 18:02:41 +0100")
References: <20211208170241.110551-1-cohuck@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 15 Dec 2021 18:17:45 +0100
Message-ID: <87lf0lyeh2.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9pjZOXUARFY4

Cornelia Huck <cohuck@redhat.com> wrote:
> Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I did a similar one with 6.3 by error, I think we should get a script to
do this everytime that we increase the version number O:-)

Later, Juan.

