Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp580145njb;
        Wed, 10 Jul 2024 13:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNdjHjDmAVM0SQMmPzMXUj442i+CdYZgY51O9MH31xkuC+TCYZQyXitCbTPIgBq5wAQjkztSaBq/h6zzU6MFA4ETdGT7m8
X-Google-Smtp-Source: AGHT+IFoPEzS3FAdmyRdLkfQyUn3GbYxz4AaoLpb3LeaAPfP5PfjgEzfEzyU6BROFG3G9TqcoXRI
X-Received: by 2002:a05:6830:1dab:b0:703:7786:edab with SMTP id 46e09a7af769-7037786ee72mr6387808a34.4.1720642354507;
        Wed, 10 Jul 2024 13:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720642354; cv=none;
        d=google.com; s=arc-20160816;
        b=nAGEG1YMv2sjRPmE5zYPMxQSZDj1vqBhEeYG0hYX20DPsL1tFcSvgG/es5PsDqBUZo
         CbIJvs2aONhJlXytmbUrmYvcnxeePkvMjexIjhRAB11l2j4njnptnFW3yegh9NOsrvLy
         7Bnuv4L7nUCGq1MY/5BnfY8ghVikHVJGMw30IxXKDCuhvTO1/u9Gv0RjtonzyOEpGvYT
         J5r7dDSgHkv8dB9clFcYJbcPdkLG9Nj3G1ZnWH/TTRVgPbtsP/N+e3OH4UL3IWZT0VNO
         a8liUd/pg7el8gXV/YakSsdJsGK2btTOOBSWaYHXQgyCeFx0ONHbS1jfqaUmhnulLyZ+
         uEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=sne4O/7Zu/ntHPFhCDNtjAjzsvQZBtwZ9haqmTrg9V8=;
        fh=9qrmSZupBOqeyur/H/2y6rmunUJqj1AReHRHLaXlBe8=;
        b=NPKe5B9vXc+DPdDHqWvKLEIQPocoJhZt5mFLmvrjjHiAb3+hCMII/qkS5vCB/f58Xf
         Vs9WkYK1JtNd5xqi0FSC8PK8IhCZx2cgp6rqUW8eTQMm6wmG39CX217S0DMoBFzsEeN7
         sJpSuU6/IGn2PinkSJEF++dQBXUNnTe4KwDwAan+KeOLI3ZGNcIRgAUfRxl6AqR9xSyx
         UnIfCc3y/Owh4PFc2b1AHuv8AAHLD0UZIxHsH8N5Qly9rRN5ZPqJiQtBm8ruJRn3LBV9
         w4ET+ODjK2APuSzVwW09vF91rOqsjYiOZ/1AjvBRFGtiA0WSYQrcvnxmDLaSWIL4wvqV
         xlSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OxUCUdYi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61ba8f521si54228406d6.213.2024.07.10.13.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 13:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OxUCUdYi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRdfY-0006DP-43; Wed, 10 Jul 2024 16:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sRdfW-0006CN-Iv
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 16:12:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sRdfU-00012y-0P
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 16:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720642319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sne4O/7Zu/ntHPFhCDNtjAjzsvQZBtwZ9haqmTrg9V8=;
 b=OxUCUdYia8qFtV9kOxSxaYatHY0q4kUHpyX6FgjQg4n0UPyHvNs7Lon++Sypg8bq4CJPBd
 um+bLc4eRYjmLNuGmdweJIet0eoFl6pl671QmOkiTfDt+hhuR6HT9G5FPs02G+pQyRNTKG
 NyUEpm2DJexwcVIkGIC3UinOBrDgfhw=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-56ELE1q-NwSHM3dx6fNIBQ-1; Wed, 10 Jul 2024 16:11:57 -0400
X-MC-Unique: 56ELE1q-NwSHM3dx6fNIBQ-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-25e2203d055so36404fac.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jul 2024 13:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720642317; x=1721247117;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sne4O/7Zu/ntHPFhCDNtjAjzsvQZBtwZ9haqmTrg9V8=;
 b=E1N8IMleU0bSWp0hYA8zmqfYvbn4FxSCLNRe6hlqtUUIenSgHbC6zsQJWl6EKj0RyL
 R9UqwTEaDd9bLuzmyWqZjOwLbZIrnb4kztsrqAhCLwTFclQ2hal8JSR3mV9P82jfeRee
 Ewu2IB7nToOU8eH9PnDikhvaPAZd6piOlbJWSdWmrcpEE6ibjIMGsx7+3eqW0cDzSPnk
 Xr880MdBUxuw9WRXRnGMMsTcNcigOXZ/7PveqwjFc1ga6USjIADyjBgJmc5lnL+Qx5tC
 vxOObOaTqfxKS8G2EAUaia/0BD/aJgSX520ygaEqyjGxuZt8tWimfEHiAUfAJdgyjDC4
 8o5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXMLXeDAA/D9BRnJGjuM1ZRlHG7CfInmmPrvuCCJL1+y6unzZ0Un9/iTWZyQQvtEgc5Mv9cVXBmQzqklYDa8t3UdYi
