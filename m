Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFFDC79FA0
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 08:20:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3r3O-0004tQ-Qu; Tue, 08 Sep 2026 04:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x3r3M-0004sg-Ih
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 04:19:40 -0400
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x3r3K-0004eK-1Z
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 04:19:39 -0400
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a613a6bcd8so19675a12.0
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1788855576; x=1789460376; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FfiLDLIHg+/rK+sAEe09E5jqjN0Y2D6AM5jhqYqTlO4=;
 b=Tf/hvXJ/Ehb71VLfwWYD+EP707hyk6Vtsw2qDQvkozBLTh2VWzMDo8GdO8rKHCNiH3
 k5EZbyQOAXLaaRCAmmzYG4UimyHOLGKkFC2am9NalzVwKxbb0EWYzYF7QTIBjsx8SMK7
 ztoK4/zm+POKmbLVhw7J2UhOFKV3xPzSthveLU/I5qYMslFKDoMYjYf2ZycbujR+llQF
 uaNs8xPJXhjJ1eCnTYjURtkFdUkwXddd7nN5cer25+AHzPkrIGc9EzBW9HI3PLGYLUdj
 SwS/K5HEw1ZV+j6C04KbxVBQTNrYwiDMJcuoi664XT/FfVCvEYsjDyrWML4IFw791F+q
 1V3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788855576; x=1789460376;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FfiLDLIHg+/rK+sAEe09E5jqjN0Y2D6AM5jhqYqTlO4=;
 b=bFzh6BCfZ41lGUkf0ohyJGXFZF2ORsSlfuQp2zyu7EtqEKPDF/vzUI6KrEdznQxoag
 HgCLSP3KUnie62Qpo+7/2nPhmaUYhCMZv1YrHXtAwF3+8HtBAohc+X3Y4sHnAr/eq904
 3vazVzRSmE+QOl+ejwpGkMD8Kg3HUD/XUZgAZhiv7LDFBFWwEexgp/YnLyN+lPMKqRn9
 QZAHqgSnlA4PUZwe/EcfKYqzoCz7SgmXeZ8bEY5GqTS8hC94HjfVDRj4eqqRKQ9brb3x
 D22jXWCOyGwViQ2W5id0s7sIA6K7ktMDI7o5tAdLj5mlvwUhOahVEpozs/2dshoQPu0k
 v/pw==
X-Forwarded-Encrypted: i=1;
 AKwUvByCY6t2iKpmjKaO4qXSqQW5Aq5jlLnk+3SsMIG5mB7Oe2XF6wiczW0XvquugR4NvBLCcEiOF4Jm4A==@nongnu.org
X-Gm-Message-State: AFuF++mIhx7U6vglZLim3ueDURxGEKfoumPkp0NWe95LKpzA8d9LEz65
 qBSE0aI/bjry2dShd6EUJFddnNWG/GlFSbY9J1F1pRvlFSKmRjmEn3+am08UoMNHeQ==
X-Gm-Gg: AYBFou0VN8JXLbo8QrSMohR6TO5rsTcs2lV9Zko6xRoYIOLYgWvj33ntKrAjIF70lo2
 +tx9AxvmeNqR3Sb3d0PToxBFDvS0WxRgTvwCgAY1FKlO8cYX8Kaqmrhz8NqYeLV6r9Dd7Mm7eSX
 poo3vl5LTeUlMIft2xCQzvF1Bwg2+ehL1d7QyvFrUltfS7ggpxs+MkxVQ1IjJOUXeHIlRX83u5s
 CEeLAQSjCDtXftn3k6Wp6AheSsLQjEvC1/ADGJKoyAoDcpQkVWmtfV2fTAfCNukpiHCz5R3yodR
 ANti5MCk+w4+ThRPLqEbtaLlKdlv7dqMH1dWaIa9O4D5spfIqr6bUGmhKrNrf4zT8VVSkrJ+mDh
 xtOisYqN/xcjlXt1nFIPLuH9SWp4BE2HLh7zZDX/df3HQWpzI7fwgsSWQXum5deA0/LTsix7qys
 hU/ryH9o5AeuIjKz3UMGhhza7rKGD6uGzQeaC1baDJ++Chuz96ivoi9Q0PyGJWE6dEqv42AHQLc
 ujqycN7VOLS+UJOf/eKYv3mME8A5A==
