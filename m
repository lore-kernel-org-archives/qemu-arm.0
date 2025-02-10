Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1968042njb;
        Mon, 10 Feb 2025 06:19:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVFJ+wpuwn0KUpDfp+YqXjNH9/QWZEwCEl3MhQxSQAR3pJ9N2SGX1KoFZnDlepeto5JnE1iuuR3I3V1yA==@linaro.org
X-Google-Smtp-Source: AGHT+IEjHdWEeytgfHAVs4RguUPvyz3XTEROXz/c7MYUG0AuPF0C7+uUlMTnYfQgw7GAqQKt7y7Q
X-Received: by 2002:a05:6102:f0f:b0:4b2:5d10:29db with SMTP id ada2fe7eead31-4ba85dea287mr8270809137.7.1739197161272;
        Mon, 10 Feb 2025 06:19:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739197161; cv=none;
        d=google.com; s=arc-20240605;
        b=jMwT0ZWqAH3DCA2XLQp2qweyP02UX6dqw/PbsE4Oh4fxgvZBXik7El1zV3NJK2MZoD
         zDySojQWehh7S4bpb74RvcNQokG98jVppuE08EAFRtELo4uD2T3gDVtqi3VOzM7QFpIA
         Xq9z99Ws533WFo+iwNv/r3M4gTr2cNutsiFvDD0ZPS9zVVLLO84abiZK4jJy2Zu8k7yd
         ySR5yji5juFamuzcpI0ACLUFeaY9nFkNNub6DFy6oy5RAJ4YEWHjiW3isQclYFOXar+r
         NwsSr1XtYSWzr2Q4B91FkFjmAdqgr3bHlTNYIlBNbpVXwUKh4Pa65bUe6prVHllzfns+
         wEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Mt519XCXvXRZv7C4cviRwClcbA5MJY9X+DjkeSxm6PQ=;
        fh=y8sd5Oa5dQsr+9Hh/Tw2JrqwqduaAPogL1rw/MMICkI=;
        b=Lz9EbLkpkpZ2eImJHqb+BsZoztT8MYtFx+Rx8fY+m7EH0uoJj9jze7eJF3nOFmeYip
         kfO7p0Z86GHUx43ZY6MYUPFbbts6/jbvjrAZZdZ2YdRThrDMpjYdWVHdyOW1vmojBvWC
         mrqzfdcWxDhTgZCs4E02KXpJ/c6gu8RAz3y9NR/IPuIwPpeQ1k99M7XEcRd1I7HjUK79
         J4DCVGYUvxnDMlVN2sOk/C3Xx3aqxGzkl2uTeLLMvkW7ZcUZ8VN/akWaCalvYMP72TYx
         4R6R+X211xU6OH35o/9F8S5kwtzNVic775+B9EEpMlPfM11xxvQhx15lkBAZrwdshW6F
         kw4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=areQ6kxo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4bbc1c4bba1si537052137.351.2025.02.10.06.19.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 06:19:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=areQ6kxo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thUd3-0002gR-3E; Mon, 10 Feb 2025 09:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1thUcg-0002UI-0w
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:18:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1thUce-00067z-2w
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739197130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mt519XCXvXRZv7C4cviRwClcbA5MJY9X+DjkeSxm6PQ=;
 b=areQ6kxo5yrfWvqT5fi3YaiQTp1DT2OWh62xidjpjrFAnphB3D3jzNQbxEPYDwPHCfmxvu
 kClWnwJ2xST4yDnxm07igzY+EGjW7kz4rCMGsvoPMMgPaJbHci42So907H7KCEtdwEFWPn
 h79QafmvIcueny8Y2nfjXbAfYzfhpPM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-QIxU-HsuMKiDGM2W9lkLmA-1; Mon, 10 Feb 2025 09:18:49 -0500
X-MC-Unique: QIxU-HsuMKiDGM2W9lkLmA-1
X-Mimecast-MFC-AGG-ID: QIxU-HsuMKiDGM2W9lkLmA
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e4565be110so14812426d6.2
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 06:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739197129; x=1739801929;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mt519XCXvXRZv7C4cviRwClcbA5MJY9X+DjkeSxm6PQ=;
 b=rVsigFkpNkNjQ99LjEEb+8OgvlT90eoQ9f+fcvRJCIPn/36DYjm4Px3dmwSNOG7rkH
 FPfi8U7i02DpCcyg0ihvMpRpTtdK+RDWpz+JIDTHbCnzpoodei6b3UrA/JeGO69SGmPV
 oYvIPRApBRDMa96x811VYK5RSfwaBdbJ4BlaO2/O9e3dblqnvDYIRr0XwrL1Y6ntZYyd
 xzBXfVO3c7yUYsqZ5KQfzgHQdE7IJZDw2TSlrHj/Gkd0se3+iJ4z2jjufykhsMeCatYD
 La1sy9/b8Bf4/+y2FLrgsTvfdEev8xXZaKysZ6YYBkPQ0CmkxE5OXWfkQj65xqp3GyRr
 vUDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWThQa/eSzOhsrhTYfoA8Ase3rMzCTcWzLGY8f1lvi3ahG3inJ6qWLwIJPWkQn+YW+NQu2i0VvAAg==@nongnu.org
