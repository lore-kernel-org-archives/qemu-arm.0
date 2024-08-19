Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp2011112njf;
        Mon, 19 Aug 2024 03:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNeY9EeHgKsUX9E1qiLob7u5s+rsTKeUX7N2ANkBjx186A4kOt80uJbExgkhBr61Vt7hxf+r+hLiFYwgU3O+GQiIr1iLcW
X-Google-Smtp-Source: AGHT+IE0ZS2nom1DWU+0I/5cMDJO5CvSrO0NKx3K2fLF4dbNLiF8hqzECY2XUHCy6Dfs3wgmqBVH
X-Received: by 2002:a05:6358:9045:b0:1ad:424:ae4 with SMTP id e5c5f4694b2df-1b393145524mr1444902555d.2.1724062061910;
        Mon, 19 Aug 2024 03:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724062061; cv=none;
        d=google.com; s=arc-20160816;
        b=e7+PCsmlVJNRyPtBhASYnXrSGHic4qNcpx+YYFXYLw6YsYbvQsCnGUZyfxTYfVnfJC
         dxopQSfGuO6MqvVpXCT2dz72HnNX/D7SqQa6qYINZkeIZ4BbMKWOBv4wrUUoWXGW48sM
         TpzDAUUzrFe7wcxEOrQsjUyDUcfJ/hDqJ4Unbq+xvl3buUCp7OmqR2rCLjRujI4Xuv4L
         8dwKhrPcBGhJsgMeznfLwnFVO+G2wJiQ/EGaszz813AzJ1DupHn2uYSbjRpmfOwhn3hR
         xpxEaVWYUScFF2tl9BaBNSVedY60H3PAn0GeW/EOsn2nEgRaNfIbNt3eNgOSvbrCXOgj
         DIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Ej+tM7S2A4ZUJqPfxKVO1cQbCHOqPsimMQhZdGPgPLw=;
        fh=FPV0vkFXPQYCVOngvlWKpF9lDjgsI/KbIA1HW0H1XAk=;
        b=G4k4KouWrGmq5S6nhebYamUpBqAxG+87gKg7gpbg6ToHpYYmv6kaMWAe5lkm6DJ+ZO
         ML6kjHelQ+Pf3H8dTbrHAFhYoKYiXnJw8kGekgCi9dr7arB/2hB1uZJX0wu0JrKz0shK
         /wuUW8cITkyYMO5jvdXHqKSosBCeRxlDxU9B53eJgzMEtGPI2C33CyF+cLS6KgKfyjYV
         QzgNTw2Qw36l4aEHscGLdVgH0zXG44KxueII41KjZdT0DVUuKvKpmiXcODWIlzzXFiDF
         4+Un64GWqxFc7DMto75dDAQ4Doyd6RuL4pAmK52angREQ1HnAWwsszVBagaXIxf5g8kJ
         EkPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gw7u4W/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a4ff0b8a3asi1129710185a.362.2024.08.19.03.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2024 03:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gw7u4W/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sfzIQ-0002Wa-VG; Mon, 19 Aug 2024 06:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sfzIM-0002VW-Rt
 for qemu-arm@nongnu.org; Mon, 19 Aug 2024 06:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sfzIL-0002RO-88
 for qemu-arm@nongnu.org; Mon, 19 Aug 2024 06:07:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724062043;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ej+tM7S2A4ZUJqPfxKVO1cQbCHOqPsimMQhZdGPgPLw=;
 b=gw7u4W/nTk5q2EqQ3FiQQo0saBef1bByt8KGEETAoIv19bXs7AFosUMME6s2PwYGy3CwhD
 CsNua0vhlXEjsQuHAuhnmTz9R36l6FzEHhuxLl4cQSy4GJEhYAqSaP/dJz6i/f3OSeNCye
 a+ky2srMs+V5CiBuk07tJhGSRnqhSII=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-4K720zMEM5CbG7IfFTov2Q-1; Mon, 19 Aug 2024 06:07:20 -0400
