Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp328991njb;
        Fri, 7 Feb 2025 08:54:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVjYutkfGHj/xLejZqRBlB/Orflea9tKNF5aVH7ECwvCoujgjIFGb4XaJvMg3HRdIZoWQUkrl9iqWAI0w==@linaro.org
X-Google-Smtp-Source: AGHT+IGHUAtNpnbhAMERpPzT1/c6A8CE0zf8IIHQJ1AdiCb+6TVTEo4X4jtgAZLwMHfsYwNPnD1m
X-Received: by 2002:a05:622a:244c:b0:461:3834:b632 with SMTP id d75a77b69052e-471679a0c1amr66876901cf.1.1738947273569;
        Fri, 07 Feb 2025 08:54:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738947273; cv=none;
        d=google.com; s=arc-20240605;
        b=I33l+n7PZEFFL38TuzqkLC5hzAg7bKlZHu7Ni4BBZ241OOSto0ao9TlwevASloUyof
         xmdAOBoyKOjSSvPp78/mogRDAXViMGN5IQ0xKLJor3J7u9or13H/MNgww8ARsGc2+3Pp
         7XVRkT6yC02MahRhQK8gW5dww6I6FhAGCqSuVpT+8qXQCzkm30nUj9xLmZi5atDn/HR1
         R35nKUUG1eeA9gBtVqaHrHMUd9kTU3Eoc443NnX4bX8vzxA0LNy9HHHpYq3onYkZgmqC
         6vmtgH+lsiSkTqiTHl7FhAmUg96EL7PbMc0lxbRbxDGV8zb2VL7Qc1vOzQPDHDsIX33o
         RkCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=YJXeFnEzqoSV6B2sp8vrSeC5C1Yde3acfQJgATlGvqc=;
        fh=9Gdsr9BagbaufgNVnI5CkssuhKbPSZr6togr/IHE/rs=;
        b=JqnKyMgC8I1xeT6OmuWannJfEUyOzUFvjF3vFU8T4dGhAEK1TSgFZoI1m0w/G8P6Em
         OyVqU6dfybPu5FUXR63uur6uk4ZNaiRLI+Bag9A4euStkt0wCzihLdKZNQeDVP0nSK+E
         YSu3LUdIEEaCPovbQ0NhIotXv2il9Obi5idGfjmMNnkrx0cyvTSDb83lGf3RAJ8iZdNR
         qtgGZrLzaBBAQZbieyHs+ls5F61QlC4UEbr+WeobhC1AEDvHcBvdxMyg8zpZMj27Ia6c
         gidAizzeV+koHxoV5DAtE6G86cKGQykyZf0Xr8PYx0AcVSQo0AoK6qAx3AY8PBQfEyXU
         xAlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GQiQzFPq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153be5584si37657441cf.635.2025.02.07.08.54.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 08:54:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GQiQzFPq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgRcQ-0000Ft-6P; Fri, 07 Feb 2025 11:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1tgRcO-0000FT-Uq
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 11:54:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1tgRcN-0004Qt-Br
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 11:54:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738947253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YJXeFnEzqoSV6B2sp8vrSeC5C1Yde3acfQJgATlGvqc=;
 b=GQiQzFPqg+pYSwch9t7ovciVZiI1hO5H1jM8r8AIpISWmSWgiUcxCg9vUruKXguiPNF0cs
 qcZuHBMv6+HzEKoPzDtFVkdKVmGQwkbOLyKiZbQRV/Om8NYvt0J662KrOQqe09GluUaZpo
 0fmtnqhkPCMBQKqRwgAmYxHYanjSz4I=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-hOcuMbykNVeGOI1Mhbe75g-1; Fri, 07 Feb 2025 11:54:12 -0500
X-MC-Unique: hOcuMbykNVeGOI1Mhbe75g-1
X-Mimecast-MFC-AGG-ID: hOcuMbykNVeGOI1Mhbe75g
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e1b8065ed4so41916096d6.0
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 08:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738947252; x=1739552052;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YJXeFnEzqoSV6B2sp8vrSeC5C1Yde3acfQJgATlGvqc=;
 b=NmCOl8ALAHqKaQs55l5tUKASh8iVZBiwJsGoxGUWrefptiKsePQi9J/BEtfYj3Hzvm
 Q4d6wzPiavYksIFCB1XKl+WpsXmSVuARJ2IKgDsgVJJZoofDdUayznXO6pAMBvCg3ak/
 Ko60ZmHfn6YnrQv/r6qRIYCxLVyCpkHPOxSaDnO9BVcrJx8mr29hpmGnlAEgAoWdHHAX
 Qqqe6RbsNojFNcFYmS6374Yx6XEoz2IANeBZty4PtBoYQSvm5UfiU13EaelVRb4Ozk0k
 59MeyLs0vx/Xfk67t89txu46lhzZ8/C5azWS0rxVxkY1yyA/mxZ8zBD1Ypb3LAXhFM+T
 75qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHP3X6qbPE8Jpepbr42l3aHyVCaIsdZwQ/d0F01pD0pfAJ3vH2/fAgcusLg5+pEI48ZxVhX3a28g==@nongnu.org
