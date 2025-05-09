Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp932020njb;
        Fri, 9 May 2025 00:58:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvflvVouOitBKuH4wl8YbCJxPQRWpalsqLEqxv3OumLdiLLPRa+K5Vifv44uj+9aFX5lDOBb2sQvK4Gg==@linaro.org
X-Google-Smtp-Source: AGHT+IEZE7Za4ZxkiM9+jfRcklB1IBqLnvEfPQhSVoRWwCPLzT0CSXrFQUN8uoIgXTsu/NxUz0Z+
X-Received: by 2002:a05:6214:2523:b0:6e8:9797:f94e with SMTP id 6a1803df08f44-6f6e482d215mr36702636d6.35.1746777538911;
        Fri, 09 May 2025 00:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746777538; cv=none;
        d=google.com; s=arc-20240605;
        b=Z/KSTGBnxS1XAF6i6pjf/MYXkuMgNJuOlHSVk7xHQqPO7Oxb2VVA5mz0Awjm3JNArP
         wXjCdA1n2DR8xJmFDbjpo2z5ectmsIhEf9wnJcXpQ4wBjJ1nJ0qrd5yPN/Ny/Fxw/h4f
         nuuPQuwynBBGZuyFxpkSJLiKTkTuFc3B2CkFvTnXXpDlIo6hCgOHkEiXg2t4nRS8bo6S
         g4cczwzJQ2ic0N0ju1vgdV4BRBJF0d6h+CTxgHKvdQLL+eEzkeOV4x4pBCixityyFYvT
         Mtw7ZINsxYz5JzaZt5xZ0EsyiM+Ez2Zisk+eTIhCP31hgRTyjV0m31RYyPfI96nF/ktV
         AdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=vQfp4IFIUpthTPLR+BS4+ZYLuthka+pOKyGFxvVmD1s=;
        fh=xrEBPRyUXWmK4wLXq3V9+9mEusjYi61dk2jjiT6BXTI=;
        b=OFmXoXjaaLl41mMvDILnOL7tfRKrGO9NEh9j8a9WaUpJ6UmGLJYKc4r4hzmTfB/upt
         oRynkQW0vi7efj0azIe2da3jd75N9NmEImbw3HlVj3ZMg9tOaVOekygmlTtO52zrCrD5
         FkfHbwyd/QEXwO6iigD1DoauS/rLOwmAezW87YNzJ4jILd4QwvfOtpYxpzdAZX6OXdUL
         3AmrQ8EhO7sk1BQJboPhugNHGhDGJCxKl9F30lGG0KidYeEO1BMVDhdF1Q6Bt0t58PCi
         ctyV2Dp4xEpJgyb70iQg4FXP+lSlxTlUvbjkoCDqLlFOp4DzvOc69GnqoPiSRPo3n4a3
         7lPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EpnPepIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a649casi17457636d6.497.2025.05.09.00.58.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 00:58:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EpnPepIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDIcZ-0006T9-Ra; Fri, 09 May 2025 03:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1uDIcN-0006IU-6A
 for qemu-arm@nongnu.org; Fri, 09 May 2025 03:58:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1uDIcL-00006Q-J0
 for qemu-arm@nongnu.org; Fri, 09 May 2025 03:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746777479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vQfp4IFIUpthTPLR+BS4+ZYLuthka+pOKyGFxvVmD1s=;
 b=EpnPepIuVSbOeW/0hgsrS8O5+uFwuDmNYMuAQe9LSasvl+uix7oxRkqXzdj0Os58SUS8Ce
 29lKGMHly5FX88/GYKE0dPSGm5OEJTd5YWWi0sfWE8gnGVNs42Cdlnlz916mKajYMKsgZW
 xkCVo8ye+h4eHkVxhrQL+Fb1TMFkwmE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-Y6e1ouCJP_qcUyd2_YOi4A-1; Fri,
 09 May 2025 03:57:54 -0400
X-MC-Unique: Y6e1ouCJP_qcUyd2_YOi4A-1
X-Mimecast-MFC-AGG-ID: Y6e1ouCJP_qcUyd2_YOi4A_1746777472
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8C8051800878; Fri,  9 May 2025 07:57:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.27])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3F2041955F24; Fri,  9 May 2025 07:57:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C312D21E66C3; Fri, 09 May 2025 09:57:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Donald Dutile <ddutile@redhat.com>,  Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,  Markus Armbruster
 <armbru@redhat.com>,  Shameer Kolothum via <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,  "eric.auger@redhat.com"
 <eric.auger@redhat.com>,  "jgg@nvidia.com" <jgg@nvidia.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,  "berrange@redhat.com"
 <berrange@redhat.com>,  "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,  "smostafa@google.com"
 <smostafa@google.com>,  Linuxarm <linuxarm@huawei.com>,  "Wangzhou (B)"
 <wangzhou1@hisilicon.com>,  jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
In-Reply-To: <CAFEAcA9bZ6Rd4PSMG61mJ5Ja07j3--DQE7KqA8RZwxGH3N51sA@mail.gmail.com>
 (Peter Maydell's message of "Thu, 8 May 2025 14:57:32 +0100")
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
 <877c2ut0zk.fsf@pond.sub.org>
 <e02e884b-0f3d-4426-8a67-2cbd23e80e8c@redhat.com>
 <87frhglwjl.fsf@pond.sub.org>
 <72f9043a73294bfc9b539ae9b94836d3@huawei.com>
 <d21e0c57-b89a-4c79-958e-e633de039e4c@redhat.com>
 <CAFEAcA9bZ6Rd4PSMG61mJ5Ja07j3--DQE7KqA8RZwxGH3N51sA@mail.gmail.com>
Date: Fri, 09 May 2025 09:57:47 +0200
Message-ID: <87ldr68bd0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rjpo35IGH39x

Peter Maydell <peter.maydell@linaro.org> writes:

> The problem here seems to me to be that in the hardware we're
> modelling the SMMU always exists, because it's in the SoC,
> but you're trying to arrange for it to be created on the
> command line, via -device.
>
> We don't have any of these problems with the current 'virt'
> board code, because we have the board code create the iommu
> (if the user asks for it via the iommu machine property),
> and it can wire it up to the PCI root complex as needed.

So what is the motivation for creating it with -device?

