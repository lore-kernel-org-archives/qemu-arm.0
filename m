Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50322F01826
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 10:56:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vySqb-0000j0-91; Fri, 06 Mar 2026 05:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vySqZ-0000iJ-Bl
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 05:55:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vySqX-0000LR-SB
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 05:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772794553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZLk9U3cnn9WXVQRPdQEQwYgcUewFMNjqG4kY0PtkobY=;
 b=BWyaBmiHdc2ybQ2f9Letyztbw6e1nLxWDBn/rSTofKawy/gMj78J0+5IQv7xLlrYlCOANX
 TRMR7XeNKkKTpLvI2IL2Nh32Wjs9JsCtakSJeLQ2Pml/cZsN/cYvSrWfDNN1jYYG03mS+8
 FBa1ivcbSER9SpmPzroxO+91HyuNm+U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-QrZDKr54N323bLB6or6peQ-1; Fri, 06 Mar 2026 05:55:51 -0500
X-MC-Unique: QrZDKr54N323bLB6or6peQ-1
X-Mimecast-MFC-AGG-ID: QrZDKr54N323bLB6or6peQ_1772794551
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-439b3b408f9so4975573f8f.0
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 02:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772794551; x=1773399351;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZLk9U3cnn9WXVQRPdQEQwYgcUewFMNjqG4kY0PtkobY=;
 b=t7A0lfDSvdG6UroJ6jj8SDWgp/H3Sijf8UkRjUXr2EqlSaNRw5El/AlHAYM615IWk6
 0NndEmK5+qYtxLtCvZxVHEDy1dJv0Az6mcwsXxGq4y6laJe9bpqkN/LyUqn3K6AbFtgn
 +wnPbZ3JhGKnseoM7Kc3cpAqHWbn2m+jqWFgyo7FTHwzn8Bc0DY/T1fb3+nLLkao4gbz
 c8UYY0It7AuXIsNHqX5BBU2YBkAfpfZy6SiKDcPDnY072z6YnvyQAvHSssB5gDlJGVcq
 4G1/WBDG0FSV6ArOPEnB+edw6nC73zvk+a5n6Yu56ZfFNThoSOJe0lXuoc35g+pCiIQt
 CafA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt3FOk3JIuvbnx4IOxUoSfsNFCENhHXLt3GWqp+nhh0BbtLbVZYwIuoe3q2eMUpyn5swEVUq4jFg==@nongnu.org
X-Gm-Message-State: AOJu0YyBFZY8cIx0t0N6kdKxcwm3dNBlAHpCGX5N2Gx1Tr/+gjQdrmRE
 nJeTONXMzq+FlbTfN0MNkPRxISgyf6/kG82RWIrlvDfPnIK9AqUVGVKdbTEmfrn4Xeylj4JVNAF
 z5+wDCZQN6jRsijFcMsDkKy7XehoN+Q3+p08DYcYh9QFq8GRwOHxDBQ==
X-Gm-Gg: ATEYQzx724v4eyNbl3zDXiYaNKRmflgYwfIJvKysyd28ArOeqdfrMGPYTKvSBGAogbJ
 tOoCqivv8uXA5wwfHE+b533el8mKzna9FuwF21jPaWRaARbL4wrhuTRpQjIEEj2wzK5PCNNa/y8
 pHhAf0R7skZofiNnHXHAUx1iKcuZJAjZyN7BMrbMEk+JJsiD5wNjIxHjYUcWnNVjc28QrCzHbif
 CuPDxpubNSvhbzd9+Zej7fJFdiATZIDZmSMfp5BZVbO3fsGQANpdgofPqnGP1dRofrCkzQvcDyg
 aDVoREe1Uck9rcJ2fvCPHx/96NHOzpQFqIUssteYgVNhEM86nmcFjVWovEZpG+A70vyy8HkFHhg
 MesVMqSyGRW1YPi4kksBoYhaPcTeljIlzYrft+Vn+FMq+yZ7/Yf3Vl4ZjYDHrJWku1HNc
X-Received: by 2002:a05:6000:612:b0:439:be3e:52fe with SMTP id
 ffacd0b85a97d-439da35cbe7mr2896821f8f.26.1772794550691; 
 Fri, 06 Mar 2026 02:55:50 -0800 (PST)
X-Received: by 2002:a05:6000:612:b0:439:be3e:52fe with SMTP id
 ffacd0b85a97d-439da35cbe7mr2896782f8f.26.1772794550276; 
 Fri, 06 Mar 2026 02:55:50 -0800 (PST)
Received: from rh (p200300f6af4a490003d6f56739ca055c.dip0.t-ipconnect.de.
 [2003:f6:af4a:4900:3d6:f567:39ca:55c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8d968sm2789308f8f.6.2026.03.06.02.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 02:55:49 -0800 (PST)
Date: Fri, 6 Mar 2026 11:55:48 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, peterx@redhat.com, 
 philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v8 4/6] target/arm/cpu64: Define cpreg migration tolerance
 for KVM_REG_ARM_VENDOR_HYP_BMAP_2
In-Reply-To: <20260304102249.1963784-5-eric.auger@redhat.com>
Message-ID: <1c804bd6-7a54-53db-15fc-1c7a0865e157@redhat.com>
References: <20260304102249.1963784-1-eric.auger@redhat.com>
 <20260304102249.1963784-5-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pY5HVPhRK2t6CNHd6ECQ3M7atjSjOp5G3g2PedJrxfA_1772794551
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> KVM_REG_ARM_VENDOR_HYP_BMAP_2 pseudo FW register is exposed
> from v6.15 onwards. Backward migration from a >= v6.15 to an older
> kernel would fail without cpreg migration tolerance definition
> for this register.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