X-Gm-Message-State: AOJu0YyBJfRHQygmZ+EVpP1Kl/UMPzoCYSwSgLNmctI9P3EPYFnJsn5H
 DqFpqCzw9pddv3gaEi5lB/UzifPslAdSmKmYJgfksFL5m7+G+Nx84jGjU3CnfKlhWoMz2ywhBHu
 1zlyFZfVPcq10vsWWF3/kMkuuLng0jqX/7+UPEiNBxBQayrfinQ==
X-Received: by 2002:a05:6359:5f8f:b0:1aa:c73d:5a97 with SMTP id
 e5c5f4694b2df-1ac447ca679mr47858455d.1.1720642316695; 
 Wed, 10 Jul 2024 13:11:56 -0700 (PDT)
X-Received: by 2002:a05:6359:5f8f:b0:1aa:c73d:5a97 with SMTP id
 e5c5f4694b2df-1ac447ca679mr47855155d.1.1720642316321; 
 Wed, 10 Jul 2024 13:11:56 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f18ff67cdsm224705285a.18.2024.07.10.13.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 13:11:56 -0700 (PDT)
Date: Wed, 10 Jul 2024 16:11:53 -0400
From: Peter Xu <peterx@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, Bin Meng <bmeng.cn@gmail.com>,
 Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, devel@lists.libvirt.org,
 Luc Michel <luc.michel@amd.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Subject: Re: [PATCH v3 06/17] hw/sd/sdcard: Do not store vendor data on block
 drive (CMD56)
Message-ID: <Zo7rCXtap2lWd4IB@x1n>
References: <20240627162232.80428-1-philmd@linaro.org>
 <20240627162232.80428-7-philmd@linaro.org> <87cynmfggx.fsf@suse.de>
 <Zo2lLLAwcZ8bBvO2@x1n> <87a5ipfigb.fsf@suse.de>
 <Zo6iZjc8YpI1_9dW@x1n> <874j8xfc9s.fsf@suse.de>
 <Zo7dcF8OKfH92RlR@x1n> <871q41f2pk.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <871q41f2pk.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: lu8VtAiz+Y9P

On Wed, Jul 10, 2024 at 04:48:23PM -0300, Fabiano Rosas wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
> > On Wed, Jul 10, 2024 at 01:21:51PM -0300, Fabiano Rosas wrote:
> >> It's not about trust, we simply don't support migrations other than
> >> n->n+1 and (maybe) n->n-1. So QEMU from 2016 is certainly not included.
> >
> > Where does it come from?  I thought we suppport that..
> 
> I'm taking that from:
> 
> docs/devel/migration/main.rst:
>   "In general QEMU tries to maintain forward migration compatibility
>   (i.e. migrating from QEMU n->n+1) and there are users who benefit from
>   backward compatibility as well."
> 
> But of course it doesn't say whether that comes with a transitive rule
> allowing n->n+2 migrations.

I'd say that "i.e." implies n->n+1 is not the only forward migration we
would support.

I _think_ we should support all forward migration as long as the machine
type matches.

> 
> >
> > The same question would be: are we requesting an OpenStack cluster to
> > always upgrade QEMU with +1 versions, otherwise migration will fail?
> 
> Will an OpenStack cluster be using upstream QEMU? If not, then that's a

It's an example to show what I meant! :) Nothing else. Definitely not
saying that everyone should use an upstream released QEMU (but in reality,
it's not a problem, I think, and I do feel like people use them, perhaps
more with the stable releases).

> question for the distro. In a very practical sense, we're not requesting
> anything. We barely test n->n+1/n->n-1, even if we had a strong support
> statement I wouldn't be confident saying migration from QEMU 2.7 -> QEMU
> 9.1 should succeed.

No matter what we test in CI, I don't think we should break that for >1
versions..  I hope 2.7->9.1 keeps working, otherwise I think it's legal to
file a bug by anyone.

For example, I randomly fetched a bug report:

https://gitlab.com/qemu-project/qemu/-/issues/1937

QEMU version:                6.2 and 7.2.5

And I believe that's the common case even for upstream.  If we don't do
that right for upstream, it can be impossible tasks for downstream and for
all of us to maintain.

-- 
Peter Xu

