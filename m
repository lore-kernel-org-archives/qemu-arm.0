Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1033573njb;
        Fri, 9 May 2025 04:44:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUH8VTgGyBWOZ1ifx0BazpWP9Ttvm5iwNr/g1CPPJpfZPg/wSc/YaxPZGIKr8l56+YaUbT2QXF9WPXq+A==@linaro.org
X-Google-Smtp-Source: AGHT+IFcLWv6gFGn2re+i52XXMjb48lOTtX52c5xBFW4f+ObUrwcw4zXmIKo7US0oZ5jL04//iTM
X-Received: by 2002:a05:622a:56:b0:491:1874:bd9d with SMTP id d75a77b69052e-4945275e65dmr42659601cf.28.1746791082282;
        Fri, 09 May 2025 04:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746791082; cv=none;
        d=google.com; s=arc-20240605;
        b=NblUtSmd14WITVsi00YYA6NZOhm+UAVeLCFIop7F/wgPxN6QKAjWHa4LdZAcImn/ji
         UQYsViOdRbRQG9zqpbnbJz2VT4LecbL+zsuqAkhc10xwSbFxUndyvOLOdmM4MU2/f+aP
         wuwgrtu2Zk8Glq6p0kM720yNBTXyvIiTet8sf3vdw4ZgepwzjtlxpKj0YRInwKpfCBVH
         a6Hl9Z1e2A5Xz82G9RqxnVCSwMPHQgKKP0TyJ8nYTkESXYL5Ph7p7IAOr2K0Sqp/1QK0
         ZnGFTCpAALSV5zMLAUy4SyzHgsQzUO6Z0QvV6Ym2/rDnGGg3pEuJASgrH+QsmQHpu9It
         WPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=OWPMhJ0Sk0mJLU2ZE9eP/Hx0TLPpyirbi6sQ6Yk4IDw=;
        fh=SVf9gdLvgO+hCeUnHU0P4sNtnYKoMdRAlXowfKwztIU=;
        b=GGKCeD+lzqHgRmrJemf1N3QguTe3jRSckgZWskW/Sj6EheHZWZ1aJrBpWdEGn1K6DV
         N0lLJZ+2t5dyAXviWTGjft7nhl/UB9Iz38oa19lLLtH0NWtJyWivk9VCZhy8VNIf8bUx
         L/Ew3W+/FsUPpcubKwbYOOVwWj1vba9LNPsV2sM4kps81zNZxPO0WjywdM+pNQnnWOOC
         QqHNMtiT1yW3xhhcZLBK9c8DyTk8DqRLF9teSnu67NrCbcKZRrANRz42eugnNkhG8dIn
         3QGL3ie3vik+ANkbuhefshc4osh9IiR/0gzbMJATUtaMCLr3Gk3EUuaRMVcaqtxYA+5m
         y6CQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GeY7YRYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945245993asi20041611cf.33.2025.05.09.04.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 04:44:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GeY7YRYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDM9N-0006H0-Us; Fri, 09 May 2025 07:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uDM9H-0006GG-56
 for qemu-arm@nongnu.org; Fri, 09 May 2025 07:44:15 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uDM99-00054o-Vz
 for qemu-arm@nongnu.org; Fri, 09 May 2025 07:44:13 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-7081165a238so16035807b3.1
 for <qemu-arm@nongnu.org>; Fri, 09 May 2025 04:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746791045; x=1747395845; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWPMhJ0Sk0mJLU2ZE9eP/Hx0TLPpyirbi6sQ6Yk4IDw=;
 b=GeY7YRYf4LK2+S13Phras32OwIRKPL9fb/erF4q/OLmxBKWu3cfEZtkCCpuH8d/hfD
 JYtcYg3Y5aWZo9RaC4xRwyHhUX3vqWmNeVTzD5O7IJdEoxwhhAdNYEpLBzTJb2PiZbkP
 IbFc4pCOqlYTsVIQc/fad18Y1TsF+6XIpUMHrgB2XMb8Ej4OTKbxnjosWqogFKLPEalk
 98KwD3sO1RD3GhX38LqgvMaRuXek0WRiT+2qgsw9e8EDhsBGJRg4E7sOQ14rJNSG9nn1
 GsTSt0bXtXROR46K53bGA0Z+ovVpHpWGbP0XjTkU0WR1FTfO227uGQS9hjNs+Bcq5yz7
 kkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746791045; x=1747395845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OWPMhJ0Sk0mJLU2ZE9eP/Hx0TLPpyirbi6sQ6Yk4IDw=;
 b=LAHrJWGt+zzoUD1Gp8lorafGiGSaiwBhon7t3cdv6ORdt3VUgmAOUx2Cmu+A/he22r
 cRIfpvDYsqPbVfOMTDiQR6CBTtmtwy35cRfCyLfj07KG2U2HqTHt1oxv2s15l+ofFmNJ
 qjkE95hScegKT8jCxtXEf7/qJduGmBTgUalouHbf1KaFzweDIxOwJyFG2imitNDCXJUh
 0W954c+qkfNNQiGUTmncpmelA9Cf2AG4spuwMXGhzAqYxVAt4smiDkRNq+3wgfR/o0bc
 FJOt/seBTjX2MaFyPAOgDdoPl1VmrjxKwIA/3NTFq7q/8HFNaGq3JfTfCESU4U3Q0edm
 pqdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlU+UKcYCsPohG6oj91FLn4gKG0sAccZMr4O4fvzJX4HiDh3LF+oAOIlRWlrGgr6yxOG7BoQ9knw==@nongnu.org
