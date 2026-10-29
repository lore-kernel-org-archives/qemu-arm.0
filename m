Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD15A606A31E
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QvQzH+uc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMOmL-0007sV-5A; Thu, 29 Oct 2026 07:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seott@redhat.com>) id 1xMNrn-00055l-9I
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 07:00:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seott@redhat.com>) id 1xMNrl-00009L-UJ
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 07:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793271617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mo7xsVZK9sCsf4WxWBCWnUrQEem7P5ym7LFAj53/gX4=;
 b=QvQzH+ucFsDBit1Z9qdoxFbw0EiHbLvsIZQEKuZi49s7URwucpwOGdKKQzYqGXXLYQbEUr
 ZKVimPhOA+qPvUHCFqmkDANiKtOyQK1q/p3/qt6QrkBqCsmjbMxximLxREGO9eOd6gvg3b
 4VkIIDmQezT0uqb7gZwbOhzzTpkKfDA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-13MXaCyzOqa_GOU7AP0EfQ-1; Thu, 29 Oct 2026 07:00:12 -0400
X-MC-Unique: 13MXaCyzOqa_GOU7AP0EfQ-1
X-Mimecast-MFC-AGG-ID: 13MXaCyzOqa_GOU7AP0EfQ_1793271611
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-48b027578a4so1574684f8f.3
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 04:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793271611; x=1793876411;
 h=content-type:mime-version:references:message-id:in-reply-to:subject
 :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mo7xsVZK9sCsf4WxWBCWnUrQEem7P5ym7LFAj53/gX4=;
 b=Vth+8n4gfOlncpGAgSbbgJTK+9ek/kOOf7h7QH05Rp38Y7QGVkYkdmlpBgYFAubtJf
 /v0R3thNaee0AyEE0LI4egScR5dqEMIHRUmPPZul5w6T40dk+5mXI8WJV7E7kMnFYMzj
 eC6Jn/F4IZ0nLBjk68iF/DU3nwdKOB8vJ23YNNLPi9v6llQnhElRRsb2qERM+3mMX9yk
 AcEcjM5C8HaBuIhIzkNSu3P2e6Ft9OMs1/qmVr6IIh+f9H+ByjBFSq9MxHFDLlKfGRZh
 YCyLPHA5gyGw/3syorbwCefTVp7NNzxy7FMUPm1KyaGWkt4Ez4RLvq+tpyDDrCkfcw2/
 aU5A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxlNhI3Dy2aJ/ZoA1pau+bHM8pXfiSNnK7qSP6wg6Ggcp8edt3CqEkNDdRqX8IqKBhBxwJ5mBZVew==@nongnu.org
X-Gm-Message-State: AFq9FYKHA/gW9V9sMUiijYbpOyIgDjPIEb2DGuQZeC4PbefCwNCrb09A
 eoHJYsj9pbTyFI3uQ9z4IcEq1r33o5U3RSWFlOjrmgQk3E3Wv9oTDx6g/88KQ6fT3Dk6ngSBqKz
 bZre/GEvhWKetCm2SawiLvIhZSEut9cUBOYMqHDl9bZjYyZwtmAHE2g==
X-Gm-Gg: AYBFou35ypi9+S0xNnM+nHTA/stuD6aBJO82IWrjHfAgscs2Ro+t5HB93myT+/J5bVW
 +35lNdCkvf1lAdp1VIWOIgFb5WyoavqvmYjbUuG/NdrtcNVfXj3xsSGIlPdOkxx4PJg00fUgZX6
 YC8ZYDucY7D1i2liTRavam7fePkQiLsjzD/bAaqX8BkvnzbYDva2vIKeQ3Bty+ondyPpnyrngQQ
 /0Lyn6WtMD8nuLVAIEsN8nJ02e/fyEKI6ifFAWMFHJwvCguqj+8Nh394yDm+2X1UOprZiazmou+
 swsw3OdMbVIKfLiYKJ9Gwb079iykSHAMetZ17kcf/oNUfgLIS6LOzpB/1iU7a2qT5YvdUC9aDSq
 D3tGKsRBSjXJwbbSjsuQVuGJ2AVN5FIxmQeLZc2R6jD8/XgMZCoV1fnZJl9A2zhz77nsQedH3Uv
 C2jhAPj2C0yjHZMyYX/feGa2uR476TkI2fUSqS4wU=
X-Received: by 2002:a05:6000:4919:b0:48d:ff71:dd97 with SMTP id
 ffacd0b85a97d-48e5d319cc9mr11391868f8f.7.1793271611500; 
 Thu, 29 Oct 2026 04:00:11 -0700 (PDT)
X-Received: by 2002:a05:6000:4919:b0:48d:ff71:dd97 with SMTP id
 ffacd0b85a97d-48e5d319cc9mr11391818f8f.7.1793271611120; 
 Thu, 29 Oct 2026 04:00:11 -0700 (PDT)
Received: from seott-rh (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de.
 [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc4d76sm34227569f8f.12.2026.10.29.04.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 04:00:10 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:00:09 +0100 (CET)
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
Subject: Re: [PATCH for-11.2 7/9] target/kvm: Pass an Error handle to
 kvm_arch_init_vcpu
In-Reply-To: <20261029092307.281287-8-eric.auger@redhat.com>
Message-ID: <31abc997-8c83-cd34-7fdb-5dfeccaad26d@redhat.com>
References: <20261029092307.281287-1-eric.auger@redhat.com>
 <20261029092307.281287-8-eric.auger@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vzbwWdu9t2sDFOEyTUcnlxFEX9Bc-k89mvwzUYf8gEc_1793271611
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=seott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Oct 2026 07:58:22 -0400
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On Thu, 29 Oct 2026, Eric Auger wrote:

> The 2 callers of kvm_arch_init_vcpu(), namely kvm_rebind_vcpus()
> and kvm_init_vcpu() are passed an Error handle. So it is a pity
> not using it in kvm_arch_init_vcpu(). Also, in the future, the
> error handle could be passed to other functions called inside.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