X-Gm-Message-State: AOJu0YxipX6+QOW9IkuOwnj2YKxIRVUxCfHp3LDCkcdTa83h3sfmRNwN
 44YEzjaXU52CPkhg24wG9u0HUWToCqfPYuepB63JADdQfnqKTKnjFm3iNwCxY0XT07ODQKUAi5V
 N1Nk4T/1UauJ+VbKAKu/EYZrZ771O/ICZWUiFDJ2kTFijwI8DQw==
X-Gm-Gg: ASbGncvQI1Ih5YYDpvcjO20IBzy7u7RQqut7VuT78xtITltD8advTjF+9RUuC2ABjQv
 7NIP3LOC+D3o7Sja6O+gSql48H6XN3m51XDEyNYFJ2E9IJvtvZwadvShOmbOGBmMrdxnUkF28I8
 UJEhLJH6/uZv1Yc9N8mtlpADl2SOUhld9X8l389LOpoppENm2lU0ibXJZ5wONVzzwKrpj26R1+d
 nJ7vhbIAlxG4ZrrzUHyNfR7LuknG8OxTHST86ftni+k6bcBqL2ge0m8Z04=
X-Received: by 2002:ac8:5895:0:b0:45d:9357:1cca with SMTP id
 d75a77b69052e-47167a156d4mr174918071cf.14.1739197127937; 
 Mon, 10 Feb 2025 06:18:47 -0800 (PST)
X-Received: by 2002:ac8:5895:0:b0:45d:9357:1cca with SMTP id
 d75a77b69052e-47167a156d4mr174917751cf.14.1739197127574; 
 Mon, 10 Feb 2025 06:18:47 -0800 (PST)
Received: from x1.local ([2604:7a40:2041:2b00::1000])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e44f7dcdf0sm29929926d6.39.2025.02.10.06.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 06:18:46 -0800 (PST)
Date: Mon, 10 Feb 2025 09:18:43 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: Re: [PATCH 4/5] hw/arm/smmuv3: Move reset to exit phase
Message-ID: <Z6oKw8I3oijXMnCf@x1.local>
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <20250206142307.921070-5-eric.auger@redhat.com>
 <CAFEAcA_LgrBRbafVQ0vLGPd8xG=wsLjWnKTJ2JSEREYUqgRQBQ@mail.gmail.com>
 <7102d470-ac72-4c02-b8bc-20f1379a4843@redhat.com>
 <CAFEAcA-XK5GwT0b_Ff-8fYnWcDgzaE-0Ei-YqDoXv-aXFGNXUQ@mail.gmail.com>
 <Z6ZHTStx_S9ALdxt@x1.local>
 <3db2e0a7-0f38-4c6a-a9a4-d44e0c6af436@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3db2e0a7-0f38-4c6a-a9a4-d44e0c6af436@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hM8eVptSgNB1n-P6jJ2UOxbunAnjFalrdp-rKx7mh7A_1739197129
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: bhcSAyTdGYwo

On Mon, Feb 10, 2025 at 09:35:53AM +0100, Eric Auger wrote:
> Hi Peter,

Eric,

> 
> 
> On 2/7/25 6:47 PM, Peter Xu wrote:
> > On Fri, Feb 07, 2025 at 04:58:39PM +0000, Peter Maydell wrote:
> >> (I wonder if we ought to suggest quiescing outstanding
> >> DMA in the enter phase? But it's probably easier to fix
> >> the iommus like this series does than try to get every
> >> dma-capable pci device to do something different.)
> > I wonder if we should provide some generic helper to register vIOMMU reset
> > callbacks, so that we'll be sure any vIOMMU model impl that will register
> > at exit() phase only, and do nothing during the initial two phases.  Then
> > we can put some rich comment on that helper on why.
> As discussed with Cédric, I think it shall think about having eventually
> a base class for vIOMMU. Maybe this is something we can handle
> afterwards though.

Yes agreed.

> >
> > Looks like it means the qemu reset model in the future can be a combination
> > of device tree (which resets depth-first) and the three phases model.  We
> > will start to use different approach to solve different problems.
> >
> > Maybe after we settle our mind, we should update the reset document,
> > e.g. for device emulation developers, we need to be clear on where to
> > quiesce the DMAs, and it must not happen at exit().  Both all devices and
> > all iommu impls need to follow the rules to make it work like the plan.
> The 3 phase documentation already states that you shouldn't do anything
> in enter phase that can have side-effect on other devices. However I
> agree we can add another example besides the qemu_irq line one.

The document will be relevant to two sides of things (so far not relevant
to enter() phase, but more on what we should put into the last two phases
either for vIOMMU impl or a PCIe device impl), that I commented in the
other reply to Peter.  I am not sure whether we need such fine granule
document, but in all cases I agree this can definitely be done later. :)

Thanks!

-- 
Peter Xu

