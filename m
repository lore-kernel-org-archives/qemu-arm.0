Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1070474ejb;
        Tue, 18 Jun 2024 15:05:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFb1B/ub5SrE/92Yq1ytUvwWKpt6dnj2vENSXexXuaJSy7udZCbWJlElmc98s2e0zqWd+2SndvO4ppRTcVvBXpFt1s6Soh
X-Google-Smtp-Source: AGHT+IEtq7nD/LVHPaiH0gLBl+i9wJpOjtyjLEuOTZcicML4o3XpgnWe3Mdn9UY6eJKQn2b/pVqI
X-Received: by 2002:a05:6808:19a6:b0:3d2:2999:e14e with SMTP id 5614622812f47-3d51b97dce5mr1257829b6e.18.1718748343008;
        Tue, 18 Jun 2024 15:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718748342; cv=none;
        d=google.com; s=arc-20160816;
        b=IUYGbzzx+S84H17u7z+F9UFhCv2V7xsqGW4rJuPnhoWYi7/SFpO63HiOItytZfUcoX
         zECXA4+J7XLLpDJk1DuclRmwuH99XWOpSJWawx0AhFBQF8Ga5Yt5+LhnBgzLkZgWGKSb
         eLpRZtRLaOHIjdmnKGruwifNMbUUW4/8CRnLrdTIcWn+s1cQ9tDMxwxdfNI/gs/gDuUe
         hrMuwNapOMkeLm/n5j/AqvxH3raUC6cV8pI8gB3BPTqzd3fUSILFCee0JLALkK79ohEl
         AIXMEUjOrTcIvCqBp4WXY8Bn0V5nKuvTXLRqfWZhA0w1GbbqFUdjqql/VMVsmnxF8vNs
         dm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=iMvIOYzPkVwpqcJA0MhGMbpGeGHqs/LPmuHKVZYPvvI=;
        fh=tAZ/crXeGm5qaveCA52VM0DxlLjDl3Jb3T3bVPYlr+U=;
        b=bHPTx+Y6COWWR7QmLxZaF9VbEzgjL9MrVIVqLraWeBA8Fodky7Il5X9LkvtFnPK9Ys
         uz/S76hFr5yb+GqUIBKYuV2nYTfAnAwXb14RYnYYDA9Z2tJDqsYyTsKcWFiqDgZL788L
         7sTYqEVnp7NImqXOgWwE4ALW+VRxpqXOtrTXf9IFjjfBsQE+gxu4c2V/pgD1JxbUBp1R
         to6/TEbLDuNlFTATlUn09wa8fzIFiaj2FCAA6jhB1SajgE9px+QFddaz1PWLDFPP9dyx
         NIcYK+bhMHfhbnYM9SG2esw0nlQtJeS63eNuebW1yIEjFlzuo5ELfPGHi6nNkb6qYHCr
         IpSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DQz99CEd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-80da0c3aaa3si999855241.116.2024.06.18.15.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 15:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DQz99CEd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJgx6-0001zH-CC; Tue, 18 Jun 2024 18:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sJgx4-0001yf-HO
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 18:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sJgx2-0002H9-UJ
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 18:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718748315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iMvIOYzPkVwpqcJA0MhGMbpGeGHqs/LPmuHKVZYPvvI=;
 b=DQz99CEdzJkGRKeBbMChz+VjbP4wdSaC3EBeRG+d8pw9HhSrmuAJX0BXQBSkPFGo8gVvw+
 fdjq7PDpNWBgjFxKwS9l0W4uCu+/x6yBJIRUE1qHnSH/eoWGmpJHrwSsh8/nWv9oARM1Ei
 xP8uHUnYQIcha0rm8GK5sbYhNOCQucU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-I7XrayDzPRKWdJ_G0-hkOw-1; Tue, 18 Jun 2024 18:05:14 -0400
X-MC-Unique: I7XrayDzPRKWdJ_G0-hkOw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3625503233eso107946f8f.0
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2024 15:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718748313; x=1719353113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iMvIOYzPkVwpqcJA0MhGMbpGeGHqs/LPmuHKVZYPvvI=;
 b=V1v4++9ejhujWtrjWlZngGoQ7YaJcc0qNq4jwWhs0nNknUrwxNo5+hVufRmVOR520G
 LqoGc7+FiPkmSOxG8pyDuRmwfWTINVAMYRKwQhS+4jJRxU1lfLq9bzexGmrb0567bqaY
 HnhhYkn7gLac5xmcWlUdhQnW9IQc62tN24Z0P1WUpUG1QElb3nNufcKtaozFumMIc5wH
 qp+kUT04vvt/BksxS9ANiYI9PYYhVXLu8ZDgabIiMlgIAiIesQr0coCC2GIGnUtwB9ze
 PabS1RreMcNEPpZ7iBb5IxbeSTxAWgmXRy37Ee+oB5Kxdv3UbglYaW1MTS8fSWY2NnAb
 7yJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtvgr2EfDBVFRAkhHrAyxe5KZdSNZiQydZ+bn175qMhCuVNyjXVHMPPHQQu4rXPpwb/yIeQwFO6iRGhnHmE/MeE0QZ
