Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936F2606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KsZWHmFi
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWrl0-0008CL-VZ; Fri, 27 Nov 2026 03:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1xWrkz-0008AZ-FG
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 03:56:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1xWrkx-0006fK-VJ
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 03:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795769794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BuV+QA+s84l8Poq1BBJXJ4FOVTjIgdvHVM0F0eT+wqg=;
 b=KsZWHmFiUowYGT/dztBPy/QNjF8QA21KoStNopHhdrcxySE1n7xGM6JZPlKqZJCfNdd+0+
 4dcB+PehQ3tCZZ/SeQC4txg2elIuZGjuGNdoM1G4F7KxtX6Ae/6KKFcOcm8u38duw/3aiw
 7/2gTjSjwp41rubwdoShdWQDQKKOU9I=
X-MC-Rep: binary re single
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-rC2IkGxbMm2AH4VxK0-s8g-1; Fri, 27 Nov 2026 08:56:31 +0000
X-MC-Unique: rC2IkGxbMm2AH4VxK0-s8g-1
X-Mimecast-MFC-AGG-ID: rC2IkGxbMm2AH4VxK0-s8g_1795769791
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4bb680f0ac4so55101675e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 00:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795769790; x=1796374590;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BuV+QA+s84l8Poq1BBJXJ4FOVTjIgdvHVM0F0eT+wqg=;
 b=slSFLDy5NByncFTiYCoNsHrZ9wV03u5up72GK1vZ6FWe4u8n/eagefizWcdh9Xp2wh
 gDU5vjYz312TX0HEPI5hFhqDPEuAY6spDQjMoFI2D/wfhSd7Kj7Xk6KCCAYzGZ/OtVQ7
 t9FVXolXR+q2IEmAGmkdkLqYr/QBmU/0SZt/e/TY2a2n4Gw3qWYF6DD4SmSs4qfgREwz
 QEac+Xv/FvByg+bRZFDU+pE40uy21sFkdkNH8cCjXGzWrzLDBk4kqPYJ/u8lCGYRw3nQ
 v55dqOj1kov9Tgp4kysBXBj25PqbKnOKhUy22vpzwz4g3jPQpoSWRJXCg0E+KE9d8j0d
 mLvA==
X-Forwarded-Encrypted: i=1;
 AL+hErECFb9pgpAY9NgxiWWIh1QtvA4h0pqcBzSsGdx7SDGEbd+Bpqh+w4HFIgEaPnVs8Dib7PvkeObcDg==@nongnu.org
X-Gm-Message-State: APuU4Z9tDUdbZQaXFz5wOpC1S/lilNDsHb1YX9h4hcBxRzkIER7z7krv
 kw7gQJEFbOiScKiCQ6x7nxMu3VLz38UGrYnhyINQ2y2Sgv30F+sba8LgaqJYhSgKemTr3HVth3s
 wf5zBmqzvDCAzQ8ke4Lpxn6LAAgxAymC/Fso9yI+njrgp4qqkhr2KbQ==
X-Gm-Gg: AZFdTZfFR/fDPTRY7noPFOQmUEEbPdBUlsJ5FcBWNw1Xil3Ef7rQoKjwmw0PkCVx46S
 bwBa9QL7h1d5MVW7/d5bNz1tbUCOHvZMYFWYtfbG0GHVCKcI4RPn0xbV0gGI+QhZhuXYY2PA801
 Yqa5Ixp2hzuWrA0NVLZOYOQAklxn7ONX9ynPZ26nKzkIeVUUD/7Ny+xgrzkgifJegEzucKvSgDT
 k+00dZPuRMy5nSEm5Cc5vpJJcdrUeTVvLUfrTDykzXVe0l/Hn6KsISJtMEeY5XEv/ZT5YJZo62p
 Ddmg/95FpizmgvRu+FgXrTljfHow6J7qT+1g4Dm3oRhIp0Ff8NKFaoxMOARnEekhw8kFI33pZHk
 zQ2hCWu08jbmDh5D871f7w03iDl510Zs56pkW6ZgA/fNzKXx7gPI6cM14QSsgzlblGDJTkq89D7
 OfBC7cVkE/XvteuLpF
X-Received: by 2002:a05:600c:530f:b0:4a2:677:ad8e with SMTP id
 5b1f17b1804b1-4bb8892a21amr442437655e9.34.1795769790717; 
 Fri, 27 Nov 2026 00:56:30 -0800 (PST)
X-Received: by 2002:a05:600c:530f:b0:4a2:677:ad8e with SMTP id
 5b1f17b1804b1-4bb8892a21amr442437225e9.34.1795769790357; 
 Fri, 27 Nov 2026 00:56:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:af16:8320:54ea:4bc9?
 ([2a01:e0a:f0e:9070:af16:8320:54ea:4bc9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8526cbd0sm894279635e9.0.2026.11.27.00.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2026 00:56:29 -0800 (PST)
Message-ID: <bb8b3f0b-0948-4509-be89-d896ec94d7e8@redhat.com>
Date: Fri, 27 Nov 2026 09:56:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/3] arm/kvm: select an nVHE-only EL2 with
 SYSREG_ID_AA64MMFR1_EL1_VH
To: Haseeb Ashraf <haseebashraf091@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Haseeb Ashraf <haseeb.ashraf@siemens.com>, Eric Auger
 <eric.auger@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Khushit Shah <khushit.shah@nutanix.com>
References: <63fcaf35-5d3f-42fb-868f-9fcd644bf494@redhat.com>
 <20261125175005.805533-1-haseebashraf091@gmail.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20261125175005.805533-1-haseebashraf091@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rn4Ov4WpU23TtwOJiv_z72Ylu2vEDHUfai6SjWnCx_4_1795769791
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Haseeb,

On 11/25/26 6:50 PM, Haseeb Ashraf wrote:
> Hi Eric,
> 
> Thanks for the feedback.
> 
> I agree that exposing VH as an exception is appropriate for now. KVM
> does not expose VH through its writable ID-register interface; it is
> selected by KVM_ARM_VCPU_HAS_EL2_E2H0 during vCPU initialization.
> Keeping this explicit avoids prematurely adding a generic framework
> mechanism for which no other field currently has a requirement.
> 
> On the second point, my wording was imprecise. KVM updates the
> guest-visible ID registers automatically after vCPU initialization, and
> the guest sees the derived ID_AA64MMFR4_EL1 value. I referred only to
> QEMU's cached isar.idregs[] copy, where the framework currently deposits
> the explicitly requested VH field but does not re-read fields derived
> by KVM.

Effectively get_host_cpu_idregs() is called on the "max" scratch vcpu, ie. the scratch vcpu initialized with all possible features. Then we update isar.idregs[] only for fields which are explicitly set using SYSREG props. 

Thanks

Eric

> 
> Thanks,
> Haseeb


