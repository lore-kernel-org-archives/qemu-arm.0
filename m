Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2737099ejq;
        Tue, 9 May 2023 06:54:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6iQizNAehokJaHpum/aJrVPZAQ+ZsfS0dhGYJCY9RfDT0kqqHszOb0WkkVsC8gb294n/sc
X-Received: by 2002:ac8:5e4b:0:b0:3e4:d6cb:2e8f with SMTP id i11-20020ac85e4b000000b003e4d6cb2e8fmr20466177qtx.30.1683640480611;
        Tue, 09 May 2023 06:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683640480; cv=none;
        d=google.com; s=arc-20160816;
        b=EHGYPd1fk7cwKau98htsMSqM0hDALq+J91qajkvkmffABhgMulUWqvLZB2yINTrCb1
         Lz0r6F0tgHo7IkAJVU+7k+mkBzmO2x6TcmbmxFpQn6ymhvL+CMp3kbPaVxt1iGiybFd5
         0R61SljNnK4se+VCP7XwbwMtPxTzYIkNAqgkAPmEjmjdbKckNswJjpa2q6CtD93g4b+X
         43LZv1aqKjp0gSUBLeZbKjAb6Fsk8XB9aeQXb2j9LjG0gBIuL+jp93diYF3tk2Rn1Ra6
         VSTVtUJmQjJWpWMEqQ0bzmV6Dhy5NcCxYYJ/3g5w9HjYuSfCHPYnefT1dmTovK3XMmr1
         FTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Ieu2W0LwZkdFvunvBHXBDrEVo8kXje6p4DL7flvT/Po=;
        b=eJmyuttMxOlHDtjAoGhPxgW3MMTII3RoxRgzQChO8QcmUn80nfvOJ488HAm9VnzOTH
         VfRNEb8CJr+OJQtToVKuKqLJsByyJgOTyEP99zegQF0yrWq+F4iznv5oj31xuCvbhRn0
         5T3/JUuq6i9O50FI4fUtjdPyAEQlffR72igMtwrOd3sA58mq81S2qVaDbs+JL2yMDaiW
         6OZ5CkUJ4gp+WtwZkFupNoc7hEwNkT7k+XpNCUKqbttCCb5ZtBislaxDYy7JbOp+J8d7
         ON83/t4J5IF9WiQWUjJlcvVDxMDW2Pti4ikcycKfdoNtzgzRpO+qM5Vk9T//R9fuX5zf
         gUYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VonhWs43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k25-20020ae9f119000000b0074e014414b7si3853920qkg.775.2023.05.09.06.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 May 2023 06:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VonhWs43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwNnV-0003fW-Hm; Tue, 09 May 2023 09:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pwNnT-0003Y2-9Z
 for qemu-arm@nongnu.org; Tue, 09 May 2023 09:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pwNnR-0006jj-R7
 for qemu-arm@nongnu.org; Tue, 09 May 2023 09:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683640459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ieu2W0LwZkdFvunvBHXBDrEVo8kXje6p4DL7flvT/Po=;
 b=VonhWs43F6kZJJkIcj74hU9AYCx37Y318YUut5LExb8j+HJP9J5hS9qlQM76mQd3iJbByY
 8jiW97xrz2Ko9pA5zKoXreuuQ6Q9fKQTtwAx8wMHPkhXG+NKkVV/nH1Lm/n1+zBnD3LDbf
 HnIgOCb5J1b3UhpHqwqneWZlY/MtX38=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-lhFewuOOMIKMhI6P064lHQ-1; Tue, 09 May 2023 09:54:12 -0400
X-MC-Unique: lhFewuOOMIKMhI6P064lHQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-64763c0f3d7so68308b3a.1
 for <qemu-arm@nongnu.org>; Tue, 09 May 2023 06:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683640451; x=1686232451;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ieu2W0LwZkdFvunvBHXBDrEVo8kXje6p4DL7flvT/Po=;
 b=HP7DtNoxErdyB+60LIxf2beF6co8FmOaarIhFYcQMbqbdU+JmZh4nZXTl+ASc2HuyS
 bESsXASsAwDz5c6tISdqBHvTxIXDgacM/vohE9bvohl2uKnNSThffoHJc81JN1SJBlip
 fkLUEUcgkCsuntOqNiH70DtLjRLIUhQgUVN35WAInGFsvnI5tgpNSniYP4KaXQN4yQq6
 Bd3u+oGSRG7LPcJhYvryKcSWTWMT/laEtmG1tNFXVWiHyjHb3bTIAMPKOSO0f8gUWUiq
 YI7ivjbSRI2CZiPgMxl3Dqcc0Dy9v1xu3P78PTwyLiYfKLJEihlAtguAun0AKd8fTLXH
 dU4A==
X-Gm-Message-State: AC+VfDw+VzqK84rYuhnc7G2R5XOXSO1g+JVhE/Kxt4Olu66Tw50aMX3n
 2dQqHKY3KOPo68yCwQHgFHiRkW7Sp92897Wjup4fY4N7v7gRMA4xzXXxLdtG5hWqoB0Um9sWMpS
 qm5FLIdqv8vf3
X-Received: by 2002:a05:6a00:1f17:b0:646:78fe:f889 with SMTP id
 be23-20020a056a001f1700b0064678fef889mr5263740pfb.2.1683640451601; 
 Tue, 09 May 2023 06:54:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f17:b0:646:78fe:f889 with SMTP id
 be23-20020a056a001f1700b0064678fef889mr5263701pfb.2.1683640451231; 
 Tue, 09 May 2023 06:54:11 -0700 (PDT)
Received: from x1n ([64.114.255.114]) by smtp.gmail.com with ESMTPSA id
 x11-20020a056a00270b00b00636c4bd7c8bsm1789913pfv.43.2023.05.09.06.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 06:54:10 -0700 (PDT)
Date: Tue, 9 May 2023 06:54:09 -0700
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, maz@kernel.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v3 4/4] kvm: Enable dirty ring for arm64
Message-ID: <ZFpQgbiyOq2Eu82I@x1n>
References: <20230509022122.20888-1-gshan@redhat.com>
 <20230509022122.20888-5-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230509022122.20888-5-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: bdSFstRiDQJa

On Tue, May 09, 2023 at 12:21:22PM +1000, Gavin Shan wrote:
> arm64 has different capability from x86 to enable the dirty ring, which
> is KVM_CAP_DIRTY_LOG_RING_ACQ_REL. Besides, arm64 also needs the backup
> bitmap extension (KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP) when 'kvm-arm-gicv3'
> or 'arm-its-kvm' device is enabled. Here the extension is always enabled
> and the unnecessary overhead to do the last stage of dirty log synchronization
> when those two devices aren't used is introduced, but the overhead should
> be very small and acceptable. The benefit is cover future cases where those
> two devices are used without modifying the code.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