X-Gm-Message-State: AOJu0YxrwdyR3X/YBey6T/kOZYsoBRFCVTsBjOFO9KLNBVPxsp51sJmZ
 y1u1NHSKfnfDFw1Qdl+wHfCcSQS1sg3T6hj0yivUrPq+slZdyQcTUVWlIBkE93AFSZVZx7F3uMM
 u9pxLUeTCwrA56ccykHMuCh0sRz1FpdWlqrLZnyi1eP1tjNIv2A==
X-Received: by 2002:adf:f4d1:0:b0:362:1d6c:b867 with SMTP id
 ffacd0b85a97d-3621d6cb9c6mr3340030f8f.3.1718748312922; 
 Tue, 18 Jun 2024 15:05:12 -0700 (PDT)
X-Received: by 2002:adf:f4d1:0:b0:362:1d6c:b867 with SMTP id
 ffacd0b85a97d-3621d6cb9c6mr3339980f8f.3.1718748311931; 
 Tue, 18 Jun 2024 15:05:11 -0700 (PDT)
Received: from redhat.com ([31.187.78.82]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607510340fsm15251557f8f.93.2024.06.18.15.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 15:05:10 -0700 (PDT)
Date: Tue, 18 Jun 2024 18:05:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: peter.maydell@linaro.org, wangxingang5@huawei.com,
 shannon.zhaosl@gmail.com, imammedo@redhat.com, anisinha@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3] hw/arm/virt-acpi-build: Fix id_count in
 build_iort_id_mapping
Message-ID: <20240618180459-mutt-send-email-mst@kernel.org>
References: <20240618211110.922809-1-nicolinc@nvidia.com>
 <20240618171311-mutt-send-email-mst@kernel.org>
 <ZnH53Qaqp5+Xo1jo@Asurada-Nvidia>
 <20240618173233-mutt-send-email-mst@kernel.org>
 <ZnIBbeITxG4ZRVVm@Asurada-Nvidia>
MIME-Version: 1.0
In-Reply-To: <ZnIBbeITxG4ZRVVm@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: USU05BbypmZb

On Tue, Jun 18, 2024 at 02:51:41PM -0700, Nicolin Chen wrote:
> On Tue, Jun 18, 2024 at 05:34:21PM -0400, Michael S. Tsirkin wrote:
> > On Tue, Jun 18, 2024 at 02:19:25PM -0700, Nicolin Chen wrote:
> > > On Tue, Jun 18, 2024 at 05:14:32PM -0400, Michael S. Tsirkin wrote:
> > > > > @@ -306,8 +314,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > > > >          }
> > > > >
> > > > >          /* Append the last RC -> ITS ID mapping */
> > > > > -        if (next_range.input_base < 0xFFFF) {
> > > > > -            next_range.id_count = 0xFFFF - next_range.input_base;
> > > > > +        if (next_range.input_base < 0x10000) {
> > > > > +            next_range.id_count = 0x10000 - next_range.input_base;
> > > > >              g_array_append_val(its_idmaps, next_range);
> > > > >          }
> > > >
> > > > A change of logic here - I think the new one is right and old
> > > > one was wrong, actually. Right?
> > >
> > > Sorry, I don't quite follow that question...
> > >
> > > Doesn't a patch correct an old wrong one to a new right one?
> > >
> > > Thanks
> > > Nicolin
> > 
> > 
> > So if base is 0xFFFF what should happen? I think previously we
> > skipped an entry and that is wrong. So that's another latent
> > bug this patch fixes then?
> > Worth documenting in the commit log too.
> 
> I had noticed that -- yes, ideally it should have been "<= 0xFFFF".
> Yet, practically input_base can never be 0xFFFF as it's calculated:
> 
> hw/arm/virt-acpi-build.c:245:                .input_base = min_bus << 8,
> hw/arm/virt-acpi-build.c:305:            next_range.input_base = idmap->input_base + idmap->id_count;
> 
> The first one always sets input_base to 0xXX00 (min_bus = 0xXX).
> The second one, as we know for id_count, must be 0xZZ00 too since
> input_base from the first place must be 0xXX00 and 0xYY00
> hw/arm/virt-acpi-build.c:301:                next_range.id_count = idmap->input_base - next_range.input_base;
> 
> So, it's a case that could never be triggered? Probably not worth
> highlighting IMOH...
> 
> Thanks
> Nicolin

Makes sense.


