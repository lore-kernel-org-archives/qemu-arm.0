Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C3FCD4F25
	for <qemu-arm@archiver.kernel.org>; Thu, 14 May 2026 07:18:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNQJn-0002Tr-UB; Thu, 14 May 2026 03:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1wNQJB-0001wR-C6
 for qemu-arm@nongnu.org; Thu, 14 May 2026 03:16:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1wNQJ9-0003oG-N1
 for qemu-arm@nongnu.org; Thu, 14 May 2026 03:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778742994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iekTm6FKwIvOgjoopbl+3q1XoHFuzjgR3Bg4RZyQ+W8=;
 b=XOqs8wef9AqRTSSpr0ZSipIMfF1fnEvpbYQIELX0Vy1JfD49KWicJ99NnBbwBoCxOtN00H
 Qkvfzmb+bA7qL02Tv0jZnt/SWQTPiX8GYs43DhrHsOxax08gucABLl0ZdKfeCBPzvQ3Mw7
 xtzXG0blm/vFhQImePE4KtRCWksgUwM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-jxW7uIGzOHi_-QchLXEQeQ-1; Thu, 14 May 2026 03:16:33 -0400
X-MC-Unique: jxW7uIGzOHi_-QchLXEQeQ-1
X-Mimecast-MFC-AGG-ID: jxW7uIGzOHi_-QchLXEQeQ_1778742992
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2b2ecc96a9aso79557695ad.1
 for <qemu-arm@nongnu.org>; Thu, 14 May 2026 00:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778742992; x=1779347792;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2n5PKXMMa6HQJPVXHT479++rs5e+4Rx88zJ/sKc9nb4=;
 b=PUCAEXvWBK4X+rzrYlsZtLcNUioNu234h2GGmbQmDLj4LJcFPVHRDzXzGXpUNbNkzg
 spKuCGIXYOJMUCgHuGkXlKny07Cn7ASvsm3lw4j+4N01VZ+HKxvHtguk+1rorZYHiNSB
 pU9GpeEm04IjeoIqAMHJXWZuxNlHs4P6Q9By9QnY8ve9AuixhHtBTwlSI34sbGkKJUFb
 uRsosL/UWTCvf2cBoT+3EDl6IKX/TVY186fVlzn3p2DFm4uBtcE3+0MFxcCbZdqqvzuC
 FEaqZFdhNv3gwWqCTzYsMkUFpOHKcsBdQYxKaoxy3uwHxum54wCymRizvutpv9EdTGOl
 i2mg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9CNiv3FJhB6FLa3LwhTqX3iFfCM2rclE/cN89A876VJCNDVeRfsAPNCaAIt3k7MaZHBHI+nFW+Ug==@nongnu.org
X-Gm-Message-State: AOJu0YzhDnvpMO5BNnxGmh1kMtR7xIbFBpnevHtXXhYsQ5Vs6JCZhqLX
 475WaiageZi/4dUxS5gRgaSIJhtC2GMaR6RAgyu7XLzB5wLR8jlRGbtr/VRNWWk5zPwxR3yQg3S
 u+WXjcg2dHpC6G2JP+WkG9r5dVLDVft15fpmZP9XI0JCYkaG7ziXYag==
X-Gm-Gg: Acq92OFPSQdp3qt9VBigYeIGnn7oaV90+bW94VkNPbE6CcWSgE+AL+KQ0zPIUpxHtoN
 zi1aKaiMbX1gv2PS9Am34Cr/6ZbkoRPJgCRBQ60ZaPGWvZBQBrYA97IhlJyag6J0y3WhpQDIPw4
 ejFYVEIGbM52AdWepP0sUkTfvKVUm+cSP6I065ajSD6erwmJ7QYE/ahEO2EqbZ4cQ7kAdjjJKip
 vR8jootp8aoRL8+xTOxTFG/1ArmjZNpYP0z0VLY0UMyI5EdkI4ToPQIW/eGzkBa/ZWpjFhQ0RyX
 5VbIOCmJqTaNOQt2xDPwbYKG0PDaC1eI2q1JVQvxgJ2ny/2QxzbSnlnT83SJJXLkYCk5rprj3wW
 U9zzR/vMjYtYzbHKIfTmbAZKqMKlGPuM8NFfaoX4yc4zQKsyJ/xaIQ6y/kz2KsX8uFO8zpoAygm
 8=
X-Received: by 2002:a05:6a20:3945:b0:398:b95c:51f7 with SMTP id
 adf61e73a8af0-3af82c8f5f2mr7700477637.37.1778742991804; 
 Thu, 14 May 2026 00:16:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:3945:b0:398:b95c:51f7 with SMTP id
 adf61e73a8af0-3af82c8f5f2mr7700402637.37.1778742991054; 
 Thu, 14 May 2026 00:16:31 -0700 (PDT)
Received: from smtpclient.apple ([122.163.114.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82bb116832sm1300137a12.24.2026.05.14.00.16.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 May 2026 00:16:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v2 02/21] x86: q35: add 'wdat' property
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <agSRsqaRsGBBwewT@intel.com>
Date: Thu, 14 May 2026 12:46:14 +0530
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 philmd@linaro.org, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
Message-Id: <6743DA13-4C1D-47D2-ADE6-C87A2A073F28@redhat.com>
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-3-imammedo@redhat.com> <agSRsqaRsGBBwewT@intel.com>
To: Zhao Liu <zhao1.liu@intel.com>
X-Mailer: Apple Mail (2.3864.500.181)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ltk4fwlnvWr99UxMlvWNoQBp8u_W3LQH4Atsp1_BhRE_1778742992
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
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



> On 13 May 2026, at 8:28=E2=80=AFPM, Zhao Liu <zhao1.liu@intel.com> wrote:
>=20
> On Tue, Mar 03, 2026 at 10:25:13AM +0100, Igor Mammedov wrote:
>> Date: Tue,  3 Mar 2026 10:25:13 +0100
>> From: Igor Mammedov <imammedo@redhat.com>
>> Subject: [PATCH v2 02/21] x86: q35: add 'wdat' property
>>=20
>> Used for enabling WDAT based watchdog for builtin iTCO watchdog.
>> Usage:
>>    -M q35,wdat=3D{on|off}
>> By default it is disabled.
>>=20
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>> ---
>> include/hw/i386/pc.h |  1 +
>> hw/i386/pc_q35.c     | 18 ++++++++++++++++++
>> 2 files changed, 19 insertions(+)
>=20
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>



