Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1567376lfq;
        Mon, 11 Apr 2022 05:02:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNYFwmwfiVrKCEJo5zhh1E6fgTP7e1ItXXwZH1Bdj7OczmZX6pEZlnxk3jFeTs/UHEkn0c
X-Received: by 2002:a67:d391:0:b0:328:11cb:6cc1 with SMTP id b17-20020a67d391000000b0032811cb6cc1mr5612202vsj.32.1649678559982;
        Mon, 11 Apr 2022 05:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649678559; cv=none;
        d=google.com; s=arc-20160816;
        b=hKwezSKMSD8MREeNs3wgP6mW0RJUTsQVSfvzQCgXlIwzwjGexkFFRqEALnibVGa6il
         fezfML2bp21rj7GecdHdBA1Y1zGWEkUj/PossLYqd1lcCp6SVu4fzHZCrW7ubH6n5I3d
         EmjlGKKN/Bjwq46fb0lpxjyBsMwyV0FlnwldGwalk075om3v0+7FFcLzN/mlasli6KN0
         /8CHdhLGParc2Pjd7N/B3Vstrnx8sh9YQZyp8ja4DRMDB446sh2ngw260+fwooA3uw7o
         Rk2lcIenPBD0yOVqUrw4/eY4CJdb1Elpz0jgCvC2CBkf/l+Hi5MKuLYAkITE8Mq/Ppec
         +Oqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=XhA+f87wI2fd8zZjv+4N6AkZIuO9/rqvTg4W0ZVs0rk=;
        b=WavXwO1nS+KFhBb4wkUlLvREcEYgdqZM4zvZ08iXWFcBiYnc3jk2YyBi+l3xKVyGZE
         WjCquluDPGrBshzXIcc3MJNRR9pvSm8NoEwsHw42WknA6dLEJFSB15xiVLl9VS1RnUvk
         2ZgcfWMqcly2Enii3PEI7EB48DU6B3U+TiwG7Tl+uzHucHwYL27vtbdvnDJqo6PzKhXb
         ktFHYhnpuc07A/VLu17U612xmt78NKUrZKUDzQ35aub/NN8bovePfYceJjaQyn1KZvkP
         LeHQihNO9gGF0yzaXjVPmnOHQ/PydNAMco7DQ/eYBk1oJl43XEtRcHmmFBkmyJ+Qdbzv
         z4tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dFXKAE+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16-20020a67c010000000b00327fac05613si477730vsi.413.2022.04.11.05.02.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 05:02:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dFXKAE+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndskh-00036H-Fh
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 08:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ndskU-00034i-Nb
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ndskQ-0008Th-Uq
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649678541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XhA+f87wI2fd8zZjv+4N6AkZIuO9/rqvTg4W0ZVs0rk=;
 b=dFXKAE+fuW5NLaWELPg9EQxa7ut14S22MkS1TcI833sRom7yzTWOMVreO1CrFLRdKj3kGz
 ooCl1LFgR4N60USN7p0fv/4WKtypiJ5vD/u1DZIbIkEzYUvnX6sypWObPNZIjuBNHnwFUL
 En7WEetiJMuJh06ssNG4WqKzitP+TXM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-hp9JPR47P8eUYlbuhW-qnw-1; Mon, 11 Apr 2022 08:02:20 -0400
X-MC-Unique: hp9JPR47P8eUYlbuhW-qnw-1
Received: by mail-ed1-f69.google.com with SMTP id
 cy25-20020a0564021c9900b0041d84fd5d8fso728441edb.4
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 05:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XhA+f87wI2fd8zZjv+4N6AkZIuO9/rqvTg4W0ZVs0rk=;
 b=qzcCf7UnT5yY74FX1WV9qCAgd+7Uo/UDCtD+mUwHqpoxKReCsc987nn7XY45zT8F7B
 wEH0S0FrQTfuQVy5/fi5Yg1Q0q4Fzfuedl3aGjRnLhRuZ7R2h/D+TW5grszDA7LpifMO
 Y3vJ+CQSr+W51TO3m4kMhcWGBYBJSD7Rnxw4nbGTato/sLJc7Z7nzhfyNbhYAmZy9/3I
 S4O1z2caBzAIk6C2T8EcCwebEggnBSU3aanFZk3BCNul+CIw0WS56tR4wqDh9vCNG7LS
 bIlh6vq8ZE9t9JIfIiR0ZgNUYnbGAaJ998XDfHVW4rcOqu8CsnQIuvZQRK3O6P17ZMRX
 lgmg==
