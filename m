Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6419392ejq;
        Mon, 15 May 2023 03:55:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ458Knqpjx18lWOVFxHF2NGsX4nGNnJMqi2i1owkEHWdgCgJ/tYWkzVXfYV2HJJ19bfufnv
X-Received: by 2002:ac8:5dca:0:b0:3f3:8dff:68fc with SMTP id e10-20020ac85dca000000b003f38dff68fcmr44193379qtx.22.1684148158471;
        Mon, 15 May 2023 03:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684148158; cv=none;
        d=google.com; s=arc-20160816;
        b=sUNuCbFjflSFlsfwiB472E+X0cNDfNv2fzQzgQZ7rJ3Txnmy7dX9ETR+k7clehBn5Q
         9sNOGX0Sbr4cWJ2vd8aEatcYog3uX98uViDyIAsreIXAEyb2ST8CVYKRnEtKco93WRs1
         wJJPCFCYPzesD1t5HukmeJFzDV5OMUhjOBJfKyAxs/766Unahe5KhhAOkVZcd4M/RqHJ
         eAJp4DG0bOylGFa5xOJNV6DHbRaQ8at8fdJiUDsAg79xTX03PBJ4IpkZTpKPqbEhBfN6
         LNmTEhh5GPPoPQ/FxXv3COZn/MgDE3s38Y4iEp4hieu/Fj6th2VJw7aN51cAdcu89tSu
         qvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=NO8clI/ymP8mHNpHEMT3OOrIyYGGAxntOD4vMAusQzc=;
        b=bp6dbb8i5bkfihijfZV1zIxw80pphNwNhgXQr2O2JwikXka8W1FMos04muLXewfmk3
         RG0DQz1xgJnsGNDjvrFgGKRE6hI4VEW2uJ25BpfJ7l08+Ahbuxs0CGv4QxMk6lFx8NqS
         lbmwy5ecuP71xaqNtkEJUzXe05Fxr6+RuAnDxMS16JC5PSECvIkNHrf10/ZYKMiLlZms
         GVD/9a47irpD2xt+/CbAxcbHMMBTYIjTb5o7PAsx0vAHuxebcs0i+ygMpcoI7LCv93sR
         g4lDeup9ZIPesbH8IQ1RynnSNrN/cNL3SMDMVASmIDwT13bsjC/HbOM/qGxLnu0gZnl8
         RwWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JS0UZris;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020a05620a001100b007518870b939si1391487qki.609.2023.05.15.03.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 03:55:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JS0UZris;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyVqu-0007pC-Ed; Mon, 15 May 2023 06:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pyVqr-0007os-Ma
 for qemu-arm@nongnu.org; Mon, 15 May 2023 06:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pyVqq-00037g-4J
 for qemu-arm@nongnu.org; Mon, 15 May 2023 06:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684148079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NO8clI/ymP8mHNpHEMT3OOrIyYGGAxntOD4vMAusQzc=;
 b=JS0UZrisUvLZXKIhh+RKcISRF0MdYB8BDTZO0Kf74OoeU0jwm7Gz+vmvcEjH0GnepwsLy9
 PzsOI5A1JmHizCHMWHaj5bSZditi7a4y1HnlXOpx9b6b1HiTYAfQqLLivZkx629Tktq7Xc
 96Fh79fJuIv0sDIKSzjMCWOkzKPLWZk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-WULRToWjMNydBSIfypPY9A-1; Mon, 15 May 2023 06:54:35 -0400
X-MC-Unique: WULRToWjMNydBSIfypPY9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D0A42811BC0;
 Mon, 15 May 2023 10:54:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26471C15BA0;
 Mon, 15 May 2023 10:54:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AC42E1801081; Mon, 15 May 2023 12:54:31 +0200 (CEST)
Date: Mon, 15 May 2023 12:54:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Hao Zeng <zenghao@kylinos.cn>, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH V2] hw/arm: enable qxl for aarch64
Message-ID: <wfky3jb2iuza4aom6si2jfkbgnjhalkpzmsc3x2ofjzilgtssw@ejwsuey3khif>
References: <20230512093108.1180726-1-zenghao@kylinos.cn>
 <ZGHyvBb8BQdKhWEy@redhat.com>
 <e2d06c7a6528a16b6ae58360d49a1fc9c7e8ade5.camel@kylinos.cn>
 <CAFEAcA8fN-+FUJapo=+ObZgfrJW32ccFj22qvU92ndNzPLQ9Dw@mail.gmail.com>
 <ZGIDg+8xIOGpTIO4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGIDg+8xIOGpTIO4@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 2RrTp/5SeZnr

> > > On Mon, 2023-05-15 at 09:52 +0100, Daniel P. Berrangé wrote:
> > > > Overall, IMHO, we should keep QXL restricted to as few build
> > > > scenarios
> > > > as possible. Given the status of SPICE, possibly we'll even want to
> > > > deprecate it on x86 eventually, not add it to more arches.
> > > >
> > > > What are you seeing as the compelling use case that requires QXL to
> > > > exist on aarch64 ?
> > 
> > >    Thank you for your answer, it made me learn a lot. No use case, just
> > > outside customer feedback on the ARM architecture qxl use has problems,
> > > I compiled the community qemu, found that the default does not support
> > > qxl display, so the submitted enablement.
> > >   I agree with you, please ignore this commit.
> > 
> > I would still like to know why QXL isn't automatically
> > enabled like every other PCI device...
> 
> Historical reasons ?

Yes.  Any display device with a pci memory bar is disabled on arm due
to the caching problems.  So virtio-gpu is the best option available
(and it IMHO still is, it works without strings attached).

With FEAT_S2FWB being available (not sure how widespread) we might
reconsider this.  One advantage would be that a pci vram device with
dirty tracking allows for GOP support, i.e. efifb works.  Needs some
changes in edk2 too (include the QemuVideoDxe driver in ArmVirt builds).

If someone wants that I'd recommend to enable bochs-display for arm.

VGA + QXL would add complexity (and attack surface) without benefits.
Nothing running arm is going to use the obsolete features of these
devices (2d accel, vga text mode, planar video modes, ...).

take care,
  Gerd

