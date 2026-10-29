Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583AA606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qtdz7rMf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMOmP-0007vm-EH; Thu, 29 Oct 2026 07:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seott@redhat.com>) id 1xMNT4-0007v8-3B
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 06:34:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seott@redhat.com>) id 1xMNT2-0004q7-Mx
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 06:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793270084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WtzZIMDOiqrk6lsp6O6oixpiQO/z6HQTu+TLVzSWDes=;
 b=Qtdz7rMfFLU3epDIOSCuDSzGtO2e5ZAeBgkflrRk77wHv2/lvxJMH/fLIfhTip8KBYZK3Y
 B9FKcNSvMYWPUTjS1CwomXa6A0oSTaWBOZH1XAdjtf/IrcwuP3+JZ5ri5h2+ylomZ6T/FA
 yyrTGRl8xbG5mQkpgBGrXoOcTFuCqoA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-dFXlv9b5NBCYAeW9Phfryw-1; Thu, 29 Oct 2026 06:34:40 -0400
X-MC-Unique: dFXlv9b5NBCYAeW9Phfryw-1
X-Mimecast-MFC-AGG-ID: dFXlv9b5NBCYAeW9Phfryw_1793270080
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4a214a5f8a1so18443235e9.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 03:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793270079; x=1793874879;
 h=content-type:mime-version:references:message-id:in-reply-to:subject
 :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WtzZIMDOiqrk6lsp6O6oixpiQO/z6HQTu+TLVzSWDes=;
 b=pVBeIJdZGcSLl1srcksWBCeqbRMPUgYfTdzDaxjh1OITQJgYN5td31ogtkgPnkS6PV
 l//p6dIKpbmYDwiEQ/wZy0Po6cozHieB4xrozYJJ53krue438e47O1ZKGcg72fECrA8r
 N89w9ff2bEbplcgNgkCCva7GcDUixTx8OHMlUfDkh//i1bFeag3o2f4TVazwGCeEpcGm
 PFxujer0t3dePiwJQP/KtnXAPznc2pmSafcYqgKJCHvNNTzWJJR+eTY4npt9tAt3hAeq
 6KNHoN6y2fC3aOyjPu0MFEJqk1HPVbx8mCbyItAqKdkVyyMpAOi+VyPJpHa32C9RHCVt
 uRKg==
X-Forwarded-Encrypted: i=1;
 AKwUvByPfC4/AkVlnkOfDXoPXN3Qrsac8j+l8F8s8zOPCXFTD9pUG+gSS/LYTI9okBIfRl/Z1CrxenjQxA==@nongnu.org
X-Gm-Message-State: AFq9FYJVZmm/o1CJkKHR7KVZVebdKJnRx1PONzonwTCekCWCX4USgVXO
 7UXlU+4vdZQRw5pTZNIXuQ01kVr75HPKTFa2Fi9u6Ddw6KGqKOhrAskDV4bozo9y8+acrtMC9og
 PV80V5lPvrECyLxsDYRtL/V4zUBZxl/zhX2OFSW3SDQMU+oYjboKmKA==
X-Gm-Gg: AYBFou0mObrm5Ngu4mHtuZuEQY/G6mLeoHh8+rA5PuCFA97DuNs0y96eIPBxxdt54+m
 YxNZABL3fMsyR+2HLl4OLurJKoWuiYPxCkoyxbfenxdsx0+2k5oWjXClaaFpyTlq4RI9K/haypH
 IUj+boZXIk0SRlqo21i6ZE/crs4irw3Vdjd3WG8RP3rOkeyEfPRkHLbSVvvX/j2guSVIhSX4swd
 JjARV0tZRmcv9tH0Y3c/7crVwNveQeiYZ8gtqx/5I1dah39n/S7HX+11OnYB4f5WHdmkmZDWArr
 VHbguA23TD3avgJhfBxumfp4lhO/NWfFNHJE9ilSniD6EhV1SpVBYT2T7Uq6Vv0ACedJ2ep17qe
 BPrWFmgjzIoxpDVbdQAnrOY4KrLuXDUbQxTWyKW7bmSoazNaxE+MoZKB9dBLvNXA8omzCrFKXiT
 0TM8+EGhjr/RWARcKelaDC500+7sEmjs+Th0EjqW0=
X-Received: by 2002:a05:600c:34ca:b0:4a2:133:45e1 with SMTP id
 5b1f17b1804b1-4a967202e8emr113490685e9.24.1793270079654; 
 Thu, 29 Oct 2026 03:34:39 -0700 (PDT)
X-Received: by 2002:a05:600c:34ca:b0:4a2:133:45e1 with SMTP id
 5b1f17b1804b1-4a967202e8emr113490355e9.24.1793270079299; 
 Thu, 29 Oct 2026 03:34:39 -0700 (PDT)
Received: from seott-rh (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de.
 [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7f322c46sm53459235e9.2.2026.10.29.03.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 03:34:38 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:34:37 +0100 (CET)
From: Sebastian Ott <seott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, shaju.abraham@nutanix.com, 
 khushit.shah@nutanix.com, richard.henderson@linaro.org, 
 pbonzini@redhat.com, skolothumtho@nvidia.com, philmd@oss.qualcomm.com, 
 7746591750@163.com, maobibo@loongson.cn, harshpb@linux.ibm.com, 
 amachhiw@linux.ibm.com, daniel.barboza@oss.qualcomm.com, 
 milesg@linux.ibm.com, farman@linux.ibm.com, cohuck@redhat.com, 
 armbru@redhat.com, mbawa@redhat.com
Subject: Re: [PATCH for-11.2 4/9] target/arm: Enforce MPIDR into isar.idregs[]
 storage
In-Reply-To: <20261029092307.281287-5-eric.auger@redhat.com>
Message-ID: <18224a5d-a88a-a63e-058a-5217bc531bc9@redhat.com>
References: <20261029092307.281287-1-eric.auger@redhat.com>
 <20261029092307.281287-5-eric.auger@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AfMaFWgRL9WZUzoh03xSPeIHQvsd6QNMWPDp7FYeT6Q_1793270080
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.129.124; envelope-from=seott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Oct 2026 07:58:13 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 29 Oct 2026, Eric Auger wrote:

> At the moment MPIDR_EL1 has no real storage. Instead cpu
> mp_affinity field stores the Aff0-Aff2 bits only and the
> ID register is reconstructed when needed. There is also
> an mp-affinity property used for TCG only.
>
> Keep the mp-affinity property and its associated storage
> while making sure the MPIDR_EL1 full register is stored
> in cpu->isar.idregs[] as other ID registers.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Khushit Shah <khushit.shah@nutanix.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


