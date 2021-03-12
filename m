Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1049361lfg;
        Fri, 12 Mar 2021 01:18:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJYiI8k7HkIAWdcqxAvUc01zgRXnpUnQ4Hg0SBnC09YmizJxCxLtn/lznTCcDkp7bXnks4
X-Received: by 2002:a25:390:: with SMTP id 138mr17363494ybd.130.1615540682613;
        Fri, 12 Mar 2021 01:18:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615540682; cv=none;
        d=google.com; s=arc-20160816;
        b=lN6Sk62FdLwbkLVxDyQCYsOPL6E2hlnPFuoQeyaCW7gFBvDwEHV112dbAuJgdl65VL
         I9xeMeje2dAAAwFWHBVxd8+Kh2uTklpLtnnX4v6nMf5XeGkC8tg1oPYd3QCnow4bHEMT
         evL9e3Sxww3sW3HaKC3PisHFoGRAtC1qcyQT/DjEJnUtJ4hdiPYz87LMKZi1S0r4q1Nr
         aMgnlT313iGdgOB8ynS3AXu5pFX9OKeRhk3T/toW7FYTLTIa5j/8oBbJWpV8ENI6HYKx
         ODsE18/4aG6s9+ZBF45g2oHNs1VrhYWl4/pN850w0X0bd3deJcYKKwd2J+iJ69oNmWMU
         tjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=NvNBQoOBAmLEoNd8/XBJk8ofsVdHGTG4ods4Be9fzbQ=;
        b=ZpFcgf6//1IiyVxOhWXhN+7ORoV2Fi1qP7w8FpZysMBW8EvX0fk0A5b8JNb9Q+n2Ob
         gH3zvkYt0i1tCIqnM5dH/nFfcSmsick6zy0jxIh+g/fP+nXPWhxWLJ/5M4SrvOfeIe+r
         8yr4LbxayooHX4PYCgbvU+kddrkLoUbh3ax5joEYGvc9e5hgcV+orXJLOiLrRdFGvPRx
         GE/VFTGcWDW+3qajjDDELG7CbcJdfmfFV+ljiH8dymsgyRh2Heup7+bPkSkc5XnJp8Rn
         brXNC7Goux10eFf4hW80Nmr9WO9lpNCN93+MIxdZdRazGABP40LC1UXr5k7OlSpFeUqU
         G9SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K5ok4rUS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1si5202378ybt.24.2021.03.12.01.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 01:18:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K5ok4rUS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKdvl-0002O8-P9
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 04:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lKdvS-0002LU-1B
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 04:17:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lKdvN-0000yW-7r
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 04:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615540656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NvNBQoOBAmLEoNd8/XBJk8ofsVdHGTG4ods4Be9fzbQ=;
 b=K5ok4rUSdd4uvfYqw0RCa796uRbTIBanErcL2PnIXEiNNBPCBEjg2jkgGQMfASX87AW/3I
 Bu8e32S4SCc2Q5KBd/boTZslBQ3dytlvmxkA/ijhGUzrTN5C3Ern0eSJoHIGFCFAWoIElQ
 TpaJayrjWZ10CPwUnVPpguytmITVD9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-WPNTuxpfORudPJNccOYoyg-1; Fri, 12 Mar 2021 04:17:34 -0500
X-MC-Unique: WPNTuxpfORudPJNccOYoyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E053107ACCA;
 Fri, 12 Mar 2021 09:17:32 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CF80694CC;
 Fri, 12 Mar 2021 09:17:22 +0000 (UTC)
Date: Fri, 12 Mar 2021 10:17:19 +0100
From: Andrew Jones <drjones@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
Message-ID: <20210312091719.6sfr673oppm7hpdr@kamzik.brq.redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
 <651baead-dcc3-c0ef-f5dd-cda36c8d6599@redhat.com>
 <20210312084816.pnenjcbdjzwu3z54@kamzik.brq.redhat.com>
 <c36e5524-7eaf-16a7-5362-f992fe3a8383@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c36e5524-7eaf-16a7-5362-f992fe3a8383@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6rj5iHYmfW8t

On Fri, Mar 12, 2021 at 10:01:43AM +0100, Paolo Bonzini wrote:
> On 12/03/21 09:48, Andrew Jones wrote:
> > > I think we definitely need the additional data section here: For KVM on
> > > POWER, it would be good to know whether it's KVM-HV or KVM-PR, for KVM on
> > > MIPS it would be good to know whether it's KVM_VM_MIPS_VZ or KVM_VM_MIPS_TE,
> > > for KVM on x86 whether it's the AMD flavor or Intel, ...
> > 
> > Could also pre-expand all of these and list them individually.
> 
> That seems worse (in general) because in a lot of cases you don't care; the
> basic query-accels output should match the argument to "-accel".
>

For these special subtypes, what's the property/state that indicates it
when just using '-accel kvm' on the command line? Because if this qmp
list matches the '-accel' parameter list, then qtest and other qmp clients
may need to query that other information too, in order for this accel
query to be useful. And, do we need an accel-specific qmp query for it?
Or, is that information already available?

Thanks,
drew

