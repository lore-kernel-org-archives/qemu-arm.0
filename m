Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp759101ejb;
        Fri, 31 Mar 2023 09:29:56 -0700 (PDT)
X-Google-Smtp-Source: AK7set9XW25J418VmRX1SlX0gYLKSvYqZkUscC1Yn+fmVWuQgAEU2s3aniACjETtLaOCsP1xqYrL
X-Received: by 2002:ac8:7f13:0:b0:3e3:8770:bee3 with SMTP id f19-20020ac87f13000000b003e38770bee3mr46112405qtk.1.1680280195979;
        Fri, 31 Mar 2023 09:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680280195; cv=none;
        d=google.com; s=arc-20160816;
        b=ABjjKioGMeD3W/mbxEX/eYf38m1E4PHn+2PFPaf/a/+2kmUffSyty/xN7uYAuKiw6P
         hhUjHZLYy2MW1kan1s58GoX/7G4M7jJ02904azpQgkTLZO2rURhvc7y2rqpfqerwGIbc
         O7LQroyhfbZjls0htiXufc2qdx0Bas30bPdrWJ4JyVy9FdXZBfUr9MqOrJ8xiJu8O0Ua
         6UJnwGqVjISWo33hhqXYVJoKbSMdOgdkbQMfKiibBunNiein8Q9dxTt3aTsnJqYQ3Z6d
         p53prtI2rZdNgyKsMn4DfcwzMBgQ6ZPUnqL/yzp7xfslG7JRMl11dr1ecKuPxhY5DiP9
         biDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=XjH7OydNdpizPAb+Io6Eq1zBFQGAmp//hX6ajk8r6J4=;
        b=kaHyJP74C/arBkQMQHuR9dOV8oovg9tc3n0D60djUNd50xT5I+3ErZ1T2fpT+vKT0e
         472WWzTEH7Z+4MxDn94cHIaOPvSHn+ElkzGutCNoEatEj2SRaWR0qQ7baaBDmm8ElRaP
         gOo08GIYvxw4VSu6rdqTVS+Wt9QTtYps0OKugO8+HuvlSvQxVbOuGFdRi4Nh8/HzjTyc
         g2emSLgm/w7y8nIfSYDlBq/QKurzt9KZl9RjEiZzSghCKPb4fBFQBVn5aYrJNRwgFK5Y
         WCZ9anPbgqDsoVW0DxE8GAp8qGTlKeI807ieL57PYq8eFslxX3oLvJ4zMzscUk6rpoqh
         GJuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Rfl+quEm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21-20020a05622a035500b0039534ccd9casi1719247qtw.355.2023.03.31.09.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Mar 2023 09:29:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Rfl+quEm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piHdA-0008BB-Sp; Fri, 31 Mar 2023 12:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1piHd8-0008Au-Ru
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1piHd7-0005lG-4Q
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680280172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjH7OydNdpizPAb+Io6Eq1zBFQGAmp//hX6ajk8r6J4=;
 b=Rfl+quEmloQ2MFD/vrMEGCZa+STnTYwWGsJaiWzrRaMmXNz47gmHGsZXgliaWigtAJm7dC
 ZyzmFLevTvsJYe0/8QEM0V3mJUChXAs96KvxCyejDj0vyU7b6Wrjg7RNbgAq/aSoTSn/vY
 VtUbQTlwENcgfsFiFrF9f3KoHrrL8uA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-WiCcB-uQOTOWo_94Wyu_8w-1; Fri, 31 Mar 2023 12:29:31 -0400
X-MC-Unique: WiCcB-uQOTOWo_94Wyu_8w-1
Received: by mail-ed1-f69.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so32511628eda.6
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 09:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680280169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XjH7OydNdpizPAb+Io6Eq1zBFQGAmp//hX6ajk8r6J4=;
 b=X/YqqXJ9jGEzR+F2UZIwScv+6ICFMLM2k4l1MquZJbuJdUynUR0rwZbFsL9CWQs5PR
 /SrTvJKr23kn6UcgTYbqBZon+/LpN5Eq8pqWsC9UMKBDVf0C2dMI3Sf9uR7Iogy7vrN/
 uKXI6m1bGOIPlNjPbNJPeTiHo0a6xoa+44zI0+rOeodZsPkl5waLP+loOjFx+InWOl9Z
 AqF6EeeYe/2p4f72U5ueaOGx9jT3GeE6u0FNprxorT/fKQnDfQarpFzpUO0u5kT3YnYH
 NVciQtvz+n5bkgwMqJjpvd7kuQ1ze1j9BsKnMlJ4Tu8WfHKGuTI2Nwb1btJCqC+VGf+4
 ZNkg==
X-Gm-Message-State: AAQBX9dfrM+L40OjxrzJjOIpjkjSiU2V2rAHf19/BjGYU+CnawZZIhKj
 PrlfNwI9ObBYTZAIkTd/AoJW+av7hsRC1qnkj8dhva9LPiF/rIEQQrWXRA6ciAt2PUtalEIAvDS
 RD7pN+l3/Xjg7ksA=
X-Received: by 2002:a17:906:960b:b0:86f:b99c:ac8d with SMTP id
 s11-20020a170906960b00b0086fb99cac8dmr30247477ejx.44.1680280169442; 
 Fri, 31 Mar 2023 09:29:29 -0700 (PDT)
X-Received: by 2002:a17:906:960b:b0:86f:b99c:ac8d with SMTP id
 s11-20020a170906960b00b0086fb99cac8dmr30247453ejx.44.1680280169125; 
 Fri, 31 Mar 2023 09:29:29 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 h13-20020a1709063c0d00b008b176df2899sm1112472ejg.160.2023.03.31.09.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 09:29:28 -0700 (PDT)
Date: Fri, 31 Mar 2023 18:29:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, shannon.zhaosl@gmail.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
Subject: Re: [PATCH 2/2] hw/acpi: i386: bump MADT to revision 5
Message-ID: <20230331182927.04e0518b@imammedo.users.ipa.redhat.com>
In-Reply-To: <b9fcf584-8c83-9d56-c67a-b830b17c1272@oracle.com>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230328155926.2277-3-eric.devolder@oracle.com>
 <20230329010126-mutt-send-email-mst@kernel.org>
 <b9fcf584-8c83-9d56-c67a-b830b17c1272@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mV4XF0k/XqdH

On Wed, 29 Mar 2023 08:16:26 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> On 3/29/23 00:03, Michael S. Tsirkin wrote:
> > On Tue, Mar 28, 2023 at 11:59:26AM -0400, Eric DeVolder wrote:  
> >> Currently i386 QEMU generates MADT revision 3, and reports
> >> MADT revision 1. ACPI 6.3 introduces MADT revision 5.
> >>
> >> For MADT revision 4, that introduces ARM GIC structures, which do
> >> not apply to i386.
> >>
> >> For MADT revision 5, the Local APIC flags introduces the Online
> >> Capable bitfield.
> >>
> >> Making MADT generate and report revision 5 will solve problems with
> >> CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
> >>
> >> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>  
> > 
> > I am looking for ways to reduce risk of breakage with this.
> > We don't currently have a reason to change it if cpu
> > hotplug is off, do we? Maybe make it conditional on that.  
> 
> By "cpu hotplug off", do you mean, for example, no maxcpus= option?
> In other words, how should I detect "cpu hotplug off"?
> eric
I'm not sure that it's possible disable CPU hotplug at all.
even if one doesn't have maxcpus on CLI present CPUs are described
as hotpluggbale and can be unplugged and re-plugged later.

