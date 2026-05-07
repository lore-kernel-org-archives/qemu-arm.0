Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD6ECD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 11:03:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKwVs-0005Ai-CO; Thu, 07 May 2026 07:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1wKwVm-0005AE-Jr
 for qemu-arm@nongnu.org; Thu, 07 May 2026 07:03:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1wKwVk-0003qv-FG
 for qemu-arm@nongnu.org; Thu, 07 May 2026 07:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778151798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYrAMlHX47YSOPiGSbLAq62RGAWlOvY02a0IhouBuXE=;
 b=HVpUKX+vcjg86RJwcRMIs0+VRcKAyKDH4m347UAMXs35dBiu6iNUH449GECQ9xBJbU46+j
 slCpwuF6voY1aWoIr5LmHBBEYa7YIZWv4eqp6aRnIOpeC9js5uix3uBDGSPe6re2hLNW4l
 CbMMh5fgF01SfgDj3pKT+AMGWBSRoAk=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-df6OUvNJNhKp_CB1kr2bSQ-1; Thu, 07 May 2026 07:03:15 -0400
X-MC-Unique: df6OUvNJNhKp_CB1kr2bSQ-1
X-Mimecast-MFC-AGG-ID: df6OUvNJNhKp_CB1kr2bSQ_1778151795
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b6097ca315bso1084807a12.3
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 04:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778151795; x=1778756595;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dJBcgVPA9/WP7hs51QbhMs6flx0KjCGwmiWfAVLc7cs=;
 b=Mp84FKPmshJcZ9VQbUcHlWzXJWcD7uqBUCxHTxS0YK+f/is8KDdfk2+gJdwFFqDUvQ
 SRIhvkvkhICxujCqNYtSpEGJ5WBC1nyjqD3M00HfX7IQi1SRIAeTQoaku9vkFfRVnwpH
 spJ9oGvzWbUDW7EoKTCsd4BoRtpLLvqTBi8AohzhzZFE37U+U/HDprFZhAJmcC6LrE3i
 jMi9BhpJ60/0UXQqgNelFMIiRg2XEO2wLGta/p5hJ3w+iadFZMlw1CnAMAqmh1GikPx9
 qECRw81Mrhb1r9jkLDNCMcULHXIG5QMAwJuHHpmy0WRfpPLHh1COuIuLx1sEwyaFj5y+
 TMuA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/sPrVk89mOKonZnhenYYZVad0xAhot41/284MKP+D8vttNy4JXP/w1V3xZpYH5TfFzVrHkpSlI7w==@nongnu.org
X-Gm-Message-State: AOJu0YwPK0sMb9rOZzoU0ytWWhFGdQ0lso9d0XQnDRqzcESfPV9tqSUT
 v9J//9bSes7x1cCem5Aolkyu+gdB6ecgcl6QD8hKqd4ercHgTMh9xlh0njyLS4+Kx3QAMIn+JOg
 LXB6ZmpftGNHc0jeknqXfod+E+L9+90QR54WBp1k8Cl4gxTb939DXTQ==
X-Gm-Gg: AeBDievipyhmzRi6oS9S1q2wvdRgxTgvuAUAjY4MUSYLozpKRjx9H3Yont16epA7JhQ
 vLvsPFCPowErQDn8S5GZ/8MjTGGGxe6R3JH6RYIAdojGsZRxwoDeduuLakMomY7diY2wOoPTjcZ
 8LvnmK8XJsnn0w0Ih2BPxiCE2rSNvoIEP7XZREncVNde1PTez98ROFS8uLumfpZHNd3PWgi+dTt
 rAIwT5oDVI0tRAZVrOG4Mqt7lK/QQk1JubjlPJxYw0pRFyounl1RaJZypdmhi3EJYYcJFvnH/GS
 vLb936uGW6+n8fZi2TDdjczRpZpIpgqYWqofAmkOYli7s+iP0L+DLispCb2kMdJatA8/fKIbiVm
 BiURYTtExxW2REKgMhvgiLVfGcpg5E8D6OTPMuAVg2D0fpDC6Hac6UCUPJIfgBAdeLicUCQ1+FX
 dzMKnb5MLDTm7aTAlT+2GR
X-Received: by 2002:a05:6a00:cc1:b0:82f:9e98:1356 with SMTP id
 d2e1a72fcca58-83a5c4bdb96mr7650327b3a.20.1778151794786; 
 Thu, 07 May 2026 04:03:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc1:b0:82f:9e98:1356 with SMTP id
 d2e1a72fcca58-83a5c4bdb96mr7650306b3a.20.1778151794335; 
 Thu, 07 May 2026 04:03:14 -0700 (PDT)
Received: from smtpclient.apple ([122.163.114.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-839679c8634sm10338515b3a.39.2026.05.07.04.03.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2026 04:03:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v2] whpx: i386, arm: do partition reset on boot CPU reset
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <94C6AAAA-BF20-4202-9965-081192A392A2@unpredictable.fr>
Date: Thu, 7 May 2026 16:32:57 +0530
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <8F3BC33B-9884-41EC-8E81-9E0C80A396F3@redhat.com>
References: <20260421205749.55060-1-mohamed@unpredictable.fr>
 <a8cb94f0-9970-40b8-912b-3ab81a5907f4@linaro.org>
 <94C6AAAA-BF20-4202-9965-081192A392A2@unpredictable.fr>
To: Mohamed Mediouni <mohamed@unpredictable.fr>
X-Mailer: Apple Mail (2.3864.500.181)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZBk2nrufHXuj6r7ZX8bxWvPI8YMuLayqiwWtirxj4YU_1778151795
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



> On 22 Apr 2026, at 6:38=E2=80=AFPM, Mohamed Mediouni <mohamed@unpredictab=
le.fr> wrote:
>=20
>=20
>=20
>> On 22. Apr 2026, at 14:46, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>>=20
>> +Ani
>>=20
>> On 21/4/26 22:57, Mohamed Mediouni wrote:
>>> WHvResetPartition resets partition state, and is not supported on Windo=
ws 10.
>>> On Arm, it's supposed to be used for reboots. The prior location of the
>>> WHvResetPartition call wasn't right, as other vCPUs might still have
>>> been running, causing the call to fail.
>>=20
>> Is it very different from the conceptual step introduced in commit
>> 4003e5e65fe ("hw/accel: add a per-accelerator callback to change
>> VM accelerator handle")?
>=20
> Hello,
>=20
> The difference is that we reset the partition state but don=E2=80=99t hav=
e to=20
> re-do any of the memory mappings in the Hyper-V case (or otherwise tear
> down the context).
>=20
> We could fallback outright into the CoCo case which would work too.

The rebuild_vm() callback is used only when the vcpus are not resettable (s=
o Coco case). If vcpus are resettable (non-CoCo), then that callback won=E2=
=80=99t be called. Within the callback, you can do whatever you need to do.=
=20



