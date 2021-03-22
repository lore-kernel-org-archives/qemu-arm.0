Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3749034lfg;
        Mon, 22 Mar 2021 09:35:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOqUxl+NITq4/Gxcv6d4kyajR+MpZRFH9hx4wbOqnx4B7BbMU5q7gwPz1bf5mki4DTs+G8
X-Received: by 2002:a02:7f8c:: with SMTP id r134mr187742jac.95.1616430904255;
        Mon, 22 Mar 2021 09:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616430904; cv=none;
        d=google.com; s=arc-20160816;
        b=utTk6L42PI0BNHjLBOEAbm2gnLbP2Bmsy4Apzgcsgm0DlcFbeGxLRn9AD1XnAPcdsv
         gz5nk3/T2RvyQdn9nYq3R7nRxEwUuJoTYl/hi/IadCh46oOPhYQzMGxxFmHZKQHxy4WT
         TAJ6BlrvIAnH32v9NdK7YU3ed7L8WE8+nABz/AANNg5MTRebX/RWBVsB36xnm3f//DpV
         IYA84zS1LLVg4bvQyAuaQMi5+/1CHlbTIQfrbkyhMdYVS0NEDmwGE2kCa5wQQ49OjAVI
         2nvnHAAt7nD1vnbdhWisvFEiEn/67CrUgh39fzh1jzFBZ97TUgWqqiLPaFDoCqJlOla2
         a0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=KU2dTkFiOnuGIjl3xtTylH84ggAkTIgZTxZocXWGU2Y=;
        b=rP3CuiW9by+cIqJw3/Qighbpgou7AfT257oSesUfty/cdm2+R3mns8QQ/P4RHKP4mc
         fne0txSg757WPkU1rf3QnSv4bo9dWyeVU7PuhPaDknJ+GHcQgsva7Bv4QSXOlDX8mFiL
         InqQHCU19t92XYRI5Ch+qliqY4cNa8gRjxnLJA/q3Dzq+QA8ys0x5AQq8dh5XYAHL0gR
         ZOdRxFdmI5DgsAHMxhY2eDaxZWzzoU7dCG7QLtPc9n3Qav1twGa7VjA9qN1CA/z32Abp
         RxjzsF3CO8AbCf7k7Jqs75wWChk9fDfEfGjF5xzjvbkPlHp8Mja68AtFtsnaFEJEwiiF
         ciug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KdQ7V0yI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15si9173629iow.39.2021.03.22.09.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 09:35:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KdQ7V0yI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lONWB-00056V-Hm
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 12:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lONU4-0003RV-RV
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lONU0-0000Qe-NR
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616430767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KU2dTkFiOnuGIjl3xtTylH84ggAkTIgZTxZocXWGU2Y=;
 b=KdQ7V0yI1Dc0PS8kur/WBIgZpJUvEZnyELa2pAI/YyI8EeuT99GEFiLPy3UyletsGQ/8u5
 JVSVOmy422djoac0jTHGfbbUO+PkxmEMUhjA+ul2vRhPVcSmW79pQKLJp4utMa2xzUIM6s
 2/8F2+RMJ2SlFdoCBXBeclcrB1Z4ZQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-eDG7b7nDMiKEn35JmBxenA-1; Mon, 22 Mar 2021 12:32:45 -0400
X-MC-Unique: eDG7b7nDMiKEn35JmBxenA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 752315F9C6;
 Mon, 22 Mar 2021 16:32:44 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD1E360C0F;
 Mon, 22 Mar 2021 16:32:41 +0000 (UTC)
Date: Mon, 22 Mar 2021 17:32:38 +0100
From: Andrew Jones <drjones@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH 0/3] target/arm: Add nested virtualization support
Message-ID: <20210322163238.kkuvtvmqeb437cke@kamzik.brq.redhat.com>
References: <cover.1616052889.git.haibo.xu@linaro.org>
 <4b35e1dc2c6a2af117542eca6571ddf1e261fe10.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4b35e1dc2c6a2af117542eca6571ddf1e261fe10.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Haibo Xu <haibo.xu@linaro.org>,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kYUsaehyejpo

On Mon, Mar 22, 2021 at 04:42:23PM +0100, Andrea Bolognani wrote:
> On Mon, 2021-03-22 at 10:07 +0000, Haibo Xu wrote:
> > This series add support for ARMv8.3/8.4 nested virtualization support
> > in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and
> > has been tested on a FVP model to run a L2 guest with Qemu. Now the
> > feature can be enabled by "-M virt,accel=kvm,virtualization=on" when
> > starting a VM.
> 
> Why the need to enable this explicitly? AFAIK, that's not necessary
> for any other architecture: on x86, you just need to make sure you're
> using '-cpu host' and pass a parameter to the kernel module.
> 
> Even assuming this can't be enabled transparently, wouldn't its
> availability it be controlled by a CPU feature flag, similar to what
> already happens for SVE and PMU, rather than a machine type option?

I 100% agree. We should control this feature with a CPU feature property.
NV is a CPU feature, after all. Also, we should add it to the properties
that we can probe in cpu_model_advertised_features[].

Thanks,
drew

> 
> That would also address the discoverability issue: unless I'm
> mistaken (which I very well might be :), with the current
> implementation there's no way to tell whether nested KVM will be
> usable short of trying and seeing whether QEMU errors out.
> 
> -- 
> Andrea Bolognani / Red Hat / Virtualization
> 
> 

