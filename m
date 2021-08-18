Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp161960lfg;
        Wed, 18 Aug 2021 01:58:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNTrVbedHHPja7Wi7AoznU4+DYmZvuLzv1hDPBuywK8EFdq6x3TgxPQOt6Rf15HXgLT/R3
X-Received: by 2002:a02:a619:: with SMTP id c25mr6979050jam.1.1629277092765;
        Wed, 18 Aug 2021 01:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629277092; cv=none;
        d=google.com; s=arc-20160816;
        b=DBYgdLYzqWSboIGd4fweq4G1ko2rfdaLEbWLaWPFOFZd6rzhBAVxwggkAq82lkUTcV
         OLtuQerir6owlCHpJMtx9QCtFyTR4Tt+pabwMxyN0R44B4R0pduVMJCHnhH9u5lKRTeh
         POY8Qdr0NrOdXKKg2tOUJQh0rAEv2ZniBozDxVG0x6r7ti6NlwAA8NH8qVLGNA72HTy1
         MP1wWGvdtS73kJ1HlwgCEVRS351tmtK3U7pddyoFT1u+Uyit4X3GtKv8spNPtZpF7oBe
         GBlvBCB6Sd3vuGD2oNf8LeY7PoghwZEwu6l0GDlGtxnaVuMRRL4lZqc1VDdYivFxJKdZ
         cQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=ugvqCppE31yPVRX2PPY3+BGr068NgzxoeWuPEHBPN6k=;
        b=K2N9jhlUKy4QazZjOL/b/VRLM51je8uU2FSaQTJ0UvnNx62aKhHwotmgysbCZhxUIY
         L2A6wXQqpVeK0X/G/3tO2192MZE2xyJPbNL6OXVcDIliQm8AyUdBbJA2jO0uK7Uk4S8g
         NGLMEunNsoUC703Lz+m2Qwc4f27gUQuYnKyasMk/SRF15p5LPVLci3VClRMvEkbl/4dy
         2VAjdJ3SpN+zBInHHL1dAQwBJVpa3dmthzrqwHGBok0MA11XqnOuLsXOk0HyHbvppIbR
         EJySOa3hztppRvE4ksv/CwVNtxaKLjDfwWD8nRATKfhFIHJJIl2gnCbYOB1IHBDMc4Z/
         sZrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bxNDP09r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si5585726jat.54.2021.08.18.01.58.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Aug 2021 01:58:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bxNDP09r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGHOm-0004sY-3k
	for alex.bennee@linaro.org; Wed, 18 Aug 2021 04:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGHOe-0004rd-5f
 for qemu-arm@nongnu.org; Wed, 18 Aug 2021 04:58:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGHOb-00023Y-SG
 for qemu-arm@nongnu.org; Wed, 18 Aug 2021 04:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629277080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugvqCppE31yPVRX2PPY3+BGr068NgzxoeWuPEHBPN6k=;
 b=bxNDP09rqdSv3OV2UzoHYwK+gBjZUzq+xP/Bjom9ebZC1am/S1tQDnNRHwb1RrNrD3/vun
 I5sgBnmicBqb4ju58Qi2QvcQqYaBd0/w09T1lzFOQXXt1sDeaskpafMkYYRSoD1wXuyJST
 ybIESzyYYufLi41pSRfEwSfIXDUNMPs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-8syZeF5FNh-Y6Ousf7A2QQ-1; Wed, 18 Aug 2021 04:57:59 -0400
X-MC-Unique: 8syZeF5FNh-Y6Ousf7A2QQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 r21-20020a1709067055b02904be5f536463so642015ejj.0
 for <qemu-arm@nongnu.org>; Wed, 18 Aug 2021 01:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ugvqCppE31yPVRX2PPY3+BGr068NgzxoeWuPEHBPN6k=;
 b=j6W8/4NK7e1Jo0qZ60sYbEbXMkpNY3fG+Xd3KOfLU+yIjF1ZLza234hvCSCxrSx2M+
 mHBKUieKjYzVoicru0lqm8Urhh9EFtseiw6qHtrdvKxhnpazGLrl7vjB/i0V8rTpUw2K
 4hTi60FN5sUb82VQVWoQAXdVU862U6lGq08L0aw8NlxdYInNNo1Gro7+c94LzCEFFukC
 qWG9fb7A8iJTfkezICvqm0rfnbg0CSrO6q5Qgaqy5toEZ6I8Q+IxDMMQQ7DUMzwm2tmf
 vxkbLjE9qVOJGlKKB3dDpCsZEKWpiUoAr44hhppiJEVNMB2idtXUXxerkr2H5iyaCQH1
 HKYw==
X-Gm-Message-State: AOAM533wLHxYYtSWcNtNGVeyNcAegqq2DlqkmeQJJZ0KdyAas9NCWV/s
 7lUAuvqZM/5mkQCoRIHuxb6JpNCZl9yo3CYFqEXMRiW1i+LbK6KgzK0myZXAFFgqkYBsFg+FAoQ
 bE66hz9BDjYyh
