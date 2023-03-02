Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8248167ejc;
        Thu, 2 Mar 2023 05:39:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/ztYrjh9ms8Bp53uKQVSnnk9VLH/W4Vxu6iY2PCXOdeurkgxo9tE4wyISrCLaUcQIQKElD
X-Received: by 2002:a05:622a:303:b0:3bf:a08d:b265 with SMTP id q3-20020a05622a030300b003bfa08db265mr3042799qtw.24.1677764380218;
        Thu, 02 Mar 2023 05:39:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677764380; cv=none;
        d=google.com; s=arc-20160816;
        b=FcfbEOUp+wE5+ODt68F/GDfmk64oaYGamHCBh/lSM1si+iY0Wh8Ye4z1iCHARwPLbF
         TO/xGMO51L9Cqur6WZs8+9/vfkuZxNrdpLoLcWSE4lDr8v27jhKDyYSGx55F2G1Ef1eF
         /HmkD2RfTRfxfe1ydSIR54D8Y4DqM/9tbh9XhZZtWZI4wgjMAGPNAkVCOBgNtZ/Ll2/7
         XkqhhBcBhQkPZsoPskuhNwPUdmay0mWBEhq704Jn0tTrhwvYT/zv8xZD5ZByNE9Q/G1y
         g5iumD4Rlwfefw/h5cq54gU8sGsvLz43bW/ptOEHm9SDwyc3nTahHfxNrt/1XlEFshPl
         q4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :in-reply-to:mime-version:references:from:dkim-signature;
        bh=8UnfSbMYNNgzoZGawsXpWGkv+4jmC6nkFsLTYDbxsTI=;
        b=c6JqT4tpbVdZNLHMz7AN23++bhw4UUY8dnVL2EecfuH23Ox3/ftI4EX8UJoprB6r8q
         sWh6YORxZWro5WPaSAmKFJAcAfLmbKirDMItkUJfTUvtT9afh2aMMrRdV6KYfCvkPGoa
         dwHOzpgmna6EPcVf9PWWTSQ6FMcEfl6Y7hHtCALKQvBgguUgkQ3kGc3YbU6bVQ/EURS0
         gm7/wNXpkrFI9fJBLnRs8DB5sHD2KgZjdEHcDGjw1ZIL7HjfKJjalTRmmsQYsB4FLEX4
         WLjcQhnH1BShg1ka2D+axecYcJ9UFiLIyMJ0fEKI5eS5LAwtM4BNwaKdUsQ3Mlg4m1Ay
         kZtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JPCVteBB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3-20020a05620a44c300b007423cd4e308si13756387qkp.716.2023.03.02.05.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 05:39:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JPCVteBB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXj9h-0005WB-D3; Thu, 02 Mar 2023 08:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pXj9f-0005Rv-0m
 for qemu-arm@nongnu.org; Thu, 02 Mar 2023 08:39:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pXj9d-0002SD-Cr
 for qemu-arm@nongnu.org; Thu, 02 Mar 2023 08:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677764368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8UnfSbMYNNgzoZGawsXpWGkv+4jmC6nkFsLTYDbxsTI=;
 b=JPCVteBBveJAFKPUxSYUIR65N7ucVurpCC6W9/2BOMwr0nH1n2cE5fq9dCxWr4Wq55bmEq
 6mmvNHdmKtJMXe5VscaCMUY2tO0PdKnceZCoCZ4MHI7NjjqzuFaNHMJV2Fn/Q6goxDnimj
 ikbAANnRz7/2sysEKUDoIjKULzaOzOs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-cfXjlaOPNU6HdqfscfV_7A-1; Thu, 02 Mar 2023 08:39:27 -0500
X-MC-Unique: cfXjlaOPNU6HdqfscfV_7A-1
Received: by mail-pj1-f69.google.com with SMTP id
 f1-20020a17090aa78100b00239fd9e3e17so3223007pjq.5
 for <qemu-arm@nongnu.org>; Thu, 02 Mar 2023 05:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8UnfSbMYNNgzoZGawsXpWGkv+4jmC6nkFsLTYDbxsTI=;
 b=hij6KEhFc3/2HivSxIPobTFGwhMgg4GQ+TaBQt7bLzEv9UOl1URXUn0Cq746KVF2tm
 UD0CPZTO7p9i0LGSDwUv5NkvEwwDsfK/HhEJxWlX2O2DjwnW1iD3C27WULPnn+WC1Npk
 2jXwOpSVr/ljSXZI2w4YIlA9LSq9eZN1pmOuNSPEtZ4xxTlCrSlbMV/4ELc3qtqz0r5+
 /ZzWbMI9ixEdQYlfI4QfwSUV8oRnFBoXLzd/gYOi7A5JG0XNrc+XBtZHThnp/lWNLoBf
 gTHu5BgXwgcgVCnKW4mgBVqi5dIg6SNr88VtsNDx3Rk2BW3NKD6mRjw5ybKal21/hZcP
 o8aA==
X-Gm-Message-State: AO0yUKWMbl7OUlPKMYZxf29xIJKhewZ+tHiTAl8Z+g8ruyX+b9juWqY5
 zHxB4io6g7b4ZyUS1gVgr25kGUtmguw28sSvaMFMVXrE1UOKlo3zyvucXsa2M8uMyr1LKphMeRX
 J3Pr6PgigBbHkj3WVz2zdqmM9MB9u
X-Received: by 2002:a62:8281:0:b0:5df:9809:6220 with SMTP id
 w123-20020a628281000000b005df98096220mr4033085pfd.3.1677764366171; 
 Thu, 02 Mar 2023 05:39:26 -0800 (PST)
X-Received: by 2002:a62:8281:0:b0:5df:9809:6220 with SMTP id
 w123-20020a628281000000b005df98096220mr4033067pfd.3.1677764365873; Thu, 02
 Mar 2023 05:39:25 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Mar 2023 05:39:25 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
 <874jr4dbcr.fsf@redhat.com>
 <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
 <87sfeoblsa.fsf@redhat.com>
 <CABJz62PbzFMB3ifg7OvTXe34TS5b3xDHJk8XGs-inA5t5UEAtA@mail.gmail.com>
 <87fsanmgi9.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87fsanmgi9.fsf@redhat.com>
Date: Thu, 2 Mar 2023 05:39:25 -0800
Message-ID: <CABJz62OMj+ahAKWcyd5xKFnQ9g2ODoKyi2AvAtxe_bYWLXKUOQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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
X-TUID: hob9XEpnAPZ4

On Thu, Mar 02, 2023 at 02:26:06PM +0100, Cornelia Huck wrote:
> On Wed, Mar 01 2023, Andrea Bolognani <abologna@redhat.com> wrote:
> > Note that, from libvirt's point of view, there's no advantage to
> > doing things that way instead of what you already have. Handling the
> > additional machine property is a complete non-issue. But it would
> > make things nicer for people running QEMU directly, I think.
>
> I'm tempted to simply consider this to be another wart of the QEMU
> command line :)

Fine by me! Papering over such idiosyncrasies is part of libvirt's
core mission after all :)

-- 
Andrea Bolognani / Red Hat / Virtualization

