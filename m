Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DBDF01826
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 11:16:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyTA0-00030d-ON; Fri, 06 Mar 2026 06:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vyT9x-0002vD-55
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:15:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vyT9v-000704-OK
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772795754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qo3kIthpbu86oqvhJHhcBYejXdkDE3R4zfUK2Kn/520=;
 b=Zg4Pr/Hn7tAhZT0+iB9II/ZbKS3mjYhaTQG0tgWVOL1pw7i9fOne99xeUQitw9bdqTjy3s
 6hx+bXZxYt3lm4nHJ43XoiBfO9qrEO1t8J3flHg8cJUJrt4Y4R7EhdT2lNld4N5OzsDeiS
 RiEQRL3Je7WFDfwNVStzqs++U6X0HUg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-2TGU8JDVPPmXZItZvXb7tQ-1; Fri, 06 Mar 2026 06:15:53 -0500
X-MC-Unique: 2TGU8JDVPPmXZItZvXb7tQ-1
X-Mimecast-MFC-AGG-ID: 2TGU8JDVPPmXZItZvXb7tQ_1772795752
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48069a43217so91272345e9.1
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 03:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772795752; x=1773400552;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qo3kIthpbu86oqvhJHhcBYejXdkDE3R4zfUK2Kn/520=;
 b=t9j/xqUXphB28+Fb9Xqg2lgC094yN2vszBG3zvNK+XHDgwxmSvHWGNuFxPrK/L7k33
 ugci9X30+4YTJ2PMwjP9jo7T0QRqDAUvHrKLIYSllGw+D8DOR2iRYJc70Jz3J4TE6ORL
 HFt5SK2hW7RlVa7QiKnd8Iq7kTSBnE6WqHV3khTb63mlDmgLF2Z7B/1WhPCO++77ouce
 rC5CkjKm6rdeT7f4opyh53tX6A7poOJ5NC76lSEx5YdLgXifQwmiIs7TvebGovoqqtPP
 u8jJiZvD1J/k6S3c3GfqRbAejFDd91lXEye+b+zQvjGlDV3rcIR2OrgUm+3izYlb0hSj
 y6mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFrYUEge6kVMsnn6eOqMAu7qjNxh2EmpogSYTXp38wKIVOe3uJey0GhwYz1au/vLX6ksCPQea8fg==@nongnu.org
X-Gm-Message-State: AOJu0Yyhyoqr381pSV4QMZN9oRtlWJmN/Xu4cbP9TcRFnSflHN8xC3yh
 TlpGulGtPzqp9icrg45PawTdTnhKrazwOCPHJfSyON6AaF4aAlVYPrbgRhY3YxyDeFw/IO2Y9BI
 K/NNcrDoFisJZCse/tLGSNtE3C+d4MpQbse6dxKdWwse20NCEZX/Eqw==
X-Gm-Gg: ATEYQzyg9fVr7rliPz2SOyzcq0amIf5skdTzD65U5+wk8svFf6Td+h6WWgi7HwqP5eS
 /vsZIJIlqh1uS8v7mgv/h06+t13c1LlIBM1gJQOUU3B/GXvluWbQ57uwS3+n0A3z06O/O2RFhIC
 PsVGUhTljCDnfD7DbVbrLX8olNqDKT4yhfW4mJTyX5kMJMaRP+68/vQc5oAWd/iX9Z6ZRG6+Nl6
 UEkQUcxbl1BmqWBnG7eriS55Fxj9EMKieL7bA57l/dzF1OK9zxDz+LeSxhZsj+d0AxIL1hk/PHa
 9TbcKcJOPeKgOQgqk8xyhotYq1yBc5Bnko3mN/NcWNDOfTZ5ecK/cwaf33sgu95/FT3HQvBDjZT
 N11fkMmj7IH+lRoX2pr42p4QeDHzDOTGjGmG+qKX2czoz75qg6nTMEt7hooorb0mJyO64
X-Received: by 2002:a05:600c:3488:b0:47a:81b7:9a20 with SMTP id
 5b1f17b1804b1-48526923bc7mr26113445e9.9.1772795752219; 
 Fri, 06 Mar 2026 03:15:52 -0800 (PST)
X-Received: by 2002:a05:600c:3488:b0:47a:81b7:9a20 with SMTP id
 5b1f17b1804b1-48526923bc7mr26112845e9.9.1772795751835; 
 Fri, 06 Mar 2026 03:15:51 -0800 (PST)
Received: from rh (p200300f6af4a490003d6f56739ca055c.dip0.t-ipconnect.de.
 [2003:f6:af4a:4900:3d6:f567:39ca:55c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276b0adasm27151425e9.10.2026.03.06.03.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 03:15:51 -0800 (PST)
Date: Fri, 6 Mar 2026 12:15:50 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, peterx@redhat.com, 
 philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v8 6/6] Revert "target/arm: Reinstate bogus AArch32
 DBGDTRTX register for migration compat"
In-Reply-To: <20260304102249.1963784-7-eric.auger@redhat.com>
Message-ID: <4c2ed24a-039f-4312-0512-209f446deead@redhat.com>
References: <20260304102249.1963784-1-eric.auger@redhat.com>
 <20260304102249.1963784-7-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kdXr6jGMQ--OB_ImsJX8OzE8YkIEIOdLl6lBjMf3YEs_1772795752
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.892, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.622,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, 4 Mar 2026, Eric Auger wrote:
> This reverts commit 4f2b82f60431 ("target/arm: Reinstate bogus AArch32
> DBGDTRTX register for migration compat). We don't need that commit
> anymore as the AArch32 DBGDTRTX register is declared to
> be safe to ignore in the incoming migration stream.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


