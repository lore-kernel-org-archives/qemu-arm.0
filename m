Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1395216lfy;
        Sat, 15 Aug 2020 08:23:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8VrKjJNdWYak59eiHiTDUS7JuDx9Cb3WD9aZotwI+ftAhB6rXDUZ/qvxUUpFgaZxvNieu
X-Received: by 2002:a25:d56:: with SMTP id 83mr11423681ybn.33.1597505015747;
        Sat, 15 Aug 2020 08:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597505015; cv=none;
        d=google.com; s=arc-20160816;
        b=B1sTihMEcxWli/PwbaZn67L1BGhsyxXrURQf3VoYi4SIu36aLNP/0h+aYiyI2qVvp6
         qPrCLTDSKh9ktXSdRTt3G8mQnez8ss2XOeNKvNvs0Fzc3OfmoaEQD7n1eKnI2Ix6sDon
         R6uLtP0nDebQERQOPsSP35dKPf3lUIsEE//Ru1aGG8Z4jTUcGFyjU6CXi/Y2OBKt8qJK
         0t50W9/5+6QXB0fExPV5tpNN15Ki+VS7ROWjAmhlyT7ABG0bqZbNIVOIZMWRFgK0PxEm
         KQ5MUZOxrvJ6Gch2j3pEFUHV88NPzKRz66+swkNU5SyDAONnhyh+IWjc9Acz3CgzfgUB
         fJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=q1imAkULvth5PHCHqSf2NcPALwbxgjmMgsRZwc6yxT8=;
        b=ws5yV40129ftWQa0Eb+zIsUJ96fe/9GcfHBuG9XsqV/lXAZyJeF/kJUZNtlNjfdlrD
         8r5mmDg2Rz89tkltrSAmZ4wuk3pyVGjX+d5jEFdhCNgWX8ZBqeI5dlWooLzcW5FVV6wV
         T232edH8l9pKQPU60LKzzjAPCQSDekJBUWAjb4YO7qflDU423nXLxRKiA7wZsDXIfyFI
         AGdQdKF7JNoxVKwcRQie0CUWPCo201ted7ZI7Yg4Oy3coovso5sSS3bE6mVelODT54We
         k4yD+/o8uG1v5j2ZRajS7OWtwJbSXyZvZPH88w6JjGz3sCZNkvvTEY/4oEM9p4kOISHD
         sP/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jPxlmqPZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q142si11565099ybg.188.2020.08.15.08.23.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Aug 2020 08:23:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jPxlmqPZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6y1v-0003MV-14
	for alex.bennee@linaro.org; Sat, 15 Aug 2020 11:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k6xy0-0005S1-HW
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 11:19:32 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26700
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k6xxx-00022w-Gj
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 11:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597504768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q1imAkULvth5PHCHqSf2NcPALwbxgjmMgsRZwc6yxT8=;
 b=jPxlmqPZ22YLaEaWUaabN1o+0WOalB21EpAAWAnRicQnhq/QXmnfeuSIm3RlBeM4EiTHAy
 KaEzG4Mp8kuW6Mk/BQ72SSXInt8AsojdseOBwyAm60F75vMRonnCrwaZSFfpubUphcgRMs
 EWzpnVsH/yaU2hS/ch++pTvF+Y+Tzxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-FwaL-3rnMdiyjDiQmmSEfQ-1; Sat, 15 Aug 2020 03:17:43 -0400
X-MC-Unique: FwaL-3rnMdiyjDiQmmSEfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1B9C801AC3;
 Sat, 15 Aug 2020 07:17:42 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C304B5C1BD;
 Sat, 15 Aug 2020 07:17:40 +0000 (UTC)
Date: Sat, 15 Aug 2020 09:17:37 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 7/7] target/arm/cpu: spe: Enable spe to work with host cpu
Message-ID: <20200815071737.4eql77uemlw2nddx@kamzik.brq.redhat.com>
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <bf909c1f4904a22be0804cae9fd6f38ba4862563.1596768588.git.haibo.xu@linaro.org>
 <20200810111640.ykejphmuyirncjwv@kamzik.brq.redhat.com>
 <CAJc+Z1F_vFdJuy2kZnj0gZSOd_8-=rSfWFHjQSPU5XEKQ2KZkg@mail.gmail.com>
 <20200811164954.s2sdjzpqpdh2orks@kamzik.brq.redhat.com>
 <13da2df2-7d90-9512-d1b1-8d7c5f43971c@linaro.org>
MIME-Version: 1.0
In-Reply-To: <13da2df2-7d90-9512-d1b1-8d7c5f43971c@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 17:09:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 philmd@redhat.com, qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SgfglKgKKlTe

On Fri, Aug 14, 2020 at 12:28:25PM -0700, Richard Henderson wrote:
> On 8/11/20 9:49 AM, Andrew Jones wrote:
> > Yes, except you need to drop the ARM_FEATURE_SPE define and use the ID
> > register bit instead like "sve_supported" does.
> 
> On a related note, I think we have a latent bug, or at least a mis-feature:
> 
>     sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
> ...
>     /* Add feature bits that can't appear until after VCPU init. */
>     if (sve_supported) {
>         t = ahcf->isar.id_aa64pfr0;
>         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
>         ahcf->isar.id_aa64pfr0 = t;
>     }
> 
> 
> Should it in fact be
> 
>     if (!sve_supported) {
>         t = ahcf->isar.id_aa64pfr0;
>         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 0);
>         ahcf->isar.id_aa64pfr0 = t;
>     }
> 
> ?
> 
> Forcing the value to 1 here is going to be wrong the moment we have an SVE2
> enabled cpu.

Indeed. I think KVM should add a KVM_CAP_ARM_SVE2 cap. Then, we keep the
code similar to the way it is now, but set ID_AA64PFR0 appropriately
based on which CAPs are present. I think we probably need that CAP anyway
in order to ensure a guest that is using SVE2 cannot be migrated to a host
that only has SVE.

> 
> Similarly, SPE has more than one "enabled" value for PMSVer.
>

I'll take a look at the KVM series for SPE next week to see if
the UAPI will allow us to determine what values are possible.

Thanks for the heads up about this.

drew

