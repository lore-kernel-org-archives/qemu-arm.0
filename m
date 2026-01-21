Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB7DD46942
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 14:55:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viZWR-00089E-Fl; Wed, 21 Jan 2026 09:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1viZWI-0007xb-Oy
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 09:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1viZWH-0005BA-EN
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 09:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769006956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FLa0kkFrKbYh7alYxl6Kcao/LKAMMi8l8jUkHIgd37w=;
 b=IQxH2AESktEUchfn0SplDl63RohJPPEFgZjkfCxDEn8haSnM/v5NMu25WROtGpAkoEfUhJ
 Ifnm1cyzw5eqwysn+WQu6H6CK92bASbSsv2fa9zVRK1cvbnqXZR9/l8H05HdfO9PXDxA2o
 iutQZBlV0dX7l/YjLrWxi8BxLZTInWo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-0O9rjVMBODW4KBo2fSbMXw-1; Wed, 21 Jan 2026 09:49:14 -0500
X-MC-Unique: 0O9rjVMBODW4KBo2fSbMXw-1
X-Mimecast-MFC-AGG-ID: 0O9rjVMBODW4KBo2fSbMXw_1769006953
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477c49f273fso60448315e9.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 06:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769006953; x=1769611753;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FLa0kkFrKbYh7alYxl6Kcao/LKAMMi8l8jUkHIgd37w=;
 b=o6DifwPBjH8lmQoOcNVgOia9LWNktxAJK/b4Eczzui+7u0E2QMpf4OrwC9Xvn/TZDp
 iKVMEVcIlUHQW6iIfFL1R9+XQgXxudqbuU4MbgZNb2tPW9gbzCxYSVMQOYvs/8gzzrde
 sSELwgs8VRNuUqdcklw1Fu7kQdyPOz3kniydaMVPxIODb7BudbajLHYLrHGzvhX5z5bY
 PPgCVcN3U/gYXDKZ7bYs3jtU7vJ4WHUZco//0fPf5oOC7iC1GrqNHClXckzBqMxRaWGx
 TcfUuO33qnmRdfkP/7NgHc3zFjphvzbXi/NA59my808C8hwwH7RKnej8/yZX5PxQd4jT
 6Sbw==
X-Gm-Message-State: AOJu0Ywh9L3eOA3fLk5OXzFagQIAZkkS7n6tghgEl/KOVvXcqLZALOOP
 ySNNyc+24BNcq+gcCu/UmIUsclVUK8uWAEOU9Cycvb6v85cK8G3YwRyRsYWAZ2uVCHyfVxoCCyI
 epJ/PTfwkYBBVPIfDXvIjJeLttl5x+RKYQ9dWnc03i2C3JWiej8enrw==
X-Gm-Gg: AZuq6aIIfCItOfo1IVNCpDgdTbuhhDJVYa7EHmHSNhuAotPGyxEZDt2CA736Ipwnu1R
 lpD+rJlaRnXTkyvZ072cHDC4ZWRqpgUqoy5U/dOfspqigCRqGhD0QgcQmkHheq4WngOL8BknvXn
 hDMdeohaKsdlDk4P51OaznxsbMtX2QnS2yqKglp+ZZpZ+do88JfoxYDV9yZK7YgSk05ckMOXHY+
 /YpphAtY0ZHS5ah1dg4VHfhTuMouINGSGRgvkPnZwy01ZPuGQQuWD45KwBoUJBTrDhEl5ua3OO7
 ZPesWuOnFPm3VdhyeC+PsXWPzU++j/xU02m/AOSxzl4UM9pEQkQsuljG8K91GFrYi4BI92WciXO
 NPFg9/SQq1AM8K4HyvLiIG3lKSIRZWSsfsWBqL33hI7ZSCEjNcpJKUscRukc=
X-Received: by 2002:a05:600c:a00f:b0:480:3b4e:41b8 with SMTP id
 5b1f17b1804b1-4803b4e42e2mr112453745e9.33.1769006953465; 
 Wed, 21 Jan 2026 06:49:13 -0800 (PST)
X-Received: by 2002:a05:600c:a00f:b0:480:3b4e:41b8 with SMTP id
 5b1f17b1804b1-4803b4e42e2mr112453565e9.33.1769006953116; 
 Wed, 21 Jan 2026 06:49:13 -0800 (PST)
Received: from rh (p200300f6af31d00062ddfb9151537832.dip0.t-ipconnect.de.
 [2003:f6:af31:d000:62dd:fb91:5153:7832])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e8795f1sm320263365e9.6.2026.01.21.06.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 06:49:12 -0800 (PST)
Date: Wed, 21 Jan 2026 15:49:11 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 2/2] arm: add DCZID_EL0 to idregs array
In-Reply-To: <20260105154119.59853-3-cohuck@redhat.com>
Message-ID: <6757a74e-a0b9-7ef9-bf16-b9dbb3012096@redhat.com>
References: <20260105154119.59853-1-cohuck@redhat.com>
 <20260105154119.59853-3-cohuck@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: InJW76wOS9Tiy0m-JDWVB92s8hw4wf-5fPpXiNRv4z0_1769006953
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.069,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Mon, 5 Jan 2026, Cornelia Huck wrote:
> Continue moving ID registers to the idregs array, so that we
> eventually can switch to an autogenerated cpu-sysregs.h.inc.
>
> This requires a bit of care, since we still have to handle the EL
> specific part (DCZID_EL0.DZP). The value previously saved in
> cpu->dcz_blocksize is now kept in DCZID_EL.BS (transparent to
> callers using the wrappers.)
>
> KVM currently does not support DCZID_EL0 via ONE_REG, assert that
> we're not trying to do anything with it until it does.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