X-Gm-Message-State: AOAM5301mckJG7f/MlQHh9NvFpk4jMAQ/jwXG7VtgMW3dcRED251h7uA
 AaP+ahBvUD6ECkm36vOASfQ5M1J4K2BSEB/HJdsA0qXbaUtVRp+1YZ7Gbqf/p0eVmE9mrSIrSYF
 /w4M3f0sqIGLz
X-Received: by 2002:a50:c099:0:b0:415:f5c7:700e with SMTP id
 k25-20020a50c099000000b00415f5c7700emr32745187edf.205.1649678539420; 
 Mon, 11 Apr 2022 05:02:19 -0700 (PDT)
X-Received: by 2002:a50:c099:0:b0:415:f5c7:700e with SMTP id
 k25-20020a50c099000000b00415f5c7700emr32745147edf.205.1649678539087; 
 Mon, 11 Apr 2022 05:02:19 -0700 (PDT)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id
 22-20020a17090600d600b006dfbc46efabsm11942783eji.126.2022.04.11.05.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 05:02:18 -0700 (PDT)
Date: Mon, 11 Apr 2022 14:02:16 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/5] target/arm: Support variable sized coprocessor
 registers
Message-ID: <20220411120216.63r7ggy43y7ttvhp@gator>
References: <20220411065842.63880-1-gshan@redhat.com>
 <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Gavin Shan <gshan@redhat.com>, agraf@csgraf.de,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AnQTJW/lyfXg

On Mon, Apr 11, 2022 at 10:22:59AM +0100, Peter Maydell wrote:
> On Mon, 11 Apr 2022 at 07:59, Gavin Shan <gshan@redhat.com> wrote:
> >
> > There are two arrays for each CPU, to store the indexes and values of the
> > coprocessor registers. Currently, 8 bytes fixed storage space is reserved
> > for each coprocessor register. However, larger coprocessor registers have
> > been defined and exposed by KVM. Except SVE registers, no coprocessor
> > register exceeds 8 bytes in size. It doesn't mean large coprocessor registers
> > won't be exploited in future. For example, I'm looking into SDEI virtualization
> > support, which isn't merged into Linux upstream yet. I have plan to add
> > several coprocessor ("firmware pseudo") registers to assist the migration.
> 
> So, can you give an example of coprocessor registers which are
> not 8 bytes in size? How are they accessed by the guest?
> If we need to support them then we need to support them, but this
> cover letter/series doesn't seem to me to provide enough detail
> to make the case that they really are necessary.
> 
> Also, we support SVE today, and we don't have variable size
> coprocessor registers. Is there a bug here that we would be
> fixing ?

SVE registers are KVM_REG_SIZE_U2048 and KVM_REG_SIZE_U256 sized
registers. They work fine (just like the VFP registers which are
KVM_REG_SIZE_U128 sized). They work because they don't get stored in the
cpreg list. SVE and CORE (which includes VFP) registers are filtered
out by kvm_arm_reg_syncs_via_cpreg_list(). Since they're filtered
out they need to be handled specifically by kvm_arch_get/put_registers()

I asked Gavin to check if following the SVE pattern made sense for his
use case prior to sending this series, but I don't see the rationale for
not following the SVE pattern in this cover letter. Gavin, can you please
explain why following the SVE pattern doesn't work? Or, are you trying to
avoid adding an additional special case?

Thanks,
drew

