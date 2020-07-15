Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp353908lfm;
        Wed, 15 Jul 2020 02:38:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyll8+vUEqfKGV01xJwnkX5REjQ5cjQTYJ2Qp51n153DuQnSQqa+ZdCbI5RAp7IpFnqbGAp
X-Received: by 2002:a5b:acd:: with SMTP id a13mr13708893ybr.351.1594805899475;
        Wed, 15 Jul 2020 02:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594805899; cv=none;
        d=google.com; s=arc-20160816;
        b=t2VQX3fTerRwHND41Xe1Rx4ZT07mMATnUCVVbHEQoQLJvM36Ymlo12Mv7kIp25JIyF
         gwOupnjZoCrvePoDG3xFY7TXeF4qbezCIsHVz8W/DbzyEnCaqRsguPQJ9TEcbtm1tM2i
         zdqU2r0aEIwQjJIx0ofNDSUWEBWaMbcvv+LM8Vewy6gQyrB++0nSpPAG0qhVLm2cxwVk
         +6cb1dXTp/9x+tyBEV/3Pw0Kh9pAEEp4C2Z6+NTSP3t3hn+bRfbnRFsUhEJFxNdiPUl6
         CY98PYB94Nc9TUIPnbXrd9bFavlbwWZQ3PeV3dqaN91rrNsm9L04gzjB4x+Ep1XO7Kwt
         W5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=/6BbWMPTOUOHAr4XvA1A1gk/qjW4H8USIgYOndpwLeg=;
        b=oKV7QWvj+rxsJB3/lKr0PBYAiWX5bGAEKW6QwuDSHZ3al6dX2HNGGuT6kBGBnLVAto
         uXagnFkuiJtdogwySSTsMoR9gN2OyJchQro/25i75ZtL7lEsrky2r52wKxaUqxgML01L
         rp+wDysn63179eD5luCMbsRncwp9mrofTKxPSUV9zAHuGd3duu0j9Or1XbWWhPuZt5Wg
         RgxuOvHLAX8MeuRjS38GXjsjbzGeSXHf3DEeqn6PHzkC7NWdLqMCPjQegu0HKKDrR/uS
         S2xuVoA7B97/k3VV7dGEaLDSpvYbC8ifOTGJuLv/T8u5Qmm+32XT6N2KonRpNAZ7Uygh
         1Dsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eX32PXrL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si2143299ybo.468.2020.07.15.02.38.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 02:38:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eX32PXrL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvdrm-0006xY-UC
	for alex.bennee@linaro.org; Wed, 15 Jul 2020 05:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jvdrh-0006xN-6A
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 05:38:13 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54553
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jvdre-0005SD-Ca
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 05:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594805889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/6BbWMPTOUOHAr4XvA1A1gk/qjW4H8USIgYOndpwLeg=;
 b=eX32PXrLdtfBY5ujKL4Jc66nLv1tiPlWWxIpdHOuR1/r+f0EpUBiIn6W20fYbELMg7otdB
 FpOpwE6QqeaNKpFx+iRso9nFqQw7o9yKuZNxwrVLwcPXjpozBbid2yxyBN5RXKnG2K7UYT
 0OgaEAeHtwF0b04HjyhhqDAvqEHtUZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-38_CCw9hNh6yJD1CxT31ZA-1; Wed, 15 Jul 2020 05:38:07 -0400
X-MC-Unique: 38_CCw9hNh6yJD1CxT31ZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C35119067E0;
 Wed, 15 Jul 2020 09:38:06 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 824646FDD1;
 Wed, 15 Jul 2020 09:37:57 +0000 (UTC)
Date: Wed, 15 Jul 2020 11:37:54 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 3/4] hw/arm/virt-acpi-build: Only expose flash on older
 machine types
Message-ID: <20200715093754.v376uobabdis7ykg@kamzik.brq.redhat.com>
References: <20200629140938.17566-1-drjones@redhat.com>
 <20200629140938.17566-4-drjones@redhat.com>
 <20200713104907.335bf762@redhat.com>
 <20200714055109.owrlob6m53notzh3@kamzik.brq.redhat.com>
 <20200714045537-mutt-send-email-mst@kernel.org>
 <20200714092325.5klaeqelu46mhg76@kamzik.brq.redhat.com>
 <20200714164141.1ce6b122@redhat.com>
 <20200715063648.rigcdnaxveened6u@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200715063648.rigcdnaxveened6u@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
 lersek@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ard.biesheuvel@arm.com, philmd@redhat.com,
 eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FPg2n6F5lO2m

On Wed, Jul 15, 2020 at 08:36:48AM +0200, Andrew Jones wrote:
> On Tue, Jul 14, 2020 at 04:41:41PM +0200, Igor Mammedov wrote:
> > 
> > In this particular case I'd drop versioning.
> >
> 
> So it sounds to me like we have some flexibility in our versioned machine
> maintenance. We can choose to forgo the usual compat code when the risk is
> deemed low enough. And, if somebody screams, we can always fix it later.
> I can live with that. I'll go ahead and respin without the versioning.
>

Actually this patch was already merged

  2c1fb4d5c011 hw/arm/virt-acpi-build: Only expose flash on older machine types

and I don't see much value in posting a patch to remove the compat code.

Regarding the result of this discussion, my take is that unless the
policy is to always or to never use versioning, then I think we should
have guidelines documented which we can follow. Would one of the ACPI
maintainers like to submit a document with the reasoning for when and
when not to use versioning? And also for what's expected of the
commit message justification when versioning is necessary?

Thanks,
drew