X-MC-Unique: 4K720zMEM5CbG7IfFTov2Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-44ffce7ed6aso52124231cf.3
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2024 03:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724062040; x=1724666840;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ej+tM7S2A4ZUJqPfxKVO1cQbCHOqPsimMQhZdGPgPLw=;
 b=DcoZ9CWcXmyj5BTbjXToB1lpIUzeHJ054q15vfJkMJ/61XS7avG+KZUi/w1yMJEd0B
 MPqw2HY9F/vRxMraYcq+GzA52vJbgXr/NNkVyXAIJXBWmQJib0l0ooLoqDddmSFpVBJf
 P3++6SeKBApujIE+m5GScilw/k59oc7Lr3H10kozlwRyXOblcbNeupsbhIVuqHzdlV5+
 +x1ngbkFGgLFIF5c5pvD+ykkDTTNi33yxzKsdbLOzC4cGlTSlX4NuNoE11fW7u1MgR8k
 3e0Z2RpnZRqovOlswsGSMlAYm5ertG44D1IQG0MSpfN3ZqIgGOSTvvyvVQcgg9L7llJV
 iVJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEo1lKfBJFUXwlOYpzp2jPrzJfcmlHu0avtnx4LneHG55yykBMMM65jpFafvMXjvGl3RI8OoLbmWPHcH8h/8zQME2m
X-Gm-Message-State: AOJu0YwfyYrmQJ7dklBgnty2p6T/kyXpv7h/JvyFIDYBx5KxXhnVvsLZ
 HRTdpmsH7RwMcdf7AVegO2WeFMQf/0TNym2p63hKYzNdTcE7NTd6EzadukO6DA++4D7i7K3Zc4g
 lOxlVM5olccTPN4XvAyvt/r4+lg6pFiktRilxLCGegecvD+zJDg==
X-Received: by 2002:a05:622a:907:b0:454:b115:f73 with SMTP id
 d75a77b69052e-454b1151275mr96281081cf.45.1724062040334; 
 Mon, 19 Aug 2024 03:07:20 -0700 (PDT)
X-Received: by 2002:a05:622a:907:b0:454:b115:f73 with SMTP id
 d75a77b69052e-454b1151275mr96280941cf.45.1724062040015; 
 Mon, 19 Aug 2024 03:07:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4536a04e66bsm39111691cf.73.2024.08.19.03.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 03:07:19 -0700 (PDT)
Message-ID: <c4959246-89fd-4541-b2aa-797a5c2bd70a@redhat.com>
Date: Mon, 19 Aug 2024 12:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hw/arm: Enable 'nested' SMMU in virt, sbsa-ref
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20240816161350.3706332-1-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240816161350.3706332-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: egLtQ2Pzlh8F

Hi Peter,

On 8/16/24 18:13, Peter Maydell wrote:
> This patchset enables support for nested (two stage) translations
> in the SMMU in the virt and sbsa-ref boards.
>
> Patch 1 is Cornelia's compat-machine machinery patch, which we
> need to make this change only happen for virt-9.2 and later;
> patch 2 is a trivial "missing comment update" change; patches
> 3 and 4 are the board changes.
>
> Enabling nested support should be transparent to guests, which
> will only enable stage 2 if they actually want it.
>
> thanks
> -- PMM

For the whole series:

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

>
> Cornelia Huck (1):
>   hw: add compat machines for 9.2
>
> Peter Maydell (3):
>   hw/arm/smmuv3: Update comment documenting "stage" property
>   hw/arm/virt: Default to two-stage SMMU from virt-9.2
>   hw/arm/sbsa-ref: Use two-stage SMMU
>
>  include/hw/arm/virt.h      |  1 +
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  hw/arm/sbsa-ref.c          |  1 +
>  hw/arm/smmuv3.c            |  1 +
>  hw/arm/virt.c              | 19 +++++++++++++++++--
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 15 ++++++++++++---
>  hw/i386/pc_q35.c           | 13 +++++++++++--
>  hw/m68k/virt.c             | 11 +++++++++--
>  hw/ppc/spapr.c             | 17 ++++++++++++++---
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  13 files changed, 91 insertions(+), 13 deletions(-)
>