X-Gm-Message-State: AOJu0Yx/qnJ3OKtjnnaQAExmwxoz+fhrPo8rCQe7uJabs/mrYlA6kg7f
 +S+tqCpP6uwi2HF7TQ6MSshziTHqBje7WoMPoyiTvLgLdnNYTgK7qHkCGRIqre/C1r48SbOk05r
 qzFGfhztye/qtbcD8WSWmWhvHRXtDFgjGzYyU9A==
X-Gm-Gg: ASbGnctanZizS31CweYfNNx9jBFF58K+9q9BdJKbSxhebCjelkjVz/A30kI/lyjjDMA
 b7MijoHBiXRjvSBrLVvrhlUoF+Ir7+GrOZ5HZFyvnZbq75gmKzDVlA3xw9yVJmhzOOCwTO7Ed7b
 RJ/xF0VqIwCIg9Kx+/Q6DqgFo=
X-Received: by 2002:a05:690c:4489:b0:708:100a:57b0 with SMTP id
 00721157ae682-70a3f9e4badmr38279097b3.8.1746791045315; Fri, 09 May 2025
 04:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
 <877c2ut0zk.fsf@pond.sub.org>
 <e02e884b-0f3d-4426-8a67-2cbd23e80e8c@redhat.com>
 <87frhglwjl.fsf@pond.sub.org> <72f9043a73294bfc9b539ae9b94836d3@huawei.com>
 <d21e0c57-b89a-4c79-958e-e633de039e4c@redhat.com>
 <CAFEAcA9bZ6Rd4PSMG61mJ5Ja07j3--DQE7KqA8RZwxGH3N51sA@mail.gmail.com>
 <3d7824d9fcf04e2e961d30a5f3404b52@huawei.com>
 <CAFEAcA-HWuAUVhqsE7p2BMo6wg+7F273Q_J2LVLrHzFagTjxgg@mail.gmail.com>
 <aB3dAPNgXj7w9-7L@redhat.com>
In-Reply-To: <aB3dAPNgXj7w9-7L@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 May 2025 12:43:54 +0100
X-Gm-Features: ATxdqUFgLyjyeViuXI9TIX-GTN5xgvuJ3wiqu4qsd_2ry_z0YWIPux9C51IebDc
Message-ID: <CAFEAcA-2XS3jBAzLnx9m-V_mqrJr47BsbQamTzszTPN+rmisfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, 
 Donald Dutile <ddutile@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Shameer Kolothum via <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, 
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>, 
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>, 
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: oSlWuKcnmR7r

On Fri, 9 May 2025 at 11:46, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Fri, May 09, 2025 at 11:37:14AM +0100, Peter Maydell wrote:
> > (I want to start here by saying that I appreciate that I'm
> > coming in without having read the previous discussion, so
> > this is kind of going back over ground you've already
> > been through.)
> >
> > I agree that rather than having an entirely separate "SMMU with
> > acceleration" it would be better to have it be a property on
> > the SMMU device. But why do we need it to be user created?
> > Making it user-created leads into all kinds of tricky areas
> > mostly surrounding the fact that QEMU right now simply doesn't
> > support having user-created sysbus devices and other kinds
> > of device with complex wiring-up. -device is really intended
> > for "this is a model of a device that in real hardware is
> > pluggable and has basically one connection, like a PCI card
> > has a PCI-slot".
>
> In terms of "why does it need to be user created" - the goal was to expos=
e
> multiple SMMUs to the guest, each associated with a separate physical SMM=
U.
> IIUC, each physical NUMA node would have its own SMMU.
>
> So configuring a guest VM will require creating multiple PXBs, one for
> each virtual NUMA node, and then creating SMMUs for each PXB.
>
> Since there was a need for the user to create SMMUs for the PXBs, the
> question was then raised, why shouldn't the default SMMU also be
> user creatable in the same way, so that mgmt apps like libvirt have
> a single way to configure the SMMUs with -device.

Sure, the default "there's just one pci bridge and either
no SMMU or one SMMU" isn't that special. But we don't
have good infrastructure for creating sysbus devices on
the command line, whether it's the default SMMU or the
extra SMMUs or a UART or anything else. I guess the
dynamic_sysbus stuff works, but I've never really liked it
(it's basically "the board will magically do the right thing",
and to some extent it's working around the way we have
very patchy support for "I want to configure a board the
device created rather than configuring a device I am
creating").

-- PMM