X-Received: by 2002:a05:6402:10cc:: with SMTP id
 p12mr9006435edu.328.1629277078509; 
 Wed, 18 Aug 2021 01:57:58 -0700 (PDT)
X-Received: by 2002:a05:6402:10cc:: with SMTP id
 p12mr9006414edu.328.1629277078321; 
 Wed, 18 Aug 2021 01:57:58 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id m5sm1745452ejg.53.2021.08.18.01.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 01:57:58 -0700 (PDT)
Date: Wed, 18 Aug 2021 10:57:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210818085756.33lvgz2b6wnhwjn4@gator.home>
References: <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210817115635.d2wxvnvis5kupegh@gator.home>
 <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
 <20210817153639.o5fxdgmuhjusvyhq@gator.home>
 <3846b738-719f-a9a1-a59d-d7f54e71009c@linaro.org>
 <20210817162811.u3i5hcx7eg52akyq@gator.home>
 <TYCPR01MB6160151837F9C9C4167BB1B9E9FF9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB6160151837F9C9C4167BB1B9E9FF9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p7wcMp70pT6n

On Wed, Aug 18, 2021 at 08:29:15AM +0000, ishii.shuuichir@fujitsu.com wrote:
> 
> We appreciate everyone's comments.
> Before making the V5 patch, please let me check the patch contents.
> 
> > This looks reasonable to me, but you also need the 'sve' property that states sve in
> > supported at all.
> > > > So maybe we should just go ahead and add all sve* properties, 
> 
> In response to the above comment,
> We understood that the sve property will be added to the v4 patch.
> 
> i.e. 
> (QEMU) query-cpu-model-expansion type=full model={"name":"a64fx"}
> {"return": {"model": {"name": "a64fx", "props": {"sve128": false, "sve256": true, "sve": true, "sve512": true, "aarch64": true, "pmu": true}}}}
> 
> > > > but
> > > > then make sure the default vq map is correct.
> 
> Furthermore, We understood that I need to add the above process as well, is that correct?
> 
> > That's a good idea. I'll send a patch with your suggested-by.
> 
> If that's correct,
> In the current v4 patch, in the aarch64_a64fx_initfn function, 
> the a64fx_cpu_set_sve function is executed to set the SVE property, 
> and the arm_cpu_sve_finalize function is not called. 
> 
> In which function is it appropriate to execute the modulo max_vq function 
> (or equivalent process)?
> 
> If We are not understanding you correctly,
> We would appreciate your comments.

Richard's suggestion is to generalize the "supported" bitmap concept,
which is currently only used for KVM, in order to also use it for
TCG cpu models. The 'max' cpu type will have the trivial all-set
supported bitmap, but the a64fx will have a specific one. I plan to
do this "supported" bitmap generalization and apply it to the TCG
max cpu type. You'll need to rebase this series on those patches and
provide the a64fx supported bitmap.

I think this will be more clear once I get the patch posted (which I
haven't started writing yet). I'll try to get it posted by tomorrow
evening though, since I have vacation on Friday.

Thanks,
drew


> 
> Best regards.
> 
> > -----Original Message-----
> > From: Andrew Jones <drjones@redhat.com>
> > Sent: Wednesday, August 18, 2021 1:28 AM
> > To: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Ishii, Shuuichirou/石井 周一郎 <ishii.shuuichir@fujitsu.com>;
> > peter.maydell@linaro.org; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> > Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
> > 
> > On Tue, Aug 17, 2021 at 05:53:34AM -1000, Richard Henderson wrote:
> > > On 8/17/21 5:36 AM, Andrew Jones wrote:
> > > > On Tue, Aug 17, 2021 at 05:23:17AM -1000, Richard Henderson wrote:
> > > > > On 8/17/21 1:56 AM, Andrew Jones wrote:
> > > > > > I guess it's fine. You could easily create a new
> > > > > > cpu_arm_set_sve_vq() which would forbid changing the properties
> > > > > > if you wanted to, but then we need to answer Peter's question in
> > > > > > order to see if there's a precedent for that type of property.
> > > > >
> > > > > I don't see the point in read-only properties.  If the user wants
> > > > > to set non-standard values on the command-line, let them.  What is
> > > > > most important is getting the correct default from '-cpu a64fx'.
> > > > >
> > > >
> > > > So maybe we should just go ahead and add all sve* properties, but
> > > > then make sure the default vq map is correct.
> > >
> > > I think that's the right answer.
> > >
> > > Presently we have a kvm_supported variable that's initialized by
> > > kvm_arm_sve_get_vls().  I think we want to rename that variable and
> > > provide a version of that function for tcg. Probably we should have
> > > done that before, with a trivial function for -cpu max to set all bits.
> > >
> > > Then eliminate most of the other kvm_enabled() checks in
> > > arm_cpu_sve_finalize.  I think the only one we keep is the last, where
> > > we verify that the final sve_vq_map matches kvm_enabled exactly, modulo
> > max_vq.
> > >
> > > This should minimize the differences in behaviour between tcg and kvm.
> > 
> > That's a good idea. I'll send a patch with your suggested-by.
> > 
> > Thanks,
> > drew
> 

