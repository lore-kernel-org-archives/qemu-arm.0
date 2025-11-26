Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298A0D1039B
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Nov 2025 16:30:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOIOi-0006oC-Rp; Wed, 26 Nov 2025 11:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vOIOg-0006m1-Vp
 for qemu-arm@nongnu.org; Wed, 26 Nov 2025 11:29:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vOIOf-0005ag-Gz
 for qemu-arm@nongnu.org; Wed, 26 Nov 2025 11:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764174576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hWcxZlvjjD0z1Ag5RJX1c6gU55Egabutbxi2aRboQGY=;
 b=S0c0Kd5nKsO2QjIOzh1kSO5Qkeu1FaKaxwfpux1bPIX7UY0QpPzfMW7UOUoyrrN4Oobag2
 AiOA/hCM0A2EukFFPHdCeJ6REIPWsH7ui4PbpyYQTUzUFO13o+WPE5kUVdbbd/9B1Um7TQ
 udzjEcoef487og8YSppYtY+/p6XnL9g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-1_r649tINUanr-qpzPWwzQ-1; Wed, 26 Nov 2025 11:29:33 -0500
X-MC-Unique: 1_r649tINUanr-qpzPWwzQ-1
X-Mimecast-MFC-AGG-ID: 1_r649tINUanr-qpzPWwzQ_1764174572
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4788112ec09so13687015e9.3
 for <qemu-arm@nongnu.org>; Wed, 26 Nov 2025 08:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764174572; x=1764779372;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hWcxZlvjjD0z1Ag5RJX1c6gU55Egabutbxi2aRboQGY=;
 b=oaHs3OG10I9b5ZnQTb9EEkwoTwX/UxxUsins6CK1yXn9pD1lFp555pjKRhyke6yXjT
 vp23IKMWiMi0QtVyJXm/x5YZ/SX/zQcFu8BTepG1ImN34sIeWLYU6+evcz95gYTQ4DOD
 aVdfY9UhxIyM2u3KuRmL9Q5T6ePmOKksMtdPQg2LjQ7plNBbbCJISLyZEe5nHDarHPsm
 InRG8777TEqxCKYqxg2gouZ9KxAjiYtkZeBBLOr8RNLNxXAneU5LBLqW8uuZgtoOG/C5
 tgj/ESWEapjOVM3+OZZ5+xzHeHN/rVPmQzqgBViff0O4Q1q2/Pu6RlpeblXUZ1bMMf1B
 PJiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTWd6sqIWgehNd/94LbLbPLnwufLN+SwAhSPQKcE7/+Ppq+8MNWZv4M1HoikBxjbl1gTmmS9KpNg==@nongnu.org
X-Gm-Message-State: AOJu0Yxo17u+2KsepHbpkPPVBIJ68vjx7fwZiPriBit/dbscGEnUZ6id
 vZ6yQdLcCh2mmJKAJP2NZJSTY5Ej4iu6rQQMte2/m8HDVxEUDhV25JTMIcjBEY5r+jP9kCqH7pv
 e2/RpWHkJaDMoN3vhSZEyiSPjuArwwk0ZTYf8ZRbhrpCPDksbbl60nA==
X-Gm-Gg: ASbGncu/nO0GX6dI8xrEhTsBqcndyEQy3DjIBUqmLj3XjdwHKMrli5NBDUC6qGFe3SX
 jJndx97NkzngKbquX0HyTcywY0ShKLsyI+D4sv6JUi2Xecb7tBRjntE/MnnRWBOMBBLG+HMxvBO
 aJYeIxcX9t9RWWTGl26F4b4Q/CKB5NRGS7koL0iqTKh1EoZCap22VJKuMLgTpX1eQLpF2V6N0Th
 B2K2nnQmkVVUCVkWxU2zRf2Y4ifqPZBBy8HYptnsjiXyfhKmgja/RPLuiCzZH9GNI8EDUNO6eZl
 hInu3Y0uG4WEQj0hKOO6sG+rdK0Gpcvbbbugl80n4CbbIMfMHm7Hl/ypcWLDMdpMsheCXvzX5Ij
 UCxV/UvMMjo9OvDKN9XEWyutlcVwM57G0T5q7qtvZjGWXvmE8svGTA6ufqg==
X-Received: by 2002:a05:600c:4694:b0:46e:4246:c90d with SMTP id
 5b1f17b1804b1-47904ad06f3mr70147975e9.11.1764174572038; 
 Wed, 26 Nov 2025 08:29:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdJO78nrqxp+K03Ey3F8Uregtf1SH4+s/E4pFl24ODFF4QhUNka3V0lANpPBILLmwGcPAr3A==
X-Received: by 2002:a05:600c:4694:b0:46e:4246:c90d with SMTP id
 5b1f17b1804b1-47904ad06f3mr70147755e9.11.1764174571698; 
 Wed, 26 Nov 2025 08:29:31 -0800 (PST)
Received: from rh (p200300f6af35a800883b071bf1f3e4b6.dip0.t-ipconnect.de.
 [2003:f6:af35:a800:883b:71b:f1f3:e4b6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adc6220sm54029395e9.2.2025.11.26.08.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 08:29:31 -0800 (PST)
Date: Wed, 26 Nov 2025 17:29:30 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, maz@kernel.org, 
 oliver.upton@linux.dev, gshan@redhat.com, ddutile@redhat.com, 
 peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 01/11] hw/arm/virt: Rename arm_virtio_compat into
 arm_virt_compat_defaults
In-Reply-To: <20251125100859.506228-2-eric.auger@redhat.com>
Message-ID: <f0a96d9b-3a35-e6a5-ed68-9de886623ffd@redhat.com>
References: <20251125100859.506228-1-eric.auger@redhat.com>
 <20251125100859.506228-2-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: txiMBBNoe06dPEMnYo1CH4BdZ46e6pEix7Tomp3BXlM_1764174572
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 25 Nov 2025, Eric Auger wrote:
> Renaming arm_virtio_compat into arm_virt_compat_defaults
> makes more obvious that those compats apply to all machine
> types by default, if not overriden for specific ones. This also
> matches the terminology used for pc-q35.
>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