X-Gm-Message-State: AOJu0YzzXbYqa6mcRGo2F+2tqvHySO+5FhRM6d3aavSCcJS0LFASjnuP
 1Nzab7Z86jSaLE0JUqUDRODmyon0H2gEWFXThEwpasbzVTYnOrmUK7DypLvc7LkJfOTxdMTHdcL
 G0mLx0zXQoY0KblUbAixg7ncYTovc0/+CMexqna5fu2bxdhrG9g==
X-Gm-Gg: ASbGncvtHYyFF4RZA2iqObx53rYNY5HARWsF2S9X/Ua7zJhrpsszqyBv2y5zhD1YwvE
 N74YMdPN+iG359mLNnjkX9bndIWQAINlQOGMnVMdDdc1Tembj7B+rjseH6IKEAK9uYBRHlO/v1A
 YkgBiydOer1vB/SOg5DXQbU2QORaSoybU59ROEWLgtYTdapqXQHFcsU8/+/31PkPlhQZyjnqJsH
 pmc9MHZ1UfeSd37xXqlWaxyWbSUh0zb6zRIfe11I+bNAok1P5LR2NWWBmbb+Kw87/xfoYRqEzv3
 /68u/0z1NQdeCYnO9dB0VM/bnTloL3vMxEl1EBCYGepogy7J
X-Received: by 2002:a05:6214:1d24:b0:6d8:9c92:6555 with SMTP id
 6a1803df08f44-6e4456fea73mr53485876d6.29.1738947252107; 
 Fri, 07 Feb 2025 08:54:12 -0800 (PST)
X-Received: by 2002:a05:6214:1d24:b0:6d8:9c92:6555 with SMTP id
 6a1803df08f44-6e4456fea73mr53485486d6.29.1738947251796; 
 Fri, 07 Feb 2025 08:54:11 -0800 (PST)
Received: from x1.local (pool-99-254-114-190.cpe.net.cable.rogers.com.
 [99.254.114.190]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e44eb52460sm2915526d6.8.2025.02.07.08.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 08:54:11 -0800 (PST)
Date: Fri, 7 Feb 2025 11:54:09 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, mst@redhat.com, jasowang@redhat.com,
 imammedo@redhat.com, alex.williamson@redhat.com, clg@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: Re: [PATCH 0/5] Fix vIOMMU reset order
Message-ID: <Z6Y6sf064FBWT5G1@x1.local>
References: <20250206142307.921070-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250206142307.921070-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aTGelpf_1EgJUhwypCiNy9r4bw70urDPcenZ-4Ql1QA_1738947252
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: vVGxyIuFAr5w

On Thu, Feb 06, 2025 at 03:21:51PM +0100, Eric Auger wrote:
> This is a follow-up of Peter's attempt to fix the fact that
> vIOMMUs are likely to be reset before the device they protect:
> 
> [PATCH 0/4] intel_iommu: Reset vIOMMU after all the rest of devices
> https://lore.kernel.org/all/20240117091559.144730-1-peterx@redhat.com/
> 
> This is especially observed with virtio devices when a qmp system_reset
> command is sent but also with VFIO devices.
> 
> This series puts the vIOMMU reset in the 3-phase exit callback.
> 
> This scheme was tested successful with virtio-devices and some
> VFIO devices. Nevertheless not all the topologies have been
> tested yet.

Eric,

It's great to know that we seem to be able to fix everything in such small
changeset!

I would like to double check two things with you here:

  - For VFIO's reset hook, looks like we have landed more changes so that
    vfio's reset function is now a TYPE_LEGACY_RESET, and it always do the
    reset during "hold" phase only (via legacy_reset_hold()).  That part
    will make sure vIOMMU (if switching to exit()-only reset) will order
    properly with VFIO.  Is my understanding correct here?

  - Is it possible if some PCIe devices that will provide its own
    phase.exit(), would it matter on the order of PCIe device's
    phase.exit() and vIOMMU's phase.exit() (if vIOMMUs switch to use
    exit()-only approach like this one)?

PS: it would be great to attach such information in either cover letter or
commit message.  But definitely not a request to repost the patchset, if
Michael would have Message-ID when merge that'll be far enough to help
anyone find this discussion again.

Thanks!

-- 
Peter Xu