X-Received: by 2002:a05:6402:a54a:20b0:6a3:f7d8:3ad4 with SMTP id
 4fb4d7f45d1cf-6a7f68b162fmr70425a12.9.1788855575888; 
 Tue, 08 Sep 2026 01:19:35 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com.
 [35.189.192.250]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d5bd618sm601546466b.56.2026.09.08.01.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 01:19:35 -0700 (PDT)
Date: Tue, 8 Sep 2026 08:19:31 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [RFC v5 12/28] hw/arm/smmuv3: Tag IOTLB cache keys with SEC_SID
Message-ID: <ap_FE62YqJDBt11g@google.com>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162512.2807281-2-tangtao1634@phytium.com.cn>
 <apbdLhuQ7T0I9lMS@google.com>
 <2f430034-626e-40a1-89fb-266ce037bb1f@redhat.com>
 <ap7ZtWhyHgymBTNY@google.com>
 <3f6a482b-105c-4462-8fa2-df225285ce35@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f6a482b-105c-4462-8fa2-df225285ce35@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:33::10;
 envelope-from=smostafa@google.com; helo=mail-ed2-x10.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Mon, Sep 07, 2026 at 06:03:25PM +0200, Eric Auger wrote:
> 
> 
> On 9/7/26 5:35 PM, Mostafa Saleh wrote:
> > On Mon, Sep 07, 2026 at 04:49:58PM +0200, Eric Auger wrote:
> >>
> >> On 9/1/26 4:11 PM, Mostafa Saleh wrote:
> >>> On Fri, Aug 14, 2026 at 12:25:09AM +0800, Tao Tang wrote:
> >>>> To prevent aliasing between translations controlled through the Secure and
> >>>> Non-secure programming interfaces, the IOTLB lookup key must incorporate
> >>>> SEC_SID.
> >>>>
> >>>> This commit:
> >>>> - expands SMMUIOTLBKey with SEC_SID field for cache key differentiation
> >>> I still feel that it's better to have a separate IOTLB for the secure
> >>> world, as it should never mix with the non-secure one; as I commented
> >>> on the last version:
> >>> https://lore.kernel.org/qemu-devel/aaGuGuevX8HFqx0x@google.com/
> >>>
> >>> Then all the functions can be re-used and it is just a matter
> >>> of passing the right instance.
> >>>
> >>> No strong opinion though, this approach should work also, so it is up
> >>> to Eric.
> >> I don't have a strong opinion either. I am just curious about what the
> >> implementation will become once we add further support for StreamWorld.
> >> Will we be able to keep separate IOTLBs or will it make more sense to
> >> have a unified IOTLB?
> > Is that about the possiblity of mixing TLB entries accross different
> > StreamWorlds, as I don't see immediately if that is possible.
> >
> > Or is it about growing number of IOTLB instances as we support
> > StreamWorlds? I am not really sure about that as there are many
> > possibilities (NS-EL1, NS-EL2, NS-EL2-E2H, Same for S, and realm)
> >
> > I'd imagine we have 3 instances NS, S and Realm but each one would
> > need a STRW anyway, so maybe having a big one is not that bad.
> Yes that was the question. Do we plan to have a multiplication of IOTLBs
> for each streamworld value in which case it may become messy?
> 
> Anyway we can rework later. So I would say pick up your prefered solution.

Let's keep it as it is now then (shared IOTLB). After more thinking I
believe that would scale better.

Thanks,
Mostafa

> 
> Eric
> 

